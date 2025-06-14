module TLatch (
    input T,
    input en,
    output reg Q
);
    always @ (T or en) begin
        if (en) begin
            if (T)
                Q = ~Q;  // Toggle
            // else: Q stays same, do nothing
        end
        // if en is 0, do nothing — Q remains same
    end
endmodule
