`timescale 1ns / 1ps

module testcontrol();

reg [10:0]instruction;

wire [2:0]ALUop;
wire [63:0]signextend;
//wire instructon[31:21];

wire Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ConBranch,ldurb,sturb;

control a(instruction,Reg2Loc,ALUSrc,MemtoReg,signextend,ALUop,RegWrite,MemRead,MemWrite,Branch,ConBranch,ldurb,sturb);

initial
begin


#5
//instruction=32'b00010100000_000000000000000000010; 
instruction=11'b00010100000;
$finish;
end

endmodule
