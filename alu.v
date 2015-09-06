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
    output reg [4:0]  Flags
    );
	 
	 integer CarryIn;
	 
	 always @(A, B, OpCode)
	 begin
	 
		// Save the original carry if we need to add it in later
		CarryIn = Flags[`CARRY_FLAG];
		// Always reset all the flags
		Flags[4:0] = 5'b00000;
	 
		case(OpCode[15:12])
		
			`RTYPE:
			begin
			
				case(OpCode[7:4])
					`EXT_ADD:
					begin
						
						// Perform the addition with CarryIn and set the carry flag if necessary
						{Flags[`CARRY_FLAG], C} = A + B + CarryIn;
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
				endcase
			end
			
			`ADDI:
			begin
			
				// Add the number and the immediate with the CarryIn
				// Sumultaniously set the carry flag if necessary
				{Flags[`CARRY_FLAG], C} = $signed(A) + OpCode[7:0] + CarryIn;
				
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
					
					`EXT_ALSH:
					begin
					
						C = $signed(A) <<< B;
						// ALSH has no flags
					
					end
					
					`EXT_ASHU:
					begin
					
						C = A >>> B;
						// ALSH has no flags
						
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
			
				// Invalid op, set all flags (this will probably need to be changed later)
				Flags = 5'b11111;
			
			end
		endcase
	 end
endmodule
