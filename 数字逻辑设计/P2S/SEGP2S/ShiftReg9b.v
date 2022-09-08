`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:44:03 12/28/2020 
// Design Name: 
// Module Name:    ShiftReg9b 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ShiftReg9b(
    input wire clk, S_L, s_in,
	 input wire [8:0] p_in,
	 output wire [8:0] Q
    );
	 reg [8:0] S;
	 assign Q=S;
    initial begin 
	     S=9'b000000000;
	 end
	 always@(posedge clk)
	 if(S_L==0) begin
	     S=S<<1;
		  S[0]=s_in;
	 end
	 else begin
	     S=p_in;
	 end
endmodule
