`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:03 05/24/2016 
// Design Name: 
// Module Name:    Write_Reg 
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
module Write_Reg(
	input [4:0] DataA,
	input [4:0] DataB,
	input [4:0] DataC,
	input [4:0] DataD,
	input [1:0]Selection,
	output reg [4:0] DataOut
   );
   
	always @(Selection or DataA or DataB or DataC or DataD) begin
		if (Selection == 0)
			DataOut = DataA;
		else if (Selection == 1)
			DataOut = DataB;
		else if (Selection == 2)
			DataOut = DataC;
		else
			DataOut = DataD;
	end
	
endmodule

