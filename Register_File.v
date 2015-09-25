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
    input [3:0] reg_write,
    input [3:0] reg_read_a,
    input [3:0] reg_read_b,
    input write_enable,
    input reset,
	 input [15:0] alu_input,
	 input clk,
    output reg [15:0] reg_a,
    output reg [15:0] reg_b
    );
	 
	 //Outputs of all registers. Fed into mux (case statements).
	 wire [15:0] reg_out [0:15];
	 
	 //Instantiation of all 16 registers. Their enable signal is only true if Enable is true and reg_write is their register.
	 Register reg0(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b0000)),
		.reset(reset),
		.reg_out(reg_out[0])
	);
	
	Register reg1(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b0001)),
		.reset(reset),
		.reg_out(reg_out[1])
	);
	
	Register reg2(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b0010)), 
		.reset(reset),
		.reg_out(reg_out[2])
	);
	
	Register reg3(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b0011)), 
		.reset(reset),
		.reg_out(reg_out[3])
	);
	
	Register reg4(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b0100)), 
		.reset(reset),
		.reg_out(reg_out[4])
	);
	
	Register reg5(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b0101)), 
		.reset(reset),
		.reg_out(reg_out[5])
	);
	
	Register reg6(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b0110)), 
		.reset(reset),
		.reg_out(reg_out[6])
	);

	Register reg7(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b0111)), 
		.reset(reset),
		.reg_out(reg_out[7])
	);
	
	Register reg8(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b1000)), 
		.reset(reset),
		.reg_out(reg_out[8])
	);
	
	Register reg9(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b1001)), 
		.reset(reset),
		.reg_out(reg_out[9])
	);
	
	Register reg10(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b1010)), 
		.reset(reset),
		.reg_out(reg_out[10])
	);
	
	Register reg11(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b1011)), 
		.reset(reset),
		.reg_out(reg_out[11])
	);
	
	Register reg12(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b1100)), 
		.reset(reset),
		.reg_out(reg_out[12])
	);
	
	Register reg13(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b1101)), 
		.reset(reset),
		.reg_out(reg_out[13])
	);
	
	Register reg14(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b1110)), 
		.reset(reset),
		.reg_out(reg_out[14])
	);
	
	Register reg15(
		.reg_in(alu_input), 
		.clk(clk),
		.write_enable(write_enable && (reg_write == 4'b1111)), 
		.reset(reset),
		.reg_out(reg_out[15])
	);

	//Mux sensitivity list should be selector (reg_read_a and reg_read_b) and inputs to select from (reg_out).
	always @(reg_read_a, reg_read_b, reg_out)
	begin
		//Output mux to A input of ALU.
		case(reg_read_a)
			4'b0000:
				reg_a <= reg_out[0];
			4'b0001:
				reg_a <= reg_out[1];
			4'b0010:
				reg_a <= reg_out[2];
			4'b0011:
				reg_a <= reg_out[3];
			4'b0100:
				reg_a <= reg_out[4];
			4'b0101:
				reg_a <= reg_out[5];
			4'b0110:
				reg_a <= reg_out[6];
			4'b0111:
				reg_a <= reg_out[7];
			4'b1000:
				reg_a <= reg_out[8];
			4'b1001:
				reg_a <= reg_out[9];
			4'b1010:
				reg_a <= reg_out[10];
			4'b1011:
				reg_a <= reg_out[11];
			4'b1100:
				reg_a <= reg_out[12];
			4'b1101:
				reg_a <= reg_out[13];
			4'b1110:
				reg_a <= reg_out[14];
			4'b1111:
				reg_a <= reg_out[15];
		endcase
		
		//Output mux to B input of ALU.
		case(reg_read_b)
			4'b0000:
				reg_b <= reg_out[0];
			4'b0001:
				reg_b <= reg_out[1];
			4'b0010:
				reg_b <= reg_out[2];
			4'b0011:
				reg_b <= reg_out[3];
			4'b0100:
				reg_b <= reg_out[4];
			4'b0101:
				reg_b <= reg_out[5];
			4'b0110:
				reg_b <= reg_out[6];
			4'b0111:
				reg_b <= reg_out[7];
			4'b1000:
				reg_b <= reg_out[8];
			4'b1001:
				reg_b <= reg_out[9];
			4'b1010:
				reg_b <= reg_out[10];
			4'b1011:
				reg_b <= reg_out[11];
			4'b1100:
				reg_b <= reg_out[12];
			4'b1101:
				reg_b <= reg_out[13];
			4'b1110:
				reg_b <= reg_out[14];
			4'b1111:
				reg_b <= reg_out[15];
		endcase
	end
endmodule
