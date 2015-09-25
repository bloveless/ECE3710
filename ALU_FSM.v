`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:19 09/03/2015 
// Design Name: 
// Module Name:    alu 
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

module ALU_FSM( a, b, c, opcode, clk, reset_btn, seven_segment, enable, led);
	
	input clk, reset_btn;
	output a, b, c, opcode;

	output wire [6:0] seven_segment;
	output wire [3:0] enable;
	output wire [3:0] led;
	 
	
	wire clk, reset_btn;
	wire [15:0] a;
	wire [15:0] b;
	wire [15:0] c;
	wire [15:0] opcode;
	wire [4:0] flags;
	
	reg [3:0] current_op=4'b0;
	reg carry_in = 1'b0;
	
	reg [15:0] a_output;
	reg [15:0] b_output;
	reg [15:0] opcode_output;
	
	reg [32:0] counter;
	
	assign a = a_output;
	assign b = b_output;
	assign opcode = opcode_output;

	
	// Instantiate the Unit Under Test (UUT)
	ALU alu (
		.a(a), 
		.b(b), 
		.opcode(opcode), 
		.carry_in(carry_in),
		.c(c), 
		.flags(flags)
	);
	

	
	BCD_To_7Seg bcg(
	 .binary(c),
	 .clk(clk),
    .seven_segment(seven_segment),
	 .enable(enable),
	 .leds(led)
	);

	       localparam EXT_ADD_NUM=4'd0,
			  EXT_ADD_OP = 16'b1010000,
			  EXT_ADD_A = 16'b100,
			  EXT_ADD_B = 16'b100,
			  
			  EXT_OR_NUM=4'd1,
			  EXT_OR_OP = 16'b100000,
			  EXT_OR_A = 16'b1,
			  EXT_OR_B = 16'b10,
			  
			  EXT_XOR_NUM=4'd2,
			  EXT_XOR_OP = 16'b110000,
			  EXT_XOR_A = 16'b10,
			  EXT_XOR_B = 16'b10,
			  
			  EXT_AND_NUM=4'd3,
			  EXT_AND_OP = 16'b10000,
			  EXT_AND_A = 16'b10,
			  EXT_AND_B = 16'b10,
			  
			  EXT_SUB_NUM=4'd4,
			  EXT_SUB_OP = 16'b0000000010010000,
			  EXT_SUB_A = 16'd4,
			  EXT_SUB_B = 16'd1,
			  
			  EXT_CMP_NUM=4'd5,
			  EXT_CMP_OP = 16'b10110000,
			  EXT_CMP_A = 16'b100,
			  EXT_CMP_B = 16'b100,
			  
			  ADDI_NUM=4'd6,
			  ADDI_OP = 16'b101000000000100,
			  ADDI_A = 16'b100,
			  ADDI_B = 16'b0,
			  
			  EXT_LSHI_LEFT_NUM=4'd7,
			  EXT_LSHI_LEFT_OP = 16'b1000000000000010,
			  EXT_LSHI_LEFT_A = 16'b1,
			  EXT_LSHI_LEFT_B = 16'b0,
			  
			  EXT_LSHI_RIGHT_NUM=4'd8,
			  EXT_LSHI_RIGHT_OP = 16'b1000000000010010,
			  EXT_LSHI_RIGHT_A = 16'b100,
			  EXT_LSHI_RIGHT_B = 16'b0,
			  
			  EXT_ASHUI_LEFT_NUM=4'd9,
			  EXT_ASHUI_LEFT_OP = 16'b1000000000100010,
			  EXT_ASHUI_LEFT_A = 16'b1111111111111110,
			  EXT_ASHUI_LEFT_B = 16'b0,
			  
			  EXT_ASHUI_RIGHT_NUM=4'd10,
			  EXT_ASHUI_RIGHT_OP = 16'b1000000000110010,
			  EXT_ASHUI_RIGHT_A = 16'b1111111111111000,
			  EXT_ASHUI_RIGHT_B = 16'b0,
			  
			  EXT_LSH_NUM=4'd11,
			  EXT_LSH_OP = 16'b1000000001000000,
			  EXT_LSH_A = 16'b1,
			  EXT_LSH_B = 16'b10,
			  
			  EXT_ASHU_NUM=4'd12,
			  EXT_ASHU_OP = 16'b1000000001100000,
			  EXT_ASHU_A = 16'b10,
			  EXT_ASHU_B = 16'b1111111111111111,
			  
			  SUBI_NUM=4'd13,
			  SUBI_OP = 16'b1001000000000010,
			  SUBI_A = 16'b100,
			  SUBI_B = 16'b0,
			  
			  CMPI_NUM=4'd14,
			  CMPI_OP = 16'b1011000000000100,
			  CMPI_A = 16'b10,
			  CMPI_B = 16'b0;

	always @(posedge clk)
		begin
		if(reset_btn == 1'b1)
			begin
				current_op <= 4'd0;
			end
		else
			begin
			if(counter == 32'b10001111000011010001100000000)
				begin
					current_op <= current_op + 1'd1;
					counter <= 32'b0;
				end
			else 
				begin
					counter <= counter+ 1'b1;
				end
			end
		end
		
	always @(*)
		begin
			if(reset_btn == 1'b1)
			begin
				  opcode_output = 16'b0;
				  a_output = 16'b0;
				  b_output =16'b0;
			end
			case(current_op)
				  EXT_ADD_NUM:
				  begin 
				  opcode_output = EXT_ADD_OP;
				  a_output = EXT_ADD_A;
				  b_output = EXT_ADD_B;
				  end
				  
				  EXT_OR_NUM:
				  begin
				  opcode_output = EXT_OR_OP;
				  a_output = EXT_OR_A;
				  b_output = EXT_OR_B;
				  end
				  
				  EXT_XOR_NUM:
				  begin
				  opcode_output = EXT_XOR_OP;
				  a_output=EXT_XOR_A;
				  b_output = EXT_XOR_B;
				  end
				  
				  EXT_AND_NUM:
				  begin
				  opcode_output = EXT_AND_OP;
				  a_output = EXT_AND_A;
				  b_output = EXT_AND_B;
				  end
				  
				  EXT_SUB_NUM:
				  begin
				  opcode_output = EXT_SUB_OP;
				  a_output = EXT_SUB_A;
				  b_output = EXT_SUB_B;
				  end
				  
				  EXT_CMP_NUM:
				  begin
				  opcode_output = EXT_CMP_OP;
				  a_output = EXT_CMP_A;
				  b_output = EXT_CMP_B;
				  end
				  
				  ADDI_NUM:
				  begin
				  opcode_output = ADDI_OP;
				  a_output = ADDI_A;
				  b_output = ADDI_B;
				  end
				  
				  EXT_LSHI_LEFT_NUM:
				  begin
				  opcode_output = EXT_LSHI_LEFT_OP;
				  a_output = EXT_LSHI_LEFT_A;
				  b_output = EXT_LSHI_LEFT_B;
				  end
				  
				  EXT_LSHI_RIGHT_NUM:
				  begin
				  opcode_output = EXT_LSHI_RIGHT_OP;
				  a_output = EXT_LSHI_RIGHT_A;
				  b_output = EXT_LSHI_RIGHT_B;
				  end
				  
				  EXT_ASHUI_LEFT_NUM:
				  begin
				  opcode_output = EXT_ASHUI_LEFT_OP;
				  a_output = EXT_ASHUI_LEFT_A;
				  b_output = EXT_ASHUI_LEFT_B;
				  end
				  
				  EXT_ASHUI_RIGHT_NUM:
				  begin
				  opcode_output = EXT_ASHUI_RIGHT_OP;
				  a_output = EXT_ASHUI_RIGHT_A;
				  b_output = EXT_ASHUI_RIGHT_B;
				  end
				  
				  EXT_LSH_NUM:
				  begin
				  opcode_output = EXT_LSH_OP;
				  a_output = EXT_LSH_A;
				  b_output = EXT_LSH_B;
				  end
				  
				  EXT_ASHU_NUM:
				  begin
				  opcode_output = EXT_ASHU_OP;
				  a_output = EXT_ASHU_A;
				  b_output = EXT_ASHU_B;
				  end
				  
				  SUBI_NUM:
				  begin
				  opcode_output = SUBI_OP;
				  a_output = SUBI_A;
				  b_output = SUBI_B;
				  end
				  
				  CMPI_NUM:
				  begin
				  opcode_output = CMPI_OP;
				  a_output = CMPI_A;
				  b_output = CMPI_B;
				  
				  end
			default: 
						begin
							opcode_output = 16'b0;
							a_output = 16'b0;
							b_output =16'b0;
						end
		endcase
		
		end
	
endmodule
