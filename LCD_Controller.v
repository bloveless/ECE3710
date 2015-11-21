`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:25 11/19/2015 
// Design Name: 
// Module Name:    LCD_Control 
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
module LCD_Controller(
	 input clk,
    input NineMHz,
    output reg [7:0] red,
    output reg[7:0] green,
    output reg [7:0] blue,
	 output tft_clk,
	 output reg tft_display,
	 output reg led_en,
	 output reg tft_en,
	 output tft_de
    );

	initial
	begin
		red = 8'b00000000;
		green = 8'b11111111;
		blue = 8'b00000000;
		tft_display = 0;
		tft_en = 1;
		led_en = 0;
	end

	reg [24:0] start_up_counter = 0;
	reg state = 0;
	reg [9:0]  h = 0;		//Horizontal pixel count that includes porches
	reg [8:0]  v = 0;		//Vertical pixel count that includes porches
	wire [9:0] h_count;	//Horizontal pixel count w/out porches (use this for glyph calculation)
	wire [8:0] v_count;	//Vertical pixel count w/out porches (use this for glyph calculation)
	reg clk_enable = 0;
	reg clk_high = 0;
	
	assign h_count = h - 10'd44;
	assign v_count = v - 9'd16;
	
	assign tft_clk = (NineMHz & clk_enable) | clk_high;
	reg de1 = 0;
	reg de2 = 1;
	assign tft_de = de1 & de2;

	always@(posedge(clk))
	begin
		if(state == 0)
		begin
			if(start_up_counter == 25'd5000000)
			begin
				clk_high = 1;
				tft_display = 1;
				de1 = 1;
			end
			else if(start_up_counter == 25'd21000000)
			begin
				led_en = 1;
				state = 1;
			end
			start_up_counter = start_up_counter + 1;
		end
		else
		begin
			clk_enable = 1;
			clk_high = 0;
		end
	end
	
	always@(posedge(NineMHz))
	begin
		if(state == 1)
		begin
			if(h == 10'd524)
			begin
				h = 0;
				if(v == 9'd287)
				begin
					v = 0;
				end
				else
				begin
					v = v + 1;
				end
			end
			else
			begin
				h = h + 1;
			end
			if((h >= 10'd45) && (v >= 9'd16))
			begin
				de2 = 1;
			end
			else
			begin
				de2 = 0;
			end
			if(h_count == 10'd0 || v_count == 9'd0)
			begin
				red = 8'b00000000;
				green = 8'b11111111;
				blue = 8'b00000000;
			end
			else
			begin
				red = 8'b11111111;
				green = 8'b00000000;
				blue = 8'b00000000;
			end
		end
	end
endmodule
