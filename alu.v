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
