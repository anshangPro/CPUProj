`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 14:33:56
// Design Name: 
// Module Name: ALU
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


module executs32(Read_data_1,Read_data_2,Sign_extend,Function_opcode,Exe_opcode,ALUOp,
                 Shamt,ALUSrc,I_format,Zero,Jr,Sftmd,ALU_Result,Addr_Result,PC_plus_4
                 );
    //from Decoder
    input[31:0]  Read_data_1;		// 从译码单元的Read_data_1中来
    input[31:0]  Read_data_2;		// 从译码单元的Read_data_2中来
    input[31:0]  Sign_extend;		// 从译码单元来的扩展后的立即数

    //from Ifetch
    input[5:0]   Function_opcode;  	// 取指单元来的r-类型指令功能码,r-form instructions[5:0]
    input[5:0]   Exe_opcode;  		// 取指单元来的操作码 instruction[31:26]
    input[31:0]  PC_plus_4;         // 来自取指单元的PC+4
    input[4:0]   Shamt;             // 来自取指单元的instruction[10:6]，指定移位次数

    //from controller
    //  结果需要返回寄存器                           是否属于跳转指令
    //是R-类型或I_format=1时位1（高bit位）为1,  beq、bne指令则位0（低bit位）为1
    input[1:0]   ALUOp;             // 来自控制单元的运算指令控制编码
    input  		 Sftmd;            // 来自控制单元的，表明是移位指令
    input        ALUSrc;            // 来自控制单元，表明第二个操作数是立即数（beq，bne除外）
    input        I_format;          // 来自控制单元，表明是除beq, bne, LW, SW之外的I-类型指令
    input        Jr;               // 来自控制单元，表明是JR指令

    //output
    output       Zero;              // 为1表明计算值为0 
    output reg[31:0] ALU_Result;        // 计算的数据结果
    output [31:0] Addr_Result;		// 计算的地址结果   
  
    reg[31:0] ALU_output_mux;
    wire[5:0] Exe_code;
    wire[2:0] ALU_ctl;
    wire[31:0] Ainput, Binput;
    wire[2:0] Sftm;
    reg[31:0] Shift_Result; //the result of shift operation

    assign Exe_code = (I_format==0) ? Function_opcode : { 3'b000 , Exe_opcode[2:0] };
    assign ALU_ctl[0] = (Exe_code[0] | Exe_code[3]) & ALUOp[1]; 
    assign ALU_ctl[1] = ((!Exe_code[2]) | (!ALUOp[1])); 
    assign ALU_ctl[2] = (Exe_code[1] & ALUOp[1]) | ALUOp[0];
    assign Ainput = Read_data_1; 
    assign Binput = (ALUSrc==0) ? Read_data_2 : Sign_extend;
    assign Sftm = Function_opcode[2:0]; //the code of shift operations
    assign Zero = (ALU_output_mux == 0);
    assign Addr_Result = (Sign_extend << 2) + PC_plus_4;

    always @(ALU_ctl or Ainput or Binput) begin
        case(ALU_ctl)
            3'b000: begin // and  andi
                ALU_output_mux = Ainput & Binput;
            end
            3'b001: begin // or  ori
                ALU_output_mux = Ainput | Binput;
            end
            3'b010: begin // add  addi
                ALU_output_mux = $signed(Ainput) + $signed(Binput);
            end
            3'b011: begin // addu addiu
                ALU_output_mux = $unsigned(Ainput) + $unsigned(Binput);
            end
            3'b100: begin // xor xori
                ALU_output_mux = Ainput ^ Binput;
            end
            3'b101: begin // nor lui
                ALU_output_mux = ~(Ainput | Binput);
            end
            3'b110: begin // sub slti
                ALU_output_mux = $signed(Ainput) - $signed(Binput);
                // if (I_format) begin
                //     ALU_output_mux = {31'b0, ALU_output_mux[31]};
                // end
            end
            3'b111: begin
                ALU_output_mux = $unsigned(Ainput) - $unsigned(Binput);
                // case(Exe_opcode[3:0])
                //     4'b0011: begin // subu sltiu
                //         ALU_output_mux =  $unsigned(Ainput) - $unsigned(Binput);
                //         if (I_format) begin
                //             ALU_output_mux = (Ainput < Sign_extend | Ainput == Sign_extend) ? 32'b1 : 32'b0;
                //         end
                //     end
                //     4'b1010: begin // slt
                //         ALU_output_mux = (($signed(Ainput) < $signed(Read_data_2)) | ($signed(Ainput) == $signed(Read_data_2))) ? 32'b1 : 32'b0;
                //     end
                //     4'b1011: begin // sltu
                //         ALU_output_mux = (Ainput < Sign_extend | Ainput == Sign_extend) ? 32'b1 : 32'b0;
                //     end
                // endcase
            end
            default: ALU_output_mux = 0;
        endcase
    end


    always @* begin
        if(Sftmd)
            case(Sftm[2:0])
                3'b000:Shift_Result = Binput << Shamt; //Sll rd,rt,shamt 00000
                3'b010:Shift_Result = Binput >> Shamt; //Srl rd,rt,shamt 00010
                3'b100:Shift_Result = Binput << Ainput; //Sllv rd,rt,rs 00010
                3'b110:Shift_Result = Binput >> Ainput; //Srlv rd,rt,rs 00110
                3'b011:Shift_Result = $signed(Binput) >>> Shamt; //Sra rd,rt,shamt 00011
                3'b111:Shift_Result = $signed(Binput) >>> Ainput; //Srav rd,rt,rs 00111
                default:Shift_Result = Binput;
            endcase
        else
            Shift_Result = Binput;
    end

    always @* begin
        //set type operation (slt, slti, sltu, sltiu)
        if( ((ALU_ctl==3'b111) && (Exe_code[3]==1)) || (I_format && (ALU_ctl[2:1]==2'b11)))
            ALU_Result = ($signed(Ainput) - $signed(Binput)<0) ? 1 : 0;
        // //lui operation
        else if((ALU_ctl==3'b101) && (I_format==1))
            ALU_Result[31:0]= {Sign_extend, 16'b0};
        //shift operation
        else if(Sftmd)
            ALU_Result = Shift_Result;
        //other types of operation in ALU (arithmatic or logic calculation)
        else
            ALU_Result = ALU_output_mux;
    end
endmodule
