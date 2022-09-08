// Verilog test fixture created from schematic D:\QQ\2659290964\FileRecv\D_74LS138\D_74LS138_TEST\test.sch - Tue Oct 19 17:45:16 2021

`timescale 1ns / 1ps

module test_test_sch_tb();

// Inputs
   reg S1;
   reg S2;
   reg S3;

// Output
   wire FFF;

// Bidirs

// Instantiate the UUT
   test UUT (
		.S1(S1), 
		.S2(S2), 
		.S3(S3), 
		.FFF(FFF)
   );
// Initialize Inputs
   //`ifdef auto_init
	integer i;
      initial begin
		S1 = 0;
		S2 = 0;
		S3 = 0;
		#50;
		//integer i;
		for(i=0;i<=7;i=i+1)begin
		{S1,S2,S3}=i;
		#50;
		end
		end
   //`endif
endmodule
