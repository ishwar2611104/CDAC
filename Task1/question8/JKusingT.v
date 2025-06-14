module Tff (
    input t,
    input clk,
    input reset,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
    end
endmodule

module JK_using_T (
    input J,
    input K,
    input clk,
    input reset,
    output q
);
    reg q_internal;
    wire t_input;

    assign t_input = (J & ~q_internal) | (~K & q_internal);

    Tff tff_inst (
        .t(t_input),
        .clk(clk),
        .reset(reset),
        .q(q_internal)
    );

    assign q = q_internal;
endmodule
