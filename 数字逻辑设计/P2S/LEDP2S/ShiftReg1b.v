`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:34 12/28/2020 
// Design Name: 
// Module Name:    ShiftReg1b 
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
module ShiftReg1b(
    input wire clk, S_L, s_in,
	 input wire p_in,
	 output wire Q
    );
    wire D;
	 assign D = (S_L==0) ? s_in : p_in ;
    D_FLIPFLOP m0(.Cp(clk) , .D(D) , .Sbar(1'b1) , .Rbar(1'b1) , .Q(Q));	 

endmodule
