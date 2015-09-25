////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: BCDto7Seg_synthesis.v
// /___/   /\     Timestamp: Tue Sep 22 16:15:33 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim RegisterFile_FSM.ngc BCDto7Seg_synthesis.v 
// Device	: xc6slx16-3-csg324
// Input file	: RegisterFile_FSM.ngc
// Output file	: C:\Users\brennon\Documents\GitHub\ECE3710\netgen\synthesis\BCDto7Seg_synthesis.v
// # of Modules	: 1
// Design Name	: RegisterFile_FSM
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module RegisterFile_FSM (
  Clk, RESET, SevenSegment, Enable, LED
);
  input Clk;
  input RESET;
  output [6 : 0] SevenSegment;
  output [3 : 0] Enable;
  output [3 : 0] LED;
  wire Clk_BUFGP_0;
  wire RESET_IBUF_1;
  wire \Reg_A[10] ;
  wire \Reg_A[9] ;
  wire \Reg_A[8] ;
  wire \Reg_A[7] ;
  wire \Reg_A[6] ;
  wire \Reg_A[5] ;
  wire \Reg_A[0] ;
  wire Reset_39;
  wire Write_Enable_40;
  wire \OpCode[4] ;
  wire \OpCode[0] ;
  wire \counter[31]_GND_1_o_equal_3_o ;
  wire \operation[31]_GND_1_o_equal_12_o ;
  wire Mcount_operation_val;
  wire \Result<0>1 ;
  wire \Result<1>1 ;
  wire \Result<2>1 ;
  wire \Result<3>1 ;
  wire \Result<4>1 ;
  wire \Result<5>1 ;
  wire \Result<6>1 ;
  wire \Result<7>1 ;
  wire \Result<8>1 ;
  wire \Result<9>1 ;
  wire \Result<10>1 ;
  wire \Result<11>1 ;
  wire \Result<12>1 ;
  wire \Result<13>1 ;
  wire \Result<14>1 ;
  wire \Result<15>1 ;
  wire \Result<16>1 ;
  wire \Result<17>1 ;
  wire \Result<18>1 ;
  wire \Result<19>1 ;
  wire \Result<20>1 ;
  wire \Result<21>1 ;
  wire \Result<22>1 ;
  wire \Result<23>1 ;
  wire \Result<24>1 ;
  wire \Result<25>1 ;
  wire \Result<26>1 ;
  wire \Result<27>1 ;
  wire Mram__n0257;
  wire Mram__n02574;
  wire Mram__n025716;
  wire Mram__n025717;
  wire Mram__n025718;
  wire Mram__n025719;
  wire Mram__n025720;
  wire Mram__n025721;
  wire Mram__n025722;
  wire Mram__n025723;
  wire Mram__n025724;
  wire Mram__n025725;
  wire Mram__n025726;
  wire Mram__n025727;
  wire \counter[31]_GND_1_o_equal_3_o_0 ;
  wire \operation[31]_GND_1_o_equal_12_o<31>1_187 ;
  wire \regFile/Mmux_Reg_B_4_188 ;
  wire \regFile/Mmux_Reg_B_5_189 ;
  wire \regFile/Mmux_Reg_B_3_f7_190 ;
  wire \regFile/Mmux_Reg_B_51_191 ;
  wire \regFile/Mmux_Reg_B_6_192 ;
  wire \regFile/Mmux_Reg_B_4_f7_193 ;
  wire \regFile/Mmux_Reg_B_41_194 ;
  wire \regFile/Mmux_Reg_B_52 ;
  wire \regFile/Mmux_Reg_B_3_f71 ;
  wire \regFile/Mmux_Reg_B_42_197 ;
  wire \regFile/Mmux_Reg_B_3_f72 ;
  wire \regFile/Mmux_Reg_B_43_199 ;
  wire \regFile/Mmux_Reg_B_3_f73 ;
  wire \regFile/Mmux_Reg_B_44 ;
  wire \regFile/Mmux_Reg_B_3_f74 ;
  wire \regFile/Mmux_Reg_B_45 ;
  wire \regFile/Mmux_Reg_B_3_f75 ;
  wire \regFile/Mmux_Reg_B_47_205 ;
  wire \regFile/Mmux_Reg_B_514_206 ;
  wire \regFile/Mmux_Reg_B_3_f77 ;
  wire \regFile/Mmux_Reg_B_515_208 ;
  wire \regFile/Mmux_Reg_B_67 ;
  wire \regFile/Mmux_Reg_B_4_f77 ;
  wire \regFile/Mmux_Reg_B_48_211 ;
  wire \regFile/Mmux_Reg_B_516_212 ;
  wire \regFile/Mmux_Reg_B_3_f78 ;
  wire \regFile/Mmux_Reg_B_517_214 ;
  wire \regFile/Mmux_Reg_B_68 ;
  wire \regFile/Mmux_Reg_B_4_f78 ;
  wire \regFile/Mmux_Reg_B_49_217 ;
  wire \regFile/Mmux_Reg_B_518_218 ;
  wire \regFile/Mmux_Reg_B_3_f79 ;
  wire \regFile/Mmux_Reg_B_519_220 ;
  wire \regFile/Mmux_Reg_B_4_f79 ;
  wire \regFile/Mmux_Reg_B_410_222 ;
  wire \regFile/Mmux_Reg_B_520_223 ;
  wire \regFile/Mmux_Reg_B_3_f710 ;
  wire \regFile/Mmux_Reg_B_521_225 ;
  wire \regFile/Mmux_Reg_B_4_f710 ;
  wire \regFile/Mmux_Reg_B_411_227 ;
  wire \regFile/Mmux_Reg_B_522_228 ;
  wire \regFile/Mmux_Reg_B_3_f711 ;
  wire \regFile/Mmux_Reg_B_523 ;
  wire \regFile/Mmux_Reg_B_4_f711 ;
  wire \regFile/Mmux_Reg_B_412_232 ;
  wire \regFile/Mmux_Reg_B_524_233 ;
  wire \regFile/Mmux_Reg_B_3_f712 ;
  wire \regFile/Mmux_Reg_B_525 ;
  wire \regFile/Mmux_Reg_B_4_f712 ;
  wire \regFile/Mmux_Reg_B_413_237 ;
  wire \regFile/Mmux_Reg_B_526_238 ;
  wire \regFile/Mmux_Reg_B_3_f713 ;
  wire \regFile/Mmux_Reg_B_414_240 ;
  wire \regFile/Mmux_Reg_B_528_241 ;
  wire \regFile/Mmux_Reg_B_3_f714 ;
  wire \regFile/Mmux_Reg_B_415_243 ;
  wire \regFile/Mmux_Reg_B_530 ;
  wire \regFile/Mmux_Reg_B_3_f715 ;
  wire \regFile/Mmux_Reg_A_4_246 ;
  wire \regFile/Mmux_Reg_A_5_247 ;
  wire \regFile/Mmux_Reg_A_3_f7_248 ;
  wire \regFile/Mmux_Reg_A_51_249 ;
  wire \regFile/Mmux_Reg_A_6_250 ;
  wire \regFile/Mmux_Reg_A_4_f7_251 ;
  wire \regFile/Mmux_Reg_A_41_252 ;
  wire \regFile/Mmux_Reg_A_52 ;
  wire \regFile/Mmux_Reg_A_3_f71 ;
  wire \regFile/Mmux_Reg_A_42_255 ;
  wire \regFile/Mmux_Reg_A_3_f72 ;
  wire \regFile/Mmux_Reg_A_43_257 ;
  wire \regFile/Mmux_Reg_A_3_f73 ;
  wire \regFile/Mmux_Reg_A_44 ;
  wire \regFile/Mmux_Reg_A_3_f74 ;
  wire \regFile/Mmux_Reg_A_45 ;
  wire \regFile/Mmux_Reg_A_3_f75 ;
  wire \regFile/Mmux_Reg_A_47_263 ;
  wire \regFile/Mmux_Reg_A_514_264 ;
  wire \regFile/Mmux_Reg_A_3_f77 ;
  wire \regFile/Mmux_Reg_A_515_266 ;
  wire \regFile/Mmux_Reg_A_67 ;
  wire \regFile/Mmux_Reg_A_4_f77 ;
  wire \regFile/Mmux_Reg_A_48_269 ;
  wire \regFile/Mmux_Reg_A_516_270 ;
  wire \regFile/Mmux_Reg_A_3_f78 ;
  wire \regFile/Mmux_Reg_A_517_272 ;
  wire \regFile/Mmux_Reg_A_68 ;
  wire \regFile/Mmux_Reg_A_4_f78 ;
  wire \regFile/Mmux_Reg_A_49_275 ;
  wire \regFile/Mmux_Reg_A_518_276 ;
  wire \regFile/Mmux_Reg_A_3_f79 ;
  wire \regFile/Mmux_Reg_A_519_278 ;
  wire \regFile/Mmux_Reg_A_4_f79 ;
  wire \regFile/Mmux_Reg_A_410_280 ;
  wire \regFile/Mmux_Reg_A_520_281 ;
  wire \regFile/Mmux_Reg_A_3_f710 ;
  wire \regFile/Mmux_Reg_A_521_283 ;
  wire \regFile/Mmux_Reg_A_4_f710 ;
  wire \regFile/Mmux_Reg_A_411_285 ;
  wire \regFile/Mmux_Reg_A_522_286 ;
  wire \regFile/Mmux_Reg_A_3_f711 ;
  wire \regFile/Mmux_Reg_A_523 ;
  wire \regFile/Mmux_Reg_A_4_f711 ;
  wire \regFile/Mmux_Reg_A_412_290 ;
  wire \regFile/Mmux_Reg_A_524_291 ;
  wire \regFile/Mmux_Reg_A_3_f712 ;
  wire \regFile/Mmux_Reg_A_525 ;
  wire \regFile/Mmux_Reg_A_4_f712 ;
  wire \regFile/Mmux_Reg_A_413_295 ;
  wire \regFile/Mmux_Reg_A_526_296 ;
  wire \regFile/Mmux_Reg_A_3_f713 ;
  wire \regFile/Mmux_Reg_A_414_298 ;
  wire \regFile/Mmux_Reg_A_528_299 ;
  wire \regFile/Mmux_Reg_A_3_f714 ;
  wire \regFile/Mmux_Reg_A_415_301 ;
  wire \regFile/Mmux_Reg_A_530 ;
  wire \regFile/Mmux_Reg_A_3_f715 ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_16_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_15_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_14_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_13_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_12_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_11_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_10_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_9_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_8_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_7_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_6_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_5_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_4_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_3_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_2_o ;
  wire \regFile/Write_Enable_Reg_Write[3]_AND_1_o ;
  wire \bcd/Mcompar_n0001_lutdi2 ;
  wire \bcd/Mcompar_n0001_lutdi1_450 ;
  wire \bcd/Mcompar_n0001_lutdi_453 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>_454 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_455 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_456 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_457 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_458 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_459 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_460 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_461 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_462 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_463 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_464 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_465 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>_466 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<2>_467 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<1>_468 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<0>_469 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_lut<0> ;
  wire \bcd/onesOrTens_FSM_FFd1_487 ;
  wire \bcd/onesOrTens_FSM_FFd2_488 ;
  wire \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT6 ;
  wire \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT5 ;
  wire \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT4 ;
  wire \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT3 ;
  wire \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT2 ;
  wire \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT1 ;
  wire \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT ;
  wire \bcd/Binary[15]_Binary[3]_mux_18_OUT<0> ;
  wire \bcd/Binary[15]_Binary[3]_mux_18_OUT<1> ;
  wire \bcd/Binary[15]_Binary[3]_mux_18_OUT<2> ;
  wire \bcd/Binary[15]_Binary[3]_mux_18_OUT<3> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<4> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<5> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<6> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<7> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<8> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<9> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<10> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<11> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<12> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<13> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<14> ;
  wire \bcd/clkCount[31]_GND_8_o_add_1_OUT<15> ;
  wire \bcd/onesOrTens[31]_GND_8_o_mux_9_OUT[0] ;
  wire \bcd/onesOrTens[31]_GND_8_o_mux_9_OUT[1] ;
  wire \ALU/C<1>12 ;
  wire \ALU/Sh461 ;
  wire \ALU/Sh441 ;
  wire \ALU/Sh310 ;
  wire \ALU/Sh159 ;
  wire \ALU/Sh451 ;
  wire \ALU/Sh431 ;
  wire \ALU/Sh24 ;
  wire \ALU/Sh143 ;
  wire \counter[31]_GND_1_o_equal_3_o<31> ;
  wire \counter[31]_GND_1_o_equal_3_o<31>1_606 ;
  wire \counter[31]_GND_1_o_equal_3_o<31>2_607 ;
  wire \counter[31]_GND_1_o_equal_3_o<31>3_608 ;
  wire \counter[31]_GND_1_o_equal_3_o<31>4_609 ;
  wire N4;
  wire \Mcount_operation_cy<1>_rt_628 ;
  wire \Mcount_operation_cy<2>_rt_629 ;
  wire \Mcount_operation_cy<3>_rt_630 ;
  wire \Mcount_counter_cy<1>_rt_631 ;
  wire \Mcount_counter_cy<2>_rt_632 ;
  wire \Mcount_counter_cy<3>_rt_633 ;
  wire \Mcount_counter_cy<4>_rt_634 ;
  wire \Mcount_counter_cy<5>_rt_635 ;
  wire \Mcount_counter_cy<6>_rt_636 ;
  wire \Mcount_counter_cy<7>_rt_637 ;
  wire \Mcount_counter_cy<8>_rt_638 ;
  wire \Mcount_counter_cy<9>_rt_639 ;
  wire \Mcount_counter_cy<10>_rt_640 ;
  wire \Mcount_counter_cy<11>_rt_641 ;
  wire \Mcount_counter_cy<12>_rt_642 ;
  wire \Mcount_counter_cy<13>_rt_643 ;
  wire \Mcount_counter_cy<14>_rt_644 ;
  wire \Mcount_counter_cy<15>_rt_645 ;
  wire \Mcount_counter_cy<16>_rt_646 ;
  wire \Mcount_counter_cy<17>_rt_647 ;
  wire \Mcount_counter_cy<18>_rt_648 ;
  wire \Mcount_counter_cy<19>_rt_649 ;
  wire \Mcount_counter_cy<20>_rt_650 ;
  wire \Mcount_counter_cy<21>_rt_651 ;
  wire \Mcount_counter_cy<22>_rt_652 ;
  wire \Mcount_counter_cy<23>_rt_653 ;
  wire \Mcount_counter_cy<24>_rt_654 ;
  wire \Mcount_counter_cy<25>_rt_655 ;
  wire \Mcount_counter_cy<26>_rt_656 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>_rt_657 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_rt_658 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_rt_659 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_rt_660 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_rt_661 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_rt_662 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_rt_663 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_rt_664 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_rt_665 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_rt_666 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_rt_667 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_rt_668 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>_rt_669 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<2>_rt_670 ;
  wire \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<1>_rt_671 ;
  wire \bcd/Mcount_clkCount_cy<14>_rt_672 ;
  wire \bcd/Mcount_clkCount_cy<13>_rt_673 ;
  wire \bcd/Mcount_clkCount_cy<12>_rt_674 ;
  wire \bcd/Mcount_clkCount_cy<11>_rt_675 ;
  wire \bcd/Mcount_clkCount_cy<10>_rt_676 ;
  wire \bcd/Mcount_clkCount_cy<9>_rt_677 ;
  wire \bcd/Mcount_clkCount_cy<8>_rt_678 ;
  wire \bcd/Mcount_clkCount_cy<7>_rt_679 ;
  wire \bcd/Mcount_clkCount_cy<6>_rt_680 ;
  wire \bcd/Mcount_clkCount_cy<5>_rt_681 ;
  wire \bcd/Mcount_clkCount_cy<4>_rt_682 ;
  wire \bcd/Mcount_clkCount_cy<3>_rt_683 ;
  wire \bcd/Mcount_clkCount_cy<2>_rt_684 ;
  wire \bcd/Mcount_clkCount_cy<1>_rt_685 ;
  wire \Mcount_operation_xor<4>_rt_686 ;
  wire \Mcount_counter_xor<27>_rt_687 ;
  wire \bcd/Mcount_clkCount_xor<15>_rt_688 ;
  wire \regFile/reg0/Reg_Out_0_rstpot_689 ;
  wire \regFile/reg1/Reg_Out_0_rstpot_690 ;
  wire Write_Enable_rstpot;
  wire N6;
  wire N7;
  wire N8;
  wire N9;
  wire N11;
  wire N12;
  wire N13;
  wire N14;
  wire N16;
  wire N17;
  wire N18;
  wire N19;
  wire N21;
  wire N22;
  wire N23;
  wire N24;
  wire N26;
  wire N30;
  wire N44;
  wire Reg_Read_A_0_1_711;
  wire Reg_Read_B_0_1_712;
  wire Reg_Read_A_1_1_713;
  wire Reg_Read_B_1_1_714;
  wire Reg_Read_A_0_2_715;
  wire Reg_Read_B_0_2_716;
  wire Reg_Read_A_1_2_717;
  wire Reg_Read_B_1_2_718;
  wire Reg_Read_A_2_1_719;
  wire Reg_Read_B_2_1_720;
  wire N80;
  wire N81;
  wire N82;
  wire N83;
  wire N84;
  wire N85;
  wire N86;
  wire N87;
  wire N88;
  wire N89;
  wire N90;
  wire N91;
  wire N92;
  wire N93;
  wire N94;
  wire N95;
  wire [14 : 0] Reg_B;
  wire [6 : 0] \bcd/SevenSegment ;
  wire [3 : 0] \bcd/Enable ;
  wire [3 : 0] \bcd/LEDs ;
  wire [3 : 0] Reg_Read_A;
  wire [3 : 0] Reg_Read_B;
  wire [3 : 0] Reg_Write;
  wire [27 : 0] counter;
  wire [4 : 0] operation;
  wire [14 : 0] C;
  wire [4 : 0] Result;
  wire [0 : 0] Mcount_operation_lut;
  wire [3 : 0] Mcount_operation_cy;
  wire [0 : 0] Mcount_counter_lut;
  wire [26 : 0] Mcount_counter_cy;
  wire [14 : 0] \regFile/reg15/Reg_Out ;
  wire [13 : 0] \regFile/reg14/Reg_Out ;
  wire [12 : 0] \regFile/reg13/Reg_Out ;
  wire [11 : 0] \regFile/reg12/Reg_Out ;
  wire [10 : 0] \regFile/reg11/Reg_Out ;
  wire [9 : 0] \regFile/reg10/Reg_Out ;
  wire [8 : 0] \regFile/reg9/Reg_Out ;
  wire [7 : 0] \regFile/reg8/Reg_Out ;
  wire [6 : 0] \regFile/reg7/Reg_Out ;
  wire [5 : 0] \regFile/reg6/Reg_Out ;
  wire [4 : 0] \regFile/reg5/Reg_Out ;
  wire [3 : 0] \regFile/reg4/Reg_Out ;
  wire [2 : 0] \regFile/reg3/Reg_Out ;
  wire [1 : 0] \regFile/reg2/Reg_Out ;
  wire [0 : 0] \regFile/reg1/Reg_Out ;
  wire [0 : 0] \regFile/reg0/Reg_Out ;
  wire [5 : 0] \bcd/Mcompar_n0001_cy ;
  wire [3 : 0] \bcd/Mcompar_n0001_lut ;
  wire [14 : 0] \bcd/Mcount_clkCount_cy ;
  wire [0 : 0] \bcd/Mcount_clkCount_lut ;
  wire [15 : 0] \bcd/Result ;
  wire [4 : 1] \bcd/_n0064 ;
  wire [15 : 0] \bcd/clkCount ;
  wire [14 : 0] \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy ;
  wire [14 : 0] \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut ;
  wire [15 : 0] \ALU/BUS_0001_GND_4_o_add_1_OUT ;
  VCC   XST_VCC (
    .P(\bcd/Mcompar_n0001_lut [3])
  );
  GND   XST_GND (
    .G(\ALU/C<1>12 )
  );
  FD #(
    .INIT ( 1'b0 ))
  Reset (
    .C(Clk_BUFGP_0),
    .D(\operation[31]_GND_1_o_equal_12_o ),
    .Q(Reset_39)
  );
  FDR   Reg_Write_0 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025716),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Write[0])
  );
  FDR   Reg_Write_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025717),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Write[1])
  );
  FDR   Reg_Write_2 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025718),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Write[2])
  );
  FDR   Reg_Write_3 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025719),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Write[3])
  );
  FDR   Reg_Read_A_0 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025724),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A[0])
  );
  FDR   Reg_Read_A_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025725),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A[1])
  );
  FDR   Reg_Read_A_2 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025726),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A[2])
  );
  FDR   Reg_Read_A_3 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025727),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A[3])
  );
  FDR   Reg_Read_B_0 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025720),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B[0])
  );
  FDR   Reg_Read_B_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025721),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B[1])
  );
  FDR   Reg_Read_B_2 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025722),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B[2])
  );
  FDR   Reg_Read_B_3 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025723),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B[3])
  );
  FDR   OpCode_0 (
    .C(Clk_BUFGP_0),
    .D(Mram__n0257),
    .R(\ALU/C<1>12 ),
    .Q(\OpCode[0] )
  );
  FDS   OpCode_4 (
    .C(Clk_BUFGP_0),
    .D(Mram__n02574),
    .S(\ALU/C<1>12 ),
    .Q(\OpCode[4] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  operation_0 (
    .C(Clk_BUFGP_0),
    .CE(\counter[31]_GND_1_o_equal_3_o ),
    .D(Result[0]),
    .R(Mcount_operation_val),
    .Q(operation[0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  operation_3 (
    .C(Clk_BUFGP_0),
    .CE(\counter[31]_GND_1_o_equal_3_o ),
    .D(Result[3]),
    .R(Mcount_operation_val),
    .Q(operation[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  operation_1 (
    .C(Clk_BUFGP_0),
    .CE(\counter[31]_GND_1_o_equal_3_o ),
    .D(Result[1]),
    .R(Mcount_operation_val),
    .Q(operation[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  operation_2 (
    .C(Clk_BUFGP_0),
    .CE(\counter[31]_GND_1_o_equal_3_o ),
    .D(Result[2]),
    .R(Mcount_operation_val),
    .Q(operation[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  operation_4 (
    .C(Clk_BUFGP_0),
    .CE(\counter[31]_GND_1_o_equal_3_o ),
    .D(Result[4]),
    .R(Mcount_operation_val),
    .Q(operation[4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_0 (
    .C(Clk_BUFGP_0),
    .D(\Result<0>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_1 (
    .C(Clk_BUFGP_0),
    .D(\Result<1>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_2 (
    .C(Clk_BUFGP_0),
    .D(\Result<2>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_3 (
    .C(Clk_BUFGP_0),
    .D(\Result<3>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_4 (
    .C(Clk_BUFGP_0),
    .D(\Result<4>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_5 (
    .C(Clk_BUFGP_0),
    .D(\Result<5>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_6 (
    .C(Clk_BUFGP_0),
    .D(\Result<6>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_7 (
    .C(Clk_BUFGP_0),
    .D(\Result<7>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_8 (
    .C(Clk_BUFGP_0),
    .D(\Result<8>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_9 (
    .C(Clk_BUFGP_0),
    .D(\Result<9>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_10 (
    .C(Clk_BUFGP_0),
    .D(\Result<10>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_11 (
    .C(Clk_BUFGP_0),
    .D(\Result<11>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_12 (
    .C(Clk_BUFGP_0),
    .D(\Result<12>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_13 (
    .C(Clk_BUFGP_0),
    .D(\Result<13>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_14 (
    .C(Clk_BUFGP_0),
    .D(\Result<14>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_15 (
    .C(Clk_BUFGP_0),
    .D(\Result<15>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_16 (
    .C(Clk_BUFGP_0),
    .D(\Result<16>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[16])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_17 (
    .C(Clk_BUFGP_0),
    .D(\Result<17>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[17])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_18 (
    .C(Clk_BUFGP_0),
    .D(\Result<18>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[18])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_19 (
    .C(Clk_BUFGP_0),
    .D(\Result<19>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[19])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_20 (
    .C(Clk_BUFGP_0),
    .D(\Result<20>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[20])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_21 (
    .C(Clk_BUFGP_0),
    .D(\Result<21>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[21])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_22 (
    .C(Clk_BUFGP_0),
    .D(\Result<22>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[22])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_23 (
    .C(Clk_BUFGP_0),
    .D(\Result<23>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[23])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_24 (
    .C(Clk_BUFGP_0),
    .D(\Result<24>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[24])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_25 (
    .C(Clk_BUFGP_0),
    .D(\Result<25>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[25])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_26 (
    .C(Clk_BUFGP_0),
    .D(\Result<26>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[26])
  );
  FDR #(
    .INIT ( 1'b0 ))
  counter_27 (
    .C(Clk_BUFGP_0),
    .D(\Result<27>1 ),
    .R(\counter[31]_GND_1_o_equal_3_o_0 ),
    .Q(counter[27])
  );
  MUXCY   \Mcount_operation_cy<0>  (
    .CI(\ALU/C<1>12 ),
    .DI(\bcd/Mcompar_n0001_lut [3]),
    .S(Mcount_operation_lut[0]),
    .O(Mcount_operation_cy[0])
  );
  XORCY   \Mcount_operation_xor<0>  (
    .CI(\ALU/C<1>12 ),
    .LI(Mcount_operation_lut[0]),
    .O(Result[0])
  );
  MUXCY   \Mcount_operation_cy<1>  (
    .CI(Mcount_operation_cy[0]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_operation_cy<1>_rt_628 ),
    .O(Mcount_operation_cy[1])
  );
  XORCY   \Mcount_operation_xor<1>  (
    .CI(Mcount_operation_cy[0]),
    .LI(\Mcount_operation_cy<1>_rt_628 ),
    .O(Result[1])
  );
  MUXCY   \Mcount_operation_cy<2>  (
    .CI(Mcount_operation_cy[1]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_operation_cy<2>_rt_629 ),
    .O(Mcount_operation_cy[2])
  );
  XORCY   \Mcount_operation_xor<2>  (
    .CI(Mcount_operation_cy[1]),
    .LI(\Mcount_operation_cy<2>_rt_629 ),
    .O(Result[2])
  );
  MUXCY   \Mcount_operation_cy<3>  (
    .CI(Mcount_operation_cy[2]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_operation_cy<3>_rt_630 ),
    .O(Mcount_operation_cy[3])
  );
  XORCY   \Mcount_operation_xor<3>  (
    .CI(Mcount_operation_cy[2]),
    .LI(\Mcount_operation_cy<3>_rt_630 ),
    .O(Result[3])
  );
  XORCY   \Mcount_operation_xor<4>  (
    .CI(Mcount_operation_cy[3]),
    .LI(\Mcount_operation_xor<4>_rt_686 ),
    .O(Result[4])
  );
  MUXCY   \Mcount_counter_cy<0>  (
    .CI(\ALU/C<1>12 ),
    .DI(\bcd/Mcompar_n0001_lut [3]),
    .S(Mcount_counter_lut[0]),
    .O(Mcount_counter_cy[0])
  );
  XORCY   \Mcount_counter_xor<0>  (
    .CI(\ALU/C<1>12 ),
    .LI(Mcount_counter_lut[0]),
    .O(\Result<0>1 )
  );
  MUXCY   \Mcount_counter_cy<1>  (
    .CI(Mcount_counter_cy[0]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<1>_rt_631 ),
    .O(Mcount_counter_cy[1])
  );
  XORCY   \Mcount_counter_xor<1>  (
    .CI(Mcount_counter_cy[0]),
    .LI(\Mcount_counter_cy<1>_rt_631 ),
    .O(\Result<1>1 )
  );
  MUXCY   \Mcount_counter_cy<2>  (
    .CI(Mcount_counter_cy[1]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<2>_rt_632 ),
    .O(Mcount_counter_cy[2])
  );
  XORCY   \Mcount_counter_xor<2>  (
    .CI(Mcount_counter_cy[1]),
    .LI(\Mcount_counter_cy<2>_rt_632 ),
    .O(\Result<2>1 )
  );
  MUXCY   \Mcount_counter_cy<3>  (
    .CI(Mcount_counter_cy[2]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<3>_rt_633 ),
    .O(Mcount_counter_cy[3])
  );
  XORCY   \Mcount_counter_xor<3>  (
    .CI(Mcount_counter_cy[2]),
    .LI(\Mcount_counter_cy<3>_rt_633 ),
    .O(\Result<3>1 )
  );
  MUXCY   \Mcount_counter_cy<4>  (
    .CI(Mcount_counter_cy[3]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<4>_rt_634 ),
    .O(Mcount_counter_cy[4])
  );
  XORCY   \Mcount_counter_xor<4>  (
    .CI(Mcount_counter_cy[3]),
    .LI(\Mcount_counter_cy<4>_rt_634 ),
    .O(\Result<4>1 )
  );
  MUXCY   \Mcount_counter_cy<5>  (
    .CI(Mcount_counter_cy[4]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<5>_rt_635 ),
    .O(Mcount_counter_cy[5])
  );
  XORCY   \Mcount_counter_xor<5>  (
    .CI(Mcount_counter_cy[4]),
    .LI(\Mcount_counter_cy<5>_rt_635 ),
    .O(\Result<5>1 )
  );
  MUXCY   \Mcount_counter_cy<6>  (
    .CI(Mcount_counter_cy[5]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<6>_rt_636 ),
    .O(Mcount_counter_cy[6])
  );
  XORCY   \Mcount_counter_xor<6>  (
    .CI(Mcount_counter_cy[5]),
    .LI(\Mcount_counter_cy<6>_rt_636 ),
    .O(\Result<6>1 )
  );
  MUXCY   \Mcount_counter_cy<7>  (
    .CI(Mcount_counter_cy[6]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<7>_rt_637 ),
    .O(Mcount_counter_cy[7])
  );
  XORCY   \Mcount_counter_xor<7>  (
    .CI(Mcount_counter_cy[6]),
    .LI(\Mcount_counter_cy<7>_rt_637 ),
    .O(\Result<7>1 )
  );
  MUXCY   \Mcount_counter_cy<8>  (
    .CI(Mcount_counter_cy[7]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<8>_rt_638 ),
    .O(Mcount_counter_cy[8])
  );
  XORCY   \Mcount_counter_xor<8>  (
    .CI(Mcount_counter_cy[7]),
    .LI(\Mcount_counter_cy<8>_rt_638 ),
    .O(\Result<8>1 )
  );
  MUXCY   \Mcount_counter_cy<9>  (
    .CI(Mcount_counter_cy[8]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<9>_rt_639 ),
    .O(Mcount_counter_cy[9])
  );
  XORCY   \Mcount_counter_xor<9>  (
    .CI(Mcount_counter_cy[8]),
    .LI(\Mcount_counter_cy<9>_rt_639 ),
    .O(\Result<9>1 )
  );
  MUXCY   \Mcount_counter_cy<10>  (
    .CI(Mcount_counter_cy[9]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<10>_rt_640 ),
    .O(Mcount_counter_cy[10])
  );
  XORCY   \Mcount_counter_xor<10>  (
    .CI(Mcount_counter_cy[9]),
    .LI(\Mcount_counter_cy<10>_rt_640 ),
    .O(\Result<10>1 )
  );
  MUXCY   \Mcount_counter_cy<11>  (
    .CI(Mcount_counter_cy[10]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<11>_rt_641 ),
    .O(Mcount_counter_cy[11])
  );
  XORCY   \Mcount_counter_xor<11>  (
    .CI(Mcount_counter_cy[10]),
    .LI(\Mcount_counter_cy<11>_rt_641 ),
    .O(\Result<11>1 )
  );
  MUXCY   \Mcount_counter_cy<12>  (
    .CI(Mcount_counter_cy[11]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<12>_rt_642 ),
    .O(Mcount_counter_cy[12])
  );
  XORCY   \Mcount_counter_xor<12>  (
    .CI(Mcount_counter_cy[11]),
    .LI(\Mcount_counter_cy<12>_rt_642 ),
    .O(\Result<12>1 )
  );
  MUXCY   \Mcount_counter_cy<13>  (
    .CI(Mcount_counter_cy[12]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<13>_rt_643 ),
    .O(Mcount_counter_cy[13])
  );
  XORCY   \Mcount_counter_xor<13>  (
    .CI(Mcount_counter_cy[12]),
    .LI(\Mcount_counter_cy<13>_rt_643 ),
    .O(\Result<13>1 )
  );
  MUXCY   \Mcount_counter_cy<14>  (
    .CI(Mcount_counter_cy[13]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<14>_rt_644 ),
    .O(Mcount_counter_cy[14])
  );
  XORCY   \Mcount_counter_xor<14>  (
    .CI(Mcount_counter_cy[13]),
    .LI(\Mcount_counter_cy<14>_rt_644 ),
    .O(\Result<14>1 )
  );
  MUXCY   \Mcount_counter_cy<15>  (
    .CI(Mcount_counter_cy[14]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<15>_rt_645 ),
    .O(Mcount_counter_cy[15])
  );
  XORCY   \Mcount_counter_xor<15>  (
    .CI(Mcount_counter_cy[14]),
    .LI(\Mcount_counter_cy<15>_rt_645 ),
    .O(\Result<15>1 )
  );
  MUXCY   \Mcount_counter_cy<16>  (
    .CI(Mcount_counter_cy[15]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<16>_rt_646 ),
    .O(Mcount_counter_cy[16])
  );
  XORCY   \Mcount_counter_xor<16>  (
    .CI(Mcount_counter_cy[15]),
    .LI(\Mcount_counter_cy<16>_rt_646 ),
    .O(\Result<16>1 )
  );
  MUXCY   \Mcount_counter_cy<17>  (
    .CI(Mcount_counter_cy[16]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<17>_rt_647 ),
    .O(Mcount_counter_cy[17])
  );
  XORCY   \Mcount_counter_xor<17>  (
    .CI(Mcount_counter_cy[16]),
    .LI(\Mcount_counter_cy<17>_rt_647 ),
    .O(\Result<17>1 )
  );
  MUXCY   \Mcount_counter_cy<18>  (
    .CI(Mcount_counter_cy[17]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<18>_rt_648 ),
    .O(Mcount_counter_cy[18])
  );
  XORCY   \Mcount_counter_xor<18>  (
    .CI(Mcount_counter_cy[17]),
    .LI(\Mcount_counter_cy<18>_rt_648 ),
    .O(\Result<18>1 )
  );
  MUXCY   \Mcount_counter_cy<19>  (
    .CI(Mcount_counter_cy[18]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<19>_rt_649 ),
    .O(Mcount_counter_cy[19])
  );
  XORCY   \Mcount_counter_xor<19>  (
    .CI(Mcount_counter_cy[18]),
    .LI(\Mcount_counter_cy<19>_rt_649 ),
    .O(\Result<19>1 )
  );
  MUXCY   \Mcount_counter_cy<20>  (
    .CI(Mcount_counter_cy[19]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<20>_rt_650 ),
    .O(Mcount_counter_cy[20])
  );
  XORCY   \Mcount_counter_xor<20>  (
    .CI(Mcount_counter_cy[19]),
    .LI(\Mcount_counter_cy<20>_rt_650 ),
    .O(\Result<20>1 )
  );
  MUXCY   \Mcount_counter_cy<21>  (
    .CI(Mcount_counter_cy[20]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<21>_rt_651 ),
    .O(Mcount_counter_cy[21])
  );
  XORCY   \Mcount_counter_xor<21>  (
    .CI(Mcount_counter_cy[20]),
    .LI(\Mcount_counter_cy<21>_rt_651 ),
    .O(\Result<21>1 )
  );
  MUXCY   \Mcount_counter_cy<22>  (
    .CI(Mcount_counter_cy[21]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<22>_rt_652 ),
    .O(Mcount_counter_cy[22])
  );
  XORCY   \Mcount_counter_xor<22>  (
    .CI(Mcount_counter_cy[21]),
    .LI(\Mcount_counter_cy<22>_rt_652 ),
    .O(\Result<22>1 )
  );
  MUXCY   \Mcount_counter_cy<23>  (
    .CI(Mcount_counter_cy[22]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<23>_rt_653 ),
    .O(Mcount_counter_cy[23])
  );
  XORCY   \Mcount_counter_xor<23>  (
    .CI(Mcount_counter_cy[22]),
    .LI(\Mcount_counter_cy<23>_rt_653 ),
    .O(\Result<23>1 )
  );
  MUXCY   \Mcount_counter_cy<24>  (
    .CI(Mcount_counter_cy[23]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<24>_rt_654 ),
    .O(Mcount_counter_cy[24])
  );
  XORCY   \Mcount_counter_xor<24>  (
    .CI(Mcount_counter_cy[23]),
    .LI(\Mcount_counter_cy<24>_rt_654 ),
    .O(\Result<24>1 )
  );
  MUXCY   \Mcount_counter_cy<25>  (
    .CI(Mcount_counter_cy[24]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<25>_rt_655 ),
    .O(Mcount_counter_cy[25])
  );
  XORCY   \Mcount_counter_xor<25>  (
    .CI(Mcount_counter_cy[24]),
    .LI(\Mcount_counter_cy<25>_rt_655 ),
    .O(\Result<25>1 )
  );
  MUXCY   \Mcount_counter_cy<26>  (
    .CI(Mcount_counter_cy[25]),
    .DI(\ALU/C<1>12 ),
    .S(\Mcount_counter_cy<26>_rt_656 ),
    .O(Mcount_counter_cy[26])
  );
  XORCY   \Mcount_counter_xor<26>  (
    .CI(Mcount_counter_cy[25]),
    .LI(\Mcount_counter_cy<26>_rt_656 ),
    .O(\Result<26>1 )
  );
  XORCY   \Mcount_counter_xor<27>  (
    .CI(Mcount_counter_cy[26]),
    .LI(\Mcount_counter_xor<27>_rt_687 ),
    .O(\Result<27>1 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_4  (
    .I0(\regFile/reg12/Reg_Out [0]),
    .I1(\regFile/reg13/Reg_Out [0]),
    .I2(\regFile/reg15/Reg_Out [0]),
    .I3(\regFile/reg14/Reg_Out [0]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_4_188 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_5  (
    .I0(\regFile/reg8/Reg_Out [0]),
    .I1(\regFile/reg9/Reg_Out [0]),
    .I2(\regFile/reg11/Reg_Out [0]),
    .I3(\regFile/reg10/Reg_Out [0]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_5_189 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7  (
    .I0(\regFile/Mmux_Reg_B_5_189 ),
    .I1(\regFile/Mmux_Reg_B_4_188 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_3_f7_190 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_51  (
    .I0(\regFile/reg4/Reg_Out [0]),
    .I1(\regFile/reg5/Reg_Out [0]),
    .I2(\regFile/reg7/Reg_Out [0]),
    .I3(\regFile/reg6/Reg_Out [0]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_51_191 )
  );
  LUT6 #(
    .INIT ( 64'hAAAACCCCFF00F0F0 ))
  \regFile/Mmux_Reg_B_6  (
    .I0(\regFile/reg3/Reg_Out [0]),
    .I1(\regFile/reg2/Reg_Out [0]),
    .I2(\regFile/reg0/Reg_Out [0]),
    .I3(\regFile/reg1/Reg_Out [0]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_6_192 )
  );
  MUXF7   \regFile/Mmux_Reg_B_4_f7  (
    .I0(\regFile/Mmux_Reg_B_6_192 ),
    .I1(\regFile/Mmux_Reg_B_51_191 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_4_f7_193 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8  (
    .I0(\regFile/Mmux_Reg_B_4_f7_193 ),
    .I1(\regFile/Mmux_Reg_B_3_f7_190 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[0])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_41  (
    .I0(\regFile/reg12/Reg_Out [10]),
    .I1(\regFile/reg13/Reg_Out [10]),
    .I2(\regFile/reg15/Reg_Out [10]),
    .I3(\regFile/reg14/Reg_Out [10]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_41_194 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_0  (
    .I0(\regFile/Mmux_Reg_B_52 ),
    .I1(\regFile/Mmux_Reg_B_41_194 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f71 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_0  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_3_f71 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[10])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_42  (
    .I0(\regFile/reg12/Reg_Out [11]),
    .I1(\regFile/reg13/Reg_Out [11]),
    .I2(\regFile/reg15/Reg_Out [11]),
    .I3(\regFile/reg14/Reg_Out [11]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_42_197 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_1  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_42_197 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f72 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_1  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_3_f72 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[11])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_43  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/reg13/Reg_Out [12]),
    .I2(\regFile/reg15/Reg_Out [12]),
    .I3(\regFile/reg14/Reg_Out [12]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_43_199 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_2  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_43_199 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f73 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_2  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_3_f73 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[12])
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_3  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_44 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f74 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_3  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_3_f74 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[13])
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_4  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_45 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f75 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_4  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_3_f75 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[14])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_47  (
    .I0(\regFile/reg12/Reg_Out [1]),
    .I1(\regFile/reg13/Reg_Out [1]),
    .I2(\regFile/reg15/Reg_Out [1]),
    .I3(\regFile/reg14/Reg_Out [1]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_47_205 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_514  (
    .I0(\regFile/reg8/Reg_Out [1]),
    .I1(\regFile/reg9/Reg_Out [1]),
    .I2(\regFile/reg11/Reg_Out [1]),
    .I3(\regFile/reg10/Reg_Out [1]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_514_206 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_6  (
    .I0(\regFile/Mmux_Reg_B_514_206 ),
    .I1(\regFile/Mmux_Reg_B_47_205 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_3_f77 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_515  (
    .I0(\regFile/reg4/Reg_Out [1]),
    .I1(\regFile/reg5/Reg_Out [1]),
    .I2(\regFile/reg7/Reg_Out [1]),
    .I3(\regFile/reg6/Reg_Out [1]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_515_208 )
  );
  MUXF7   \regFile/Mmux_Reg_B_4_f7_6  (
    .I0(\regFile/Mmux_Reg_B_67 ),
    .I1(\regFile/Mmux_Reg_B_515_208 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_4_f77 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_6  (
    .I0(\regFile/Mmux_Reg_B_4_f77 ),
    .I1(\regFile/Mmux_Reg_B_3_f77 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[1])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_48  (
    .I0(\regFile/reg12/Reg_Out [2]),
    .I1(\regFile/reg13/Reg_Out [2]),
    .I2(\regFile/reg15/Reg_Out [2]),
    .I3(\regFile/reg14/Reg_Out [2]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_48_211 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_516  (
    .I0(\regFile/reg8/Reg_Out [2]),
    .I1(\regFile/reg9/Reg_Out [2]),
    .I2(\regFile/reg11/Reg_Out [2]),
    .I3(\regFile/reg10/Reg_Out [2]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_516_212 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_7  (
    .I0(\regFile/Mmux_Reg_B_516_212 ),
    .I1(\regFile/Mmux_Reg_B_48_211 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_3_f78 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_517  (
    .I0(\regFile/reg4/Reg_Out [2]),
    .I1(\regFile/reg5/Reg_Out [2]),
    .I2(\regFile/reg7/Reg_Out [2]),
    .I3(\regFile/reg6/Reg_Out [2]),
    .I4(Reg_Read_B_0_1_712),
    .I5(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_517_214 )
  );
  MUXF7   \regFile/Mmux_Reg_B_4_f7_7  (
    .I0(\regFile/Mmux_Reg_B_68 ),
    .I1(\regFile/Mmux_Reg_B_517_214 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_4_f78 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_7  (
    .I0(\regFile/Mmux_Reg_B_4_f78 ),
    .I1(\regFile/Mmux_Reg_B_3_f78 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[2])
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_49  (
    .I0(\regFile/reg12/Reg_Out [3]),
    .I1(\regFile/reg13/Reg_Out [3]),
    .I2(\regFile/reg15/Reg_Out [3]),
    .I3(\regFile/reg14/Reg_Out [3]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_49_217 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_518  (
    .I0(\regFile/reg8/Reg_Out [3]),
    .I1(\regFile/reg9/Reg_Out [3]),
    .I2(\regFile/reg11/Reg_Out [3]),
    .I3(\regFile/reg10/Reg_Out [3]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_518_218 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_8  (
    .I0(\regFile/Mmux_Reg_B_518_218 ),
    .I1(\regFile/Mmux_Reg_B_49_217 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_3_f79 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_519  (
    .I0(\regFile/reg4/Reg_Out [3]),
    .I1(\regFile/reg5/Reg_Out [3]),
    .I2(\regFile/reg7/Reg_Out [3]),
    .I3(\regFile/reg6/Reg_Out [3]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_519_220 )
  );
  MUXF7   \regFile/Mmux_Reg_B_4_f7_8  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_519_220 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_4_f79 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_8  (
    .I0(\regFile/Mmux_Reg_B_4_f79 ),
    .I1(\regFile/Mmux_Reg_B_3_f79 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[3])
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_410  (
    .I0(\regFile/reg12/Reg_Out [4]),
    .I1(\regFile/reg13/Reg_Out [4]),
    .I2(\regFile/reg15/Reg_Out [4]),
    .I3(\regFile/reg14/Reg_Out [4]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_410_222 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_520  (
    .I0(\regFile/reg8/Reg_Out [4]),
    .I1(\regFile/reg9/Reg_Out [4]),
    .I2(\regFile/reg11/Reg_Out [4]),
    .I3(\regFile/reg10/Reg_Out [4]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_520_223 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_9  (
    .I0(\regFile/Mmux_Reg_B_520_223 ),
    .I1(\regFile/Mmux_Reg_B_410_222 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_3_f710 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_521  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/reg5/Reg_Out [4]),
    .I2(\regFile/reg7/Reg_Out [4]),
    .I3(\regFile/reg6/Reg_Out [4]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_521_225 )
  );
  MUXF7   \regFile/Mmux_Reg_B_4_f7_9  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_521_225 ),
    .S(Reg_Read_B_2_1_720),
    .O(\regFile/Mmux_Reg_B_4_f710 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_9  (
    .I0(\regFile/Mmux_Reg_B_4_f710 ),
    .I1(\regFile/Mmux_Reg_B_3_f710 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[4])
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_411  (
    .I0(\regFile/reg12/Reg_Out [5]),
    .I1(\regFile/reg13/Reg_Out [5]),
    .I2(\regFile/reg15/Reg_Out [5]),
    .I3(\regFile/reg14/Reg_Out [5]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_411_227 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_522  (
    .I0(\regFile/reg8/Reg_Out [5]),
    .I1(\regFile/reg9/Reg_Out [5]),
    .I2(\regFile/reg11/Reg_Out [5]),
    .I3(\regFile/reg10/Reg_Out [5]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_522_228 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_10  (
    .I0(\regFile/Mmux_Reg_B_522_228 ),
    .I1(\regFile/Mmux_Reg_B_411_227 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f711 )
  );
  MUXF7   \regFile/Mmux_Reg_B_4_f7_10  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_523 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_4_f711 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_10  (
    .I0(\regFile/Mmux_Reg_B_4_f711 ),
    .I1(\regFile/Mmux_Reg_B_3_f711 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[5])
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_B_412  (
    .I0(\regFile/reg12/Reg_Out [6]),
    .I1(\regFile/reg13/Reg_Out [6]),
    .I2(\regFile/reg15/Reg_Out [6]),
    .I3(\regFile/reg14/Reg_Out [6]),
    .I4(Reg_Read_B_1_2_718),
    .I5(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_412_232 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_524  (
    .I0(\regFile/reg8/Reg_Out [6]),
    .I1(\regFile/reg9/Reg_Out [6]),
    .I2(\regFile/reg11/Reg_Out [6]),
    .I3(\regFile/reg10/Reg_Out [6]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_524_233 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_11  (
    .I0(\regFile/Mmux_Reg_B_524_233 ),
    .I1(\regFile/Mmux_Reg_B_412_232 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f712 )
  );
  MUXF7   \regFile/Mmux_Reg_B_4_f7_11  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_525 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_4_f712 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_11  (
    .I0(\regFile/Mmux_Reg_B_4_f712 ),
    .I1(\regFile/Mmux_Reg_B_3_f712 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[6])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_413  (
    .I0(\regFile/reg12/Reg_Out [7]),
    .I1(\regFile/reg13/Reg_Out [7]),
    .I2(\regFile/reg15/Reg_Out [7]),
    .I3(\regFile/reg14/Reg_Out [7]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_413_237 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_526  (
    .I0(\regFile/reg8/Reg_Out [7]),
    .I1(\regFile/reg9/Reg_Out [7]),
    .I2(\regFile/reg11/Reg_Out [7]),
    .I3(\regFile/reg10/Reg_Out [7]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_526_238 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_12  (
    .I0(\regFile/Mmux_Reg_B_526_238 ),
    .I1(\regFile/Mmux_Reg_B_413_237 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f713 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_12  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_3_f713 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[7])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_414  (
    .I0(\regFile/reg12/Reg_Out [8]),
    .I1(\regFile/reg13/Reg_Out [8]),
    .I2(\regFile/reg15/Reg_Out [8]),
    .I3(\regFile/reg14/Reg_Out [8]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_414_240 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_528  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/reg9/Reg_Out [8]),
    .I2(\regFile/reg11/Reg_Out [8]),
    .I3(\regFile/reg10/Reg_Out [8]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_528_241 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_13  (
    .I0(\regFile/Mmux_Reg_B_528_241 ),
    .I1(\regFile/Mmux_Reg_B_414_240 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f714 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_13  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_3_f714 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[8])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_B_415  (
    .I0(\regFile/reg12/Reg_Out [9]),
    .I1(\regFile/reg13/Reg_Out [9]),
    .I2(\regFile/reg15/Reg_Out [9]),
    .I3(\regFile/reg14/Reg_Out [9]),
    .I4(Reg_Read_B[0]),
    .I5(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_415_243 )
  );
  MUXF7   \regFile/Mmux_Reg_B_3_f7_14  (
    .I0(\regFile/Mmux_Reg_B_530 ),
    .I1(\regFile/Mmux_Reg_B_415_243 ),
    .S(Reg_Read_B[2]),
    .O(\regFile/Mmux_Reg_B_3_f715 )
  );
  MUXF8   \regFile/Mmux_Reg_B_2_f8_14  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_B_3_f715 ),
    .S(Reg_Read_B[3]),
    .O(Reg_B[9])
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_4  (
    .I0(\regFile/reg12/Reg_Out [0]),
    .I1(\regFile/reg13/Reg_Out [0]),
    .I2(\regFile/reg15/Reg_Out [0]),
    .I3(\regFile/reg14/Reg_Out [0]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_4_246 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_5  (
    .I0(\regFile/reg8/Reg_Out [0]),
    .I1(\regFile/reg9/Reg_Out [0]),
    .I2(\regFile/reg11/Reg_Out [0]),
    .I3(\regFile/reg10/Reg_Out [0]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_5_247 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7  (
    .I0(\regFile/Mmux_Reg_A_5_247 ),
    .I1(\regFile/Mmux_Reg_A_4_246 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_3_f7_248 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_51  (
    .I0(\regFile/reg4/Reg_Out [0]),
    .I1(\regFile/reg5/Reg_Out [0]),
    .I2(\regFile/reg7/Reg_Out [0]),
    .I3(\regFile/reg6/Reg_Out [0]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_51_249 )
  );
  LUT6 #(
    .INIT ( 64'hAAAACCCCFF00F0F0 ))
  \regFile/Mmux_Reg_A_6  (
    .I0(\regFile/reg3/Reg_Out [0]),
    .I1(\regFile/reg2/Reg_Out [0]),
    .I2(\regFile/reg0/Reg_Out [0]),
    .I3(\regFile/reg1/Reg_Out [0]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_6_250 )
  );
  MUXF7   \regFile/Mmux_Reg_A_4_f7  (
    .I0(\regFile/Mmux_Reg_A_6_250 ),
    .I1(\regFile/Mmux_Reg_A_51_249 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_4_f7_251 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8  (
    .I0(\regFile/Mmux_Reg_A_4_f7_251 ),
    .I1(\regFile/Mmux_Reg_A_3_f7_248 ),
    .S(Reg_Read_A[3]),
    .O(\Reg_A[0] )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_41  (
    .I0(\regFile/reg12/Reg_Out [10]),
    .I1(\regFile/reg13/Reg_Out [10]),
    .I2(\regFile/reg15/Reg_Out [10]),
    .I3(\regFile/reg14/Reg_Out [10]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_41_252 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_0  (
    .I0(\regFile/Mmux_Reg_A_52 ),
    .I1(\regFile/Mmux_Reg_A_41_252 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f71 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_0  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_3_f71 ),
    .S(Reg_Read_A[3]),
    .O(\Reg_A[10] )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_42  (
    .I0(\regFile/reg12/Reg_Out [11]),
    .I1(\regFile/reg13/Reg_Out [11]),
    .I2(\regFile/reg15/Reg_Out [11]),
    .I3(\regFile/reg14/Reg_Out [11]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_42_255 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_1  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_42_255 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f72 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_1  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_3_f72 ),
    .S(Reg_Read_A[3]),
    .O(\ALU/Sh431 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_43  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/reg13/Reg_Out [12]),
    .I2(\regFile/reg15/Reg_Out [12]),
    .I3(\regFile/reg14/Reg_Out [12]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_43_257 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_2  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_43_257 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f73 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_2  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_3_f73 ),
    .S(Reg_Read_A[3]),
    .O(\ALU/Sh441 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_3  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_44 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f74 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_3  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_3_f74 ),
    .S(Reg_Read_A[3]),
    .O(\ALU/Sh451 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_4  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_45 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f75 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_4  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_3_f75 ),
    .S(Reg_Read_A[3]),
    .O(\ALU/Sh461 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_47  (
    .I0(\regFile/reg12/Reg_Out [1]),
    .I1(\regFile/reg13/Reg_Out [1]),
    .I2(\regFile/reg15/Reg_Out [1]),
    .I3(\regFile/reg14/Reg_Out [1]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_47_263 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_514  (
    .I0(\regFile/reg8/Reg_Out [1]),
    .I1(\regFile/reg9/Reg_Out [1]),
    .I2(\regFile/reg11/Reg_Out [1]),
    .I3(\regFile/reg10/Reg_Out [1]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_514_264 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_6  (
    .I0(\regFile/Mmux_Reg_A_514_264 ),
    .I1(\regFile/Mmux_Reg_A_47_263 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_3_f77 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_515  (
    .I0(\regFile/reg4/Reg_Out [1]),
    .I1(\regFile/reg5/Reg_Out [1]),
    .I2(\regFile/reg7/Reg_Out [1]),
    .I3(\regFile/reg6/Reg_Out [1]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_515_266 )
  );
  MUXF7   \regFile/Mmux_Reg_A_4_f7_6  (
    .I0(\regFile/Mmux_Reg_A_67 ),
    .I1(\regFile/Mmux_Reg_A_515_266 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_4_f77 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_6  (
    .I0(\regFile/Mmux_Reg_A_4_f77 ),
    .I1(\regFile/Mmux_Reg_A_3_f77 ),
    .S(Reg_Read_A[3]),
    .O(\ALU/Sh143 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_48  (
    .I0(\regFile/reg12/Reg_Out [2]),
    .I1(\regFile/reg13/Reg_Out [2]),
    .I2(\regFile/reg15/Reg_Out [2]),
    .I3(\regFile/reg14/Reg_Out [2]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_48_269 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_516  (
    .I0(\regFile/reg8/Reg_Out [2]),
    .I1(\regFile/reg9/Reg_Out [2]),
    .I2(\regFile/reg11/Reg_Out [2]),
    .I3(\regFile/reg10/Reg_Out [2]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_516_270 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_7  (
    .I0(\regFile/Mmux_Reg_A_516_270 ),
    .I1(\regFile/Mmux_Reg_A_48_269 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_3_f78 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_517  (
    .I0(\regFile/reg4/Reg_Out [2]),
    .I1(\regFile/reg5/Reg_Out [2]),
    .I2(\regFile/reg7/Reg_Out [2]),
    .I3(\regFile/reg6/Reg_Out [2]),
    .I4(Reg_Read_A_0_1_711),
    .I5(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_517_272 )
  );
  MUXF7   \regFile/Mmux_Reg_A_4_f7_7  (
    .I0(\regFile/Mmux_Reg_A_68 ),
    .I1(\regFile/Mmux_Reg_A_517_272 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_4_f78 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_7  (
    .I0(\regFile/Mmux_Reg_A_4_f78 ),
    .I1(\regFile/Mmux_Reg_A_3_f78 ),
    .S(Reg_Read_A[3]),
    .O(\ALU/Sh159 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_49  (
    .I0(\regFile/reg12/Reg_Out [3]),
    .I1(\regFile/reg13/Reg_Out [3]),
    .I2(\regFile/reg15/Reg_Out [3]),
    .I3(\regFile/reg14/Reg_Out [3]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_49_275 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_518  (
    .I0(\regFile/reg8/Reg_Out [3]),
    .I1(\regFile/reg9/Reg_Out [3]),
    .I2(\regFile/reg11/Reg_Out [3]),
    .I3(\regFile/reg10/Reg_Out [3]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_518_276 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_8  (
    .I0(\regFile/Mmux_Reg_A_518_276 ),
    .I1(\regFile/Mmux_Reg_A_49_275 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_3_f79 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_519  (
    .I0(\regFile/reg4/Reg_Out [3]),
    .I1(\regFile/reg5/Reg_Out [3]),
    .I2(\regFile/reg7/Reg_Out [3]),
    .I3(\regFile/reg6/Reg_Out [3]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_519_278 )
  );
  MUXF7   \regFile/Mmux_Reg_A_4_f7_8  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_519_278 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_4_f79 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_8  (
    .I0(\regFile/Mmux_Reg_A_4_f79 ),
    .I1(\regFile/Mmux_Reg_A_3_f79 ),
    .S(Reg_Read_A[3]),
    .O(\ALU/Sh24 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_410  (
    .I0(\regFile/reg12/Reg_Out [4]),
    .I1(\regFile/reg13/Reg_Out [4]),
    .I2(\regFile/reg15/Reg_Out [4]),
    .I3(\regFile/reg14/Reg_Out [4]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_410_280 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_520  (
    .I0(\regFile/reg8/Reg_Out [4]),
    .I1(\regFile/reg9/Reg_Out [4]),
    .I2(\regFile/reg11/Reg_Out [4]),
    .I3(\regFile/reg10/Reg_Out [4]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_520_281 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_9  (
    .I0(\regFile/Mmux_Reg_A_520_281 ),
    .I1(\regFile/Mmux_Reg_A_410_280 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_3_f710 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_521  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/reg5/Reg_Out [4]),
    .I2(\regFile/reg7/Reg_Out [4]),
    .I3(\regFile/reg6/Reg_Out [4]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_521_283 )
  );
  MUXF7   \regFile/Mmux_Reg_A_4_f7_9  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_521_283 ),
    .S(Reg_Read_A_2_1_719),
    .O(\regFile/Mmux_Reg_A_4_f710 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_9  (
    .I0(\regFile/Mmux_Reg_A_4_f710 ),
    .I1(\regFile/Mmux_Reg_A_3_f710 ),
    .S(Reg_Read_A[3]),
    .O(\ALU/Sh310 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_411  (
    .I0(\regFile/reg12/Reg_Out [5]),
    .I1(\regFile/reg13/Reg_Out [5]),
    .I2(\regFile/reg15/Reg_Out [5]),
    .I3(\regFile/reg14/Reg_Out [5]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_411_285 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_522  (
    .I0(\regFile/reg8/Reg_Out [5]),
    .I1(\regFile/reg9/Reg_Out [5]),
    .I2(\regFile/reg11/Reg_Out [5]),
    .I3(\regFile/reg10/Reg_Out [5]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_522_286 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_10  (
    .I0(\regFile/Mmux_Reg_A_522_286 ),
    .I1(\regFile/Mmux_Reg_A_411_285 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f711 )
  );
  MUXF7   \regFile/Mmux_Reg_A_4_f7_10  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_523 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_4_f711 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_10  (
    .I0(\regFile/Mmux_Reg_A_4_f711 ),
    .I1(\regFile/Mmux_Reg_A_3_f711 ),
    .S(Reg_Read_A[3]),
    .O(\Reg_A[5] )
  );
  LUT6 #(
    .INIT ( 64'hF0F0CCCCFF00AAAA ))
  \regFile/Mmux_Reg_A_412  (
    .I0(\regFile/reg12/Reg_Out [6]),
    .I1(\regFile/reg13/Reg_Out [6]),
    .I2(\regFile/reg15/Reg_Out [6]),
    .I3(\regFile/reg14/Reg_Out [6]),
    .I4(Reg_Read_A_1_2_717),
    .I5(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_412_290 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_524  (
    .I0(\regFile/reg8/Reg_Out [6]),
    .I1(\regFile/reg9/Reg_Out [6]),
    .I2(\regFile/reg11/Reg_Out [6]),
    .I3(\regFile/reg10/Reg_Out [6]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_524_291 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_11  (
    .I0(\regFile/Mmux_Reg_A_524_291 ),
    .I1(\regFile/Mmux_Reg_A_412_290 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f712 )
  );
  MUXF7   \regFile/Mmux_Reg_A_4_f7_11  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_525 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_4_f712 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_11  (
    .I0(\regFile/Mmux_Reg_A_4_f712 ),
    .I1(\regFile/Mmux_Reg_A_3_f712 ),
    .S(Reg_Read_A[3]),
    .O(\Reg_A[6] )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_413  (
    .I0(\regFile/reg12/Reg_Out [7]),
    .I1(\regFile/reg13/Reg_Out [7]),
    .I2(\regFile/reg15/Reg_Out [7]),
    .I3(\regFile/reg14/Reg_Out [7]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_413_295 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_526  (
    .I0(\regFile/reg8/Reg_Out [7]),
    .I1(\regFile/reg9/Reg_Out [7]),
    .I2(\regFile/reg11/Reg_Out [7]),
    .I3(\regFile/reg10/Reg_Out [7]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_526_296 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_12  (
    .I0(\regFile/Mmux_Reg_A_526_296 ),
    .I1(\regFile/Mmux_Reg_A_413_295 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f713 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_12  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_3_f713 ),
    .S(Reg_Read_A[3]),
    .O(\Reg_A[7] )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_414  (
    .I0(\regFile/reg12/Reg_Out [8]),
    .I1(\regFile/reg13/Reg_Out [8]),
    .I2(\regFile/reg15/Reg_Out [8]),
    .I3(\regFile/reg14/Reg_Out [8]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_414_298 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_528  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/reg9/Reg_Out [8]),
    .I2(\regFile/reg11/Reg_Out [8]),
    .I3(\regFile/reg10/Reg_Out [8]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_528_299 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_13  (
    .I0(\regFile/Mmux_Reg_A_528_299 ),
    .I1(\regFile/Mmux_Reg_A_414_298 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f714 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_13  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_3_f714 ),
    .S(Reg_Read_A[3]),
    .O(\Reg_A[8] )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \regFile/Mmux_Reg_A_415  (
    .I0(\regFile/reg12/Reg_Out [9]),
    .I1(\regFile/reg13/Reg_Out [9]),
    .I2(\regFile/reg15/Reg_Out [9]),
    .I3(\regFile/reg14/Reg_Out [9]),
    .I4(Reg_Read_A[0]),
    .I5(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_415_301 )
  );
  MUXF7   \regFile/Mmux_Reg_A_3_f7_14  (
    .I0(\regFile/Mmux_Reg_A_530 ),
    .I1(\regFile/Mmux_Reg_A_415_301 ),
    .S(Reg_Read_A[2]),
    .O(\regFile/Mmux_Reg_A_3_f715 )
  );
  MUXF8   \regFile/Mmux_Reg_A_2_f8_14  (
    .I0(\ALU/C<1>12 ),
    .I1(\regFile/Mmux_Reg_A_3_f715 ),
    .S(Reg_Read_A[3]),
    .O(\Reg_A[9] )
  );
  FDRE   \regFile/reg2/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_3_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg2/Reg_Out [0])
  );
  FDRE   \regFile/reg2/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_3_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg2/Reg_Out [1])
  );
  FDRE   \regFile/reg3/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_4_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg3/Reg_Out [0])
  );
  FDRE   \regFile/reg3/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_4_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg3/Reg_Out [1])
  );
  FDRE   \regFile/reg3/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_4_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg3/Reg_Out [2])
  );
  FDRE   \regFile/reg4/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_5_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg4/Reg_Out [0])
  );
  FDRE   \regFile/reg4/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_5_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg4/Reg_Out [1])
  );
  FDRE   \regFile/reg4/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_5_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg4/Reg_Out [2])
  );
  FDRE   \regFile/reg4/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_5_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg4/Reg_Out [3])
  );
  FDRE   \regFile/reg5/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_6_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg5/Reg_Out [0])
  );
  FDRE   \regFile/reg5/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_6_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg5/Reg_Out [1])
  );
  FDRE   \regFile/reg5/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_6_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg5/Reg_Out [2])
  );
  FDRE   \regFile/reg5/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_6_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg5/Reg_Out [3])
  );
  FDRE   \regFile/reg5/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_6_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg5/Reg_Out [4])
  );
  FDRE   \regFile/reg6/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_7_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg6/Reg_Out [0])
  );
  FDRE   \regFile/reg6/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_7_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg6/Reg_Out [1])
  );
  FDRE   \regFile/reg6/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_7_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg6/Reg_Out [2])
  );
  FDRE   \regFile/reg6/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_7_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg6/Reg_Out [3])
  );
  FDRE   \regFile/reg6/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_7_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg6/Reg_Out [4])
  );
  FDRE   \regFile/reg6/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_7_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg6/Reg_Out [5])
  );
  FDRE   \regFile/reg7/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_8_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg7/Reg_Out [0])
  );
  FDRE   \regFile/reg7/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_8_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg7/Reg_Out [1])
  );
  FDRE   \regFile/reg7/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_8_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg7/Reg_Out [2])
  );
  FDRE   \regFile/reg7/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_8_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg7/Reg_Out [3])
  );
  FDRE   \regFile/reg7/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_8_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg7/Reg_Out [4])
  );
  FDRE   \regFile/reg7/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_8_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg7/Reg_Out [5])
  );
  FDRE   \regFile/reg7/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_8_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg7/Reg_Out [6])
  );
  FDRE   \regFile/reg8/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_9_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg8/Reg_Out [0])
  );
  FDRE   \regFile/reg8/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_9_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg8/Reg_Out [1])
  );
  FDRE   \regFile/reg8/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_9_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg8/Reg_Out [2])
  );
  FDRE   \regFile/reg8/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_9_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg8/Reg_Out [3])
  );
  FDRE   \regFile/reg8/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_9_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg8/Reg_Out [4])
  );
  FDRE   \regFile/reg8/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_9_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg8/Reg_Out [5])
  );
  FDRE   \regFile/reg8/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_9_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg8/Reg_Out [6])
  );
  FDRE   \regFile/reg8/Reg_Out_7  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_9_o ),
    .D(C[7]),
    .R(Reset_39),
    .Q(\regFile/reg8/Reg_Out [7])
  );
  FDRE   \regFile/reg9/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [0])
  );
  FDRE   \regFile/reg9/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [1])
  );
  FDRE   \regFile/reg9/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [2])
  );
  FDRE   \regFile/reg9/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [3])
  );
  FDRE   \regFile/reg9/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [4])
  );
  FDRE   \regFile/reg9/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [5])
  );
  FDRE   \regFile/reg9/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [6])
  );
  FDRE   \regFile/reg9/Reg_Out_7  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[7]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [7])
  );
  FDRE   \regFile/reg9/Reg_Out_8  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_10_o ),
    .D(C[8]),
    .R(Reset_39),
    .Q(\regFile/reg9/Reg_Out [8])
  );
  FDRE   \regFile/reg10/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [0])
  );
  FDRE   \regFile/reg10/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [1])
  );
  FDRE   \regFile/reg10/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [2])
  );
  FDRE   \regFile/reg10/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [3])
  );
  FDRE   \regFile/reg10/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [4])
  );
  FDRE   \regFile/reg10/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [5])
  );
  FDRE   \regFile/reg10/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [6])
  );
  FDRE   \regFile/reg10/Reg_Out_7  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[7]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [7])
  );
  FDRE   \regFile/reg10/Reg_Out_8  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[8]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [8])
  );
  FDRE   \regFile/reg10/Reg_Out_9  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_11_o ),
    .D(C[9]),
    .R(Reset_39),
    .Q(\regFile/reg10/Reg_Out [9])
  );
  FDRE   \regFile/reg11/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [0])
  );
  FDRE   \regFile/reg11/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [1])
  );
  FDRE   \regFile/reg11/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [2])
  );
  FDRE   \regFile/reg11/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [3])
  );
  FDRE   \regFile/reg11/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [4])
  );
  FDRE   \regFile/reg11/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [5])
  );
  FDRE   \regFile/reg11/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [6])
  );
  FDRE   \regFile/reg11/Reg_Out_7  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[7]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [7])
  );
  FDRE   \regFile/reg11/Reg_Out_8  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[8]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [8])
  );
  FDRE   \regFile/reg11/Reg_Out_9  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[9]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [9])
  );
  FDRE   \regFile/reg11/Reg_Out_10  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_12_o ),
    .D(C[10]),
    .R(Reset_39),
    .Q(\regFile/reg11/Reg_Out [10])
  );
  FDRE   \regFile/reg12/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [0])
  );
  FDRE   \regFile/reg12/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [1])
  );
  FDRE   \regFile/reg12/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [2])
  );
  FDRE   \regFile/reg12/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [3])
  );
  FDRE   \regFile/reg12/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [4])
  );
  FDRE   \regFile/reg12/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [5])
  );
  FDRE   \regFile/reg12/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [6])
  );
  FDRE   \regFile/reg12/Reg_Out_7  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[7]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [7])
  );
  FDRE   \regFile/reg12/Reg_Out_8  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[8]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [8])
  );
  FDRE   \regFile/reg12/Reg_Out_9  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[9]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [9])
  );
  FDRE   \regFile/reg12/Reg_Out_10  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[10]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [10])
  );
  FDRE   \regFile/reg12/Reg_Out_11  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_13_o ),
    .D(C[11]),
    .R(Reset_39),
    .Q(\regFile/reg12/Reg_Out [11])
  );
  FDRE   \regFile/reg13/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [0])
  );
  FDRE   \regFile/reg13/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [1])
  );
  FDRE   \regFile/reg13/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [2])
  );
  FDRE   \regFile/reg13/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [3])
  );
  FDRE   \regFile/reg13/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [4])
  );
  FDRE   \regFile/reg13/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [5])
  );
  FDRE   \regFile/reg13/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [6])
  );
  FDRE   \regFile/reg13/Reg_Out_7  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[7]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [7])
  );
  FDRE   \regFile/reg13/Reg_Out_8  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[8]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [8])
  );
  FDRE   \regFile/reg13/Reg_Out_9  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[9]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [9])
  );
  FDRE   \regFile/reg13/Reg_Out_10  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[10]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [10])
  );
  FDRE   \regFile/reg13/Reg_Out_11  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[11]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [11])
  );
  FDRE   \regFile/reg13/Reg_Out_12  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_14_o ),
    .D(C[12]),
    .R(Reset_39),
    .Q(\regFile/reg13/Reg_Out [12])
  );
  FDRE   \regFile/reg14/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [0])
  );
  FDRE   \regFile/reg14/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [1])
  );
  FDRE   \regFile/reg14/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [2])
  );
  FDRE   \regFile/reg14/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [3])
  );
  FDRE   \regFile/reg14/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [4])
  );
  FDRE   \regFile/reg14/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [5])
  );
  FDRE   \regFile/reg14/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [6])
  );
  FDRE   \regFile/reg14/Reg_Out_7  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[7]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [7])
  );
  FDRE   \regFile/reg14/Reg_Out_8  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[8]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [8])
  );
  FDRE   \regFile/reg14/Reg_Out_9  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[9]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [9])
  );
  FDRE   \regFile/reg14/Reg_Out_10  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[10]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [10])
  );
  FDRE   \regFile/reg14/Reg_Out_11  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[11]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [11])
  );
  FDRE   \regFile/reg14/Reg_Out_12  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[12]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [12])
  );
  FDRE   \regFile/reg14/Reg_Out_13  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_15_o ),
    .D(C[13]),
    .R(Reset_39),
    .Q(\regFile/reg14/Reg_Out [13])
  );
  FDRE   \regFile/reg15/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[0]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [0])
  );
  FDRE   \regFile/reg15/Reg_Out_1  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[1]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [1])
  );
  FDRE   \regFile/reg15/Reg_Out_2  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[2]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [2])
  );
  FDRE   \regFile/reg15/Reg_Out_3  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[3]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [3])
  );
  FDRE   \regFile/reg15/Reg_Out_4  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[4]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [4])
  );
  FDRE   \regFile/reg15/Reg_Out_5  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[5]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [5])
  );
  FDRE   \regFile/reg15/Reg_Out_6  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[6]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [6])
  );
  FDRE   \regFile/reg15/Reg_Out_7  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[7]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [7])
  );
  FDRE   \regFile/reg15/Reg_Out_8  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[8]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [8])
  );
  FDRE   \regFile/reg15/Reg_Out_9  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[9]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [9])
  );
  FDRE   \regFile/reg15/Reg_Out_10  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[10]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [10])
  );
  FDRE   \regFile/reg15/Reg_Out_11  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[11]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [11])
  );
  FDRE   \regFile/reg15/Reg_Out_12  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[12]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [12])
  );
  FDRE   \regFile/reg15/Reg_Out_13  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[13]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [13])
  );
  FDRE   \regFile/reg15/Reg_Out_14  (
    .C(Clk_BUFGP_0),
    .CE(\regFile/Write_Enable_Reg_Write[3]_AND_16_o ),
    .D(C[14]),
    .R(Reset_39),
    .Q(\regFile/reg15/Reg_Out [14])
  );
  MUXCY   \bcd/Mcompar_n0001_cy<5>  (
    .CI(\bcd/Mcompar_n0001_cy [4]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcompar_n0001_lut [3]),
    .O(\bcd/Mcompar_n0001_cy [5])
  );
  MUXCY   \bcd/Mcompar_n0001_cy<4>  (
    .CI(\bcd/Mcompar_n0001_cy [3]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcompar_n0001_lut [3]),
    .O(\bcd/Mcompar_n0001_cy [4])
  );
  MUXCY   \bcd/Mcompar_n0001_cy<3>  (
    .CI(\bcd/Mcompar_n0001_cy [2]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcompar_n0001_lut [3]),
    .O(\bcd/Mcompar_n0001_cy [3])
  );
  MUXCY   \bcd/Mcompar_n0001_cy<2>  (
    .CI(\bcd/Mcompar_n0001_cy [1]),
    .DI(\bcd/Mcompar_n0001_lutdi2 ),
    .S(\bcd/Mcompar_n0001_lut [2]),
    .O(\bcd/Mcompar_n0001_cy [2])
  );
  MUXCY   \bcd/Mcompar_n0001_cy<1>  (
    .CI(\bcd/Mcompar_n0001_cy [0]),
    .DI(\bcd/Mcompar_n0001_lutdi1_450 ),
    .S(\bcd/Mcompar_n0001_lut [1]),
    .O(\bcd/Mcompar_n0001_cy [1])
  );
  LUT5 #(
    .INIT ( 32'h00000100 ))
  \bcd/Mcompar_n0001_lut<1>  (
    .I0(\bcd/clkCount[31]_GND_8_o_add_1_OUT<10> ),
    .I1(\bcd/clkCount[31]_GND_8_o_add_1_OUT<11> ),
    .I2(\bcd/clkCount[31]_GND_8_o_add_1_OUT<12> ),
    .I3(\bcd/clkCount[31]_GND_8_o_add_1_OUT<9> ),
    .I4(\bcd/clkCount[31]_GND_8_o_add_1_OUT<13> ),
    .O(\bcd/Mcompar_n0001_lut [1])
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \bcd/Mcompar_n0001_lutdi1  (
    .I0(\bcd/clkCount[31]_GND_8_o_add_1_OUT<13> ),
    .I1(\bcd/clkCount[31]_GND_8_o_add_1_OUT<12> ),
    .I2(\bcd/clkCount[31]_GND_8_o_add_1_OUT<11> ),
    .I3(\bcd/clkCount[31]_GND_8_o_add_1_OUT<10> ),
    .O(\bcd/Mcompar_n0001_lutdi1_450 )
  );
  MUXCY   \bcd/Mcompar_n0001_cy<0>  (
    .CI(\bcd/Mcompar_n0001_lut [3]),
    .DI(\bcd/Mcompar_n0001_lutdi_453 ),
    .S(\bcd/Mcompar_n0001_lut [0]),
    .O(\bcd/Mcompar_n0001_cy [0])
  );
  LUT5 #(
    .INIT ( 32'h00002000 ))
  \bcd/Mcompar_n0001_lut<0>  (
    .I0(\bcd/clkCount[31]_GND_8_o_add_1_OUT<8> ),
    .I1(\bcd/clkCount[31]_GND_8_o_add_1_OUT<5> ),
    .I2(\bcd/clkCount[31]_GND_8_o_add_1_OUT<6> ),
    .I3(\bcd/clkCount[31]_GND_8_o_add_1_OUT<4> ),
    .I4(\bcd/clkCount[31]_GND_8_o_add_1_OUT<7> ),
    .O(\bcd/Mcompar_n0001_lut [0])
  );
  LUT4 #(
    .INIT ( 16'hAA80 ))
  \bcd/Mcompar_n0001_lutdi  (
    .I0(\bcd/clkCount[31]_GND_8_o_add_1_OUT<8> ),
    .I1(\bcd/clkCount[31]_GND_8_o_add_1_OUT<6> ),
    .I2(\bcd/clkCount[31]_GND_8_o_add_1_OUT<5> ),
    .I3(\bcd/clkCount[31]_GND_8_o_add_1_OUT<7> ),
    .O(\bcd/Mcompar_n0001_lutdi_453 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<16>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>_454 ),
    .LI(\ALU/C<1>12 ),
    .O(\bcd/Mcompar_n0001_lutdi2 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<15>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_455 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>_rt_657 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<15> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_455 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>_rt_657 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>_454 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<14>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_456 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_rt_658 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<14> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_456 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_rt_658 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_455 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<13>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_457 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_rt_659 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<13> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_457 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_rt_659 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_456 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<12>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_458 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_rt_660 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<12> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_458 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_rt_660 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_457 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<11>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_459 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_rt_661 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<11> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_459 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_rt_661 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_458 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<10>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_460 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_rt_662 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<10> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_460 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_rt_662 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_459 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<9>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_461 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_rt_663 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<9> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_461 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_rt_663 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_460 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<8>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_462 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_rt_664 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<8> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_462 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_rt_664 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_461 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<7>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_463 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_rt_665 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<7> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_463 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_rt_665 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_462 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<6>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_464 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_rt_666 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<6> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_464 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_rt_666 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_463 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<5>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_465 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_rt_667 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<5> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_465 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_rt_667 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_464 )
  );
  XORCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_xor<4>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>_466 ),
    .LI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_rt_668 ),
    .O(\bcd/clkCount[31]_GND_8_o_add_1_OUT<4> )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>_466 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_rt_668 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_465 )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<2>_467 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>_rt_669 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>_466 )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<2>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<1>_468 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<2>_rt_670 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<2>_467 )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<1>  (
    .CI(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<0>_469 ),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<1>_rt_671 ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<1>_468 )
  );
  MUXCY   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<0>  (
    .CI(\ALU/C<1>12 ),
    .DI(\bcd/Mcompar_n0001_lut [3]),
    .S(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_lut<0> ),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<0>_469 )
  );
  XORCY   \bcd/Mcount_clkCount_xor<15>  (
    .CI(\bcd/Mcount_clkCount_cy [14]),
    .LI(\bcd/Mcount_clkCount_xor<15>_rt_688 ),
    .O(\bcd/Result [15])
  );
  XORCY   \bcd/Mcount_clkCount_xor<14>  (
    .CI(\bcd/Mcount_clkCount_cy [13]),
    .LI(\bcd/Mcount_clkCount_cy<14>_rt_672 ),
    .O(\bcd/Result [14])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<14>  (
    .CI(\bcd/Mcount_clkCount_cy [13]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<14>_rt_672 ),
    .O(\bcd/Mcount_clkCount_cy [14])
  );
  XORCY   \bcd/Mcount_clkCount_xor<13>  (
    .CI(\bcd/Mcount_clkCount_cy [12]),
    .LI(\bcd/Mcount_clkCount_cy<13>_rt_673 ),
    .O(\bcd/Result [13])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<13>  (
    .CI(\bcd/Mcount_clkCount_cy [12]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<13>_rt_673 ),
    .O(\bcd/Mcount_clkCount_cy [13])
  );
  XORCY   \bcd/Mcount_clkCount_xor<12>  (
    .CI(\bcd/Mcount_clkCount_cy [11]),
    .LI(\bcd/Mcount_clkCount_cy<12>_rt_674 ),
    .O(\bcd/Result [12])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<12>  (
    .CI(\bcd/Mcount_clkCount_cy [11]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<12>_rt_674 ),
    .O(\bcd/Mcount_clkCount_cy [12])
  );
  XORCY   \bcd/Mcount_clkCount_xor<11>  (
    .CI(\bcd/Mcount_clkCount_cy [10]),
    .LI(\bcd/Mcount_clkCount_cy<11>_rt_675 ),
    .O(\bcd/Result [11])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<11>  (
    .CI(\bcd/Mcount_clkCount_cy [10]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<11>_rt_675 ),
    .O(\bcd/Mcount_clkCount_cy [11])
  );
  XORCY   \bcd/Mcount_clkCount_xor<10>  (
    .CI(\bcd/Mcount_clkCount_cy [9]),
    .LI(\bcd/Mcount_clkCount_cy<10>_rt_676 ),
    .O(\bcd/Result [10])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<10>  (
    .CI(\bcd/Mcount_clkCount_cy [9]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<10>_rt_676 ),
    .O(\bcd/Mcount_clkCount_cy [10])
  );
  XORCY   \bcd/Mcount_clkCount_xor<9>  (
    .CI(\bcd/Mcount_clkCount_cy [8]),
    .LI(\bcd/Mcount_clkCount_cy<9>_rt_677 ),
    .O(\bcd/Result [9])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<9>  (
    .CI(\bcd/Mcount_clkCount_cy [8]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<9>_rt_677 ),
    .O(\bcd/Mcount_clkCount_cy [9])
  );
  XORCY   \bcd/Mcount_clkCount_xor<8>  (
    .CI(\bcd/Mcount_clkCount_cy [7]),
    .LI(\bcd/Mcount_clkCount_cy<8>_rt_678 ),
    .O(\bcd/Result [8])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<8>  (
    .CI(\bcd/Mcount_clkCount_cy [7]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<8>_rt_678 ),
    .O(\bcd/Mcount_clkCount_cy [8])
  );
  XORCY   \bcd/Mcount_clkCount_xor<7>  (
    .CI(\bcd/Mcount_clkCount_cy [6]),
    .LI(\bcd/Mcount_clkCount_cy<7>_rt_679 ),
    .O(\bcd/Result [7])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<7>  (
    .CI(\bcd/Mcount_clkCount_cy [6]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<7>_rt_679 ),
    .O(\bcd/Mcount_clkCount_cy [7])
  );
  XORCY   \bcd/Mcount_clkCount_xor<6>  (
    .CI(\bcd/Mcount_clkCount_cy [5]),
    .LI(\bcd/Mcount_clkCount_cy<6>_rt_680 ),
    .O(\bcd/Result [6])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<6>  (
    .CI(\bcd/Mcount_clkCount_cy [5]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<6>_rt_680 ),
    .O(\bcd/Mcount_clkCount_cy [6])
  );
  XORCY   \bcd/Mcount_clkCount_xor<5>  (
    .CI(\bcd/Mcount_clkCount_cy [4]),
    .LI(\bcd/Mcount_clkCount_cy<5>_rt_681 ),
    .O(\bcd/Result [5])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<5>  (
    .CI(\bcd/Mcount_clkCount_cy [4]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<5>_rt_681 ),
    .O(\bcd/Mcount_clkCount_cy [5])
  );
  XORCY   \bcd/Mcount_clkCount_xor<4>  (
    .CI(\bcd/Mcount_clkCount_cy [3]),
    .LI(\bcd/Mcount_clkCount_cy<4>_rt_682 ),
    .O(\bcd/Result [4])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<4>  (
    .CI(\bcd/Mcount_clkCount_cy [3]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<4>_rt_682 ),
    .O(\bcd/Mcount_clkCount_cy [4])
  );
  XORCY   \bcd/Mcount_clkCount_xor<3>  (
    .CI(\bcd/Mcount_clkCount_cy [2]),
    .LI(\bcd/Mcount_clkCount_cy<3>_rt_683 ),
    .O(\bcd/Result [3])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<3>  (
    .CI(\bcd/Mcount_clkCount_cy [2]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<3>_rt_683 ),
    .O(\bcd/Mcount_clkCount_cy [3])
  );
  XORCY   \bcd/Mcount_clkCount_xor<2>  (
    .CI(\bcd/Mcount_clkCount_cy [1]),
    .LI(\bcd/Mcount_clkCount_cy<2>_rt_684 ),
    .O(\bcd/Result [2])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<2>  (
    .CI(\bcd/Mcount_clkCount_cy [1]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<2>_rt_684 ),
    .O(\bcd/Mcount_clkCount_cy [2])
  );
  XORCY   \bcd/Mcount_clkCount_xor<1>  (
    .CI(\bcd/Mcount_clkCount_cy [0]),
    .LI(\bcd/Mcount_clkCount_cy<1>_rt_685 ),
    .O(\bcd/Result [1])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<1>  (
    .CI(\bcd/Mcount_clkCount_cy [0]),
    .DI(\ALU/C<1>12 ),
    .S(\bcd/Mcount_clkCount_cy<1>_rt_685 ),
    .O(\bcd/Mcount_clkCount_cy [1])
  );
  XORCY   \bcd/Mcount_clkCount_xor<0>  (
    .CI(\ALU/C<1>12 ),
    .LI(\bcd/Mcount_clkCount_lut [0]),
    .O(\bcd/Result [0])
  );
  MUXCY   \bcd/Mcount_clkCount_cy<0>  (
    .CI(\ALU/C<1>12 ),
    .DI(\bcd/Mcompar_n0001_lut [3]),
    .S(\bcd/Mcount_clkCount_lut [0]),
    .O(\bcd/Mcount_clkCount_cy [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_15  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [15]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_14  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [14]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_13  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [13]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_12  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [12]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_11  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [11]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_10  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [10]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_9  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [9]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_8  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [8]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_7  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [7]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_6  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [6]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_5  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [5]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_4  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [4]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_3  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [3]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_2  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [2]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_1  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [1]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \bcd/clkCount_0  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Result [0]),
    .R(\bcd/Mcompar_n0001_cy [5]),
    .Q(\bcd/clkCount [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \bcd/onesOrTens_FSM_FFd2  (
    .C(Clk_BUFGP_0),
    .D(\bcd/onesOrTens[31]_GND_8_o_mux_9_OUT[0] ),
    .Q(\bcd/onesOrTens_FSM_FFd2_488 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \bcd/onesOrTens_FSM_FFd1  (
    .C(Clk_BUFGP_0),
    .D(\bcd/onesOrTens[31]_GND_8_o_mux_9_OUT[1] ),
    .Q(\bcd/onesOrTens_FSM_FFd1_487 )
  );
  FD   \bcd/Enable_3  (
    .C(Clk_BUFGP_0),
    .D(\bcd/_n0064 [1]),
    .Q(\bcd/Enable [3])
  );
  FD   \bcd/Enable_2  (
    .C(Clk_BUFGP_0),
    .D(\bcd/_n0064 [2]),
    .Q(\bcd/Enable [2])
  );
  FD   \bcd/Enable_1  (
    .C(Clk_BUFGP_0),
    .D(\bcd/_n0064 [3]),
    .Q(\bcd/Enable [1])
  );
  FD   \bcd/Enable_0  (
    .C(Clk_BUFGP_0),
    .D(\bcd/_n0064 [4]),
    .Q(\bcd/Enable [0])
  );
  FD   \bcd/SevenSegment_6  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT6 ),
    .Q(\bcd/SevenSegment [6])
  );
  FD   \bcd/SevenSegment_5  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT5 ),
    .Q(\bcd/SevenSegment [5])
  );
  FD   \bcd/SevenSegment_4  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT4 ),
    .Q(\bcd/SevenSegment [4])
  );
  FD   \bcd/SevenSegment_3  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT3 ),
    .Q(\bcd/SevenSegment [3])
  );
  FD   \bcd/SevenSegment_2  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT2 ),
    .Q(\bcd/SevenSegment [2])
  );
  FD   \bcd/SevenSegment_1  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT1 ),
    .Q(\bcd/SevenSegment [1])
  );
  FD   \bcd/SevenSegment_0  (
    .C(Clk_BUFGP_0),
    .D(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT ),
    .Q(\bcd/SevenSegment [0])
  );
  FD   \bcd/LEDs_3  (
    .C(Clk_BUFGP_0),
    .D(C[3]),
    .Q(\bcd/LEDs [3])
  );
  FD   \bcd/LEDs_2  (
    .C(Clk_BUFGP_0),
    .D(C[2]),
    .Q(\bcd/LEDs [2])
  );
  FD   \bcd/LEDs_1  (
    .C(Clk_BUFGP_0),
    .D(C[1]),
    .Q(\bcd/LEDs [1])
  );
  FD   \bcd/LEDs_0  (
    .C(Clk_BUFGP_0),
    .D(C[0]),
    .Q(\bcd/LEDs [0])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<15>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [14]),
    .LI(\ALU/C<1>12 ),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [15])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<14>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [13]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [14]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [14])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<14>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [13]),
    .DI(\ALU/Sh461 ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [14]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<14>  (
    .I0(\ALU/Sh461 ),
    .I1(Reg_B[14]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [14])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<13>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [12]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [13]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [13])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<13>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [12]),
    .DI(\ALU/Sh451 ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [13]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<13>  (
    .I0(\ALU/Sh451 ),
    .I1(Reg_B[13]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [13])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<12>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [11]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [12]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [12])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<12>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [11]),
    .DI(\ALU/Sh441 ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [12]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<12>  (
    .I0(\ALU/Sh441 ),
    .I1(Reg_B[12]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [12])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<11>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [10]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [11]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [11])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<11>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [10]),
    .DI(\ALU/Sh431 ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [11]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<11>  (
    .I0(\ALU/Sh431 ),
    .I1(Reg_B[11]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [11])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<10>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [9]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [10]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [10])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<10>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [9]),
    .DI(\Reg_A[10] ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [10]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<10>  (
    .I0(\Reg_A[10] ),
    .I1(Reg_B[10]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [10])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<9>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [8]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [9]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [9])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<9>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [8]),
    .DI(\Reg_A[9] ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [9]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<9>  (
    .I0(\Reg_A[9] ),
    .I1(Reg_B[9]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [9])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<8>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [7]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [8]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [8])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<8>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [7]),
    .DI(\Reg_A[8] ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [8]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<8>  (
    .I0(\Reg_A[8] ),
    .I1(Reg_B[8]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [8])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<7>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [6]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [7]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [7])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<7>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [6]),
    .DI(\Reg_A[7] ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [7]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<7>  (
    .I0(\Reg_A[7] ),
    .I1(Reg_B[7]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [7])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<6>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [5]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [6]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [6])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<6>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [5]),
    .DI(\Reg_A[6] ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [6]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<6>  (
    .I0(\Reg_A[6] ),
    .I1(Reg_B[6]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [6])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<5>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [4]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [5]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [5])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<5>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [4]),
    .DI(\Reg_A[5] ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [5]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<5>  (
    .I0(\Reg_A[5] ),
    .I1(Reg_B[5]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [5])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<4>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [3]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [4]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [4])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<4>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [3]),
    .DI(\ALU/Sh310 ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [4]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<4>  (
    .I0(\ALU/Sh310 ),
    .I1(Reg_B[4]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [4])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<3>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [2]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [3]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [3])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<3>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [2]),
    .DI(\ALU/Sh24 ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [3]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<3>  (
    .I0(\ALU/Sh24 ),
    .I1(Reg_B[3]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [3])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<2>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [1]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [2]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [2])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<2>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [1]),
    .DI(\ALU/Sh159 ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [2]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<2>  (
    .I0(\ALU/Sh159 ),
    .I1(Reg_B[2]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [2])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<1>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [0]),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [1]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [1])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<1>  (
    .CI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [0]),
    .DI(\ALU/Sh143 ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [1]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<1>  (
    .I0(\ALU/Sh143 ),
    .I1(Reg_B[1]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [1])
  );
  XORCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_xor<0>  (
    .CI(\ALU/C<1>12 ),
    .LI(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [0]),
    .O(\ALU/BUS_0001_GND_4_o_add_1_OUT [0])
  );
  MUXCY   \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy<0>  (
    .CI(\ALU/C<1>12 ),
    .DI(\Reg_A[0] ),
    .S(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [0]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_cy [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut<0>  (
    .I0(\Reg_A[0] ),
    .I1(Reg_B[0]),
    .O(\ALU/Madd_BUS_0001_GND_4_o_add_1_OUT_lut [0])
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  Mcount_operation_val321 (
    .I0(\counter[31]_GND_1_o_equal_3_o ),
    .I1(operation[4]),
    .I2(\operation[31]_GND_1_o_equal_12_o<31>1_187 ),
    .I3(RESET_IBUF_1),
    .O(Mcount_operation_val)
  );
  LUT5 #(
    .INIT ( 32'h00870180 ))
  Mram__n0257261 (
    .I0(operation[0]),
    .I1(operation[1]),
    .I2(operation[2]),
    .I3(operation[4]),
    .I4(operation[3]),
    .O(Mram__n025726)
  );
  LUT5 #(
    .INIT ( 32'h0001E1E0 ))
  Mram__n0257181 (
    .I0(operation[0]),
    .I1(operation[1]),
    .I2(operation[2]),
    .I3(operation[3]),
    .I4(operation[4]),
    .O(Mram__n025718)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \operation[31]_operation[31]_OR_151_o21  (
    .I0(operation[3]),
    .I1(operation[2]),
    .I2(operation[0]),
    .I3(operation[1]),
    .O(\operation[31]_GND_1_o_equal_12_o<31>1_187 )
  );
  LUT5 #(
    .INIT ( 32'h09080918 ))
  Mram__n0257221 (
    .I0(operation[1]),
    .I1(operation[2]),
    .I2(operation[4]),
    .I3(operation[3]),
    .I4(operation[0]),
    .O(Mram__n025722)
  );
  LUT5 #(
    .INIT ( 32'h00010100 ))
  Mram__n02571 (
    .I0(operation[2]),
    .I1(operation[3]),
    .I2(operation[4]),
    .I3(operation[0]),
    .I4(operation[1]),
    .O(Mram__n0257)
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFEA ))
  Mram__n025741 (
    .I0(operation[4]),
    .I1(operation[0]),
    .I2(operation[1]),
    .I3(operation[2]),
    .I4(operation[3]),
    .O(Mram__n02574)
  );
  LUT5 #(
    .INIT ( 32'h14141400 ))
  Mram__n0257251 (
    .I0(operation[4]),
    .I1(operation[0]),
    .I2(operation[1]),
    .I3(operation[2]),
    .I4(operation[3]),
    .O(Mram__n025725)
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_8_o1  (
    .I0(Reg_Write[0]),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[2]),
    .I3(Reg_Write[3]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_8_o )
  );
  LUT5 #(
    .INIT ( 32'h00002000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_7_o1  (
    .I0(Write_Enable_40),
    .I1(Reg_Write[0]),
    .I2(Reg_Write[2]),
    .I3(Reg_Write[1]),
    .I4(Reg_Write[3]),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_7_o )
  );
  LUT5 #(
    .INIT ( 32'h00002000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_6_o1  (
    .I0(Write_Enable_40),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[2]),
    .I3(Reg_Write[0]),
    .I4(Reg_Write[3]),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_6_o )
  );
  LUT5 #(
    .INIT ( 32'h01000000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_5_o1  (
    .I0(Reg_Write[0]),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[3]),
    .I3(Reg_Write[2]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_5_o )
  );
  LUT5 #(
    .INIT ( 32'h00002000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_4_o1  (
    .I0(Write_Enable_40),
    .I1(Reg_Write[2]),
    .I2(Reg_Write[0]),
    .I3(Reg_Write[1]),
    .I4(Reg_Write[3]),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_4_o )
  );
  LUT5 #(
    .INIT ( 32'h01000000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_3_o1  (
    .I0(Reg_Write[0]),
    .I1(Reg_Write[2]),
    .I2(Reg_Write[3]),
    .I3(Reg_Write[1]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_3_o )
  );
  LUT5 #(
    .INIT ( 32'h01000000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_2_o1  (
    .I0(Reg_Write[1]),
    .I1(Reg_Write[2]),
    .I2(Reg_Write[3]),
    .I3(Reg_Write[0]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_2_o )
  );
  LUT5 #(
    .INIT ( 32'h00000100 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_1_o1  (
    .I0(Reg_Write[0]),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[2]),
    .I3(Write_Enable_40),
    .I4(Reg_Write[3]),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_1_o )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_16_o1  (
    .I0(Reg_Write[0]),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[2]),
    .I3(Reg_Write[3]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_16_o )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_15_o1  (
    .I0(Reg_Write[3]),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[2]),
    .I3(Reg_Write[0]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_15_o )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_14_o1  (
    .I0(Reg_Write[3]),
    .I1(Reg_Write[0]),
    .I2(Reg_Write[2]),
    .I3(Reg_Write[1]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_14_o )
  );
  LUT5 #(
    .INIT ( 32'h00002000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_13_o1  (
    .I0(Write_Enable_40),
    .I1(Reg_Write[0]),
    .I2(Reg_Write[2]),
    .I3(Reg_Write[3]),
    .I4(Reg_Write[1]),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_13_o )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_12_o1  (
    .I0(Reg_Write[3]),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[0]),
    .I3(Reg_Write[2]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_12_o )
  );
  LUT5 #(
    .INIT ( 32'h00002000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_11_o1  (
    .I0(Write_Enable_40),
    .I1(Reg_Write[0]),
    .I2(Reg_Write[1]),
    .I3(Reg_Write[3]),
    .I4(Reg_Write[2]),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_11_o )
  );
  LUT5 #(
    .INIT ( 32'h00002000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_10_o1  (
    .I0(Write_Enable_40),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[0]),
    .I3(Reg_Write[3]),
    .I4(Reg_Write[2]),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_10_o )
  );
  LUT5 #(
    .INIT ( 32'h01000000 ))
  \regFile/Write_Enable_Reg_Write[3]_AND_9_o1  (
    .I0(Reg_Write[0]),
    .I1(Reg_Write[1]),
    .I2(Reg_Write[2]),
    .I3(Reg_Write[3]),
    .I4(Write_Enable_40),
    .O(\regFile/Write_Enable_Reg_Write[3]_AND_9_o )
  );
  LUT4 #(
    .INIT ( 16'h9E00 ))
  \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT51  (
    .I0(\bcd/Binary[15]_Binary[3]_mux_18_OUT<3> ),
    .I1(\bcd/Binary[15]_Binary[3]_mux_18_OUT<1> ),
    .I2(\bcd/Binary[15]_Binary[3]_mux_18_OUT<0> ),
    .I3(\bcd/Binary[15]_Binary[3]_mux_18_OUT<2> ),
    .O(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT5 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \bcd/onesOrTens_FSM_FFd1-In1  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/Mcompar_n0001_cy [5]),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .O(\bcd/onesOrTens[31]_GND_8_o_mux_9_OUT[1] )
  );
  LUT4 #(
    .INIT ( 16'h5170 ))
  \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT21  (
    .I0(\bcd/Binary[15]_Binary[3]_mux_18_OUT<3> ),
    .I1(\bcd/Binary[15]_Binary[3]_mux_18_OUT<1> ),
    .I2(\bcd/Binary[15]_Binary[3]_mux_18_OUT<0> ),
    .I3(\bcd/Binary[15]_Binary[3]_mux_18_OUT<2> ),
    .O(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT2 )
  );
  LUT4 #(
    .INIT ( 16'h6211 ))
  \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT12  (
    .I0(\bcd/Binary[15]_Binary[3]_mux_18_OUT<3> ),
    .I1(\bcd/Binary[15]_Binary[3]_mux_18_OUT<1> ),
    .I2(\bcd/Binary[15]_Binary[3]_mux_18_OUT<0> ),
    .I3(\bcd/Binary[15]_Binary[3]_mux_18_OUT<2> ),
    .O(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT )
  );
  LUT4 #(
    .INIT ( 16'h0110 ))
  \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT61  (
    .I0(\bcd/Binary[15]_Binary[3]_mux_18_OUT<3> ),
    .I1(\bcd/Binary[15]_Binary[3]_mux_18_OUT<1> ),
    .I2(\bcd/Binary[15]_Binary[3]_mux_18_OUT<0> ),
    .I3(\bcd/Binary[15]_Binary[3]_mux_18_OUT<2> ),
    .O(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT6 )
  );
  LUT4 #(
    .INIT ( 16'h4054 ))
  \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT111  (
    .I0(\bcd/Binary[15]_Binary[3]_mux_18_OUT<3> ),
    .I1(\bcd/Binary[15]_Binary[3]_mux_18_OUT<1> ),
    .I2(\bcd/Binary[15]_Binary[3]_mux_18_OUT<0> ),
    .I3(\bcd/Binary[15]_Binary[3]_mux_18_OUT<2> ),
    .O(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT1 )
  );
  LUT4 #(
    .INIT ( 16'h8A04 ))
  \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT41  (
    .I0(\bcd/Binary[15]_Binary[3]_mux_18_OUT<3> ),
    .I1(\bcd/Binary[15]_Binary[3]_mux_18_OUT<1> ),
    .I2(\bcd/Binary[15]_Binary[3]_mux_18_OUT<0> ),
    .I3(\bcd/Binary[15]_Binary[3]_mux_18_OUT<2> ),
    .O(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \bcd/onesOrTens_FSM_FFd2-In1  (
    .I0(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I1(\bcd/Mcompar_n0001_cy [5]),
    .O(\bcd/onesOrTens[31]_GND_8_o_mux_9_OUT[0] )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \counter[31]_GND_1_o_equal_3_o<31>1  (
    .I0(counter[20]),
    .I1(counter[15]),
    .I2(counter[22]),
    .I3(counter[21]),
    .I4(counter[27]),
    .I5(counter[23]),
    .O(\counter[31]_GND_1_o_equal_3_o<31> )
  );
  LUT6 #(
    .INIT ( 64'h1000000000000000 ))
  \counter[31]_GND_1_o_equal_3_o<31>2  (
    .I0(counter[0]),
    .I1(counter[1]),
    .I2(counter[14]),
    .I3(counter[12]),
    .I4(counter[8]),
    .I5(counter[7]),
    .O(\counter[31]_GND_1_o_equal_3_o<31>1_606 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \counter[31]_GND_1_o_equal_3_o<31>3  (
    .I0(counter[3]),
    .I1(counter[2]),
    .I2(counter[4]),
    .I3(counter[5]),
    .I4(counter[6]),
    .I5(counter[9]),
    .O(\counter[31]_GND_1_o_equal_3_o<31>2_607 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \counter[31]_GND_1_o_equal_3_o<31>4  (
    .I0(counter[11]),
    .I1(counter[10]),
    .I2(counter[13]),
    .I3(counter[16]),
    .I4(counter[17]),
    .I5(counter[18]),
    .O(\counter[31]_GND_1_o_equal_3_o<31>3_608 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \counter[31]_GND_1_o_equal_3_o<31>5  (
    .I0(counter[24]),
    .I1(counter[19]),
    .I2(counter[25]),
    .I3(counter[26]),
    .O(\counter[31]_GND_1_o_equal_3_o<31>4_609 )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \counter[31]_GND_1_o_equal_3_o<31>6  (
    .I0(\counter[31]_GND_1_o_equal_3_o<31> ),
    .I1(\counter[31]_GND_1_o_equal_3_o<31>1_606 ),
    .I2(\counter[31]_GND_1_o_equal_3_o<31>2_607 ),
    .I3(\counter[31]_GND_1_o_equal_3_o<31>3_608 ),
    .I4(\counter[31]_GND_1_o_equal_3_o<31>4_609 ),
    .O(\counter[31]_GND_1_o_equal_3_o )
  );
  IBUF   RESET_IBUF (
    .I(RESET),
    .O(RESET_IBUF_1)
  );
  OBUF   SevenSegment_6_OBUF (
    .I(\bcd/SevenSegment [6]),
    .O(SevenSegment[6])
  );
  OBUF   SevenSegment_5_OBUF (
    .I(\bcd/SevenSegment [5]),
    .O(SevenSegment[5])
  );
  OBUF   SevenSegment_4_OBUF (
    .I(\bcd/SevenSegment [4]),
    .O(SevenSegment[4])
  );
  OBUF   SevenSegment_3_OBUF (
    .I(\bcd/SevenSegment [3]),
    .O(SevenSegment[3])
  );
  OBUF   SevenSegment_2_OBUF (
    .I(\bcd/SevenSegment [2]),
    .O(SevenSegment[2])
  );
  OBUF   SevenSegment_1_OBUF (
    .I(\bcd/SevenSegment [1]),
    .O(SevenSegment[1])
  );
  OBUF   SevenSegment_0_OBUF (
    .I(\bcd/SevenSegment [0]),
    .O(SevenSegment[0])
  );
  OBUF   Enable_3_OBUF (
    .I(\bcd/Enable [3]),
    .O(Enable[3])
  );
  OBUF   Enable_2_OBUF (
    .I(\bcd/Enable [2]),
    .O(Enable[2])
  );
  OBUF   Enable_1_OBUF (
    .I(\bcd/Enable [1]),
    .O(Enable[1])
  );
  OBUF   Enable_0_OBUF (
    .I(\bcd/Enable [0]),
    .O(Enable[0])
  );
  OBUF   LED_3_OBUF (
    .I(\bcd/LEDs [3]),
    .O(LED[3])
  );
  OBUF   LED_2_OBUF (
    .I(\bcd/LEDs [2]),
    .O(LED[2])
  );
  OBUF   LED_1_OBUF (
    .I(\bcd/LEDs [1]),
    .O(LED[1])
  );
  OBUF   LED_0_OBUF (
    .I(\bcd/LEDs [0]),
    .O(LED[0])
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \regFile/Mmux_Reg_B_527  (
    .I0(\regFile/reg11/Reg_Out [10]),
    .I1(Reg_Read_B[0]),
    .I2(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_52 )
  );
  LUT4 #(
    .INIT ( 16'hCA00 ))
  \regFile/Mmux_Reg_B_441  (
    .I0(\regFile/reg14/Reg_Out [13]),
    .I1(\regFile/reg15/Reg_Out [13]),
    .I2(Reg_Read_B[0]),
    .I3(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_44 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \regFile/Mmux_Reg_B_451  (
    .I0(\regFile/reg15/Reg_Out [14]),
    .I1(Reg_Read_B[0]),
    .I2(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_45 )
  );
  LUT4 #(
    .INIT ( 16'hCA00 ))
  \regFile/Mmux_Reg_B_671  (
    .I0(\regFile/reg2/Reg_Out [1]),
    .I1(\regFile/reg3/Reg_Out [1]),
    .I2(Reg_Read_B_0_1_712),
    .I3(Reg_Read_B_1_1_714),
    .O(\regFile/Mmux_Reg_B_67 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \regFile/Mmux_Reg_B_681  (
    .I0(\regFile/reg3/Reg_Out [2]),
    .I1(Reg_Read_B_1_1_714),
    .I2(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_68 )
  );
  LUT4 #(
    .INIT ( 16'hC0A0 ))
  \regFile/Mmux_Reg_B_5231  (
    .I0(\regFile/reg6/Reg_Out [5]),
    .I1(\regFile/reg7/Reg_Out [5]),
    .I2(Reg_Read_B_1_2_718),
    .I3(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_523 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \regFile/Mmux_Reg_B_5251  (
    .I0(\regFile/reg7/Reg_Out [6]),
    .I1(Reg_Read_B_1_2_718),
    .I2(Reg_Read_B_0_2_716),
    .O(\regFile/Mmux_Reg_B_525 )
  );
  LUT4 #(
    .INIT ( 16'hCA00 ))
  \regFile/Mmux_Reg_B_5301  (
    .I0(\regFile/reg10/Reg_Out [9]),
    .I1(\regFile/reg11/Reg_Out [9]),
    .I2(Reg_Read_B[0]),
    .I3(Reg_Read_B[1]),
    .O(\regFile/Mmux_Reg_B_530 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \regFile/Mmux_Reg_A_527  (
    .I0(\regFile/reg11/Reg_Out [10]),
    .I1(Reg_Read_A[0]),
    .I2(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_52 )
  );
  LUT4 #(
    .INIT ( 16'hCA00 ))
  \regFile/Mmux_Reg_A_441  (
    .I0(\regFile/reg14/Reg_Out [13]),
    .I1(\regFile/reg15/Reg_Out [13]),
    .I2(Reg_Read_A[0]),
    .I3(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_44 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \regFile/Mmux_Reg_A_451  (
    .I0(\regFile/reg15/Reg_Out [14]),
    .I1(Reg_Read_A[0]),
    .I2(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_45 )
  );
  LUT4 #(
    .INIT ( 16'hCA00 ))
  \regFile/Mmux_Reg_A_671  (
    .I0(\regFile/reg2/Reg_Out [1]),
    .I1(\regFile/reg3/Reg_Out [1]),
    .I2(Reg_Read_A_0_1_711),
    .I3(Reg_Read_A_1_1_713),
    .O(\regFile/Mmux_Reg_A_67 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \regFile/Mmux_Reg_A_681  (
    .I0(\regFile/reg3/Reg_Out [2]),
    .I1(Reg_Read_A_1_1_713),
    .I2(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_68 )
  );
  LUT4 #(
    .INIT ( 16'hC0A0 ))
  \regFile/Mmux_Reg_A_5231  (
    .I0(\regFile/reg6/Reg_Out [5]),
    .I1(\regFile/reg7/Reg_Out [5]),
    .I2(Reg_Read_A_1_2_717),
    .I3(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_523 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \regFile/Mmux_Reg_A_5251  (
    .I0(\regFile/reg7/Reg_Out [6]),
    .I1(Reg_Read_A_1_2_717),
    .I2(Reg_Read_A_0_2_715),
    .O(\regFile/Mmux_Reg_A_525 )
  );
  LUT4 #(
    .INIT ( 16'hCA00 ))
  \regFile/Mmux_Reg_A_5301  (
    .I0(\regFile/reg10/Reg_Out [9]),
    .I1(\regFile/reg11/Reg_Out [9]),
    .I2(Reg_Read_A[0]),
    .I3(Reg_Read_A[1]),
    .O(\regFile/Mmux_Reg_A_530 )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \bcd/Mcompar_n0001_lut<2>1  (
    .I0(\bcd/clkCount[31]_GND_8_o_add_1_OUT<15> ),
    .I1(\bcd/Mcompar_n0001_lutdi2 ),
    .I2(\bcd/clkCount[31]_GND_8_o_add_1_OUT<14> ),
    .O(\bcd/Mcompar_n0001_lut [2])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_operation_cy<1>_rt  (
    .I0(operation[1]),
    .O(\Mcount_operation_cy<1>_rt_628 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_operation_cy<2>_rt  (
    .I0(operation[2]),
    .O(\Mcount_operation_cy<2>_rt_629 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_operation_cy<3>_rt  (
    .I0(operation[3]),
    .O(\Mcount_operation_cy<3>_rt_630 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<1>_rt  (
    .I0(counter[1]),
    .O(\Mcount_counter_cy<1>_rt_631 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<2>_rt  (
    .I0(counter[2]),
    .O(\Mcount_counter_cy<2>_rt_632 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<3>_rt  (
    .I0(counter[3]),
    .O(\Mcount_counter_cy<3>_rt_633 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<4>_rt  (
    .I0(counter[4]),
    .O(\Mcount_counter_cy<4>_rt_634 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<5>_rt  (
    .I0(counter[5]),
    .O(\Mcount_counter_cy<5>_rt_635 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<6>_rt  (
    .I0(counter[6]),
    .O(\Mcount_counter_cy<6>_rt_636 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<7>_rt  (
    .I0(counter[7]),
    .O(\Mcount_counter_cy<7>_rt_637 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<8>_rt  (
    .I0(counter[8]),
    .O(\Mcount_counter_cy<8>_rt_638 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<9>_rt  (
    .I0(counter[9]),
    .O(\Mcount_counter_cy<9>_rt_639 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<10>_rt  (
    .I0(counter[10]),
    .O(\Mcount_counter_cy<10>_rt_640 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<11>_rt  (
    .I0(counter[11]),
    .O(\Mcount_counter_cy<11>_rt_641 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<12>_rt  (
    .I0(counter[12]),
    .O(\Mcount_counter_cy<12>_rt_642 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<13>_rt  (
    .I0(counter[13]),
    .O(\Mcount_counter_cy<13>_rt_643 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<14>_rt  (
    .I0(counter[14]),
    .O(\Mcount_counter_cy<14>_rt_644 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<15>_rt  (
    .I0(counter[15]),
    .O(\Mcount_counter_cy<15>_rt_645 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<16>_rt  (
    .I0(counter[16]),
    .O(\Mcount_counter_cy<16>_rt_646 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<17>_rt  (
    .I0(counter[17]),
    .O(\Mcount_counter_cy<17>_rt_647 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<18>_rt  (
    .I0(counter[18]),
    .O(\Mcount_counter_cy<18>_rt_648 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<19>_rt  (
    .I0(counter[19]),
    .O(\Mcount_counter_cy<19>_rt_649 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<20>_rt  (
    .I0(counter[20]),
    .O(\Mcount_counter_cy<20>_rt_650 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<21>_rt  (
    .I0(counter[21]),
    .O(\Mcount_counter_cy<21>_rt_651 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<22>_rt  (
    .I0(counter[22]),
    .O(\Mcount_counter_cy<22>_rt_652 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<23>_rt  (
    .I0(counter[23]),
    .O(\Mcount_counter_cy<23>_rt_653 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<24>_rt  (
    .I0(counter[24]),
    .O(\Mcount_counter_cy<24>_rt_654 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<25>_rt  (
    .I0(counter[25]),
    .O(\Mcount_counter_cy<25>_rt_655 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<26>_rt  (
    .I0(counter[26]),
    .O(\Mcount_counter_cy<26>_rt_656 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>_rt  (
    .I0(\bcd/clkCount [15]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<15>_rt_657 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_rt  (
    .I0(\bcd/clkCount [14]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<14>_rt_658 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_rt  (
    .I0(\bcd/clkCount [13]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<13>_rt_659 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_rt  (
    .I0(\bcd/clkCount [12]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<12>_rt_660 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_rt  (
    .I0(\bcd/clkCount [11]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<11>_rt_661 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_rt  (
    .I0(\bcd/clkCount [10]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<10>_rt_662 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_rt  (
    .I0(\bcd/clkCount [9]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<9>_rt_663 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_rt  (
    .I0(\bcd/clkCount [8]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<8>_rt_664 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_rt  (
    .I0(\bcd/clkCount [7]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<7>_rt_665 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_rt  (
    .I0(\bcd/clkCount [6]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<6>_rt_666 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_rt  (
    .I0(\bcd/clkCount [5]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<5>_rt_667 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_rt  (
    .I0(\bcd/clkCount [4]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<4>_rt_668 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>_rt  (
    .I0(\bcd/clkCount [3]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<3>_rt_669 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<2>_rt  (
    .I0(\bcd/clkCount [2]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<2>_rt_670 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<1>_rt  (
    .I0(\bcd/clkCount [1]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_cy<1>_rt_671 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<14>_rt  (
    .I0(\bcd/clkCount [14]),
    .O(\bcd/Mcount_clkCount_cy<14>_rt_672 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<13>_rt  (
    .I0(\bcd/clkCount [13]),
    .O(\bcd/Mcount_clkCount_cy<13>_rt_673 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<12>_rt  (
    .I0(\bcd/clkCount [12]),
    .O(\bcd/Mcount_clkCount_cy<12>_rt_674 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<11>_rt  (
    .I0(\bcd/clkCount [11]),
    .O(\bcd/Mcount_clkCount_cy<11>_rt_675 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<10>_rt  (
    .I0(\bcd/clkCount [10]),
    .O(\bcd/Mcount_clkCount_cy<10>_rt_676 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<9>_rt  (
    .I0(\bcd/clkCount [9]),
    .O(\bcd/Mcount_clkCount_cy<9>_rt_677 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<8>_rt  (
    .I0(\bcd/clkCount [8]),
    .O(\bcd/Mcount_clkCount_cy<8>_rt_678 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<7>_rt  (
    .I0(\bcd/clkCount [7]),
    .O(\bcd/Mcount_clkCount_cy<7>_rt_679 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<6>_rt  (
    .I0(\bcd/clkCount [6]),
    .O(\bcd/Mcount_clkCount_cy<6>_rt_680 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<5>_rt  (
    .I0(\bcd/clkCount [5]),
    .O(\bcd/Mcount_clkCount_cy<5>_rt_681 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<4>_rt  (
    .I0(\bcd/clkCount [4]),
    .O(\bcd/Mcount_clkCount_cy<4>_rt_682 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<3>_rt  (
    .I0(\bcd/clkCount [3]),
    .O(\bcd/Mcount_clkCount_cy<3>_rt_683 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<2>_rt  (
    .I0(\bcd/clkCount [2]),
    .O(\bcd/Mcount_clkCount_cy<2>_rt_684 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_cy<1>_rt  (
    .I0(\bcd/clkCount [1]),
    .O(\bcd/Mcount_clkCount_cy<1>_rt_685 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_operation_xor<4>_rt  (
    .I0(operation[4]),
    .O(\Mcount_operation_xor<4>_rt_686 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_xor<27>_rt  (
    .I0(counter[27]),
    .O(\Mcount_counter_xor<27>_rt_687 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \bcd/Mcount_clkCount_xor<15>_rt  (
    .I0(\bcd/clkCount [15]),
    .O(\bcd/Mcount_clkCount_xor<15>_rt_688 )
  );
  FDR   \regFile/reg0/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .D(\regFile/reg0/Reg_Out_0_rstpot_689 ),
    .R(Reset_39),
    .Q(\regFile/reg0/Reg_Out [0])
  );
  FDR   \regFile/reg1/Reg_Out_0  (
    .C(Clk_BUFGP_0),
    .D(\regFile/reg1/Reg_Out_0_rstpot_690 ),
    .R(Reset_39),
    .Q(\regFile/reg1/Reg_Out [0])
  );
  FD   Write_Enable (
    .C(Clk_BUFGP_0),
    .D(Write_Enable_rstpot),
    .Q(Write_Enable_40)
  );
  LUT4 #(
    .INIT ( 16'hC118 ))
  \bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT31  (
    .I0(\bcd/Binary[15]_Binary[3]_mux_18_OUT<3> ),
    .I1(\bcd/Binary[15]_Binary[3]_mux_18_OUT<1> ),
    .I2(\bcd/Binary[15]_Binary[3]_mux_18_OUT<0> ),
    .I3(\bcd/Binary[15]_Binary[3]_mux_18_OUT<2> ),
    .O(\bcd/Mram_Binary[15]_GND_8_o_wide_mux_20_OUT3 )
  );
  LUT6 #(
    .INIT ( 64'hFB73D951EA62C840 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1  (
    .I0(\bcd/Mcompar_n0001_cy [5]),
    .I1(C[12]),
    .I2(N7),
    .I3(N9),
    .I4(N8),
    .I5(N6),
    .O(\bcd/Binary[15]_Binary[3]_mux_18_OUT<0> )
  );
  LUT6 #(
    .INIT ( 64'hFEBA7632DC985410 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<1><1>1  (
    .I0(\bcd/Mcompar_n0001_cy [5]),
    .I1(C[13]),
    .I2(N11),
    .I3(N12),
    .I4(N14),
    .I5(N13),
    .O(\bcd/Binary[15]_Binary[3]_mux_18_OUT<1> )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1  (
    .I0(\bcd/Mcompar_n0001_cy [5]),
    .I1(C[14]),
    .I2(N18),
    .I3(N19),
    .I4(N17),
    .I5(N16),
    .O(\bcd/Binary[15]_Binary[3]_mux_18_OUT<2> )
  );
  LUT6 #(
    .INIT ( 64'hFEBA7632DC985410 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<3><3>  (
    .I0(\bcd/Mcompar_n0001_cy [5]),
    .I1(N4),
    .I2(N21),
    .I3(N22),
    .I4(N24),
    .I5(N23),
    .O(\bcd/Binary[15]_Binary[3]_mux_18_OUT<3> )
  );
  LUT3 #(
    .INIT ( 8'hD7 ))
  \bcd/onesOrTens__n0064<1>1  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/Mcompar_n0001_cy [5]),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .O(\bcd/_n0064 [1])
  );
  LUT3 #(
    .INIT ( 8'hDB ))
  \bcd/onesOrTens__n0064<2>1  (
    .I0(\bcd/Mcompar_n0001_cy [5]),
    .I1(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .O(\bcd/_n0064 [2])
  );
  LUT3 #(
    .INIT ( 8'hF9 ))
  \bcd/onesOrTens__n0064<3>1  (
    .I0(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I1(\bcd/Mcompar_n0001_cy [5]),
    .I2(\bcd/onesOrTens_FSM_FFd1_487 ),
    .O(\bcd/_n0064 [3])
  );
  LUT3 #(
    .INIT ( 8'h7E ))
  \bcd/onesOrTens__n0064<4>1  (
    .I0(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I1(\bcd/Mcompar_n0001_cy [5]),
    .I2(\bcd/onesOrTens_FSM_FFd1_487 ),
    .O(\bcd/_n0064 [4])
  );
  LUT6 #(
    .INIT ( 64'h0706030205040100 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<3><3>_SW1  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(N26),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [3]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [7]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [11]),
    .O(N21)
  );
  LUT6 #(
    .INIT ( 64'h8F8E8B8A8D8C8988 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<3><3>_SW2  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(N26),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [3]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [7]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [11]),
    .O(N22)
  );
  LUT6 #(
    .INIT ( 64'hD050C04090108000 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<3><3>_SW3  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(N30),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [3]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [7]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [11]),
    .O(N23)
  );
  LUT6 #(
    .INIT ( 64'hF272E262B232A222 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<3><3>_SW4  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(N30),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [3]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [7]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [11]),
    .O(N24)
  );
  LUT6 #(
    .INIT ( 64'h0706030205040100 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<1><1>1_SW0  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(N26),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [1]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [5]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [9]),
    .O(N11)
  );
  LUT6 #(
    .INIT ( 64'h8F8E8B8A8D8C8988 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<1><1>1_SW1  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(N26),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [1]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [5]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [9]),
    .O(N12)
  );
  LUT6 #(
    .INIT ( 64'hD050C04090108000 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<1><1>1_SW2  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(N30),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [1]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [5]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [9]),
    .O(N13)
  );
  LUT6 #(
    .INIT ( 64'hF272E262B232A222 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<1><1>1_SW3  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(N30),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [1]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [5]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [9]),
    .O(N14)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<3><3>_SW0  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [15]),
    .O(N4)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<14>1  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [14]),
    .O(C[14])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<13>1  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [13]),
    .O(C[13])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<12>1  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [12]),
    .O(C[12])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<3><3>_SW1_SW0  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .O(N26)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<3><3>_SW3_SW0  (
    .I0(\OpCode[0] ),
    .I1(\OpCode[4] ),
    .O(N30)
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW0_SW2  (
    .I0(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I1(\OpCode[4] ),
    .I2(\OpCode[0] ),
    .O(N44)
  );
  LUT6 #(
    .INIT ( 64'hEAAAAAAAAAAAAAAA ))
  \counter[31]_GND_1_o_equal_3_o_01  (
    .I0(RESET_IBUF_1),
    .I1(\counter[31]_GND_1_o_equal_3_o<31> ),
    .I2(\counter[31]_GND_1_o_equal_3_o<31>1_606 ),
    .I3(\counter[31]_GND_1_o_equal_3_o<31>2_607 ),
    .I4(\counter[31]_GND_1_o_equal_3_o<31>3_608 ),
    .I5(\counter[31]_GND_1_o_equal_3_o<31>4_609 ),
    .O(\counter[31]_GND_1_o_equal_3_o_0 )
  );
  LUT5 #(
    .INIT ( 32'h44404442 ))
  Mram__n0257231 (
    .I0(operation[4]),
    .I1(operation[3]),
    .I2(operation[1]),
    .I3(operation[2]),
    .I4(operation[0]),
    .O(Mram__n025723)
  );
  LUT5 #(
    .INIT ( 32'h44444002 ))
  Mram__n0257271 (
    .I0(operation[4]),
    .I1(operation[3]),
    .I2(operation[0]),
    .I3(operation[1]),
    .I4(operation[2]),
    .O(Mram__n025727)
  );
  LUT5 #(
    .INIT ( 32'h41414142 ))
  Mram__n0257171 (
    .I0(operation[4]),
    .I1(operation[0]),
    .I2(operation[1]),
    .I3(operation[2]),
    .I4(operation[3]),
    .O(Mram__n025717)
  );
  LUT5 #(
    .INIT ( 32'h11101114 ))
  Mram__n0257211 (
    .I0(operation[1]),
    .I1(operation[4]),
    .I2(operation[2]),
    .I3(operation[3]),
    .I4(operation[0]),
    .O(Mram__n025721)
  );
  LUT5 #(
    .INIT ( 32'h11101114 ))
  Mram__n0257241 (
    .I0(operation[0]),
    .I1(operation[4]),
    .I2(operation[2]),
    .I3(operation[3]),
    .I4(operation[1]),
    .O(Mram__n025724)
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \operation[31]_GND_1_o_equal_12_o<31>1  (
    .I0(operation[4]),
    .I1(operation[3]),
    .I2(operation[2]),
    .I3(operation[0]),
    .I4(operation[1]),
    .O(\operation[31]_GND_1_o_equal_12_o )
  );
  LUT5 #(
    .INIT ( 32'h22222220 ))
  Mram__n0257201 (
    .I0(operation[0]),
    .I1(operation[4]),
    .I2(operation[1]),
    .I3(operation[2]),
    .I4(operation[3]),
    .O(Mram__n025720)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<11>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [11]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[11])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<10>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [10]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[10])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<9>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [9]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[9])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<8>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [8]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[8])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<7>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [7]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[7])
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \ALU/C<6>1  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [6]),
    .O(C[6])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<5>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [5]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[5])
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \ALU/C<4>1  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [4]),
    .O(C[4])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<3>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [3]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[3])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<2>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [2]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[2])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \ALU/C<1>1  (
    .I0(\ALU/BUS_0001_GND_4_o_add_1_OUT [1]),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .O(C[1])
  );
  LUT5 #(
    .INIT ( 32'h22222224 ))
  Mram__n0257191 (
    .I0(operation[3]),
    .I1(operation[4]),
    .I2(operation[0]),
    .I3(operation[1]),
    .I4(operation[2]),
    .O(Mram__n025719)
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \ALU/C<0>1  (
    .I0(\OpCode[0] ),
    .I1(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I2(\OpCode[4] ),
    .O(C[0])
  );
  LUT5 #(
    .INIT ( 32'h11111114 ))
  Mram__n0257161 (
    .I0(operation[0]),
    .I1(operation[4]),
    .I2(operation[1]),
    .I3(operation[2]),
    .I4(operation[3]),
    .O(Mram__n025716)
  );
  LUT5 #(
    .INIT ( 32'hFDDDA888 ))
  \regFile/reg0/Reg_Out_0_rstpot  (
    .I0(\regFile/Write_Enable_Reg_Write[3]_AND_1_o ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I3(\OpCode[4] ),
    .I4(\regFile/reg0/Reg_Out [0]),
    .O(\regFile/reg0/Reg_Out_0_rstpot_689 )
  );
  LUT5 #(
    .INIT ( 32'hFDDDA888 ))
  \regFile/reg1/Reg_Out_0_rstpot  (
    .I0(\regFile/Write_Enable_Reg_Write[3]_AND_2_o ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I3(\OpCode[4] ),
    .I4(\regFile/reg1/Reg_Out [0]),
    .O(\regFile/reg1/Reg_Out_0_rstpot_690 )
  );
  LUT5 #(
    .INIT ( 32'h55555556 ))
  Write_Enable_rstpot1 (
    .I0(operation[4]),
    .I1(operation[0]),
    .I2(operation[1]),
    .I3(operation[3]),
    .I4(operation[2]),
    .O(Write_Enable_rstpot)
  );
  FDR   Reg_Read_A_0_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025724),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A_0_1_711)
  );
  FDR   Reg_Read_B_0_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025720),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B_0_1_712)
  );
  FDR   Reg_Read_A_1_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025725),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A_1_1_713)
  );
  FDR   Reg_Read_B_1_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025721),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B_1_1_714)
  );
  FDR   Reg_Read_A_0_2 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025724),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A_0_2_715)
  );
  FDR   Reg_Read_B_0_2 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025720),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B_0_2_716)
  );
  FDR   Reg_Read_A_1_2 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025725),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A_1_2_717)
  );
  FDR   Reg_Read_B_1_2 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025721),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B_1_2_718)
  );
  FDR   Reg_Read_A_2_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025726),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_A_2_1_719)
  );
  FDR   Reg_Read_B_2_1 (
    .C(Clk_BUFGP_0),
    .D(Mram__n025722),
    .R(\ALU/C<1>12 ),
    .Q(Reg_Read_B_2_1_720)
  );
  MUXF7   \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW2  (
    .I0(N80),
    .I1(N81),
    .S(\ALU/BUS_0001_GND_4_o_add_1_OUT [10]),
    .O(N18)
  );
  LUT6 #(
    .INIT ( 64'h0282028002020200 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW2_F  (
    .I0(\OpCode[4] ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I3(\OpCode[0] ),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [6]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [2]),
    .O(N80)
  );
  LUT6 #(
    .INIT ( 64'h202A002A20280028 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW2_G  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I3(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [2]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [6]),
    .O(N81)
  );
  MUXF7   \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW3  (
    .I0(N82),
    .I1(N83),
    .S(\ALU/BUS_0001_GND_4_o_add_1_OUT [10]),
    .O(N19)
  );
  LUT6 #(
    .INIT ( 64'h55DD444055554440 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW3_F  (
    .I0(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I1(\OpCode[4] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [6]),
    .I3(\OpCode[0] ),
    .I4(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [2]),
    .O(N82)
  );
  LUT6 #(
    .INIT ( 64'h2F2A0F2A2F280F28 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW3_G  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I3(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [2]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [6]),
    .O(N83)
  );
  MUXF7   \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW2  (
    .I0(N84),
    .I1(N85),
    .S(\ALU/BUS_0001_GND_4_o_add_1_OUT [8]),
    .O(N8)
  );
  LUT6 #(
    .INIT ( 64'hC2C28280C2C20200 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW2_F  (
    .I0(\OpCode[4] ),
    .I1(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [4]),
    .I4(\OpCode[0] ),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .O(N84)
  );
  LUT6 #(
    .INIT ( 64'hE02AC02AE028C028 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW2_G  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I3(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [4]),
    .O(N85)
  );
  MUXF7   \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW1  (
    .I0(N86),
    .I1(N87),
    .S(\ALU/BUS_0001_GND_4_o_add_1_OUT [10]),
    .O(N17)
  );
  LUT6 #(
    .INIT ( 64'hCCCCCCCC8A828880 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW1_F  (
    .I0(\OpCode[4] ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(\OpCode[0] ),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [6]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [2]),
    .I5(\bcd/onesOrTens_FSM_FFd1_487 ),
    .O(N86)
  );
  LUT6 #(
    .INIT ( 64'hFF22AA20FF228820 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW1_G  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [2]),
    .I3(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I4(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [6]),
    .O(N87)
  );
  MUXF7   \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW1  (
    .I0(N88),
    .I1(N89),
    .S(\ALU/BUS_0001_GND_4_o_add_1_OUT [8]),
    .O(N7)
  );
  LUT6 #(
    .INIT ( 64'hE3E3E2E0E3E3C2C0 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW1_F  (
    .I0(\OpCode[4] ),
    .I1(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I4(\OpCode[0] ),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [4]),
    .O(N88)
  );
  LUT6 #(
    .INIT ( 64'hFF22AAECFF2288EC ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW1_G  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I3(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I4(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [4]),
    .O(N89)
  );
  MUXF7   \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW3  (
    .I0(N90),
    .I1(N91),
    .S(\ALU/BUS_0001_GND_4_o_add_1_OUT [8]),
    .O(N9)
  );
  LUT6 #(
    .INIT ( 64'hA888FAFAA888EAEA ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW3_F  (
    .I0(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I1(\OpCode[0] ),
    .I2(\OpCode[4] ),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I4(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [4]),
    .O(N90)
  );
  LUT6 #(
    .INIT ( 64'hEFCF2A2AEFCF2828 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW3_G  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I4(\bcd/onesOrTens_FSM_FFd1_487 ),
    .I5(\ALU/BUS_0001_GND_4_o_add_1_OUT [4]),
    .O(N91)
  );
  MUXF7   \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW0  (
    .I0(N92),
    .I1(N93),
    .S(\bcd/onesOrTens_FSM_FFd1_487 ),
    .O(N16)
  );
  LUT5 #(
    .INIT ( 32'h88A28880 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW0_F  (
    .I0(\OpCode[4] ),
    .I1(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I2(\ALU/BUS_0001_GND_4_o_add_1_OUT [6]),
    .I3(\OpCode[0] ),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [2]),
    .O(N92)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<2><2>1_SW0_G  (
    .I0(N44),
    .I1(\ALU/BUS_0001_GND_4_o_add_1_OUT [10]),
    .O(N93)
  );
  MUXF7   \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW0  (
    .I0(N94),
    .I1(N95),
    .S(\bcd/onesOrTens_FSM_FFd1_487 ),
    .O(N6)
  );
  LUT5 #(
    .INIT ( 32'hAEAC8E8C ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW0_F  (
    .I0(\OpCode[4] ),
    .I1(\OpCode[0] ),
    .I2(\bcd/onesOrTens_FSM_FFd2_488 ),
    .I3(\ALU/BUS_0001_GND_4_o_add_1_OUT [0]),
    .I4(\ALU/BUS_0001_GND_4_o_add_1_OUT [4]),
    .O(N94)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \bcd/Binary[15]_Binary[3]_mux_18_OUT<0><0>1_SW0_G  (
    .I0(N44),
    .I1(\ALU/BUS_0001_GND_4_o_add_1_OUT [8]),
    .O(N95)
  );
  BUFGP   Clk_BUFGP (
    .I(Clk),
    .O(Clk_BUFGP_0)
  );
  INV   \Mcount_operation_lut<0>_INV_0  (
    .I(operation[0]),
    .O(Mcount_operation_lut[0])
  );
  INV   \Mcount_counter_lut<0>_INV_0  (
    .I(counter[0]),
    .O(Mcount_counter_lut[0])
  );
  INV   \bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_lut<0>_INV_0  (
    .I(\bcd/clkCount [0]),
    .O(\bcd/Madd_clkCount[31]_GND_8_o_add_1_OUT_lut<0> )
  );
  INV   \bcd/Mcount_clkCount_lut<0>_INV_0  (
    .I(\bcd/clkCount [0]),
    .O(\bcd/Mcount_clkCount_lut [0])
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

