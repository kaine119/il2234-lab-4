module urbana_top #(
    // Frequency to run CPU at.
    parameter int CLOCK_FREQUENCY = 5
) (
    input CLK_100MHZ,

    input logic [3:0] BTN,

    output logic [7:0] D0_SEG,
    output logic [3:0] D0_AN,
    output logic [7:0] D1_SEG,
    output logic [3:0] D1_AN
);
    parameter int M = 3; // regfile address width
    parameter int N = 8; // register width (also data mem word width, data mem address width)
    parameter int P = 6; // instruction address width (also PC width)

    logic         data_mem_read_en;
    logic [N-1:0] data_mem_address;
    logic         data_mem_write_en;
    logic [N-1:0] data_mem_read_data;
    logic [N-1:0] data_mem_write_data;

    logic               instr_read_en;
    logic [P-1:0]       instr_read_addr;
    logic [(4+2*M)-1:0] instr_data;

    clock_divider #(
        .DIVISOR(100_000_000 / CLOCK_FREQUENCY)
    ) clock_divider_0 (
        .rst_n  (rst_n),
        .clk_in (CLK_100MHZ),
        .clk_out(clk)
    );

    microprocessor #(.M(M), .N(N), .P(P)) mpu (
        .clk                (clk),
        .rst_n              (rst_n),
        .data_mem_address   (data_mem_address),
        .data_mem_read_en   (data_mem_read_en),
        .data_mem_read_data (data_mem_read_data),
        .data_mem_write_en  (data_mem_write_en),
        .data_mem_write_data(data_mem_write_data),
        .instr_data         (instr_data),
        .instr_read_en      (instr_read_en),
        .instr_read_addr    (instr_read_addr)
    );

    assign rst_n = ~BTN[3];

    // Port A is the write port, port B is the read port
    // Width = N, Depth = 2^N
    data_sram data_mem (
      .clka (clk),  
      .ena  (data_mem_write_en),  
      .wea  (data_mem_write_en),  
      .addra(data_mem_address),
      .dina (data_mem_write_data), 

      .clkb (clk),  
      .enb  (data_mem_read_en),  
      .addrb(data_mem_address),
      .doutb(data_mem_read_data) 
    );

    // Width = 4 + 2*M, Depth = 2^P
    instruction_rom instr_mem (
      .clka (clk),              // input wire clka
      .ena  (instr_read_en),
      .addra(instr_read_addr),  // input wire [5 : 0] addra
      .douta(instr_data)        // output wire [9 : 0] douta
    );

    logic [15:0] instr_to_display;
    assign instr_to_display = {
        4'h0,
        instr_data[9 : 6],
        1'b0,
        instr_data[5 : 3],
        1'b0,
        instr_data[2 : 0]
    };

    // 7-seg driver to display currently read instruction
    kw4281_driver_hex instruction_disp_driver (
        .rst_n    (1),
        .clk      (CLK_100MHZ),
        .input_hex(instr_to_display),
        .an       (D0_AN),
        .seg      (D0_SEG[6:0])
    );

    logic [15:0] memory_to_display;
    assign memory_to_display = data_mem_write_en
                                ? data_mem_write_data
                                : data_mem_read_en
                                    ? data_mem_read_data
                                    : 0;

    // 7-seg driver to display currently read/written memory data
    kw4281_driver_hex memory_disp_driver (
        .rst_n    (1),
        .clk      (CLK_100MHZ),
        .input_hex(memory_to_display),
        .an       (D1_AN),
        .seg      (D1_SEG[6:0])
    );
    
    // logic [15:0] pc_to_display;
    // assign pc_to_display = {
    //     10'b0,
    //     instr_read_addr
    // };

    // // 7-seg driver to display currently read/written memory data
    // kw4281_driver_hex pc_disp_driver (
    //     .rst_n    (1),
    //     .clk      (CLK_100MHZ),
    //     .input_hex(pc_to_display),
    //     .an       (D1_AN),
    //     .seg      (D1_SEG[6:0])
    // );

endmodule