`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/13 14:38:35
// Design Name: 
// Module Name: CPUmodule
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


module CPUmodule(
    input[5:0] op,
    input[5:0] func,
    output jr, jmp, jal, branch, nBranch, regdst, memToReg, regWrite, memWrite, ALUSrc, sftmd
    );
endmodule
