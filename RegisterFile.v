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
    output [15:0] Reg_A,
    output [15:0] Reg_B
    );


endmodule
