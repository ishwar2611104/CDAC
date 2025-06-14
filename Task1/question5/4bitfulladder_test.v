module test_fourbitfulladder;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    fourbitfulladder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, test_fourbitfulladder);
        $display(" a    +  b   + cin | sum   cout");
        $display("--------------------------------");

        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        $display("%b + %b + %b | %b   %b", a, b, cin, sum, cout);

        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        $display("%b + %b + %b | %b   %b", a, b, cin, sum, cout);

        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        $display("%b + %b + %b | %b   %b", a, b, cin, sum, cout);

        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        $display("%b + %b + %b | %b   %b", a, b, cin, sum, cout);

        a = 4'b1111; b = 4'b1111; cin = 1; #10;
        $display("%b + %b + %b | %b   %b", a, b, cin, sum, cout);

        $finish;
    end

endmodule
