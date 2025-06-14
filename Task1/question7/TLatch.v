module TLatch(
    input t,
    input en,
    input reset,
    output reg q
);
    always @(t or en or reset) begin
        if (reset)
            q = 0; // Active-high reset sets q to 0
        else if (en) begin
            if (t)
                q = ~q; // Toggle if T is 1
            // If T = 0, retain q
        end
        // If en = 0, retain q
    end
endmodule
