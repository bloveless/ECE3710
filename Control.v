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
		input reset_btn,
		input clk
   );
	
	// Allow 16 bits so we can address peripherals
	// If the 16th bit is 1 we select from a peripheral
	// If it is 0 we are reading from memory
	reg [15:0] pc = 16'b0;
	
   reg reset;
	
	/* Inputs */
	// Memory
	reg [14:0] port_a_address;
   reg [14:0] port_b_address;
   reg [15:0] port_a_in;
   reg [15:0] port_b_in;
   reg        port_a_we;
   reg        port_b_we;
	// Reg File
	reg [3:0]  reg_write;
   reg [3:0]  reg_read_a;
   reg [3:0]  reg_read_b;
   reg        write_enable;
	reg [15:0] alu_input;
	// ALU
	reg [15:0] a;
   reg [15:0] b;
   reg [15:0] opcode;
	reg        carry_in;
	
	
	/* Outputs */
	// Memory
	reg [15:0] port_a_out;
   reg [15:0] port_b_out;
	// Reg File
   reg [15:0] reg_a;
   reg [15:0] reg_b;
	// ALU
   reg [15:0] c;
   reg [4:0]  flags;

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

	always@(posedge clk)
	begin
		case(state)
			0:	//Fetch/Reset state
			begin
				//TODO: Set control lines for fetch state
				state <= 1;
			end
			
			1: //Decode state
			begin
				//TODO: Set control lines for decode state
				case(op[15:12])
					JTYPE:
					begin
						state = 3;
					end
					default: //RTYPES and ITYPES
					begin
						state = 2;
					end
				endcase
			end
			
			2:	//RTYPE and ITYPE control lines set;
			begin
				//TODO: Set control lines for RTYPE and ITYPE instructions
				pc_enable <= 1;
				state <= 0;
			end
			
			//3: //Future jmp type state
			//begin
				//TODO: Set control lines for JMP instructions
				//state = 0
			//end
		endcase
		
		//PC Counter
		if(pc_enable == 1'b1)
		begin
			//if(pc_jmp = 1'b0)
			//begin
				pc_counter <= pc_counter + 15'b1;
			//end
			//else
			//begin
				//pc_counter <= pc_counter + pc_add_amount
			//end
		end
		else
		begin
			pc_counter <= pc_counter;
		end
	end
endmodule
