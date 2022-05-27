`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/20 14:47:31
// Design Name: 
// Module Name: dmemory32
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


module dmemory32(readData,address,writeData,memWrite,clock, upg_rst_i, upg_clk_i, upg_wen_i, upg_adr_i, upg_dat_i, upg_done_i, sw, led, rst);
input rst;
input clock; // Clock signal
/* used to determine to write the memory unit or not,
in the left screenshot its name is ‘WE’ */
input memWrite;
// the address of memory unit which is tobe read/writen
input[31:0] address;
// data tobe wirten to the memory unit
input[31:0] writeData;
/*data to be read from the memory unit, in the left
screenshot its name is ‘MemData’ */
output reg[31:0] readData;

input [23:0] sw;
output reg[23:0] led;

// UART Programmer Pinouts
input upg_rst_i; // UPG reset (Active High)
input upg_clk_i; // UPG ram_clk_i (10MHz)
input upg_wen_i; // UPG write enable
input [13:0] upg_adr_i; // UPG write address
input [31:0] upg_dat_i; // UPG write data
input upg_done_i; // 1 if programming is finished

/*The clock is from CPU-TOP, suppose its one edge has been used at the upstream module of data memory, suchas IFetch, Why Data-Memroy DO NOT use the same edge as other module ? */
assign clk = !clock;

/* CPU work on normal mode when kickOff is 1. CPU work on Uart communicate mode whenkickOffis0.*/
wire kickOff = upg_rst_i | (~upg_rst_i &upg_done_i);
wire [31:0] readDataMem;
wire outter;
assign outter = (address[31:16] == 16'hffff); 

RAM ram (
.clka (kickOff ? clk : upg_clk_i),
.wea (kickOff ? (memWrite & ~outter) : upg_wen_i),
.addra (kickOff ? address[15:2] : upg_adr_i),
.dina (kickOff ? writeData : upg_dat_i),
.douta (readDataMem)
);

always @(posedge clock, posedge rst) begin
    if (rst) led = 0;
    else 
    if (outter & memWrite) begin
        case (address)
            32'hffffff00: led = kickOff ? writeData : upg_dat_i;
            default: led = led;
        endcase
    end
end

always @* begin
    case (address)
        32'hfffffff0: readData = {8'b0, sw};
        32'hffffff00: readData = {8'b0, led};
        default: readData = readDataMem;
    endcase
end

// RAM ram (
// .clka(clk), // input wire clka
// .wea(memWrite), // input wire [0 : 0] wea
// .addra(address[15:2]), // input wire [13 : 0] addra
// .dina(writeData), // input wire [31 : 0] dina
// .douta(readData) // output wire [31 : 0] douta
// );

endmodule
