`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:01 09/10/2015 
// Design Name: 
// Module Name:    RegisterFile 
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
module Register_File(
    input [3:0] Reg_Write,
    input [3:0] Reg_Read_A,
    input [3:0] Reg_Read_B,
    input Write_Enable,
    input Reset,
	 input [15:0] ALU_Input,
	 input Clk,
    output reg [15:0] Reg_A,
    output reg [15:0] Reg_B
    );
	 
	 //Outputs of all registers. Fed into mux (case statements).
	 wire [15:0] Reg_Out [0:15];
	 
	 //Instantiation of all 16 registers. Their enable signal is only true if Enable is true and Reg_Write is their register.
	 Register reg0(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0000)),
		.Reset(Reset),
		.Reg_Out(Reg_Out[0])
	);
	
	Register reg1(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0001)),
		.Reset(Reset),
		.Reg_Out(Reg_Out[1])
	);
	
	Register reg2(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0010)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[2])
	);
	
	Register reg3(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0011)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[3])
	);
	
	Register reg4(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0100)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[4])
	);
	
	Register reg5(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0101)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[5])
	);
	
	Register reg6(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0110)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[6])
	);

	Register reg7(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0111)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[7])
	);
	
	Register reg8(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1000)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[8])
	);
	
	Register reg9(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1001)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[9])
	);
	
	Register reg10(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1010)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[10])
	);
	
	Register reg11(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1011)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[11])
	);
	
	Register reg12(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1100)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[12])
	);
	
	Register reg13(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1101)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[13])
	);
	
	Register reg14(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1110)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[14])
	);
	
	Register reg15(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1111)), 
		.Reset(Reset),
		.Reg_Out(Reg_Out[15])
	);

	//Mux sensitivity list should be selector (Reg_Read_A and Reg_Read_B) and inputs to select from (Reg_Out).
	always @(Reg_Read_A, Reg_Read_B, Reg_Out)
	begin
		//Output mux to A input of ALU.
		case(Reg_Read_A)
			4'b0000:
				Reg_A <= Reg_Out[0];
			4'b0001:
				Reg_A <= Reg_Out[1];
			4'b0010:
				Reg_A <= Reg_Out[2];
			4'b0011:
				Reg_A <= Reg_Out[3];
			4'b0100:
				Reg_A <= Reg_Out[4];
			4'b0101:
				Reg_A <= Reg_Out[5];
			4'b0110:
				Reg_A <= Reg_Out[6];
			4'b0111:
				Reg_A <= Reg_Out[7];
			4'b1000:
				Reg_A <= Reg_Out[8];
			4'b1001:
				Reg_A <= Reg_Out[9];
			4'b1010:
				Reg_A <= Reg_Out[10];
			4'b1011:
				Reg_A <= Reg_Out[11];
			4'b1100:
				Reg_A <= Reg_Out[12];
			4'b1101:
				Reg_A <= Reg_Out[13];
			4'b1110:
				Reg_A <= Reg_Out[14];
			4'b1111:
				Reg_A <= Reg_Out[15];
		endcase
		
		//Output mux to B input of ALU.
		case(Reg_Read_B)
			4'b0000:
				Reg_B <= Reg_Out[0];
			4'b0001:
				Reg_B <= Reg_Out[1];
			4'b0010:
				Reg_B <= Reg_Out[2];
			4'b0011:
				Reg_B <= Reg_Out[3];
			4'b0100:
				Reg_B <= Reg_Out[4];
			4'b0101:
				Reg_B <= Reg_Out[5];
			4'b0110:
				Reg_B <= Reg_Out[6];
			4'b0111:
				Reg_B <= Reg_Out[7];
			4'b1000:
				Reg_B <= Reg_Out[8];
			4'b1001:
				Reg_B <= Reg_Out[9];
			4'b1010:
				Reg_B <= Reg_Out[10];
			4'b1011:
				Reg_B <= Reg_Out[11];
			4'b1100:
				Reg_B <= Reg_Out[12];
			4'b1101:
				Reg_B <= Reg_Out[13];
			4'b1110:
				Reg_B <= Reg_Out[14];
			4'b1111:
				Reg_B <= Reg_Out[15];
		endcase
	end
endmodule
