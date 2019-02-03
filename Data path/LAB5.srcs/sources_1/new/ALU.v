`timescale 1ns / 1ps

module ALU(ALUOp,data1,data2,result,zeroflag);
input [2:0]ALUOp;
input [63:0] data1,data2;
output reg [63:0] result;
output zeroflag;

always @(*)
    begin
        case(ALUOp)
        3'b000: result<= data1&data2;//and function
        3'b001: result<= data1^data2;//eor functon
        3'b010: result<= ~data1;//not function
        3'b011: result<= data1;//mova function
        3'b100: result<= data2;//movb function
        3'b101: result<= data1+data2;//add function
        3'b110: result<= data1-data2;//sub function
        3'b111: result<= (data1 <<data2);
        endcase
    end
    
    assign zeroflag=(result==64'b0)? 1:0;
endmodule
