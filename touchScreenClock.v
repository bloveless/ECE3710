`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:27:04 11/28/2015 
// Design Name: 
// Module Name:    touchScreenClock 
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
module touchScreenClock(
    input system_clock,
    output 2MHZ
    );
	
	//Assuming the clock is 63MHZ, we want a clock that is 2MHZ, count to 32 
	reg [4:0] counter = 0;
	assign NineMHz = !counter[4] & !counter[3] & !counter[2] & !counter[1]& !counter[0];
	
	always@(posedge(clk))
	begin
		if(counter == 5'd32)
		begin
			counter = 0;
		end
		else
		begin
			counter = counter + 1;
		end
	end
endmodule

endmodule
