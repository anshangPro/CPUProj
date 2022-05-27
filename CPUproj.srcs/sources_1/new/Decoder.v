`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 15:50:15
// Design Name: 
// Module Name: Decoder
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
//     1. register read
//     2. register write   -> include the register module
//     3. Instruction[15:0] expand
//////////////////////////////////////////////////////////////////////////////////


module decode32(read_data_1,read_data_2,Instruction,mem_data,ALU_result,
                 Jal,RegWrite,MemtoReg,RegDst,Sign_extend,clock,reset,opcplus4,
                 t1, t2, t3);

    output [31:0] read_data_1;               // 输出的第一操作数
    output [31:0] read_data_2;               // 输出的第二操作数
    input[31:0]  Instruction;               // 取指单元来的指令
    input[31:0]  mem_data;   				//  从DATA RAM or I/O port取出的数据
    input[31:0]  ALU_result;   				// 从执行单元来的运算的结果
    input        Jal;                       //  来自控制单元，说明是JAL指令 
    input        RegWrite;                  // 来自控制单元
    input        MemtoReg;                  // 来自控制单元
    input        RegDst;             
    output reg[31:0] Sign_extend;               // 扩展后的32位立即数
    input		 clock,reset;                // 时钟和复位
    input[31:0]  opcplus4;                 // 来自取址单元，JAL中用

    reg[31:0] register[31:0];
    integer iTemp;

    output wire[31:0] t1, t2, t3;
    assign t1 = register[9];
    assign t2 = register[10];
    assign t3 = register[11];

    // register write
    always @(posedge clock, posedge reset) begin
        if(reset) begin
            for(iTemp = 0; iTemp < 32; iTemp = iTemp+1) begin
                register[iTemp] = 0;
            end
        end else if(Jal) begin
            register[31] = opcplus4;
        end else if(RegWrite) begin
            register[RegDst ? Instruction[15:11] : Instruction[20:16]] = MemtoReg ? mem_data: ALU_result;
        end
    end

    always @* begin
        if(!RegDst) begin
            if(Instruction[31:29] != 3'b001 | Instruction[28:26] == 3'b000 | Instruction[28:26] == 3'b010) begin
                Sign_extend = {{16{Instruction[15]}}, Instruction[15:0]};
            end else begin
                Sign_extend = {16'b0, Instruction[15:0]};
            end
        end  else begin
            Sign_extend = 0;
        end
    end

    // 0拓展
    // else if(Instruction[28:26] == 3'b111) begin
    //             Sign_extend = {Instruction[15:0], 16'b0};
    //         end 
    

    // assign Sign_extend = (6'b001100 == Instruction[31:26] || 6'b001101 == Instruction[31:26] )?{{16{1'b0}}, Instruction[15:0]}:{{16{Instruction[15]}}, Instruction[15:0]};

    // always @(posedge clock, posedge reset) begin
    //     read_data_1 = register[Instruction[25:21]];
    //     read_data_2 = register[Instruction[20:16]];
    // end

    assign read_data_1 = register[Instruction[25:21]];
    assign read_data_2 = register[Instruction[20:16]];
endmodule
