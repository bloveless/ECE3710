`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:12 09/05/2015
// Design Name:   alu
// Module Name:   c:/Users/Brennnon/Documents/GitRepos/ECE3710/alu_test.v
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

module ALU_Test;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg [15:0] opcode;
	reg carry_in;

	// Outputs
	wire [15:0] c;
	wire [4:0] flags;
	
	//For loop integer
	integer i;
	
	//Number of random tests per op
	integer num_of_tests;
	
	//To hold the carry of the previous op
	reg [15:0] carry;
	
	//Used to store random shift amount
	reg [3:0] shift_amount;
	
	//Used to store random subrtaction immediate
	reg [7:0] subtract_amount;
	
	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.opcode(opcode), 
		.carry_in(carry_in),
		.c(c), 
		.flags(flags)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		carry_in = 0;
		opcode = 0;
		num_of_tests = 20;

		// Wait 100 ns for global reset to finish
		#100;
		
		// opcode : 15-12
		// Rdest  : 11-8
		// OpCodeExt : 7-4
		// Rsrc : 3 - 0
		
		// Test addition
		a = 10;
		b = 10;
		opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if((c != 20) || (flags != 5'b00000))
		begin
			$display("ERROR: 10 + 10 should equal 20, and flags should equal 0");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: 10 + 10 Passed");
		end
		
		// Test addition edge case 1
		a = 0;
		b = 0;
		opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if((c != 0) || (flags != 5'b01000))
		begin
			$display("ERROR: 0 + 0 should equal 0, and flags should equal 0");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: 10 + 10 Passed");
		end
		
		// Test addition edge case 2
		a = 16'b1000000000000000;
		b = 16'b1000000000000000;
		opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if((c != 0) || (flags != 5'b01101))
		begin
			$display("ERROR: %b + %b should equal 0, and flags should equal 11001", a, b);
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: 10 + 10 Passed");
		end
		
		// Test addition edge case 3
		a = 16'b0100000000000000;
		b = 16'b0100000000000000;
		opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if((c != 16'b1000000000000000) || (flags != 5'b00100))
		begin
			$display("ERROR: %b + %b should equal 1000000000000001 (carry from previous), and flags should equal 00100", a, b);
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: 10 + 10 Passed");
		end
		
		//Test random additions
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			b = $random % 65536;
			opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			#1;
			if(c != (a + b + carry_in))
			begin
				$display("ERROR%d: %d + %d + %d should equal %d, but equals %d", i, a, b, carry, a + b + carry, c);
			end
		end
		
		// Test addition overflow
		a = 16'b0111111111111111;
		b = 1;
		opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if(flags[`FLAG_FLAG] != 1)
		begin
			$display("ERROR: Overflow should be reflected in the FLAG_FLAG");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: Addition overflow was detected correctly");
		end
		
		// Test generation of carry
		a = 16'b1111111111111111;
		b = 1;
		opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		
		#1;
		
		if(flags[`CARRY_FLAG] != 1)
		begin
			$display("ERROR: Carry was not generated correctly");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: Carry generated correctly");
		end
		
		// Test addition with carry_in (generated from previous command)
		a = 1;
		b = 1;
		opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
		carry_in = 1;
		
		#1;
		
		if(c != 3)
		begin
			$display("ERROR: 1 + 1 with a carry should equal 3");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: Addition with a carry");
		end
		
		// Test or
		a = 16'b0101010101010101;
		b = 16'b1010101010101010;
		opcode = {`RTYPE, 4'b0000, `EXT_OR, 4'b0000};
		carry_in = 0;
		
		#1;
		
		if(c != 16'b1111111111111111)
		begin
			$display("ERROR: Or was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: Or was correct");
		end
		
		//Test random or's
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			b = $random % 65536;
			opcode = {`RTYPE, 4'b0000, `EXT_OR, 4'b0000};
			#1;
			if(c != (a | b))
			begin
				$display("ERROR%d: %d OR %d should equal %d, but equals %d", i, a, b, a|b, c);
			end
		end
		
		// Test xor
		a = 16'b0011001100110011;
		b = 16'b0011011011011011;
		opcode = {`RTYPE, 4'b0000, `EXT_XOR, 4'b0000};
		
		#1;
		
		if(c != 16'b0000010111101000)
		begin
			$display("ERROR: Xor was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: Xor was correct");
		end
		
		//Test random xor's
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			b = $random % 65536;
			opcode = {`RTYPE, 4'b0000, `EXT_XOR, 4'b0000};
			#1;
			if(c != (a ^ b))
			begin
				$display("ERROR%d: %d OR %d should equal %d, but equals %d", i, a, b, a^b, c);
			end
		end
		
		// Test and
		a = 16'b0011001100110011;
		b = 16'b0110011001100110;
		opcode = {`RTYPE, 4'b0000, `EXT_AND, 4'b0000};
		
		#1;
		
		if(c != 16'b0010001000100010)
		begin
			$display("ERROR: And was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: And was correct");
		end
		
		//Test random and's
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			b = $random % 65536;
			opcode = {`RTYPE, 4'b0000, `EXT_AND, 4'b0000};
			#1;
			if(c != (a & b))
			begin
				$display("ERROR%d: %d OR %d should equal %d, but equals %d", i, a, b, a&b, c);
			end
		end
		
		// Test compare
		a = 16'b0000000000000000;
		b = 16'b0000000000000001;
		opcode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
		
		#1;
		
		if(flags != 5'b10010)
		begin
			$display("ERROR: CMP was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: CMP was correct");
		end
		
		// Test compare edge case 1
		a = 16'b1000000000000000;
		b = 16'b0000000000000000;
		opcode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
		
		#1;
		
		if(flags != 5'b10000)
		begin
			$display("ERROR: CMP was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: CMP was correct");
		end
		
		// Test compare edge case 2
		a = 16'b0000000000000000;
		b = 16'b1000000000000000;
		opcode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
		
		#1;
		
		if(flags != 5'b00010)
		begin
			$display("ERROR: CMP was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: CMP was correct");
		end
		
		// Test compare edge case 3
		a = 16'b0000000000000001;
		b = 16'b0000000000000001;
		opcode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
		
		#1;
		
		if(flags != 5'b01000)
		begin
			$display("ERROR: CMP was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: CMP was correct");
		end
		
		//Test random compares
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			b = $random % 65536;
			opcode = {`RTYPE, 4'b0000, `EXT_CMP, 4'b0000};
			#1;
			if(($signed(a) < $signed(b)) && (flags[`NEG_FLAG] != 1))
			begin
				$display("ERROR%d: %b compared to %b should set NEG_FLAG but it doesn't", i, a, b);
			end
			if(($unsigned(a) < $unsigned(b)) && (flags[`LOW_FLAG] != 1))
			begin
				$display("ERROR%d: %b compared to %b should set LOW_FLAG but it doesn't", i, a, b);
			end
			if((a == b) && (flags[`ZERO_FLAG] != 1))
			begin
				$display("ERROR%d: %b compared to %b should set ZERO_FLAG but it doesn't", i, a, b);
			end
		end
		
		// Test add immediate (this will add a + I + c since the last command created a carry)
		a = 16'b0000000000000001;
		opcode = {`ADDI, 4'b0000, 8'b01111111};
		
		#1;
		
		if(c != 16'b0000000010000000)
		begin
			$display("ERROR: ADDI was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: ADDI was correct");
		end
		
		// Test left shift left (positive)
		a = 16'b0000000000000001;
		opcode = {`SHIFTS, 4'b0000, `EXT_LSHI_LEFT, 4'b0001};
		
		#1;
		
		if(c != 16'b0000000000000010)
		begin
			$display("ERROR: LSHI_LEFT was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: LSHI_LEFT was correct");
		end
		
		//Test random left shifts
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			shift_amount = $random % 16;
			opcode = {`SHIFTS, 4'b0000, `EXT_LSHI_LEFT, shift_amount};
			#1;
			if(c != (a << shift_amount))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, a, shift_amount, a<<shift_amount, c);
			end
		end
		
		// Test left shift right (negative)
		a = 16'b1000000000000000;
		opcode = {`SHIFTS, 4'b0000, `EXT_LSHI_RIGHT, 4'b0001};
		
		#1;
		
		if(c != 16'b0100000000000000)
		begin
			$display("ERROR: LSHI_RIGHT was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: LSHI_RIGHT was correct");
		end
		
		//Test random right shifts
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			shift_amount = $random % 16;
			opcode = {`SHIFTS, 4'b0000, `EXT_LSHI_RIGHT, shift_amount};
			#1;
			if(c != (a >> shift_amount))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, a, shift_amount, a>>shift_amount, c);
			end
		end
		
		// Test arithmetic shift left
		a = 16'b1011100000000000;
		opcode = {`SHIFTS, 4'b0000, `EXT_ASHUI_LEFT, 4'b0001};
		
		#1;
		
		if(c != 16'b0111000000000000)
		begin
			$display("ERROR: ASHUI_LEFT was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: ASHUI_LEFT was correct");
		end
		
		//Test random arithmetic left shifts
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			shift_amount = $random % 16;
			opcode = {`SHIFTS, 4'b0000, `EXT_ASHUI_LEFT, shift_amount};
			#1;
			if(c != (a << shift_amount))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, a, shift_amount, a<<<shift_amount, c);
			end
		end
		
		// Test arithmetic shift right
		a = 16'b1000010000000000;
		opcode = {`SHIFTS, 4'b0000, `EXT_ASHUI_RIGHT, 4'b0001};
		
		#1;
		
		if(c != 16'b1100001000000000)
		begin
			$display("ERROR: ASHUI_RIGHT was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: ASHUI_RIGHT was correct");
		end
		
		// Test arithmetic shift right edge case
		a = 16'b0100010000000000;
		opcode = {`SHIFTS, 4'b0000, `EXT_ASHUI_RIGHT, 4'b0001};
		
		#1;
		
		if(c != 16'b0010001000000000)
		begin
			$display("ERROR: ASHUI_RIGHT was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: ASHUI_RIGHT was correct");
		end
		
		//Test random arithmetic right shifts
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			shift_amount = $random % 16;
			opcode = {`SHIFTS, 4'b0000, `EXT_ASHUI_RIGHT, shift_amount};
			#1;
			if($signed(c) != ($signed(a) >>> shift_amount))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, a, shift_amount, $signed(a)>>>shift_amount, c);
			end
		end
		
		// Test left shift
		a = 16'b0000000000000001;
		b = 16'b0000000000000011;
		opcode = {`SHIFTS, 4'b0000, `EXT_LSH, 4'b0000};
		
		#1;
		
		if(c != 16'b0000000000001000)
		begin
			$display("ERROR: LSH was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: LSH was correct");
		end
		
		//Test random left shifts
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			b = $random % 16;
			opcode = {`SHIFTS, 4'b0000, `EXT_LSH, 4'b0000};
			#1;
			if(c != (a << b))
			begin
				$display("ERROR%d: %b shifted left %d should equal %b, but equals %b", i, a, shift_amount, a<<b, c);
			end
		end
		
		// Test unsiged arithmetic left shift
		a = 16'b0000000000000010;
		b = 16'b1111111111111111;
		opcode = {`SHIFTS, 4'b0000, `EXT_ASHU, 4'b0000};
		
		#1;
		
		if(c != 16'b0000000000000001)
		begin
			$display("ERROR: ASHU was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: ASHU was correct");
		end
		
		// Test subtract immediate
		a = 16'b0000000000000010;
		opcode = {`SUBI, 4'b0000, 8'b00000001};
		
		#1;
		
		if(c != 16'b0000000000000001)
		begin
			$display("ERROR: SUBI was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: SUBI was correct");
		end
		
		// Test subtract immediate edge case
		a = 16'b0000000000000000;
		opcode = {`SUBI, 4'b0000, 8'b00000001};
		
		#1;
		
		if(c != 16'b1111111111111111)
		begin
			$display("ERROR: SUBI was not correct");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: SUBI was correct");
		end
		
		//Test random subtract immediates
		for(i = 0; i < num_of_tests; i = i + 1)
		begin
			a = $random % 65536;
			subtract_amount = $random % 256;
			opcode = {`SUBI, 4'b0000, subtract_amount};
			#1;
			if(c != ($signed(a) - $signed(subtract_amount)))
			begin
				$display("ERROR%d: %d minus %d should equal %d, but equals %d", i, $signed(a), $signed(subtract_amount), $signed(a) - $signed(subtract_amount), c);
			end
		end
		
		// Test subtract immediate overflow
		a = 16'b1000000000000000;
		opcode = {`SUBI, 4'b0000, 8'b00000001};
		
		#1;
		
		if(flags[`FLAG_FLAG] != 1)
		begin
			$display("ERROR: SUBI should set FLAG_FLAG when overflow is detected");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: SUBI correctly set overflow FLAG_FLAG");
		end
		
		// Test compare immediate
		a = 16'b0000000000000000;
		opcode = {`CMPI, 4'b0000, 8'b00000001};
		
		#1;
		
		if(flags[`LOW_FLAG] != 1'b1 && flags[`NEG_FLAG] != 1'b1)
		begin
			$display("ERROR: CMPI should set the LOW_FLAG and CARRY_FLAG");
			$display("a: %b b: %b c: %b flags: %b [NEG, ZERO, FLAG, LOW, CARRY]", a, b, c, flags);
		end
		else begin
			$display("PASS: CMPI correctly set LOW_FLAG and NEG_FLAG");
		end
	end
endmodule

