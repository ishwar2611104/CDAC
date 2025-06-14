module SRLatch (
    input S,
    input R,
    output reg Q
);
    always @ (S or R) begin
        if (S && ~R)
            Q = 1;
        else if (~S && R)
            Q = 0;
        else if (~S && ~R)
            Q = Q; // Hold
        // S=1 and R=1 is invalid: do nothing here
    end
endmodule
