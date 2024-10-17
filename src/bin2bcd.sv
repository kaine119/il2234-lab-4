module bin2bcd (
    input logic [3:0] number,
    output logic [3:0] bcd,
    output logic carry
);

logic [3:0] binary;

logic [3:0] bcd_temp;
logic [3:0] carry_temp;

always_comb begin
    if (number[3] == 0) begin
        binary = number;
    end else begin
        binary = ~(number[3:0]) + 1;
    end

    case (binary)
        4'b0000: begin
            bcd_temp = 4'b0000;
            carry_temp = 0;
        end

        4'b0001: begin
            bcd_temp = 4'b0001;
            carry_temp = 0;
        end

        4'b0010: begin
            bcd_temp = 4'b0010;
            carry_temp = 0;
        end

        4'b0011: begin
            bcd_temp = 4'b0011;
            carry_temp = 0;
        end

        4'b0100: begin
            bcd_temp = 4'b0100;
            carry_temp = 0;
        end

        4'b0101: begin
            bcd_temp = 4'b0101;
            carry_temp = 0;
        end

        4'b0110: begin
            bcd_temp = 4'b0110;
            carry_temp = 0;
        end

        4'b0111: begin
            bcd_temp = 4'b0111;
            carry_temp = 0;
        end

        4'b1000: begin
            bcd_temp = 4'b1000;
            carry_temp = 0;
        end

        4'b1001: begin
            bcd_temp = 4'b1001;
            carry_temp = 0;
        end

        4'b1010: begin
            bcd_temp = 4'b0000;
            carry_temp = 1;
        end

        4'b1011: begin
            bcd_temp = 4'b0001;
            carry_temp = 1;
        end

        4'b1100: begin
            bcd_temp = 4'b0010;
            carry_temp = 1;
        end

        4'b1101: begin
            bcd_temp = 4'b0011;
            carry_temp = 1;
        end

        4'b1110: begin
            bcd_temp = 4'b0100;
            carry_temp = 1;
        end

        4'b1111: begin
            bcd_temp = 4'b0101;
            carry_temp = 1;
        end

        default: begin
            bcd_temp = 4'b0000;
            carry_temp = 0;
        end
    endcase
end

assign bcd = bcd_temp;
assign carry = carry_temp;

endmodule : bin2bcd