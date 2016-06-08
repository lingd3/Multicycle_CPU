`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:08 05/24/2016 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
	input CLK,
   input RW,
   input [31:0] Addr,
   input [31:0] DataIn,
   output [31:0] DataOut
   );
	integer i;
	reg [7:0] mem [0:255];
	
	assign DataOut[7:0] = mem[Addr];
	assign DataOut[15:8] = mem[Addr+1];
	assign DataOut[23:16] = mem[Addr+2];
	assign DataOut[31:24] = mem[Addr+3];	
	initial begin
		for (i = 0; i < 256; i = i + 1)
			mem[i] = 0;
	end
	always @(negedge CLK) begin
		if (RW == 1) begin// write
			mem[Addr] = DataIn[7:0];
			mem[Addr+1] = DataIn[15:8];
			mem[Addr+2] = DataIn[23:16];
			mem[Addr+3] = DataIn[31:24]; 
		end   
	end
endmodule
