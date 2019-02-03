`timescale 1ns / 1ps

module ALUSrc(controlSelect,Readdata2,signextend,aludata2);

input controlSelect;
input [63:0]Readdata2;
input [63:0]signextend;

output [63:0]aludata2;

always@(controlSelect)
    begin
        if (controlSelect==0)
            aludata2=Readdata2;
        else
            aludata2=signextend;
    end

endmodule


//module ALUSrc (instruction, data2, ALUSrc, ALU2, rst);
//alumux alu_mux(instruction, RFRD2, ALUSrc, ALU2, rst);
    
//    input [31:0] instruction;
//    input [63:0] data2;
//    input ALUSrc, rst;
    
//    output reg [63:0] ALU2;
       
//    always @(posedge rst, ALUSrc, instruction, data2)
//    begin
//        if ( rst )
//            ALU2 = 0;
        
//        else if ( ALUSrc == 1)
//            ALU2 = $signed(instruction[20:10]);
        
//        else if ( ALUSrc == 0)
//            ALU2 = data2;
//    end
//endmodule
