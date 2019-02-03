`timescale 1ns / 1ps

module testData_Mem();

reg clk;
reg rst;
reg WriteEnable,ReadEnable;
reg [63:0] Address,WriteData;
wire [63:0] memory_file[0:63];
wire [63:0]ReadData;

Data_Mem a(clk,rst,WriteEnable,ReadEnable,Address,WriteData,ReadData);
//Data_Mem a(clk,rst,WriteEnable,ReadEnable,Address,WriteData,ReadData,memory_file);


always
#5 clk=~clk;

initial
begin
clk=1'b0;
rst=1'b0;
ReadEnable=1'b0;
WriteEnable=1'b0;
Address=64'b10;
WriteData=64'b100;

#10
//rst=1'b0;
WriteEnable=1'b1;
ReadEnable=1'b0;


#15
WriteEnable=1'b0;
ReadEnable=1'b1;

#25

$finish;
end


endmodule
