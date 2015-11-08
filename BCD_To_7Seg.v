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
module BCD_To_7Seg(
    input [15:0] binary,
	 input clk,
    output reg [6:0] seven_segment,
	 output reg [3:0] enable,
	 output reg [3:0] leds
    );
	 
	 integer clk_count = 0;
	 integer ones_or_tens = 0;
	 reg [3:0] cur_digit =4'b0;
	 
	 always @(posedge clk)
	 begin
	 
		clk_count = clk_count + 1;
		
		// every 50000 clock cycles show the other digit about 500us
		if(clk_count >= 50000)
		begin
			if(ones_or_tens == 0) ones_or_tens = 1;
			else if(ones_or_tens == 1) ones_or_tens = 2;
			else if(ones_or_tens == 2) ones_or_tens = 3;
			else ones_or_tens = 0;
			// Reset the clock count
			clk_count = 0;
		end
		
		if(ones_or_tens == 0)
		begin
			cur_digit = binary[3:0];
			// turn on the first 7 segment
			enable = 4'b1110;
		end
		
		else if(ones_or_tens == 1)
		begin
			cur_digit = binary[7:4];
			// turn on the second 7 segment
			enable = 4'b1101;
		end
		
		else if(ones_or_tens == 2)
		begin
			cur_digit = binary[11:8];
			// turn on the second 7 segment
			enable = 4'b1011;
		end
		
		else
		begin
			cur_digit = binary[15:12];
			// turn on the second 7 segment
			enable = 4'b0111;
		end
	 
		// turn on the leds to match the switches (debugging)
		leds = binary[3:0];
		
		case(cur_digit)
			4'b0000:
			begin // 0
				// S = 7'b1111110;
				seven_segment = 7'b0000001;
			end
			4'b0001:
			begin // 1
				// S = 7'b0110000;
				seven_segment = 7'b1001111;
			end
			4'b0010:
			begin // 2
				// S = 7'b1101101;
				seven_segment = 7'b0010010;
			end
			4'b0011:
			begin // 3
				// S = 7'b1111001;
				seven_segment = 7'b0000110;
			end
			4'b0100:
			begin // 4
				// S = 7'b0110011;
				seven_segment = 7'b1001100;
			end
			4'b0101:
			begin // 5
				// S = 7'b1011011;
				seven_segment = 7'b0100100;
			end
			4'b0110:
			begin // 6
				// S = 7'b1011111;
				seven_segment = 7'b0100000;
			end
			4'b0111:
			begin // 7
				// S = 7'b1110000;
				seven_segment = 7'b0001111;
			end
			4'b1000:
			begin // 8
				// S = 7'b1111111;
				seven_segment = 7'b0000000;
			end
			4'b1001:
			begin // 9
				// S = 7'b1111011;
				seven_segment = 7'b0000100;
			end
			4'b1010:
			begin
				//A
				seven_segment = 7'b0001000;
			end
			4'b1011:
			begin
				//B
				seven_segment = 7'b1100000;
			end
			4'b1100:
			begin
				//C
				seven_segment = 7'b0110001;
			end
			4'b1101:
			begin
				//D
				seven_segment = 7'b1000010;
			end
			4'b1110:
			begin
				//E
				seven_segment = 7'b0110000;
			end
			4'b1111:
			begin
				//F
				seven_segment = 7'b0111000;
			end
			default:
			begin // invlalid display -
				seven_segment = 7'b1111110;
			end
		endcase
	 end

endmodule