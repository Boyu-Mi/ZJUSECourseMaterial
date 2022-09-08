`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:00 12/28/2020 
// Design Name: 
// Module Name:    SEGP2S 
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
module SEGP2S(
    input wire clk,
	 input wire [7:0] SW,
	 inout wire [15:14] SW2,
	 //input wire start,
	 output wire finish,
	 output wire SEGCLK,
	 output wire SEGCLR,
	 output wire SEGDT,
	 output wire SEGEN
    );
	 wire [31:0] num;
	 wire [31:0] numin;
	 reg [31:0] displaynum;
	 wire [63:0] data;
	 wire s_l;
	 wire [63:0] disp;
	 wire out;
	 wire start;
	 wire [31:0] clk_div;
	 
	 //assign num = 32'b0000_0000_0001_0000_0101_0111_0000_0011;
    CreateNumber m0(.sw(SW[3:0]),.num(num[15:0]));
	 CreateNumber2 m1(.sw(SW[7:4]),.num(num[31:16]));
	 
	 //[3:0] [7:4] [11:8] [15:12] [19:16] [23:20] [27:24] [31:28]
    DispHex p1(.in(num[31:28]),.data(data[63:56]));
	 DispHex p2(.in(num[27:24]),.data(data[55:48]));
	 DispHex p3(.in(num[23:20]),.data(data[47:40]));
	 DispHex p4(.in(num[19:16]),.data(data[39:32]));
	 DispHex p5(.in(num[15:12]),.data(data[31:24]));
	 DispHex p6(.in(num[11: 8]),.data(data[23:16]));
	 DispHex p7(.in(num[ 7: 4]),.data(data[15: 8]));
	 DispHex p8(.in(num[ 3: 0]),.data(data[ 7: 0]));
	 
	 assign start=(|SW);
	 SF m2(.start(start), .finish(finish), .S_L(s_l));
	 ShiftReg9b m3( .clk(clk_div[20]), .S_L(s_l), .s_in(1'b1), .p_in({data[7:0],1'b0}), .Q(disp[8:0]) );
	 ShiftReg8b m4( .clk(clk_div[20]), .S_L(s_l), .s_in(disp[8]), .p_in(data[15:8]), .Q(disp[16:9]) );
	 ShiftReg8b m5( .clk(clk_div[20]), .S_L(s_l), .s_in(disp[16]), .p_in(data[23:16]), .Q(disp[24:17]) );
	 ShiftReg8b m6( .clk(clk_div[20]), .S_L(s_l), .s_in(disp[24]), .p_in(data[31:24]), .Q(disp[32:25]) );
	 ShiftReg8b m7( .clk(clk_div[20]), .S_L(s_l), .s_in(disp[32]), .p_in(data[39:32]), .Q(disp[40:33]) );
	 ShiftReg8b m8( .clk(clk_div[20]), .S_L(s_l), .s_in(disp[40]), .p_in(data[47:40]), .Q(disp[48:41]) );
	 ShiftReg8b m9( .clk(clk_div[20]), .S_L(s_l), .s_in(disp[48]), .p_in(data[55:48]), .Q(disp[56:49]) );
	 ShiftReg8b m10( .clk(clk_div[20]), .S_L(s_l), .s_in(disp[56]), .p_in(data[63:56]), .Q({out,disp[63:57]}) );
	 assign SEGDT=out;
	 assign finish=&disp;
	 assign SEGCLK= finish | clk_div[20] ;
	 assign SEGEN=SW2[15];
	 assign SEGCLR=SW2[14];
	 
	 clkdiv m11( .clk(clk) , .rst(1'b0) , .clkdiv(clk_div) );
endmodule
