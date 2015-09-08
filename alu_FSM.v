`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:19 09/03/2015 
// Design Name: 
// Module Name:    alu 
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

module alu_FSM( A, B, OpCode, CLK, RESET);
	
	input CLK, RESET;
	output A, B, OpCode;
	
	wire CLK, RESET;
	wire [15:0] A;
	wire [15:0] B;
	wire [15:0] OpCode;
	
	reg [3:0] currentOP;
	
	wire [15:0] A_output;
	wire [15:0] B_output;
	wire [15:0] OpCode_output;
	
	reg [32:0] counter;
	
	assign A = A_output;
	assign B = B_output;
	assign OpCode = OpCode_output;
	
	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.OpCode(OpCode), 
		.C(C), 
		.Flags(Flags)
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
			  EXT_SUB_OP = 16'b10010000,
			  EXT_SUB_A = 16'b100,
			  EXT_SUB_B = 16'b10,
			  
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
			  EXT_ASHU_B = 16'b1,
			  
			  SUBI_NUM=4'd13,
			  SUBI_OP = 16'b1001000000000100,
			  SUBI_A = 16'b100,
			  SUBI_B = 16'b0,
			  
			  CMPI_NUM=4'd14,
			  CMPI_OP = 16'b1011000000000100,
			  CMPI_A = 16'b10,
			  CMPI_B = 16'b0;

	always @(posedge CLK)
		begin
		if(RESET == 1'b1)
			begin
				currentOp = 4'd0;
			end
		else
			begin
			if(counter == 32'b10001111000011010001100000000)
				begin
					currentOp = currentOp + 1'd1;
					counter = 32'b0;
				end
			else 
				begin
					counter = counter+ 1'b1;
				end
			end
		end
		
	always @(*)
		begin
			if(RESET == 1'b1)
			begin
				  OpCode_output = 16'b0;
+				  A_output = 16'b0;
+				  B_output =16'b0;
			end
			case(currentOp)
				  EXT_ADD_NUM:
				  begin 
				  OpCode_output = EXT_ADD_OP;
				  A_output = EXT_ADD_A;
				  B_output = EXT_ADD_B;
				  end
				  
				  EXT_OR_NUM:
				  begin
				  OpCode_output = EXT_OR_OP;
				  A_output=EXT_OR_A;
				  B_output = EXT_OR_B;
				  end
				  
				  EXT_XOR_NUM:
				  begin
				  OpCode_output = EXT_XOR_OP;
				  A_output=EXT_XOR_A;
				  B_output = EXT_XOR_B;
				  end
				  
				  EXT_AND_NUM:
				  begin
				  OpCode_output = EXT_AND_OP;
				  A_output = EXT_AND_A;
				  B_output = EXT_AND_B;
				  end
				  
				  EXT_SUB_NUM:
				  begin
				  OpCode_output = EXT_SUB_OP;
				  A_output = EXT_SUB_A;
				  B_output = EXT_SUB_B;
				  end
				  
				  EXT_CMP_NUM:
				  begin
				  OpCode_output = EXT_CMP_OP;
				  A_output = EXT_CMP_A;
				  B_output = EXT_CMP_B;
				  end
				  
				  ADDI_NUM:
				  begin
				  OpCode_output = ADDI_OP;
				  A_output = ADDI_A;
				  B_output = ADDI_B;
				  end
				  
				  EXT_LSHI_LEFT_NUM:
				  begin
				  OpCode_output = EXT_LSHI_LEFT_OP;
				  A_output = EXT_LSHI_LEFT_A;
				  B_output = EXT_LSHI_LEFT_B;
				  end
				  
				  EXT_LSHI_RIGHT_NUM:
				  begin
				  OpCode_output = EXT_LSHI_RIGHT_OP;
				  A_output = EXT_LSHI_RIGHT_A;
				  B_output = EXT_LSHI_RIGHT_B;
				  end
				  
				  EXT_ASHUI_LEFT_NUM:
				  begin
				  OpCode_output = EXT_ASHUI_LEFT_OP;
				  A_output = EXT_ASHUI_LEFT_A;
				  B_output = EXT_ASHUI_LEFT_B;
				  end
				  
				  EXT_ASHUI_RIGHT_NUM:
				  begin
				  OpCode_output = EXT_ASHUI_RIGHT_OP;
				  A_output = EXT_ASHUI_RIGHT_A;
				  B_output = EXT_ASHUI_RIGHT_B;
				  end
				  
				  EXT_LSH_NUM:
				  begin
				  OpCode_output = EXT_LSH_OP;
				  A_output = EXT_LSH_A;
				  B_output = EXT_LSH_B;
				  end
				  
				  EXT_ASHU_NUM:
				  begin
				  OpCode_output = EXT_ASHU_OP;
				  A_output = EXT_ASHU_A;
				  B_output = EXT_ASHU_B;
				  end
				  
				  SUBI_NUM:
				  begin
				  OpCode_output = SUBI_OP;
				  A_output = SUBI_A;
				  B_output = SUBI_B;
				  end
				  
				  CMPI_NUM:
				  begin
				  OpCode_output = CMPI_OP;
				  A_output = CMPI_A;
				  B_output = CMPI_B;
				  currentOp = 4'd0;
				  end
			
			
		endcase
		
		end
	
endmodule
