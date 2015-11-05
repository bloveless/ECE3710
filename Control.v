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

module Control(
		input reset_btn,
		input clk,
		output [6:0] seven_segment,
		output [3:0] enable,
		output [3:0] leds
   );
	
	// Allow 16 bits so we can address peripherals
	// If the 16th bit is 1 we select from a peripheral
	// If it is 0 we are reading from memory
	reg [14:0] pc = 15'b111111111111111;
	
   reg reset;
	
	/* Inputs */
	// Memory
   reg [14:0] port_b_address;
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
	
	
	/* Outputs */
	// Memory
	wire [15:0] port_a_out;
   wire [15:0] port_b_out;
	// Reg File
   wire [15:0] reg_a;
   wire [15:0] reg_b;
	// ALU
   wire [15:0] c;
   wire [4:0]  flags;
	
	//Mux Controls
	reg c_or_mem_control;	//Mux control line
	wire [15:0] c_or_mem;				//Mux output
	assign c_or_mem = c_or_mem_control ? c : port_a_out;
	
	reg pc_or_b_control;		//Mux control line
	wire [14:0] pc_or_b;				//Mux output
	assign pc_or_b = pc_or_b_control ? pc : reg_b[14:0];
	
	reg alu_from_opcode_or_control;
	wire [15:0] alu_in;
	reg [15:0] control_to_alu;
	assign alu_in = alu_from_opcode_or_control ? port_a_out : control_to_alu;

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
		.binary(c),
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
	
	reg [4:0] saved_flags;
	reg save_flags;
	reg [3:0] state;
	reg pc_enable;
	reg [17:0] wait_counter = 0; //19 Bits needed to count to 166,666 (a third of 500,000)
	
	always@(posedge clk)
	begin
		if(state == 0)			//Fetch
		begin
			state = 1;
		end
		else if(state == 1)	//Decode
		begin
			case(port_a_out[15:12])
				`JTYPE:
				begin
					state = 3;
				end
				`LOAD:
				begin
					state = 4;
				end
				`STORE:
				begin
					state = 6;
				end
				`WAIT:
				begin
					state = 7;
				end
				default: //RTYPES and ITYPES
				begin
					state = 2;
				end
			endcase
		end
		else if(state == 4)
		begin
			state = 5;
		end
		else
		begin
			state = 0;
		end
	end

	always@(state)
	begin
		pc_enable = 0;
		alu_from_opcode_or_control = 1;
		write_enable = 0;
		port_a_we = 0;
		c_or_mem_control = 1;
		pc_or_b_control = 1;
		control_to_alu = 0;
		reg_write = port_a_out[11:8];
		reg_read_a = port_a_out[11:8];
		reg_read_b = port_a_out[3:0];
		save_flags = 0;
		wait_counter = wait_counter;
		
		case(state)
			0:	//Fetch state
			begin
			end
		
			1: //Decode state
			begin
			end
			
			2:	//RTYPE and ITYPE control lines set;
			begin
				//TODO: Set control lines for RTYPE and ITYPE instructions
				pc_enable = 1;
				write_enable = 1;
				save_flags = 1;
			end
			
			//3: //Future jmp type state
			//begin
				//TODO: Set control lines for JMP instructions
				//state = 0
			//end
			
			4:	//LOAD state 1
			begin
				pc_or_b_control = 0;
				reg_write = reg_write;
			end
			
			5:	//LOAD state 2
			begin
				pc_enable = 1;
				c_or_mem_control = 0;
				write_enable = 1;
			end
			
			6:	//STORE state 1
			begin
				control_to_alu = {`ADDI, port_a_out[11:8], 8'b0};
				alu_from_opcode_or_control = 0;
				pc_or_b_control = 0;
				port_a_we = 1;
				pc_enable = 1;
			end
			
			7:
			begin
				if(wait_counter == 18'd166666)
				begin
					wait_counter = 0;
					pc_enable = 1;
				end
				else
				begin
					wait_counter = wait_counter + 1;
				end
			end
			default:
			begin
				//default
			end
		endcase
	end
	
	//Register to save flags and pc counter
	always@(posedge clk)
	begin
		if(save_flags)
		begin
			saved_flags <= flags;
		end
		
		//PC Counter
		if(pc_enable == 1'b1)
		begin
			//if(pc_jmp = 1'b0)
			//begin
				pc <= pc - 15'b1;
			//end
			//else
			//begin
				//pc <= pc + pc_add_amount
			//end
		end
	end
endmodule
