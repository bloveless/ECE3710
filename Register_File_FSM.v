`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:49 09/13/2015 
// Design Name: 
// Module Name:    RegisterFile_FSM 
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

module Register_File_FSM(clk, reset_btn, seven_segment, enable, led);

	// FSM inputs/outputs
	integer       		counter;
	integer           operation;
	input             reset_btn;
	input             clk;
	// RegisterFile inputs/outputs
	reg         [3:0] reg_write;
	reg         [3:0] reg_read_a;
	reg         [3:0] reg_read_b;
	wire       [15:0] reg_a;
	wire       [15:0] reg_b;
	reg               write_enable;
	reg               reset;
	// ALU inputs/outputs
	reg        [15:0] opcode;
	reg               carry_in;
	wire       [15:0] c;
	wire        [4:0] flags;
	// SeventSeg outputs
	output wire [6:0] seven_segment;
	output wire [3:0] enable;
	output wire [3:0] led;
	
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
	
	BCD_To_7Seg bcd (
		.binary(c),
		.clk(clk),
		.seven_segment(seven_segment),
		.enable(enable),
		.leds(led)
	);
	
	initial
	begin
		operation = 0;
		reset = 1'b0;
		counter = 0;
		carry_in = 0;
	end
	
	always @(posedge(clk))
	begin
		if(reset_btn == 1'b1)
		begin
				counter <= 4'd0;
				operation <= 4'd0;
		end
		else
		begin
			reset = 1'b0;
			if(counter == 32'd150000000)
			begin
					counter <= 32'b0;
					if(operation == 16)
					begin
						operation <= 0;
					end
					else
					begin
						operation <= operation + 1;
					end
			end
			else 
			begin
					counter <= counter+ 1'b1;
			end
		end
		
		case(operation)
			0:
			begin
				// reset registers
				reset = 1'b1;
				reg_read_a = 4'd0;
				reg_read_b = 4'd0;
				reg_write = 4'd0;
				write_enable = 0;
				opcode = `NOOP;
			end
			1:
			begin
				// put 1 into reg 0
				reset = 1'b0;
				reg_read_a = 4'd0;
				reg_read_b = 4'd0;
				reg_write = 4'd0;
				write_enable = 1;
				opcode = {`SETI, 4'b0000, 8'b00000001};
			end
			2:
			begin
				// put 1 into reg 1
				reset = 1'b0;
				reg_read_a = 4'd0;
				reg_read_b = 4'd0;
				reg_write = 4'd1;
				write_enable = 1;
				opcode = {`SETI, 4'b0000, 8'b00000001};
			end
			3:
			begin
				// Add Reg0 + Reg1 into Reg2
				reset = 1'b0;
				reg_read_a = 4'd0;
				reg_read_b = 4'd1;
				reg_write = 4'd2;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			4:
			begin
				// Add Reg1 + Reg2 into Reg3
				reset = 1'b0;
				reg_read_a = 4'd1;
				reg_read_b = 4'd2;
				reg_write = 4'd3;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			5:
			begin
				// Add Reg2 + Reg3 into Reg4
				reset = 1'b0;
				reg_read_a = 4'd2;
				reg_read_b = 4'd3;
				reg_write = 4'd4;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			6:
			begin
				// Add Reg3 + Reg4 into Reg5
				reset = 1'b0;
				reg_read_a = 4'd3;
				reg_read_b = 4'd4;
				reg_write = 4'd5;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			7:
			begin
				// Add Reg4 + Reg5 into Reg6
				reset = 1'b0;
				reg_read_a = 4'd4;
				reg_read_b = 4'd5;
				reg_write = 4'd6;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			8:
			begin
				// Add Reg5 + Reg6 into Reg7
				reset = 1'b0;
				reg_read_a = 4'd5;
				reg_read_b = 4'd6;
				reg_write = 4'd7;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			9:
			begin
				// Add Reg6 + Reg7 into Reg8
				reset = 1'b0;
				reg_read_a = 4'd6;
				reg_read_b = 4'd7;
				reg_write = 4'd8;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			10:
			begin
				// Add Reg7 + Reg8 into Reg9
				reset = 1'b0;
				reg_read_a = 4'd7;
				reg_read_b = 4'd8;
				reg_write = 4'd9;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			11:
			begin
				// Add Reg8 + Reg9 into Reg10
				reset = 1'b0;
				reg_read_a = 4'd8;
				reg_read_b = 4'd9;
				reg_write = 4'd10;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			12:
			begin
				// Add Reg9 + Reg10 into Reg11
				reset = 1'b0;
				reg_read_a = 4'd9;
				reg_read_b = 4'd10;
				reg_write = 4'd11;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			13:
			begin
				// Add Reg10 + Reg11 into Reg12
				reset = 1'b0;
				reg_read_a = 4'd10;
				reg_read_b = 4'd11;
				reg_write = 4'd12;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			14:
			begin
				// Add Reg11 + Reg12 into Reg13
				reset = 1'b0;
				reg_read_a = 4'd11;
				reg_read_b = 4'd12;
				reg_write = 4'd13;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			15:
			begin
				// Add Reg12 + Reg13 into Reg14
				reset = 1'b0;
				reg_read_a = 4'd12;
				reg_read_b = 4'd13;
				reg_write = 4'd14;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			16:
			begin
				// Add Reg13 + Reg14 into Reg15
				reset = 1'b0;
				reg_read_a = 4'd13;
				reg_read_b = 4'd14;
				reg_write = 4'd15;
				write_enable = 1;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			default:
			begin
				// Add Reg13 + Reg14 into Reg15
				reset = 1'b0;
				reg_read_a = 4'd0;
				reg_read_b = 4'd0;
				reg_write = 4'd0;
				write_enable = 0;
				opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
		endcase
	end

endmodule
