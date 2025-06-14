`timescale 1ns / 1ps
module syncMod10(
    input clk,input reset ,
    output reg [3:0] q
    );
	always @(posedge clk)
	begin
	if(reset)
	q=0;
	else
	q=(q+1)%10;
	end

endmodule
