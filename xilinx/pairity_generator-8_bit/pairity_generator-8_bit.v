`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:5 3:03 10/06/2020 
// Design Name: 
// Module Name:    pairity_generator-8_bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pairity_generator_8_bit(
    input [7:0] in,
    output even_pairity_bit,
    output odd_pairity_bit
    );

	assign even_pairity_bit = ^in;
	assign odd_pairity_bit = ~even_pairity_bit;

endmodule
