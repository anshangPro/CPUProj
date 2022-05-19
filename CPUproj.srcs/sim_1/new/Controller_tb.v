`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 13:59:05
// Design Name: 
// Module Name: Controller_tb
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


module Controller_tb();

reg [5:0] op;
reg [5:0] func;
wire jr, jal, branch, nbranch, regdst, memtoreg, regwrite, memwrite, alusrc, sftmd, jmp, i_format;
wire [1:0] aluop;

control32 test(.Opcode(op), .Function_opcode(func), .Jr(jr), .Jal(jal), .Branch(branch), .nBranch(nbranch), .RegDST(regdst), 
.MemtoReg(memtoreg), .RegWrite(regwrite), .MemWrite(memwrite), .ALUSrc(alusrc), .Sftmd(sftmd), .Jmp(jmp), .ALUOp(aluop), .I_format(i_format)
);

initial begin
    #0; 
    op = 6'h00;
    func = 6'h20;
    #200;
    op = 6'h00;
    func = 6'h08;
    #200;
    op = 6'h08;
    func = 6'h08;
    #200;
    op = 6'h023;
    func = 6'h08;
    #200;
    op = 6'h2b;
    func = 6'h08;
    #200;
    op = 6'h04;
    func = 6'h08;
    #200;
    op = 6'h05;
    func = 6'h08;
    #200;
    op = 6'h02;
    func = 6'h08;
    #200;
    op = 6'h03;
    func = 6'h08;
    #200;
    op = 6'h00;
    func = 6'h02;
end

endmodule
