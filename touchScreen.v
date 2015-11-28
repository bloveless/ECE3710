
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:19 11/27/2015 
// Design Name: 
// Module Name:    touchScreen 
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
module touchScreen(
	input system_clock, //this is the clock input from the control
	input TP_PENIRQ, //This is the interrupt from the touchscreen, low is active
	input TP_BUSY, //Busy LOW when data sent or received
	input TP_DOUT, //this is the output from the chip giving the position 
	output reg TP_CS, //this needs to be pulled low once Interrupt enabled to start serial com
	output TP_DCLK, //This is the clock signal to the touchscreen needs to be ~2MHZ
	output reg TP_DIN, //This is the 8 bit com data to tell the chip what to output
	//[S A2 A1 A0 MODE SER/!DEF PD1 PD0]
	//to get X [1 1 0 1 1 0 1 1]
	//to get Y [1 0 0 1 1 0 0 0]
	output X_POS, //output x and y position
	output Y_POS
    );
	 
	//Assuming the clock is 63MHZ, we want a clock that is 2MHZ, count to 32 
	reg [5:0] counter = 0;
	assign TP_DCLK = counter[5] & !counter[4] & !counter[3] & !counter[2]& !counter[1]& !counter[0];
	
	always@(posedge(system_clock))
	begin
		if(counter == 6'd32)
		begin
			counter = 0;
		end
		else
		begin
			counter = counter + 1;
		end
	end
	
	always@(TP_PENIRQ)
	begin
		TP_CS=1'b0;
		TP_DIN = 1'b0;
	end
endmodule
