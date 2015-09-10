`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:11 03/24/2015 
// Design Name: 
// Module Name:    BCDto7Seg 
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
module BCDto7Seg(
    input [7:0] Binary,
	 input Clk,
    output reg [6:0] SevenSegment,
	 output reg [3:0] Enable,
	 output reg [3:0] LEDs
    );
	 
	 integer clkCount = 0;
	 integer onesOrTens = 0;
	 reg [3:0] curDigit =4'b0;
	 
	 always @(posedge Clk)
	 begin
	 
		clkCount = clkCount + 1;
		
		// every 50000 clock cycles show the other digit about 500us
		if(clkCount >= 50000)
		begin
			if(onesOrTens == 0) onesOrTens = 1;
			else onesOrTens = 0;
			// Reset the clock count
			clkCount = 0;
		end
		
		if(onesOrTens == 0)
		begin
			curDigit = Binary[3:0];
			// turn on the first 7 segment
			Enable = 4'b1110;
		end
		else
		begin
			curDigit = Binary[7:4];
			// turn on the second 7 segment
			Enable = 4'b1101;
		end
	 
		// turn on the leds to match the switches (debugging)
		LEDs = Binary;
		
		case(curDigit)
			4'b0000:
			begin // 0
				// S = 7'b1111110;
				SevenSegment = 7'b0000001;
			end
			4'b0001:
			begin // 1
				// S = 7'b0110000;
				SevenSegment = 7'b1001111;
			end
			4'b0010:
			begin // 2
				// S = 7'b1101101;
				SevenSegment = 7'b0010010;
			end
			4'b0011:
			begin // 3
				// S = 7'b1111001;
				SevenSegment = 7'b0000110;
			end
			4'b0100:
			begin // 4
				// S = 7'b0110011;
				SevenSegment = 7'b1001100;
			end
			4'b0101:
			begin // 5
				// S = 7'b1011011;
				SevenSegment = 7'b0100100;
			end
			4'b0110:
			begin // 6
				// S = 7'b1011111;
				SevenSegment = 7'b0100000;
			end
			4'b0111:
			begin // 7
				// S = 7'b1110000;
				SevenSegment = 7'b0001111;
			end
			4'b1000:
			begin // 8
				// S = 7'b1111111;
				SevenSegment = 7'b0000000;
			end
			4'b1001:
			begin // 9
				// S = 7'b1111011;
				SevenSegment = 7'b0000100;
			end
			4'b1010:
			begin
				//A
				SevenSegment = 7'b0001000;
			end
			4'b1011:
			begin
				//B
				SevenSegment = 7'b0000000;
			end
			4'b1100:
			begin
				//C
				SevenSegment = 7'b0110001;
			end
			4'b1101:
			begin
				//D
				SevenSegment = 7'b0000001;
			end
			4'b1110:
			begin
				//E
				SevenSegment = 7'b0110000;
			end
			4'b1111:
			begin
				//F
				SevenSegment = 7'b0111000;
			end
			default:
			begin // invlalid display -
				SevenSegment = 7'b1111110;
			end
		endcase
	 end

endmodule