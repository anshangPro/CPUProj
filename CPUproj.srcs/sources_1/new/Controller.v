`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 15:08:39
// Design Name: 
// Module Name: Controller
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


module control32(
    input[5:0] Opcode, // instruction[31..26], opcode
    input[5:0] Function_opcode, // instructions[5..0], funct
    input[4:0] RD_id, // instructions[15..11], rd_id
    output Jr, // 1 indicates the instruction is "jr", otherwise it's not "jr" output Jmp; // 1 indicate the instruction is "j", otherwise it's not
    output RegDST, // 1 indicate destination register is "rd"(R),otherwise it's "rt"(I)
    output ALUSrc, // 1 indicate the 2nd data is immidiate (except "beq","bne")
    output MemtoReg, // 1 indicate read data from memory and write it into register
    output RegWrite, // 1 indicate write register(R,I(lw)), otherwise it's not
    output MemWrite, // 1 indicate write data memory, otherwise it's not
    output Branch, // 1 indicate the instruction is "beq" , otherwise it's not
    output nBranch, // 1 indicate the instruction is "bne", otherwise it's not
    output Jmp, // �?1表明是J指令, �?0时表示不是J指令
    output Jal, // 1 indicate the instruction is "jal", otherwise it's not
    output I_format, // �?1表明该指令是除beq, bne, LW, SW之外的其他I-类型指令
    output Sftmd, // 1 indicate the instruction is shift 
    output[1:0] ALUOp // 是R-类型或I_format=1时位1（高bit位）�?1,  beq、bne指令则位0（低bit位）�?1
    );

    assign Jr = (Function_opcode == 6'b001000 || (Function_opcode == 6'b001001 && RD_id == 5'b0)) & (Opcode == 0);
    assign RegDST = (Opcode == 0);
    assign ALUSrc = (Opcode[5:3] == 3'b001) | (Opcode == 6'b100011) | (Opcode == 6'b101011); // algorithm + lw, sw
    assign MemtoReg = Opcode == 6'b100011;
    assign RegWrite = (Opcode == 0 & Function_opcode != 6'b001000) | (Opcode == 6'b100011) | (Opcode[5:3] == 3'b001) | (Opcode == 6'b000011);
    assign MemWrite = Opcode == 6'b101011;
    assign Branch = (Opcode == 6'b000100);
    assign nBranch = (Opcode == 6'b000101);
    assign Jal = (Opcode == 6'b000011);
    assign Jmp = (Opcode == 6'b000010);
    assign I_format = (Opcode[5:3] == 3'b001);
    assign Sftmd = ((Function_opcode[5:3] == 3'b000) & (Opcode == 0));
    assign ALUOp = {((Opcode == 0) | I_format), ((Opcode == 6'b000100) | (Opcode == 6'b000101))};

endmodule
