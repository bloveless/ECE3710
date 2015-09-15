module registerFSM_test;
//This is the clock
	 reg clk;
//this is the input to select one of the 16 registers 
    reg [3:0] Reg_Read_A;
    reg [3:0] Reg_Read_B;
//This is the register that the ALU will write to if Write_Enable 1
	 reg [3:0] Reg_Write;
    reg Write_Enable;
    reg Reset;
	 
//This is the input to the ALU 
//ALU STUFF
	 reg [15:0] OpCode;
	 reg CarryIn = 1'b0;
	 reg [15:0] C;
	 
//Output registers from Register, input to ALU
    reg [15:0] Reg_A;
    reg [15:0] Reg_B;
	 
	 reg [4:0] flags;
//initialize initial register counter to 0

	integer counter = 0;

RegisterFile uut (
		.Reg_Read_A(Reg_Read_A), 
		.Reg_Read_B(Reg_Read_B), 
		.Reg_Write(Reg_Write), 
		.Write_Enable(Write_Enable),
		.Reset(Reset), 
		.Reg_A(Reg_A),
		.Reg_B(Reg_B),
		.Clk(clk)
	);
alu ALU(
		.A(Reg_A), 
		.B(Reg_B), 
		.OpCode(OpCode), 
		//.CarryIn(CarryIn), haven't implemented in ALU_FSM
		.C(C), 
		.Flags(flags)
	);

//Create two-dimensional regiseer to store 16, 16 bit registers

parameter alu_ADD_Code = 16'b1010000;

parameter alu_immediate_One= 16'b101000000000001;

initial begin
#100

	//put 1 in the original register 1 
	Reg_Read_A = 4'b0000;
	//We want to write to the same registers
	Reg_Write = 4'b0000;
	Write_Enable=1'b1;
	//add immediate 1 to the value 0
	OpCode = alu_immediate_One;
	if((C != 1))
		begin
			$display("ERROR: 0 + 1 should equal 1");
		end
	else $display("Correct: 1");
#2
	//Do the same for register 2
	Reg_Read_B = 4'b0001;
	//We want to write to the same registers
	Write_Enable=1'b1;
	Reg_Write = 4'b0001;
 	//add immediate 1 to the value 0
	OpCode = alu_immediate_One;
	if((C != 1))
		begin
			$display("ERROR: 0 + 1 should equal 1");
		end
	else $display("Correct: 1");
	#2
	//Now we want to add Registers 0 and registers 1
	Reg_Read_A = 4'b0000;
	Reg_Read_B = 4'b0001;
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//We want to write to Register 
	//this should be 2
	Write_Enable=1'b1;
	Reg_Write = 4'd2;
	if((C != 2))
		begin
			$display("ERROR: 1 + 1 should equal 2");
		end
	else $display("Correct: 2");
	
#2
	//Now we want to add Registers 1 and registers 2
	Reg_Read_A = 4'd1;
	Reg_Read_B = 4'd2;
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 3
	Write_Enable=1'b1;
	Reg_Write = 4'd3;
	if((C != 3))
		begin
			$display("ERROR: 2 + 1 should equal 3");
		end
	else $display("Correct: 3");
	#2
	//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd2; //this is 2
	Reg_Read_B = 4'd3; //this is 3
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 5
	Write_Enable=1'b1;
	Reg_Write = 4'd4;
	if((C != 5))
		begin
			$display("ERROR: 3 + 2 should equal 5");
		end
	else $display("Correct: 5");
		
	//Now we want to add Registers 3 and registers 4
	Reg_Read_A = 4'd3; //this is 3
	Reg_Read_B = 4'd4; //this is 4
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 8
	Write_Enable=1'b1;
	Reg_Write = 4'd5;
	if((C != 8))
		begin
			$display("ERROR: 5 + 3 should equal 8");
		end
	else $display("Correct: 8");
	#2
	//Now we want to add Registers 4 and registers 5
	Reg_Read_A = 4'd4; //this is 4
	Reg_Read_B = 4'd5; //this is 5
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 13
	Write_Enable=1'b1;
	Reg_Write = 4'd6;
	if((C != 13))
		begin
			$display("ERROR: 8 + 5 should equal 13");
		end
	else $display("Correct: 13");
	#2
		//Now we want to add Registers 5 and registers 6
	Reg_Read_A = 4'd5; //this is 5
	Reg_Read_B = 4'd6; //this is 6
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 21
	Write_Enable=1'b1;
	Reg_Write = 4'd7;
	if((C != 21))
		begin
			$display("ERROR: 13 + 8 should equal 21");
		end
	else $display("Correct: 21");
	
	#2
		//Now we want to add Registers 6 and registers 7
	Reg_Read_A = 4'd6; //this is 6
	Reg_Read_B = 4'd7; //this is 7
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 34
	Write_Enable=1'b1;
	Reg_Write = 4'd8;
	if((C != 34))
		begin
			$display("ERROR: 21 + 13 should equal 34");
		end
	else $display("Correct: 34");
	
	#2
		//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd7; //this is 7
	Reg_Read_B = 4'd8; //this is 8
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 55
	Write_Enable=1'b1;
	Reg_Write = 4'd9;
	if((C != 55))
		begin
			$display("ERROR: 34 + 21 should equal 55");
		end
	else $display("Correct: 55");
	
	#2
		//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd8; //this is 8
	Reg_Read_B = 4'd9; //this is 9
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 89
	Write_Enable=1'b1;
	Reg_Write = 4'd10;
	if((C != 89))
		begin
			$display("ERROR: 55 + 34 should equal 89");
		end
	else $display("Correct: 89");
	
		//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd9; //this is 9
	Reg_Read_B = 4'd10; //this is 10
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 144
	Write_Enable=1'b1;
	Reg_Write = 4'd11;
	if((C != 144))
		begin
			$display("ERROR: 89 + 55 should equal 144");
		end
	else $display("Correct: 144");
	
	#2
		//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd10; //this is 10
	Reg_Read_B = 4'd11; //this is 11
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 233
	Write_Enable=1'b1;
	Reg_Write = 4'd12;
	if((C != 233))
		begin
			$display("ERROR: 144 + 89 should equal 233");
		end
	else $display("Correct: 233");
	#2
	//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd11; //this is 11
	Reg_Read_B = 4'd12; //this is 12
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 377
	Write_Enable=1'b1;
	Reg_Write = 4'd13;
	if((C != 377))
		begin
			$display("ERROR: 233 + 144 should equal 377");
		end
	else $display("Correct: 377");
	
	#2
	//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd12; //this is 12
	Reg_Read_B = 4'd13; //this is 13
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 610
	Write_Enable=1'b1;
	Reg_Write = 4'd14;
	if((C != 610))
		begin
			$display("ERROR: 377 + 233 should equal 610");
		end
	else $display("Correct: 610");
	#2
	//Now we want to add Registers 2 and registers 3
	Reg_Read_A = 4'd13; //this is 13
	Reg_Read_B = 4'd14; //this is 14
	//We want to add these two together
	OpCode = alu_ADD_Code;
	//this should be 987
	Write_Enable=1'b1;
	Reg_Write = 4'd15;
	if((C != 987))
		begin
			$display("ERROR: 377 + 610 should equal 987");
		end
	else $display("Correct: 987");
	
	
end

initial 
	begin 
	clk = 1;
	Reset = 1'b0;
	Write_Enable = 1'b0;
	end

always #1 clk = !clk;


endmodule
