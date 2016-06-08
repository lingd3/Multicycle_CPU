`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:44 05/24/2016 
// Design Name: 
// Module Name:    temp_register 
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
module temp_register(
	input WE,
	input CLK,
	input [31:0]DataIn,
	output reg [31:0]DataOut
	);
	always@(negedge CLK) begin
		if (WE == 1) begin
			DataOut = DataIn;
		end
	end
endmodule