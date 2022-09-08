`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:11:48 12/28/2020
// Design Name:   LED_DRV
// Module Name:   D:/ISE_project/12.21/LEDP2S/LEDP2S_sim.v
// Project Name:  LEDP2S
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LED_DRV
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LEDP2S_sim;

	// Inputs
	reg clk;
	reg [3:0] BTN;
	reg start;
	reg [15:14] SW;

	// Outputs
	wire s_l;
	wire [15:0] disp;
	wire [3:0] AN;
	wire [7:0] SEGMENT;
	wire finish;
	wire LED_DO;
	wire LED_CLK;
	wire LED_EN;
	wire LED_CLR;
	wire BTNX4;

	// Instantiate the Unit Under Test (UUT)
	LED_DRV uut (
		.clk(clk), 
		.BTN(BTN), 
		.start(start), 
		.SW(SW), 
		.s_l(s_l), 
		.disp(disp), 
		.AN(AN), 
		.SEGMENT(SEGMENT), 
		.finish(finish), 
		.LED_DO(LED_DO), 
		.LED_CLK(LED_CLK), 
		.LED_EN(LED_EN), 
		.LED_CLR(LED_CLR), 
		.BTNX4(BTNX4)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		BTN = 0;
		start = 0;
		SW = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

      start=0;
		SW[15]=1;
		SW[14]=0;
		#1000;
		start=1;
		#10;
		start=0;
	end

always begin       
    clk=0; #20;
	 clk=1; #20;
end
      
endmodule

