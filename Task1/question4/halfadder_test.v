`timescale 1ns / 1ps

module test_halfadder;

// Inputs
reg a;
reg b;

// Outputs
wire sum;
wire carry;

// Instantiate the half adder module
halfadder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin
  
  

    // Dump waves
    $dumpfile("dump.vcd");
  $dumpvars(1, test_halfadder);
    // Print header
    $display("a b | sum carry");
    $display("---------------");

    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    $display("%b %b |  %b    %b", a, b, sum, carry);

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    $display("%b %b |  %b    %b", a, b, sum, carry);

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    $display("%b %b |  %b    %b", a, b, sum, carry);

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    $display("%b %b |  %b    %b", a, b, sum, carry);

    // End simulation
    $finish;
end

endmodule
