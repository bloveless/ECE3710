`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// company: 
// Engineer: 
// 
// create Date:    14:01:00 09/24/2015 
// Design Name: 
// Module Name:    Memory_FSM 
// project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File created
// additional comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Memory_FSM(
    input clk,
	 input reset,
    output [6:0] seven_segment,
    output [3:0] enable,
	 output [3:0] led
    );

	reg [14:0] port_a_address, port_b_address;
	reg [15:0] port_a_in, port_b_in;
   reg port_a_we, port_b_we;
	wire [15:0] port_a_out, port_b_out;
	
	reg [2:0] operation;
	reg[15:0] output_to_display;
	integer count;
	reg[15:0] read_temp_1, read_temp_2;

	Memory memory (
		.port_a_address(port_a_address),
		.port_b_address(port_b_address),
		.port_a_in(port_a_in),
		.port_b_in(port_b_in),
		.port_a_we(port_a_we),
		.port_b_we(port_b_we),
		.clk(clk),
		.port_a_out(port_a_out),
		.port_b_out(port_b_out)
	);
	
	BCD_To_7Seg bcd (
		.Binary(output_to_display),
		.Clk(clk),
		.SevenSegment(seven_segment),
		.Enable(enable),
		.LEDs(led)
	);
	
	//Where in memory to start the fibonacci.
	parameter start_address = 15'd0;

	always@ (posedge(clk))
	begin
		if(reset == 1)
		begin
			count = 0;
			operation = 0;
		end
		else if(count == 32'd150000000)
			begin
				count = 0;
				if(operation == 5)
					operation = 2;
				else
					operation = operation + 1;
			end
		else
			count = count + 1;
		case(operation)
			0:
			begin
				//Write a 1 in the first address
				port_a_address = start_address;
				port_b_address = 0;
				port_a_in = 16'd1;
				port_b_in = 0;
				port_a_we = 1;
				port_b_we = 0;
				output_to_display = port_a_out;
			end
			1:
			begin
				//Write a 1 in the next address
				port_b_address = port_a_address + 1;
				port_a_in = 0;
				port_b_in = 16'd1;
				port_a_we = 0;
				port_b_we = 1;
				output_to_display = port_b_out;
			end
			2:
			begin
				//Read both those addresses
				port_a_in = 0;
				port_b_in = 0;
				port_a_we = 0;
				port_b_we = 0;
				read_temp_1 = port_a_out;
				read_temp_2 = port_b_out;
			end
			3:
			begin
				//Write the sum of those values into the next address
				port_a_address = port_a_address + 2;
				port_a_in = read_temp_1 + read_temp_2;
				port_b_in = 0;
				port_a_we = 1;
				port_b_we = 0;
				output_to_display = port_a_out;
			end
			4:
			begin
				//Read last 2 addresses
				port_a_in = 0;
				port_b_in = 0;
				port_a_we = 0;
				port_b_we = 0;
				read_temp_1 = port_a_out;
				read_temp_2 = port_b_out;
			end
			5:
			begin
				//Write the sum of those values into the next address
				port_b_address = port_b_address + 2;
				port_a_in = 0;
				port_b_in = read_temp_1 + read_temp_2;
				port_a_we = 0;
				port_b_we = 1;
				output_to_display = port_b_out;
			end
		endcase
	end
endmodule
