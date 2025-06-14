`timescale 1ns / 1ps
module tb_SerialAdder_Moore;

reg a, b, clk, reset;
wire y, q;

SerialAdder_Moore uut(
    .a(a), .b(b), .clk(clk), .reset(reset), .y(y), .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
  

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, tb_SerialAdder_Moore);
  
    $display("Time\ta\tb\tq\ty");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, a, b, q, y);

    reset = 1; a = 0; b = 0;
    #10 reset = 0;

    // A = 10101, B = 10011
    a = 1; b = 1; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 0; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
end

endmodule
