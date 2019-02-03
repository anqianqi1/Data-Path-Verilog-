`timescale 1ns / 1ps

module testALU();
reg [2:0] ALUOp;
reg [63:0] data1, data2;

wire zeroflag;
wire [63:0] result;

ALU a(ALUOp,data1,data2,result,zeroflag);


initial
begin
ALUOp=3'b111;
//ALUOp=3'b101;
data1=64'b10;
data2=64'b1;
#5
ALUOp=3'b000;
#5
ALUOp=3'b001;
#5
ALUOp=3'b010;
#5
ALUOp=3'b011;
#5
ALUOp=3'b100;
#5
ALUOp=3'b110;

$finish;
end

endmodule
