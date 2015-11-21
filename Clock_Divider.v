`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:50 11/19/2015 
// Design Name: 
// Module Name:    Clock_Divider 
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
module Clock_Divider(
    input clk,
    output NineMHz
    );
	
	reg [3:0] counter = 0;
	assign NineMHz = !counter[3] & !counter[2] & !counter[1] & !counter[0];
	
	always@(posedge(clk))
	begin
		if(counter == 4'd7)
		begin
			counter = 0;
		end
		else
		begin
			counter = counter + 1;
		end
	end
endmodule
