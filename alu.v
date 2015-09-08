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

module alu(
    input      [15:0] A,
    input      [15:0] B,
    input      [15:0] OpCode,
    output reg [15:0] C,
    output reg [5:0]  Flags
    );
	 
	 // Initialize the ALU with no flags
	 reg [5:0] OriginalFlags = 6'b000000;
	 
	 always @(A, B, OpCode)
	 begin
	 
		// Save the original flags
		OriginalFlags = Flags;
		// Always reset all the flags
		Flags[5:0] = 5'b000000;
	 
		case(OpCode[15:12])
		
			`RTYPE:
			begin
			
				case(OpCode[7:4])
					`EXT_ADD:
					begin
						
						// Perform the addition with CarryIn and set the carry flag if necessary
						{Flags[`CARRY_FLAG], C} = A + B + OriginalFlags[`CARRY_FLAG];
						// Set if equal to zero
						if(C == 0) Flags[`ZERO_FLAG] = 1'b1;
						// Set the overflow
						if( (~A[15] & ~B[15] & C[15]) | (A[15] & B[15] & ~C[15]) ) Flags[`FLAG_FLAG] = 1'b1;
					
					end
				
					`EXT_OR:
					begin
					
						C = A | B;
						// No flags for or
						
					end
					
					`EXT_XOR:
					begin
					
						C = A ^ B;
						// No flags for xor
					
					end
					
					`EXT_AND:
					begin
					
						C = A & B;
						// No Flags for and
					
					end
					
					`EXT_CMP:
					begin
					
						if( $signed(A) < $signed(B) ) Flags[`LOW_FLAG:`CARRY_FLAG] = 2'b11;
						else Flags[`LOW_FLAG:`CARRY_FLAG] = 2'b00;
						C = 16'b0000000000000000;

					end
					
					default:
					begin
					
						// Set the output to zero
						C = 0;
						// Invalid op set FLAG_FLAG
						Flags = 5'b000000;
						Flags[`INVALID_OP_FLAG] = 1'b1;
						
					end
				endcase
			end
			
			`ADDI:
			begin
			
				// Add the number and the immediate with the CarryIn
				// Sumultaniously set the carry flag if necessary
				{Flags[`CARRY_FLAG], C} = $signed(A) + OpCode[7:0] + OriginalFlags[`CARRY_FLAG];
				
			end
			
			`SHIFTS:
			begin
			
				case(OpCode[7:4])
					`EXT_LSHI_LEFT:
					begin
					
						C = A << OpCode[3:0];
					
					end
					
					`EXT_LSHI_RIGHT:
					begin
					
						C = A >> OpCode[3:0];
						// LSHI has no flags
					
					end

					`EXT_ASHUI_LEFT:
					begin
					
						C = $signed(A) <<< OpCode[3:0];
						// AUSHI has no flags
					
					end
					
					`EXT_ASHUI_RIGHT:
					begin
					
						C = $signed(A) >>> OpCode[3:0];
						// AUSHI has no flags
					
					end
					
					`EXT_LSH:
					begin
					
						C = A << B;
						// LSH has no flags
					
					end
					
					`EXT_ASHU:
					begin
					
						C = A >>> B;
						// ALSH has no flags
						
					end
					
					default:
					begin
					
						// Set the output to zero
						C = 0;
						// Invalid op set FLAG_FLAG
						Flags = 6'b000000;
						Flags[`INVALID_OP_FLAG] = 1'b1;
					
					end
				endcase
			end
			
			`SUBI:
			begin
			
				C = A - OpCode[7:0];
				// Determine if overflow occurred
				if( (~A[15] & B[15] & C[15]) | (A[15] & ~B[15] & ~C[15]) ) Flags[`FLAG_FLAG] = 1'b1;
			end

			`CMPI:
			begin
			
				if( $signed(A) < OpCode[7:0] ) Flags[`LOW_FLAG:`CARRY_FLAG] = 2'b11;
				else Flags[`LOW_FLAG:`CARRY_FLAG] = 2'b00;
				C = 16'b0000000000000000;
				
			end
			
			default:
			begin
			
				// Set the output to zero
				C = 0;
				// Invalid op set FLAG_FLAG
				Flags = 6'b000000;
				Flags[`INVALID_OP_FLAG] = 1'b1;
			
			end
		endcase
	 end
endmodule


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
