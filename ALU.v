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

module ALU (
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [15:0] opcode,
	 input wire carry_in,
    output reg [15:0] c,
    output reg [4:0]  flags
    );
	 
	 always @(a, b, opcode, carry_in)
	 begin

		// Always reset all the flags
		flags[4:0] = 5'b00000;
	 
		case(opcode[15:12])
		
			`RTYPE:
			begin
			
				case(opcode[7:4])
					`EXT_ADD:
					begin
						
						// Perform the addition with carry_in and set the carry flag if necessary
						{flags[`CARRY_FLAG], c} = a + b + carry_in;
						// Set if equal to zero
						if(c == 0) flags[`ZERO_FLAG] = 1'b1;
						// Set the overflow
						if( (~a[15] & ~b[15] & c[15]) | (a[15] & b[15] & ~c[15]) ) flags[`FLAG_FLAG] = 1'b1;
					
					end
				
					`EXT_OR:
					begin
					
						c = a | b;
						// No flags for or
						
					end
					
					`EXT_XOR:
					begin
					
						c = a ^ b;
						// No flags for xor
					
					end
					
					`EXT_AND:
					begin
					
						c = a & b;
						// No flags for and
					
					end
					
					`EXT_SUB:
					begin
					
						// Save the result and generate the carry flag if necessary
						{flags[`CARRY_FLAG], c} = a - b;
						// Generate the overflow flag as well
						if( (~a[15] & ~b[15] & c[15]) | (a[15] & b[15] & ~c[15]) ) flags[`FLAG_FLAG] = 1'b1;
					
					end
					
					`EXT_CMP:
					begin
			
						if( $signed(a) < $signed(b) ) flags[`NEG_FLAG] = 1'b1;
						else flags[`NEG_FLAG] = 1'b0;
						if( $unsigned(a) < $unsigned(b) ) flags[`LOW_FLAG] = 1'b1;
						else flags[`LOW_FLAG] = 1'b0;
						if( a == b ) flags[`ZERO_FLAG] = 1'b1;
						else flags[`ZERO_FLAG] = 1'b0;
						c = 16'b0000000000000000;

					end
					
					default:
					begin
						flags = 5'b000001; // Set invalid op flag
						c = 16'b0000000000000000;
					end
				endcase
			end
			
			`ADDI:
			begin
			
				// Add the number and the immediate with the carry_in
				// Sumultaniously set the carry flag if necessary
				{flags[`CARRY_FLAG], c} = $signed(a) + opcode[7:0] + carry_in;
				
			end
			
			`SHIFTS:
			begin
			
				case(opcode[7:4])
					`EXT_LSHI_LEFT:
					begin
					
						c = a << opcode[3:0];
					
					end
					
					`EXT_LSHI_RIGHT:
					begin
					
						c = a >> opcode[3:0];
						// LSHI has no flags
					
					end

					`EXT_ASHUI_LEFT:
					begin
					
						c = $signed(a) <<< opcode[3:0];
						// AUSHI has no flags
					
					end
					
					`EXT_ASHUI_RIGHT:
					begin
					
						c = $signed(a) >>> opcode[3:0];
						// AUSHI has no flags
					
					end
					
					`EXT_LSH:
					begin
					
						c = a << b;
						// LSH has no flags
					
					end
					
					`EXT_ASHU:
					begin
					
						if($signed(b) >= 0) c = $signed(a) <<< b;
						else c = $signed(a) >>> -b;
					
					end

					default:
					begin
						flags = 5'b000001; // Set invalid op flag
						c = 16'b0000000000000000;
					end
				endcase
			end
			
			`SUBI:
			begin
			
				c = a - $signed(opcode[7:0]);
				// Determine if overflow occurred
				if( (~a[15] & opcode[7] & c[15]) | (a[15] & ~opcode[7] & ~c[15]) ) flags[`FLAG_FLAG] = 1'b1;
			end

			`CMPI:
			begin
			
				if( $signed(a) < $signed(opcode[7:0]) ) flags[`NEG_FLAG] = 1'b1;
				else flags[`NEG_FLAG] = 1'b0;
				
				if( $unsigned(a) < $unsigned(opcode[7:0]) ) flags[`LOW_FLAG] = 1'b1;
				else flags[`LOW_FLAG] = 1'b0;
				
				if( a == opcode[7:0] ) flags[`ZERO_FLAG] = 1'b1;
				else flags[`ZERO_FLAG] = 1'b0;
				
				c = 16'b0000000000000000;
				
			end
			
			`SETI:
			begin
				c = opcode[7:0];
				flags = 5'b00000;
			end
			
			default:
			begin
			
				flags = 5'b000001; // Set invalid op flag
				c = 16'b0000000000000000;
			
			end
		endcase
		
	 end
endmodule
