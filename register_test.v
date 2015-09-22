`include "parameters.vh"
module registerFSM_test();
//This is the clock
	 reg Clk;
//this is the input to select one of the 16 registers 
    reg [3:0] Reg_Read_A;
    reg [3:0] Reg_Read_B;
//This is the register that the ALU will write to if Write_Enable 1
	 reg [3:0] Reg_Write;
    reg Write_Enable;
    reg RESET;
	 
//This is the input to the ALU 
//ALU STUFF
	 reg [15:0] OpCode;
	 reg CarryIn;
	 wire [15:0] C;
	 
//Output registers from Register, input to ALU
    wire [15:0] Reg_A;
    wire [15:0] Reg_B;
	 
	 reg [4:0] Flags;
//initialize initial register counter to 0

	
	Register_File regFile (
		.Reg_Write(Reg_Write),
		.Reg_Read_A(Reg_Read_A),
		.Reg_Read_B(Reg_Read_B),
		.Write_Enable(Write_Enable),
		.Reset(RESET),
		.ALU_Input(C),
		.Reg_A(Reg_A),
		.Reg_B(Reg_B),
		.Clk(Clk)
	);
	

	alu ALU(
		.A(Reg_A), 
		.B(Reg_B), 
		.OpCode(OpCode), 
		.CarryIn(CarryIn), //haven't implemented in ALU_FSM
		.C(C), 
		.Flags(Flags)
	);



always #4 Clk = !Clk;



initial begin
	
	Flags=5'b0;
	Clk=1;
	RESET = 1'b1;
	//changing this to from 0 to high impedence
	Write_Enable = 1'b0;
	CarryIn = 1'b0;
	
	Reg_Read_A = 4'd0;
	Reg_Read_B = 4'd0;
	//changing this to from 0 to high impedence
	Reg_Write = 4'd0;
	OpCode = 15'b0;//{`ADDI, 4'b0000, 8'b00000001};
#99



	//put 1 in the original register 1
	RESET = 1'b0;
	Reg_Read_A = 4'd8;
	Reg_Read_B = 4'd1;
	Reg_Write = 4'd0;
	OpCode = {`ADDI, 4'b0000, 8'b00000001};
	Write_Enable = 1;
#8
	if((C == 16'b1))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);		
		end
	else 
		begin
		$display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
		end

#8
		
	//Do the same for register 2
	RESET = 1'b0;
	//SHOULD CHANGE TO OTHER ZERO REGISTER
	Reg_Read_A = 4'd0;
	Reg_Read_B = 4'd1;
	Reg_Write = 4'd1;
	Write_Enable = 1;
	OpCode = {`ADDI, 4'b0000, 8'b00000001};
	if((C == 1))
		begin
			$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);

	#8
		
	RESET = 1'b0;
	Reg_Read_A = 4'd0;
	Reg_Read_B = 4'd1;
	Reg_Write = 4'd2;
	Write_Enable = 1;
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	if((C == 2))
		begin
			$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);;
	
#8
	RESET = 1'b0;
	//Now we want to add Registers 1 and registers 2
	Reg_Read_A = 4'd1;
	Reg_Read_B = 4'd2;
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 3
	Write_Enable=1'b1;
	Reg_Write = 4'd3;
	if((C == 3))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
#8
	//Now we want to add Registers 2 and registers 3
	RESET = 1'b0;
	Reg_Read_A = 4'd2; //this is 2
	Reg_Read_B = 4'd3; //this is 3
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 5
	Write_Enable=1'b1;
	Reg_Write = 4'd4;
	if((C == 5))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
#8
	RESET = 1'b0;
	//Now we want to add Registers 3 and registers 4
	Reg_Read_A = 4'd3; //this is 3
	Reg_Read_B = 4'd4; //this is 4
	Write_Enable=1'b1;
	Reg_Write = 4'd5;
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 8

	if((C == 8))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
#8
	//Now we want to add Registers 4 and registers 5
	RESET = 1'b0;
	Reg_Read_A = 4'd4; //this is 4
	Reg_Read_B = 4'd5; //this is 5
	Write_Enable=1'b1;
	Reg_Write = 4'd6;
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 13

	if((C == 13))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
#8
		//Now we want to add Registers 5 and registers 6
	RESET = 1'b0;
	Reg_Read_A = 4'd5; //this is 5
	Reg_Read_B = 4'd6; //this is 6
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 21
	Write_Enable=1'b1;
	Reg_Write = 4'd7;
	if((C == 21))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
	
#8
		//Now we want to add Registers 6 and registers 7
	Reg_Read_A = 4'd6; //this is 6
	Reg_Read_B = 4'd7; //this is 7
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 34
	Write_Enable=1'b1;
	Reg_Write = 4'd8;
	if((C == 34))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
	
#8
		//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd7; //this is 7
	Reg_Read_B = 4'd8; //this is 8
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 55
	Write_Enable=1'b1;
	Reg_Write = 4'd9;
	//this writes to Reg 9, but then the problems start
	if((C == 55))
		begin
			$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
	
#8
	RESET=0;
		//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd8; //this is 8
	Reg_Read_B = 4'd9; //this is 9
	//We want to add these two together
	OpCode ={`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 89
	Write_Enable=1'b1;
	Reg_Write = 4'd10;

	if((C == 89))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
#8
		//Now we want to add Registers 2 and registers 3
	RESET=0;
	Reg_Read_A = 4'd9; //this is 9
	Reg_Read_B = 4'd10; //this is 10
	//We want to add these two together
	OpCode ={`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 144
	Write_Enable=1'b1;
	Reg_Write = 4'd11;
	if((C == 144))
		begin
			$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
	
#8
		//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd10; //this is 10
	Reg_Read_B = 4'd11; //this is 11
	//We want to add these two together
	OpCode ={`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 233
	Write_Enable=1'b1;
	Reg_Write = 4'd12;//this is 12
	if((C == 233))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
#8
	//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd11; //this is 11
	Reg_Read_B = 4'd12; //this is 12
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 377
	Write_Enable=1'b1;
	Reg_Write = 4'd13;//this is 13
	if((C == 377))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
	
#8
	//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'b1100; //this is 12
	Reg_Read_B = 4'b1101; //this is 13
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 610
	Write_Enable=1'b1;
	Reg_Write = 4'b1110;
	if((C == 610))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
#8
	//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'b1101; //this is 12
	Reg_Read_B = 4'b1110; //this is 13
	//We want to add these two together
	OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
	//this should be 610
	Write_Enable=1'b1;
	Reg_Write = 4'b1111;
	if((C == 987))
		begin
		$display("Correct: %b %b %b %d", Reg_A, Reg_B, C, C);
			
		end
	else $display("ERROR: %b %b %b %d", Reg_A, Reg_B, C, C);
	
	
end

//initial 
	//begin 
//
	//end



endmodule
