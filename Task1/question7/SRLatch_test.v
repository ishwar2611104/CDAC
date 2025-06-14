module SRLatch_tb;

    reg S, R;
    wire Q;

    SRLatch uut (.S(S), .R(R), .Q(Q));

    initial begin
        S=0; R=0; #10; $display("S=%b R=%b => Q=%b", S, R, Q); // Hold
        S=1; R=0; #10; $display("S=%b R=%b => Q=%b", S, R, Q); // Set
        S=0; R=0; #10; $display("S=%b R=%b => Q=%b", S, R, Q); // Hold
        S=0; R=1; #10; $display("S=%b R=%b => Q=%b", S, R, Q); // Reset
        S=1; R=1; #10; $display("S=%b R=%b => Q=%b", S, R, Q); // Invalid
        $finish;
    end
endmodule
