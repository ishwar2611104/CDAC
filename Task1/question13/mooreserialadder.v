`timescale 1ns / 1ps
module SerialAdder_Moore(
    input a,
    input b,
    input clk,
    input reset,
    output reg y,      // sum output
    output reg q       // carry state
);

    reg [1:0] input_bits;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 0;
            y <= 0;
        end else begin
            input_bits = a + b + q;
            y <= input_bits[0];     // sum
            q <= input_bits[1];     // carry
        end
    end
endmodule
