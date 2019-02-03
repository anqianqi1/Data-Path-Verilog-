`timescale 1ns / 1ps



module SCD_tb(

    );


reg clk,rst;
wire [2:0] ALUop;
wire [31:0] instruction, ReadSelect2;
wire zero, Branch, ConBranch, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, ldurb, sturb; 
wire [63:0] pc,signextend, RegReadData1, RegReadData2, aludata2, AluResult, MemReadData,RegWritedata;

Single_Cycle_Datapath uut(clk,rst,ALUop,instruction, ReadSelect2,zero, Branch, ConBranch, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, ldurb, sturb,pc,signextend, RegReadData1, RegReadData2, aludata2, AluResult, MemReadData, RegWritedata );

initial
begin
clk = 1;
rst = 1;

#1
rst = 0;

#100
rst = 0;
$finish;
end


always
#10 clk = !clk;




endmodule


