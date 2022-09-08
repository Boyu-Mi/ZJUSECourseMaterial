`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:46 11/10/2020 
// Design Name: 
// Module Name:    CreateNumber 
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
module CreateNumber(
	 input wire [3:0] sw,
	 output reg [15:0] num
);
    wire [3:0] A1,B1,C1,D1;
	 
	 initial num <= 16'b0101_0111_0000_0011;
	 
    AddSub4b a1(.A(num[ 3: 0]) , .B(4'b0001) , .Ctrl(1'b0) , .S(A1));
	 AddSub4b a2(.A(num[ 7: 4]) , .B(4'b0001) , .Ctrl(1'b0) , .S(B1));
	 AddSub4b a3(.A(num[11: 8]) , .B(4'b0001) , .Ctrl(1'b0) , .S(C1));
	 AddSub4b a4(.A(num[15:12]) , .B(4'b0001) , .Ctrl(1'b0) , .S(D1));
	 
	 
	 always@(posedge sw[0]) num[ 3: 0]<=A1;
	 always@(posedge sw[1]) num[ 7: 4]<=B1;
	 always@(posedge sw[2]) num[11: 8]<=C1;
	 always@(posedge sw[3]) num[15:12]<=D1;
    
endmodule
