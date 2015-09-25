`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:53 09/17/2015
// Design Name:   RegisterFile_FSM
// Module Name:   C:/Users/brennon/Documents/GitHub/ECE3710/RegisterFile_FSM_Runner.v
// Project Name:  ECE3710
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_File_FSM_Runner;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [6:0] seven_segment;
	wire [3:0] enable;
	wire [3:0] led;

	// Instantiate the Unit Under Test (UUT)
	Register_File_FSM uut (
		.clk(clk), 
		.reset(reset), 
		.seven_segment(seven_segment), 
		.enable(enable), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 1;
		
		#4;
		
		reset = 0;
		
		#4;
        
		// Add stimulus here

	end
	
	always begin
		#1;
		clk = !clk;
	end
      
endmodule

