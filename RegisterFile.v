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
module RegisterFile(
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
	 wire [15:0] Reg_0_Out;
	 wire [15:0] Reg_1_Out;
	 wire [15:0] Reg_2_Out;
	 wire [15:0] Reg_3_Out;
	 wire [15:0] Reg_4_Out;
	 wire [15:0] Reg_5_Out;
	 wire [15:0] Reg_6_Out;
	 wire [15:0] Reg_7_Out;
	 wire [15:0] Reg_8_Out;
	 wire [15:0] Reg_9_Out;
	 wire [15:0] Reg_10_Out;
	 wire [15:0] Reg_11_Out;
	 wire [15:0] Reg_12_Out;
	 wire [15:0] Reg_13_Out;
	 wire [15:0] Reg_14_Out;
	 wire [15:0] Reg_15_Out;
	 
	 //Instantiation of all 16 registers. Their enable signal is only true if Enable is true and Reg_Write is their register.
	 Register reg0(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0000)),
		.Reset(Reset),
		.Reg_Out(Reg_0_Out)
	);
	
	Register reg1(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0001)),
		.Reset(Reset),
		.Reg_Out(Reg_1_Out)
	);
	
	Register reg2(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0010)), 
		.Reset(Reset),
		.Reg_Out(Reg_2_Out)
	);
	
	Register reg3(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0011)), 
		.Reset(Reset),
		.Reg_Out(Reg_3_Out)
	);
	
	Register reg4(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0100)), 
		.Reset(Reset),
		.Reg_Out(Reg_4_Out)
	);
	
	Register reg5(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0101)), 
		.Reset(Reset),
		.Reg_Out(Reg_5_Out)
	);
	
	Register reg6(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0110)), 
		.Reset(Reset),
		.Reg_Out(Reg_6_Out)
	);

	Register reg7(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b0111)), 
		.Reset(Reset),
		.Reg_Out(Reg_7_Out)
	);
	
	Register reg8(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1000)), 
		.Reset(Reset),
		.Reg_Out(Reg_8_Out)
	);
	
	Register reg9(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1001)), 
		.Reset(Reset),
		.Reg_Out(Reg_9_Out)
	);
	
	Register reg10(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1010)), 
		.Reset(Reset),
		.Reg_Out(Reg_10_Out)
	);
	
	Register reg11(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1011)), 
		.Reset(Reset),
		.Reg_Out(Reg_11_Out)
	);
	
	Register reg12(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1100)), 
		.Reset(Reset),
		.Reg_Out(Reg_12_Out)
	);
	
	Register reg13(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1101)), 
		.Reset(Reset),
		.Reg_Out(Reg_13_Out)
	);
	
	Register reg14(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1110)), 
		.Reset(Reset),
		.Reg_Out(Reg_14_Out)
	);
	
	Register reg15(
		.Reg_In(ALU_Input), 
		.Clk(Clk),
		.Write_Enable(Write_Enable && (Reg_Write == 4'b1111)), 
		.Reset(Reset),
		.Reg_Out(Reg_15_Out)
	);

	always @(*)
	begin
		//Output mux to A input of ALU.
		case(Reg_Read_A)
			4'b0000:
				Reg_A = Reg_0_Out;
			4'b0001:
				Reg_A = Reg_1_Out;
			4'b0010:
				Reg_A = Reg_2_Out;
			4'b0011:
				Reg_A = Reg_3_Out;
			4'b0100:
				Reg_A = Reg_4_Out;
			4'b0101:
				Reg_A = Reg_5_Out;
			4'b0110:
				Reg_A = Reg_6_Out;
			4'b0111:
				Reg_A = Reg_7_Out;
			4'b1000:
				Reg_A = Reg_8_Out;
			4'b1001:
				Reg_A = Reg_9_Out;
			4'b1010:
				Reg_A = Reg_10_Out;
			4'b1011:
				Reg_A = Reg_11_Out;
			4'b1100:
				Reg_A = Reg_12_Out;
			4'b1101:
				Reg_A = Reg_13_Out;
			4'b1110:
				Reg_A = Reg_14_Out;
			4'b1111:
				Reg_A = Reg_15_Out;
		endcase
		
		//Output mux to B input of ALU.
		case(Reg_Read_B)
			4'b0000:
				Reg_B = Reg_0_Out;
			4'b0001:
				Reg_B = Reg_1_Out;
			4'b0010:
				Reg_B = Reg_2_Out;
			4'b0011:
				Reg_B = Reg_3_Out;
			4'b0100:
				Reg_B = Reg_4_Out;
			4'b0101:
				Reg_B = Reg_5_Out;
			4'b0110:
				Reg_B = Reg_6_Out;
			4'b0111:
				Reg_B = Reg_7_Out;
			4'b1000:
				Reg_B = Reg_8_Out;
			4'b1001:
				Reg_B = Reg_9_Out;
			4'b1010:
				Reg_B = Reg_10_Out;
			4'b1011:
				Reg_B = Reg_11_Out;
			4'b1100:
				Reg_B = Reg_12_Out;
			4'b1101:
				Reg_B = Reg_13_Out;
			4'b1110:
				Reg_B = Reg_14_Out;
			4'b1111:
				Reg_B = Reg_15_Out;
		endcase
	end
endmodule
