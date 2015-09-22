`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:38 09/22/2015 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input [14:0] Port_A_Address,
    input [14:0] Port_B_Address,
    input [15:0] Port_A_In,
    input [15:0] Port_B_In,
    input Port_A_WE,
    input Port_B_WE,
    input Clk,
	 output [15:0] Port_A_Out,
    output [15:0] Port_B_Out
    );

	//initial
	//$readmemh("<data_file_name>", <rom_name>, <begin_address>, <end_address>);

   always @(posedge clk)
	begin
		
	end
endmodule
