module microprocessor_tb ();

    logic clk;
    logic rst_n;  // Asynchronous reset active low
    
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

    microprocessor #(.M(M), .N(N), .P(P)) mpu (
        .clk                (clk),
        .rst_n              (rst_n),
        .instr_read_en      (instr_read_en),
        .instr_read_addr    (instr_read_addr),
        .instr_data         (instr_data),
        .data_mem_address   (data_mem_address),
        .data_mem_read_en   (data_mem_read_en),
        .data_mem_read_data (data_mem_read_data),
        .data_mem_write_en  (data_mem_write_en),
        .data_mem_write_data(data_mem_write_data)
    );

    fake_rom #(.WIDTH(10),.DEPTH(64)) instr_rom (
        .clka (clk),
        .ena  (instr_read_en),
        .addra(instr_read_addr),
        .douta(instr_data)
    );

    fake_memory #(.WIDTH(N), .DEPTH(256)) data_mem (
        .clk     (clk),
        .read_en   (data_mem_read_en),
        .read_addr (data_mem_address),
        .read_data (data_mem_read_data),
        .write_en  (data_mem_write_en),
        .write_addr(data_mem_address),
        .write_data(data_mem_write_data)
    );

    initial begin
        forever begin
            clk = ~clk;
            #10ns;
        end
    end

    initial begin
        clk = 0;
        rst_n = 0;
        @(posedge clk);
        rst_n = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $stop;
    end



endmodule : microprocessor_tb