`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:36 05/24/2016 
// Design Name: 
// Module Name:    instructionMemory 
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
module instructionMemory(
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
		
		mem[0] = 8'b00000010;
		mem[1] = 8'b00000000;
		mem[2] = 8'b00000000;
		mem[3] = 8'b11100000;

		mem[4] = 8'b00000010;
		mem[5] = 8'b00000000;
		mem[6] = 8'b00000010;
		mem[7] = 8'b00001000;

		mem[8] = 8'b00001000;
		mem[9] = 8'b00000000;
		mem[10] = 8'b00000001;
		mem[11] = 8'b00001000;

		mem[12] = 8'b00000010;
		mem[13] = 8'b00000000;
		mem[14] = 8'b00000010;
		mem[15] = 8'b01001000;

		mem[16] = 8'b00000000;
		mem[17] = 8'b00011000;
		mem[18] = 8'b00100010;
		mem[19] = 8'b00000000;

		mem[20] = 8'b00000000;
		mem[21] = 8'b00100000;
		mem[22] = 8'b01100010;
		mem[23] = 8'b01000100; 

		mem[24] = 8'b00000000;
		mem[25] = 8'b00101000;
		mem[26] = 8'b01100001;
		mem[27] = 8'b00000100;

		mem[28] = 8'b00000000;
		mem[29] = 8'b01000000;
		mem[30] = 8'b00100010;
		mem[31] = 8'b01000000;

		mem[32] = 8'b00000000;
		mem[33] = 8'b01011000;
		mem[34] = 8'b00000000;
		mem[35] = 8'b10000001;
			
		mem[36] = 8'b00100000;
		mem[37] = 8'b00000000;
		mem[38] = 8'b00000000;
		mem[39] = 8'b11101000;

		mem[40] = 8'b00000000;
		mem[41] = 8'b00110000;
		mem[42] = 8'b00100010;
		mem[43] = 8'b10011100;

		mem[44] = 8'b00000000;
		mem[45] = 8'b00111000;
		mem[46] = 8'b00100010;
		mem[47] = 8'b10011100;

		mem[48] = 8'b00000000;
		mem[49] = 8'b00010000;
		mem[50] = 8'b01000000;
		mem[51] = 8'b01100000;

		mem[52] = 8'b11111110;
		mem[53] = 8'b11111111;
		mem[54] = 8'b00100010;
		mem[55] = 8'b11010000;
		 
		mem[56] = 8'b00000000;
		mem[57] = 8'b00000000;
		mem[58] = 8'b00000000;
		mem[59] = 8'b11111100;
			
		mem[128] = 8'b00000000;
		mem[129] = 8'b00000000;
		mem[130] = 8'b10101011;
		mem[131] = 8'b11000000;

		mem[132] = 8'b00000000;
		mem[133] = 8'b00000000;
		mem[134] = 8'b10101010;
		mem[135] = 8'b11000100;

		mem[136] = 8'b00000000;
		mem[137] = 8'b00000000;
		mem[138] = 8'b11100000;
		mem[139] = 8'b11100111;
		
		
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