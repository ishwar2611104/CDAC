`timescale 1ns / 1ps

module halfsubtractor(
    input a,
    input b,
    output diff,
    output borrow
);

// Difference is a XOR b
assign diff = a ^ b;

// Borrow occurs when a is 0 and b is 1
assign borrow = ~a & b;

endmodule
