`timescale 1ns / 1ps

//The top module of the cpu design

//TODO:add rst signal

module cpu(input fpga_rst,
           input fpga_clk,           //The clock of the FPGA
           input mode_switch,        // mode switch  
           input rx,                 //receive data
           output tx,                //output to the uart
           input [23:0]sw,
           output [23:0]led,
           output [7:0] seg_en,             //七段数码显示管
           output [7:0] seg_out,
           input [3:0] row,                 //矩阵键盘输入
           output [3:0] col,                //矩阵键盘输出
           input enter               //used to enter data
);
        //        output [7:0] seg_out,
        //    output [7:0] seg_en
    wire [23:0] led_in;
    wire clk_out;
    wire low_clk; // This wire is used to pass the low frequency clock
    // wire [31:0] data; // This wire is used to pass the data to display
    wire upg_clk_10mhz;
    
    cpuclk clk(.clk_in1(fpga_clk),.clk_out1(clk_out), .clk_out2(upg_clk_10mhz));

    // ifetch
    wire[31:0] instruction, branch_base_addr, link_addr;
    // controller
    wire Jr, RegDST, ALUSrc, MemtoReg, RegWrite, MemWrite, Branch, nBranch, Jmp, Jal, I_format, Sftmd;
    wire[1:0] ALUOp;
    // decoder
    wire[31:0] read_data_1, read_data_2, Sign_extend;
    // alu
    wire Do_Branch;
    wire[31:0] ALU_Result, Branch_Address;
    // data RAM
    wire[31:0] data_from_ram;
    //uart    TODO   upg_rst_i define
    reg mode; // UPG reset (Active High)  low means uart mode
    wire upg_clk_i; // UPG ram_clk_i (10MHz)
    wire upg_wen_i; // UPG write enable
    wire [14:0] upg_adr_i; // UPG write address
    wire [31:0] upg_dat_i; // UPG write data
    wire upg_done_i; // 1 if programming is finished
    //keyboard
    wire [3:0] key_value;
    wire key_flag;
    //segment
    wire[63:0] seg_data;

    wire mode_stable, enter_stable;

    debounce rst_debounce(upg_clk_10mhz, fpga_rst, mode_switch, mode_stable);
    debounce enter_debounce(upg_clk_10mhz, fpga_rst, enter, enter_stable);
    // exciting enter_exciting(clk_out, enter_stable, enter_short);

    always @(posedge mode_stable) begin
    mode = mode + 1;
    end

    assign led = mode ? led_in : {1'b1, 21'b0, rx, upg_done_i};
    // assign led = led_in;

    // uart
    uart_model uart(
        .upg_clk_i(upg_clk_10mhz), .upg_rst_i(mode), .upg_rx_i(rx),
        .upg_clk_o(upg_clk_i), .upg_wen_o(upg_wen_i), .upg_adr_o(upg_adr_i), .upg_dat_o(upg_dat_i),
        .upg_done_o(upg_done_i), .upg_tx_o(tx)
    );

    // ifetch module
    Ifetc32 ifetch(
        .clock(clk_out), .reset(fpga_rst | ~mode),
        .Instruction(instruction), .branch_base_addr(branch_base_addr), .link_addr(link_addr), 
        .Branch_Address(Branch_Address), .Do_Branch(Do_Branch), // from alu, branch & branch&addr
        .Read_data_1(read_data_1), // from decoder
        .Branch(Branch), .nBranch(nBranch), .Jmp(Jmp), .Jal(Jal), .Jr(Jr), // from controller
        .upg_rst_i(mode), .upg_clk_i(upg_clk_i), .upg_wen_i(upg_wen_i & (!upg_adr_i[14])), .upg_adr_i(upg_adr_i[13:0]), .upg_dat_i(upg_dat_i), .upg_done_i(upg_done_i) // from uart
        ); 

    // controller
    control32 controller(
        .Opcode(instruction[31:26]), .Function_opcode(instruction[5:0]), .RD_id(instruction[15:11]), // from ifetch
        .Jr(Jr), .RegDST(RegDST), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemWrite(MemWrite),
        .Branch(Branch), .nBranch(nBranch), .Jmp(Jmp), .Jal(Jal), .I_format(I_format), .Sftmd(Sftmd), .ALUOp(ALUOp)
        );

    // decoder
    decode32 decoder(
        .clock(clk_out), .reset(fpga_rst | ~mode),
        .read_data_1(read_data_1), .read_data_2(read_data_2), .Sign_extend(Sign_extend),
        .Instruction(instruction), .opcplus4(link_addr), // from ifetch
        .mem_data(data_from_ram), // from data ram
        .ALU_result(ALU_Result), // from alu
        .Jal(Jal), .RegWrite(RegWrite), .MemtoReg(MemtoReg), .RegDst(RegDST) // from controller
        );

    // alu
    executs32 alu(
        .Do_Branch(Do_Branch), .ALU_Result(ALU_Result), .Branch_Address(Branch_Address),
        .Read_data_1(read_data_1), .Read_data_2(read_data_2), .Sign_extend(Sign_extend), // from decoder
        .Function_opcode(instruction[5:0]), .Exe_opcode(instruction[31:26]), .PC_plus_4(branch_base_addr), .Shamt(instruction[10:6]), // from ifetch
        .ALUOp(ALUOp), .Sftmd(Sftmd), .ALUSrc(ALUSrc), .I_format(I_format), .Jr(Jr) // from controller
        );

    //datamemory
    dmemory32 dataRAM(
        .clock(clk_out), .rst(fpga_rst),
        .readData(data_from_ram),
        .address(ALU_Result), // from alu   rs + imm(sigined)
        .writeData(read_data_2), // from decoder
        .memWrite(MemWrite), // from controller
        .upg_rst_i(mode), .upg_clk_i(upg_clk_i), .upg_wen_i(upg_wen_i & upg_adr_i[14]), .upg_adr_i(upg_adr_i[13:0]), .upg_dat_i(upg_dat_i), .upg_done_i(upg_done_i), // from uart
        .sw(sw), .led(led_in), .enter(enter_stable),
        .key_value(key_value), .seg_data(seg_data)
        );

    //segments
    seg segment(.clk(fpga_clk), .rst(fpga_rst | ~mode), .seg_in(seg_data), .seg_en(seg_en), .seg_out(seg_out));
    
    //矩阵键盘输入，flag为1时代表按下
    key_board key(fpga_clk, (fpga_rst | ~mode), row, col, key_value, key_flag);



endmodule
