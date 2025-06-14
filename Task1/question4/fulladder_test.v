`timescale 1ns / 1ps

module test_fulladder;

reg a, b, cin;
wire sum, cout;

fulladder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
  

    // Dump waves
    $dumpfile("dump.vcd");
  $dumpvars(1, test_fulladder);
    $display("a b cin | sum cout");
    $display("------------------");

    a=0; b=0; cin=0; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a=0; b=0; cin=1; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a=0; b=1; cin=0; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a=0; b=1; cin=1; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a=1; b=0; cin=0; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a=1; b=0; cin=1; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a=1; b=1; cin=0; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a=1; b=1; cin=1; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    $finish;
end

endmodule
