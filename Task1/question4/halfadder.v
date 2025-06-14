`timescale 1ns / 1ps

module halfadder(
    input a,
    input b,
    output sum,
    output carry
);

// Sum is XOR of a and b
assign sum = a ^ b;

// Carry is AND of a and b
assign carry = a & b;

endmodule
