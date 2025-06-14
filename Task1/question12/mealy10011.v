`timescale 1ns / 1ps
module Mealy_10011_Overlap(
    input clk,
    input reset,
    input x,
    output reg z
);

reg [2:0] state;
parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;

always @(posedge clk or posedge reset) begin
    if(reset) begin
        state <= S0;
        z <= 0;
    end
    else begin
        case(state)
            S0: begin state <= (x==1) ? S1 : S0; z <= 0; end
            S1: begin state <= (x==0) ? S2 : S1; z <= 0; end
            S2: begin state <= (x==0) ? S3 : S1; z <= 0; end
            S3: begin state <= (x==1) ? S4 : S0; z <= 0; end
            S4: begin
                state <= (x==1) ? S1 : S2;
                z <= (x==1) ? 1 : 0; // output on transition
            end
            default: begin state <= S0; z <= 0; end
        endcase
    end
end
endmodule
