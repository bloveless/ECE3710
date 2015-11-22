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

	always@(NineMHz)
	begin
		if(NineMHz == 1'b0)
		begin
			port_b_address = (port_b_out * 128) + 1021 + h_count[2:0] + (v_count[3:0] * 8);		//Set address to glyph data
		end
		else
		begin
			red = {port_b_out[15:11],3'b1};
			green = {port_b_out[10:6],3'b1};
			blue = {port_b_out[5:0],2'b1};
			port_b_address = h_count[9:3] + (v_count[8:4] * 60); //Set address to 0-1020 for each glyph
		end
	end
	/*
	initial
	begin
		port_b_address = 0;
	end
	
	always@(*)
	begin
		if((h_count[9:3] + (v_count[8:4] * 60)) >= 510)
		begin
			if((h_count[2:0] + (v_count[3:0] * 8)) >= 64)
			begin
				red = 8'b11111111;
				green = 8'b00000000;
				blue = 8'b00000000;
			end
			else
			begin
				red = 8'b11111111;
				green = 8'b11111111;
				blue = 8'b00000000;
			end
		end
		else
		begin
			if((h_count[2:0] + (v_count[3:0] * 8)) >= 64)
			begin
				red = 8'b11111111;
				green = 8'b00000000;
				blue = 8'b11111111;
			end
			else
			begin
				red = 8'b00000000;
				green = 8'b11111111;
				blue = 8'b00000000;
			end
		end
	end
	*/
endmodule
