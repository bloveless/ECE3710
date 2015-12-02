`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:39 12/01/2015 
// Design Name: 
// Module Name:    Control_Test 
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
module Control_Test(
		output [6:0] seven_segment,
		output [3:0] enable,
		output [3:0] leds,
		output [7:0] tft_r,	//Red		A12, B12, A13, C13, A14, B14, F13, E13
		output [7:0] tft_g,	//Green  C8,  D8,  B9,  A9,  F9,  A11, G9,  B11
		output [7:0] tft_b,	//Blue	A4,  A5,  B4,  C5,  A6,  B6,  A7,  C7
		output tft_clk,			//clk to lcd. Should be 9.1 MHz	C10
		output tft_display, 	//High to turn on backlight (Should always be high)	C15
		output led_en,			//Screen brightness with PWM. Pulse 5 kHz for max brightness	C14
		output tft_en,			//Set low for sleep state. Should always be high.	D14
		output tft_de	//Set high for each row of pixels. Set low between rows.	A15

    );
	 
	 
	Control uut(
		.reset_btn(reset_btn),
		.clk(clk),
		.seven_segment(seven_segment),
		.enable(enable),
		.leds(leds),
		.tft_r(tft_r),	//Red		A12, B12, A13, C13, A14, B14, F13, E13
		.tft_g(tft_g),	//Green  C8,  D8,  B9,  A9,  F9,  A11, G9,  B11
		.tft_b(tft_b),	//Blue	A4,  A5,  B4,  C5,  A6,  B6,  A7,  C7
		.tft_clk(tft_clk),			//clk to lcd. Should be 9.1 MHz	C10
		.tft_display(tft_display), 	//High to turn on backlight (Should always be high)	C15
		.led_en(led_en),			//Screen brightness with PWM. Pulse 5 kHz for max brightness	C14
		.tft_en(tft_en),			//Set low for sleep state. Should always be high.	D14
		.tft_de(tft_de)	//Set high for each row of pixels. Set low between rows.	A15

	);
reg clk;
reg reset_btn;

always 
begin
	#1 clk=!clk;
end

initial 
begin
	clk =0;
	reset_btn =0;
  
end 
endmodule
