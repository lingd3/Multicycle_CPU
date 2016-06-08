`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:13 05/24/2016 
// Design Name: 
// Module Name:    Immediate_Extend 
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
module Immediate_Extend(
	input [15:0] immediateIn,
	input [1:0] Selection,
	output reg [31:0] immediateOut
	);
	
	always @(Selection or immediateIn) begin
		if (Selection == 0)
			immediateOut = {{27{1'b0}}, immediateIn[15:11]};
		else if (Selection == 1)
			immediateOut = {{16{1'b0}}, immediateIn[15:0]};
		else if (Selection == 2)
			immediateOut = {{16{immediateIn[15]}}, immediateIn[15:0]};
	end
	
endmodule