`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:25 10/19/2020 
// Design Name: 
// Module Name:
// Project Name:
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: none
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module memrw(clk, data1, data2, out1, out2, out3, rst);

input clk, rst;
input [7:0] data1;
input [7:0] data2;
wire [7:0] data3;
output [7:0] out1;
output [7:0] out2;
output [7:0] out3;
reg [5:0] addr,out_addr;

block_ram_1 b1(clk, 1'b0, addr, data1, out1);
block_ram_2 b2(clk, 1'b0, addr, data2, out2);
assign data3 = out1 + out2;
block_ram_3 sum(clk, 1'b1, out_addr, data3, out3);

always @(posedge clk)
begin
	if (rst==1)
	addr = 6'b0;
	else
	addr = addr+1;
end

always @(addr)
	out_addr=addr-6'd1;

endmodule