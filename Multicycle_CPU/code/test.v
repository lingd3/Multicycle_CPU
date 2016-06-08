`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:07 05/24/2016 
// Design Name: 
// Module Name:    test 
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
module test;

	// Inputs
	reg CLK;
	reg RST;
	reg [31:0] PC_Value;
	reg [31:0] Ins_Input;
	reg CLR;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.CLK(CLK), 
		.RST(RST), 
		.PC_Value(PC_Value), 
		.Ins_Input(Ins_Input), 
		.CLR(CLR)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;
		PC_Value = 0;
		Ins_Input = 0;
		CLR = 0;
		forever #1000 CLK = !CLK;
		// Add stimulus here
	end
      
endmodule
