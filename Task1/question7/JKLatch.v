module JKLatch (
    input J,
    input K,
    input en,
    output reg Q
);
    always @ (J or K or en) begin
        if (en) begin
            if (~J && ~K)
                Q = Q;     // Hold
            else if (~J && K)
                Q = 0;     // Reset
            else if (J && ~K)
                Q = 1;     // Set
            else if (J && K)
                Q = ~Q;    // Toggle
        end
    end
endmodule
