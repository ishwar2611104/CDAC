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

module SR_using_T (
    input S,
    input R,
    input clk,
    input reset,
    output q
);
    wire t_input;
    reg q_internal;

    // Derive T from current state
    assign t_input = (S & ~q_internal) | (R & q_internal);

    Tff tff_inst (
        .t(t_input),
        .clk(clk),
        .reset(reset),
        .q(q_internal)
    );

    assign q = q_internal;
endmodule

