`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:52 12/28/2020 
// Design Name: 
// Module Name:    DispHex 
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
module DispHex(
    input wire [3:0] in,
	 output wire [7:0] data
    );
	 MyMC14495 mc0( .D0(in[0]), .D1(in[1]), .D2(in[2]), .D3(in[3]), .LE(1'b0), .point(1'b1), 
	            .p(data[7]), .g(data[6]), .f(data[5]), .e(data[4]),
					.d(data[3]), .c(data[2]), .b(data[1]), .a(data[0]));
endmodule
