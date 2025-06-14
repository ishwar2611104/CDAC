// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module ques1test;

	// Inputs
	reg in1_tb, in2_tb;

	// Outputs
	wire outand, outor, outxor, outnand, outnor, outxnor;
	wire notin1, notin2;
	wire outand1, outor1, outxor1, outnand1, outnor1, outxnor1, not1in1, not1in2;
	wire outand2, outor2, outxor2, outnand2, outnor2, outxnor2, not2in1, not2in2;

	// Instantiate the Unit Under Test (UUT)
	ques1 uut (
		.in1(in1_tb),
		.in2(in2_tb),
		// Gate-level outputs
		.outand(outand),
		.outor(outor),
		.outxor(outxor),
		.outnand(outnand),
		.outnor(outnor),
		.outxnor(outxnor),
		.notin1(notin1),
		.notin2(notin2),
		// Dataflow outputs
		.outand1(outand1),
		.outor1(outor1),
		.outxor1(outxor1),
		.outnand1(outnand1),
		.outnor1(outnor1),
		.outxnor1(outxnor1),
		.notin11(not1in1),
		.notin21(not1in2),
		// Behavioral outputs
		.outand2(outand2),
		.outor2(outor2),
		.outxor2(outxor2),
		.outnand2(outnand2),
		.outnor2(outnor2),
		.outxnor2(outxnor2),
		.notin12(not2in1),
		.notin22(not2in2)
	);

    initial begin
    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, ques1test);
  
		// Wait 100 ns for global reset to finish
		#100;
        
		// Stimulus: apply all 2-bit combinations
		#5  in1_tb = 0; in2_tb = 0;
		#5  in1_tb = 1; in2_tb = 0;
		#5  in1_tb = 0; in2_tb = 1;
		#5  in1_tb = 1; in2_tb = 1;

		#5 $finish;
	end
      
endmodule

