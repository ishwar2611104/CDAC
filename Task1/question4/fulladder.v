`timescale 1ns / 1ps

module fulladder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

assign sum = a ^ b ^ cin;                      // XOR for sum
assign cout = (a & b) | (b & cin) | (a & cin); // Majority logic for carry

endmodule
