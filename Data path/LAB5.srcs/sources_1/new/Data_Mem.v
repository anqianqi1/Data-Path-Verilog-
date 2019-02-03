`timescale 1ns / 1ps


module Data_Mem(clk,rst,WriteEnable,ReadEnable,Address,WriteData,ReadData,ldurb,sturb);
//module Data_Mem(clk,rst,WriteEnable,ReadEnable,Address,WriteData,ReadData,ldurb,sturb,memory_file);


input clk,rst,ldurb,sturb;
input WriteEnable,ReadEnable;
input [63:0] Address;
input [63:0] WriteData;
output reg [63:0] ReadData;

reg [63:0] memory_file[0:63];
integer i;

always@(ReadEnable)//read data
    begin
    if (ldurb)
        ReadData<=memory_file[Address][3:0];
    else
        ReadData<=memory_file[Address];
    end
    
always@(posedge clk)//write data
begin
    if(rst)
        for(i=0;i<64;i=i+1)
            memory_file[i]=64'b0;
        
    else if (WriteEnable==1)
    begin
        if (sturb)
            memory_file[Address]<=WriteData[3:0];
        else    
            memory_file[Address]<=WriteData;
    end    
end   
endmodule
