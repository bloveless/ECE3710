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
    input [9:0] h_count,
    input [8:0] v_count,
	 input [15:0] port_b_out,
	 output reg [14:0] port_b_address,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
    );

	initial
	begin
		port_b_address = 0;
	end

	always@(*)
	begin
		if(h_count[3] ^ v_count[4])
		begin
			red = {8{port_b_out[0]}};
			green = {8{port_b_out[1]}};
			blue = {8{port_b_out[2]}};
		end
		else
		begin
			red = {8{~port_b_out[0]}};
			green = {8{~port_b_out[1]}};
			blue = {8{~port_b_out[2]}};
		end
	end
endmodule
