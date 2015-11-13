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
	
	always@(posedge clk)
	begin
		
	end
endmodule
