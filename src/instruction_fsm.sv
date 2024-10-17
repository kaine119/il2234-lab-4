`include "../instructions.sv"

module instruction_fsm #(
    parameter int M, // regfile address width
    parameter int N, // regfile word width
    parameter int P  // instruction address width (also PC width)
) (
    input clk,    // Clock
    input rst_n,  // Asynchronous reset active low
    
    // Regfile connections
    output logic [M-1:0] rf_read_address_a,
    output logic [M-1:0] rf_read_address_b,
    output logic         rf_read_destination_select_a, // 0 for ALU, 1 for memory write data
    output logic         rf_read_destination_select_b, // 0 for ALU, 1 for memory write addr
    output logic [M-1:0] rf_write_address,
    output logic         rf_write_en,
    output logic [1:0]   rf_write_source_select,       // 0 for ALU, 1 for memory, 2 for instr_data_op2
    output logic [N-1:0] rf_immediate_value,

    // ALU connections
    output logic [2:0]   alu_opcode,
    output logic         alu_sync_reset,
    output logic         alu_en,
    input  logic [2:0]   alu_onz,

    // Instruction memory connections
    input  logic [(4+2*M)-1:0] instr_data,
    output logic               instr_read_en,
    output logic [P-1:0]       instr_read_addr,

    // Data memory connections
    output logic data_read_en,
    output logic data_write_en,

    // PC overflow
    output logic pc_overflow_warn
);

    typedef enum logic [1:0] {s_idle, s_fetch, s_decode, s_execute} cycle_state_t;
    cycle_state_t state, next_state;
    logic [P-1:0] pc;
    logic [P-1:0] pc_next;
    logic pc_overflow;
    logic pc_overflow_next;

    // Decompose the instruction data.
    logic [3:0] instr_data_opcode;
    logic [M-1:0] instr_data_opA;
    logic [M-1:0] instr_data_opB;
    logic [2*M-1:0] instr_data_offset;

    assign instr_data_opcode = instr_data[(4+2*M)-1 : (2*M)];
    assign instr_data_opA    = instr_data[    2*M-1 : M];
    assign instr_data_opB    = instr_data[      M-1 : 0];
    assign instr_data_offset = instr_data[    2*M-1 : 0]; // Only used for BRN; opA and opB combined as new address

    /*====================================
    =            State update            =
    ====================================*/
    always_ff @(posedge clk or negedge rst_n) begin : proc_state
        if (~rst_n) begin
            state <= s_idle;
        end else begin
            state <= next_state;
        end
    end

    always_comb begin : proc_next_state
        next_state = s_idle;
        if (state == s_idle) begin
            if (pc_overflow) next_state = s_idle;
            else next_state = s_fetch;
        end 
        else if (state == s_fetch) 
            next_state = s_decode;
        else if (state == s_decode) 
            next_state = s_execute;
        else if (state == s_execute) begin
            if (pc_overflow_next) next_state = s_idle;
            else next_state = s_fetch;
        end
    end

    /*========================================================
    =            PC increment / overflow handling            =
    ========================================================*/
    
    always_ff @(posedge clk or negedge rst_n) begin : proc_pc
        if (~rst_n) begin
            pc <= 0;
            pc_overflow <= 0;
        end else begin
            pc <= pc_next;
            pc_overflow <= pc_overflow_next;
        end
    end

    always_comb begin : proc_update_pc
        pc_next = pc;
        pc_overflow_next = pc_overflow;
        if (state == s_execute) begin
            {pc_overflow_next, pc_next} = pc + 1;
            case (instr_data_opcode)
                BRN_O: begin
                    if (alu_onz[2]) begin
                        {pc_overflow_next, pc_next} = (instr_data_offset[2*M-1]) 
                        ? pc - instr_data_offset[ (2*M-2) : 0] 
                        : pc + instr_data_offset[ (2*M-2) : 0];  
                    end
                end
                BRN_N: begin
                    if (alu_onz[1]) begin
                        {pc_overflow_next, pc_next} = (instr_data_offset[2*M-1]) 
                        ? pc - instr_data_offset[(2*M-2):0] 
                        : pc + instr_data_offset[(2*M-2):0];  
                    end
                end
                BRN_Z:
                    if (alu_onz[0]) begin
                        {pc_overflow_next, pc_next} = (instr_data_offset[2*M-1]) 
                        ? pc - instr_data_offset[(2*M-2):0] 
                        : pc + instr_data_offset[(2*M-2):0];  
                    end
                BRN: begin
                    {pc_overflow_next, pc_next} = (instr_data_offset[2*M-1]) 
                    ? pc - instr_data_offset[(2*M-2):0] 
                    : pc + instr_data_offset[(2*M-2):0];  
                end
                default: {pc_overflow_next, pc_next} = pc + 1;
            endcase
        end
    end

    assign pc_overflow_warn = pc_overflow;

    
    /*======================================================================
    =            Combinatorial output logic for datapath routing           =
    =======================================================================*/
    
    // FIXME: the logic doesn't ever really touch the instruction memory connections, right?
    // Arguably we don't even need to register instr_data, since PC only *actually* gets
    // updated when we cycle back to s_fetch (or sit in s_idle).
    assign instr_read_addr = pc;
    assign instr_read_en = 1'b1;

    always_comb begin : proc_data_memory_datapath
        data_read_en = 0;
        data_write_en = 0;

        if (state == s_decode || state == s_execute) begin
            case (instr_data_opcode)
                LOAD: begin
                    data_read_en = 1;
                end

                STORE: begin
                    data_write_en = 1;
                end

                default: begin
                    data_read_en = 0;
                    data_write_en = 0;
                end
            endcase
        end
    end

    always_comb begin : proc_regfile_datapath
        rf_read_address_a = 0;
        rf_read_address_b = 0;
        rf_read_destination_select_a = 0;
        rf_read_destination_select_b = 0;
        rf_write_address = 0;
        rf_write_en = 0;
        rf_write_source_select = 0;
        rf_immediate_value = 0;

        if (state == s_decode) begin
            case (instr_data_opcode)
                // All arithmetic instructions. 
                // NOP can be seen as "RA <= RA"; one of the ALU operations is output RA,
                // and we only ever write to RA.
                ADD, SUB, AND, OR, XOR, INC, MOV, NOP: begin
                    // Read reg addresses given in instruction, output to ALU
                    rf_read_address_a = instr_data_opA;
                    rf_read_address_b = instr_data_opB;
                    rf_read_destination_select_a = 1'b0;
                    rf_read_destination_select_b = 1'b0;

                    // Only perform the write on the next clock, when ALU finishes
                    // executing the operation.
                end

                LOAD: begin
                    // Read RB to data memory read address
                    // RA won't matter, data memory should ignore write data
                    rf_read_address_a = instr_data_opA; // don't actually care
                    rf_read_address_b = instr_data_opB;
                    rf_read_destination_select_a = 1'b1; // don't actually care
                    rf_read_destination_select_b = 1'b1;

                    // Write to RA, from memory
                    rf_write_address = instr_data_opA;
                    rf_write_source_select = 2'h1;
                    rf_write_en = 1'b1;
                end

                STORE: begin
                    // Read RA to data memory write data,
                    //      RB to data memory write address
                    rf_read_address_a = instr_data_opA;
                    rf_read_address_b = instr_data_opB;
                    rf_read_destination_select_a = 1'b1;
                    rf_read_destination_select_b = 1'b1;

                    // Don't write to regfile
                    rf_write_en = 1'b0;
                end

                LOAD_IM: begin
                    // Don't need to read
                    
                    // Write immediate data (opB interpreted literally) to RA
                    rf_write_address = instr_data_opA;
                    rf_write_source_select = 2'h2;
                    rf_immediate_value = { {(N-M){instr_data_opB[M-1]}}, instr_data_opB };
                    rf_write_en = 1'b1;
                end

                default : 
                begin
                    rf_read_address_a = 0;
                    rf_read_address_b = 0;
                    rf_read_destination_select_a = 0;
                    rf_read_destination_select_b = 0;
                    rf_write_address = 0;
                    rf_write_en = 0;
                    rf_write_source_select = 0;
                    rf_immediate_value = 0;
                end
            endcase
        end else if (state == s_execute) begin
            case (instr_data_opcode)
                ADD, SUB, AND, OR, XOR, INC, MOV, NOP: begin
                    // Write to RA, from ALU
                    rf_write_address = instr_data_opA;
                    rf_write_source_select = 2'h0;
                    rf_write_en = 1'b1;
                end
                LOAD: begin
                    // Read RB to data memory read address
                    // RA won't matter, data memory should ignore write data
                    rf_read_address_a = instr_data_opA; // don't actually care
                    rf_read_address_b = instr_data_opB;
                    rf_read_destination_select_a = 1'b1; // don't actually care
                    rf_read_destination_select_b = 1'b1;

                    // Write to RA, from memory
                    rf_write_address = instr_data_opA;
                    rf_write_source_select = 2'h1;
                    rf_write_en = 1'b1;
                end
                STORE: begin
                    // Read RA to data memory write data,
                    //      RB to data memory write address
                    rf_read_address_a = instr_data_opA;
                    rf_read_address_b = instr_data_opB;
                    rf_read_destination_select_a = 1'b1;
                    rf_read_destination_select_b = 1'b1;

                    // Don't write to regfile
                    rf_write_en = 1'b0;
                end
                default: begin
                    rf_read_address_a = 0;
                    rf_read_address_b = 0;
                    rf_read_destination_select_a = 0;
                    rf_read_destination_select_b = 0;
                    rf_write_address = 0;
                    rf_write_en = 0;
                    rf_write_source_select = 0;
                    rf_immediate_value = 0;
                end
            endcase
        end
    end

    /*============================================
    =            Handle ALU registers            =
    ============================================*/
    

    always_comb begin : proc_alu_datapath
        alu_opcode = 0;
        alu_sync_reset = 0;
        alu_en = 0;

        if (state == s_decode) begin
            case (instr_data_opcode)
                ADD, SUB, AND, OR, XOR, INC, MOV, NOP:  begin
                    alu_en = 1'b1;
                    alu_opcode = instr_data_opcode[2:0];
                end
                BRN, BRN_N, BRN_O, BRN_Z: begin
                    alu_sync_reset = 1'b1;
                end
                default: begin
                    alu_opcode = 0;
                    alu_sync_reset = 0;
                    alu_en = 0;
                end
            endcase
        end
    end
    
endmodule : instruction_fsm