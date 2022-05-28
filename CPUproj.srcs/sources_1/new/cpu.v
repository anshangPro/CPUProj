`timescale 1ns / 1ps

//The top module of the cpu design

//TODO:add rst signal

module cpu(input fpga_rst,
           input fpga_clk,           //The clock of the FPGA
           input mode_switch,        // mode switch  
           input rx,                 //receive data
           output tx,                //output to the uart
           input [23:0]sw,
           output [23:0]led
);
        //        output [7:0] seg_out,
        //    output [7:0] seg_en
    wire [23:0] led_in;
    wire clk_out;
    wire low_clk; // This wire is used to pass the low frequency clock
    // wire [31:0] data; // This wire is used to pass the data to display
    wire upg_clk_10mhz;
    
    cpuclk clk(.clk_in1(fpga_clk),.clk_out1(clk_out), .clk_out2(upg_clk_10mhz));
    
    //This code is intended to get a lower frequency clock
    
    // reg[31:0] low_clk_reg;
    // always @(posedge clk_out) begin
    //     low_clk_reg = low_clk_reg+1;
    // end
    // assign low_clk = low_clk_reg[2];
    
    // segment seg(
    //     .clk(low_clk_reg[12]),.rst(fpga_rst),.in(data),.segment_led(seg_out),.seg_en(seg_en)
    //     );

    // ifetch
    wire[31:0] instruction, branch_base_addr, link_addr;
    // controller
    wire Jr, RegDST, ALUSrc, MemtoReg, RegWrite, MemWrite, Branch, nBranch, Jmp, Jal, I_format, Sftmd;
    wire[1:0] ALUOp;
    // decoder
    wire[31:0] read_data_1, read_data_2, Sign_extend;
    // alu
    wire Zero;
    wire[31:0] ALU_Result, Addr_Result;
    // data RAM
    wire[31:0] data_from_ram;
    //uart    TODO   upg_rst_i define
    reg mode; // UPG reset (Active High)  low means uart mode
    wire upg_clk_i; // UPG ram_clk_i (10MHz)
    wire upg_wen_i; // UPG write enable
    wire [14:0] upg_adr_i; // UPG write address
    wire [31:0] upg_dat_i; // UPG write data
    wire upg_done_i; // 1 if programming is finished

    debounce rst_debounce(fpga_clk, fpga_rst, mode_switch, mode_stable);
    

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
        .Addr_result(Addr_Result), .Zero(Zero), // from alu
        .Read_data_1(read_data_1), // from decoder
        .Branch(Branch), .nBranch(nBranch), .Jmp(Jmp), .Jal(Jal), .Jr(Jr), // from controller
        .upg_rst_i(mode), .upg_clk_i(upg_clk_i), .upg_wen_i(upg_wen_i & (!upg_adr_i[14])), .upg_adr_i(upg_adr_i[13:0]), .upg_dat_i(upg_dat_i), .upg_done_i(upg_done_i) // from uart
        ); 

    // controller
    control32 controller(
        .Opcode(instruction[31:26]), .Function_opcode(instruction[5:0]), // from ifetch
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
        .Zero(Zero), .ALU_Result(ALU_Result), .Addr_Result(Addr_Result),
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
        .sw(sw), .led(led_in)
        );
    
    
endmodule
