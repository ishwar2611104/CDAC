module SR_FF(
    input clk,
    input s,
    input r,
    output reg q
);
    always @(posedge clk) begin
        if (s && !r) q <= 1;
        else if (!s && r) q <= 0;
        else if (!s && !r) q <= q;
        else q <= 1'bx; // Invalid
    end
endmodule

