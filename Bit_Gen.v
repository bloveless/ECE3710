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
	 input clk,
    input [9:0] h_count,
    input [8:0] v_count,
	 input [15:0] port_b_out,
	 output reg [14:0] port_b_address,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
    );

	reg [2:0] state = 0;
	
	always@(posedge(clk))
	begin
		state <= state + 1;
	end

	always@(posedge(clk))
	begin
		if(state == 3'd2)
		begin
			port_b_address = (port_b_out * 128) + 1020 + h_count[2:0] + (v_count[3:0] * 8);		//Set address to glyph data
		end
		else if(state == 3'd0)
		begin
			port_b_address = h_count[9:3] + (v_count[8:4] * 60); //Set address to 0-1020 for each glyph
		end
		else if(state == 3'd4)
		begin
			red = {port_b_out[15:11],{3{port_b_out[11]}}};
			green = {port_b_out[10:6],{3{port_b_out[6]}}};
			blue = {port_b_out[5:0],{2{port_b_out[0]}}};
		end
	end
endmodule
