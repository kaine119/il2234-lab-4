module fake_memory #(
    parameter int WIDTH,
    parameter int DEPTH
) (
    input logic clk,
    input logic rst_n,
    input logic read_en,
    input logic [$clog2(DEPTH)-1 : 0] read_addr,
    output logic [WIDTH-1 : 0] read_data,

    input logic write_en,
    input logic [$clog2(DEPTH)-1:0] write_addr,
    input logic [WIDTH-1 : 0] write_data
);

    logic [DEPTH-1 : 0][WIDTH-1 : 0] regfile_data;

    logic [WIDTH-1 : 0] data_out;
    logic [WIDTH-1 : 0] data_out_next;

    always_ff @(posedge clk or negedge rst_n) begin : proc_regfileData
        if (~rst_n) begin
            regfile_data <= 0;
        end else if (write_en == 1) begin
            regfile_data[write_addr] <= write_data;
        end
    end

    assign read_data = read_en ? data_out : 0;

    always_ff @(posedge clk or negedge rst_n) begin : proc_data_out
        if(~rst_n) begin
            data_out <= 0;
        end else begin
            data_out <= regfile_data[read_addr];
        end
    end

endmodule : fake_memory