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
		input wire clk,
		input wire [15:0] port_a_out,
		input wire [15:0] c,
		input wire [4:0]  flags,
		input wire [15:0] reg_a,
		input wire [15:0] reg_b,
		input wire [11:0] X_POS,
		input wire [11:0] Y_POS,
		output reg [4:0] saved_flags,
		output wire [13:0] pc_or_b,
		output wire [15:0] c_or_mem,
		output wire [15:0] alu_in,
		output reg port_a_we,
		output reg write_enable,
		output reg [3:0] reg_write,
		output reg [3:0] reg_read_a,
		output reg [3:0] reg_read_b
   );
	
	// Allow 16 bits so we can address peripherals
	// If the 16th bit is 1 we select from a peripheral
	// If it is 0 we are reading from memory
	reg [13:0] pc = 14'b11111111111111;
	
	//Mux Controls
	reg c_or_mem_control;	//Mux control line
	assign c_or_mem = c_or_mem_control ? c : port_a_out;
	
	reg pc_or_b_control;		//Mux control line
	assign pc_or_b = pc_or_b_control ? pc : reg_b[13:0];
	
	reg alu_from_opcode_or_control;
	reg [15:0] control_to_alu;
	assign alu_in = alu_from_opcode_or_control ? port_a_out : control_to_alu;
	
	reg save_flags;
	reg [3:0] state;
	reg pc_enable;
	reg [15:0] wait_counter = 0; //16 Bits needed to count to 33,333 (a third of 100,000)
	reg pc_jmp;
	reg pc_brch;
	reg [11:0] milliseconds = 0;
	reg wait_enable = 0;
	reg wait_reset = 0;
	reg [11:0]brch_amount = 0;
	
	always@(posedge clk)
	begin
		if(state == 0)			//Fetch
		begin
			state <= 1;
		end
		else if(state == 1)	//Decode
		begin
			case(port_a_out[15:12])
				`JTYPE:
				begin
					state <= 3;
				end
				`LOAD:
				begin
					state <= 4;
				end
				`STORE:
				begin
					state <= 6;
				end
				`WAIT:
				begin
					state <= 7;
				end
				`TCHBRCH:
				begin
					state <= 10;
				end
				default: //RTYPES and ITYPES
				begin
					state <= 2;
				end
			endcase
		end
		
		else if(state == 4)
		begin
			state <= 5;
		end
		else
		begin
			state <= 0;
		end
	end

	always@(state)
	begin
		pc_enable = 0;
		alu_from_opcode_or_control = 1;
		control_to_alu = 0;
		write_enable = 0;
		port_a_we = 0;
		c_or_mem_control = 1;
		pc_or_b_control = 1;
		control_to_alu = 0;
		reg_write = port_a_out[11:8];
		reg_read_a = port_a_out[11:8];
		reg_read_b = port_a_out[3:0];
		save_flags = 0;
		pc_jmp = 0;
		pc_brch = 0;
		brch_amount = 0;
		wait_enable = 0;
		wait_reset = 0;
		
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
			
			3: //JMP state
			begin
				pc_enable = 1;
				pc_jmp = 1;
				alu_from_opcode_or_control = 0;
				control_to_alu = {`ADDI, port_a_out[11:8], 8'b0};
			end
			
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
				if(milliseconds == port_a_out[11:0])
				begin
					pc_enable = 1;
					wait_reset = 1;
				end
				else
				begin
					wait_enable = 1;
				end
			end
			10:	//TCHBRCH
			begin
				reg_read_a = 4'b1110;
				reg_read_b = 4'b1111;
				if(X_POS[11:4] < reg_a[15:8] && X_POS[11:4] > reg_a[7:0] && Y_POS[11:4] < reg_b[15:8] && Y_POS[11:4] > reg_b[7:0])
				begin
					pc_brch = 1;
					brch_amount = port_a_out[11:0];
					pc_enable = 1;
				end
				else
				begin
					pc_enable = 1;
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
			if(pc_jmp == 1'b1)
			begin
				pc <= 14'h3FFF - c;
			end
			else if(pc_brch == 1'b1)
			begin
				pc <= pc - $signed(brch_amount);
			end
			else
			begin
				pc <= pc - 15'b1;
			end
		end
	end
	
	//Wait counter
	always@(posedge clk)
	begin
		if(wait_reset == 1)
		begin
			milliseconds <= 0;
			wait_counter <= 0;
		end
		else if(wait_enable == 1)
		begin
			if(wait_counter == 16'd33333)
			begin
				wait_counter <= 0;
				milliseconds <= milliseconds + 1;
			end
			else
			begin
				wait_counter <= wait_counter + 1;
			end
		end
	end
endmodule
