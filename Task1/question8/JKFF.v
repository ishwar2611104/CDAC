module JK_FF(
    input clk,
    input j,
    input k,
    output reg q
);
    always @(posedge clk) begin
        case ({j,k})
            2'b00: q <= q;        // No change
            2'b01: q <= 0;        // Reset
            2'b10: q <= 1;        // Set
            2'b11: q <= ~q;       // Toggle
        endcase
    end
endmodule
