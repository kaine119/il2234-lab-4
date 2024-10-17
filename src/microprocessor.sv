module microprocessor #(
    parameter int M, // regfile address width
    parameter int N, // register width (also data mem word width, data mem address width)
    parameter int P  // instruction address width (also PC width)
) (
    input logic clk,    // Clock
    input logic rst_n,  // Asynchronous reset active low

    // Data memory connections
    output logic         data_mem_read_en,
    output logic [N-1:0] data_mem_address,
    output logic         data_mem_write_en,
    output logic [N-1:0] data_mem_write_data,
    input  logic [N-1:0] data_mem_read_data,

    // Instruction memory connections
    output logic               instr_read_en,
    output logic [P-1:0]       instr_read_addr,
    input  logic [(4+2*M)-1:0] instr_data
);

    // Regfile connections
    logic [M-1:0] rf_read_address_a;
    logic [M-1:0] rf_read_address_b;
    logic         rf_read_destination_select_a; // 0 for ALU, 1 for memory write data
    logic         rf_read_destination_select_b; // 0 for ALU, 1 for memory write addr
    logic [M-1:0] rf_write_address;
    logic         rf_write_en;
    logic [1:0]   rf_write_source_select;       // 0 for ALU, 1 for memory, 2 for instr_data_op2
    logic [N-1:0] rf_immediate_value;

    logic [N-1:0] rf_write_data_a; 
    logic [N-1:0] rf_write_data_b; 
    logic [N-1:0] rf_write_data_c; 

    logic [N-1:0] rf_read_data_0a; // output port 0
    logic [N-1:0] rf_read_data_0b;
    logic [N-1:0] rf_read_data_1a; // output port 1
    logic [N-1:0] rf_read_data_1b;

    // ALU connections
    logic [2:0]   alu_opcode;
    logic         alu_sync_reset;
    logic         alu_en;
    logic [2:0]   alu_onz;

    logic [N-1:0] alu_a;
    logic [N-1:0] alu_b;
    logic [N-1:0] alu_output;

    // PC overflow
    logic pc_overflow_warn;

    ALU #(.N(N)) alu (
        .clk       (clk),
        .reset     (rst_n),
        .sync_reset(alu_sync_reset),
        .enable    (alu_en),
        .A         (alu_a),
        .B         (alu_b),
        .OP_Code   (alu_opcode),
        .ONZ       (alu_onz),
        .Outputs   (alu_output)
    );

    RF #(.N(N), .addressBits(M)) regfile (
        .rst_n             (rst_n),
        .clk               (clk),
        .readAddressA      (rf_read_address_a),
        .readAddressB      (rf_read_address_b),
        .selectDestinationA(rf_read_destination_select_a),
        .selectDestinationB(rf_read_destination_select_b),
        .destination1A     (rf_read_data_0a),
        .destination1B     (rf_read_data_0b),
        .destination2A     (rf_read_data_1a),
        .destination2B     (rf_read_data_1b),
        .write_en          (rf_write_en),
        .writeAddress      (rf_write_address),
        .selectSource      (rf_write_source_select),
        .A                 (rf_write_data_a),
        .B                 (rf_write_data_b),
        .C                 (rf_write_data_c)
    );

    instruction_fsm #(.M(M), .N(N), .P(P)) fsm (
        .clk                         (clk),
        .rst_n                       (rst_n),
        
        .instr_data                  (instr_data),
        .instr_read_en               (instr_read_en),
        .instr_read_addr             (instr_read_addr),
        .pc_overflow_warn            (pc_overflow_warn),
        
        .alu_en                      (alu_en),
        .alu_onz                     (alu_onz),
        .alu_opcode                  (alu_opcode),
        .alu_sync_reset              (alu_sync_reset),
        
        .data_read_en                (data_mem_read_en),
        .data_write_en               (data_mem_write_en),
        
        .rf_read_address_a           (rf_read_address_a),
        .rf_read_address_b           (rf_read_address_b),
        .rf_read_destination_select_a(rf_read_destination_select_a),
        .rf_read_destination_select_b(rf_read_destination_select_b),
        .rf_write_en                 (rf_write_en),
        .rf_write_address            (rf_write_address),
        .rf_write_source_select      (rf_write_source_select),
        .rf_immediate_value          (rf_immediate_value)
    );

    // Internal connections between regfile, alu and data memory
    assign rf_write_data_a = alu_output;
    assign rf_write_data_b = data_mem_read_data;
    assign rf_write_data_c = rf_immediate_value;

    assign alu_a               = rf_read_data_0a;
    assign alu_b               = rf_read_data_0b;
    assign data_mem_write_data = rf_read_data_1a;
    assign data_mem_address    = rf_read_data_1b;

endmodule : microprocessor