`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:38 09/22/2015 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input [14:0] port_a_address,
    input [14:0] port_b_address,
    input [15:0] port_a_in,
    input [15:0] port_b_in,
	 
    input port_a_we,
    input port_b_we,
    input clk,
	 output reg [15:0] port_a_out,
    output reg [15:0] port_b_out
    );

	parameter NUM_RAM_ADDR_BITS = (1024*32)-1; //<ram_addr_bits>;
		 
	reg [15:0] the_memory_core [NUM_RAM_ADDR_BITS:0];
	
   always @(posedge clk)
	begin
	
         if (port_a_we == 1'b1) 
			begin
            the_memory_core[port_a_address] <= port_a_in;
				// In write-first mode, the din is also passed on to dout
            port_a_out <= port_a_in;
         end
         else
            port_a_out <= the_memory_core[port_a_address];
     
         if (port_b_we == 1'b1) 
			begin
            the_memory_core[port_b_address] <= port_b_in;
				// In write-first mode, the din is also passed on to dout
            port_b_out <= port_b_in;
         end
         else
            port_b_out <= the_memory_core[port_b_address];
     
	end
endmodule
