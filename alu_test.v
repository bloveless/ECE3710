`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:12 09/05/2015
// Design Name:   alu
// Module Name:   C:/Users/Brennnon/Documents/GitRepos/ECE3710/alu_test.v
// Project Name:  ECE3710
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "parameters.vh"

module alu_test;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [15:0] OpCode;
	reg CarryIn;

	// Outputs
	wire [15:0] C;
	wire [4:0] Flags;
	
	//For loop integer
	integer i;
	
	//Number of random tests per op
	integer numOfTests;
	
	//To hold the carry of the previous op
	reg [15:0] carry;
	
	//Used to store random shift amount
	reg [3:0] shiftAmount;
	
	//Used to store random subrtaction immediate
	reg [7:0] subtractAmount;
	
	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.OpCode(OpCode), 
		.CarryIn(CarryIn),
		.C(C), 
		.Flags(Flags)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		CarryIn = 0;
		OpCode = 0;
		numOfTests = 20;

		// Wait 100 ns for global reset to finish
		#100;
		
		// OpCode : 15-12
		// Rdest  : 11-8
		// OpCodeExt : 7-4
		// Rsrc : 3 - 0
		
		// Test addition
		A = 10;
		B = 10;
		OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if((C != 20) || (Flags != 5'b00000))
		begin
			$display("ERROR: 10 + 10 should equal 20, and Flags should equal 0");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: 10 + 10 Passed");
		end
		
		// Test addition edge case 1
		A = 0;
		B = 0;
		OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if((C != 0) || (Flags != 5'b01000))
		begin
			$display("ERROR: 0 + 0 should equal 0, and Flags should equal 0");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: 10 + 10 Passed");
		end
		
		// Test addition edge case 2
		A = 16'b1000000000000000;
		B = 16'b1000000000000000;
		OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if((C != 0) || (Flags != 5'b01101))
		begin
			$display("ERROR: %b + %b should equal 0, and Flags should equal 11001", A, B);
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: 10 + 10 Passed");
		end
		
		// Test addition edge case 3
		A = 16'b0100000000000000;
		B = 16'b0100000000000000;
		OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if((C != 16'b1000000000000000) || (Flags != 5'b00100))
		begin
			$display("ERROR: %b + %b should equal 1000000000000001 (carry from previous), and Flags should equal 00100", A, B);
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: 10 + 10 Passed");
		end
		
		//Test random additions
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			B = $random % 65536;
			OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			#1;
			if(C != (A + B + CarryIn))
			begin
				$display("ERROR%d: %d + %d + %d should equal %d, but equals %d", i, A, B, carry, A + B + carry, C);
			end
		end
		
		// Test addition overflow
		A = 16'b0111111111111111;
		B = 1;
		OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if(Flags[`FLAG_FLAG] != 1)
		begin
			$display("ERROR: Overflow should be reflected in the FLAG_FLAG");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: Addition overflow was detected correctly");
		end
		
		// Test generation of carry
		A = 16'b1111111111111111;
		B = 1;
		OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if(Flags[`CARRY_FLAG] != 1)
		begin
			$display("ERROR: Carry was not generated correctly");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: Carry generated correctly");
		end
		
		// Test addition with CarryIn (generated from previous command)
		A = 1;
		B = 1;
		OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		CarryIn = 1;
		
		#1;
		
		if(C != 3)
		begin
			$display("ERROR: 1 + 1 with a carry should equal 3");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: Addition with a carry");
		end
		
		// Test or
		A = 16'b0101010101010101;
		B = 16'b1010101010101010;
		OpCode = {`RTYPE, 4'b0000, `EXT_OR, 4'b0000};
		CarryIn = 0;
		
		#1;
		
		if(C != 16'b1111111111111111)
		begin
			$display("ERROR: Or was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: Or was correct");
		end
		
		//Test random or's
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			B = $random % 65536;
			OpCode = {`RTYPE, 4'b0000, `EXT_OR, 4'b0000};
			#1;
			if(C != (A | B))
			begin
				$display("ERROR%d: %d OR %d should equal %d, but equals %d", i, A, B, A|B, C);
			end
		end
		
		// Test xor
		A = 16'b0011001100110011;
		B = 16'b0011011011011011;
		OpCode = {`RTYPE, 4'b0000, `EXT_XOR, 4'b0000};
		
		#1;
		
		if(C != 16'b0000010111101000)
		begin
			$display("ERROR: Xor was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: Xor was correct");
		end
		
		//Test random xor's
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			B = $random % 65536;
			OpCode = {`RTYPE, 4'b0000, `EXT_XOR, 4'b0000};
			#1;
			if(C != (A ^ B))
			begin
				$display("ERROR%d: %d OR %d should equal %d, but equals %d", i, A, B, A^B, C);
			end
		end
		
		// Test and
		A = 16'b0011001100110011;
		B = 16'b0110011001100110;
		OpCode = {`RTYPE, 4'b0000, `EXT_AND, 4'b0000};
		
		#1;
		
		if(C != 16'b0010001000100010)
		begin
			$display("ERROR: And was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: And was correct");
		end
		
		//Test random and's
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			B = $random % 65536;
			OpCode = {`RTYPE, 4'b0000, `EXT_AND, 4'b0000};
			#1;
			if(C != (A & B))
			begin
				$display("ERROR%d: %d OR %d should equal %d, but equals %d", i, A, B, A&B, C);
			end
		end
		
		// Test compare
		A = 16'b0000000000000000;
		B = 16'b0000000000000001;
		OpCode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
		
		#1;
		
		if(Flags != 5'b10010)
		begin
			$display("ERROR: CMP was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: CMP was correct");
		end
		
		// Test compare edge case 1
		A = 16'b1000000000000000;
		B = 16'b0000000000000000;
		OpCode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
		
		#1;
		
		if(Flags != 5'b10000)
		begin
			$display("ERROR: CMP was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: CMP was correct");
		end
		
		// Test compare edge case 2
		A = 16'b0000000000000000;
		B = 16'b1000000000000000;
		OpCode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
		
		#1;
		
		if(Flags != 5'b00010)
		begin
			$display("ERROR: CMP was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: CMP was correct");
		end
		
		// Test compare edge case 3
		A = 16'b0000000000000001;
		B = 16'b0000000000000001;
		OpCode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
		
		#1;
		
		if(Flags != 5'b01000)
		begin
			$display("ERROR: CMP was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: CMP was correct");
		end
		
		//Test random compares
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			B = $random % 65536;
			OpCode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
			#1;
			if(($signed(A) < $signed(B)) && (Flags[`NEG_FLAG] != 1))
			begin
				$display("ERROR%d: %b compared to %b should set NEG_FLAG but it doesn't", i, A, B);
			end
			if(($unsigned(A) < $unsigned(B)) && (Flags[`LOW_FLAG] != 1))
			begin
				$display("ERROR%d: %b compared to %b should set LOW_FLAG but it doesn't", i, A, B);
			end
			if((A == B) && (Flags[`ZERO_FLAG] != 1))
			begin
				$display("ERROR%d: %b compared to %b should set ZERO_FLAG but it doesn't", i, A, B);
			end
		end
		
		// Test add immediate (this will add A + I + C since the last command created a carry)
		A = 16'b0000000000000001;
		OpCode = {`ADDI, 4'b0000, 8'b01111111};
		
		#1;
		
		if(C != 16'b0000000010000000)
		begin
			$display("ERROR: ADDI was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: ADDI was correct");
		end
		
		// Test left shift left (positive)
		A = 16'b0000000000000001;
		OpCode = {`SHIFTS, 4'b0000, `EXT_LSHI_LEFT, 4'b0001};
		
		#1;
		
		if(C != 16'b0000000000000010)
		begin
			$display("ERROR: LSHI_LEFT was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: LSHI_LEFT was correct");
		end
		
		//Test random left shifts
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			shiftAmount = $random % 16;
			OpCode = {`SHIFTS, 4'b0000, `EXT_LSHI_LEFT, shiftAmount};
			#1;
			if(C != (A << shiftAmount))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, A, shiftAmount, A<<shiftAmount, C);
			end
		end
		
		// Test left shift right (negative)
		A = 16'b1000000000000000;
		OpCode = {`SHIFTS, 4'b0000, `EXT_LSHI_RIGHT, 4'b0001};
		
		#1;
		
		if(C != 16'b0100000000000000)
		begin
			$display("ERROR: LSHI_RIGHT was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: LSHI_RIGHT was correct");
		end
		
		//Test random right shifts
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			shiftAmount = $random % 16;
			OpCode = {`SHIFTS, 4'b0000, `EXT_LSHI_RIGHT, shiftAmount};
			#1;
			if(C != (A >> shiftAmount))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, A, shiftAmount, A>>shiftAmount, C);
			end
		end
		
		// Test arithmetic shift left
		A = 16'b1011100000000000;
		OpCode = {`SHIFTS, 4'b0000, `EXT_ASHUI_LEFT, 4'b0001};
		
		#1;
		
		if(C != 16'b0111000000000000)
		begin
			$display("ERROR: ASHUI_LEFT was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: ASHUI_LEFT was correct");
		end
		
		//Test random arithmetic left shifts
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			shiftAmount = $random % 16;
			OpCode = {`SHIFTS, 4'b0000, `EXT_ASHUI_LEFT, shiftAmount};
			#1;
			if(C != (A << shiftAmount))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, A, shiftAmount, A<<<shiftAmount, C);
			end
		end
		
		// Test arithmetic shift right
		A = 16'b1000010000000000;
		OpCode = {`SHIFTS, 4'b0000, `EXT_ASHUI_RIGHT, 4'b0001};
		
		#1;
		
		if(C != 16'b1100001000000000)
		begin
			$display("ERROR: ASHUI_RIGHT was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: ASHUI_RIGHT was correct");
		end
		
		// Test arithmetic shift right edge case
		A = 16'b0100010000000000;
		OpCode = {`SHIFTS, 4'b0000, `EXT_ASHUI_RIGHT, 4'b0001};
		
		#1;
		
		if(C != 16'b0010001000000000)
		begin
			$display("ERROR: ASHUI_RIGHT was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: ASHUI_RIGHT was correct");
		end
		
		//Test random arithmetic right shifts
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			shiftAmount = $random % 16;
			OpCode = {`SHIFTS, 4'b0000, `EXT_ASHUI_RIGHT, shiftAmount};
			#1;
			if($signed(C) != ($signed(A) >>> shiftAmount))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, A, shiftAmount, $signed(A)>>>shiftAmount, C);
			end
		end
		
		// Test left shift
		A = 16'b0000000000000001;
		B = 16'b0000000000000011;
		OpCode = {`SHIFTS, 4'b0000, `EXT_LSH, 4'b0000};
		
		#1;
		
		if(C != 16'b0000000000001000)
		begin
			$display("ERROR: LSH was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: LSH was correct");
		end
		
		//Test random left shifts
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			B = $random % 16;
			OpCode = {`SHIFTS, 4'b0000, `EXT_LSH, 4'b0000};
			#1;
			if(C != (A << B))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, A, shiftAmount, A<<B, C);
			end
		end
		
		// Test unsiged arithmetic left shift
		A = 16'b0000000000000010;
		B = 16'b1111111111111111;
		OpCode = {`SHIFTS, 4'b0000, `EXT_ASHU, 4'b0000};
		
		#1;
		
		if(C != 16'b0000000000000001)
		begin
			$display("ERROR: ASHU was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: ASHU was correct");
		end
		
		// Test subtract immediate
		A = 16'b0000000000000010;
		OpCode = {`SUBI, 4'b0000, 8'b00000001};
		
		#1;
		
		if(C != 16'b0000000000000001)
		begin
			$display("ERROR: SUBI was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: SUBI was correct");
		end
		
		// Test subtract immediate edge case
		A = 16'b0000000000000000;
		OpCode = {`SUBI, 4'b0000, 8'b00000001};
		
		#1;
		
		if(C != 16'b1111111111111111)
		begin
			$display("ERROR: SUBI was not correct");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: SUBI was correct");
		end
		
		//Test random subtract immediates
		for(i = 0; i < numOfTests; i = i + 1)
		begin
			A = $random % 65536;
			subtractAmount = $random % 256;
			OpCode = {`SUBI, 4'b0000, subtractAmount};
			#1;
			if(C != ($signed(A) - $signed(subtractAmount)))
			begin
				$display("ERROR%d: %d minus %d should equal %d, but equals %d", i, $signed(A), $signed(subtractAmount), $signed(A) - $signed(subtractAmount), C);
			end
		end
		
		// Test subtract immediate overflow
		A = 16'b1000000000000000;
		OpCode = {`SUBI, 4'b0000, 8'b00000001};
		
		#1;
		
		if(Flags[`FLAG_FLAG] != 1)
		begin
			$display("ERROR: SUBI should set FLAG_FLAG when overflow is detected");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: SUBI correctly set overflow FLAG_FLAG");
		end
		
		// Test compare immediate
		A = 16'b0000000000000000;
		OpCode = {`CMPI, 4'b0000, 8'b00000001};
		
		#1;
		
		if(Flags[`LOW_FLAG] != 1'b1 && Flags[`NEG_FLAG] != 1'b1)
		begin
			$display("ERROR: CMPI should set the LOW_FLAG and CARRY_FLAG");
			$display("A: %b B: %b C: %b Flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", A, B, C, Flags);
		end
		else begin
			$display("PASS: CMPI correctly set LOW_FLAG and NEG_FLAG");
		end
	end
endmodule

