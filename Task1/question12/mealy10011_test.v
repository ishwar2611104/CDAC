`timescale 1ns / 1ps
module tb_Mealy_10011_Overlap;

reg clk, reset, x;
wire z;

Mealy_10011_Overlap uut(clk, reset, x, z);

initial begin clk = 0; forever #5 clk = ~clk; end

initial begin
  

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, tb_Mealy_10011_Overlap);
    reset = 1; x = 0;
    #10 reset = 0;

    // Input: 10011
    x = 1; #10;
    x = 0; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10;

    // Input: 10101
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;

    $finish;
end
endmodule
