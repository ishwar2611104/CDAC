`timescale 1ns / 1ps

module test_halfsubtractor;

// Inputs
reg a;
reg b;

// Outputs
wire diff;
wire borrow;

// Instantiate the half subtractor
halfsubtractor uut (
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow)
);

initial begin
  

    // Dump waves
    $dumpfile("dump.vcd");
  $dumpvars(1, test_halfsubtractor);
    // Print header
    $display("a b | diff borrow");
    $display("------------------");

    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    $display("%b %b |   %b     %b", a, b, diff, borrow);

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    $display("%b %b |   %b     %b", a, b, diff, borrow);

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    $display("%b %b |   %b     %b", a, b, diff, borrow);

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    $display("%b %b |   %b     %b", a, b, diff, borrow);

    // End simulation
    $finish;
end

endmodule
