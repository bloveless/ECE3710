`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:07 09/14/2015 
// Design Name: 
// Module Name:    Register 
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
module Register(
    input [15:0] Reg_In,
    input Clk,
    input Enable,
	 input Reset,
	 output reg [15:0] Reg_Out
    );

	always @(posedge(Clk))
	begin
		if(Enable)
			Reg_Out = Reg_In;
		if(Reset)
			Reg_Out = 16'b0;
	end

endmodule
