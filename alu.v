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
module alu(
    input      [15:0] A,
    input      [15:0] B,
    input      [15:0] OpCode,
    output reg [15:0] C,
    output reg [4:0]  Flags
    );
	 
	 // All the available operations
	 parameter AND_OR_XOR_ADD = 4'b0000;
	 parameter EXT_AND          = 4'b0001;
	 parameter EXT_OR           = 4'b0010;
	 parameter EXT_XOR          = 4'b0011;
	 parameter EXT_ADD          = 4'b0101;
	 
	 
	 parameter ADDI           = 4'b0101;
	 
	 parameter SHIFTS         = 4'b1000;
	 parameter EXT_LSHI_LEFT    = 4'b0000;
	 parameter EXT_LSHI_RIGHT   = 4'b0001;
	 parameter EXT_ASHUI_LEFT   = 4'b0010;
	 parameter EXT_ASHUI_RIGHT  = 4'b0011;
	 parameter EXT_LSH          = 4'b0100;
	 parameter EXT_ALSH         = 4'b0110;
	 parameter EXT_ASHU         = 4'b0110;
	 
	 parameter SUBI           = 4'b1001;
	 
	 parameter CMPI           = 4'b1011;
	 

	 // Easy access to the flags
	 parameter CARRY_FLAG = 0;
	 parameter FLAG_FLAG  = 1;
	 parameter ZERO_FLAG  = 2;
	 parameter NEG_FLAG   = 3;
	 
	 always @(A, B, OpCode)
	 begin
	 
		case(OpCode[15:12])
		
			AND_OR_XOR_ADD:
			begin
			
				case(OpCode[7:4])
					EXT_ADD:
					begin
						
						// Save the original carry if we need to add it in later
						int CarryIn = Flags[CARRY_FLAG];
						// Reset the flags
						Flags[4:0] = 5'b00000;
						// Perform the addition with CarryIn and set the carry flag if necessary
						{Flags[CARRY_FLAG], C} = $signed(A) + $signed(B) + CarryIn;
						// Set if equal to zero
						if(C == 0) Flags[ZERO_FLAG] = 1'b1;
						// Set the overflow
						if( (~A[15] & ~B[15] & C[15]) | (A[15] & B[15] & ~C[15]) ) Flags[FLAG_FLAG] = 1'b1;
					
					end
				
					EXT_OR:
					begin
					
						C = A | B;
						// No flags for or
						Flags[4:0] = 5'b00000;
						
					end
					
					EXT_XOR:
					begin
					
						C = A ^ B;
						// No flags for xor
						Flags[4:0] = 5'b00000;
					
					end
					
					EXT_AND:
					begin
					
						C = A & B;
						// No Flags for and
						Flags[4:0] = 5'b00000;
					
					end
				endcase
			end
			
			ADDI:
			begin
			
				// Save the original carry in
				int CarryIn = Flags[CarryFlag];
				// Reset the flags
				Flags[4:0] = 5'b00000;
				// Add the number and the immediate with the CarryIn
				// Sumultaniously set the carry flag if necessary
				{Flags[CarryFlag], C} = $signed(A) + OpCode[7:0] + CarryIn;
				
			
			end
			
			SHIFTS:
			begin
			
				case(OpCode[7:4])
					EXT_LSHI_LEFT:
					begin
					
						// Reset the flags LSHI has no flags
						Flags[4:0] = 5'b00000;
						C = A << OpCode[7:0];
					
					end
					
					EXT_LSHI_RIGHT:
					begin
					
						// Reset the flags LSHI has no flags
						Flags[4:0] = 5'b00000;
						C = A >> OpCode[7:0];
					
					end

					EXT_ASHUI_LEFT:
					begin
					
						// Reset the flags AUSHI has no flags
						Flags[4:0] = 5'b00000;
						C = $signed(A) <<< B;
					
					end
					
					EXT_ASHUI_RIGHT:
					begin
					
						// Reset the flags AUSHI has no flags
						Flags[4:0] = 5'b00000;
						C = $signed(A) >>> B;
					
					end
					
					EXT_LSH:
					begin
					
						// Reset the flags LSH has no flags
						Flags[4:0] = 5'b00000;
						C = A << B;
					
					end
					
					EXT_ALSH:
					begin
					
						// Reset the flags ALSH has no flags
						Flags[4:0] = 5'b00000;
						C = $signed(A) <<< B;
					
					end
					
					EXT_ASHU:
					begin
					
						// Reset the flags ALSH has no flags
						Flags[4:0] = 5'b00000;
						C = $signed(A) >>> B;
						
					end
				endcase
			end
			
			SUBI:
			begin
			
				// Save the carry in flag if it was set
				int CarryIn = Flags[CARRY_FLAG];
				// Reset the flags
				Flags[4:0] = 5'b00000;
				C = A - Opcode[7:0];
				// Determine if overflow occurred
				if( (~A[15] & ~B[15] & C[15]) | (A[15] & B[15] & ~C[15]) ) Flags[FLAG_FLAG] = 1'b1;
			end

			CMPI:
			begin
				if( $signed(A) < $signed(B) ) Flags[1:0] = 2'b11;
				else Flags[1:0] = 2'b00;
				C = 16'b0000;
				Flags[4:2] = 3'b000;
			end
			
			default:
			begin
			
				// Reset all flags since we have faulted.
				Flags = 4'b0000;
				// Invalid op, set FLAG_FLAG
				Flags[FLAG_FLAG] = 1;
			
			end
		
		endcase
	 
	 end


endmodule
