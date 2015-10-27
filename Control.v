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
	reg [15:0] pc = 16'b0;
	
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
   reg [15:0] opcode;
	reg        carry_in;
	
	
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
	assign pc_or_b = pc_or_b_control ? pc : reg_b;

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
	
	reg alu_from_opcode_or_control;
	wire [15:0] alu_in;
	reg [15:0] control_to_alu;
	assign alu_in = alu_from_opcode_or_control ? opcode : control_to_alu;
	
	
	ALU alu (
	   .a(reg_a),
		.b(reg_b),
		.opcode(alu_in),
		.carry_in(carry_in),
		.c(c),
		.flags(flags)
	);
	
	reg [4:0] saved_flags;
	reg [1:0] state;
	reg pc_enable;

	always@(posedge clk)
	begin
		if(reset_btn)
		begin
			reset <= 1;
			pc <= 0;
			state <= 0;
		end
		else
		begin
			reset <= 0;
			case(state)
				0:	//Fetch state
				begin
					//TODO: Set control lines for fetch state
					opcode <= port_a_out;	//Fetch the instruction from memory
					state <= 1;
				end
			
				1: //Decode state
				begin
					//TODO: Set control lines for decode state
					case(opcode[15:12])	//Decode the instruction. Next state depends on instruction type.
						`JTYPE:
						begin
							state <= 3;
						end
						default: //RTYPES and ITYPES
						begin
							state <= 2;
						end
					endcase
				end
				
				2:	//RTYPE and ITYPE control lines set;
				begin
					//TODO: Set control lines for RTYPE and ITYPE instructions
					alu_from_opcode_or_control <= 1;
					pc_enable <= 1;
					write_enable <= 1;
					reg_read_a <= opcode[11:8];
					reg_read_b <= opcode[3:0];
					reg_write <= opcode[11:8];
					carry_in <= saved_flags[0];
					port_a_we <= 0;
					c_or_mem_control <= 1;
					pc_or_b_control <= 1;
					saved_flags <= flags;
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
					pc <= pc + 15'b1;
				//end
				//else
				//begin
					//pc <= pc + pc_add_amount
				//end
			end
			else
			begin
				pc <= pc;
			end
		end
	end
endmodule
