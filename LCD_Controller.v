`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:18 11/12/2015 
// Design Name: 
// Module Name:    LCD_Controller 
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
    input [15:0] port_b_out,
	 input clk,
    output reg [14:0] port_b_address,
	 output reg [7:0] tft_r,	//Red		A12, B12, A13, C13, A14, B14, F13, E13
	 output reg [7:0] tft_g,	//Green  C8,  D8,  B9,  A9,  F9,  A11, G9,  B11
	 output reg [7:0] tft_b,	//Blue	A4,  A5,  B4,  C5,  A6,  B6,  A7,  C7
	 output reg tft_clk,			//clk to lcd. Should be 9.1 MHz	C10
	 output reg tft_display, 	//High to turn on backlight (Should always be high)	C15
	 output reg led_en,			//Screen brightness with PWM. Pulse 5 kHz for max brightness	C14
	 output reg tft_en,			//Set low for sleep state. Should always be high.	D14
	 output reg tft_de			//Set high for each row of pixels. Set low between rows.	A15
    );
	
	initial
	begin
		port_b_address = 0;
		tft_r = 8'b11111111;
		tft_g = 8'b11111111;
		tft_b = 8'b11111111;
		tft_clk = 0;
		tft_display = 0;
		led_en = 0;
		tft_en = 0;
		tft_de = 0;
	end
	
	reg [3:0]  nine_mhz_count = 0;
	reg [10:0] fifty_khz_count = 0;
	reg        power_up_state = 1;
	reg [24:0] power_up_clk = 0;
	reg [9:0]  h_count = 0;
	reg [8:0]  v_count = 0;
	
	reg de_control_1 = 0;
	reg de_control_2 = 1;
	always@(*)
	begin
		tft_de = de_control_1 & de_control_2;
	end
	
	//Run power-up then let tft_clk run at 9kHz and led_en run at 50kHz
	always@(clk)
	begin
		if(power_up_state == 0)
		begin
			//Run 9 MHz singal
			if(nine_mhz_count == 4'd11)
			begin
				nine_mhz_count = 0;
				tft_clk = ~tft_clk;
			end
			else
			begin
				nine_mhz_count = nine_mhz_count + 1;
			end
			
			//Run 50 kHz signal
			if(fifty_khz_count == 11'd2000)
			begin
				fifty_khz_count = 0;
				led_en = ~led_en;
			end
			else
			begin
				fifty_khz_count = fifty_khz_count + 1;
			end
		end
		//Run start up sequence
		else
		begin
			if(power_up_clk == 0)
			begin
				tft_en = 1;
				power_up_clk = power_up_clk + 1;
			end
			else if(power_up_clk == 25'd10000)
			begin
				de_control_1 = 1;
				tft_clk = 1;
				tft_display = 1;
				power_up_clk = power_up_clk + 1;
			end
			else if(power_up_clk == 25'd32010000)
			begin
				led_en = 1;
				power_up_state = 0;
			end
			else
			begin
				power_up_clk = power_up_clk + 1;
			end
		end
	end
	
	//Control row and pixel color here
	always@(posedge tft_clk)
	begin
		if(power_up_state == 0)
		begin
			if(h_count == 10'd524)
			begin
				h_count = 0;
				if(v_count == 9'd287)
				begin
					v_count = 0;
				end
				else
				begin
					v_count = v_count + 1;
				end
			end
			else
			begin
				h_count = h_count + 1;
			end
			if((h_count >= 10'd45) && (v_count >= 9'd16))
			begin
				de_control_2 = 1;
			end
			else
			begin
				de_control_2 = 0;
			end
		end
	end
endmodule
