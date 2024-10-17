module RF #(parameter N, parameter addressBits) ( 
    /* --------------------------------- Inputs --------------------------------- */
    input logic clk,
    input logic rst_n,
    input logic selectDestinationA,
    input logic selectDestinationB,
    
    input logic [1:0] selectSource,
    input logic [addressBits-1:0] writeAddress,
    input logic write_en,
    // If we're going the other way around
    // (i.e. we have size of regfile, not number of address bits),
    // can use $clog2(x) (= ceil(log2(x))) 
    input logic [addressBits-1:0] readAddressA,
    input logic [addressBits-1:0] readAddressB,

    input logic [N-1:0] A, 
    input logic [N-1:0] B, 
    input logic [N-1:0] C, 
    /* --------------------------------- Outputs -------------------------------- */
    output logic [N-1:0] destination1A,
    output logic [N-1:0] destination2A,
    output logic [N-1:0] destination1B,
    output logic [N-1:0] destination2B
);
    
    logic [N-1:0] writeData;
    logic [(2**addressBits)-1:0][N-1:0] regfileData;
    logic [N-1:0] readDataA;
    logic [N-1:0] readDataB;
    
    // Write source select
    always_comb begin : proc_writeSource
        case (selectSource)
            0: writeData = A;
            1: writeData = B;
            2: writeData = C;        
            default: writeData = A;
        endcase
    end

    // On clock or async-reset edges, write corresponding data to regfile data.
    always_ff @(posedge clk or negedge rst_n) begin : proc_regfileData
        if (~rst_n) begin
            regfileData <= 0;
        end else if (write_en == 1) begin
            regfileData[writeAddress] <= writeData;
        end
    end

    // Configure read ports
    always_comb begin : proc_readDataA
        case (readAddressA)
            0: readDataA = 0;
            1: readDataA = {(N){1'b1}};
            default: readDataA = regfileData[readAddressA];
        endcase
    end

    always_comb begin : proc_readDataB
        case (readAddressB)
            0: readDataB = 0;
            1: readDataB = {(N){1'b1}};
            default: readDataB = regfileData[readAddressB];
        endcase
    end

    assign destination1A = selectDestinationA == 0 ? readDataA : 0;
    assign destination2A = selectDestinationA == 1 ? readDataA : 0; 
    assign destination1B = selectDestinationB == 0 ? readDataB : 0; 
    assign destination2B = selectDestinationB == 1 ? readDataB : 0;

endmodule
