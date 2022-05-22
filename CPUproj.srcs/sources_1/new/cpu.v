`timescale 1ns / 1ps

//The top module of the cpu design

//TODO:add rst signal

module cpu(input fpga_rst,
           input fpga_clk,           //The clock of the FPGA
           input rx,                 //receive data
           output tx,                //output to the uart
           input [23:0]sw,
           output [23:0]led,
           output [7:0] seg_out,
           output [7:0] seg_en);
    
    wire clk_out;
    wire low_clk; // This wire is used to pass the low frequency clock
    wire [31:0] data; // This wire is used to pass the data to display
    
    cpuclk clk(.clk_in1(fpga_clk),.clk_out1(clk_out));
    
    //This code is intended to get a lower frequency clock
    
    reg[31:0] low_clk_reg;
    always @(posedge clk_out)low_clk_reg = low_clk_reg+1;
    assign low_clk                       = low_clk_reg[2];
    
    segment seg(.clk(low_clk_reg[12]),.rst(fpga_rst),.in(data),.segment_led(seg_out),.seg_en(seg_en));
    
    
    
endmodule
