`timescale 1ns / 1ps

module UniShiftReg(
    output reg [3:0] q,
    input serialright,
    input serialleft,
    input [3:0] in,
    input clk,
    input clr,
    input [1:0] select
);
    always @(posedge clk or posedge clr) begin
        if (clr)
            q <= 4'b0000;
        else begin
            case (select)
                2'b00: q <= q;                                 // Hold
                2'b01: q <= {q[2:0], serialright};             // Shift Right
                2'b10: q <= {serialleft, q[3:1]};              // Shift Left
                2'b11: q <= in;                                // Parallel Load
            endcase
        end
    end
endmodule

