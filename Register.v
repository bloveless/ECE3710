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
    input [15:0] reg_in,
    input clk,
    input write_enable,
	 input reset,
	 output reg [15:0] reg_out
    );

	always @(posedge(clk))
	begin
		if(reset)
		begin
			reg_out <= 16'b0;
		end
		else if(write_enable)
		begin
			reg_out <= reg_in;
		end
		else
		begin
			reg_out <=reg_out;
		end
	end

endmodule
