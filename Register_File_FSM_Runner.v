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

module RegisterFile_FSM_Runner;

	// Inputs
	reg Clk;
	reg RESET;

	// Outputs
	wire [6:0] SevenSegment;
	wire [3:0] Enable;
	wire [3:0] LED;

	// Instantiate the Unit Under Test (UUT)
	Register_File_FSM uut (
		.Clk(Clk), 
		.RESET(RESET), 
		.SevenSegment(SevenSegment), 
		.Enable(Enable), 
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		RESET = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		RESET = 1;
		
		#4;
		
		RESET = 0;
		
		#4;
        
		// Add stimulus here

	end
	
	always begin
		#1;
		Clk = !Clk;
	end
      
endmodule

