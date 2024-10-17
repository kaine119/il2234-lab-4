module half_adder (
 input a,b,
 output c_out, s
);
 assign s = a^b;
 assign c_out = a&b;
endmodule

module full_adder (
 input a,b,c_in,
 output c_out, s
);
 logic s1,c1,c2;
 half_adder ha1(a,b,c1,s1);
 half_adder ha2(s1,c_in,c2,s);
 assign c_out = c1|c2;
endmodule


module adder_subtractor #(parameter N) (
  input logic [N-1:0] A,
  input logic [N-1:0] B,
  input logic Cin,
  output logic [N:0] Sum
);
  logic [N-1:0] C;
  genvar j;
  generate
  for (j=0; j<=N-1; j=j+1)begin
    assign C[j]=B[j]^Cin;
  end
  endgenerate
  logic [ N:0] tempA, tempC, sum_temp;
  logic [N+1:0] carry_temp;
  assign carry_temp[0] = Cin;
  assign tempA = {A[N-1],A};
  assign tempC = {C[N-1],C};
  genvar i;
  generate
  for (i=0; i<=N; i=i+1)
  begin
    full_adder fa_0(tempA[i],tempC[i],carry_temp[i],carry_temp[i+1],sum_temp[i]);
  end
  endgenerate
  assign Sum = sum_temp;
endmodule


module ALU #(parameter N)(
    input  logic [2:0] OP_Code ,
    input  logic [N-1:0] A,B,
    input logic clk,
    input logic reset,
    input logic sync_reset,
    input logic enable,
    output logic [N-1:0] Outputs ,
    output logic  [2:0] ONZ 
  );

logic [ N:0] result;
logic [ N:0] adder_result;

logic [N-1:0] B_temp;

logic Cin;
adder_subtractor #(N) add (A,B_temp,Cin,adder_result);
always_comb
  begin
    case (OP_Code)
      3'b000  :
      begin
        B_temp = B;
        Cin=0;
        result=adder_result;
      end
      3'b001  :
      begin
        B_temp = ~B;
        Cin=1;
        result=adder_result;
      end
      3'b010 :
        result = {1'b0,A & B};
      3'b011  :
        result = {1'b0,A | B};
      3'b100  :
        result = {1'b0,A ^ B};
      3'b101  :
      begin
        B_temp = 1;
        Cin=0;
        result=adder_result;
      end
      3'b110  :
        result = {1'b0,B};
      3'b111  :
        result = {1'b0,A};
      default :
        result = 0;
      endcase
    end

    always_ff @(posedge clk or negedge reset) begin
    if (!reset)
       Outputs<=0;
    else
       Outputs<=result[N-1:0];
    end

  logic  [2:0] ONZ_temp;

always_comb begin
  begin

  // if ( result > {2'b0, { (N-1){1'b1} } } || result < ({ 2'b1, {(N-1){1'b0}} }) )
  if(result[N]!=result[N-1])
    ONZ_temp[2]=1;
  else
    ONZ_temp[2]=0;
  
  if(result[N-1]==1)
    ONZ_temp[1]=1;
  else
    ONZ_temp[1]=0;

  if(result==0)
    ONZ_temp[0]=1;
  else
    ONZ_temp[0]=0;
  end
end

    always_ff @(posedge clk or negedge reset) begin
    if (!reset || sync_reset)
       ONZ<=0;
    else if(enable)
       ONZ<=ONZ_temp;
    end

endmodule