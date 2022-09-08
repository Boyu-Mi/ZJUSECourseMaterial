`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:18:52 12/21/2020 
// Design Name: 
// Module Name:    ShiftReg8b 
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
module ShiftReg8b(
    input wire clk, S_L, s_in,
	 input wire [7:0] p_in,
	 output wire [7:0] Q
    );
	 reg [7:0] S;
	 assign Q=S;
    initial begin 
	     S=8'b000000000;
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