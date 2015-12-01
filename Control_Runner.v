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

	// Outputs
	wire [6:0] seven_segment;
	wire [3:0] enable;
	wire [3:0] leds;
	reg wireless_start = 1'b0;
	reg [7:0]  wireless_data_in = 8'b00000000;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.wireless_start(wireless_start),
		.wireless_data_in(wireless_data_in),
		.reset_btn(reset_btn), 
		.clk(clk), 
		.seven_segment(seven_segment), 
		.enable(enable), 
		.leds(leds)
	);

	initial begin
		reset_btn = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		wireless_data_in = 8'b10101010;
		wireless_start = 1'b1;
		
	end
	
	always begin
		clk = ~clk;
		#1;
	end
      
endmodule
