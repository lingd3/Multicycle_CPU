`timescale 1ns / 1ps
`include "ALU.v"
`include "CU.v"
`include "PC.v"
`include "combine.v"
`include "temp_register.v"
`include "shift.v"
`include "Immediate_Extend.v"
`include "instructionMemory.v"
`include "DataMemory.v"
`include "register_file.v"
`include "select.v"
`include "Write_Reg.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:44 05/24/2016 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
	input CLK,
	input RST,
	input [31:0] PC_Value,
	input [31:0] Ins_Input,
	input CLR
   );
	
	parameter enable = 1;
	parameter unable = 0;
	
	wire PCWre;
	wire [1:0]ALUSrcB;
	wire [1:0]ALUM2Reg;
	wire RegWre;
	wire [1:0]WrRegData;
	wire InsMemRW;
	wire DataMemRW;
	wire IRWre;
	wire [2:0] ALUOp;
	wire [1:0] PCSrc;
	wire [1:0] RegOut;
	wire [1:0] ExtSel;
	
	wire zero;
	wire [5:0] writeReg;
	wire [31:0] PC_Input;
	wire [31:0] PC0;
	wire [31:0] PC1;
	wire [31:0] PC2;
	wire [31:0] PC3;
	wire [31:0] PC4;
	wire [31:0] PCAddResult;
	wire [31:0] Instruction;
	wire [31:0] code;
	wire [31:0] writeData;
	wire [31:0] regDataA;
	wire [31:0] regDataB;
	wire [31:0] aDataReg;
	wire [31:0] bDataReg;
	wire [31:0] ALUResult;
	wire [31:0] ALUOutReg;
	wire [31:0] ALUWriteData;
	wire [31:0] ALUM2DataReg;
	wire [31:0] memoryOut;
	wire [31:0] extendData;
	wire [31:0] ALUInputB;
	
	CU my_CU(	
		.CLK(CLK),
		.RST(RST),
		.Zero(zero),
		.Code(code[31:26]),
		.PCWre(PCWre),
		.ALUSrcB(ALUSrcB),
		.ALUM2Reg(ALUM2Reg),
		.RegWre(RegWre),
		.WrRegData(WrRegData),
		.InsMemRW(InsMemRW),
		.DataMemRW(DataMemRW),
		.IRWre(IRWre),
		.ALUOp(ALUOp),
		.PCSrc(PCSrc),
		.RegOut(RegOut),
		.ExtSel(ExtSel)
	);
	
	PC my_PC(
		.DataInA(PC_Input),
		.DataInB(PC_Value),
		.CLK(CLK),
		.RST(RST),
		.WE(PCWre),
		.DataOut(PC0)
	);
	
	ALU my_ALUPlus4(
		.DataA(4),
		.DataB(PC0),
		.Operation(0),
		.Result(PC4),
		.Zero()
	);
	
	ALU my_ALUPlusPC(
		.DataA(PC4),
		.DataB(PC3),
		.Operation(0),
		.Result(PCAddResult),
		.Zero()
	);
	
	ALU my_ALU (
		.DataA(aDataReg),
		.DataB(ALUInputB),
		.Operation(ALUOp),
		.Result(ALUResult),
		.Zero(zero)
	);
	
	select my_pcSelector(
		.DataA(PC4),
		.DataB(PCAddResult),
		.DataC(regDataA),
		.DataD(PC2),
		.select_code(PCSrc),
		.DataOut(PC_Input)
	);
	
	select my_writeDataMux(
		.DataA(PC4),
		.DataB(ALUM2DataReg),
		.DataC(unable),
		.DataD(unable),
		.select_code(WrRegData),
		.DataOut(writeData)
	);
	
	select my_ALUWriteMux(
		.DataA(ALUResult),
		.DataB(memoryOut),
		.DataC(unable),
		.DataD(unable),
		.select_code(ALUM2Reg),
		.DataOut(ALUWriteData)
	);
	
	select my_ALUInputMux(
		.DataA(bDataReg),
		.DataB(extendData),
		.DataC(unable),
		.DataD(unable),
		.select_code(ALUSrcB),
		.DataOut(ALUInputB)
	);
	
	temp_register my_IR(
		.WE(IRWre),
		.CLK(CLK),
		.DataIn(Instruction),
		.DataOut(code)
	);
	
	temp_register my_ADR(
		.WE(enable),
		.CLK(CLK),
		.DataIn(regDataA),
		.DataOut(aDataReg)
	);
	
	temp_register my_BDR(
		.WE(enable),
		.CLK(CLK),
		.DataIn(regDataB),
		.DataOut(bDataReg)
	);
	
	temp_register my_ALUM2DR(
		.WE(enable),
		.CLK(CLK),
		.DataIn(ALUWriteData),
		.DataOut(ALUM2DataReg)
	);
	
	temp_register my_ALUout(
		.WE(enable),
		.CLK(CLK),
		.DataIn(ALUResult),
		.DataOut(ALUOutReg)
	);
	
	shift my_shiftForExtend (
		.DataIn(extendData),
		.DataOut(PC3)
	);
	
	shift my_shiftForCode(
		.DataIn(code),
		.DataOut(PC1)
	);
	
	instructionMemory my_instructionMemory(
		.CLK(CLK),
		.RW(InsMemRW),
		.Addr(PC0),
		.DataIn(Ins_Input),
		.DataOut(Instruction)
    );
   
	Write_Reg my_writeRegMux(
		.DataA(31),
		.DataB(code[20:16]),
		.DataC(code[15:11]),
		.DataD(unable),
		.Selection(RegOut),
		.DataOut(writeReg)
	);
	
	register_file my_register_file(
		.ReadRegA(code[25:21]),
		.ReadRegB(code[20:16]),
		.WriteReg(writeReg),
		.WriteData(writeData),
		.WE(RegWre),
		.CLK(CLK),
		.CLR(CLR),
		.ReadDataA(regDataA), 
		.ReadDataB(regDataB)
	);
	
	Immediate_Extend my_Immediate_Extend(
		.immediateIn(code[15:0]),
		.Selection(ExtSel),
		.immediateOut(extendData)
	);
	
	combine my_combine(
		.PC(PC0),
		.DataIn(PC1),
		.DataOut(PC2)
	);
	
	DataMemory my_DataMemory(	
		.CLK(CLK),
		.RW(DataMemRW),
		.Addr(ALUOutReg),
		.DataIn(bDataReg),
		.DataOut(memoryOut)
	);
	
endmodule
