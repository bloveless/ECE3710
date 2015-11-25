`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:16 11/19/2015 
// Design Name: 
// Module Name:    SPI 
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
module SPI #(parameter CLK_DIV = 16)( // 16 works in real life, but is too slow for the simulation
    input clk,
    input rst,
    input miso,
    output mosi,
    output sck,
    input start,
    input[7:0] data_in,
    output[7:0] data_out,
    output busy,
    output new_data,
	 output enable,
	 output chip_select
  );

  localparam STATE_SIZE = 2;
  localparam ENABLE = 2'd0,
    IDLE = 2'd1,
    WAIT_HALF = 2'd2,
    TRANSFER = 2'd3;
   
  reg [STATE_SIZE-1:0] state_d, state_q;
   
  reg [7:0] data_d, data_q;
  reg [CLK_DIV-1:0] sck_d, sck_q;
  reg mosi_d, mosi_q;
  reg [2:0] ctr_d, ctr_q;
  reg new_data_d, new_data_q;
  reg [7:0] data_out_d, data_out_q;
  reg enable_out;
   
  assign mosi = mosi_q;
  assign sck = (~sck_q[CLK_DIV-1]) & (state_q == TRANSFER);
  assign busy = state_q != IDLE;
  assign data_out = data_out_q;
  assign new_data = new_data_q;
  assign enable = enable_out;
  assign chip_select = enable_out;
   
  always @(*)
  begin
    sck_d = sck_q;
    data_d = data_q;
    mosi_d = mosi_q;
    ctr_d = ctr_q;
    new_data_d = 1'b0;
    data_out_d = data_out_q;
    state_d = state_q;
	 enable_out = 1'b1;
     
    case (state_q)
	 
      IDLE: begin
        sck_d = 4'b0;              // reset clock counter
        ctr_d = 3'b0;              // reset bit counter
        if (start == 1'b1)         // if start command
		  begin
          data_d = data_in;        // copy data to send
          state_d = ENABLE;        // change state
        end
      end
		
		ENABLE:
		begin
		
			sck_d = sck_q + 1'b1;
			enable_out = 1'b0;
			state_d = WAIT_HALF;
		
		end
		
      WAIT_HALF:
		begin
		  enable_out = 1'b0;
        sck_d = sck_q + 1'b1;                  // increment clock counter
        if (sck_q == {CLK_DIV-1{1'b1}})        // if clock is half full (about to fall)
		  begin
          sck_d = 1'b0;                        // reset to 0
          state_d = TRANSFER;                  // change state
        end
      end
		
      TRANSFER:
		begin
		  enable_out = 1'b0;
        sck_d = sck_q + 1'b1;                           // increment clock counter
        if (sck_q == 4'b0000)                           // if clock counter is 0
		  begin
          mosi_d = data_q[7];                           // output the MSB of data
        end
		  else if (sck_q == {CLK_DIV-1{1'b1}})            // else if it's half full (about to fall)
		  begin
          data_d = {data_q[6:0], miso};                 // read in data (shift in)
        end
		  else if (sck_q == {CLK_DIV{1'b1}})              // else if it's full (about to rise)
		  begin
          ctr_d = ctr_q + 1'b1;                         // increment bit counter
          if (ctr_q == 3'b111)                          // if we are on the last bit
			 begin
            state_d = IDLE;                             // change state
            data_out_d = data_q;                        // output data
            new_data_d = 1'b1;                          // signal data is valid
          end
        end
      end
		
    endcase
  end
   
  always @(posedge clk)
  begin
    if (rst)
	 begin
      ctr_q <= 3'b0;
      data_q <= 8'b0;
      sck_q <= 4'b0;
      mosi_q <= 1'b0;
      state_q <= IDLE;
      data_out_q <= 8'b0;
      new_data_q <= 1'b0;
    end
	 else
	 begin
      ctr_q <= ctr_d;
      data_q <= data_d;
      sck_q <= sck_d;
      mosi_q <= mosi_d;
      state_q <= state_d;
      data_out_q <= data_out_d;
      new_data_q <= new_data_d;
    end
  end
   
endmodule
