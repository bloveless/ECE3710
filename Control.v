`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:59 10/22/2015 
// Design Name: 
// Module Name:    Control 
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
`include "parameters.vh"

module Control(
		input wire reset_btn,
		input wire in_clk,
		input wire TP_PENIRQ, 
		input wire TP_BUSY, 
		input wire TP_DOUT, 
		output wire TP_CS, 
		output wire TP_DCLK, 
		output wire TP_DIN, 
		output wire [6:0] seven_segment,
		output wire [3:0] enable,
		output wire [3:0] leds,
		output wire [7:0] red,	//Red		A12, B12, A13, C13, A14, B14, F13, E13
		output wire [7:0] green,	//Green  C8,  D8,  B9,  A9,  F9,  A11, G9,  B11
		output wire [7:0] blue,	//Blue	A4,  A5,  B4,  C5,  A6,  B6,  A7,  C7
		output wire tft_clk,			//clk to lcd. Should be 9.1 MHz	C10
		output wire tft_display, 	//High to turn on backlight (Should always be high)	C15
		output wire led_en,			//Screen brightness with PWM. Pulse 5 kHz for max brightness	C14
		output wire tft_en,			//Set low for sleep state. Should always be high.	D14
		output wire tft_de			//Set high for each row of pixels. Set low between rows.	A15
   );
	
	// Allow 16 bits so we can address peripherals
	// If the 16th bit is 1 we select from a peripheral
	// If it is 0 we are reading from memory
	reg [13:0] pc = 14'b11111111111111;
	
   reg reset;
	
	wire clk;
	
	/* Inputs */
	// Memory
   wire [13:0] port_b_address;
   reg [15:0] port_b_in = 0;
   reg        port_a_we;
   reg        port_b_we = 0;
	// Reg File
	reg [3:0]  reg_write;
   reg [3:0]  reg_read_a;
   reg [3:0]  reg_read_b;
   reg        write_enable;
	reg [15:0] alu_input;
	// ALU
	reg [15:0] a;
   reg [15:0] b;
	
	
	/* Outputs */
	//touchScreen
	wire [11:0] X_POS;
	wire [11:0] Y_POS;
	wire [11:0] Z_POS;
	wire screen_touched;
	// Memory
	wire [15:0] port_a_out;
   wire [15:0] port_b_out;
	// Reg File
   wire [15:0] reg_a;
   wire [15:0] reg_b;
	// ALU
   wire [15:0] c;
   wire [4:0]  flags;
	
	//Mux Controls
	reg c_or_mem_control;	//Mux control line
	wire [15:0] c_or_mem;				//Mux output
	assign c_or_mem = c_or_mem_control ? c : port_a_out;
	
	reg pc_or_b_control;		//Mux control line
	wire [13:0] pc_or_b;				//Mux output
	assign pc_or_b = pc_or_b_control ? pc : reg_b[13:0];
	
	reg alu_from_opcode_or_control;
	wire [15:0] alu_in;
	reg [15:0] control_to_alu;
	assign alu_in = alu_from_opcode_or_control ? port_a_out : control_to_alu;
	
	reg RST_I = 0;
	
	touchScreen #(.CLOCKFREQ(75)) 
		touchscreen(
		.CLK_I(clk), 
		.RST_I(RST_I),
		.PENIRQ_I(TP_PENIRQ), 
		.BUSY_I(TP_BUSY), 
		.DOUT_I(TP_DOUT),
		.CS_O(TP_CS), 
		.DCLK_O(TP_DCLK), 
		.DIN_O(TP_DIN), 
		.X_O(X_POS), 
		.Y_O(Y_POS),
		.Z_O(Z_POS)
	);
	
	DCM dcm (
		.CLK_IN1(in_clk),
		.CLK_OUT1(clk)
	);
	
	Memory memory (
		.port_a_address(pc_or_b),
		.port_b_address(port_b_address),
		.port_a_in(c),
		.port_b_in(port_b_in),
		.port_a_we(port_a_we),
		.port_b_we(port_b_we),
		.clk(clk),
		.port_a_out(port_a_out),
		.port_b_out(port_b_out)
	);
	
	wire NineMHz;
	wire [9:0] h_count;
	wire [8:0] v_count;

	Clock_Divider dvdr (
		.clk(clk),
		.NineMHz(NineMHz)
	);
	
	LCD_Controller lcd (
		.clk(clk),
		.NineMHz(NineMHz),
		.tft_clk(tft_clk),
		.tft_display(tft_display),
		.led_en(led_en),
		.tft_en(tft_en),
		.tft_de(tft_de),
		.h_count(h_count),
		.v_count(v_count)
	);

	Bit_Gen bg (
		.clk(clk),
		.h_count(h_count),
		.v_count(v_count),
		.port_b_address(port_b_address),
		.port_b_out(port_b_out),
		.red(red),
		.green(green),
		.blue(blue)
	);
	
	Register_File reg_file (
		.reg_write(reg_write),
		.reg_read_a(reg_read_a),
		.reg_read_b(reg_read_b),
		.write_enable(write_enable),
		.reset(reset),
		.alu_input(c_or_mem),
		.reg_a(reg_a),
		.reg_b(reg_b),
		.clk(clk)
	);
	
	reg delete_me = 0;
	
	BCD_To_7Seg bcd (
		.binary(delete_me),
		.clk(clk),
		.seven_segment(seven_segment),
		.enable(enable),
		.leds(leds)
	);
		
	ALU alu (
	   .a(reg_a),
		.b(reg_b),
		.opcode(alu_in),
		.carry_in(saved_flags[0]),
		.c(c),
		.flags(flags)
	);
	
	reg [4:0] saved_flags;
	reg save_flags;
	reg [3:0] state;
	reg pc_enable;
	reg [15:0] wait_counter = 0; //16 Bits needed to count to 33,333 (a third of 100,000)
	reg pc_jmp;
	reg pc_brch;
	reg [11:0] milliseconds = 0;
	reg wait_enable = 0;
	reg wait_reset = 0;
	reg [13:0] brch_amount = 0;
	
	always@(posedge clk)
	begin
		if(state == 0)			//Fetch
		begin
			state <= 1;
		end
		else if(state == 1)	//Decode
		begin
			case(port_a_out[15:12])
				`JTYPE:
				begin
					state <= 3;
				end
				`LOAD:
				begin
					state <= 4;
				end
				`STORE:
				begin
					state <= 6;
				end
				`WAIT:
				begin
					state <= 7;
				end
				`TCHBRCH:
				begin
					state <= 8;
				end
				default: //RTYPES and ITYPES
				begin
					state <= 2;
				end
			endcase
		end
		
		else if(state == 4)
		begin
			state <= 5;
		end
		else if(state == 8)
		begin
			state <= 9;
		end
		else
		begin
			state <= 0;
		end
	end

	always@(state)
	begin
		pc_enable = 0;
		alu_from_opcode_or_control = 1;
		control_to_alu = 0;
		write_enable = 0;
		port_a_we = 0;
		c_or_mem_control = 1;
		pc_or_b_control = 1;
		control_to_alu = 0;
		reg_write = port_a_out[11:8];
		reg_read_a = port_a_out[11:8];
		reg_read_b = port_a_out[3:0];
		save_flags = 0;
		pc_jmp = 0;
		pc_brch = 0;
		brch_amount = 0;
		wait_enable = 0;
		wait_reset = 0;
		
		case(state)
			0:	//Fetch state
			begin
			end
		
			1: //Decode state
			begin
			end
			
			2:	//RTYPE and ITYPE control lines set;
			begin
				//TODO: Set control lines for RTYPE and ITYPE instructions
				pc_enable = 1;
				write_enable = 1;
				save_flags = 1;
			end
			
			3: //JMP state
			begin
				pc_enable = 1;
				pc_jmp = 1;
				alu_from_opcode_or_control = 0;
				control_to_alu = {`ADDI, port_a_out[11:8], 8'b0};
			end
			
			4:	//LOAD state 1
			begin
				pc_or_b_control = 0;
				reg_write = reg_write;
			end
			
			5:	//LOAD state 2
			begin
				pc_enable = 1;
				c_or_mem_control = 0;
				write_enable = 1;
			end
			
			6:	//STORE state 1
			begin
				control_to_alu = {`ADDI, port_a_out[11:8], 8'b0};
				alu_from_opcode_or_control = 0;
				pc_or_b_control = 0;
				port_a_we = 1;
				pc_enable = 1;
			end
			
			7:	//WAIT
			begin
				if(milliseconds == port_a_out[11:0])
				begin
					pc_enable = 1;
					wait_reset = 1;
				end
				else
				begin
					wait_enable = 1;
				end
			end
			8: //TOUCH BRANCH 1
			begin
				reg_read_a = 4'b1110;
				reg_read_b = 4'b1111;
			end
			9:	//TOUCH BRANCH 2
			begin
				if(reg_a[15:8] >= X_POS[11:4] && reg_a[7:0] <= X_POS[11:4] && reg_b[15:8] >= Y_POS[11:4] && reg_b[7:0] <= Y_POS[11:4])
				begin
					brch_amount = port_a_out[11:0];
					pc_brch = 1;
					pc_enable = 1;
					delete_me = 1;
				end
				else
				begin
					pc_enable = 1;
				end
			end
			default:
			begin
				//default
			end
		endcase
	end
	
	//Register to save flags and pc counter
	always@(posedge clk)
	begin
		if(save_flags)
		begin
			saved_flags <= flags;
		end
		
		//PC Counter
		if(pc_enable == 1'b1)
		begin
			if(pc_jmp == 1'b1)
			begin
				pc <= 14'h3FFF - c;
			end
			else if(pc_brch == 1'b1)
			begin
				pc <= pc - $signed(brch_amount);
			end
			else
			begin
				pc <= pc - 15'b1;
			end
		end
	end
	
	//Wait counter
	always@(posedge clk)
	begin
		if(wait_reset == 1)
		begin
			milliseconds <= 0;
			wait_counter <= 0;
		end
		else if(wait_enable == 1)
		begin
			if(wait_counter == 16'd25000)
			begin
				wait_counter <= 0;
				milliseconds <= milliseconds + 1;
			end
			else
			begin
				wait_counter <= wait_counter + 1;
			end
		end
	end
endmodule
