`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:16:54 09/28/2015
// Design Name:   Memory
// Module Name:   C:/Users/brennon/Documents/GitHub/ECE3710/Memory_Test.v
// Project Name:  ECE3710
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Memory_Test;

	// Inputs
	reg [14:0] port_a_address;
	reg [14:0] port_b_address;
	reg [15:0] port_a_in;
	reg [15:0] port_b_in;
	reg port_a_we;
	reg port_b_we;
	reg clk;
	
	// Storage
	reg [14:0] read_a_tmp;
	reg [14:0] read_b_tmp;
	
	reg [15:0] i, j;

	// Outputs
	wire [15:0] port_a_out;
	wire [15:0] port_b_out;

	// Instantiate the Unit Under Test (UUT)
	Memory uut (
		.port_a_address(port_a_address), 
		.port_b_address(port_b_address), 
		.port_a_in(port_a_in), 
		.port_b_in(port_b_in), 
		.port_a_we(port_a_we), 
		.port_b_we(port_b_we), 
		.clk(clk), 
		.port_a_out(port_a_out), 
		.port_b_out(port_b_out)
	);

	initial begin
		// Initialize Inputs
		port_a_address = 0;
		port_b_address = 0;
		port_a_in = 0;
		port_b_in = 0;
		port_a_we = 0;
		port_b_we = 0;
		clk = 0;
		
		// Initialize Storage
		read_a_tmp = 0;
		read_b_tmp = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Set every memory location's value to its address
		for(i = 0; i < 2**15; i = i + 1)
		begin
			port_a_address = i;
			port_a_in = i;
			port_a_we = 1;
			
			// Let the data write 5 seems to be the magic number
			#5;
			
			// Store the output from the operation
			// This should reflect immediatley because
			read_a_tmp = port_a_out;
			
			if((port_a_address != port_a_in) && (port_a_in != read_a_tmp))
			begin
				$display("ERROR: I: %d Data: %d Out: %d", port_a_address, port_a_in, read_a_tmp);
			end
			
		end
		
		// Reset Inputs
		port_a_address = 0;
		port_b_address = 0;
		port_a_in = 0;
		port_b_in = 0;
		port_a_we = 0;
		port_b_we = 0;
		clk = 0;
		
		// Reset Storage
		read_a_tmp = 0;
		read_b_tmp = 0;
		
		// Finish Reset
		#5;
		
		// Read every memory location's value and make sure it is equal to its address
		// we are going to do this one backwards just for fun
		for(j = 2**15; j >= 0; j = j - 1)
		begin
			port_b_address = j;
			port_b_in = 0;
			port_b_we = 0;
			
			// Wait some time 5 seems to be the magic number
			#5;
			
			read_b_tmp = port_b_out;
			
			if(read_b_tmp != j)
			begin
				if((j % 100) == 0)
				begin
					// Check that the values are valid
					$display("ERROR: Data %d in address %d", read_b_tmp, j);
				end
			end
			else
			begin
				if((j % 100) == 0)
				begin
					$display("%d", j);
				end
			end
			
		end
	end
	
	always begin
		clk = ~clk;
		#1;
	end
      
endmodule

