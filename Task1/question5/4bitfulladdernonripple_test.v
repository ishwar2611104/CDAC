`timescale 1ns / 1ps

module tb_fourbitfulladderNonRipple;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    integer i, j, k;

    // Instantiate the Unit Under Test (UUT)
    fourbitfulladderNonRipple uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, tb_fourbitfulladderNonRipple);
        // Header for output
        $display("  a     b   cin |  sum   cout | Expected");
        $display("------------------------------------------");

        // Iterate through all values of a (0 to 15)
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    a = i[3:0];
                    b = j[3:0];
                    cin = k;
                    #5; // Wait for outputs to settle
                    $display("%4b %4b   %1b  |  %4b     %1b   | %5d", 
                              a, b, cin, sum, cout, a + b + cin);
                end
            end
        end

        $finish;
    end

endmodule
