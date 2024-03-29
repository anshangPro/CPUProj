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
                 Shamt,ALUSrc,I_format,Jr,Sftmd,ALU_Result,Do_Branch,Branch_Address,PC_plus_4
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
    output reg    Do_Branch;              // 是否做branch跳转
    output [31:0] Branch_Address;		    // branch跳转的地址   
    output reg [31:0] ALU_Result;        // 计算的数据结果
  
    wire[5:0] Exe_code;
    assign Exe_code = (I_format==0) ? Function_opcode : { 3'b000 , Exe_opcode[2:0] };

    wire[2:0] ALU_ctl;
    assign ALU_ctl[0] = (Exe_code[0] | Exe_code[3]) & ALUOp[1]; 
    assign ALU_ctl[1] = ((!Exe_code[2]) | (!ALUOp[1])); 
    assign ALU_ctl[2] = (Exe_code[1] & ALUOp[1]) | ALUOp[0];

    wire[31:0] Ainput, Binput;
    assign Ainput = Read_data_1; 
    assign Binput = ALUSrc ? Sign_extend : Read_data_2; 


    reg[31:0] ALU_output_mux;
    always @(ALU_ctl or Ainput or Binput or I_format) begin
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
                if (I_format)
                        ALU_output_mux = {Binput[15:0], 16'b0};
                else ALU_output_mux = ~(Ainput | Binput);
            end
            3'b110: begin // sub slti
                ALU_output_mux = $signed(Ainput) - $signed(Binput);
                // if (I_format) begin
                //     ALU_output_mux = {31'b0, ALU_output_mux[31]};
                // end
            end
            3'b111: begin
                if (Function_opcode == 6'b101011)
                    ALU_output_mux = $unsigned(Ainput) - $unsigned(Binput);
                else 
                    ALU_output_mux = $signed(Ainput) - $signed(Binput);
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

    wire[2:0] Sftm;
    assign Sftm = Function_opcode[2:0]; //the code of shift operations
    reg[31:0] Shift_Result; //the result of shift operation

    always @(Binput, Shamt, Ainput, Sftmd, Sftm) begin
        if(Sftmd) begin
            case(Sftm)
                3'b000:Shift_Result = Binput << Shamt; //Sll rd,rt,shamt 00000
                3'b010:Shift_Result = Binput >> Shamt; //Srl rd,rt,shamt 00010
                3'b100:Shift_Result = Binput << Ainput; //Sllv rd,rt,rs 00010
                3'b110:Shift_Result = Binput >> Ainput; //Srlv rd,rt,rs 00110
                3'b011:Shift_Result = $signed(Binput) >>> Shamt; //Sra rd,rt,shamt 00011
                3'b111:Shift_Result = $signed(Binput) >>> Ainput; //Srav rd,rt,rs 00111
                default:Shift_Result = Binput;
            endcase
        end else
            Shift_Result = Binput;
    end

    wire Slt_Op = ((ALU_ctl==3'b111) && (Exe_code[3]==1)) || (I_format && (ALU_ctl[2:1]==2'b11));
    always @* begin
        //set type operation (slt, slti, sltu, sltiu)
        if(Slt_Op)
            begin
            if(Function_opcode[0] == 0) begin
                ALU_Result = $signed(Ainput) - $signed(Binput)<0;
            end
            else
                ALU_Result = $unsigned(Ainput) - $unsigned(Binput)<0;
        end
        // //lui operation
        else if((ALU_ctl==3'b101) && (I_format==1))
            ALU_Result[31:0]= ALU_output_mux;
        //shift operation
        else if(Sftmd)
            ALU_Result = Shift_Result;
        //other types of operation in ALU (arithmatic or logic calculation)
        else
            ALU_Result = ALU_output_mux;
    end

    assign Branch_Address = ($signed(Sign_extend) <<< 2) + PC_plus_4;
    // Branch, beq, bne, blez, bgtz
    always @* begin
        if (Exe_opcode[5:2] == 4'b0001) begin
            case(Exe_opcode[1:0])
                2'b00: Do_Branch = Read_data_1 == Read_data_2;
                2'b01: Do_Branch = ~(Read_data_1 == Read_data_2);
                2'b10: Do_Branch = $signed(Read_data_1) <= 0 ;
                2'b11: Do_Branch = $signed(Read_data_1) > 0;
            endcase
        end else begin
            Do_Branch = 0;
        end
    end

endmodule