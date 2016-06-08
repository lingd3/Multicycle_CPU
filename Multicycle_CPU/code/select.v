`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:37 05/24/2016 
// Design Name: 
// Module Name:    select 
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
module select(
	input [31:0] DataA,
	input [31:0] DataB,
	input [31:0] DataC,
	input [31:0] DataD,
	input [1:0] select_code,
	output reg [31:0] DataOut
   );
   
	always @(select_code or DataA or DataB or DataC or DataD) begin
		if (select_code == 0)
			DataOut = DataA;
		else if (select_code == 1)
			DataOut = DataB;
		else if (select_code == 2)
			DataOut = DataC;
		else
			DataOut = DataD;
	end

endmodule
