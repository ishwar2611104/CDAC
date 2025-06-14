module TLatch (
    input T,
    input en,
    output reg Q
);
    always @ (T or en) begin
        if (en) begin
            if (T)
                Q = ~Q;  // Toggle
            else
                Q = Q;   // Hold
        end
    end
endmodule
