`include "../instructions.sv"


module fake_rom #(
    parameter WIDTH = 10,
    parameter DEPTH = 64
) (
    input  wire         clka,
    input  wire         ena,
    input  wire [$clog2(DEPTH)-1 : 0] addra,
    output wire [WIDTH-1 : 0] douta
);

    logic [$clog2(DEPTH)-1 : 0][WIDTH-1 : 0] rom_contents = {
        {(DEPTH-5){ NOP, 6'h0 }},
        {LOAD, 3'h5, 3'h0},
        {STORE, 3'h3, 3'h0},
        {ADD, 3'h3, 3'h4},
        {LOAD_IM, 3'h3, 3'b001},
        {LOAD_IM, 3'h4, 3'h001}
    };

    logic [WIDTH-1 : 0] data_out;
    assign douta = ena ? data_out : 0;

    always_ff @(posedge clka) begin : proc_data_out
        data_out <= rom_contents[addra];
    end

endmodule : fake_rom