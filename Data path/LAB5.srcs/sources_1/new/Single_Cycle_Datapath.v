`timescale 1ns / 1ps

module Single_Cycle_Datapath(clk,rst,ALUop,instruction, ReadSelect2,zero, Branch, ConBranch, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, ldurb, sturb,pc,signextend, RegReadData1, RegReadData2, aludata2, AluResult, MemReadData, RegWritedata);

input clk,rst;
wire [2:0] ALUop;
wire [31:0] instruction, ReadSelect2;
wire zero, Branch, ConBranch, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, ldurb, sturb; 
wire [63:0] pc,signextend, RegReadData1, RegReadData2, aludata2, AluResult, MemReadData,RegWritedata;

//output []reg_file[] []mem_file[]


ProgramCounter(zero, instruction, clk, rst, pc, Branch, ConBranch);
Instruction_Memory(pc, instruction);
control(instruction,Reg2Loc,ALUSrc,MemtoReg,signextend,ALUop,RegWrite,MemRead,MemWrite,Branch,ConBranch,ldurb,sturb);
Reg2Loc(Reg2Loc,instruction,ReadSelect2);
Register_File(instruction[9:5], ReadSelect2, instruction[4:0], RegWritedata, RegWrite, RegReadData1, RegReadData2, clk, rst);
ALUSrc(ALUSrc,RegReaddata2,signextend,aludata2);
ALU(ALUOp,RegReadData1,aludata2,AluResult,zero);
Data_Mem(clk,rst,MemWrite,MemRead,AluResult,RegReadData2,MemReadData,ldurb,sturb);
MemtoReg(MemtoReg,MemReadData,AluResult,RegWritedata);

endmodule

//module ProgramCounter(zero, opcode, clk, rst, pc, unbranch, branch);
//module Instruction_Memory(Address, ReadData1);
//module control(instruction,Reg2Loc,ALUSrc,MemtoReg,signextend,ALUop,RegWrite,MemRead,MemWrite,Branch,ConBranch,ldurb,sturb);//CONTROL + signextend
//module Reg2Loc(SelectReg,instruction,ReadSelect2);//reg MUX
//module Register_File(ReadSelect1, ReadSelect2, WriteSelect, WriteData, WriteEnable, ReadData1, ReadData2, clk, rst);
//module ALUSrc(controlSelect,Readdata2,signextend,aludata2);//alu mux
//module ALU(ALUOp,data1,data2,result,zeroflag);//alu
//module Data_Mem(clk,rst,WriteEnable,ReadEnable,Address,WriteData,ReadData,ldurb,sturb);//data mem
//module MemtoReg(MemSelect,MemReaddata,AluResult,RegWrite);//memtoreg mux