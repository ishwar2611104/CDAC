`timescale 1ns / 1ps
module SerialAdder_Mealy(
    input a,
    input b,
    input clk,
    input reset,
    output reg y,      // sum output
    output reg q       // carry state
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 0;
            y <= 0;
        end
        else begin
            case ({q, a, b})
                3'b000: begin y <= 0; q <= 0; end
                3'b001,
                3'b010: begin y <= 1; q <= 0; end
                3'b011: begin y <= 0; q <= 1; end
                3'b100: begin y <= 1; q <= 0; end
                3'b101,
                3'b110: begin y <= 0; q <= 1; end
                3'b111: begin y <= 1; q <= 1; end
            endcase
        end
    end
endmodule
