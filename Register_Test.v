`include "parameters.vh"
module Register_Test();
//This is the clock
	 reg clk;
//this is the input to select one of the 16 registers 
    reg [3:0] reg_read_a;
    reg [3:0] reg_read_b;
//This is the register that the ALU will write to if write_enable 1
	 reg [3:0] reg_write;
    reg write_enable;
    reg reset;
	 
//This is the input to the ALU 
//ALU STUFF
	 reg [15:0] opcode;
	 reg carry_in;
	 wire [15:0] c;
	 
//Output registers from Register, input to ALU
    wire [15:0] reg_a;
    wire [15:0] reg_b;
	 
	 reg [4:0] flags;
//initialize initial register counter to 0

	
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
		.carry_in(carry_in), //haven't implemented in ALU_FSM
		.c(c), 
		.flags(flags)
	);



always #4 clk = !clk;



initial begin
	
	flags=5'b0;
	clk=1;
	reset = 1'b1;
	//changing this to from 0 to high impedence
	write_enable = 1'b0;
	carry_in = 1'b0;
	
	reg_read_a = 4'd0;
	reg_read_b = 4'd0;
	//changing this to from 0 to high impedence
	reg_write = 4'd0;
	opcode = 15'b0;//{`ADDI, 4'b0000, 8'b00000001};
#99



	//put 1 in the original register 1
	reset = 1'b0;
	reg_read_a = 4'd8;
	reg_read_b = 4'd1;
	reg_write = 4'd0;
	opcode = {`ADDI, 4'b0000, 8'b00000001};
	write_enable = 1;
#8
	if((c == 16'b1))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);		
		end
	else 
		begin
		$display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
		end

#8
		
	//Do the same for register 2
	reset = 1'b0;
	//SHOULD CHANGE TO OTHER ZERO REGISTER
	reg_read_a = 4'd0;
	reg_read_b = 4'd1;
	reg_write = 4'd1;
	write_enable = 1;
	opcode = {`ADDI, 4'b0000, 8'b00000001};
	if((c == 1))
		begin
			$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);

	#8
		
	reset = 1'b0;
	reg_read_a = 4'd0;
	reg_read_b = 4'd1;
	reg_write = 4'd2;
	write_enable = 1;
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	if((c == 2))
		begin
			$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);;
	
#8
	reset = 1'b0;
	//Now we want to add Registers 1 and registers 2
	reg_read_a = 4'd1;
	reg_read_b = 4'd2;
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 3
	write_enable=1'b1;
	reg_write = 4'd3;
	if((c == 3))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
#8
	//Now we want to add Registers 2 and registers 3
	reset = 1'b0;
	reg_read_a = 4'd2; //this is 2
	reg_read_b = 4'd3; //this is 3
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 5
	write_enable=1'b1;
	reg_write = 4'd4;
	if((c == 5))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
#8
	reset = 1'b0;
	//Now we want to add Registers 3 and registers 4
	reg_read_a = 4'd3; //this is 3
	reg_read_b = 4'd4; //this is 4
	write_enable=1'b1;
	reg_write = 4'd5;
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 8

	if((c == 8))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
#8
	//Now we want to add Registers 4 and registers 5
	reset = 1'b0;
	reg_read_a = 4'd4; //this is 4
	reg_read_b = 4'd5; //this is 5
	write_enable=1'b1;
	reg_write = 4'd6;
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 13

	if((c == 13))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
#8
		//Now we want to add Registers 5 and registers 6
	reset = 1'b0;
	reg_read_a = 4'd5; //this is 5
	reg_read_b = 4'd6; //this is 6
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 21
	write_enable=1'b1;
	reg_write = 4'd7;
	if((c == 21))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
	
#8
		//Now we want to add Registers 6 and registers 7
	reg_read_a = 4'd6; //this is 6
	reg_read_b = 4'd7; //this is 7
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 34
	write_enable=1'b1;
	reg_write = 4'd8;
	if((c == 34))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
	
#8
		//Now we want to add Registers 2 and registers 3
	reg_read_a = 4'd7; //this is 7
	reg_read_b = 4'd8; //this is 8
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 55
	write_enable=1'b1;
	reg_write = 4'd9;
	//this writes to Reg 9, but then the problems start
	if((c == 55))
		begin
			$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
	
#8
	reset=0;
		//Now we want to add Registers 2 and registers 3
	reg_read_a = 4'd8; //this is 8
	reg_read_b = 4'd9; //this is 9
	//We want to add these two together
	opcode ={`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 89
	write_enable=1'b1;
	reg_write = 4'd10;

	if((c == 89))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
#8
		//Now we want to add Registers 2 and registers 3
	reset=0;
	reg_read_a = 4'd9; //this is 9
	reg_read_b = 4'd10; //this is 10
	//We want to add these two together
	opcode ={`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 144
	write_enable=1'b1;
	reg_write = 4'd11;
	if((c == 144))
		begin
			$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
	
#8
		//Now we want to add Registers 2 and registers 3
	reg_read_a = 4'd10; //this is 10
	reg_read_b = 4'd11; //this is 11
	//We want to add these two together
	opcode ={`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 233
	write_enable=1'b1;
	reg_write = 4'd12;//this is 12
	if((c == 233))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
#8
	//Now we want to add Registers 2 and registers 3
	reg_read_a = 4'd11; //this is 11
	reg_read_b = 4'd12; //this is 12
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 377
	write_enable=1'b1;
	reg_write = 4'd13;//this is 13
	if((c == 377))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
	
#8
	//Now we want to add Registers 2 and registers 3
	reg_read_a = 4'b1100; //this is 12
	reg_read_b = 4'b1101; //this is 13
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 610
	write_enable=1'b1;
	reg_write = 4'b1110;
	if((c == 610))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
#8
	//Now we want to add Registers 2 and registers 3
	reg_read_a = 4'b1101; //this is 12
	reg_read_b = 4'b1110; //this is 13
	//We want to add these two together
	opcode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 610
	write_enable=1'b1;
	reg_write = 4'b1111;
	if((c == 987))
		begin
		$display("Correct: %b %b %b %d", reg_a, reg_b, c, c);
			
		end
	else $display("ERROR: %b %b %b %d", reg_a, reg_b, c, c);
	
	
end

//initial 
	//begin 
//
	//end



endmodule
