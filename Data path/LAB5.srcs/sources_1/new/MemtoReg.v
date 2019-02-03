`timescale 1ns / 1ps
module MemtoReg(MemSelect,MemReaddata,AluResult,RegWrite);
    
input MemSelect;
input [63:0]MemReaddata;
input [63:0]AluResult;

output [63:0]RegWrite;

always@(MemSelect)
    begin
        if (MemSelect==0)
            RegWrite=AluResult;
        else
            RegWrite=MemReaddata;
    end

endmodule

