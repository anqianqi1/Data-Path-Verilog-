`timescale 1ns / 1ps

module control(instruction,Reg2Loc,ALUSrc,MemtoReg,signextend,ALUop,RegWrite,MemRead,MemWrite,Branch,ConBranch,ldurb,sturb);

input [31:0]instruction;
//input [10:0]instruction;

output reg [2:0]ALUop;
output reg [63:0]signextend;

output reg Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ConBranch,ldurb,sturb;

//reg [10:0]opcode;


always@(instruction)
    begin
    //opcode[10:0]=instruction[31:21];
    
        //case(opcode)
        case(instruction[31:21])
        //case(instruction)
            11'b00010100000://branch
            begin
            //ALUop=3'b101;
            signextend=instruction[25:0];
            Reg2Loc=0;
            ALUSrc=0;
            MemtoReg=0;
            RegWrite=0;
            MemRead=0;
            MemWrite=0;
            Branch=1;
            ConBranch=0;
            ldurb=0;
            sturb=0; 
            end
            
            11'b10001010000://and
            begin
            ALUop=3'b000;
            //signextend=instruction[20:10];
            Reg2Loc=0;
            ALUSrc=0;
            MemtoReg=0;
            RegWrite=1;
            MemRead=0;
            MemWrite=0;
            Branch=0;
            ConBranch=0;
            ldurb=0;
            sturb=0;           
            end
        
        11'b10001011000://add
            begin
            ALUop=3'b101;
            //signextend=instruction[20:10];
            Reg2Loc=0;
            ALUSrc=0;
            MemtoReg=0;
            RegWrite=1;
            MemRead=0;
            MemWrite=0;
            Branch=0;
            ConBranch=0;
            ldurb=0;
            sturb=0;           
            end

        11'b10101010000://eor
        begin
            ALUop=3'b001;
            //signextend=instruction[20:10];
            Reg2Loc=0;
            ALUSrc=0;
            MemtoReg=0;
            RegWrite=1;
            MemRead=0;
            MemWrite=0;
            Branch=0;
            ConBranch=0;
            ldurb=0;
            sturb=0;           
        end

        11'b10110100000://cbz
        begin
            ALUop=3'b100;//result = data2
            //signextend=instruction[20:10];
            Reg2Loc=1;//choose [4:0] reg2 data2     to judge if it is zero
            ALUSrc=0;
            MemtoReg=0;
            RegWrite=0;
            MemRead=0;
            MemWrite=0;
            Branch=0;
            ConBranch=1;//conditional branch
            ldurb=0;
            sturb=0;           
        end

        11'b11001011000://sub
        begin
            ALUop=3'b110;//result = data1 - data2
            //signextend=instruction[20:10];
            Reg2Loc=0;//choose [20:16]
            ALUSrc=0;
            MemtoReg=0;
            RegWrite=1;//write to [4:0]
            MemRead=0;
            MemWrite=0;
            Branch=0;
            ConBranch=0;
            ldurb=0;
            sturb=0;           
        end

        11'b11010010100://movz
        begin
            ALUop=3'b100;//alu result=data2(sign extend)
            signextend=instruction[20:5];//select [20:5] immediate to movz
            Reg2Loc=0;
            ALUSrc=1;//choose sign extend
            MemtoReg=0;
            RegWrite=1;//write to [4:0]
            MemRead=0;
            MemWrite=0;
            Branch=0;
            ConBranch=0;
            ldurb=0;
            sturb=0;           
        end

        11'b11111000000://stur
        begin
            ALUop=3'b101;//alu result=data1+sign extend
            signextend=instruction[20:10];//select [20:10] immediate offset address
            Reg2Loc=1;//write regdata [4:0] into mem
            ALUSrc=1;//choose sign extend
            MemtoReg=0;
            RegWrite=0;
            MemRead=0;
            MemWrite=1;//store result into mem address
            Branch=0;
            ConBranch=0;
            ldurb=0;
            sturb=0;           
        end

        11'b11111000010://ldur
        begin
            ALUop=3'b101;//alu result=data1+sign extend
            signextend=instruction[20:10];//select [20:10] immediate offset address
            Reg2Loc=1;//......
            ALUSrc=1;//choose sign extend
            MemtoReg=1;//read data in mem address
            RegWrite=0;
            MemRead=1;//read data in mem address
            MemWrite=0;
            Branch=0;
            ConBranch=0;
            ldurb=0;
            sturb=0;           
        end

        11'b00111000000://sturb
        begin
            ALUop=3'b101;//alu result=data1+sign extend
            signextend=instruction[20:10];//select [20:10] immediate offset address
            Reg2Loc=1;//write regdata [4:0] into mem
            ALUSrc=1;//choose sign extend
            MemtoReg=0;
            RegWrite=0;
            MemRead=0;
            MemWrite=1;//store result into mem address
            Branch=0;
            ConBranch=0;
            ldurb=0;
            sturb=1;           
        end

        11'b00111000010://ldurb
        begin
            ALUop=3'b101;//alu result=data1+sign extend
            signextend=instruction[20:10];//select [20:10] immediate offset address
            Reg2Loc=1;//......
            ALUSrc=1;//choose sign extend
            MemtoReg=1;//read data in mem address
            RegWrite=0;
            MemRead=1;//read data in mem address
            MemWrite=0;
            Branch=0;
            ConBranch=0;
            ldurb=1;
            sturb=0;           
        end


        endcase

    
    end        


    
endmodule