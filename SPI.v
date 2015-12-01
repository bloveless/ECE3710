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
module SPI (
    input[1:0]      cdiv,
	 input[7:0]      tdat,
	 input           clk,
	 input           din,
	 input           mlb,
	 input           rstb,
	 input           start,
	 output reg[7:0] rdata,
	 output reg      done,
	 output reg      dout,
	 output reg      sck,
	 output reg      ss,
	 output reg      chip_enable
  );
  
	localparam idle   = 0;
	localparam send   = 1;
	localparam finish = 2;
	
	reg      shift;
	reg      clr;
	reg[3:0] mid;
	reg[3:0] nxt;
	reg[3:0] cur;
	reg[7:0] nbit;
	reg[7:0] rreg;
	reg[7:0] treg;
	reg[7:0] cnt;
	
	//state transistion
	always@(negedge clk or negedge rstb)
	begin
		if(rstb==0)
			cur <= finish;
		else
			cur <= nxt;
	end
	
	//FSM I/O
	always @(start or cur or nbit)
	begin
		nxt=cur;
		clr=0; 
		shift=0;
		ss=0;
		chip_enable=0;
		case(cur)
			idle:
			begin
				if(start==1)
				begin
					case (cdiv)
						2'b00: mid=2;
						2'b01: mid=4;
						2'b10: mid=8;
						2'b11: mid=16;
					endcase
					shift=1;
					done=1'b0;
					nxt=send;  
				end
			end //idle
			
			send:
			begin
				ss=0;
				chip_enable=0;
				if(nbit!=8)
				begin
					shift=1;
				end
				else
				begin
					rdata=rreg;
					done=1'b1;
					nxt=finish;
				end
			end//send
			
			finish:
			begin
				shift=0;
				ss=1;
				chip_enable=1;
				clr=1;
				nxt=idle;
			end
			
			default:
				nxt=finish;
		endcase
	end//always

	always@(negedge clk or posedge clr)
	begin
		if(clr==1)
		begin
			cnt=0;
			sck=1;
		end
		else
		begin
			if(shift==1)
			begin
				cnt=cnt+1;
				if(cnt==mid)
				begin
					sck=~sck;
					cnt=0;
				end //mid
			end //shift
		end //rst
	end

	always@(negedge sck or posedge clr)
	begin
		if(clr==1)
		begin
			treg=8'hFF;
			dout=1; 
		end 
		else
		begin
			if(nbit==0) //load data into TREG
			begin
				treg=tdat;
				dout= mlb ? treg[7] : treg[0];
			end //nbit_if
			else
			begin
				if(mlb==0) //LSB first, shift right
				begin
					treg={1'b1,treg[7:1]};
					dout=treg[0];
				end
				else //MSB first shift LEFT
				begin
					treg={treg[6:0],1'b1};
					dout=treg[7];
				end
			end
		end //rst
	end

	always@(posedge sck or posedge clr ) // or negedge rstb
	begin
		if(clr==1)
		begin
			nbit=0;
			rreg=8'hFF;
		end
		else
		begin
			if(mlb==0) //LSB first, din@msb -> right shift
			begin
				rreg={din,rreg[7:1]};
			end
			else  //MSB first, din@lsb -> left shift
			begin
				rreg={rreg[6:0],din};
			end
			nbit=nbit+1;
		end //rst
	end

endmodule
