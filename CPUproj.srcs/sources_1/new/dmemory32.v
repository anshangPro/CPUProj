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


module dmemory32(readData,address,writeData,memWrite,clock, upg_rst_i, upg_clk_i, upg_wen_i, upg_adr_i, upg_dat_i, upg_done_i, sw, led, rst, enter, key_value, seg_data);
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

input enter;

input [3:0] key_value;
output reg[63:0] seg_data;
reg [31:0] seg_reg;

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
    if (rst) begin
        led = 0;
        seg_reg = 0;
    end
    else 
    if (outter & memWrite) begin
        case (address)
            32'hffffff00: led = kickOff ? writeData : upg_dat_i;
            32'hffffff0f: seg_reg = kickOff ? writeData : upg_dat_i;
            default: begin
                led = led;
                seg_reg = seg_reg;
            end
        endcase
    end
end

always @* begin
    case (address)
        32'hffffffff: readData = {31'b0, enter};
        32'hfffffff0: readData = {8'b0, sw};
        32'hffffff00: readData = {8'b0, led};
        32'hfffff000: readData = {28'b0, key_value};
        32'hffffff0f: readData = seg_reg;
        default: readData = readDataMem;
    endcase
end

always @(seg_reg) begin
    case(seg_reg[3:0])
            4'h0: seg_data[7:0]=8'b1100_0000;  // 0
            4'h1: seg_data[7:0]=8'b1111_1001;  // 1
            4'h2: seg_data[7:0]=8'b1010_0100;  // 2
            4'h3: seg_data[7:0]=8'b1011_0000;  // 3
            4'h4: seg_data[7:0]=8'b1001_1001;  // 4
            4'h5: seg_data[7:0]=8'b1001_0010;  // 5
            4'h6: seg_data[7:0]=8'b1000_0010;  // 6
            4'h7: seg_data[7:0]=8'b1111_1000;  // 7
            4'h8: seg_data[7:0]=8'b1000_0000;  // 8
            4'h9: seg_data[7:0]=8'b1001_0000;  // 9
            4'hA: seg_data[7:0]=8'b1000_1000;  // A
            4'hB: seg_data[7:0]=8'b1000_0011;  // B
            4'hC: seg_data[7:0]=8'b1100_0110;  // C
            4'hD: seg_data[7:0]=8'b1010_0001;  // D
            4'hE: seg_data[7:0]=8'b1000_0110;  // E
            4'hF: seg_data[7:0]=8'b1000_1110;  // F
        endcase
        case(seg_reg[7:4])
            4'h0: seg_data[15:8]=8'b1100_0000;  // 0
            4'h1: seg_data[15:8]=8'b1111_1001;  // 1
            4'h2: seg_data[15:8]=8'b1010_0100;  // 2
            4'h3: seg_data[15:8]=8'b1011_0000;  // 3
            4'h4: seg_data[15:8]=8'b1001_1001;  // 4
            4'h5: seg_data[15:8]=8'b1001_0010;  // 5
            4'h6: seg_data[15:8]=8'b1000_0010;  // 6
            4'h7: seg_data[15:8]=8'b1111_1000;  // 7
            4'h8: seg_data[15:8]=8'b1000_0000;  // 8
            4'h9: seg_data[15:8]=8'b1001_0000;  // 9
            4'hA: seg_data[15:8]=8'b1000_1000;  // A
            4'hB: seg_data[15:8]=8'b1000_0011;  // B
            4'hC: seg_data[15:8]=8'b1100_0110;  // C
            4'hD: seg_data[15:8]=8'b1010_0001;  // D
            4'hE: seg_data[15:8]=8'b1000_0110;  // E
            4'hF: seg_data[15:8]=8'b1000_1110;  // F
        endcase
        case(seg_reg[11:8])
            4'h0: seg_data[23:16]=8'b1100_0000;  // 0
            4'h1: seg_data[23:16]=8'b1111_1001;  // 1
            4'h2: seg_data[23:16]=8'b1010_0100;  // 2
            4'h3: seg_data[23:16]=8'b1011_0000;  // 3
            4'h4: seg_data[23:16]=8'b1001_1001;  // 4
            4'h5: seg_data[23:16]=8'b1001_0010;  // 5
            4'h6: seg_data[23:16]=8'b1000_0010;  // 6
            4'h7: seg_data[23:16]=8'b1111_1000;  // 7
            4'h8: seg_data[23:16]=8'b1000_0000;  // 8
            4'h9: seg_data[23:16]=8'b1001_0000;  // 9
            4'hA: seg_data[23:16]=8'b1000_1000;  // A
            4'hB: seg_data[23:16]=8'b1000_0011;  // B
            4'hC: seg_data[23:16]=8'b1100_0110;  // C
            4'hD: seg_data[23:16]=8'b1010_0001;  // D
            4'hE: seg_data[23:16]=8'b1000_0110;  // E
            4'hF: seg_data[23:16]=8'b1000_1110;  // F
        endcase
        case(seg_reg[15:12])
            4'h0: seg_data[31:24]=8'b1100_0000;  // 0
            4'h1: seg_data[31:24]=8'b1111_1001;  // 1
            4'h2: seg_data[31:24]=8'b1010_0100;  // 2
            4'h3: seg_data[31:24]=8'b1011_0000;  // 3
            4'h4: seg_data[31:24]=8'b1001_1001;  // 4
            4'h5: seg_data[31:24]=8'b1001_0010;  // 5
            4'h6: seg_data[31:24]=8'b1000_0010;  // 6
            4'h7: seg_data[31:24]=8'b1111_1000;  // 7
            4'h8: seg_data[31:24]=8'b1000_0000;  // 8
            4'h9: seg_data[31:24]=8'b1001_0000;  // 9
            4'hA: seg_data[31:24]=8'b1000_1000;  // A
            4'hB: seg_data[31:24]=8'b1000_0011;  // B
            4'hC: seg_data[31:24]=8'b1100_0110;  // C
            4'hD: seg_data[31:24]=8'b1010_0001;  // D
            4'hE: seg_data[31:24]=8'b1000_0110;  // E
            4'hF: seg_data[31:24]=8'b1000_1110;  // F
        endcase
        case(seg_reg[19:16])
            4'h0: seg_data[39:32]=8'b1100_0000;  // 0
            4'h1: seg_data[39:32]=8'b1111_1001;  // 1
            4'h2: seg_data[39:32]=8'b1010_0100;  // 2
            4'h3: seg_data[39:32]=8'b1011_0000;  // 3
            4'h4: seg_data[39:32]=8'b1001_1001;  // 4
            4'h5: seg_data[39:32]=8'b1001_0010;  // 5
            4'h6: seg_data[39:32]=8'b1000_0010;  // 6
            4'h7: seg_data[39:32]=8'b1111_1000;  // 7
            4'h8: seg_data[39:32]=8'b1000_0000;  // 8
            4'h9: seg_data[39:32]=8'b1001_0000;  // 9
            4'hA: seg_data[39:32]=8'b1000_1000;  // A
            4'hB: seg_data[39:32]=8'b1000_0011;  // B
            4'hC: seg_data[39:32]=8'b1100_0110;  // C
            4'hD: seg_data[39:32]=8'b1010_0001;  // D
            4'hE: seg_data[39:32]=8'b1000_0110;  // E
            4'hF: seg_data[39:32]=8'b1000_1110;  // F
        endcase
        case(seg_reg[23:20])
            4'h0: seg_data[47:40]=8'b1100_0000;  // 0
            4'h1: seg_data[47:40]=8'b1111_1001;  // 1
            4'h2: seg_data[47:40]=8'b1010_0100;  // 2
            4'h3: seg_data[47:40]=8'b1011_0000;  // 3
            4'h4: seg_data[47:40]=8'b1001_1001;  // 4
            4'h5: seg_data[47:40]=8'b1001_0010;  // 5
            4'h6: seg_data[47:40]=8'b1000_0010;  // 6
            4'h7: seg_data[47:40]=8'b1111_1000;  // 7
            4'h8: seg_data[47:40]=8'b1000_0000;  // 8
            4'h9: seg_data[47:40]=8'b1001_0000;  // 9
            4'hA: seg_data[47:40]=8'b1000_1000;  // A
            4'hB: seg_data[47:40]=8'b1000_0011;  // B
            4'hC: seg_data[47:40]=8'b1100_0110;  // C
            4'hD: seg_data[47:40]=8'b1010_0001;  // D
            4'hE: seg_data[47:40]=8'b1000_0110;  // E
            4'hF: seg_data[47:40]=8'b1000_1110;  // F
        endcase
        case(seg_reg[27:24])
            4'h0: seg_data[55:48]=8'b1100_0000;  // 0
            4'h1: seg_data[55:48]=8'b1111_1001;  // 1
            4'h2: seg_data[55:48]=8'b1010_0100;  // 2
            4'h3: seg_data[55:48]=8'b1011_0000;  // 3
            4'h4: seg_data[55:48]=8'b1001_1001;  // 4
            4'h5: seg_data[55:48]=8'b1001_0010;  // 5
            4'h6: seg_data[55:48]=8'b1000_0010;  // 6
            4'h7: seg_data[55:48]=8'b1111_1000;  // 7
            4'h8: seg_data[55:48]=8'b1000_0000;  // 8
            4'h9: seg_data[55:48]=8'b1001_0000;  // 9
            4'hA: seg_data[55:48]=8'b1000_1000;  // A
            4'hB: seg_data[55:48]=8'b1000_0011;  // B
            4'hC: seg_data[55:48]=8'b1100_0110;  // C
            4'hD: seg_data[55:48]=8'b1010_0001;  // D
            4'hE: seg_data[55:48]=8'b1000_0110;  // E
            4'hF: seg_data[55:48]=8'b1000_1110;  // F
        endcase
        case(seg_reg[31:28])
            4'h0: seg_data[63:56]=8'b1100_0000;  // 0
            4'h1: seg_data[63:56]=8'b1111_1001;  // 1
            4'h2: seg_data[63:56]=8'b1010_0100;  // 2
            4'h3: seg_data[63:56]=8'b1011_0000;  // 3
            4'h4: seg_data[63:56]=8'b1001_1001;  // 4
            4'h5: seg_data[63:56]=8'b1001_0010;  // 5
            4'h6: seg_data[63:56]=8'b1000_0010;  // 6
            4'h7: seg_data[63:56]=8'b1111_1000;  // 7
            4'h8: seg_data[63:56]=8'b1000_0000;  // 8
            4'h9: seg_data[63:56]=8'b1001_0000;  // 9
            4'hA: seg_data[63:56]=8'b1000_1000;  // A
            4'hB: seg_data[63:56]=8'b1000_0011;  // B
            4'hC: seg_data[63:56]=8'b1100_0110;  // C
            4'hD: seg_data[63:56]=8'b1010_0001;  // D
            4'hE: seg_data[63:56]=8'b1000_0110;  // E
            4'hF: seg_data[63:56]=8'b1000_1110;  // F
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
