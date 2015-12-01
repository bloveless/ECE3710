`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:25:57 10/29/2015
// Design Name:   Control
// Module Name:   C:/Users/u0812277/Documents/GitHub/ECE3710/Control_Runner_2.v
// Project Name:  ECE3710
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Runner;

	// Inputs
	reg reset_btn;
	reg clk;
	reg TP_PENIRQ;
	reg TP_BUSY;
	reg TP_DOUT;

	// Outputs
	wire TP_CS;
	wire TP_DCLK;
	wire TP_DIN;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.reset_btn(reset_btn), 
		.clk(clk), 
		.TP_PENIRQ(TP_PENIRQ), 
		.TP_BUSY(TP_BUSY),
		.TP_DOUT(TP_DOUT), 
		.TP_CS(TP_CS), 
		.TP_DCLK(TP_DCLK), 
		.TP_DIN(TP_DIN)
	);

	initial begin
		reset_btn = 0;
		clk = 0;
		TP_PENIRQ = 1;
		TP_BUSY = 1;
		TP_DOUT = 1;

		// Wait 100 ns for global reset to finish
		#2;
		TP_PENIRQ = 0;
		#200
		TP_BUSY = 0;
		TP_DOUT = 0;
		#700
		TP_BUSY = 1;
		#162
		TP_BUSY = 0;
		TP_DOUT = 1;
		#76
		TP_DOUT = 0;
		#76
		TP_DOUT = 1;
		#76
		TP_DOUT = 0;
		#76
		TP_DOUT = 1;
		#76
		TP_DOUT = 0;
		#76
		TP_DOUT = 1;
		#76
		TP_DOUT = 0;
		
		
	end
	
	always begin
		clk = ~clk;
		#1;
	end
      
endmodule
