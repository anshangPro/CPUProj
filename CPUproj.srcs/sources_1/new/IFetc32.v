`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/18 15:49:26
// Design Name: 
// Module Name: IFetc32
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


module Ifetc32(Instruction, branch_base_addr, link_addr, clock, reset, Addr_result, Read_data_1, Branch, nBranch, Jmp, Jal, Jr, Zero,
    upg_rst_i, upg_clk_i, upg_wen_i, upg_adr_i, upg_dat_i, upg_done_i, Next_PC, PC
);
output[31:0] Instruction; // the instruction fetched from this module
output[31:0] branch_base_addr; // (pc+4) to ALU which is used by branch type instruction
output reg[31:0] link_addr; // (pc+4) to Decoder which is used by jal instruction
input clock, reset; // Clock and reset

// from ALU
input[31:0] Addr_result; // the calculated address from ALU
input Zero; // while Zero is 1, it means the ALUresult is zero

// from Decoder
input[31:0] Read_data_1; // the address of instruction used by jr instruction

// from Controller
input Branch; // while Branch is 1,it means current instruction is beq
input nBranch; // while nBranch is 1,it means current instruction is bnq
input Jmp; // while Jmp 1, it means current instruction is jump
input Jal; // while Jal is 1, it means current instruction is jal
input Jr; // while Jr is 1, it means current instruction is jr

// UART Programmer Pinouts
input upg_rst_i; // UPG reset (Active High)
input upg_clk_i; // UPG clock (10MHz)
input upg_wen_i; // UPG write enable
input[13:0] upg_adr_i; // UPG write address
input[31:0] upg_dat_i; // UPG write data
input upg_done_i; // 1 if program finished

// 读出寄存器  posedge
// 访存       negedge
// 写回寄存器  posedge
// 更新PC     negedge

output reg[31:0] PC, Next_PC;

//assign link_addr = (Jal==1 ? PC + 4 : link_addr);
assign branch_base_addr = PC + 4;

always @* begin
    if(((Branch == 1) && (Zero == 1 )) || ((nBranch == 1) && (Zero == 0))) // beq, bne
        Next_PC = Addr_result; // the calculated new value for PC
    else if(Jr == 1)
        Next_PC = Read_data_1;  // the value of $31 register
    else Next_PC = PC + 4; // PC+4
end

always @(negedge clock) begin
    if(reset == 1) begin
        PC <= 32'h0000_0000;
        link_addr <= 0;
    end else begin
        if (Jmp == 1) 
            PC <= {PC[31:28], Instruction[25:0], 2'b00};
        else if (Jal == 1) begin
            PC <= {PC[31:28], Instruction[25:0], 2'b00};
            link_addr <= PC + 4;
        end else 
            PC <= Next_PC;
    end
end

wire kickOff = upg_rst_i | (~upg_rst_i &upg_done_i);

prgrom imem (
.clka (kickOff ? clock : upg_clk_i ),
.wea (kickOff ? 1'b0 : upg_wen_i ),
.addra (kickOff ? PC[15:2] : upg_adr_i ), .dina (kickOff ? 32'h00000000 : upg_dat_i ),.douta (Instruction)
);

// prgrom imem(.douta(Instruction), .addra(PC[15:2]), .clka(clock));
endmodule