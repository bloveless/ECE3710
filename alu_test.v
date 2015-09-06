`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:12 09/05/2015
// Design Name:   alu
// Module Name:   C:/Users/Brennnon/Documents/GitRepos/ECE3710/alu_test.v
// Project Name:  ECE3710
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "parameters.vh"

module alu_test;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [15:0] OpCode;

	// Outputs
	wire [15:0] C;
	wire [4:0] Flags;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.OpCode(OpCode), 
		.C(C), 
		.Flags(Flags)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		OpCode = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		// OpCode : 15-12
		// Rdest  : 11-8
		// OpCodeExt : 7-4
		// Rsrc : 3 - 0
		
		// Test addition
		A = 10;
		B = 10;
		OpCode = {`AND_OR_XOR_ADD, 4'b0000, `EXT_ADD, 4'b0000};
		
		#5;
		
		$display("A: %x B: %x C: %x Flags: %x", A, B, C, Flags);
        
		// Add stimulus here

	end
      
endmodule

