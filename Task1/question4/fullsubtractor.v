`timescale 1ns / 1ps

module fullsubtractor(
    input a,
    input b,
    input bin,       // borrow in
    output diff,
    output bout      // borrow out
);

assign diff = a ^ b ^ bin;
assign bout = (~a & b) | (~(a ^ b) & bin);

endmodule
