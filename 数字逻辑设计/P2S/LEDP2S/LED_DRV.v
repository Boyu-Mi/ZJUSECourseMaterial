`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:17 12/21/2020 
// Design Name: 
// Module Name:    LED_DRV 
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
module LED_DRV(
     input wire clk,
     input wire [3:0] BTN,
	  input wire start,
	  input wire [15:14] SW,
	  output wire [3:0] AN,
	  output wire [7:0] SEGMENT,
	  output wire finish,
	  output wire LED_DO,
	  output wire LED_CLK,
	  output wire LED_EN,
	  output wire LED_CLR,	  
	  output wire BTNX4
    );
	 wire [31:0] clk_div;
	 wire [15:0] num;
	 wire tmp1, tmp2;
	 wire [3:0] btn_out;
	 
	 wire s_l;
	 //wire [7:0] disp_1;
	 //wire [15:8] disp_2;
	 wire [15:0] disp;
	 SF m10(.start(start), .finish(finish), .S_L(s_l));
	 
	 assign LED_CLK= finish | clk_div[25] ;	 //
	 
	 clkdiv m5( .clk(clk) , .rst(1'b0) , .clkdiv(clk_div) );
    pbdebounce m0(clk_div[17],BTN[0],btn_out[0]);
    pbdebounce m1(clk_div[17],BTN[1],btn_out[1]);
	 pbdebounce m2(clk_div[17],BTN[2],btn_out[2]);
	 pbdebounce m3(clk_div[17],BTN[3],btn_out[3]);
	 CreateNumber m4( btn_out , num );
	 
	 ShiftReg9b m6( .clk(clk_div[25]), .S_L(s_l), .s_in(1'b1), .p_in({num[7:0],1'b0}), .Q(disp[8:0]) );
	 ShiftReg8b m8( .clk(clk_div[25]), .S_L(s_l), .s_in(disp[8]), .p_in(num[15:8]), .Q({out,disp[15:9]}) );
	 
	 assign finish = &disp ;
	 
	 assign LED_DO=~out; 
	 assign LED_EN=SW[15];
	 assign LED_CLR=SW[14];
    assign BTNX4 = 1'b0;	
	 
	 DispNum m11( .clk(clk) , .HEXS(num) , .LES(4'b0), .points(4'b0) , 
	              .RST(1'b0) , .AN(AN) , .Segment(SEGMENT) 
				   );
endmodule
