`timescale 1ns / 1ps

module DLatch(
    input d,
    input en,
    output reg q
    );

    always @(*) begin
        if (en)
            q = d;      // Transparent mode
        // else: retain previous value (latch mode)
    end

endmodule
