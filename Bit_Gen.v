`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:27 11/21/2015 
// Design Name: 
// Module Name:    Bit_Gen 
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
module Bit_Gen(
	 input NineMHz,
    input [9:0] h_count,
    input [8:0] v_count,
	 input [15:0] port_b_out,
	 output reg [14:0] port_b_address,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
    );
	 
	 reg set = 0;
	
	always@(NineMHz)
	begin
		set <= ~set;
		if(set == 1'b1)
		begin
			port_b_address <= port_b_out + 720;		//Set address to glyph data
		end
		else
		begin
			red <= port_b_out[15:11];
			green <= port_b_out[10:6];
			blue <= port_b_out[5:0];
			port_b_address <= h_count[9:3] + (v_count[8:4] * 60); //Set address to 0-720 for each glyph
		end
	end
endmodule
