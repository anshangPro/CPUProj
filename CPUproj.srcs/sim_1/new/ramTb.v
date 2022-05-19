`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/20 14:44:16
// Design Name: 
// Module Name: ramTb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ramTb( );
reg clock = 1'b0;
reg memWrite = 1'b0;
reg [31:0] addr = 32'h0000_0010;
reg [31:0] writeData = 32'ha000_0000;
wire [31:0] readData;
dmemory32 uram
(.clock(clock),.memWrite(memWrite),.address(addr),.writeData(writeData),.readData(readData));

always #50 clock = ~clock;

initial fork
#120 memWrite = 1'b1;             //0+120
#200 writeData = 32'h0000_00f5;   //0+200
#400 memWrite = 1'b0;             //0+400
// ... to be completed
join


endmodule