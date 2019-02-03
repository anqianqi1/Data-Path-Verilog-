`timescale 1ns / 1ps

module Reg2Loc(SelectReg,instruction,ReadSelect2);

input SelectReg;
input [31:0]instruction;
output reg [31:0]ReadSelect2;

always@(SelectReg)
    begin
        if (SelectReg==0)
            ReadSelect2=instruction[20:16];
        else
            ReadSelect2=instruction[4:0];
    end

endmodule


//module Reg2Loc(instruction, RReg1, RReg2, WReg, Reg2Lock);

//    input [31:0] instruction;
//    input Reg2Lock ;
    
//    output reg [4:0] RReg1, RReg2, WReg;
       
//    always @(instruction, Reg2Lock)
//    begin
//        if ( Reg2Lock == 1)
//        begin
//            RReg1 = instruction[9:5];
//            RReg2 = instruction[4:0];
//            WReg = instruction[4:0];
//        end
        
//        else if ( Reg2Lock == 0)
//        begin
//            RReg1 = instruction[9:5];
//            RReg2 = instruction[20:16];
//            WReg = instruction[4:0];
//        end
//    end
//endmodule
