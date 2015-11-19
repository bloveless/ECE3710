`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:12:27 09/05/2015 
// Design Name: 
// Module Name:    parameters 
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
// TEST CHANGE FROM DAN
// TEST CHANGE FROM NICK

`ifndef _parameters_vh
`define _parameters_vh
 
 // All the available operations
 `define NOOP					16'b0
 
 `define RTYPE					4'b0000
 `define EXT_AND					4'b0001
 `define EXT_OR					4'b0010
 `define EXT_XOR					4'b0011
 `define EXT_ADD					4'b0101
 `define EXT_SUB              4'b1001
 `define EXT_CMP					4'b1011
 
 `define ADDI					4'b0101
 
 `define SHIFTS				4'b1000
 `define EXT_LSHI_LEFT			4'b0000
 `define EXT_LSHI_RIGHT			4'b0001
 `define EXT_ASHUI_LEFT			4'b0010
 `define EXT_ASHUI_RIGHT		4'b0011
 `define EXT_LSH					4'b0100
 `define EXT_ASHU					4'b0110
 
 `define SUBI					4'b1001
 
 `define CMPI					4'b1011
 
 `define SETI					4'b1010
 
 `define JTYPE					4'b0100
 
 `define LOAD					4'b0001
 
 `define STORE					4'b0010
 
 `define WAIT					4'b0011

 // Easy access to the flags
 `define CARRY_FLAG			0
 `define LOW_FLAG				1
 `define FLAG_FLAG			2
 `define ZERO_FLAG			3
 `define NEG_FLAG				4
 `define INVALID_OP_FLAG	5
 
 
 `define BRANCH_IF 4'b0110
 `define BLT 4'b0111
 `define BGT 4'b1100
 `define BLE 4'b1101
 `define BGE 4'b1110
 `define SEND_DATA 4'b1111
 
 `define	EQ 3'b000 //Equal Z=1
 `define	NE 3'b001 //Not Equal Z=0
 `define	LS 3'b010 //lower or same C=0 Z=1
 `define	HS 3'b011 //higher or same C=1
 `define	VS 3'b100 //overflow V=1
 `define	HI	3'b101 //Higher C=1 Z=0
 `define	CC 3'b110 //Lower C=0
 `define	AL 3'b111 //DEFAULT branch on anything

`endif
