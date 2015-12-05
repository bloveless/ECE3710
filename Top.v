`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:59 10/22/2015 
// Design Name: 
// Module Name:    Control 
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
`include "parameters.vh"

module Top(
		input wire reset_btn,
		input wire in_clk,
		input wire TP_PENIRQ, 
		input wire TP_BUSY, 
		input wire TP_DOUT, 
		output wire TP_CS, 
		output wire TP_DCLK, 
		output wire TP_DIN,
		output wire [7:0] wireless_data,
		output wire [6:0] seven_segment,
		output wire [3:0] enable,
		output wire [3:0] leds,
		output wire [7:0] red,	//Red		A12, B12, A13, C13, A14, B14, F13, E13
		output wire [7:0] green,	//Green  C8,  D8,  B9,  A9,  F9,  A11, G9,  B11
		output wire [7:0] blue,	//Blue	A4,  A5,  B4,  C5,  A6,  B6,  A7,  C7
		output wire tft_clk,			//clk to lcd. Should be 9.1 MHz	C10
		output wire tft_display, 	//High to turn on backlight (Should always be high)	C15
		output wire led_en,			//Screen brightness with PWM. Pulse 5 kHz for max brightness	C14
		output wire tft_en,			//Set low for sleep state. Should always be high.	D14
		output wire tft_de			//Set high for each row of pixels. Set low between rows.	A15
   );
	
   reg reset;
	
	wire clk;
	
	/* Inputs */
	// Memory
   wire [13:0] port_b_address;
   reg [15:0] port_b_in = 0;
   wire        port_a_we;
   reg        port_b_we = 0;
	// Reg File
	wire [3:0]  reg_write;
   wire [3:0]  reg_read_a;
   wire [3:0]  reg_read_b;
   wire        write_enable;
	// ALU
	reg [15:0] a;
   reg [15:0] b;
	
	
	/* Outputs */
	//touchScreen
	wire [11:0] X_POS;
	wire [11:0] Y_POS;
	wire [11:0] Z_POS;
	
	// Memory
	wire [15:0] port_a_out;
   wire [15:0] port_b_out;
	// Reg File
   wire [15:0] reg_a;
   wire [15:0] reg_b;
	// ALU
   wire [15:0] c;
   wire [4:0]  flags;
	wire [4:0] saved_flags;
	
	wire [13:0] pc_or_b;
	wire [15:0] c_or_mem;
	wire [15:0] alu_in;
	
	reg RST_I = 0;
	
	touchScreen #(.CLOCKFREQ(75)) 
		touchscreen(
		.CLK_I(clk), 
		.RST_I(RST_I),
		.PENIRQ_I(TP_PENIRQ), 
		.BUSY_I(TP_BUSY), 
		.DOUT_I(TP_DOUT),
		.CS_O(TP_CS), 
		.DCLK_O(TP_DCLK), 
		.DIN_O(TP_DIN), 
		.X_O(X_POS), 
		.Y_O(Y_POS),
		.Z_O(Z_POS)
	);
	
	Control cntl (
		.clk(clk),
		.port_a_out(port_a_out),
		.c(c),
		.flags(flags),
		.reg_a(reg_a),
		.reg_b(reg_b),
		.X_POS(X_POS),
		.Y_POS(Y_POS),
		.saved_flags(saved_flags),
		.wireless_data(wireless_data),
		.reg_read_a(reg_read_a),
		.reg_read_b(reg_read_b),
		.pc_or_b(pc_or_b),
		.c_or_mem(c_or_mem),
		.alu_in(alu_in),
		.port_a_we(port_a_we),
		.write_enable(write_enable),
		.reg_write(reg_write)
	);
	
	DCM dcm (
		.CLK_IN1(in_clk),
		.CLK_OUT1(clk)
	);
	
	Memory memory (
		.port_a_address(pc_or_b),
		.port_b_address(port_b_address),
		.port_a_in(c),
		.port_b_in(port_b_in),
		.port_a_we(port_a_we),
		.port_b_we(port_b_we),
		.clk(clk),
		.port_a_out(port_a_out),
		.port_b_out(port_b_out)
	);
	
	wire NineMHz;
	wire [9:0] h_count;
	wire [8:0] v_count;

	Clock_Divider dvdr (
		.clk(clk),
		.NineMHz(NineMHz)
	);
	
	LCD_Controller lcd (
		.clk(clk),
		.NineMHz(NineMHz),
		.tft_clk(tft_clk),
		.tft_display(tft_display),
		.led_en(led_en),
		.tft_en(tft_en),
		.tft_de(tft_de),
		.h_count(h_count),
		.v_count(v_count)
	);

	Bit_Gen bg (
		.clk(clk),
		.h_count(h_count),
		.v_count(v_count),
		.port_b_address(port_b_address),
		.port_b_out(port_b_out),
		.red(red),
		.green(green),
		.blue(blue)
	);
	
	Register_File reg_file (
		.reg_write(reg_write),
		.reg_read_a(reg_read_a),
		.reg_read_b(reg_read_b),
		.write_enable(write_enable),
		.reset(reset),
		.alu_input(c_or_mem),
		.reg_a(reg_a),
		.reg_b(reg_b),
		.clk(clk)
	);
		
	BCD_To_7Seg bcd (
		.binary(X_POS),
		.clk(clk),
		.seven_segment(seven_segment),
		.enable(enable),
		.leds(leds)
	);
		
	ALU alu (
	   .a(reg_a),
		.b(reg_b),
		.opcode(alu_in),
		.carry_in(saved_flags[0]),
		.c(c),
		.flags(flags)
	);
endmodule
