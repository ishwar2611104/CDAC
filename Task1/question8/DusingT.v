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

module D_using_T (
    input D,
    input clk,
    input reset,
    output q
);
    reg q_internal;
    wire t_input;

    assign t_input = D ^ q_internal;

    Tff tff_inst (
        .t(t_input),
        .clk(clk),
        .reset(reset),
        .q(q_internal)
    );

    assign q = q_internal;
endmodule
