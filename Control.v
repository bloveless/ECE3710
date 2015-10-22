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
module Control(
    );

	Memory memory (
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
	
	Register_File reg_file (
		.reg_write(reg_write),
		.reg_read_a(reg_read_a),
		.reg_read_b(reg_read_b),
		.write_enable(write_enable),
		.reset(reset),
		.alu_input(c),
		.reg_a(reg_a),
		.reg_b(reg_b),
		.clk(clk)
	);
	
	ALU alu (
	   .a(reg_a),
		.b(reg_b),
		.opcode(opcode),
		.carry_in(carry_in),
		.c(c),
		.flags(flags)
	);

endmodule
