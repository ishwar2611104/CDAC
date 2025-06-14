module Tff(
    input t,
    input reset,
    input clk,
    output reg qt,
    output reg qtbar
);

    always @(posedge clk) begin
        if (reset) begin
            qt <= 0;
            qtbar <= 1;
        end else begin
            qt <= t ? ~qt : qt;
            qtbar <= ~qt;
        end
    end

endmodule
