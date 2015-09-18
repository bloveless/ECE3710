`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:49 09/13/2015 
// Design Name: 
// Module Name:    RegisterFile_FSM 
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

module RegisterFile_FSM(Clk, RESET, SevenSegment, Enable, LED);

	reg [32:0] counter;
	reg [32:0] operation;
	input RESET;
	input Clk;

	reg[3:0] Reg_Write;
	reg [3:0] Reg_Read_A;
	reg [3:0] Reg_Read_B;
	reg 		Write_Enable;
	reg 		Reset;
	
	reg      [15:0] OpCode;
	reg					CarryIn;
	wire [15:0] C;
	wire [4:0]  Flags;
	
	output wire [6:0] SevenSegment;
	output wire [3:0] Enable;
	output wire [3:0] LED;
	
	RegisterFile regFile (
		.Reg_Write(Reg_Write),
		.Reg_Read_A(Reg_Read_A),
		.Reg_Read_B(Reg_Read_B),
		.Write_Enable(Write_Enable),
		.Reset(Reset),
		.ALU_Input(C),
		.Reg_A(Reg_A),
		.Reg_B(Reg_B),
		.Clk(Clk)
	);
	
	alu ALU (
	   .A(Reg_Read_A),
		.B(Reg_Read_B),
		.OpCode(OpCode),
		.CarryIn(CarryIn),
		.C(C),
		.Flags(Flags)
	);
	
	BCDto7Seg bcd (
		.Binary(C),
		.Clk(Clk),
		.SevenSegment(SevenSegment),
		.Enable(Enable),
		.LEDs(LED)
	);

	always @(posedge Clk)
		begin
		if(RESET == 1'b1)
			begin
				counter <= 4'd0;
				operation <= 4'd0;
			end
		else
			begin
			if(counter == 32'b10001111000011010001100000000)
				begin
					counter <= 32'b0;
					operation <= operation + 1'b1;
				end
			else 
				begin
					counter <= counter+ 1'b1;
				end
			end
		end
		
	always @(*)
	begin
		if(RESET == 1'b1)
		begin
			Reset = 1'b1;
			Reg_Write = 4'b0000;
			Reg_Read_A = 4'b0000;
			Reg_Read_B = 4'b0000;
			Write_Enable = 0;
			
			OpCode = 16'b0000000000000000;
		end
		
		CarryIn = 1'b0;

		case(operation)
			0:
			begin
				// put 1 into reg 0
				Reset = 1'b0;
				Reg_Read_A = 4'd0;
				Reg_Read_B = 4'd0;
				Reg_Write = 4'd0;
				Write_Enable = 1;
				OpCode = {`ADDI, 4'b0000, 8'b00000001};
			end
			1:
			begin
				// put 1 into reg 1
				Reset = 1'b0;
				Reg_Read_A = 4'd0;
				Reg_Read_B = 4'd0;
				Reg_Write = 4'd1;
				Write_Enable = 1;
				OpCode = {`ADDI, 4'b0000, 8'b00000001};
			end
			2:
			begin
				// Add Reg0 + Reg1 into Reg2
				Reset = 1'b0;
				Reg_Read_A = 4'd0;
				Reg_Read_B = 4'd1;
				Reg_Write = 4'd2;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			3:
			begin
				// Add Reg1 + Reg2 into Reg3
				Reset = 1'b0;
				Reg_Read_A = 4'd1;
				Reg_Read_B = 4'd2;
				Reg_Write = 4'd3;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			4:
			begin
				// Add Reg2 + Reg3 into Reg4
				Reset = 1'b0;
				Reg_Read_A = 4'd2;
				Reg_Read_B = 4'd3;
				Reg_Write = 4'd4;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			5:
			begin
				// Add Reg3 + Reg4 into Reg5
				Reset = 1'b0;
				Reg_Read_A = 4'd3;
				Reg_Read_B = 4'd4;
				Reg_Write = 4'd5;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			6:
			begin
				// Add Reg4 + Reg5 into Reg6
				Reset = 1'b0;
				Reg_Read_A = 4'd4;
				Reg_Read_B = 4'd5;
				Reg_Write = 4'd6;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			7:
			begin
				// Add Reg5 + Reg6 into Reg7
				Reset = 1'b0;
				Reg_Read_A = 4'd5;
				Reg_Read_B = 4'd6;
				Reg_Write = 4'd7;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			8:
			begin
				// Add Reg6 + Reg7 into Reg8
				Reset = 1'b0;
				Reg_Read_A = 4'd6;
				Reg_Read_B = 4'd7;
				Reg_Write = 4'd8;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			9:
			begin
				// Add Reg7 + Reg8 into Reg9
				Reset = 1'b0;
				Reg_Read_A = 4'd7;
				Reg_Read_B = 4'd8;
				Reg_Write = 4'd9;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			10:
			begin
				// Add Reg8 + Reg9 into Reg10
				Reset = 1'b0;
				Reg_Read_A = 4'd8;
				Reg_Read_B = 4'd9;
				Reg_Write = 4'd10;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			11:
			begin
				// Add Reg9 + Reg10 into Reg11
				Reset = 1'b0;
				Reg_Read_A = 4'd9;
				Reg_Read_B = 4'd10;
				Reg_Write = 4'd11;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			12:
			begin
				// Add Reg10 + Reg11 into Reg12
				Reset = 1'b0;
				Reg_Read_A = 4'd10;
				Reg_Read_B = 4'd11;
				Reg_Write = 4'd12;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			13:
			begin
				// Add Reg11 + Reg12 into Reg13
				Reset = 1'b0;
				Reg_Read_A = 4'd11;
				Reg_Read_B = 4'd12;
				Reg_Write = 4'd13;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			14:
			begin
				// Add Reg12 + Reg13 into Reg14
				Reset = 1'b0;
				Reg_Read_A = 4'd12;
				Reg_Read_B = 4'd13;
				Reg_Write = 4'd14;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			15:
			begin
				// Add Reg13 + Reg14 into Reg15
				Reset = 1'b0;
				Reg_Read_A = 4'd13;
				Reg_Read_B = 4'd14;
				Reg_Write = 4'd15;
				Write_Enable = 1;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
			end
			default:
			begin
				// Add Reg13 + Reg14 into Reg15
				Reset = 1'b0;
				Reg_Read_A = 4'd0;
				Reg_Read_B = 4'd0;
				Reg_Write = 4'd0;
				Write_Enable = 0;
				OpCode = {`RTYPE, 4'b0000, `EXT_ADD, 4'b0000};
				
				// restart the operation
				operation = 0;
			end
		endcase
	end

endmodule