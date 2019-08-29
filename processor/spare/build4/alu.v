/**
 * This is written by Zhiyang Ong 
 * and Andrew Mattheisen 
 * for EE577b Troy WideWord Processor Project
 *
 *
 * @reminder December 1, 2007
 * Remember to remove wrbyteen and ctrl_ppp from the inputs to
 * the ALU and its testbench
 
 */





// GOLD VERSION





 
/**
 * Reference:
 * Nestoras Tzartzanis, EE 577B Verilog Example, Jan 25, 1996
 * http://www-scf.usc.edu/~ee577/tutorial/verilog/alu.v
 */

/**
 * Note that all instructions are 32-bits, and that Big-Endian
 * byte and bit labeling is used. Hence, a[0] is the most
 * significant bit, and a[31] is the least significant bit.
 *
 * Use of casex and casez may affect functionality, and produce
 * larger and slower designs that omit the full_case directive
 *
 * Reference:
 * Don Mills and Clifford E. Cummings, "RTL Coding Styles That
 * Yield Simulation and Synthesis Mismatches", SNUG 1999
 *
 * ALU is a combinational logic block without clock signals
 */

`include "control.h"

// Behavioral model for the ALU
module alu (reg_A,reg_B,ctrl_ppp,ctrl_ww,alu_op,result,wrbyteen);

	// Output signals...
	// Result from copmputing an arithmetic or logical operation
	output [0:127] result;
	/**
	 * Overflow fromn arithmetic operations are ignored; use
	 * saturating mode for arithmetic operations - cap the value
	 * at the maximum value.
	 *
	 * Also, an output signal to indicate that an overflow has
	 * occurred will not be provided
	 */
	
	
	
	
	// ===============================================================
	// Input signals
	// Input register A
	input [0:127] reg_A;
	// Input register B
	input [0:127] reg_B;
	// Clock signal
	//input clock;
	// Control signal bits - ppp
	input [0:2] ctrl_ppp;
	// Control signal bits - ww
	input [0:1] ctrl_ww;
	/**
	 * Control signal bits - determine which arithmetic or logic
	 * operation to perform
	 */
	input [0:4] alu_op;
	/**
	 * Byte-write enable signals: one for each byte of the data
	 *
	 * Asserted high when each byte of the address word needs to be
	 * updated during the write operation
	 */
	input [15:0] wrbyteen;
	/**
	 * May also include: branch_offset[n:0], is_branch
	 * Size of branch offset is specified in the Instruction Set
	 * Architecture
	 *
	 * The reset signal for the ALU is ignored
	 */
	
	
	
	
	
	
	
	
	// Defining constants: parameter [name_of_constant] = value;
	parameter max_128_bits = 128'hffffffffffffffffffffffffffffffff;
	//parameter max_128_bits = 128'hfffffffffffffffffffffffffffffffff;
	//parameter max_128_bits = 128'h00112233445566778899aabbccddeeff1;
	//parameter max_128_bits = 128'h123415678901234567890123456789012;
	
	
	
	
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;
	



	
	// ===============================================================
	// Declare "reg" signals: 
	reg [0:127] result;		// Output signals

	
	
	
	// ===============================================================
	
	always @(reg_A or reg_B or ctrl_ppp or ctrl_ww or alu_op or wrbyteen)
	begin
		/**
		 * Based on the assigned arithmetic or logic instruction,
		 * carry out the appropriate function on the operands
		 */
		case(alu_op)

			/**
			 * In computer science, a logical shift is a shift operator
			 * that shifts all the bits of its operand. Unlike an
			 * arithmetic shift, a logical shift does not preserve
			 * a number's sign bit or distinguish a number's exponent
			 * from its mantissa; every bit in the operand is simply
			 * moved a given number of bit positions, and the vacant
			 * bit-positions are filled in, generally with zeros
			 * (compare with a circular shift).
			 *
			 * SRL,SLL,Srli,sra,srai...
			 */

			// ================================================
			

			
			// ======================================================
			
			// SLL instruction << mv to LSB << bit 127
			`aluwsll:
			begin
				case(ctrl_ww)
					`w8:	// aluwsll AND `aa AND `w8
					begin
						result[0:7]<=reg_A[0:7]<<reg_B[5:7];
						result[8:15]<=reg_A[8:15]<<reg_B[13:15];
						result[16:23]<=reg_A[16:23]<<reg_B[21:23];
						result[24:31]<=reg_A[24:31]<<reg_B[29:31];
						result[32:39]<=reg_A[32:39]<<reg_B[37:39];
						result[40:47]<=reg_A[40:47]<<reg_B[45:47];
						result[48:55]<=reg_A[48:55]<<reg_B[53:55];
						result[56:63]<=reg_A[56:63]<<reg_B[61:63];
						result[64:71]<=reg_A[64:71]<<reg_B[69:71];
						result[72:79]<=reg_A[72:79]<<reg_B[77:79];
						result[80:87]<=reg_A[80:87]<<reg_B[85:87];
						result[88:95]<=reg_A[88:95]<<reg_B[93:95];
						result[96:103]<=reg_A[96:103]<<reg_B[101:103];
						result[104:111]<=reg_A[104:111]<<reg_B[109:111];
						result[112:119]<=reg_A[112:119]<<reg_B[117:119];
						result[120:127]<=reg_A[120:127]<<reg_B[125:127];
					end
		
					`w16:	// aluwsll AND `aa AND `w16
					begin
						result[0:15]<=reg_A[0:15]<<reg_B[12:15];
						result[16:31]<=reg_A[16:31]<<reg_B[28:31];
						result[32:47]<=reg_A[32:47]<<reg_B[44:47];
						result[48:63]<=reg_A[48:63]<<reg_B[60:63];
						result[64:79]<=reg_A[64:79]<<reg_B[76:79];
						result[80:95]<=reg_A[80:95]<<reg_B[92:95];
						result[96:111]<=reg_A[96:111]<<reg_B[108:111];
						result[112:127]<=reg_A[112:127]<<reg_B[124:127];
					end
		
					`w32:	// aluwsll AND `aa AND `w32
					begin
						result[0:31]<=reg_A[0:31]<<reg_B[27:31];
						result[32:63]<=reg_A[32:63]<<reg_B[59:63];
						result[64:95]<=reg_A[64:95]<<reg_B[91:95];
						result[96:127]<=reg_A[96:127]<<reg_B[123:127];
					end
					
					default:	// aluwsll AND `aa AND Default
					begin
						result<=128'd0;
					end
				endcase
			end

			
			
			/*
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 * ======================================================
			 */
			
			// ======================================================
			
			// SRL instruction >> mv to MSB >> bit 0
			`aluwsrl:
			begin
				case(ctrl_ppp)
					`aa:	// aluwsrl AND `aa
					begin
						case(ctrl_ww)
							`w8:	// aluwsrl AND `aa AND `w8
							begin
								result[0:7]<=reg_A[0:7]>>reg_B[5:7];
								result[8:15]<=reg_A[8:15]>>reg_B[13:15];
								result[16:23]<=reg_A[16:23]>>reg_B[21:23];
								result[24:31]<=reg_A[24:31]>>reg_B[29:31];
								result[32:39]<=reg_A[32:39]>>reg_B[37:39];
								result[40:47]<=reg_A[40:47]>>reg_B[45:47];
								result[48:55]<=reg_A[48:55]>>reg_B[53:55];
								result[56:63]<=reg_A[56:63]>>reg_B[61:63];
								result[64:71]<=reg_A[64:71]>>reg_B[69:71];
								result[72:79]<=reg_A[72:79]>>reg_B[77:79];
								result[80:87]<=reg_A[80:87]>>reg_B[85:87];
								result[88:95]<=reg_A[88:95]>>reg_B[93:95];
								result[96:103]<=reg_A[96:103]>>reg_B[101:103];
								result[104:111]<=reg_A[104:111]>>reg_B[109:111];
								result[112:119]<=reg_A[112:119]>>reg_B[117:119];
								result[120:127]<=reg_A[120:127]>>reg_B[125:127];
							end
							`w16:	// aluwsrl AND `aa AND `w16
							begin
								result[0:15]<=reg_A[0:15]>>reg_B[12:15];
								result[16:31]<=reg_A[16:31]>>reg_B[28:31];
								result[32:47]<=reg_A[32:47]>>reg_B[44:47];
								result[48:63]<=reg_A[48:63]>>reg_B[60:63];
								result[64:79]<=reg_A[64:79]>>reg_B[76:79];
								result[80:95]<=reg_A[80:95]>>reg_B[92:95];
								result[96:111]<=reg_A[96:111]>>reg_B[108:111];
								result[112:127]<=reg_A[112:127]>>reg_B[124:127];
							end
							`w32:	// aluwsrl AND `aa AND `w32
							begin
								result[0:31]<=reg_A[0:31]>>reg_B[27:31];
								result[32:63]<=reg_A[32:63]>>reg_B[59:63];
								result[64:95]<=reg_A[64:95]>>reg_B[91:95];
								result[96:127]<=reg_A[96:127]>>reg_B[123:127];
							end
							
							default:	// aluwsrl AND `aa AND Default
							begin
								result<=128'd0;
							end
						endcase
					
					end
					`uu:	// aluwsrl AND `uu
					begin
						case(ctrl_ww)
							`w8:	// aluwsrl AND `uu AND `w8
							begin
								result[0:7]<=reg_A[0:7]>>reg_B[5:7];
								result[8:15]<=reg_A[8:15]>>reg_B[13:15];
								result[16:23]<=reg_A[16:23]>>reg_B[21:23];
								result[24:31]<=reg_A[24:31]>>reg_B[29:31];
								result[32:39]<=reg_A[32:39]>>reg_B[37:39];
								result[40:47]<=reg_A[40:47]>>reg_B[45:47];
								result[48:55]<=reg_A[48:55]>>reg_B[53:55];
								result[56:63]<=reg_A[56:63]>>reg_B[61:63];
							end
							`w16:	// aluwsrl AND `uu AND `w16
							begin
								result[0:15]<=reg_A[0:15]>>reg_B[12:15];
								result[16:31]<=reg_A[16:31]>>reg_B[28:31];
								result[32:47]<=reg_A[32:47]>>reg_B[44:47];
								result[48:63]<=reg_A[48:63]>>reg_B[60:63];
							end
							`w32:	// aluwsrl AND `uu AND `w32
							begin
								result[0:31]<=reg_A[0:31]>>reg_B[27:31];
								result[32:63]<=reg_A[32:63]>>reg_B[59:63];
							end
							
							default:
							begin
								// aluwsrl AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`dd:	// aluwsrl AND `dd
					begin
						case(ctrl_ww)
							`w8:	// aluwsrl AND `dd AND `w8
							begin
								result[64:71]<=reg_A[64:71]>>reg_B[69:71];
								result[72:79]<=reg_A[72:79]>>reg_B[77:79];
								result[80:87]<=reg_A[80:87]>>reg_B[85:87];
								result[88:95]<=reg_A[88:95]>>reg_B[93:95];
								result[96:103]<=reg_A[96:103]>>reg_B[101:103];
								result[104:111]<=reg_A[104:111]>>reg_B[109:111];
								result[112:119]<=reg_A[112:119]>>reg_B[117:119];
								result[120:127]<=reg_A[120:127]>>reg_B[125:127];
							end
							`w16:	// aluwsrl AND `dd AND `w16
							begin
								result[64:79]<=reg_A[64:79]>>reg_B[76:79];
								result[80:95]<=reg_A[80:95]>>reg_B[92:95];
								result[96:111]<=reg_A[96:111]>>reg_B[108:111];
								result[112:127]<=reg_A[112:127]>>reg_B[124:127];
							end
							`w32:	// aluwsrl AND `dd AND `w32
							begin
								result[64:95]<=reg_A[64:95]>>reg_B[91:95];
								result[96:127]<=reg_A[96:127]>>reg_B[123:127];
							end
							
							default:
							begin
									// aluwsrl AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`ee:	// aluwsrl AND `ee
					begin
						case(ctrl_ww)
							`w8:	// aluwsrl AND `ee AND `w8
							begin
								result[0:7]<=reg_A[0:7]>>reg_B[5:7];
								result[16:23]<=reg_A[16:23]>>reg_B[21:23];
								result[32:39]<=reg_A[32:39]>>reg_B[37:39];
								result[48:55]<=reg_A[48:55]>>reg_B[53:55];
								result[64:71]<=reg_A[64:71]>>reg_B[69:71];
								result[80:87]<=reg_A[80:87]>>reg_B[85:87];
								result[96:103]<=reg_A[96:103]>>reg_B[101:103];
								result[112:119]<=reg_A[112:119]>>reg_B[117:119];
							end
							`w16:	// aluwsrl AND `ee AND `w16
							begin
								result[0:15]<=reg_A[0:15]>>reg_B[12:15];
								result[32:47]<=reg_A[32:47]>>reg_B[44:47];
								result[64:79]<=reg_A[64:79]>>reg_B[76:79];
								result[96:111]<=reg_A[96:111]>>reg_B[108:111];
							end
							`w32:	// aluwsrl AND `ee AND `w32
							begin
								result[0:31]<=reg_A[0:31]>>reg_B[27:31];
								result[64:95]<=reg_A[64:95]>>reg_B[91:95];
							end
							
							default:
							begin
								// aluwsrl AND `ee AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`oo:	// aluwsrl AND `oo
					begin
						case(ctrl_ww)
							`w8:	// aluwsrl AND `oo AND `w8
							begin
								result[8:15]<=reg_A[8:15]>>reg_B[13:15];
								result[24:31]<=reg_A[24:31]>>reg_B[29:31];
								result[40:47]<=reg_A[40:47]>>reg_B[45:47];
								result[56:63]<=reg_A[56:63]>>reg_B[61:63];
								result[72:79]<=reg_A[72:79]>>reg_B[77:79];
								result[88:95]<=reg_A[88:95]>>reg_B[93:95];
								result[104:111]<=reg_A[104:111]>>reg_B[109:111];
								result[120:127]<=reg_A[120:127]>>reg_B[125:127];
							end
							`w16:	// aluwsrl AND `oo AND `w16
							begin
								result[16:31]<=reg_A[16:31]>>reg_B[28:31];
								result[48:63]<=reg_A[48:63]>>reg_B[60:63];
								result[80:95]<=reg_A[80:95]>>reg_B[92:95];
								result[112:127]<=reg_A[112:127]>>reg_B[124:127];
							end
							`w32:	// aluwsrl AND `oo AND `w32
							begin
								result[32:63]<=reg_A[32:63]>>reg_B[59:63];
								result[96:127]<=reg_A[96:127]>>reg_B[123:127];
							end
							
							default:
							begin
								// aluwsrl AND `oo AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`mm:	// aluwsrl AND `mm
					begin
						case(ctrl_ww)
							`w8:	// aluwsrl AND `mm AND `w8
							begin
								result[0:7]<=reg_A[0:7]>>reg_B[5:7];
							end
							`w16:	// aluwsrl AND `mm AND `w16
							begin
								result[0:15]<=reg_A[0:15]>>reg_B[12:15];
							end
							`w32:	// aluwsrl AND `mm AND `w32
							begin
								result[0:31]<=reg_A[0:31]>>reg_B[27:31];
							end
							
							default:
							begin
								// aluwsrl AND `mm AND `w8
								result<=128'd0;
							end
						endcase
					
					end
					`ll:	// aluwsrl AND `ll
					begin
						case(ctrl_ww)
							`w8:	// aluwsrl AND `ll AND `w8
							begin
								result[120:127]<=reg_A[120:127]>>reg_B[125:127];
							end
							`w16:	// aluwsrl AND `ll AND `w16
							begin
								result[112:127]<=reg_A[112:127]>>reg_B[124:127];
							end
							`w32:	// aluwsrl AND `ll AND `w32
							begin
								result[96:127]<=reg_A[96:127]>>reg_B[123:127];
							end
							
							default:
							begin
								// aluwsrl AND `ll AND Default
								result<=128'd0;
							end
						endcase
					
					end
					default:	// aluwsrl AND Default
					begin
						result<=128'd0;
					end
				endcase
				
			end








//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================








			// ================================================
			
			// ADD instruction
			
			`aluwadd:
			begin
				case(ctrl_ppp)
					`aa:	// aluwadd AND `aa
					begin
						case(ctrl_ww)
							`w8:	// aluwadd AND `aa AND `w8
							begin
								result[0:7]<=reg_A[0:7]+reg_B[0:7];
								result[8:15]<=reg_A[8:15]+reg_B[8:15];
								result[16:23]<=reg_A[16:23]+reg_B[16:23];
								result[24:31]<=reg_A[24:31]+reg_B[24:31];
								result[32:39]<=reg_A[32:39]+reg_B[32:39];
								result[40:47]<=reg_A[40:47]+reg_B[40:47];
								result[48:55]<=reg_A[48:55]+reg_B[48:55];
								result[56:63]<=reg_A[56:63]+reg_B[56:63];
								result[64:71]<=reg_A[64:71]+reg_B[64:71];
								result[72:79]<=reg_A[72:79]+reg_B[72:79];
								result[80:87]<=reg_A[80:87]+reg_B[80:87];
								result[88:95]<=reg_A[88:95]+reg_B[88:95];
								result[96:103]<=reg_A[96:103]+reg_B[96:103];
								result[104:111]<=reg_A[104:111]+reg_B[104:111];
								result[112:119]<=reg_A[112:119]+reg_B[112:119];
								result[120:127]<=reg_A[120:127]+reg_B[120:127];
							end
							`w16:	// aluwadd AND `aa AND `w16
							begin
								result[0:15]<=reg_A[0:15]+reg_B[0:15];
								result[16:31]<=reg_A[16:31]+reg_B[16:31];
								result[32:47]<=reg_A[32:47]+reg_B[32:47];
								result[48:63]<=reg_A[48:63]+reg_B[48:63];
								result[64:79]<=reg_A[64:79]+reg_B[64:79];
								result[80:95]<=reg_A[80:95]+reg_B[80:95];
								result[96:111]<=reg_A[96:111]+reg_B[96:111];
								result[112:127]<=reg_A[112:127]+reg_B[112:127];
							end
							`w32:	// aluwadd AND `aa AND `w32
							begin
								result[0:31]<=reg_A[0:31]+reg_B[0:31];
								result[32:63]<=reg_A[32:63]+reg_B[32:63];
								result[64:95]<=reg_A[64:95]+reg_B[64:95];
								result[96:127]<=reg_A[96:127]+reg_B[96:127];
							end
							
							default:	// aluwadd AND `aa AND Default
							begin
								result<=128'd0;
							end
						endcase
					
					end
					`uu:	// aluwadd AND `uu
					begin
						case(ctrl_ww)
							`w8:	// aluwadd AND `uu AND `w8
							begin
								result[0:7]<=reg_A[0:7]+reg_B[0:7];
								result[8:15]<=reg_A[8:15]+reg_B[8:15];
								result[16:23]<=reg_A[16:23]+reg_B[16:23];
								result[24:31]<=reg_A[24:31]+reg_B[24:31];
								result[32:39]<=reg_A[32:39]+reg_B[32:39];
								result[40:47]<=reg_A[40:47]+reg_B[40:47];
								result[48:55]<=reg_A[48:55]+reg_B[48:55];
								result[56:63]<=reg_A[56:63]+reg_B[56:63];
							end
							`w16:	// aluwadd AND `uu AND `w16
							begin
								result[0:15]<=reg_A[0:15]+reg_B[0:15];
								result[16:31]<=reg_A[16:31]+reg_B[16:31];
								result[32:47]<=reg_A[32:47]+reg_B[32:47];
								result[48:63]<=reg_A[48:63]+reg_B[48:63];
							end
							`w32:	// aluwadd AND `uu AND `w32
							begin
								result[0:31]<=reg_A[0:31]+reg_B[0:31];
								result[32:63]<=reg_A[32:63]+reg_B[32:63];
							end
							
							default:
							begin
								// aluwadd AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`dd:	// aluwadd AND `dd
					begin
						case(ctrl_ww)
							`w8:	// aluwadd AND `dd AND `w8
							begin
								result[64:71]<=reg_A[64:71]+reg_B[64:71];
								result[72:79]<=reg_A[72:79]+reg_B[72:79];
								result[80:87]<=reg_A[80:87]+reg_B[80:87];
								result[88:95]<=reg_A[88:95]+reg_B[88:95];
								result[96:103]<=reg_A[96:103]+reg_B[96:103];
								result[104:111]<=reg_A[104:111]+reg_B[104:111];
								result[112:119]<=reg_A[112:119]+reg_B[112:119];
								result[120:127]<=reg_A[120:127]+reg_B[120:127];
							end
							`w16:	// aluwadd AND `dd AND `w16
							begin
								result[64:79]<=reg_A[64:79]+reg_B[64:79];
								result[80:95]<=reg_A[80:95]+reg_B[80:95];
								result[96:111]<=reg_A[96:111]+reg_B[96:111];
								result[112:127]<=reg_A[112:127]+reg_B[112:127];
							end
							`w32:	// aluwadd AND `dd AND `w32
							begin
								result[64:95]<=reg_A[64:95]+reg_B[64:95];
								result[96:127]<=reg_A[96:127]+reg_B[96:127];
							end
							
							default:
							begin
									// aluwadd AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`ee:	// aluwadd AND `ee
					begin
						case(ctrl_ww)
							`w8:	// aluwadd AND `ee AND `w8
							begin
								result[0:7]<=reg_A[0:7]+reg_B[0:7];
								result[16:23]<=reg_A[16:23]+reg_B[16:23];
								result[32:39]<=reg_A[32:39]+reg_B[32:39];
								result[48:55]<=reg_A[48:55]+reg_B[48:55];
								result[64:71]<=reg_A[64:71]+reg_B[64:71];
								result[80:87]<=reg_A[80:87]+reg_B[80:87];
								result[96:103]<=reg_A[96:103]+reg_B[96:103];
								result[112:119]<=reg_A[112:119]+reg_B[112:119];
							end
							`w16:	// aluwadd AND `ee AND `w16
							begin
								result[0:15]<=reg_A[0:15]+reg_B[0:15];
								result[32:47]<=reg_A[32:47]+reg_B[32:47];
								result[64:79]<=reg_A[64:79]+reg_B[64:79];
								result[96:111]<=reg_A[96:111]+reg_B[96:111];
							end
							`w32:	// aluwadd AND `ee AND `w32
							begin
								result[0:31]<=reg_A[0:31]+reg_B[0:31];
								result[64:95]<=reg_A[64:95]+reg_B[64:95];
							end
							
							default:
							begin
								// aluwadd AND `ee AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`oo:	// aluwadd AND `oo
					begin
						case(ctrl_ww)
							`w8:	// aluwadd AND `oo AND `w8
							begin
								result[8:15]<=reg_A[8:15]+reg_B[8:15];
								result[24:31]<=reg_A[24:31]+reg_B[24:31];
								result[40:47]<=reg_A[40:47]+reg_B[40:47];
								result[56:63]<=reg_A[56:63]+reg_B[56:63];
								result[72:79]<=reg_A[72:79]+reg_B[72:79];
								result[88:95]<=reg_A[88:95]+reg_B[88:95];
								result[104:111]<=reg_A[104:111]+reg_B[104:111];
								result[120:127]<=reg_A[120:127]+reg_B[120:127];
							end
							`w16:	// aluwadd AND `oo AND `w16
							begin
								result[16:31]<=reg_A[16:31]+reg_B[16:31];
								result[48:63]<=reg_A[48:63]+reg_B[48:63];
								result[80:95]<=reg_A[80:95]+reg_B[80:95];
								result[112:127]<=reg_A[112:127]+reg_B[112:127];
							end
							`w32:	// aluwadd AND `oo AND `w32
							begin
								result[32:63]<=reg_A[32:63]+reg_B[32:63];
								result[96:127]<=reg_A[96:127]+reg_B[96:127];
							end
							
							default:
							begin
								// aluwadd AND `oo AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`mm:	// aluwadd AND `mm
					begin
						case(ctrl_ww)
							`w8:	// aluwadd AND `mm AND `w8
							begin
								result[0:7]<=reg_A[0:7]+reg_B[0:7];
							end
							`w16:	// aluwadd AND `mm AND `w16
							begin
								result[0:15]<=reg_A[0:15]+reg_B[0:15];
							end
							`w32:	// aluwadd AND `mm AND `w32
							begin
								result[0:31]<=reg_A[0:31]+reg_B[0:31];
							end
							
							default:
							begin
								// aluwadd AND `mm AND `w8
								result<=128'd0;
							end
						endcase
					
					end
					`ll:	// aluwadd AND `ll
					begin
						case(ctrl_ww)
							`w8:	// aluwadd AND `ll AND `w8
							begin
								result[120:127]<=reg_A[120:127]+reg_B[120:127];
							end
							`w16:	// aluwadd AND `ll AND `w16
							begin
								result[112:127]<=reg_A[112:127]+reg_B[112:127];
							end
							`w32:	// aluwadd AND `ll AND `w32
							begin
								result[96:127]<=reg_A[96:127]+reg_B[96:127];
							end
							
							default:
							begin
								// aluwadd AND `ll AND Default
								result<=128'd0;
							end
						endcase
					
					end
					default:	// aluwadd AND Default
					begin
						result<=128'd0;
					end
				endcase
				
			end
			
			// ================================================
			
			// AND instruction
			`aluwand:
			begin
				case(ctrl_ppp)
					`aa:	// aluwand AND `aa
					begin
						case(ctrl_ww)
							`w8:	// aluwand AND `aa AND `w8
							begin
								result[0:7]<=reg_A[0:7]&reg_B[0:7];
								result[8:15]<=reg_A[8:15]&reg_B[8:15];
								result[16:23]<=reg_A[16:23]&reg_B[16:23];
								result[24:31]<=reg_A[24:31]&reg_B[24:31];
								result[32:39]<=reg_A[32:39]&reg_B[32:39];
								result[40:47]<=reg_A[40:47]&reg_B[40:47];
								result[48:55]<=reg_A[48:55]&reg_B[48:55];
								result[56:63]<=reg_A[56:63]&reg_B[56:63];
								result[64:71]<=reg_A[64:71]&reg_B[64:71];
								result[72:79]<=reg_A[72:79]&reg_B[72:79];
								result[80:87]<=reg_A[80:87]&reg_B[80:87];
								result[88:95]<=reg_A[88:95]&reg_B[88:95];
								result[96:103]<=reg_A[96:103]&reg_B[96:103];
								result[104:111]<=reg_A[104:111]&reg_B[104:111];
								result[112:119]<=reg_A[112:119]&reg_B[112:119];
								result[120:127]<=reg_A[120:127]&reg_B[120:127];
							end
							`w16:	// aluwand AND `aa AND `w16
							begin
								result[0:15]<=reg_A[0:15]&reg_B[0:15];
								result[16:31]<=reg_A[16:31]&reg_B[16:31];
								result[32:47]<=reg_A[32:47]&reg_B[32:47];
								result[48:63]<=reg_A[48:63]&reg_B[48:63];
								result[64:79]<=reg_A[64:79]&reg_B[64:79];
								result[80:95]<=reg_A[80:95]&reg_B[80:95];
								result[96:111]<=reg_A[96:111]&reg_B[96:111];
								result[112:127]<=reg_A[112:127]&reg_B[112:127];
							end
							`w32:	// aluwand AND `aa AND `w32
							begin
								result[0:31]<=reg_A[0:31]&reg_B[0:31];
								result[32:63]<=reg_A[32:63]&reg_B[32:63];
								result[64:95]<=reg_A[64:95]&reg_B[64:95];
								result[96:127]<=reg_A[96:127]&reg_B[96:127];
							end
							
							default:	// aluwand AND `aa AND Default
							begin
								result<=128'd0;
							end
						endcase
					
					end
					`uu:	// aluwand AND `uu
					begin
						case(ctrl_ww)
							`w8:	// aluwand AND `uu AND `w8
							begin
								result[0:7]<=reg_A[0:7]&reg_B[0:7];
								result[8:15]<=reg_A[8:15]&reg_B[8:15];
								result[16:23]<=reg_A[16:23]&reg_B[16:23];
								result[24:31]<=reg_A[24:31]&reg_B[24:31];
								result[32:39]<=reg_A[32:39]&reg_B[32:39];
								result[40:47]<=reg_A[40:47]&reg_B[40:47];
								result[48:55]<=reg_A[48:55]&reg_B[48:55];
								result[56:63]<=reg_A[56:63]&reg_B[56:63];
							end
							`w16:	// aluwand AND `uu AND `w16
							begin
								result[0:15]<=reg_A[0:15]&reg_B[0:15];
								result[16:31]<=reg_A[16:31]&reg_B[16:31];
								result[32:47]<=reg_A[32:47]&reg_B[32:47];
								result[48:63]<=reg_A[48:63]&reg_B[48:63];
							end
							`w32:	// aluwand AND `uu AND `w32
							begin
								result[0:31]<=reg_A[0:31]&reg_B[0:31];
								result[32:63]<=reg_A[32:63]&reg_B[32:63];
							end
							
							default:
							begin
								// aluwand AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`dd:	// aluwand AND `dd
					begin
						case(ctrl_ww)
							`w8:	// aluwand AND `dd AND `w8
							begin
								result[64:71]<=reg_A[64:71]&reg_B[64:71];
								result[72:79]<=reg_A[72:79]&reg_B[72:79];
								result[80:87]<=reg_A[80:87]&reg_B[80:87];
								result[88:95]<=reg_A[88:95]&reg_B[88:95];
								result[96:103]<=reg_A[96:103]&reg_B[96:103];
								result[104:111]<=reg_A[104:111]&reg_B[104:111];
								result[112:119]<=reg_A[112:119]&reg_B[112:119];
								result[120:127]<=reg_A[120:127]&reg_B[120:127];
							end
							`w16:	// aluwand AND `dd AND `w16
							begin
								result[64:79]<=reg_A[64:79]&reg_B[64:79];
								result[80:95]<=reg_A[80:95]&reg_B[80:95];
								result[96:111]<=reg_A[96:111]&reg_B[96:111];
								result[112:127]<=reg_A[112:127]&reg_B[112:127];
							end
							`w32:	// aluwand AND `dd AND `w32
							begin
								result[64:95]<=reg_A[64:95]&reg_B[64:95];
								result[96:127]<=reg_A[96:127]&reg_B[96:127];
							end
							
							default:
							begin
									// aluwand AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`ee:	// aluwand AND `ee
					begin
						case(ctrl_ww)
							`w8:	// aluwand AND `ee AND `w8
							begin
								result[0:7]<=reg_A[0:7]&reg_B[0:7];
								result[16:23]<=reg_A[16:23]&reg_B[16:23];
								result[32:39]<=reg_A[32:39]&reg_B[32:39];
								result[48:55]<=reg_A[48:55]&reg_B[48:55];
								result[64:71]<=reg_A[64:71]&reg_B[64:71];
								result[80:87]<=reg_A[80:87]&reg_B[80:87];
								result[96:103]<=reg_A[96:103]&reg_B[96:103];
								result[112:119]<=reg_A[112:119]&reg_B[112:119];
							end
							`w16:	// aluwand AND `ee AND `w16
							begin
								result[0:15]<=reg_A[0:15]&reg_B[0:15];
								result[32:47]<=reg_A[32:47]&reg_B[32:47];
								result[64:79]<=reg_A[64:79]&reg_B[64:79];
								result[96:111]<=reg_A[96:111]&reg_B[96:111];
							end
							`w32:	// aluwand AND `ee AND `w32
							begin
								result[0:31]<=reg_A[0:31]&reg_B[0:31];
								result[64:95]<=reg_A[64:95]&reg_B[64:95];
							end
							
							default:
							begin
								// aluwand AND `ee AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`oo:	// aluwand AND `oo
					begin
						case(ctrl_ww)
							`w8:	// aluwand AND `oo AND `w8
							begin
								result[8:15]<=reg_A[8:15]&reg_B[8:15];
								result[24:31]<=reg_A[24:31]&reg_B[24:31];
								result[40:47]<=reg_A[40:47]&reg_B[40:47];
								result[56:63]<=reg_A[56:63]&reg_B[56:63];
								result[72:79]<=reg_A[72:79]&reg_B[72:79];
								result[88:95]<=reg_A[88:95]&reg_B[88:95];
								result[104:111]<=reg_A[104:111]&reg_B[104:111];
								result[120:127]<=reg_A[120:127]&reg_B[120:127];
							end
							`w16:	// aluwand AND `oo AND `w16
							begin
								result[16:31]<=reg_A[16:31]&reg_B[16:31];
								result[48:63]<=reg_A[48:63]&reg_B[48:63];
								result[80:95]<=reg_A[80:95]&reg_B[80:95];
								result[112:127]<=reg_A[112:127]&reg_B[112:127];
							end
							`w32:	// aluwand AND `oo AND `w32
							begin
								result[32:63]<=reg_A[32:63]&reg_B[32:63];
								result[96:127]<=reg_A[96:127]&reg_B[96:127];
							end
							
							default:
							begin
								// aluwand AND `oo AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`mm:	// aluwand AND `mm
					begin
						case(ctrl_ww)
							`w8:	// aluwand AND `mm AND `w8
							begin
								result[0:7]<=reg_A[0:7]&reg_B[0:7];
							end
							`w16:	// aluwand AND `mm AND `w16
							begin
								result[0:15]<=reg_A[0:15]&reg_B[0:15];
							end
							`w32:	// aluwand AND `mm AND `w32
							begin
								result[0:31]<=reg_A[0:31]&reg_B[0:31];
							end
							
							default:
							begin
								// aluwand AND `mm AND `w8
								result<=128'd0;
							end
						endcase
					
					end
					`ll:	// aluwand AND `ll
					begin
						case(ctrl_ww)
							`w8:	// aluwand AND `ll AND `w8
							begin
								result[120:127]<=reg_A[120:127]&reg_B[120:127];
							end
							`w16:	// aluwand AND `ll AND `w16
							begin
								result[112:127]<=reg_A[112:127]&reg_B[112:127];
							end
							`w32:	// aluwand AND `ll AND `w32
							begin
								result[96:127]<=reg_A[96:127]&reg_B[96:127];
							end
							
							default:
							begin
								// aluwand AND `ll AND Default
								result<=128'd0;
							end
						endcase
					
					end
					default:	// aluwand AND Default
					begin
						result<=128'd0;
					end
				endcase
				
			end
			
			// ==============================================
			
			
			// ================================================
			
			// NOT instruction
			`aluwnot:
			begin
				case(ctrl_ppp)
					`aa:	// aluwnot AND `aa
					begin
						case(ctrl_ww)
							`w8:	// aluwnot AND `aa AND `w8
							begin
								result[0:7]<=~reg_A[0:7];
								result[8:15]<=~reg_A[8:15];
								result[16:23]<=~reg_A[16:23];
								result[24:31]<=~reg_A[24:31];
								result[32:39]<=~reg_A[32:39];
								result[40:47]<=~reg_A[40:47];
								result[48:55]<=~reg_A[48:55];
								result[56:63]<=~reg_A[56:63];
								result[64:71]<=~reg_A[64:71];
								result[72:79]<=~reg_A[72:79];
								result[80:87]<=~reg_A[80:87];
								result[88:95]<=~reg_A[88:95];
								result[96:103]<=~reg_A[96:103];
								result[104:111]<=~reg_A[104:111];
								result[112:119]<=~reg_A[112:119];
								result[120:127]<=~reg_A[120:127];
							end
							`w16:	// aluwnot AND `aa AND `w16
							begin
								result[0:15]<=~reg_A[0:15];
								result[16:31]<=~reg_A[16:31];
								result[32:47]<=~reg_A[32:47];
								result[48:63]<=~reg_A[48:63];
								result[64:79]<=~reg_A[64:79];
								result[80:95]<=~reg_A[80:95];
								result[96:111]<=~reg_A[96:111];
								result[112:127]<=~reg_A[112:127];
							end
							`w32:	// aluwnot AND `aa AND `w32
							begin
								result[0:31]<=~reg_A[0:31];
								result[32:63]<=~reg_A[32:63];
								result[64:95]<=~reg_A[64:95];
								result[96:127]<=~reg_A[96:127];
							end
							
							default:	// aluwnot AND `aa AND Default
							begin
								result<=128'd0;
							end
						endcase
					
					end
					`uu:	// aluwnot AND `uu
					begin
						case(ctrl_ww)
							`w8:	// aluwnot AND `uu AND `w8
							begin
								result[0:7]<=~reg_A[0:7];
								result[8:15]<=~reg_A[8:15];
								result[16:23]<=~reg_A[16:23];
								result[24:31]<=~reg_A[24:31];
								result[32:39]<=~reg_A[32:39];
								result[40:47]<=~reg_A[40:47];
								result[48:55]<=~reg_A[48:55];
								result[56:63]<=~reg_A[56:63];
							end
							`w16:	// aluwnot AND `uu AND `w16
							begin
								result[0:15]<=~reg_A[0:15];
								result[16:31]<=~reg_A[16:31];
								result[32:47]<=~reg_A[32:47];
								result[48:63]<=~reg_A[48:63];
							end
							`w32:	// aluwnot AND `uu AND `w32
							begin
								result[0:31]<=~reg_A[0:31];
								result[32:63]<=~reg_A[32:63];
							end
							
							default:
							begin
								// aluwnot AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`dd:	// aluwnot AND `dd
					begin
						case(ctrl_ww)
							`w8:	// aluwnot AND `dd AND `w8
							begin
								result[64:71]<=~reg_A[64:71];
								result[72:79]<=~reg_A[72:79];
								result[80:87]<=~reg_A[80:87];
								result[88:95]<=~reg_A[88:95];
								result[96:103]<=~reg_A[96:103];
								result[104:111]<=~reg_A[104:111];
								result[112:119]<=~reg_A[112:119];
								result[120:127]<=~reg_A[120:127];
							end
							`w16:	// aluwnot AND `dd AND `w16
							begin
								result[64:79]<=~reg_A[64:79];
								result[80:95]<=~reg_A[80:95];
								result[96:111]<=~reg_A[96:111];
								result[112:127]<=~reg_A[112:127];
							end
							`w32:	// aluwnot AND `dd AND `w32
							begin
								result[64:95]<=~reg_A[64:95];
								result[96:127]<=~reg_A[96:127];
							end
							
							default:
							begin
									// aluwnot AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`ee:	// aluwnot AND `ee
					begin
						case(ctrl_ww)
							`w8:	// aluwnot AND `ee AND `w8
							begin
								result[0:7]<=~reg_A[0:7];
								result[16:23]<=~reg_A[16:23];
								result[32:39]<=~reg_A[32:39];
								result[48:55]<=~reg_A[48:55];
								result[64:71]<=~reg_A[64:71];
								result[80:87]<=~reg_A[80:87];
								result[96:103]<=~reg_A[96:103];
								result[112:119]<=~reg_A[112:119];
							end
							`w16:	// aluwnot AND `ee AND `w16
							begin
								result[0:15]<=~reg_A[0:15];
								result[32:47]<=~reg_A[32:47];
								result[64:79]<=~reg_A[64:79];
								result[96:111]<=~reg_A[96:111];
							end
							`w32:	// aluwnot AND `ee AND `w32
							begin
								result[0:31]<=~reg_A[0:31];
								result[64:95]<=~reg_A[64:95];
							end
							
							default:
							begin
								// aluwnot AND `ee AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`oo:	// aluwnot AND `oo
					begin
						case(ctrl_ww)
							`w8:	// aluwnot AND `oo AND `w8
							begin
								result[8:15]<=~reg_A[8:15];
								result[24:31]<=~reg_A[24:31];
								result[40:47]<=~reg_A[40:47];
								result[56:63]<=~reg_A[56:63];
								result[72:79]<=~reg_A[72:79];
								result[88:95]<=~reg_A[88:95];
								result[104:111]<=~reg_A[104:111];
								result[120:127]<=~reg_A[120:127];
							end
							`w16:	// aluwnot AND `oo AND `w16
							begin
								result[16:31]<=~reg_A[16:31];
								result[48:63]<=~reg_A[48:63];
								result[80:95]<=~reg_A[80:95];
								result[112:127]<=~reg_A[112:127];
							end
							`w32:	// aluwnot AND `oo AND `w32
							begin
								result[32:63]<=~reg_A[32:63];
								result[96:127]<=~reg_A[96:127];
							end
							
							default:
							begin
								// aluwnot AND `oo AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`mm:	// aluwnot AND `mm
					begin
						case(ctrl_ww)
							`w8:	// aluwnot AND `mm AND `w8
							begin
								result[0:7]<=~reg_A[0:7];
							end
							`w16:	// aluwnot AND `mm AND `w16
							begin
								result[0:15]<=~reg_A[0:15];
							end
							`w32:	// aluwnot AND `mm AND `w32
							begin
								result[0:31]<=~reg_A[0:31];
							end
							
							default:
							begin
								// aluwnot AND `mm AND `w8
								result<=128'd0;
							end
						endcase
					
					end
					`ll:	// aluwnot AND `ll
					begin
						case(ctrl_ww)
							`w8:	// aluwnot AND `ll AND `w8
							begin
								result[120:127]<=~reg_A[120:127];
							end
							`w16:	// aluwnot AND `ll AND `w16
							begin
								result[112:127]<=~reg_A[112:127];
							end
							`w32:	// aluwnot AND `ll AND `w32
							begin
								result[96:127]<=~reg_A[96:127];
							end
							
							default:
							begin
								// aluwnot AND `ll AND Default
								result<=128'd0;
							end
						endcase
					
					end
					default:	// aluwnot AND Default
					begin
						result<=128'd0;
					end
				endcase
				
			end
			
			
			
			// ================================================
			
			// OR instruction
			`aluwor:
			begin
				case(ctrl_ppp)
					`aa:	// aluwor AND `aa
					begin
						case(ctrl_ww)
							`w8:	// aluwor AND `aa AND `w8
							begin
								result[0:7]<=reg_A[0:7]|reg_B[0:7];
								result[8:15]<=reg_A[8:15]|reg_B[8:15];
								result[16:23]<=reg_A[16:23]|reg_B[16:23];
								result[24:31]<=reg_A[24:31]|reg_B[24:31];
								result[32:39]<=reg_A[32:39]|reg_B[32:39];
								result[40:47]<=reg_A[40:47]|reg_B[40:47];
								result[48:55]<=reg_A[48:55]|reg_B[48:55];
								result[56:63]<=reg_A[56:63]|reg_B[56:63];
								result[64:71]<=reg_A[64:71]|reg_B[64:71];
								result[72:79]<=reg_A[72:79]|reg_B[72:79];
								result[80:87]<=reg_A[80:87]|reg_B[80:87];
								result[88:95]<=reg_A[88:95]|reg_B[88:95];
								result[96:103]<=reg_A[96:103]|reg_B[96:103];
								result[104:111]<=reg_A[104:111]|reg_B[104:111];
								result[112:119]<=reg_A[112:119]|reg_B[112:119];
								result[120:127]<=reg_A[120:127]|reg_B[120:127];
							end
							`w16:	// aluwor AND `aa AND `w16
							begin
								result[0:15]<=reg_A[0:15]|reg_B[0:15];
								result[16:31]<=reg_A[16:31]|reg_B[16:31];
								result[32:47]<=reg_A[32:47]|reg_B[32:47];
								result[48:63]<=reg_A[48:63]|reg_B[48:63];
								result[64:79]<=reg_A[64:79]|reg_B[64:79];
								result[80:95]<=reg_A[80:95]|reg_B[80:95];
								result[96:111]<=reg_A[96:111]|reg_B[96:111];
								result[112:127]<=reg_A[112:127]|reg_B[112:127];
							end
							`w32:	// aluwor AND `aa AND `w32
							begin
								result[0:31]<=reg_A[0:31]|reg_B[0:31];
								result[32:63]<=reg_A[32:63]|reg_B[32:63];
								result[64:95]<=reg_A[64:95]|reg_B[64:95];
								result[96:127]<=reg_A[96:127]|reg_B[96:127];
							end
							
							default:	// aluwor AND `aa AND Default
							begin
								result<=128'd0;
							end
						endcase
					
					end
					`uu:	// aluwor AND `uu
					begin
						case(ctrl_ww)
							`w8:	// aluwor AND `uu AND `w8
							begin
								result[0:7]<=reg_A[0:7]|reg_B[0:7];
								result[8:15]<=reg_A[8:15]|reg_B[8:15];
								result[16:23]<=reg_A[16:23]|reg_B[16:23];
								result[24:31]<=reg_A[24:31]|reg_B[24:31];
								result[32:39]<=reg_A[32:39]|reg_B[32:39];
								result[40:47]<=reg_A[40:47]|reg_B[40:47];
								result[48:55]<=reg_A[48:55]|reg_B[48:55];
								result[56:63]<=reg_A[56:63]|reg_B[56:63];
							end
							`w16:	// aluwor AND `uu AND `w16
							begin
								result[0:15]<=reg_A[0:15]|reg_B[0:15];
								result[16:31]<=reg_A[16:31]|reg_B[16:31];
								result[32:47]<=reg_A[32:47]|reg_B[32:47];
								result[48:63]<=reg_A[48:63]|reg_B[48:63];
							end
							`w32:	// aluwor AND `uu AND `w32
							begin
								result[0:31]<=reg_A[0:31]|reg_B[0:31];
								result[32:63]<=reg_A[32:63]|reg_B[32:63];
							end
							
							default:
							begin
								// aluwor AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`dd:	// aluwor AND `dd
					begin
						case(ctrl_ww)
							`w8:	// aluwor AND `dd AND `w8
							begin
								result[64:71]<=reg_A[64:71]|reg_B[64:71];
								result[72:79]<=reg_A[72:79]|reg_B[72:79];
								result[80:87]<=reg_A[80:87]|reg_B[80:87];
								result[88:95]<=reg_A[88:95]|reg_B[88:95];
								result[96:103]<=reg_A[96:103]|reg_B[96:103];
								result[104:111]<=reg_A[104:111]|reg_B[104:111];
								result[112:119]<=reg_A[112:119]|reg_B[112:119];
								result[120:127]<=reg_A[120:127]|reg_B[120:127];
							end
							`w16:	// aluwor AND `dd AND `w16
							begin
								result[64:79]<=reg_A[64:79]|reg_B[64:79];
								result[80:95]<=reg_A[80:95]|reg_B[80:95];
								result[96:111]<=reg_A[96:111]|reg_B[96:111];
								result[112:127]<=reg_A[112:127]|reg_B[112:127];
							end
							`w32:	// aluwor AND `dd AND `w32
							begin
								result[64:95]<=reg_A[64:95]|reg_B[64:95];
								result[96:127]<=reg_A[96:127]|reg_B[96:127];
							end
							
							default:
							begin
									// aluwor AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`ee:	// aluwor AND `ee
					begin
						case(ctrl_ww)
							`w8:	// aluwor AND `ee AND `w8
							begin
								result[0:7]<=reg_A[0:7]|reg_B[0:7];
								result[16:23]<=reg_A[16:23]|reg_B[16:23];
								result[32:39]<=reg_A[32:39]|reg_B[32:39];
								result[48:55]<=reg_A[48:55]|reg_B[48:55];
								result[64:71]<=reg_A[64:71]|reg_B[64:71];
								result[80:87]<=reg_A[80:87]|reg_B[80:87];
								result[96:103]<=reg_A[96:103]|reg_B[96:103];
								result[112:119]<=reg_A[112:119]|reg_B[112:119];
							end
							`w16:	// aluwor AND `ee AND `w16
							begin
								result[0:15]<=reg_A[0:15]|reg_B[0:15];
								result[32:47]<=reg_A[32:47]|reg_B[32:47];
								result[64:79]<=reg_A[64:79]|reg_B[64:79];
								result[96:111]<=reg_A[96:111]|reg_B[96:111];
							end
							`w32:	// aluwor AND `ee AND `w32
							begin
								result[0:31]<=reg_A[0:31]|reg_B[0:31];
								result[64:95]<=reg_A[64:95]|reg_B[64:95];
							end
							
							default:
							begin
								// aluwor AND `ee AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`oo:	// aluwor AND `oo
					begin
						case(ctrl_ww)
							`w8:	// aluwor AND `oo AND `w8
							begin
								result[8:15]<=reg_A[8:15]|reg_B[8:15];
								result[24:31]<=reg_A[24:31]|reg_B[24:31];
								result[40:47]<=reg_A[40:47]|reg_B[40:47];
								result[56:63]<=reg_A[56:63]|reg_B[56:63];
								result[72:79]<=reg_A[72:79]|reg_B[72:79];
								result[88:95]<=reg_A[88:95]|reg_B[88:95];
								result[104:111]<=reg_A[104:111]|reg_B[104:111];
								result[120:127]<=reg_A[120:127]|reg_B[120:127];
							end
							`w16:	// aluwor AND `oo AND `w16
							begin
								result[16:31]<=reg_A[16:31]|reg_B[16:31];
								result[48:63]<=reg_A[48:63]|reg_B[48:63];
								result[80:95]<=reg_A[80:95]|reg_B[80:95];
								result[112:127]<=reg_A[112:127]|reg_B[112:127];
							end
							`w32:	// aluwor AND `oo AND `w32
							begin
								result[32:63]<=reg_A[32:63]|reg_B[32:63];
								result[96:127]<=reg_A[96:127]|reg_B[96:127];
							end
							
							default:
							begin
								// aluwor AND `oo AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`mm:	// aluwor AND `mm
					begin
						case(ctrl_ww)
							`w8:	// aluwor AND `mm AND `w8
							begin
								result[0:7]<=reg_A[0:7]|reg_B[0:7];
							end
							`w16:	// aluwor AND `mm AND `w16
							begin
								result[0:15]<=reg_A[0:15]|reg_B[0:15];
							end
							`w32:	// aluwor AND `mm AND `w32
							begin
								result[0:31]<=reg_A[0:31]|reg_B[0:31];
							end
							
							default:
							begin
								// aluwor AND `mm AND `w8
								result<=128'd0;
							end
						endcase
					
					end
					`ll:	// aluwor AND `ll
					begin
						case(ctrl_ww)
							`w8:	// aluwor AND `ll AND `w8
							begin
								result[120:127]<=reg_A[120:127]|reg_B[120:127];
							end
							`w16:	// aluwor AND `ll AND `w16
							begin
								result[112:127]<=reg_A[112:127]|reg_B[112:127];
							end
							`w32:	// aluwor AND `ll AND `w32
							begin
								result[96:127]<=reg_A[96:127]|reg_B[96:127];
							end
							
							default:
							begin
								// aluwor AND `ll AND Default
								result<=128'd0;
							end
						endcase
					
					end
					default:	// aluwor AND Default
					begin
						result<=128'd0;
					end
				endcase
				
			end
			
			
			// ========================================================
			
			// XOR instruction
			`aluwxor:
			begin
				case(ctrl_ppp)
					`aa:	// aluwxor AND `aa
					begin
						case(ctrl_ww)
							`w8:	// aluwxor AND `aa AND `w8
							begin
								result[0:7]<=reg_A[0:7]^reg_B[0:7];
								result[8:15]<=reg_A[8:15]^reg_B[8:15];
								result[16:23]<=reg_A[16:23]^reg_B[16:23];
								result[24:31]<=reg_A[24:31]^reg_B[24:31];
								result[32:39]<=reg_A[32:39]^reg_B[32:39];
								result[40:47]<=reg_A[40:47]^reg_B[40:47];
								result[48:55]<=reg_A[48:55]^reg_B[48:55];
								result[56:63]<=reg_A[56:63]^reg_B[56:63];
								result[64:71]<=reg_A[64:71]^reg_B[64:71];
								result[72:79]<=reg_A[72:79]^reg_B[72:79];
								result[80:87]<=reg_A[80:87]^reg_B[80:87];
								result[88:95]<=reg_A[88:95]^reg_B[88:95];
								result[96:103]<=reg_A[96:103]^reg_B[96:103];
								result[104:111]<=reg_A[104:111]^reg_B[104:111];
								result[112:119]<=reg_A[112:119]^reg_B[112:119];
								result[120:127]<=reg_A[120:127]^reg_B[120:127];
							end
							`w16:	// aluwxor AND `aa AND `w16
							begin
								result[0:15]<=reg_A[0:15]^reg_B[0:15];
								result[16:31]<=reg_A[16:31]^reg_B[16:31];
								result[32:47]<=reg_A[32:47]^reg_B[32:47];
								result[48:63]<=reg_A[48:63]^reg_B[48:63];
								result[64:79]<=reg_A[64:79]^reg_B[64:79];
								result[80:95]<=reg_A[80:95]^reg_B[80:95];
								result[96:111]<=reg_A[96:111]^reg_B[96:111];
								result[112:127]<=reg_A[112:127]^reg_B[112:127];
							end
							`w32:	// aluwxor AND `aa AND `w32
							begin
								result[0:31]<=reg_A[0:31]^reg_B[0:31];
								result[32:63]<=reg_A[32:63]^reg_B[32:63];
								result[64:95]<=reg_A[64:95]^reg_B[64:95];
								result[96:127]<=reg_A[96:127]^reg_B[96:127];
							end
							
							default:	// aluwxor AND `aa AND Default
							begin
								result<=128'd0;
							end
						endcase
					
					end
					`uu:	// aluwxor AND `uu
					begin
						case(ctrl_ww)
							`w8:	// aluwxor AND `uu AND `w8
							begin
								result[0:7]<=reg_A[0:7]^reg_B[0:7];
								result[8:15]<=reg_A[8:15]^reg_B[8:15];
								result[16:23]<=reg_A[16:23]^reg_B[16:23];
								result[24:31]<=reg_A[24:31]^reg_B[24:31];
								result[32:39]<=reg_A[32:39]^reg_B[32:39];
								result[40:47]<=reg_A[40:47]^reg_B[40:47];
								result[48:55]<=reg_A[48:55]^reg_B[48:55];
								result[56:63]<=reg_A[56:63]^reg_B[56:63];
							end
							`w16:	// aluwxor AND `uu AND `w16
							begin
								result[0:15]<=reg_A[0:15]^reg_B[0:15];
								result[16:31]<=reg_A[16:31]^reg_B[16:31];
								result[32:47]<=reg_A[32:47]^reg_B[32:47];
								result[48:63]<=reg_A[48:63]^reg_B[48:63];
							end
							`w32:	// aluwxor AND `uu AND `w32
							begin
								result[0:31]<=reg_A[0:31]^reg_B[0:31];
								result[32:63]<=reg_A[32:63]^reg_B[32:63];
							end
							
							default:
							begin
								// aluwxor AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`dd:	// aluwxor AND `dd
					begin
						case(ctrl_ww)
							`w8:	// aluwxor AND `dd AND `w8
							begin
								result[64:71]<=reg_A[64:71]^reg_B[64:71];
								result[72:79]<=reg_A[72:79]^reg_B[72:79];
								result[80:87]<=reg_A[80:87]^reg_B[80:87];
								result[88:95]<=reg_A[88:95]^reg_B[88:95];
								result[96:103]<=reg_A[96:103]^reg_B[96:103];
								result[104:111]<=reg_A[104:111]^reg_B[104:111];
								result[112:119]<=reg_A[112:119]^reg_B[112:119];
								result[120:127]<=reg_A[120:127]^reg_B[120:127];
							end
							`w16:	// aluwxor AND `dd AND `w16
							begin
								result[64:79]<=reg_A[64:79]^reg_B[64:79];
								result[80:95]<=reg_A[80:95]^reg_B[80:95];
								result[96:111]<=reg_A[96:111]^reg_B[96:111];
								result[112:127]<=reg_A[112:127]^reg_B[112:127];
							end
							`w32:	// aluwxor AND `dd AND `w32
							begin
								result[64:95]<=reg_A[64:95]^reg_B[64:95];
								result[96:127]<=reg_A[96:127]^reg_B[96:127];
							end
							
							default:
							begin
									// aluwxor AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`ee:	// aluwxor AND `ee
					begin
						case(ctrl_ww)
							`w8:	// aluwxor AND `ee AND `w8
							begin
								result[0:7]<=reg_A[0:7]^reg_B[0:7];
								result[16:23]<=reg_A[16:23]^reg_B[16:23];
								result[32:39]<=reg_A[32:39]^reg_B[32:39];
								result[48:55]<=reg_A[48:55]^reg_B[48:55];
								result[64:71]<=reg_A[64:71]^reg_B[64:71];
								result[80:87]<=reg_A[80:87]^reg_B[80:87];
								result[96:103]<=reg_A[96:103]^reg_B[96:103];
								result[112:119]<=reg_A[112:119]^reg_B[112:119];
							end
							`w16:	// aluwxor AND `ee AND `w16
							begin
								result[0:15]<=reg_A[0:15]^reg_B[0:15];
								result[32:47]<=reg_A[32:47]^reg_B[32:47];
								result[64:79]<=reg_A[64:79]^reg_B[64:79];
								result[96:111]<=reg_A[96:111]^reg_B[96:111];
							end
							`w32:	// aluwxor AND `ee AND `w32
							begin
								result[0:31]<=reg_A[0:31]^reg_B[0:31];
								result[64:95]<=reg_A[64:95]^reg_B[64:95];
							end
							
							default:
							begin
								// aluwxor AND `ee AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`oo:	// aluwxor AND `oo
					begin
						case(ctrl_ww)
							`w8:	// aluwxor AND `oo AND `w8
							begin
								result[8:15]<=reg_A[8:15]^reg_B[8:15];
								result[24:31]<=reg_A[24:31]^reg_B[24:31];
								result[40:47]<=reg_A[40:47]^reg_B[40:47];
								result[56:63]<=reg_A[56:63]^reg_B[56:63];
								result[72:79]<=reg_A[72:79]^reg_B[72:79];
								result[88:95]<=reg_A[88:95]^reg_B[88:95];
								result[104:111]<=reg_A[104:111]^reg_B[104:111];
								result[120:127]<=reg_A[120:127]^reg_B[120:127];
							end
							`w16:	// aluwxor AND `oo AND `w16
							begin
								result[16:31]<=reg_A[16:31]^reg_B[16:31];
								result[48:63]<=reg_A[48:63]^reg_B[48:63];
								result[80:95]<=reg_A[80:95]^reg_B[80:95];
								result[112:127]<=reg_A[112:127]^reg_B[112:127];
							end
							`w32:	// aluwxor AND `oo AND `w32
							begin
								result[32:63]<=reg_A[32:63]^reg_B[32:63];
								result[96:127]<=reg_A[96:127]^reg_B[96:127];
							end
							
							default:
							begin
								// aluwxor AND `oo AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`mm:	// aluwxor AND `mm
					begin
						case(ctrl_ww)
							`w8:	// aluwxor AND `mm AND `w8
							begin
								result[0:7]<=reg_A[0:7]^reg_B[0:7];
							end
							`w16:	// aluwxor AND `mm AND `w16
							begin
								result[0:15]<=reg_A[0:15]^reg_B[0:15];
							end
							`w32:	// aluwxor AND `mm AND `w32
							begin
								result[0:31]<=reg_A[0:31]^reg_B[0:31];
							end
							
							default:
							begin
								// aluwxor AND `mm AND `w8
								result<=128'd0;
							end
						endcase
					
					end
					`ll:	// aluwxor AND `ll
					begin
						case(ctrl_ww)
							`w8:	// aluwxor AND `ll AND `w8
							begin
								result[120:127]<=reg_A[120:127]^reg_B[120:127];
							end
							`w16:	// aluwxor AND `ll AND `w16
							begin
								result[112:127]<=reg_A[112:127]^reg_B[112:127];
							end
							`w32:	// aluwxor AND `ll AND `w32
							begin
								result[96:127]<=reg_A[96:127]^reg_B[96:127];
							end
							
							default:
							begin
								// aluwxor AND `ll AND Default
								result<=128'd0;
							end
						endcase
					
					end
					default:	// aluwxor AND Default
					begin
						result<=128'd0;
					end
				endcase
				
			end

			
			// ======================================================
			
			// SUB instruction
			`aluwsub:
			begin
				case(ctrl_ppp)
					`aa:	// aluwsub AND `aa
					begin
						case(ctrl_ww)
							`w8:	// aluwsub AND `aa AND `w8
							begin
								result[0:7]<=reg_A[0:7]-reg_B[0:7];
								result[8:15]<=reg_A[8:15]-reg_B[8:15];
								result[16:23]<=reg_A[16:23]-reg_B[16:23];
								result[24:31]<=reg_A[24:31]-reg_B[24:31];
								result[32:39]<=reg_A[32:39]-reg_B[32:39];
								result[40:47]<=reg_A[40:47]-reg_B[40:47];
								result[48:55]<=reg_A[48:55]-reg_B[48:55];
								result[56:63]<=reg_A[56:63]-reg_B[56:63];
								result[64:71]<=reg_A[64:71]-reg_B[64:71];
								result[72:79]<=reg_A[72:79]-reg_B[72:79];
								result[80:87]<=reg_A[80:87]-reg_B[80:87];
								result[88:95]<=reg_A[88:95]-reg_B[88:95];
								result[96:103]<=reg_A[96:103]-reg_B[96:103];
								result[104:111]<=reg_A[104:111]-reg_B[104:111];
								result[112:119]<=reg_A[112:119]-reg_B[112:119];
								result[120:127]<=reg_A[120:127]-reg_B[120:127];
							end
							`w16:	// aluwsub AND `aa AND `w16
							begin
								result[0:15]<=reg_A[0:15]-reg_B[0:15];
								result[16:31]<=reg_A[16:31]-reg_B[16:31];
								result[32:47]<=reg_A[32:47]-reg_B[32:47];
								result[48:63]<=reg_A[48:63]-reg_B[48:63];
								result[64:79]<=reg_A[64:79]-reg_B[64:79];
								result[80:95]<=reg_A[80:95]-reg_B[80:95];
								result[96:111]<=reg_A[96:111]-reg_B[96:111];
								result[112:127]<=reg_A[112:127]-reg_B[112:127];
							end
							`w32:	// aluwsub AND `aa AND `w32
							begin
								result[0:31]<=reg_A[0:31]-reg_B[0:31];
								result[32:63]<=reg_A[32:63]-reg_B[32:63];
								result[64:95]<=reg_A[64:95]-reg_B[64:95];
								result[96:127]<=reg_A[96:127]-reg_B[96:127];
							end
							
							default:	// aluwsub AND `aa AND Default
							begin
								result<=128'd0;
							end
						endcase
					
					end
					`uu:	// aluwsub AND `uu
					begin
						case(ctrl_ww)
							`w8:	// aluwsub AND `uu AND `w8
							begin
								result[0:7]<=reg_A[0:7]-reg_B[0:7];
								result[8:15]<=reg_A[8:15]-reg_B[8:15];
								result[16:23]<=reg_A[16:23]-reg_B[16:23];
								result[24:31]<=reg_A[24:31]-reg_B[24:31];
								result[32:39]<=reg_A[32:39]-reg_B[32:39];
								result[40:47]<=reg_A[40:47]-reg_B[40:47];
								result[48:55]<=reg_A[48:55]-reg_B[48:55];
								result[56:63]<=reg_A[56:63]-reg_B[56:63];
							end
							`w16:	// aluwsub AND `uu AND `w16
							begin
								result[0:15]<=reg_A[0:15]-reg_B[0:15];
								result[16:31]<=reg_A[16:31]-reg_B[16:31];
								result[32:47]<=reg_A[32:47]-reg_B[32:47];
								result[48:63]<=reg_A[48:63]-reg_B[48:63];
							end
							`w32:	// aluwsub AND `uu AND `w32
							begin
								result[0:31]<=reg_A[0:31]-reg_B[0:31];
								result[32:63]<=reg_A[32:63]-reg_B[32:63];
							end
							
							default:
							begin
								// aluwsub AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`dd:	// aluwsub AND `dd
					begin
						case(ctrl_ww)
							`w8:	// aluwsub AND `dd AND `w8
							begin
								result[64:71]<=reg_A[64:71]-reg_B[64:71];
								result[72:79]<=reg_A[72:79]-reg_B[72:79];
								result[80:87]<=reg_A[80:87]-reg_B[80:87];
								result[88:95]<=reg_A[88:95]-reg_B[88:95];
								result[96:103]<=reg_A[96:103]-reg_B[96:103];
								result[104:111]<=reg_A[104:111]-reg_B[104:111];
								result[112:119]<=reg_A[112:119]-reg_B[112:119];
								result[120:127]<=reg_A[120:127]-reg_B[120:127];
							end
							`w16:	// aluwsub AND `dd AND `w16
							begin
								result[64:79]<=reg_A[64:79]-reg_B[64:79];
								result[80:95]<=reg_A[80:95]-reg_B[80:95];
								result[96:111]<=reg_A[96:111]-reg_B[96:111];
								result[112:127]<=reg_A[112:127]-reg_B[112:127];
							end
							`w32:	// aluwsub AND `dd AND `w32
							begin
								result[64:95]<=reg_A[64:95]-reg_B[64:95];
								result[96:127]<=reg_A[96:127]-reg_B[96:127];
							end
							
							default:
							begin
									// aluwsub AND `dd AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`ee:	// aluwsub AND `ee
					begin
						case(ctrl_ww)
							`w8:	// aluwsub AND `ee AND `w8
							begin
								result[0:7]<=reg_A[0:7]-reg_B[0:7];
								result[16:23]<=reg_A[16:23]-reg_B[16:23];
								result[32:39]<=reg_A[32:39]-reg_B[32:39];
								result[48:55]<=reg_A[48:55]-reg_B[48:55];
								result[64:71]<=reg_A[64:71]-reg_B[64:71];
								result[80:87]<=reg_A[80:87]-reg_B[80:87];
								result[96:103]<=reg_A[96:103]-reg_B[96:103];
								result[112:119]<=reg_A[112:119]-reg_B[112:119];
							end
							`w16:	// aluwsub AND `ee AND `w16
							begin
								result[0:15]<=reg_A[0:15]-reg_B[0:15];
								result[32:47]<=reg_A[32:47]-reg_B[32:47];
								result[64:79]<=reg_A[64:79]-reg_B[64:79];
								result[96:111]<=reg_A[96:111]-reg_B[96:111];
							end
							`w32:	// aluwsub AND `ee AND `w32
							begin
								result[0:31]<=reg_A[0:31]-reg_B[0:31];
								result[64:95]<=reg_A[64:95]-reg_B[64:95];
							end
							
							default:
							begin
								// aluwsub AND `ee AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`oo:	// aluwsub AND `oo
					begin
						case(ctrl_ww)
							`w8:	// aluwsub AND `oo AND `w8
							begin
								result[8:15]<=reg_A[8:15]-reg_B[8:15];
								result[24:31]<=reg_A[24:31]-reg_B[24:31];
								result[40:47]<=reg_A[40:47]-reg_B[40:47];
								result[56:63]<=reg_A[56:63]-reg_B[56:63];
								result[72:79]<=reg_A[72:79]-reg_B[72:79];
								result[88:95]<=reg_A[88:95]-reg_B[88:95];
								result[104:111]<=reg_A[104:111]-reg_B[104:111];
								result[120:127]<=reg_A[120:127]-reg_B[120:127];
							end
							`w16:	// aluwsub AND `oo AND `w16
							begin
								result[16:31]<=reg_A[16:31]-reg_B[16:31];
								result[48:63]<=reg_A[48:63]-reg_B[48:63];
								result[80:95]<=reg_A[80:95]-reg_B[80:95];
								result[112:127]<=reg_A[112:127]-reg_B[112:127];
							end
							`w32:	// aluwsub AND `oo AND `w32
							begin
								result[32:63]<=reg_A[32:63]-reg_B[32:63];
								result[96:127]<=reg_A[96:127]-reg_B[96:127];
							end
							
							default:
							begin
								// aluwsub AND `oo AND Default
								result<=128'd0;
							end
						endcase
					
					end
					`mm:	// aluwsub AND `mm
					begin
						case(ctrl_ww)
							`w8:	// aluwsub AND `mm AND `w8
							begin
								result[0:7]<=reg_A[0:7]-reg_B[0:7];
							end
							`w16:	// aluwsub AND `mm AND `w16
							begin
								result[0:15]<=reg_A[0:15]-reg_B[0:15];
							end
							`w32:	// aluwsub AND `mm AND `w32
							begin
								result[0:31]<=reg_A[0:31]-reg_B[0:31];
							end
							
							default:
							begin
								// aluwsub AND `mm AND `w8
								result<=128'd0;
							end
						endcase
					
					end
					`ll:	// aluwsub AND `ll
					begin
						case(ctrl_ww)
							`w8:	// aluwsub AND `ll AND `w8
							begin
								result[120:127]<=reg_A[120:127]-reg_B[120:127];
							end
							`w16:	// aluwsub AND `ll AND `w16
							begin
								result[112:127]<=reg_A[112:127]-reg_B[112:127];
							end
							`w32:	// aluwsub AND `ll AND `w32
							begin
								result[96:127]<=reg_A[96:127]-reg_B[96:127];
							end
							
							default:
							begin
								// aluwsub AND `ll AND Default
								result<=128'd0;
							end
						endcase
					
					end
					default:	// aluwsub AND Default
					begin
						result<=128'd0;
					end
				endcase
				
			end

			

//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================



			// ==============================================================
			
			// PRM instruction
			
			`aluwprm:
				begin
				case(reg_B[4:7]) //byte0
				4'd0:
					result[0:7]<=reg_A[0:7];
				4'd1:
					result[0:7]<=reg_A[8:15];
				4'd2:
					result[0:7]<=reg_A[16:23];
				4'd3:
					result[0:7]<=reg_A[24:31];
				4'd4:
					result[0:7]<=reg_A[32:39];
				4'd5:
					result[0:7]<=reg_A[40:47];
				4'd6:
					result[0:7]<=reg_A[48:55];
				4'd7:
					result[0:7]<=reg_A[56:63];
				4'd8:
					result[0:7]<=reg_A[64:71];
				4'd9:
					result[0:7]<=reg_A[72:79];
				4'd10:
					result[0:7]<=reg_A[80:87];
				4'd11:
					result[0:7]<=reg_A[88:95];
				4'd12:
					result[0:7]<=reg_A[96:103];
				4'd13:
					result[0:7]<=reg_A[104:111];
				4'd14:
					result[0:7]<=reg_A[112:119];
				4'd15:
					result[0:7]<=reg_A[120:127];
				endcase

				case(reg_B[12:15]) //byte1
				4'd0:
					result[8:15]<=reg_A[0:7];
				4'd1:
					result[8:15]<=reg_A[8:15];
				4'd2:
					result[8:15]<=reg_A[16:23];
				4'd3:
					result[8:15]<=reg_A[24:31];
				4'd4:
					result[8:15]<=reg_A[32:39];
				4'd5:
					result[8:15]<=reg_A[40:47];
				4'd6:
					result[8:15]<=reg_A[48:55];
				4'd7:
					result[8:15]<=reg_A[56:63];
				4'd8:
					result[8:15]<=reg_A[64:71];
				4'd9:
					result[8:15]<=reg_A[72:79];
				4'd10:
					result[8:15]<=reg_A[80:87];
				4'd11:
					result[8:15]<=reg_A[88:95];
				4'd12:
					result[8:15]<=reg_A[96:103];
				4'd13:
					result[8:15]<=reg_A[104:111];
				4'd14:
					result[8:15]<=reg_A[112:119];
				4'd15:
					result[8:15]<=reg_A[120:127];
				endcase

				case(reg_B[20:23]) //byte2
				4'd0:
					result[16:23]<=reg_A[0:7];
				4'd1:
					result[16:23]<=reg_A[8:15];
				4'd2:
					result[16:23]<=reg_A[16:23];
				4'd3:
					result[16:23]<=reg_A[24:31];
				4'd4:
					result[16:23]<=reg_A[32:39];
				4'd5:
					result[16:23]<=reg_A[40:47];
				4'd6:
					result[16:23]<=reg_A[48:55];
				4'd7:
					result[16:23]<=reg_A[56:63];
				4'd8:
					result[16:23]<=reg_A[64:71];
				4'd9:
					result[16:23]<=reg_A[72:79];
				4'd10:
					result[16:23]<=reg_A[80:87];
				4'd11:
					result[16:23]<=reg_A[88:95];
				4'd12:
					result[16:23]<=reg_A[96:103];
				4'd13:
					result[16:23]<=reg_A[104:111];
				4'd14:
					result[16:23]<=reg_A[112:119];
				4'd15:
					result[16:23]<=reg_A[120:127];
				endcase

				case(reg_B[28:31]) //byte3
				4'd0:
					result[24:31]<=reg_A[0:7];
				4'd1:
					result[24:31]<=reg_A[8:15];
				4'd2:
					result[24:31]<=reg_A[16:23];
				4'd3:
					result[24:31]<=reg_A[24:31];
				4'd4:
					result[24:31]<=reg_A[32:39];
				4'd5:
					result[24:31]<=reg_A[40:47];
				4'd6:
					result[24:31]<=reg_A[48:55];
				4'd7:
					result[24:31]<=reg_A[56:63];
				4'd8:
					result[24:31]<=reg_A[64:71];
				4'd9:
					result[24:31]<=reg_A[72:79];
				4'd10:
					result[24:31]<=reg_A[80:87];
				4'd11:
					result[24:31]<=reg_A[88:95];
				4'd12:
					result[24:31]<=reg_A[96:103];
				4'd13:
					result[24:31]<=reg_A[104:111];
				4'd14:
					result[24:31]<=reg_A[112:119];
				4'd15:
					result[24:31]<=reg_A[120:127];
				endcase

				case(reg_B[36:39]) //byte4
				4'd0:
					result[32:39]<=reg_A[0:7];
				4'd1:
					result[32:39]<=reg_A[8:15];
				4'd2:
					result[32:39]<=reg_A[16:23];
				4'd3:
					result[32:39]<=reg_A[24:31];
				4'd4:
					result[32:39]<=reg_A[32:39];
				4'd5:
					result[32:39]<=reg_A[40:47];
				4'd6:
					result[32:39]<=reg_A[48:55];
				4'd7:
					result[32:39]<=reg_A[56:63];
				4'd8:
					result[32:39]<=reg_A[64:71];
				4'd9:
					result[32:39]<=reg_A[72:79];
				4'd10:
					result[32:39]<=reg_A[80:87];
				4'd11:
					result[32:39]<=reg_A[88:95];
				4'd12:
					result[32:39]<=reg_A[96:103];
				4'd13:
					result[32:39]<=reg_A[104:111];
				4'd14:
					result[32:39]<=reg_A[112:119];
				4'd15:
					result[32:39]<=reg_A[120:127];
				endcase

				case(reg_B[44:47]) //byte5
				4'd0:
					result[40:47]<=reg_A[0:7];
				4'd1:
					result[40:47]<=reg_A[8:15];
				4'd2:
					result[40:47]<=reg_A[16:23];
				4'd3:
					result[40:47]<=reg_A[24:31];
				4'd4:
					result[40:47]<=reg_A[32:39];
				4'd5:
					result[40:47]<=reg_A[40:47];
				4'd6:
					result[40:47]<=reg_A[48:55];
				4'd7:
					result[40:47]<=reg_A[56:63];
				4'd8:
					result[40:47]<=reg_A[64:71];
				4'd9:
					result[40:47]<=reg_A[72:79];
				4'd10:
					result[40:47]<=reg_A[80:87];
				4'd11:
					result[40:47]<=reg_A[88:95];
				4'd12:
					result[40:47]<=reg_A[96:103];
				4'd13:
					result[40:47]<=reg_A[104:111];
				4'd14:
					result[40:47]<=reg_A[112:119];
				4'd15:
					result[40:47]<=reg_A[120:127];
				endcase

				case(reg_B[52:55]) //byte6
				4'd0:
					result[48:55]<=reg_A[0:7];
				4'd1:
					result[48:55]<=reg_A[8:15];
				4'd2:
					result[48:55]<=reg_A[16:23];
				4'd3:
					result[48:55]<=reg_A[24:31];
				4'd4:
					result[48:55]<=reg_A[32:39];
				4'd5:
					result[48:55]<=reg_A[40:47];
				4'd6:
					result[48:55]<=reg_A[48:55];
				4'd7:
					result[48:55]<=reg_A[56:63];
				4'd8:
					result[48:55]<=reg_A[64:71];
				4'd9:
					result[48:55]<=reg_A[72:79];
				4'd10:
					result[48:55]<=reg_A[80:87];
				4'd11:
					result[48:55]<=reg_A[88:95];
				4'd12:
					result[48:55]<=reg_A[96:103];
				4'd13:
					result[48:55]<=reg_A[104:111];
				4'd14:
					result[48:55]<=reg_A[112:119];
				4'd15:
					result[48:55]<=reg_A[120:127];
				endcase

				case(reg_B[60:63]) //byte7
				4'd0:
					result[56:63]<=reg_A[0:7];
				4'd1:
					result[56:63]<=reg_A[8:15];
				4'd2:
					result[56:63]<=reg_A[16:23];
				4'd3:
					result[56:63]<=reg_A[24:31];
				4'd4:
					result[56:63]<=reg_A[32:39];
				4'd5:
					result[56:63]<=reg_A[40:47];
				4'd6:
					result[56:63]<=reg_A[48:55];
				4'd7:
					result[56:63]<=reg_A[56:63];
				4'd8:
					result[56:63]<=reg_A[64:71];
				4'd9:
					result[56:63]<=reg_A[72:79];
				4'd10:
					result[56:63]<=reg_A[80:87];
				4'd11:
					result[56:63]<=reg_A[88:95];
				4'd12:
					result[56:63]<=reg_A[96:103];
				4'd13:
					result[56:63]<=reg_A[104:111];
				4'd14:
					result[56:63]<=reg_A[112:119];
				4'd15:
					result[56:63]<=reg_A[120:127];
				endcase

				case(reg_B[68:71]) //byte8
				4'd0:
					result[64:71]<=reg_A[0:7];
				4'd1:
					result[64:71]<=reg_A[8:15];
				4'd2:
					result[64:71]<=reg_A[16:23];
				4'd3:
					result[64:71]<=reg_A[24:31];
				4'd4:
					result[64:71]<=reg_A[32:39];
				4'd5:
					result[64:71]<=reg_A[40:47];
				4'd6:
					result[64:71]<=reg_A[48:55];
				4'd7:
					result[64:71]<=reg_A[56:63];
				4'd8:
					result[64:71]<=reg_A[64:71];
				4'd9:
					result[64:71]<=reg_A[72:79];
				4'd10:
					result[64:71]<=reg_A[80:87];
				4'd11:
					result[64:71]<=reg_A[88:95];
				4'd12:
					result[64:71]<=reg_A[96:103];
				4'd13:
					result[64:71]<=reg_A[104:111];
				4'd14:
					result[64:71]<=reg_A[112:119];
				4'd15:
					result[64:71]<=reg_A[120:127];
				endcase

				case(reg_B[76:79]) //byte9
				4'd0:
					result[72:79]<=reg_A[0:7];
				4'd1:
					result[72:79]<=reg_A[8:15];
				4'd2:
					result[72:79]<=reg_A[16:23];
				4'd3:
					result[72:79]<=reg_A[24:31];
				4'd4:
					result[72:79]<=reg_A[32:39];
				4'd5:
					result[72:79]<=reg_A[40:47];
				4'd6:
					result[72:79]<=reg_A[48:55];
				4'd7:
					result[72:79]<=reg_A[56:63];
				4'd8:
					result[72:79]<=reg_A[64:71];
				4'd9:
					result[72:79]<=reg_A[72:79];
				4'd10:
					result[72:79]<=reg_A[80:87];
				4'd11:
					result[72:79]<=reg_A[88:95];
				4'd12:
					result[72:79]<=reg_A[96:103];
				4'd13:
					result[72:79]<=reg_A[104:111];
				4'd14:
					result[72:79]<=reg_A[112:119];
				4'd15:
					result[72:79]<=reg_A[120:127];
				endcase

				case(reg_B[84:87]) //byte10
				4'd0:
					result[80:87]<=reg_A[0:7];
				4'd1:
					result[80:87]<=reg_A[8:15];
				4'd2:
					result[80:87]<=reg_A[16:23];
				4'd3:
					result[80:87]<=reg_A[24:31];
				4'd4:
					result[80:87]<=reg_A[32:39];
				4'd5:
					result[80:87]<=reg_A[40:47];
				4'd6:
					result[80:87]<=reg_A[48:55];
				4'd7:
					result[80:87]<=reg_A[56:63];
				4'd8:
					result[80:87]<=reg_A[64:71];
				4'd9:
					result[80:87]<=reg_A[72:79];
				4'd10:
					result[80:87]<=reg_A[80:87];
				4'd11:
					result[80:87]<=reg_A[88:95];
				4'd12:
					result[80:87]<=reg_A[96:103];
				4'd13:
					result[80:87]<=reg_A[104:111];
				4'd14:
					result[80:87]<=reg_A[112:119];
				4'd15:
					result[80:87]<=reg_A[120:127];
				endcase

				case(reg_B[92:95]) //byte11
				4'd0:
					result[88:95]<=reg_A[0:7];
				4'd1:
					result[88:95]<=reg_A[8:15];
				4'd2:
					result[88:95]<=reg_A[16:23];
				4'd3:
					result[88:95]<=reg_A[24:31];
				4'd4:
					result[88:95]<=reg_A[32:39];
				4'd5:
					result[88:95]<=reg_A[40:47];
				4'd6:
					result[88:95]<=reg_A[48:55];
				4'd7:
					result[88:95]<=reg_A[56:63];
				4'd8:
					result[88:95]<=reg_A[64:71];
				4'd9:
					result[88:95]<=reg_A[72:79];
				4'd10:
					result[88:95]<=reg_A[80:87];
				4'd11:
					result[88:95]<=reg_A[88:95];
				4'd12:
					result[88:95]<=reg_A[96:103];
				4'd13:
					result[88:95]<=reg_A[104:111];
				4'd14:
					result[88:95]<=reg_A[112:119];
				4'd15:
					result[88:95]<=reg_A[120:127];
				endcase

				case(reg_B[100:103]) //byte12
				4'd0:
					result[96:103]<=reg_A[0:7];
				4'd1:
					result[96:103]<=reg_A[8:15];
				4'd2:
					result[96:103]<=reg_A[16:23];
				4'd3:
					result[96:103]<=reg_A[24:31];
				4'd4:
					result[96:103]<=reg_A[32:39];
				4'd5:
					result[96:103]<=reg_A[40:47];
				4'd6:
					result[96:103]<=reg_A[48:55];
				4'd7:
					result[96:103]<=reg_A[56:63];
				4'd8:
					result[96:103]<=reg_A[64:71];
				4'd9:
					result[96:103]<=reg_A[72:79];
				4'd10:
					result[96:103]<=reg_A[80:87];
				4'd11:
					result[96:103]<=reg_A[88:95];
				4'd12:
					result[96:103]<=reg_A[96:103];
				4'd13:
					result[96:103]<=reg_A[104:111];
				4'd14:
					result[96:103]<=reg_A[112:119];
				4'd15:
					result[96:103]<=reg_A[120:127];
				endcase

				case(reg_B[108:111]) //byte13
				4'd0:
					result[104:111]<=reg_A[0:7];
				4'd1:
					result[104:111]<=reg_A[8:15];
				4'd2:
					result[104:111]<=reg_A[16:23];
				4'd3:
					result[104:111]<=reg_A[24:31];
				4'd4:
					result[104:111]<=reg_A[32:39];
				4'd5:
					result[104:111]<=reg_A[40:47];
				4'd6:
					result[104:111]<=reg_A[48:55];
				4'd7:
					result[104:111]<=reg_A[56:63];
				4'd8:
					result[104:111]<=reg_A[64:71];
				4'd9:
					result[104:111]<=reg_A[72:79];
				4'd10:
					result[104:111]<=reg_A[80:87];
				4'd11:
					result[104:111]<=reg_A[88:95];
				4'd12:
					result[104:111]<=reg_A[96:103];
				4'd13:
					result[104:111]<=reg_A[104:111];
				4'd14:
					result[104:111]<=reg_A[112:119];
				4'd15:
					result[104:111]<=reg_A[120:127];
				endcase

				case(reg_B[116:119]) //byte14
				4'd0:
					result[112:119]<=reg_A[112:119];
				4'd1:
					result[112:119]<=reg_A[8:15];
				4'd2:
					result[112:119]<=reg_A[16:23];
				4'd3:
					result[112:119]<=reg_A[24:31];
				4'd4:
					result[112:119]<=reg_A[32:39];
				4'd5:
					result[112:119]<=reg_A[40:47];
				4'd6:
					result[112:119]<=reg_A[48:55];
				4'd7:
					result[112:119]<=reg_A[56:63];
				4'd8:
					result[112:119]<=reg_A[64:71];
				4'd9:
					result[112:119]<=reg_A[72:79];
				4'd10:
					result[112:119]<=reg_A[80:87];
				4'd11:
					result[112:119]<=reg_A[88:95];
				4'd12:
					result[112:119]<=reg_A[96:103];
				4'd13:
					result[112:119]<=reg_A[104:111];
				4'd14:
					result[112:119]<=reg_A[112:119];
				4'd15:
					result[112:119]<=reg_A[120:127];
				endcase

				case(reg_B[124:127]) //byte15
				4'd0:
					result[120:127]<=reg_A[0:7];
				4'd1:
					result[120:127]<=reg_A[8:15];
				4'd2:
					result[120:127]<=reg_A[16:23];
				4'd3:
					result[120:127]<=reg_A[24:31];
				4'd4:
					result[120:127]<=reg_A[32:39];
				4'd5:
					result[120:127]<=reg_A[40:47];
				4'd6:
					result[120:127]<=reg_A[48:55];
				4'd7:
					result[120:127]<=reg_A[56:63];
				4'd8:
					result[120:127]<=reg_A[64:71];
				4'd9:
					result[120:127]<=reg_A[72:79];
				4'd10:
					result[120:127]<=reg_A[80:87];
				4'd11:
					result[120:127]<=reg_A[88:95];
				4'd12:
					result[120:127]<=reg_A[96:103];
				4'd13:
					result[120:127]<=reg_A[104:111];
				4'd14:
					result[120:127]<=reg_A[112:119];
				4'd15:
					result[120:127]<=reg_A[120:127];
				endcase

				end
			
			
			
/*
 * ========================================================
 *=========================================================
 *========================================================
 *=========================================================
 *========================================================
 *========================================================
 *=======================================================
 *========================================================
 *=======================================================
 *=======================================================
  *=========================================================
 *========================================================
 *=========================================================
 *========================================================
 *========================================================
 *=======================================================
 *========================================================
 *=======================================================
 *=======================================================
  *=========================================================
 *========================================================
 *=========================================================
 *========================================================
 *========================================================
 *=======================================================
 *========================================================
 *=======================================================
 *=======================================================
  *=========================================================
 *========================================================
 *=========================================================
 *========================================================
 *========================================================
 *=======================================================
 *========================================================
 *=======================================================
 *=======================================================
  *=========================================================
 *========================================================
 *=========================================================
 *========================================================
 *========================================================
 *=======================================================
 *========================================================
 *=======================================================
 *=======================================================
 */
			
			
			
			// ==============================================================
			
			// SLLI instruction
			
			`aluwslli:
			begin
			case(ctrl_ww)
				`w8:
				begin
				case(reg_B[2:4])
					3'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					3'd1:
						begin
						result[0:7]<={reg_A[1:7],{1'b0}};
						result[8:15]<={reg_A[9:15],{1'b0}};
						result[16:23]<={reg_A[17:23],{1'b0}};
						result[24:31]<={reg_A[25:31],{1'b0}};
						result[32:39]<={reg_A[33:39],{1'b0}};
						result[40:47]<={reg_A[41:47],{1'b0}};
						result[48:55]<={reg_A[49:55],{1'b0}};
						result[56:63]<={reg_A[57:63],{1'b0}};
						result[64:71]<={reg_A[65:71],{1'b0}};
						result[72:79]<={reg_A[73:79],{1'b0}};
						result[80:87]<={reg_A[81:87],{1'b0}};
						result[88:95]<={reg_A[89:95],{1'b0}};
						result[96:103]<={reg_A[97:103],{1'b0}};
						result[104:111]<={reg_A[105:111],{1'b0}};
						result[112:119]<={reg_A[113:119],{1'b0}};
						result[120:127]<={reg_A[121:127],{1'b0}};
						end
					3'd2:
						begin
						result[0:7]<={reg_A[2:7],{2{1'b0}}};
						result[8:15]<={reg_A[10:15],{2{1'b0}}};
						result[16:23]<={reg_A[18:23],{2{1'b0}}};
						result[24:31]<={reg_A[26:31],{2{1'b0}}};
						result[32:39]<={reg_A[34:39],{2{1'b0}}};
						result[40:47]<={reg_A[42:47],{2{1'b0}}};
						result[48:55]<={reg_A[50:55],{2{1'b0}}};
						result[56:63]<={reg_A[58:63],{2{1'b0}}};
						result[64:71]<={reg_A[66:71],{2{1'b0}}};
						result[72:79]<={reg_A[74:79],{2{1'b0}}};
						result[80:87]<={reg_A[82:87],{2{1'b0}}};
						result[88:95]<={reg_A[90:95],{2{1'b0}}};
						result[96:103]<={reg_A[98:103],{2{1'b0}}};
						result[104:111]<={reg_A[106:111],{2{1'b0}}};
						result[112:119]<={reg_A[114:119],{2{1'b0}}};
						result[120:127]<={reg_A[122:127],{2{1'b0}}};
						end
					3'd3:
						begin
						result[0:7]<={reg_A[3:7],{3{1'b0}}};
						result[8:15]<={reg_A[11:15],{3{1'b0}}};
						result[16:23]<={reg_A[19:23],{3{1'b0}}};
						result[24:31]<={reg_A[27:31],{3{1'b0}}};
						result[32:39]<={reg_A[35:39],{3{1'b0}}};
						result[40:47]<={reg_A[43:47],{3{1'b0}}};
						result[48:55]<={reg_A[51:55],{3{1'b0}}};
						result[56:63]<={reg_A[59:63],{3{1'b0}}};
						result[64:71]<={reg_A[67:71],{3{1'b0}}};
						result[72:79]<={reg_A[75:79],{3{1'b0}}};
						result[80:87]<={reg_A[83:87],{3{1'b0}}};
						result[88:95]<={reg_A[91:95],{3{1'b0}}};
						result[96:103]<={reg_A[99:103],{3{1'b0}}};
						result[104:111]<={reg_A[107:111],{3{1'b0}}};
						result[112:119]<={reg_A[115:119],{3{1'b0}}};
						result[120:127]<={reg_A[123:127],{3{1'b0}}};
						end
					3'd4:
						begin
						result[0:7]<={reg_A[4:7],{4{1'b0}}};
						result[8:15]<={reg_A[12:15],{4{1'b0}}};
						result[16:23]<={reg_A[20:23],{4{1'b0}}};
						result[24:31]<={reg_A[28:31],{4{1'b0}}};
						result[32:39]<={reg_A[36:39],{4{1'b0}}};
						result[40:47]<={reg_A[44:47],{4{1'b0}}};
						result[48:55]<={reg_A[52:55],{4{1'b0}}};
						result[56:63]<={reg_A[60:63],{4{1'b0}}};
						result[64:71]<={reg_A[68:71],{4{1'b0}}};
						result[72:79]<={reg_A[76:79],{4{1'b0}}};
						result[80:87]<={reg_A[84:87],{4{1'b0}}};
						result[88:95]<={reg_A[92:95],{4{1'b0}}};
						result[96:103]<={reg_A[100:103],{4{1'b0}}};
						result[104:111]<={reg_A[108:111],{4{1'b0}}};
						result[112:119]<={reg_A[116:119],{4{1'b0}}};
						result[120:127]<={reg_A[124:127],{4{1'b0}}};
						end
					3'd5:
						begin
						result[0:7]<={reg_A[5:7],{5{1'b0}}};
						result[8:15]<={reg_A[13:15],{5{1'b0}}};
						result[16:23]<={reg_A[21:23],{5{1'b0}}};
						result[24:31]<={reg_A[29:31],{5{1'b0}}};
						result[32:39]<={reg_A[37:39],{5{1'b0}}};
						result[40:47]<={reg_A[45:47],{5{1'b0}}};
						result[48:55]<={reg_A[53:55],{5{1'b0}}};
						result[56:63]<={reg_A[61:63],{5{1'b0}}};
						result[64:71]<={reg_A[69:71],{5{1'b0}}};
						result[72:79]<={reg_A[77:79],{5{1'b0}}};
						result[80:87]<={reg_A[85:87],{5{1'b0}}};
						result[88:95]<={reg_A[93:95],{5{1'b0}}};
						result[96:103]<={reg_A[101:103],{5{1'b0}}};
						result[104:111]<={reg_A[109:111],{5{1'b0}}};
						result[112:119]<={reg_A[117:119],{5{1'b0}}};
						result[120:127]<={reg_A[125:127],{5{1'b0}}};
						end
					3'd6:
						begin
						result[0:7]<={reg_A[6:7],{6{1'b0}}};
						result[8:15]<={reg_A[14:15],{6{1'b0}}};
						result[16:23]<={reg_A[22:23],{6{1'b0}}};
						result[24:31]<={reg_A[30:31],{6{1'b0}}};
						result[32:39]<={reg_A[38:39],{6{1'b0}}};
						result[40:47]<={reg_A[46:47],{6{1'b0}}};
						result[48:55]<={reg_A[54:55],{6{1'b0}}};
						result[56:63]<={reg_A[62:63],{6{1'b0}}};
						result[64:71]<={reg_A[70:71],{6{1'b0}}};
						result[72:79]<={reg_A[78:79],{6{1'b0}}};
						result[80:87]<={reg_A[86:87],{6{1'b0}}};
						result[88:95]<={reg_A[94:95],{6{1'b0}}};
						result[96:103]<={reg_A[102:103],{6{1'b0}}};
						result[104:111]<={reg_A[110:111],{6{1'b0}}};
						result[112:119]<={reg_A[118:119],{6{1'b0}}};
						result[120:127]<={reg_A[126:127],{6{1'b0}}};
						end
					3'd7:
						begin
						result[0:7]<={reg_A[7],{7{1'b0}}};
						result[8:15]<={reg_A[15],{7{1'b0}}};
						result[16:23]<={reg_A[23],{7{1'b0}}};
						result[24:31]<={reg_A[31],{7{1'b0}}};
						result[32:39]<={reg_A[39],{7{1'b0}}};
						result[40:47]<={reg_A[47],{7{1'b0}}};
						result[48:55]<={reg_A[55],{7{1'b0}}};
						result[56:63]<={reg_A[63],{7{1'b0}}};
						result[64:71]<={reg_A[71],{7{1'b0}}};
						result[72:79]<={reg_A[79],{7{1'b0}}};
						result[80:87]<={reg_A[87],{7{1'b0}}};
						result[88:95]<={reg_A[95],{7{1'b0}}};
						result[96:103]<={reg_A[103],{7{1'b0}}};
						result[104:111]<={reg_A[111],{7{1'b0}}};
						result[112:119]<={reg_A[119],{7{1'b0}}};
						result[120:127]<={reg_A[127],{7{1'b0}}};
						end
				endcase
				end
				`w16:
				begin
				case(reg_B[1:4])
					4'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					4'd1:
						begin
						result[0:15]<={reg_A[1:15],{1'b0}};
						result[16:31]<={reg_A[17:31],{1'b0}};
						result[32:47]<={reg_A[33:47],{1'b0}};
						result[48:63]<={reg_A[49:63],{1'b0}};
						result[64:79]<={reg_A[65:79],{1'b0}};
						result[80:95]<={reg_A[81:95],{1'b0}};
						result[96:111]<={reg_A[97:111],{1'b0}};
						result[112:127]<={reg_A[113:127],{1'b0}};
						end
					4'd2:
						begin
						result[0:15]<={reg_A[2:15],{2{1'b0}}};
						result[16:31]<={reg_A[18:31],{2{1'b0}}};
						result[32:47]<={reg_A[34:47],{2{1'b0}}};
						result[48:63]<={reg_A[50:63],{2{1'b0}}};
						result[64:79]<={reg_A[66:79],{2{1'b0}}};
						result[80:95]<={reg_A[82:95],{2{1'b0}}};
						result[96:111]<={reg_A[98:111],{2{1'b0}}};
						result[112:127]<={reg_A[114:127],{2{1'b0}}};
						end
					4'd3:
						begin
						result[0:15]<={reg_A[3:15],{3{1'b0}}};
						result[16:31]<={reg_A[19:31],{3{1'b0}}};
						result[32:47]<={reg_A[35:47],{3{1'b0}}};
						result[48:63]<={reg_A[51:63],{3{1'b0}}};
						result[64:79]<={reg_A[67:79],{3{1'b0}}};
						result[80:95]<={reg_A[83:95],{3{1'b0}}};
						result[96:111]<={reg_A[99:111],{3{1'b0}}};
						result[112:127]<={reg_A[115:127],{3{1'b0}}};
						end
					4'd4:
						begin
						result[0:15]<={reg_A[4:15],{4{1'b0}}};
						result[16:31]<={reg_A[20:31],{4{1'b0}}};
						result[32:47]<={reg_A[36:47],{4{1'b0}}};
						result[48:63]<={reg_A[52:63],{4{1'b0}}};
						result[64:79]<={reg_A[68:79],{4{1'b0}}};
						result[80:95]<={reg_A[84:95],{4{1'b0}}};
						result[96:111]<={reg_A[100:111],{4{1'b0}}};
						result[112:127]<={reg_A[116:127],{4{1'b0}}};
						end
					4'd5:
						begin
						result[0:15]<={reg_A[5:15],{5{1'b0}}};
						result[16:31]<={reg_A[21:31],{5{1'b0}}};
						result[32:47]<={reg_A[37:47],{5{1'b0}}};
						result[48:63]<={reg_A[52:63],{5{1'b0}}};
						result[64:79]<={reg_A[69:79],{5{1'b0}}};
						result[80:95]<={reg_A[85:95],{5{1'b0}}};
						result[96:111]<={reg_A[101:111],{5{1'b0}}};
						result[112:127]<={reg_A[117:127],{5{1'b0}}};
						end
					4'd6:
						begin
						result[0:15]<={reg_A[6:15],{6{1'b0}}};
						result[16:31]<={reg_A[22:31],{6{1'b0}}};
						result[32:47]<={reg_A[38:47],{6{1'b0}}};
						result[48:63]<={reg_A[53:63],{6{1'b0}}};
						result[64:79]<={reg_A[70:79],{6{1'b0}}};
						result[80:95]<={reg_A[86:95],{6{1'b0}}};
						result[96:111]<={reg_A[102:111],{6{1'b0}}};
						result[112:127]<={reg_A[118:127],{6{1'b0}}};
						end
					4'd7:
						begin
						result[0:15]<={reg_A[7:15],{7{1'b0}}};
						result[16:31]<={reg_A[23:31],{7{1'b0}}};
						result[32:47]<={reg_A[39:47],{7{1'b0}}};
						result[48:63]<={reg_A[54:63],{7{1'b0}}};
						result[64:79]<={reg_A[71:79],{7{1'b0}}};
						result[80:95]<={reg_A[87:95],{7{1'b0}}};
						result[96:111]<={reg_A[103:111],{7{1'b0}}};
						result[112:127]<={reg_A[119:127],{7{1'b0}}};
						end
					4'd8:
						begin
						result[0:15]<={reg_A[8:15],{8{1'b0}}};
						result[16:31]<={reg_A[24:31],{8{1'b0}}};
						result[32:47]<={reg_A[40:47],{8{1'b0}}};
						result[48:63]<={reg_A[55:63],{8{1'b0}}};
						result[64:79]<={reg_A[72:79],{8{1'b0}}};
						result[80:95]<={reg_A[88:95],{8{1'b0}}};
						result[96:111]<={reg_A[104:111],{8{1'b0}}};
						result[112:127]<={reg_A[120:127],{8{1'b0}}};
						end
					4'd9:
						begin
						result[0:15]<={reg_A[9:15],{9{1'b0}}};
						result[16:31]<={reg_A[25:31],{9{1'b0}}};
						result[32:47]<={reg_A[41:47],{9{1'b0}}};
						result[48:63]<={reg_A[56:63],{9{1'b0}}};
						result[64:79]<={reg_A[73:79],{9{1'b0}}};
						result[80:95]<={reg_A[89:95],{9{1'b0}}};
						result[96:111]<={reg_A[105:111],{9{1'b0}}};
						result[112:127]<={reg_A[121:127],{9{1'b0}}};
						end
					4'd10:
						begin
						result[0:15]<={reg_A[10:15],{10{1'b0}}};
						result[16:31]<={reg_A[26:31],{10{1'b0}}};
						result[32:47]<={reg_A[42:47],{10{1'b0}}};
						result[48:63]<={reg_A[58:63],{10{1'b0}}};
						result[64:79]<={reg_A[74:79],{10{1'b0}}};
						result[80:95]<={reg_A[90:95],{10{1'b0}}};
						result[96:111]<={reg_A[106:111],{10{1'b0}}};
						result[112:127]<={reg_A[122:127],{10{1'b0}}};
						end
					4'd11:
						begin
						result[0:15]<={reg_A[11:15],{11{1'b0}}};
						result[16:31]<={reg_A[27:31],{11{1'b0}}};
						result[32:47]<={reg_A[43:47],{11{1'b0}}};
						result[48:63]<={reg_A[59:63],{11{1'b0}}};
						result[64:79]<={reg_A[75:79],{11{1'b0}}};
						result[80:95]<={reg_A[91:95],{11{1'b0}}};
						result[96:111]<={reg_A[107:111],{11{1'b0}}};
						result[112:127]<={reg_A[123:127],{11{1'b0}}};
						end
					4'd12:
						begin
						result[0:15]<={reg_A[12:15],{12{1'b0}}};
						result[16:31]<={reg_A[28:31],{12{1'b0}}};
						result[32:47]<={reg_A[44:47],{12{1'b0}}};
						result[48:63]<={reg_A[60:63],{12{1'b0}}};
						result[64:79]<={reg_A[76:79],{12{1'b0}}};
						result[80:95]<={reg_A[92:95],{12{1'b0}}};
						result[96:111]<={reg_A[108:111],{12{1'b0}}};
						result[112:127]<={reg_A[124:127],{12{1'b0}}};
						end
					4'd13:
						begin
						result[0:15]<={reg_A[13:15],{13{1'b0}}};
						result[16:31]<={reg_A[29:31],{13{1'b0}}};
						result[32:47]<={reg_A[45:47],{13{1'b0}}};
						result[48:63]<={reg_A[61:63],{13{1'b0}}};
						result[64:79]<={reg_A[77:79],{13{1'b0}}};
						result[80:95]<={reg_A[93:95],{13{1'b0}}};
						result[96:111]<={reg_A[109:111],{13{1'b0}}};
						result[112:127]<={reg_A[125:127],{13{1'b0}}};
						end
					4'd14:
						begin
						result[0:15]<={reg_A[14:15],{14{1'b0}}};
						result[16:31]<={reg_A[30:31],{14{1'b0}}};
						result[32:47]<={reg_A[46:47],{14{1'b0}}};
						result[48:63]<={reg_A[62:63],{14{1'b0}}};
						result[64:79]<={reg_A[78:79],{14{1'b0}}};
						result[80:95]<={reg_A[94:95],{14{1'b0}}};
						result[96:111]<={reg_A[110:111],{14{1'b0}}};
						result[112:127]<={reg_A[126:127],{14{1'b0}}};
						end
					4'd15:
						begin
						result[0:15]<={reg_A[15],{15{1'b0}}};
						result[16:31]<={reg_A[31],{15{1'b0}}};
						result[32:47]<={reg_A[47],{15{1'b0}}};
						result[48:63]<={reg_A[63],{15{1'b0}}};
						result[64:79]<={reg_A[79],{15{1'b0}}};
						result[80:95]<={reg_A[95],{15{1'b0}}};
						result[96:111]<={reg_A[111],{15{1'b0}}};
						result[112:127]<={reg_A[127],{15{1'b0}}};
						end
				endcase
				end
				`w32:
				begin
				case(reg_B[0:4])
					5'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					5'd1:
						begin
						result[0:31]<={reg_A[1:31],{1'b0}};
						result[32:63]<={reg_A[33:63],{1'b0}};
						result[64:95]<={reg_A[65:95],{1'b0}};
						result[96:127]<={reg_A[97:127],{1'b0}};
						end
					5'd2:
						begin
						result[0:31]<={reg_A[2:31],{2{1'b0}}};
						result[32:63]<={reg_A[34:63],{2{1'b0}}};
						result[64:95]<={reg_A[66:95],{2{1'b0}}};
						result[96:127]<={reg_A[98:127],{2{1'b0}}};
						end
					5'd3:
						begin
						result[0:31]<={reg_A[3:31],{3{1'b0}}};
						result[32:63]<={reg_A[35:63],{3{1'b0}}};
						result[64:95]<={reg_A[67:95],{3{1'b0}}};
						result[96:127]<={reg_A[99:127],{3{1'b0}}};
						end
					5'd4:
						begin
						result[0:31]<={reg_A[4:31],{4{1'b0}}};
						result[32:63]<={reg_A[36:63],{4{1'b0}}};
						result[64:95]<={reg_A[68:95],{4{1'b0}}};
						result[96:127]<={reg_A[100:127],{4{1'b0}}};
						end
					5'd5:
						begin
						result[0:31]<={reg_A[5:31],{5{1'b0}}};
						result[32:63]<={reg_A[37:63],{5{1'b0}}};
						result[64:95]<={reg_A[69:95],{5{1'b0}}};
						result[96:127]<={reg_A[101:127],{5{1'b0}}};
						end
					5'd6:
						begin
						result[0:31]<={reg_A[6:31],{6{1'b0}}};
						result[32:63]<={reg_A[38:63],{6{1'b0}}};
						result[64:95]<={reg_A[70:95],{6{1'b0}}};
						result[96:127]<={reg_A[102:127],{6{1'b0}}};
						end
					5'd7:
						begin
						result[0:31]<={reg_A[7:31],{7{1'b0}}};
						result[32:63]<={reg_A[39:63],{7{1'b0}}};
						result[64:95]<={reg_A[71:95],{7{1'b0}}};
						result[96:127]<={reg_A[103:127],{7{1'b0}}};
						end
					5'd8:
						begin
						result[0:31]<={reg_A[8:31],{8{1'b0}}};
						result[32:63]<={reg_A[40:63],{8{1'b0}}};
						result[64:95]<={reg_A[72:95],{8{1'b0}}};
						result[96:127]<={reg_A[104:127],{8{1'b0}}};
						end
					5'd9:
						begin
						result[0:31]<={reg_A[9:31],{9{1'b0}}};
						result[32:63]<={reg_A[41:63],{9{1'b0}}};
						result[64:95]<={reg_A[73:95],{9{1'b0}}};
						result[96:127]<={reg_A[105:127],{9{1'b0}}};
						end
					5'd10:
						begin
						result[0:31]<={reg_A[10:31],{10{1'b0}}};
						result[32:63]<={reg_A[42:63],{10{1'b0}}};
						result[64:95]<={reg_A[74:95],{10{1'b0}}};
						result[96:127]<={reg_A[106:127],{10{1'b0}}};
						end
					5'd11:
						begin
						result[0:31]<={reg_A[11:31],{11{1'b0}}};
						result[32:63]<={reg_A[43:63],{11{1'b0}}};
						result[64:95]<={reg_A[75:95],{11{1'b0}}};
						result[96:127]<={reg_A[107:127],{11{1'b0}}};
						end
					5'd12:
						begin
						result[0:31]<={reg_A[12:31],{12{1'b0}}};
						result[32:63]<={reg_A[44:63],{12{1'b0}}};
						result[64:95]<={reg_A[76:95],{12{1'b0}}};
						result[96:127]<={reg_A[108:127],{12{1'b0}}};
						end
					5'd13:
						begin
						result[0:31]<={reg_A[13:31],{13{1'b0}}};
						result[32:63]<={reg_A[45:63],{13{1'b0}}};
						result[64:95]<={reg_A[77:95],{13{1'b0}}};
						result[96:127]<={reg_A[109:127],{13{1'b0}}};
						end
					5'd14:
						begin
						result[0:31]<={reg_A[14:31],{14{1'b0}}};
						result[32:63]<={reg_A[46:63],{14{1'b0}}};
						result[64:95]<={reg_A[78:95],{14{1'b0}}};
						result[96:127]<={reg_A[110:127],{14{1'b0}}};
						end
					5'd15:
						begin
						result[0:31]<={reg_A[15:31],{15{1'b0}}};
						result[32:63]<={reg_A[47:63],{15{1'b0}}};
						result[64:95]<={reg_A[79:95],{15{1'b0}}};
						result[96:127]<={reg_A[111:127],{15{1'b0}}};
						end
					5'd16:
						begin
						result[0:31]<={reg_A[16:31],{16{1'b0}}};
						result[32:63]<={reg_A[48:63],{16{1'b0}}};
						result[64:95]<={reg_A[80:95],{16{1'b0}}};
						result[96:127]<={reg_A[112:127],{16{1'b0}}};
						end
					5'd17:
						begin
						result[0:31]<={reg_A[17:31],{17{1'b0}}};
						result[32:63]<={reg_A[49:63],{17{1'b0}}};
						result[64:95]<={reg_A[81:95],{17{1'b0}}};
						result[96:127]<={reg_A[113:127],{17{1'b0}}};
						end
					5'd18:
						begin
						result[0:31]<={reg_A[18:31],{18{1'b0}}};
						result[32:63]<={reg_A[50:63],{18{1'b0}}};
						result[64:95]<={reg_A[82:95],{18{1'b0}}};
						result[96:127]<={reg_A[114:127],{18{1'b0}}};
						end
					5'd19:
						begin
						result[0:31]<={reg_A[19:31],{19{1'b0}}};
						result[32:63]<={reg_A[51:63],{19{1'b0}}};
						result[64:95]<={reg_A[83:95],{19{1'b0}}};
						result[96:127]<={reg_A[115:127],{19{1'b0}}};
						end
					5'd20:
						begin
						result[0:31]<={reg_A[20:31],{20{1'b0}}};
						result[32:63]<={reg_A[52:63],{20{1'b0}}};
						result[64:95]<={reg_A[84:95],{20{1'b0}}};
						result[96:127]<={reg_A[116:127],{20{1'b0}}};
						end
					5'd21:
						begin
						result[0:31]<={reg_A[21:31],{21{1'b0}}};
						result[32:63]<={reg_A[53:63],{21{1'b0}}};
						result[64:95]<={reg_A[85:95],{21{1'b0}}};
						result[96:127]<={reg_A[117:127],{21{1'b0}}};
						end
					5'd22:
						begin
						result[0:31]<={reg_A[22:31],{22{1'b0}}};
						result[32:63]<={reg_A[54:63],{22{1'b0}}};
						result[64:95]<={reg_A[86:95],{22{1'b0}}};
						result[96:127]<={reg_A[118:127],{22{1'b0}}};
						end
					5'd23:
						begin
						result[0:31]<={reg_A[23:31],{23{1'b0}}};
						result[32:63]<={reg_A[55:63],{23{1'b0}}};
						result[64:95]<={reg_A[87:95],{23{1'b0}}};
						result[96:127]<={reg_A[119:127],{23{1'b0}}};
						end
					5'd24:
						begin
						result[0:31]<={reg_A[24:31],{24{1'b0}}};
						result[32:63]<={reg_A[56:63],{24{1'b0}}};
						result[64:95]<={reg_A[88:95],{24{1'b0}}};
						result[96:127]<={reg_A[120:127],{24{1'b0}}};
						end
					5'd25:
						begin
						result[0:31]<={reg_A[25:31],{25{1'b0}}};
						result[32:63]<={reg_A[57:63],{25{1'b0}}};
						result[64:95]<={reg_A[89:95],{25{1'b0}}};
						result[96:127]<={reg_A[121:127],{25{1'b0}}};
						end
					5'd26:
						begin
						result[0:31]<={reg_A[26:31],{26{1'b0}}};
						result[32:63]<={reg_A[58:63],{26{1'b0}}};
						result[64:95]<={reg_A[90:95],{26{1'b0}}};
						result[96:127]<={reg_A[122:127],{26{1'b0}}};
						end
					5'd27:
						begin
						result[0:31]<={reg_A[27:31],{27{1'b0}}};
						result[32:63]<={reg_A[59:63],{27{1'b0}}};
						result[64:95]<={reg_A[91:95],{27{1'b0}}};
						result[96:127]<={reg_A[123:127],{27{1'b0}}};
						end
					5'd28:
						begin
						result[0:31]<={reg_A[28:31],{28{1'b0}}};
						result[32:63]<={reg_A[60:63],{28{1'b0}}};
						result[64:95]<={reg_A[92:95],{28{1'b0}}};
						result[96:127]<={reg_A[124:127],{28{1'b0}}};
						end
					5'd29:
						begin
						result[0:31]<={reg_A[29:31],{29{1'b0}}};
						result[32:63]<={reg_A[61:63],{29{1'b0}}};
						result[64:95]<={reg_A[93:95],{29{1'b0}}};
						result[96:127]<={reg_A[125:127],{29{1'b0}}};
						end
					5'd30:
						begin
						result[0:31]<={reg_A[30:31],{30{1'b0}}};
						result[32:63]<={reg_A[62:63],{30{1'b0}}};
						result[64:95]<={reg_A[94:95],{30{1'b0}}};
						result[96:127]<={reg_A[126:127],{30{1'b0}}};
						end
					5'd31:
						begin
						result[0:31]<={reg_A[31],{31{1'b0}}};
						result[32:63]<={reg_A[63],{31{1'b0}}};
						result[64:95]<={reg_A[95],{31{1'b0}}};
						result[96:127]<={reg_A[127],{31{1'b0}}};
						end
				endcase
				end
			endcase
			end

			// ==============================================================

			// SRLI instruction
			
			`aluwsrli:
			begin
			case(ctrl_ww)
				`w8:
				begin
				case(reg_B[2:4])
					3'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					3'd1:
						begin
						result[0:7]<={{1'b0},reg_A[0:6]};
						result[8:15]<={{1'b0},reg_A[8:14]};
						result[16:23]<={{1'b0},reg_A[16:22]};
						result[24:31]<={{1'b0},reg_A[24:30]};
						result[32:39]<={{1'b0},reg_A[32:38]};
						result[40:47]<={{1'b0},reg_A[40:46]};
						result[48:55]<={{1'b0},reg_A[48:54]};
						result[56:63]<={{1'b0},reg_A[56:62]};
						result[64:71]<={{1'b0},reg_A[64:70]};
						result[72:79]<={{1'b0},reg_A[72:78]};
						result[80:87]<={{1'b0},reg_A[80:86]};
						result[88:95]<={{1'b0},reg_A[88:94]};
						result[96:103]<={{1'b0},reg_A[96:102]};
						result[104:111]<={{1'b0},reg_A[104:110]};
						result[112:119]<={{1'b0},reg_A[112:118]};
						result[120:127]<={{1'b0},reg_A[120:126]};
						end
					3'd2:
						begin
						result[0:7]<={{2{1'b0}},reg_A[0:5]};
						result[8:15]<={{2{1'b0}},reg_A[8:13]};
						result[16:23]<={{2{1'b0}},reg_A[16:21]};
						result[24:31]<={{2{1'b0}},reg_A[24:29]};
						result[32:39]<={{2{1'b0}},reg_A[32:37]};
						result[40:47]<={{2{1'b0}},reg_A[40:45]};
						result[48:55]<={{2{1'b0}},reg_A[48:53]};
						result[56:63]<={{2{1'b0}},reg_A[56:61]};
						result[64:71]<={{2{1'b0}},reg_A[64:69]};
						result[72:79]<={{2{1'b0}},reg_A[72:77]};
						result[80:87]<={{2{1'b0}},reg_A[80:85]};
						result[88:95]<={{2{1'b0}},reg_A[88:93]};
						result[96:103]<={{2{1'b0}},reg_A[96:101]};
						result[104:111]<={{2{1'b0}},reg_A[104:109]};
						result[112:119]<={{2{1'b0}},reg_A[112:117]};
						result[120:127]<={{2{1'b0}},reg_A[120:125]};
						end
					3'd3:
						begin
						result[0:7]<={{3{1'b0}},reg_A[0:4]};
						result[8:15]<={{3{1'b0}},reg_A[8:12]};
						result[16:23]<={{3{1'b0}},reg_A[16:20]};
						result[24:31]<={{3{1'b0}},reg_A[24:28]};
						result[32:39]<={{3{1'b0}},reg_A[32:36]};
						result[40:47]<={{3{1'b0}},reg_A[40:44]};
						result[48:55]<={{3{1'b0}},reg_A[48:52]};
						result[56:63]<={{3{1'b0}},reg_A[56:60]};
						result[64:71]<={{3{1'b0}},reg_A[64:68]};
						result[72:79]<={{3{1'b0}},reg_A[72:76]};
						result[80:87]<={{3{1'b0}},reg_A[80:84]};
						result[88:95]<={{3{1'b0}},reg_A[88:92]};
						result[96:103]<={{3{1'b0}},reg_A[96:100]};
						result[104:111]<={{3{1'b0}},reg_A[104:108]};
						result[112:119]<={{3{1'b0}},reg_A[112:116]};
						result[120:127]<={{3{1'b0}},reg_A[120:124]};
						end
					3'd4:
						begin
						result[0:7]<={{4{1'b0}},reg_A[0:3]};
						result[8:15]<={{4{1'b0}},reg_A[8:11]};
						result[16:23]<={{4{1'b0}},reg_A[16:19]};
						result[24:31]<={{4{1'b0}},reg_A[24:27]};
						result[32:39]<={{4{1'b0}},reg_A[32:35]};
						result[40:47]<={{4{1'b0}},reg_A[40:43]};
						result[48:55]<={{4{1'b0}},reg_A[48:51]};
						result[56:63]<={{4{1'b0}},reg_A[56:69]};
						result[64:71]<={{4{1'b0}},reg_A[64:67]};
						result[72:79]<={{4{1'b0}},reg_A[72:75]};
						result[80:87]<={{4{1'b0}},reg_A[80:83]};
						result[88:95]<={{4{1'b0}},reg_A[88:91]};
						result[96:103]<={{4{1'b0}},reg_A[96:99]};
						result[104:111]<={{4{1'b0}},reg_A[104:107]};
						result[112:119]<={{4{1'b0}},reg_A[112:115]};
						result[120:127]<={{4{1'b0}},reg_A[120:123]};
						end
					3'd5:
						begin
						result[0:7]<={{5{1'b0}},reg_A[0:2]};
						result[8:15]<={{5{1'b0}},reg_A[8:10]};
						result[16:23]<={{5{1'b0}},reg_A[16:18]};
						result[24:31]<={{5{1'b0}},reg_A[24:26]};
						result[32:39]<={{5{1'b0}},reg_A[32:34]};
						result[40:47]<={{5{1'b0}},reg_A[40:42]};
						result[48:55]<={{5{1'b0}},reg_A[48:50]};
						result[56:63]<={{5{1'b0}},reg_A[56:68]};
						result[64:71]<={{5{1'b0}},reg_A[64:66]};
						result[72:79]<={{5{1'b0}},reg_A[72:74]};
						result[80:87]<={{5{1'b0}},reg_A[80:82]};
						result[88:95]<={{5{1'b0}},reg_A[88:90]};
						result[96:103]<={{5{1'b0}},reg_A[96:98]};
						result[104:111]<={{5{1'b0}},reg_A[104:106]};
						result[112:119]<={{5{1'b0}},reg_A[112:114]};
						result[120:127]<={{5{1'b0}},reg_A[120:122]};
						end
					3'd6:
						begin
						result[0:7]<={{6{1'b0}},reg_A[0:1]};
						result[8:15]<={{6{1'b0}},reg_A[8:9]};
						result[16:23]<={{6{1'b0}},reg_A[16:17]};
						result[24:31]<={{6{1'b0}},reg_A[24:25]};
						result[32:39]<={{6{1'b0}},reg_A[32:33]};
						result[40:47]<={{6{1'b0}},reg_A[40:41]};
						result[48:55]<={{6{1'b0}},reg_A[48:49]};
						result[56:63]<={{6{1'b0}},reg_A[56:67]};
						result[64:71]<={{6{1'b0}},reg_A[64:65]};
						result[72:79]<={{6{1'b0}},reg_A[72:73]};
						result[80:87]<={{6{1'b0}},reg_A[80:81]};
						result[88:95]<={{6{1'b0}},reg_A[88:89]};
						result[96:103]<={{6{1'b0}},reg_A[96:97]};
						result[104:111]<={{6{1'b0}},reg_A[104:105]};
						result[112:119]<={{6{1'b0}},reg_A[112:113]};
						result[120:127]<={{6{1'b0}},reg_A[120:121]};
						end
					3'd7:
						begin
						result[0:7]<={{7{1'b0}},reg_A[0]};
						result[8:15]<={{7{1'b0}},reg_A[8]};
						result[16:23]<={{7{1'b0}},reg_A[16]};
						result[24:31]<={{7{1'b0}},reg_A[24]};
						result[32:39]<={{7{1'b0}},reg_A[32]};
						result[40:47]<={{7{1'b0}},reg_A[40]};
						result[48:55]<={{7{1'b0}},reg_A[48]};
						result[56:63]<={{7{1'b0}},reg_A[56]};
						result[64:71]<={{7{1'b0}},reg_A[64]};
						result[72:79]<={{7{1'b0}},reg_A[72]};
						result[80:87]<={{7{1'b0}},reg_A[80]};
						result[88:95]<={{7{1'b0}},reg_A[88]};
						result[96:103]<={{7{1'b0}},reg_A[96]};
						result[104:111]<={{7{1'b0}},reg_A[104]};
						result[112:119]<={{7{1'b0}},reg_A[112]};
						result[120:127]<={{7{1'b0}},reg_A[120]};
						end
				endcase
				end
				`w16:
				begin
				case(reg_B[1:4])
					4'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					4'd1:
						begin
						result[0:15]<={{1'b0},reg_A[0:14]};
						result[16:31]<={{1'b0},reg_A[16:30]};
						result[32:47]<={{1'b0},reg_A[32:46]};
						result[48:63]<={{1'b0},reg_A[48:62]};
						result[64:79]<={{1'b0},reg_A[64:78]};
						result[80:95]<={{1'b0},reg_A[80:94]};
						result[96:111]<={{1'b0},reg_A[96:110]};
						result[112:127]<={{1'b0},reg_A[112:126]};
						end
					4'd2:
						begin
						result[0:15]<={{2{1'b0}},reg_A[0:13]};
						result[16:31]<={{2{1'b0}},reg_A[16:29]};
						result[32:47]<={{2{1'b0}},reg_A[32:45]};
						result[48:63]<={{2{1'b0}},reg_A[48:61]};
						result[64:79]<={{2{1'b0}},reg_A[64:77]};
						result[80:95]<={{2{1'b0}},reg_A[80:93]};
						result[96:111]<={{2{1'b0}},reg_A[96:109]};
						result[112:127]<={{2{1'b0}},reg_A[112:125]};
						end
					4'd3:
						begin
						result[0:15]<={{3{1'b0}},reg_A[0:12]};
						result[16:31]<={{3{1'b0}},reg_A[16:28]};
						result[32:47]<={{3{1'b0}},reg_A[32:44]};
						result[48:63]<={{3{1'b0}},reg_A[48:60]};
						result[64:79]<={{3{1'b0}},reg_A[64:76]};
						result[80:95]<={{3{1'b0}},reg_A[80:92]};
						result[96:111]<={{3{1'b0}},reg_A[96:108]};
						result[112:127]<={{3{1'b0}},reg_A[112:124]};
						end
					4'd4:
						begin
						result[0:15]<={{4{1'b0}},reg_A[0:11]};
						result[16:31]<={{4{1'b0}},reg_A[16:27]};
						result[32:47]<={{4{1'b0}},reg_A[32:43]};
						result[48:63]<={{4{1'b0}},reg_A[48:59]};
						result[64:79]<={{4{1'b0}},reg_A[64:75]};
						result[80:95]<={{4{1'b0}},reg_A[80:91]};
						result[96:111]<={{4{1'b0}},reg_A[96:107]};
						result[112:127]<={{4{1'b0}},reg_A[112:123]};
						end
					4'd5:
						begin
						result[0:15]<={{5{1'b0}},reg_A[0:10]};
						result[16:31]<={{5{1'b0}},reg_A[16:26]};
						result[32:47]<={{5{1'b0}},reg_A[32:42]};
						result[48:63]<={{5{1'b0}},reg_A[48:58]};
						result[64:79]<={{5{1'b0}},reg_A[64:74]};
						result[80:95]<={{5{1'b0}},reg_A[80:90]};
						result[96:111]<={{5{1'b0}},reg_A[96:106]};
						result[112:127]<={{5{1'b0}},reg_A[112:122]};
						end
					4'd6:
						begin
						result[0:15]<={{6{1'b0}},reg_A[0:9]};
						result[16:31]<={{6{1'b0}},reg_A[16:25]};
						result[32:47]<={{6{1'b0}},reg_A[32:41]};
						result[48:63]<={{6{1'b0}},reg_A[48:57]};
						result[64:79]<={{6{1'b0}},reg_A[64:73]};
						result[80:95]<={{6{1'b0}},reg_A[80:89]};
						result[96:111]<={{6{1'b0}},reg_A[96:105]};
						result[112:127]<={{6{1'b0}},reg_A[112:121]};
						end
					4'd7:
						begin
						result[0:15]<={{7{1'b0}},reg_A[0:8]};
						result[16:31]<={{7{1'b0}},reg_A[16:24]};
						result[32:47]<={{7{1'b0}},reg_A[32:40]};
						result[48:63]<={{7{1'b0}},reg_A[48:56]};
						result[64:79]<={{7{1'b0}},reg_A[64:72]};
						result[80:95]<={{7{1'b0}},reg_A[80:88]};
						result[96:111]<={{7{1'b0}},reg_A[96:104]};
						result[112:127]<={{7{1'b0}},reg_A[112:120]};
						end
					4'd8:
						begin
						result[0:15]<={{8{1'b0}},reg_A[0:7]};
						result[16:31]<={{8{1'b0}},reg_A[16:23]};
						result[32:47]<={{8{1'b0}},reg_A[32:39]};
						result[48:63]<={{8{1'b0}},reg_A[48:55]};
						result[64:79]<={{8{1'b0}},reg_A[64:71]};
						result[80:95]<={{8{1'b0}},reg_A[80:87]};
						result[96:111]<={{8{1'b0}},reg_A[96:103]};
						result[112:127]<={{8{1'b0}},reg_A[112:119]};
						end
					4'd9:
						begin
						result[0:15]<={{9{1'b0}},reg_A[0:6]};
						result[16:31]<={{9{1'b0}},reg_A[16:22]};
						result[32:47]<={{9{1'b0}},reg_A[32:38]};
						result[48:63]<={{9{1'b0}},reg_A[48:54]};
						result[64:79]<={{9{1'b0}},reg_A[64:70]};
						result[80:95]<={{9{1'b0}},reg_A[80:86]};
						result[96:111]<={{9{1'b0}},reg_A[96:102]};
						result[112:127]<={{9{1'b0}},reg_A[112:118]};
						end
					4'd10:
						begin
						result[0:15]<={{10{1'b0}},reg_A[0:5]};
						result[16:31]<={{10{1'b0}},reg_A[16:21]};
						result[32:47]<={{10{1'b0}},reg_A[32:37]};
						result[48:63]<={{10{1'b0}},reg_A[48:53]};
						result[64:79]<={{10{1'b0}},reg_A[64:69]};
						result[80:95]<={{10{1'b0}},reg_A[80:85]};
						result[96:111]<={{10{1'b0}},reg_A[96:101]};
						result[112:127]<={{10{1'b0}},reg_A[112:117]};
						end
					4'd11:
						begin
						result[0:15]<={{11{1'b0}},reg_A[0:4]};
						result[16:31]<={{11{1'b0}},reg_A[16:20]};
						result[32:47]<={{11{1'b0}},reg_A[32:36]};
						result[48:63]<={{11{1'b0}},reg_A[48:52]};
						result[64:79]<={{11{1'b0}},reg_A[64:68]};
						result[80:95]<={{11{1'b0}},reg_A[80:84]};
						result[96:111]<={{11{1'b0}},reg_A[96:100]};
						result[112:127]<={{11{1'b0}},reg_A[112:116]};
						end
					4'd12:
						begin
						result[0:15]<={{12{1'b0}},reg_A[0:3]};
						result[16:31]<={{12{1'b0}},reg_A[16:19]};
						result[32:47]<={{12{1'b0}},reg_A[32:35]};
						result[48:63]<={{12{1'b0}},reg_A[48:51]};
						result[64:79]<={{12{1'b0}},reg_A[64:67]};
						result[80:95]<={{12{1'b0}},reg_A[80:83]};
						result[96:111]<={{12{1'b0}},reg_A[96:99]};
						result[112:127]<={{12{1'b0}},reg_A[112:115]};
						end
					4'd13:
						begin
						result[0:15]<={{13{1'b0}},reg_A[0:2]};
						result[16:31]<={{13{1'b0}},reg_A[16:18]};
						result[32:47]<={{13{1'b0}},reg_A[32:34]};
						result[48:63]<={{13{1'b0}},reg_A[48:50]};
						result[64:79]<={{13{1'b0}},reg_A[64:66]};
						result[80:95]<={{13{1'b0}},reg_A[80:82]};
						result[96:111]<={{13{1'b0}},reg_A[96:98]};
						result[112:127]<={{13{1'b0}},reg_A[112:114]};
						end
					4'd14:
						begin
						result[0:15]<={{14{1'b0}},reg_A[0:1]};
						result[16:31]<={{14{1'b0}},reg_A[16:17]};
						result[32:47]<={{14{1'b0}},reg_A[32:33]};
						result[48:63]<={{14{1'b0}},reg_A[48:49]};
						result[64:79]<={{14{1'b0}},reg_A[64:65]};
						result[80:95]<={{14{1'b0}},reg_A[80:81]};
						result[96:111]<={{14{1'b0}},reg_A[96:97]};
						result[112:127]<={{14{1'b0}},reg_A[112:113]};
						end
					4'd15:
						begin
						result[0:15]<={{15{1'b0}},reg_A[0]};
						result[16:31]<={{15{1'b0}},reg_A[16]};
						result[32:47]<={{15{1'b0}},reg_A[32]};
						result[48:63]<={{15{1'b0}},reg_A[48]};
						result[64:79]<={{15{1'b0}},reg_A[64]};
						result[80:95]<={{15{1'b0}},reg_A[80]};
						result[96:111]<={{15{1'b0}},reg_A[96]};
						result[112:127]<={{15{1'b0}},reg_A[112]};
						end
				endcase
				end
				`w32:
				begin
				case(reg_B[0:4])
					5'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					5'd1:
						begin
						result[0:31]<={{1'b0},reg_A[0:30]};
						result[32:63]<={{1'b0},reg_A[32:62]};
						result[64:95]<={{1'b0},reg_A[64:94]};
						result[96:127]<={{1'b0},reg_A[96:126]};
						end
					5'd2:
						begin
						result[0:31]<={{2{1'b0}},reg_A[0:29]};
						result[32:63]<={{2{1'b0}},reg_A[32:61]};
						result[64:95]<={{2{1'b0}},reg_A[64:93]};
						result[96:127]<={{2{1'b0}},reg_A[96:125]};
						end
					5'd3:
						begin
						result[0:31]<={{3{1'b0}},reg_A[0:28]};
						result[32:63]<={{3{1'b0}},reg_A[32:60]};
						result[64:95]<={{3{1'b0}},reg_A[64:92]};
						result[96:127]<={{3{1'b0}},reg_A[96:124]};
						end
					5'd4:
						begin
						result[0:31]<={{4{1'b0}},reg_A[0:27]};
						result[32:63]<={{4{1'b0}},reg_A[32:59]};
						result[64:95]<={{4{1'b0}},reg_A[64:91]};
						result[96:127]<={{4{1'b0}},reg_A[96:123]};
						end
					5'd5:
						begin
						result[0:31]<={{5{1'b0}},reg_A[0:26]};
						result[32:63]<={{5{1'b0}},reg_A[32:58]};
						result[64:95]<={{5{1'b0}},reg_A[64:90]};
						result[96:127]<={{5{1'b0}},reg_A[96:122]};
						end
					5'd6:
						begin
						result[0:31]<={{6{1'b0}},reg_A[0:25]};
						result[32:63]<={{6{1'b0}},reg_A[32:57]};
						result[64:95]<={{6{1'b0}},reg_A[64:89]};
						result[96:127]<={{6{1'b0}},reg_A[96:121]};
						end
					5'd7:
						begin
						result[0:31]<={{7{1'b0}},reg_A[0:24]};
						result[32:63]<={{7{1'b0}},reg_A[32:56]};
						result[64:95]<={{7{1'b0}},reg_A[64:88]};
						result[96:127]<={{7{1'b0}},reg_A[96:120]};
						end
					5'd8:
						begin
						result[0:31]<={{8{1'b0}},reg_A[0:23]};
						result[32:63]<={{8{1'b0}},reg_A[32:55]};
						result[64:95]<={{8{1'b0}},reg_A[64:87]};
						result[96:127]<={{8{1'b0}},reg_A[96:119]};
						end
					5'd9:
						begin
						result[0:31]<={{9{1'b0}},reg_A[0:22]};
						result[32:63]<={{9{1'b0}},reg_A[32:54]};
						result[64:95]<={{9{1'b0}},reg_A[64:86]};
						result[96:127]<={{9{1'b0}},reg_A[96:118]};
						end
					5'd10:
						begin
						result[0:31]<={{10{1'b0}},reg_A[0:21]};
						result[32:63]<={{10{1'b0}},reg_A[32:53]};
						result[64:95]<={{10{1'b0}},reg_A[64:85]};
						result[96:127]<={{10{1'b0}},reg_A[96:117]};
						end
					5'd11:
						begin
						result[0:31]<={{11{1'b0}},reg_A[0:20]};
						result[32:63]<={{11{1'b0}},reg_A[32:52]};
						result[64:95]<={{11{1'b0}},reg_A[64:84]};
						result[96:127]<={{11{1'b0}},reg_A[96:116]};
						end
					5'd12:
						begin
						result[0:31]<={{12{1'b0}},reg_A[0:19]};
						result[32:63]<={{12{1'b0}},reg_A[32:51]};
						result[64:95]<={{12{1'b0}},reg_A[64:83]};
						result[96:127]<={{12{1'b0}},reg_A[96:115]};
						end
					5'd13:
						begin
						result[0:31]<={{13{1'b0}},reg_A[0:18]};
						result[32:63]<={{13{1'b0}},reg_A[32:50]};
						result[64:95]<={{13{1'b0}},reg_A[64:82]};
						result[96:127]<={{13{1'b0}},reg_A[96:114]};
						end
					5'd14:
						begin
						result[0:31]<={{14{1'b0}},reg_A[0:17]};
						result[32:63]<={{14{1'b0}},reg_A[32:49]};
						result[64:95]<={{14{1'b0}},reg_A[64:81]};
						result[96:127]<={{14{1'b0}},reg_A[96:113]};
						end
					5'd15:
						begin
						result[0:31]<={{15{1'b0}},reg_A[0:16]};
						result[32:63]<={{15{1'b0}},reg_A[32:48]};
						result[64:95]<={{15{1'b0}},reg_A[64:80]};
						result[96:127]<={{15{1'b0}},reg_A[96:112]};
						end
					5'd16:
						begin
						result[0:31]<={{16{1'b0}},reg_A[0:15]};
						result[32:63]<={{16{1'b0}},reg_A[32:47]};
						result[64:95]<={{16{1'b0}},reg_A[64:79]};
						result[96:127]<={{16{1'b0}},reg_A[96:111]};
						end
					5'd17:
						begin
						result[0:31]<={{17{1'b0}},reg_A[0:14]};
						result[32:63]<={{17{1'b0}},reg_A[32:46]};
						result[64:95]<={{17{1'b0}},reg_A[64:78]};
						result[96:127]<={{17{1'b0}},reg_A[96:110]};
						end
					5'd18:
						begin
						result[0:31]<={{18{1'b0}},reg_A[0:13]};
						result[32:63]<={{18{1'b0}},reg_A[32:45]};
						result[64:95]<={{18{1'b0}},reg_A[64:77]};
						result[96:127]<={{18{1'b0}},reg_A[96:109]};
						end
					5'd19:
						begin
						result[0:31]<={{19{1'b0}},reg_A[0:12]};
						result[32:63]<={{19{1'b0}},reg_A[32:44]};
						result[64:95]<={{19{1'b0}},reg_A[64:76]};
						result[96:127]<={{19{1'b0}},reg_A[96:108]};
						end
					5'd20:
						begin
						result[0:31]<={{20{1'b0}},reg_A[0:11]};
						result[32:63]<={{20{1'b0}},reg_A[32:43]};
						result[64:95]<={{20{1'b0}},reg_A[64:75]};
						result[96:127]<={{20{1'b0}},reg_A[96:107]};
						end
					5'd21:
						begin
						result[0:31]<={{21{1'b0}},reg_A[0:10]};
						result[32:63]<={{21{1'b0}},reg_A[32:42]};
						result[64:95]<={{21{1'b0}},reg_A[64:74]};
						result[96:127]<={{21{1'b0}},reg_A[96:106]};
						end
					5'd22:
						begin
						result[0:31]<={{22{1'b0}},reg_A[0:9]};
						result[32:63]<={{22{1'b0}},reg_A[32:41]};
						result[64:95]<={{22{1'b0}},reg_A[64:73]};
						result[96:127]<={{22{1'b0}},reg_A[96:105]};
						end
					5'd23:
						begin
						result[0:31]<={{23{1'b0}},reg_A[0:8]};
						result[32:63]<={{23{1'b0}},reg_A[32:40]};
						result[64:95]<={{23{1'b0}},reg_A[64:72]};
						result[96:127]<={{23{1'b0}},reg_A[96:104]};
						end
					5'd24:
						begin
						result[0:31]<={{24{1'b0}},reg_A[0:7]};
						result[32:63]<={{24{1'b0}},reg_A[32:39]};
						result[64:95]<={{24{1'b0}},reg_A[64:71]};
						result[96:127]<={{24{1'b0}},reg_A[96:103]};
						end
					5'd25:
						begin
						result[0:31]<={{25{1'b0}},reg_A[0:6]};
						result[32:63]<={{25{1'b0}},reg_A[32:38]};
						result[64:95]<={{25{1'b0}},reg_A[64:70]};
						result[96:127]<={{25{1'b0}},reg_A[96:102]};
						end
					5'd26:
						begin
						result[0:31]<={{26{1'b0}},reg_A[0:5]};
						result[32:63]<={{26{1'b0}},reg_A[32:37]};
						result[64:95]<={{26{1'b0}},reg_A[64:69]};
						result[96:127]<={{26{1'b0}},reg_A[96:101]};
						end
					5'd27:
						begin
						result[0:31]<={{27{1'b0}},reg_A[0:4]};
						result[32:63]<={{27{1'b0}},reg_A[32:36]};
						result[64:95]<={{27{1'b0}},reg_A[64:68]};
						result[96:127]<={{27{1'b0}},reg_A[96:100]};
						end
					5'd28:
						begin
						result[0:31]<={{28{1'b0}},reg_A[0:3]};
						result[32:63]<={{28{1'b0}},reg_A[32:35]};
						result[64:95]<={{28{1'b0}},reg_A[64:67]};
						result[96:127]<={{28{1'b0}},reg_A[96:99]};
						end
					5'd29:
						begin
						result[0:31]<={{29{1'b0}},reg_A[0:2]};
						result[32:63]<={{29{1'b0}},reg_A[32:34]};
						result[64:95]<={{29{1'b0}},reg_A[64:66]};
						result[96:127]<={{29{1'b0}},reg_A[96:98]};
						end
					5'd30:
						begin
						result[0:31]<={{30{1'b0}},reg_A[0:1]};
						result[32:63]<={{30{1'b0}},reg_A[32:33]};
						result[64:95]<={{30{1'b0}},reg_A[64:65]};
						result[96:127]<={{30{1'b0}},reg_A[96:97]};
						end
					5'd31:
						begin
						result[0:31]<={{31{1'b0}},reg_A[0]};
						result[32:63]<={{31{1'b0}},reg_A[32]};
						result[64:95]<={{31{1'b0}},reg_A[64]};
						result[96:127]<={{31{1'b0}},reg_A[96]};
						end
				endcase
				end
			endcase
			end






			// ==============================================================
			
			// SRAI instruction
			
			`aluwsrai:
			begin
			case(ctrl_ww)
				`w8:
				begin
				case(reg_B[2:4])
					3'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					3'd1:
						begin
						result[0:7]<={{reg_A[0]},reg_A[0:6]};
						result[8:15]<={{reg_A[8]},reg_A[8:14]};
						result[16:23]<={{reg_A[16]},reg_A[16:22]};
						result[24:31]<={{reg_A[24]},reg_A[24:30]};
						result[32:39]<={{reg_A[32]},reg_A[32:38]};
						result[40:47]<={{reg_A[40]},reg_A[40:46]};
						result[48:55]<={{reg_A[48]},reg_A[48:54]};
						result[56:63]<={{reg_A[56]},reg_A[56:62]};
						result[64:71]<={{reg_A[64]},reg_A[64:70]};
						result[72:79]<={{reg_A[72]},reg_A[72:78]};
						result[80:87]<={{reg_A[80]},reg_A[80:86]};
						result[88:95]<={{reg_A[88]},reg_A[88:94]};
						result[96:103]<={{reg_A[96]},reg_A[96:102]};
						result[104:111]<={{reg_A[104]},reg_A[104:110]};
						result[112:119]<={{reg_A[112]},reg_A[112:118]};
						result[120:127]<={{reg_A[120]},reg_A[120:126]};
						end
					3'd2:
						begin
						result[0:7]<={{2{reg_A[0]}},reg_A[0:5]};
						result[8:15]<={{2{reg_A[8]}},reg_A[8:13]};
						result[16:23]<={{2{reg_A[16]}},reg_A[16:21]};
						result[24:31]<={{2{reg_A[24]}},reg_A[24:29]};
						result[32:39]<={{2{reg_A[32]}},reg_A[32:37]};
						result[40:47]<={{2{reg_A[40]}},reg_A[40:45]};
						result[48:55]<={{2{reg_A[48]}},reg_A[48:53]};
						result[56:63]<={{2{reg_A[56]}},reg_A[56:61]};
						result[64:71]<={{2{reg_A[64]}},reg_A[64:69]};
						result[72:79]<={{2{reg_A[72]}},reg_A[72:77]};
						result[80:87]<={{2{reg_A[80]}},reg_A[80:85]};
						result[88:95]<={{2{reg_A[88]}},reg_A[88:93]};
						result[96:103]<={{2{reg_A[96]}},reg_A[96:101]};
						result[104:111]<={{2{reg_A[104]}},reg_A[104:109]};
						result[112:119]<={{2{reg_A[112]}},reg_A[112:117]};
						result[120:127]<={{2{reg_A[120]}},reg_A[120:125]};
						end
					3'd3:
						begin
						result[0:7]<={{3{reg_A[0]}},reg_A[0:4]};
						result[8:15]<={{3{reg_A[8]}},reg_A[8:12]};
						result[16:23]<={{3{reg_A[16]}},reg_A[16:20]};
						result[24:31]<={{3{reg_A[24]}},reg_A[24:28]};
						result[32:39]<={{3{reg_A[32]}},reg_A[32:36]};
						result[40:47]<={{3{reg_A[40]}},reg_A[40:44]};
						result[48:55]<={{3{reg_A[48]}},reg_A[48:52]};
						result[56:63]<={{3{reg_A[56]}},reg_A[56:60]};
						result[64:71]<={{3{reg_A[64]}},reg_A[64:68]};
						result[72:79]<={{3{reg_A[72]}},reg_A[72:76]};
						result[80:87]<={{3{reg_A[80]}},reg_A[80:84]};
						result[88:95]<={{3{reg_A[88]}},reg_A[88:92]};
						result[96:103]<={{3{reg_A[96]}},reg_A[96:100]};
						result[104:111]<={{3{reg_A[104]}},reg_A[104:108]};
						result[112:119]<={{3{reg_A[112]}},reg_A[112:116]};
						result[120:127]<={{3{reg_A[120]}},reg_A[120:124]};
						end
					3'd4:
						begin
						result[0:7]<={{4{reg_A[0]}},reg_A[0:3]};
						result[8:15]<={{4{reg_A[8]}},reg_A[8:11]};
						result[16:23]<={{4{reg_A[16]}},reg_A[16:19]};
						result[24:31]<={{4{reg_A[24]}},reg_A[24:27]};
						result[32:39]<={{4{reg_A[32]}},reg_A[32:35]};
						result[40:47]<={{4{reg_A[40]}},reg_A[40:43]};
						result[48:55]<={{4{reg_A[48]}},reg_A[48:51]};
						result[56:63]<={{4{reg_A[56]}},reg_A[56:69]};
						result[64:71]<={{4{reg_A[64]}},reg_A[64:67]};
						result[72:79]<={{4{reg_A[72]}},reg_A[72:75]};
						result[80:87]<={{4{reg_A[80]}},reg_A[80:83]};
						result[88:95]<={{4{reg_A[88]}},reg_A[88:91]};
						result[96:103]<={{4{reg_A[96]}},reg_A[96:99]};
						result[104:111]<={{4{reg_A[104]}},reg_A[104:107]};
						result[112:119]<={{4{reg_A[112]}},reg_A[112:115]};
						result[120:127]<={{4{reg_A[120]}},reg_A[120:123]};
						end
					3'd5:
						begin
						result[0:7]<={{5{reg_A[0]}},reg_A[0:2]};
						result[8:15]<={{5{reg_A[8]}},reg_A[8:10]};
						result[16:23]<={{5{reg_A[16]}},reg_A[16:18]};
						result[24:31]<={{5{reg_A[24]}},reg_A[24:26]};
						result[32:39]<={{5{reg_A[32]}},reg_A[32:34]};
						result[40:47]<={{5{reg_A[40]}},reg_A[40:42]};
						result[48:55]<={{5{reg_A[48]}},reg_A[48:50]};
						result[56:63]<={{5{reg_A[56]}},reg_A[56:68]};
						result[64:71]<={{5{reg_A[64]}},reg_A[64:66]};
						result[72:79]<={{5{reg_A[72]}},reg_A[72:74]};
						result[80:87]<={{5{reg_A[80]}},reg_A[80:82]};
						result[88:95]<={{5{reg_A[88]}},reg_A[88:90]};
						result[96:103]<={{5{reg_A[96]}},reg_A[96:98]};
						result[104:111]<={{5{reg_A[104]}},reg_A[104:106]};
						result[112:119]<={{5{reg_A[112]}},reg_A[112:114]};
						result[120:127]<={{5{reg_A[120]}},reg_A[120:122]};
						end
					3'd6:
						begin
						result[0:7]<={{6{reg_A[0]}},reg_A[0:1]};
						result[8:15]<={{6{reg_A[8]}},reg_A[8:9]};
						result[16:23]<={{6{reg_A[16]}},reg_A[16:17]};
						result[24:31]<={{6{reg_A[24]}},reg_A[24:25]};
						result[32:39]<={{6{reg_A[32]}},reg_A[32:33]};
						result[40:47]<={{6{reg_A[40]}},reg_A[40:41]};
						result[48:55]<={{6{reg_A[48]}},reg_A[48:49]};
						result[56:63]<={{6{reg_A[56]}},reg_A[56:67]};
						result[64:71]<={{6{reg_A[64]}},reg_A[64:65]};
						result[72:79]<={{6{reg_A[72]}},reg_A[72:73]};
						result[80:87]<={{6{reg_A[80]}},reg_A[80:81]};
						result[88:95]<={{6{reg_A[88]}},reg_A[88:89]};
						result[96:103]<={{6{reg_A[96]}},reg_A[96:97]};
						result[104:111]<={{6{reg_A[104]}},reg_A[104:105]};
						result[112:119]<={{6{reg_A[112]}},reg_A[112:113]};
						result[120:127]<={{6{reg_A[120]}},reg_A[120:121]};
						end
					3'd7:
						begin
						result[0:7]<={{7{reg_A[0]}},reg_A[0]};
						result[8:15]<={{7{reg_A[8]}},reg_A[8]};
						result[16:23]<={{7{reg_A[16]}},reg_A[16]};
						result[24:31]<={{7{reg_A[24]}},reg_A[24]};
						result[32:39]<={{7{reg_A[32]}},reg_A[32]};
						result[40:47]<={{7{reg_A[40]}},reg_A[40]};
						result[48:55]<={{7{reg_A[48]}},reg_A[48]};
						result[56:63]<={{7{reg_A[56]}},reg_A[56]};
						result[64:71]<={{7{reg_A[64]}},reg_A[64]};
						result[72:79]<={{7{reg_A[72]}},reg_A[72]};
						result[80:87]<={{7{reg_A[80]}},reg_A[80]};
						result[88:95]<={{7{reg_A[88]}},reg_A[88]};
						result[96:103]<={{7{reg_A[96]}},reg_A[96]};
						result[104:111]<={{7{reg_A[104]}},reg_A[104]};
						result[112:119]<={{7{reg_A[112]}},reg_A[112]};
						result[120:127]<={{7{reg_A[120]}},reg_A[120]};
						end
				endcase
				end
				`w16:
				begin
				case(reg_B[1:4])
					4'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					4'd1:
						begin
						result[0:15]<={{reg_A[0]},reg_A[0:14]};
						result[16:31]<={{reg_A[16]},reg_A[16:30]};
						result[32:47]<={{reg_A[32]},reg_A[32:46]};
						result[48:63]<={{reg_A[48]},reg_A[48:62]};
						result[64:79]<={{reg_A[64]},reg_A[64:78]};
						result[80:95]<={{reg_A[80]},reg_A[80:94]};
						result[96:111]<={{reg_A[96]},reg_A[96:110]};
						result[112:127]<={{reg_A[112]},reg_A[112:126]};
						end
					4'd2:
						begin
						result[0:15]<={{2{reg_A[0]}},reg_A[0:13]};
						result[16:31]<={{2{reg_A[16]}},reg_A[16:29]};
						result[32:47]<={{2{reg_A[32]}},reg_A[32:45]};
						result[48:63]<={{2{reg_A[48]}},reg_A[48:61]};
						result[64:79]<={{2{reg_A[64]}},reg_A[64:77]};
						result[80:95]<={{2{reg_A[80]}},reg_A[80:93]};
						result[96:111]<={{2{reg_A[96]}},reg_A[96:109]};
						result[112:127]<={{2{reg_A[112]}},reg_A[112:125]};
						end
					4'd3:
						begin
						result[0:15]<={{3{reg_A[0]}},reg_A[0:12]};
						result[16:31]<={{3{reg_A[16]}},reg_A[16:28]};
						result[32:47]<={{3{reg_A[32]}},reg_A[32:44]};
						result[48:63]<={{3{reg_A[48]}},reg_A[48:60]};
						result[64:79]<={{3{reg_A[64]}},reg_A[64:76]};
						result[80:95]<={{3{reg_A[80]}},reg_A[80:92]};
						result[96:111]<={{3{reg_A[96]}},reg_A[96:108]};
						result[112:127]<={{3{reg_A[112]}},reg_A[112:124]};
						end
					4'd4:
						begin
						result[0:15]<={{4{reg_A[0]}},reg_A[0:11]};
						result[16:31]<={{4{reg_A[8]}},reg_A[16:27]};
						result[32:47]<={{4{reg_A[16]}},reg_A[32:43]};
						result[48:63]<={{4{reg_A[32]}},reg_A[48:59]};
						result[64:79]<={{4{reg_A[48]}},reg_A[64:75]};
						result[80:95]<={{4{reg_A[64]}},reg_A[80:91]};
						result[96:111]<={{4{reg_A[80]}},reg_A[96:107]};
						result[112:127]<={{4{reg_A[112]}},reg_A[112:123]};
						end
					4'd5:
						begin
						result[0:15]<={{5{reg_A[0]}},reg_A[0:10]};
						result[16:31]<={{5{reg_A[16]}},reg_A[16:26]};
						result[32:47]<={{5{reg_A[32]}},reg_A[32:42]};
						result[48:63]<={{5{reg_A[48]}},reg_A[48:58]};
						result[64:79]<={{5{reg_A[64]}},reg_A[64:74]};
						result[80:95]<={{5{reg_A[80]}},reg_A[80:90]};
						result[96:111]<={{5{reg_A[96]}},reg_A[96:106]};
						result[112:127]<={{5{reg_A[112]}},reg_A[112:122]};
						end
					4'd6:
						begin
						result[0:15]<={{6{reg_A[0]}},reg_A[0:9]};
						result[16:31]<={{6{reg_A[16]}},reg_A[16:25]};
						result[32:47]<={{6{reg_A[32]}},reg_A[32:41]};
						result[48:63]<={{6{reg_A[48]}},reg_A[48:57]};
						result[64:79]<={{6{reg_A[64]}},reg_A[64:73]};
						result[80:95]<={{6{reg_A[80]}},reg_A[80:89]};
						result[96:111]<={{6{reg_A[96]}},reg_A[96:105]};
						result[112:127]<={{6{reg_A[112]}},reg_A[112:121]};
						end
					4'd7:
						begin
						result[0:15]<={{7{reg_A[0]}},reg_A[0:8]};
						result[16:31]<={{7{reg_A[16]}},reg_A[16:24]};
						result[32:47]<={{7{reg_A[32]}},reg_A[32:40]};
						result[48:63]<={{7{reg_A[48]}},reg_A[48:56]};
						result[64:79]<={{7{reg_A[64]}},reg_A[64:72]};
						result[80:95]<={{7{reg_A[80]}},reg_A[80:88]};
						result[96:111]<={{7{reg_A[96]}},reg_A[96:104]};
						result[112:127]<={{7{reg_A[112]}},reg_A[112:120]};
						end
					4'd8:
						begin
						result[0:15]<={{8{reg_A[0]}},reg_A[0:7]};
						result[16:31]<={{8{reg_A[16]}},reg_A[16:23]};
						result[32:47]<={{8{reg_A[32]}},reg_A[32:39]};
						result[48:63]<={{8{reg_A[48]}},reg_A[48:55]};
						result[64:79]<={{8{reg_A[64]}},reg_A[64:71]};
						result[80:95]<={{8{reg_A[80]}},reg_A[80:87]};
						result[96:111]<={{8{reg_A[96]}},reg_A[96:103]};
						result[112:127]<={{8{reg_A[112]}},reg_A[112:119]};
						end
					4'd9:
						begin
						result[0:15]<={{9{reg_A[0]}},reg_A[0:6]};
						result[16:31]<={{9{reg_A[16]}},reg_A[16:22]};
						result[32:47]<={{9{reg_A[32]}},reg_A[32:38]};
						result[48:63]<={{9{reg_A[48]}},reg_A[48:54]};
						result[64:79]<={{9{reg_A[64]}},reg_A[64:70]};
						result[80:95]<={{9{reg_A[80]}},reg_A[80:86]};
						result[96:111]<={{9{reg_A[96]}},reg_A[96:102]};
						result[112:127]<={{9{reg_A[112]}},reg_A[112:118]};
						end
					4'd10:
						begin
						result[0:15]<={{10{reg_A[0]}},reg_A[0:5]};
						result[16:31]<={{10{reg_A[16]}},reg_A[16:21]};
						result[32:47]<={{10{reg_A[32]}},reg_A[32:37]};
						result[48:63]<={{10{reg_A[48]}},reg_A[48:53]};
						result[64:79]<={{10{reg_A[64]}},reg_A[64:69]};
						result[80:95]<={{10{reg_A[80]}},reg_A[80:85]};
						result[96:111]<={{10{reg_A[96]}},reg_A[96:101]};
						result[112:127]<={{10{reg_A[112]}},reg_A[112:117]};
						end
					4'd11:
						begin
						result[0:15]<={{11{reg_A[0]}},reg_A[0:4]};
						result[16:31]<={{11{reg_A[16]}},reg_A[16:20]};
						result[32:47]<={{11{reg_A[32]}},reg_A[32:36]};
						result[48:63]<={{11{reg_A[48]}},reg_A[48:52]};
						result[64:79]<={{11{reg_A[64]}},reg_A[64:68]};
						result[80:95]<={{11{reg_A[80]}},reg_A[80:84]};
						result[96:111]<={{11{reg_A[96]}},reg_A[96:100]};
						result[112:127]<={{11{reg_A[112]}},reg_A[112:116]};
						end
					4'd12:
						begin
						result[0:15]<={{12{reg_A[0]}},reg_A[0:3]};
						result[16:31]<={{12{reg_A[16]}},reg_A[16:19]};
						result[32:47]<={{12{reg_A[32]}},reg_A[32:35]};
						result[48:63]<={{12{reg_A[48]}},reg_A[48:51]};
						result[64:79]<={{12{reg_A[64]}},reg_A[64:67]};
						result[80:95]<={{12{reg_A[80]}},reg_A[80:83]};
						result[96:111]<={{12{reg_A[96]}},reg_A[96:99]};
						result[112:127]<={{12{reg_A[112]}},reg_A[112:115]};
						end
					4'd13:
						begin
						result[0:15]<={{13{reg_A[0]}},reg_A[0:2]};
						result[16:31]<={{13{reg_A[16]}},reg_A[16:18]};
						result[32:47]<={{13{reg_A[32]}},reg_A[32:34]};
						result[48:63]<={{13{reg_A[48]}},reg_A[48:50]};
						result[64:79]<={{13{reg_A[64]}},reg_A[64:66]};
						result[80:95]<={{13{reg_A[80]}},reg_A[80:82]};
						result[96:111]<={{13{reg_A[96]}},reg_A[96:98]};
						result[112:127]<={{13{reg_A[112]}},reg_A[112:114]};
						end
					4'd14:
						begin
						result[0:15]<={{14{reg_A[0]}},reg_A[0:1]};
						result[16:31]<={{14{reg_A[16]}},reg_A[16:17]};
						result[32:47]<={{14{reg_A[32]}},reg_A[32:33]};
						result[48:63]<={{14{reg_A[48]}},reg_A[48:49]};
						result[64:79]<={{14{reg_A[64]}},reg_A[64:65]};
						result[80:95]<={{14{reg_A[80]}},reg_A[80:81]};
						result[96:111]<={{14{reg_A[96]}},reg_A[96:97]};
						result[112:127]<={{14{reg_A[112]}},reg_A[112:113]};
						end
					4'd15:
						begin
						result[0:15]<={{15{reg_A[0]}},reg_A[0]};
						result[16:31]<={{15{reg_A[16]}},reg_A[16]};
						result[32:47]<={{15{reg_A[32]}},reg_A[32]};
						result[48:63]<={{15{reg_A[48]}},reg_A[48]};
						result[64:79]<={{15{reg_A[64]}},reg_A[64]};
						result[80:95]<={{15{reg_A[80]}},reg_A[80]};
						result[96:111]<={{15{reg_A[96]}},reg_A[96]};
						result[112:127]<={{15{reg_A[112]}},reg_A[112]};
						end
				endcase
				end
				`w32:
				begin
				case(reg_B[0:4])
					5'd0:
						begin
						result[0:127]<=reg_A[0:127];
						end
					5'd1:
						begin
						result[0:31]<={{reg_A[0]},reg_A[0:30]};
						result[32:63]<={{reg_A[32]},reg_A[32:62]};
						result[64:95]<={{reg_A[64]},reg_A[64:94]};
						result[96:127]<={{reg_A[96]},reg_A[96:126]};
						end
					5'd2:
						begin
						result[0:31]<={{2{reg_A[0]}},reg_A[0:29]};
						result[32:63]<={{2{reg_A[32]}},reg_A[32:61]};
						result[64:95]<={{2{reg_A[64]}},reg_A[64:93]};
						result[96:127]<={{2{reg_A[96]}},reg_A[96:125]};
						end
					5'd3:
						begin
						result[0:31]<={{3{reg_A[0]}},reg_A[0:28]};
						result[32:63]<={{3{reg_A[32]}},reg_A[32:60]};
						result[64:95]<={{3{reg_A[64]}},reg_A[64:92]};
						result[96:127]<={{3{reg_A[96]}},reg_A[96:124]};
						end
					5'd4:
						begin
						result[0:31]<={{4{reg_A[0]}},reg_A[0:27]};
						result[32:63]<={{4{reg_A[32]}},reg_A[32:59]};
						result[64:95]<={{4{reg_A[64]}},reg_A[64:91]};
						result[96:127]<={{4{reg_A[96]}},reg_A[96:123]};
						end
					5'd5:
						begin
						result[0:31]<={{5{reg_A[0]}},reg_A[0:26]};
						result[32:63]<={{5{reg_A[32]}},reg_A[32:58]};
						result[64:95]<={{5{reg_A[64]}},reg_A[64:90]};
						result[96:127]<={{5{reg_A[96]}},reg_A[96:122]};
						end
					5'd6:
						begin
						result[0:31]<={{6{reg_A[0]}},reg_A[0:25]};
						result[32:63]<={{6{reg_A[32]}},reg_A[32:57]};
						result[64:95]<={{6{reg_A[64]}},reg_A[64:89]};
						result[96:127]<={{6{reg_A[96]}},reg_A[96:121]};
						end
					5'd7:
						begin
						result[0:31]<={{7{reg_A[0]}},reg_A[0:24]};
						result[32:63]<={{7{reg_A[32]}},reg_A[32:56]};
						result[64:95]<={{7{reg_A[64]}},reg_A[64:88]};
						result[96:127]<={{7{reg_A[96]}},reg_A[96:120]};
						end
					5'd8:
						begin
						result[0:31]<={{8{reg_A[0]}},reg_A[0:23]};
						result[32:63]<={{8{reg_A[32]}},reg_A[32:55]};
						result[64:95]<={{8{reg_A[64]}},reg_A[64:87]};
						result[96:127]<={{8{reg_A[96]}},reg_A[96:119]};
						end
					5'd9:
						begin
						result[0:31]<={{9{reg_A[0]}},reg_A[0:22]};
						result[32:63]<={{9{reg_A[32]}},reg_A[32:54]};
						result[64:95]<={{9{reg_A[64]}},reg_A[64:86]};
						result[96:127]<={{9{reg_A[96]}},reg_A[96:118]};
						end
					5'd10:
						begin
						result[0:31]<={{10{reg_A[0]}},reg_A[0:21]};
						result[32:63]<={{10{reg_A[32]}},reg_A[32:53]};
						result[64:95]<={{10{reg_A[64]}},reg_A[64:85]};
						result[96:127]<={{10{reg_A[96]}},reg_A[96:117]};
						end
					5'd11:
						begin
						result[0:31]<={{11{reg_A[0]}},reg_A[0:20]};
						result[32:63]<={{11{reg_A[32]}},reg_A[32:52]};
						result[64:95]<={{11{reg_A[64]}},reg_A[64:84]};
						result[96:127]<={{11{reg_A[96]}},reg_A[96:116]};
						end
					5'd12:
						begin
						result[0:31]<={{12{reg_A[0]}},reg_A[0:19]};
						result[32:63]<={{12{reg_A[32]}},reg_A[32:51]};
						result[64:95]<={{12{reg_A[64]}},reg_A[64:83]};
						result[96:127]<={{12{reg_A[96]}},reg_A[96:115]};
						end
					5'd13:
						begin
						result[0:31]<={{13{reg_A[0]}},reg_A[0:18]};
						result[32:63]<={{13{reg_A[32]}},reg_A[32:50]};
						result[64:95]<={{13{reg_A[64]}},reg_A[64:82]};
						result[96:127]<={{13{reg_A[96]}},reg_A[96:114]};
						end
					5'd14:
						begin
						result[0:31]<={{14{reg_A[0]}},reg_A[0:17]};
						result[32:63]<={{14{reg_A[32]}},reg_A[32:49]};
						result[64:95]<={{14{reg_A[64]}},reg_A[64:81]};
						result[96:127]<={{14{reg_A[96]}},reg_A[96:113]};
						end
					5'd15:
						begin
						result[0:31]<={{15{reg_A[0]}},reg_A[0:16]};
						result[32:63]<={{15{reg_A[32]}},reg_A[32:48]};
						result[64:95]<={{15{reg_A[64]}},reg_A[64:80]};
						result[96:127]<={{15{reg_A[96]}},reg_A[96:112]};
						end
					5'd16:
						begin
						result[0:31]<={{16{reg_A[0]}},reg_A[0:15]};
						result[32:63]<={{16{reg_A[32]}},reg_A[32:47]};
						result[64:95]<={{16{reg_A[64]}},reg_A[64:79]};
						result[96:127]<={{16{reg_A[96]}},reg_A[96:111]};
						end
					5'd17:
						begin
						result[0:31]<={{17{reg_A[0]}},reg_A[0:14]};
						result[32:63]<={{17{reg_A[32]}},reg_A[32:46]};
						result[64:95]<={{17{reg_A[64]}},reg_A[64:78]};
						result[96:127]<={{17{reg_A[96]}},reg_A[96:110]};
						end
					5'd18:
						begin
						result[0:31]<={{18{reg_A[0]}},reg_A[0:13]};
						result[32:63]<={{18{reg_A[32]}},reg_A[32:45]};
						result[64:95]<={{18{reg_A[64]}},reg_A[64:77]};
						result[96:127]<={{18{reg_A[96]}},reg_A[96:109]};
						end
					5'd19:
						begin
						result[0:31]<={{19{reg_A[0]}},reg_A[0:12]};
						result[32:63]<={{19{reg_A[32]}},reg_A[32:44]};
						result[64:95]<={{19{reg_A[64]}},reg_A[64:76]};
						result[96:127]<={{19{reg_A[96]}},reg_A[96:108]};
						end
					5'd20:
						begin
						result[0:31]<={{20{reg_A[0]}},reg_A[0:11]};
						result[32:63]<={{20{reg_A[32]}},reg_A[32:43]};
						result[64:95]<={{20{reg_A[64]}},reg_A[64:75]};
						result[96:127]<={{20{reg_A[96]}},reg_A[96:107]};
						end
					5'd21:
						begin
						result[0:31]<={{21{reg_A[0]}},reg_A[0:10]};
						result[32:63]<={{21{reg_A[32]}},reg_A[32:42]};
						result[64:95]<={{21{reg_A[64]}},reg_A[64:74]};
						result[96:127]<={{21{reg_A[96]}},reg_A[96:106]};
						end
					5'd22:
						begin
						result[0:31]<={{22{reg_A[0]}},reg_A[0:9]};
						result[32:63]<={{22{reg_A[32]}},reg_A[32:41]};
						result[64:95]<={{22{reg_A[64]}},reg_A[64:73]};
						result[96:127]<={{22{reg_A[96]}},reg_A[96:105]};
						end
					5'd23:
						begin
						result[0:31]<={{23{reg_A[0]}},reg_A[0:8]};
						result[32:63]<={{23{reg_A[32]}},reg_A[32:40]};
						result[64:95]<={{23{reg_A[64]}},reg_A[64:72]};
						result[96:127]<={{23{reg_A[96]}},reg_A[96:104]};
						end
					5'd24:
						begin
						result[0:31]<={{24{reg_A[0]}},reg_A[0:7]};
						result[32:63]<={{24{reg_A[32]}},reg_A[32:39]};
						result[64:95]<={{24{reg_A[64]}},reg_A[64:71]};
						result[96:127]<={{24{reg_A[96]}},reg_A[96:103]};
						end
					5'd25:
						begin
						result[0:31]<={{25{reg_A[0]}},reg_A[0:6]};
						result[32:63]<={{25{reg_A[32]}},reg_A[32:38]};
						result[64:95]<={{25{reg_A[64]}},reg_A[64:70]};
						result[96:127]<={{25{reg_A[96]}},reg_A[96:102]};
						end
					5'd26:
						begin
						result[0:31]<={{26{reg_A[0]}},reg_A[0:5]};
						result[32:63]<={{26{reg_A[32]}},reg_A[32:37]};
						result[64:95]<={{26{reg_A[64]}},reg_A[64:69]};
						result[96:127]<={{26{reg_A[96]}},reg_A[96:101]};
						end
					5'd27:
						begin
						result[0:31]<={{27{reg_A[0]}},reg_A[0:4]};
						result[32:63]<={{27{reg_A[32]}},reg_A[32:36]};
						result[64:95]<={{27{reg_A[64]}},reg_A[64:68]};
						result[96:127]<={{27{reg_A[96]}},reg_A[96:100]};
						end
					5'd28:
						begin
						result[0:31]<={{28{reg_A[0]}},reg_A[0:3]};
						result[32:63]<={{28{reg_A[32]}},reg_A[32:35]};
						result[64:95]<={{28{reg_A[64]}},reg_A[64:67]};
						result[96:127]<={{28{reg_A[96]}},reg_A[96:99]};
						end
					5'd29:
						begin
						result[0:31]<={{29{reg_A[0]}},reg_A[0:2]};
						result[32:63]<={{29{reg_A[32]}},reg_A[32:34]};
						result[64:95]<={{29{reg_A[64]}},reg_A[64:66]};
						result[96:127]<={{29{reg_A[96]}},reg_A[96:98]};
						end
					5'd30:
						begin
						result[0:31]<={{30{reg_A[0]}},reg_A[0:1]};
						result[32:63]<={{30{reg_A[32]}},reg_A[32:33]};
						result[64:95]<={{30{reg_A[64]}},reg_A[64:65]};
						result[96:127]<={{30{reg_A[96]}},reg_A[96:97]};
						end
					5'd31:
						begin
						result[0:31]<={{31{reg_A[0]}},reg_A[0]};
						result[32:63]<={{31{reg_A[32]}},reg_A[32]};
						result[64:95]<={{31{reg_A[64]}},reg_A[64]};
						result[96:127]<={{31{reg_A[96]}},reg_A[96]};
						end
				endcase
				end
			endcase
			end
			




			// ==============================================================

			// SRA instruction
			
			`aluwsra:
			begin
			case(ctrl_ww)
				`w8:
				begin
				case(reg_B[5:7]) // byte 0
					3'd0:
						result[0:7]<=reg_A[0:7];
					3'd1:
						result[0:7]<={{1{reg_A[0]}},reg_A[0:6]};
					3'd2:
						result[0:7]<={{2{reg_A[0]}},reg_A[0:5]};
					3'd3:
						result[0:7]<={{3{reg_A[0]}},reg_A[0:4]};
					3'd4:
						result[0:7]<={{4{reg_A[0]}},reg_A[0:3]};
					3'd5:
						result[0:7]<={{5{reg_A[0]}},reg_A[0:2]};
					3'd6:
						result[0:7]<={{6{reg_A[0]}},reg_A[0:1]};
					3'd7:
						result[0:7]<={{7{reg_A[0]}},reg_A[0]};
				endcase
				case(reg_B[13:15]) // byte 1
					3'd0:
						result[8:15]<=reg_A[8:15];
					3'd1:
						result[8:15]<={{1{reg_A[8]}},reg_A[8:14]};
					3'd2:
						result[8:15]<={{2{reg_A[8]}},reg_A[8:13]};
					3'd3:
						result[8:15]<={{3{reg_A[8]}},reg_A[8:12]};
					3'd4:
						result[8:15]<={{4{reg_A[8]}},reg_A[8:11]};
					3'd5:
						result[8:15]<={{5{reg_A[8]}},reg_A[8:10]};
					3'd6:
						result[8:15]<={{6{reg_A[8]}},reg_A[8:9]};
					3'd7:
						result[8:15]<={{7{reg_A[8]}},reg_A[8]};
				endcase
				case(reg_B[21:23]) // byte 2
					3'd0:
						result[16:23]<=reg_A[16:23];
					3'd1:
						result[16:23]<={{1{reg_A[16]}},reg_A[16:22]};
					3'd2:
						result[16:23]<={{2{reg_A[16]}},reg_A[16:21]};
					3'd3:
						result[16:23]<={{3{reg_A[16]}},reg_A[16:20]};
					3'd4:
						result[16:23]<={{4{reg_A[16]}},reg_A[16:19]};
					3'd5:
						result[16:23]<={{5{reg_A[16]}},reg_A[16:18]};
					3'd6:
						result[16:23]<={{6{reg_A[16]}},reg_A[16:17]};
					3'd7:
						result[16:23]<={{7{reg_A[16]}},reg_A[16]};
				endcase
				case(reg_B[29:31]) // byte 3
					3'd0:
						result[24:31]<=reg_A[24:31];
					3'd1:
						result[24:31]<={{1{reg_A[24]}},reg_A[24:30]};
					3'd2:
						result[24:31]<={{2{reg_A[24]}},reg_A[24:29]};
					3'd3:
						result[24:31]<={{3{reg_A[24]}},reg_A[24:28]};
					3'd4:
						result[24:31]<={{4{reg_A[24]}},reg_A[24:27]};
					3'd5:
						result[24:31]<={{5{reg_A[24]}},reg_A[24:26]};
					3'd6:
						result[24:31]<={{6{reg_A[24]}},reg_A[24:25]};
					3'd7:
						result[24:31]<={{7{reg_A[24]}},reg_A[24]};
				endcase
				case(reg_B[37:39]) // byte 4
					3'd0:
						result[32:39]<=reg_A[32:39];
					3'd1:
						result[32:39]<={{1{reg_A[32]}},reg_A[32:38]};
					3'd2:
						result[32:39]<={{2{reg_A[32]}},reg_A[32:37]};
					3'd3:
						result[32:39]<={{3{reg_A[32]}},reg_A[32:36]};
					3'd4:
						result[32:39]<={{4{reg_A[32]}},reg_A[32:35]};
					3'd5:
						result[32:39]<={{5{reg_A[32]}},reg_A[32:34]};
					3'd6:
						result[32:39]<={{6{reg_A[32]}},reg_A[32:33]};
					3'd7:
						result[32:39]<={{7{reg_A[32]}},reg_A[32]};
				endcase
				case(reg_B[45:47]) // byte 5
					3'd0:
						result[40:47]<=reg_A[40:47];
					3'd1:
						result[40:47]<={{1{reg_A[40]}},reg_A[40:46]};
					3'd2:
						result[40:47]<={{2{reg_A[40]}},reg_A[40:45]};
					3'd3:
						result[40:47]<={{3{reg_A[40]}},reg_A[40:44]};
					3'd4:
						result[40:47]<={{4{reg_A[40]}},reg_A[40:43]};
					3'd5:
						result[40:47]<={{5{reg_A[40]}},reg_A[40:42]};
					3'd6:
						result[40:47]<={{6{reg_A[40]}},reg_A[40:41]};
					3'd7:
						result[40:47]<={{7{reg_A[40]}},reg_A[40]};
				endcase
				case(reg_B[53:55]) // byte 6
					3'd0:
						result[48:55]<=reg_A[48:55];
					3'd1:
						result[48:55]<={{1{reg_A[48]}},reg_A[48:54]};
					3'd2:
						result[48:55]<={{2{reg_A[48]}},reg_A[48:53]};
					3'd3:
						result[48:55]<={{3{reg_A[48]}},reg_A[48:52]};
					3'd4:
						result[48:55]<={{4{reg_A[48]}},reg_A[48:51]};
					3'd5:
						result[48:55]<={{5{reg_A[48]}},reg_A[48:50]};
					3'd6:
						result[48:55]<={{6{reg_A[48]}},reg_A[48:49]};
					3'd7:
						result[48:55]<={{7{reg_A[48]}},reg_A[48]};
				endcase
				case(reg_B[61:63]) // byte 7
					3'd0:
						result[56:63]<=reg_A[56:63];
					3'd1:
						result[56:63]<={{1{reg_A[56]}},reg_A[56:62]};
					3'd2:
						result[56:63]<={{2{reg_A[56]}},reg_A[56:61]};
					3'd3:
						result[56:63]<={{3{reg_A[56]}},reg_A[56:60]};
					3'd4:
						result[56:63]<={{4{reg_A[56]}},reg_A[56:59]};
					3'd5:
						result[56:63]<={{5{reg_A[56]}},reg_A[56:58]};
					3'd6:
						result[56:63]<={{6{reg_A[56]}},reg_A[56:57]};
					3'd7:
						result[56:63]<={{7{reg_A[56]}},reg_A[56]};
				endcase
				case(reg_B[69:71]) // byte 8
					3'd0:
						result[64:71]<=reg_A[64:71];
					3'd1:
						result[64:71]<={{1{reg_A[64]}},reg_A[64:70]};
					3'd2:
						result[64:71]<={{2{reg_A[64]}},reg_A[64:69]};
					3'd3:
						result[64:71]<={{3{reg_A[64]}},reg_A[64:68]};
					3'd4:
						result[64:71]<={{4{reg_A[64]}},reg_A[64:67]};
					3'd5:
						result[64:71]<={{5{reg_A[64]}},reg_A[64:66]};
					3'd6:
						result[64:71]<={{6{reg_A[64]}},reg_A[64:65]};
					3'd7:
						result[64:71]<={{7{reg_A[64]}},reg_A[64]};
				endcase
				case(reg_B[77:79]) // byte 9
					3'd0:
						result[72:79]<=reg_A[72:79];
					3'd1:
						result[72:79]<={{1{reg_A[72]}},reg_A[72:78]};
					3'd2:
						result[72:79]<={{2{reg_A[72]}},reg_A[72:77]};
					3'd3:
						result[72:79]<={{3{reg_A[72]}},reg_A[72:76]};
					3'd4:
						result[72:79]<={{4{reg_A[72]}},reg_A[72:75]};
					3'd5:
						result[72:79]<={{5{reg_A[72]}},reg_A[72:74]};
					3'd6:
						result[72:79]<={{6{reg_A[72]}},reg_A[72:73]};
					3'd7:
						result[72:79]<={{7{reg_A[72]}},reg_A[72]};
				endcase
				case(reg_B[85:87]) // byte 10
					3'd0:
						result[80:87]<=reg_A[80:87];
					3'd1:
						result[80:87]<={{1{reg_A[80]}},reg_A[80:86]};
					3'd2:
						result[80:87]<={{2{reg_A[80]}},reg_A[80:85]};
					3'd3:
						result[80:87]<={{3{reg_A[80]}},reg_A[80:84]};
					3'd4:
						result[80:87]<={{4{reg_A[80]}},reg_A[80:83]};
					3'd5:
						result[80:87]<={{5{reg_A[80]}},reg_A[80:82]};
					3'd6:
						result[80:87]<={{6{reg_A[80]}},reg_A[80:81]};
					3'd7:
						result[80:87]<={{7{reg_A[80]}},reg_A[80]};
				endcase
				case(reg_B[93:95]) // byte 11
					3'd0:
						result[88:95]<=reg_A[88:95];
					3'd1:
						result[88:95]<={{1{reg_A[88]}},reg_A[88:94]};
					3'd2:
						result[88:95]<={{2{reg_A[88]}},reg_A[88:93]};
					3'd3:
						result[88:95]<={{3{reg_A[88]}},reg_A[88:92]};
					3'd4:
						result[88:95]<={{4{reg_A[88]}},reg_A[88:91]};
					3'd5:
						result[88:95]<={{5{reg_A[88]}},reg_A[88:90]};
					3'd6:
						result[88:95]<={{6{reg_A[88]}},reg_A[88:89]};
					3'd7:
						result[88:95]<={{7{reg_A[88]}},reg_A[88]};
				endcase
				case(reg_B[101:103]) // byte 12
					3'd0:
						result[96:103]<=reg_A[96:103];
					3'd1:
						result[96:103]<={{1{reg_A[96]}},reg_A[96:102]};
					3'd2:
						result[96:103]<={{2{reg_A[96]}},reg_A[96:101]};
					3'd3:
						result[96:103]<={{3{reg_A[96]}},reg_A[96:100]};
					3'd4:
						result[96:103]<={{4{reg_A[96]}},reg_A[96:99]};
					3'd5:
						result[96:103]<={{5{reg_A[96]}},reg_A[96:98]};
					3'd6:
						result[96:103]<={{6{reg_A[96]}},reg_A[96:97]};
					3'd7:
						result[96:103]<={{7{reg_A[96]}},reg_A[96]};
				endcase
				case(reg_B[109:111]) // byte 13
					3'd0:
						result[104:111]<=reg_A[104:111];
					3'd1:
						result[104:111]<={{1{reg_A[104]}},reg_A[104:110]};
					3'd2:
						result[104:111]<={{2{reg_A[104]}},reg_A[104:109]};
					3'd3:
						result[104:111]<={{3{reg_A[104]}},reg_A[104:108]};
					3'd4:
						result[104:111]<={{4{reg_A[104]}},reg_A[104:107]};
					3'd5:
						result[104:111]<={{5{reg_A[104]}},reg_A[104:106]};
					3'd6:
						result[104:111]<={{6{reg_A[104]}},reg_A[104:105]};
					3'd7:
						result[104:111]<={{7{reg_A[104]}},reg_A[104]};
				endcase
				case(reg_B[117:119]) // byte 14
					3'd0:
						result[112:119]<=reg_A[112:119];
					3'd1:
						result[112:119]<={{1{reg_A[112]}},reg_A[112:118]};
					3'd2:
						result[112:119]<={{2{reg_A[112]}},reg_A[112:117]};
					3'd3:
						result[112:119]<={{3{reg_A[112]}},reg_A[112:116]};
					3'd4:
						result[112:119]<={{4{reg_A[112]}},reg_A[112:115]};
					3'd5:
						result[112:119]<={{5{reg_A[112]}},reg_A[112:114]};
					3'd6:
						result[112:119]<={{6{reg_A[112]}},reg_A[112:113]};
					3'd7:
						result[112:119]<={{7{reg_A[112]}},reg_A[112]};
				endcase
				case(reg_B[125:127]) // byte 15
					3'd0:
						result[120:127]<=reg_A[120:127];
					3'd1:
						result[120:127]<={{1{reg_A[120]}},reg_A[120:126]};
					3'd2:
						result[120:127]<={{2{reg_A[120]}},reg_A[120:125]};
					3'd3:
						result[120:127]<={{3{reg_A[120]}},reg_A[120:124]};
					3'd4:
						result[120:127]<={{4{reg_A[120]}},reg_A[120:123]};
					3'd5:
						result[120:127]<={{5{reg_A[120]}},reg_A[120:122]};
					3'd6:
						result[120:127]<={{6{reg_A[120]}},reg_A[120:121]};
					3'd7:
						result[120:127]<={{7{reg_A[120]}},reg_A[120]};
				endcase
				end

				`w16:
				begin
				case(reg_B[12:15]) // word0
					4'd0:
						result[0:15]<=reg_A[0:15];
					4'd1:
						result[0:15]<={{1{reg_A[0]}},reg_A[0:14]};
					4'd2:
						result[0:15]<={{2{reg_A[0]}},reg_A[0:13]};
					4'd3:
						result[0:15]<={{3{reg_A[0]}},reg_A[0:12]};
					4'd4:
						result[0:15]<={{4{reg_A[0]}},reg_A[0:11]};
					4'd5:
						result[0:15]<={{5{reg_A[0]}},reg_A[0:10]};
					4'd6:
						result[0:15]<={{6{reg_A[0]}},reg_A[0:9]};
					4'd7:
						result[0:15]<={{7{reg_A[0]}},reg_A[0:8]};
					4'd8:
						result[0:15]<={{8{reg_A[0]}},reg_A[0:7]};
					4'd9:
						result[0:15]<={{9{reg_A[0]}},reg_A[0:6]};
					4'd10:
						result[0:15]<={{10{reg_A[0]}},reg_A[0:5]};
					4'd11:
						result[0:15]<={{11{reg_A[0]}},reg_A[0:4]};
					4'd12:
						result[0:15]<={{12{reg_A[0]}},reg_A[0:3]};
					4'd13:
						result[0:15]<={{13{reg_A[0]}},reg_A[0:2]};
					4'd14:
						result[0:15]<={{14{reg_A[0]}},reg_A[0:1]};
					4'd15:
						result[0:15]<={{15{reg_A[0]}},reg_A[0]};
				endcase
				case(reg_B[28:31]) //word1
					4'd0:
						result[16:31]<=reg_A[16:31];
					4'd1:
						result[16:31]<={{1{reg_A[16]}},reg_A[16:30]};
					4'd2:
						result[16:31]<={{2{reg_A[16]}},reg_A[16:29]};
					4'd3:
						result[16:31]<={{3{reg_A[16]}},reg_A[16:28]};
					4'd4:
						result[16:31]<={{4{reg_A[16]}},reg_A[16:27]};
					4'd5:
						result[16:31]<={{5{reg_A[16]}},reg_A[16:26]};
					4'd6:
						result[16:31]<={{6{reg_A[16]}},reg_A[16:25]};
					4'd7:
						result[16:31]<={{7{reg_A[16]}},reg_A[16:24]};
					4'd8:
						result[16:31]<={{8{reg_A[16]}},reg_A[16:23]};
					4'd9:
						result[16:31]<={{9{reg_A[16]}},reg_A[16:22]};
					4'd10:
						result[16:31]<={{10{reg_A[16]}},reg_A[16:21]};
					4'd11:
						result[16:31]<={{11{reg_A[16]}},reg_A[16:20]};
					4'd12:
						result[16:31]<={{12{reg_A[16]}},reg_A[16:19]};
					4'd13:
						result[16:31]<={{13{reg_A[16]}},reg_A[16:18]};
					4'd14:
						result[16:31]<={{14{reg_A[16]}},reg_A[16:17]};
					4'd15:
						result[16:31]<={{15{reg_A[16]}},reg_A[16]};
				endcase
				case(reg_B[44:47]) // word2
					4'd0:
						result[32:47]<=reg_A[32:47];
					4'd1:
						result[32:47]<={{1{reg_A[32]}},reg_A[32:46]};
					4'd2:
						result[32:47]<={{2{reg_A[32]}},reg_A[32:45]};
					4'd3:
						result[32:47]<={{3{reg_A[32]}},reg_A[32:44]};
					4'd4:
						result[32:47]<={{4{reg_A[32]}},reg_A[32:43]};
					4'd5:
						result[32:47]<={{5{reg_A[32]}},reg_A[32:42]};
					4'd6:
						result[32:47]<={{6{reg_A[32]}},reg_A[32:41]};
					4'd7:
						result[32:47]<={{7{reg_A[32]}},reg_A[32:40]};
					4'd8:
						result[32:47]<={{8{reg_A[32]}},reg_A[32:39]};
					4'd9:
						result[32:47]<={{9{reg_A[32]}},reg_A[32:38]};
					4'd10:
						result[32:47]<={{10{reg_A[32]}},reg_A[32:37]};
					4'd11:
						result[32:47]<={{11{reg_A[32]}},reg_A[32:36]};
					4'd12:
						result[32:47]<={{12{reg_A[32]}},reg_A[32:35]};
					4'd13:
						result[32:47]<={{13{reg_A[32]}},reg_A[32:34]};
					4'd14:
						result[32:47]<={{14{reg_A[32]}},reg_A[32:33]};
					4'd15:
						result[32:47]<={{15{reg_A[32]}},reg_A[32]};
				endcase
				case(reg_B[60:63]) // word3
					4'd0:
						result[48:63]<=reg_A[48:63];
					4'd1:
						result[48:63]<={{1{reg_A[48]}},reg_A[48:62]};
					4'd2:
						result[48:63]<={{2{reg_A[48]}},reg_A[48:61]};
					4'd3:
						result[48:63]<={{3{reg_A[48]}},reg_A[48:60]};
					4'd4:
						result[48:63]<={{4{reg_A[48]}},reg_A[48:59]};
					4'd5:
						result[48:63]<={{5{reg_A[48]}},reg_A[48:58]};
					4'd6:
						result[48:63]<={{6{reg_A[48]}},reg_A[48:57]};
					4'd7:
						result[48:63]<={{7{reg_A[48]}},reg_A[48:56]};
					4'd8:
						result[48:63]<={{8{reg_A[48]}},reg_A[48:55]};
					4'd9:
						result[48:63]<={{9{reg_A[48]}},reg_A[48:54]};
					4'd10:
						result[48:63]<={{10{reg_A[48]}},reg_A[48:53]};
					4'd11:
						result[48:63]<={{11{reg_A[48]}},reg_A[48:52]};
					4'd12:
						result[48:63]<={{12{reg_A[48]}},reg_A[48:51]};
					4'd13:
						result[48:63]<={{13{reg_A[48]}},reg_A[48:50]};
					4'd14:
						result[48:63]<={{14{reg_A[48]}},reg_A[48:49]};
					4'd15:
						result[48:63]<={{15{reg_A[48]}},reg_A[48]};
				endcase
				case(reg_B[76:79]) // word4
					4'd0:
						result[64:79]<=reg_A[64:79];
					4'd1:
						result[64:79]<={{1{reg_A[64]}},reg_A[64:78]};
					4'd2:
						result[64:79]<={{2{reg_A[64]}},reg_A[64:77]};
					4'd3:
						result[64:79]<={{3{reg_A[64]}},reg_A[64:76]};
					4'd4:
						result[64:79]<={{4{reg_A[64]}},reg_A[64:75]};
					4'd5:
						result[64:79]<={{5{reg_A[64]}},reg_A[64:74]};
					4'd6:
						result[64:79]<={{6{reg_A[64]}},reg_A[64:73]};
					4'd7:
						result[64:79]<={{7{reg_A[64]}},reg_A[64:72]};
					4'd8:
						result[64:79]<={{8{reg_A[64]}},reg_A[64:71]};
					4'd9:
						result[64:79]<={{9{reg_A[64]}},reg_A[64:70]};
					4'd10:
						result[64:79]<={{10{reg_A[64]}},reg_A[64:69]};
					4'd11:
						result[64:79]<={{11{reg_A[64]}},reg_A[64:68]};
					4'd12:
						result[64:79]<={{12{reg_A[64]}},reg_A[64:67]};
					4'd13:
						result[64:79]<={{13{reg_A[64]}},reg_A[64:66]};
					4'd14:
						result[64:79]<={{14{reg_A[64]}},reg_A[64:65]};
					4'd15:
						result[64:79]<={{15{reg_A[64]}},reg_A[64]};
				endcase
				case(reg_B[92:95]) // word5
					4'd0:
						result[80:95]<=reg_A[80:95];
					4'd1:
						result[80:95]<={{1{reg_A[80]}},reg_A[80:94]};
					4'd2:
						result[80:95]<={{2{reg_A[80]}},reg_A[80:93]};
					4'd3:
						result[80:95]<={{3{reg_A[80]}},reg_A[80:92]};
					4'd4:
						result[80:95]<={{4{reg_A[80]}},reg_A[80:91]};
					4'd5:
						result[80:95]<={{5{reg_A[80]}},reg_A[80:90]};
					4'd6:
						result[80:95]<={{6{reg_A[80]}},reg_A[80:89]};
					4'd7:
						result[80:95]<={{7{reg_A[80]}},reg_A[80:88]};
					4'd8:
						result[80:95]<={{8{reg_A[80]}},reg_A[80:87]};
					4'd9:
						result[80:95]<={{9{reg_A[80]}},reg_A[80:86]};
					4'd10:
						result[80:95]<={{10{reg_A[80]}},reg_A[80:85]};
					4'd11:
						result[80:95]<={{11{reg_A[80]}},reg_A[80:84]};
					4'd12:
						result[80:95]<={{12{reg_A[80]}},reg_A[80:83]};
					4'd13:
						result[80:95]<={{13{reg_A[80]}},reg_A[80:82]};
					4'd14:
						result[80:95]<={{14{reg_A[80]}},reg_A[80:81]};
					4'd15:
						result[80:95]<={{15{reg_A[80]}},reg_A[80]};
				endcase
				case(reg_B[92:111]) // word6
					4'd0:
						result[96:111]<=reg_A[96:111];
					4'd1:
						result[96:111]<={{1{reg_A[96]}},reg_A[96:110]};
					4'd2:
						result[96:111]<={{2{reg_A[96]}},reg_A[96:109]};
					4'd3:
						result[96:111]<={{3{reg_A[96]}},reg_A[96:108]};
					4'd4:
						result[96:111]<={{4{reg_A[96]}},reg_A[96:107]};
					4'd5:
						result[96:111]<={{5{reg_A[96]}},reg_A[96:106]};
					4'd6:
						result[96:111]<={{6{reg_A[96]}},reg_A[96:105]};
					4'd7:
						result[96:111]<={{7{reg_A[96]}},reg_A[96:104]};
					4'd8:
						result[96:111]<={{8{reg_A[96]}},reg_A[96:103]};
					4'd9:
						result[96:111]<={{9{reg_A[96]}},reg_A[96:102]};
					4'd10:
						result[96:111]<={{10{reg_A[96]}},reg_A[96:101]};
					4'd11:
						result[96:111]<={{11{reg_A[96]}},reg_A[96:100]};
					4'd12:
						result[96:111]<={{12{reg_A[96]}},reg_A[96:99]};
					4'd13:
						result[96:111]<={{13{reg_A[96]}},reg_A[96:98]};
					4'd14:
						result[96:111]<={{14{reg_A[96]}},reg_A[96:97]};
					4'd15:
						result[96:111]<={{15{reg_A[96]}},reg_A[96]};
				endcase
				case(reg_B[92:127]) // word7
					4'd0:
						result[112:127]<=reg_A[112:127];
					4'd1:
						result[112:127]<={{1{reg_A[112]}},reg_A[112:126]};
					4'd2:
						result[112:127]<={{2{reg_A[112]}},reg_A[112:125]};
					4'd3:
						result[112:127]<={{3{reg_A[112]}},reg_A[112:124]};
					4'd4:
						result[112:127]<={{4{reg_A[112]}},reg_A[112:123]};
					4'd5:
						result[112:127]<={{5{reg_A[112]}},reg_A[112:122]};
					4'd6:
						result[112:127]<={{6{reg_A[112]}},reg_A[112:121]};
					4'd7:
						result[112:127]<={{7{reg_A[112]}},reg_A[112:120]};
					4'd8:
						result[112:127]<={{8{reg_A[112]}},reg_A[112:119]};
					4'd9:
						result[112:127]<={{9{reg_A[112]}},reg_A[112:118]};
					4'd10:
						result[112:127]<={{10{reg_A[112]}},reg_A[112:117]};
					4'd11:
						result[112:127]<={{11{reg_A[112]}},reg_A[112:116]};
					4'd12:
						result[112:127]<={{12{reg_A[112]}},reg_A[112:115]};
					4'd13:
						result[112:127]<={{13{reg_A[112]}},reg_A[112:114]};
					4'd14:
						result[112:127]<={{14{reg_A[112]}},reg_A[112:113]};
					4'd15:
						result[112:127]<={{15{reg_A[112]}},reg_A[112]};
				endcase
				end

				`w32:
				begin
				case(reg_B[27:31])
					5'd0:
						result[0:31]<=reg_A[0:31];
					5'd1:
						result[0:31]<={{1{reg_A[0]}},reg_A[0:30]};
					5'd2:
						result[0:31]<={{2{reg_A[0]}},reg_A[0:29]};
					5'd3:
						result[0:31]<={{3{reg_A[0]}},reg_A[0:28]};
					5'd4:
						result[0:31]<={{4{reg_A[0]}},reg_A[0:27]};
					5'd5:
						result[0:31]<={{5{reg_A[0]}},reg_A[0:26]};
					5'd6:
						result[0:31]<={{6{reg_A[0]}},reg_A[0:25]};
					5'd7:
						result[0:31]<={{7{reg_A[0]}},reg_A[0:24]};
					5'd8:
						result[0:31]<={{8{reg_A[0]}},reg_A[0:23]};
					5'd9:
						result[0:31]<={{9{reg_A[0]}},reg_A[0:22]};
					5'd10:
						result[0:31]<={{10{reg_A[0]}},reg_A[0:21]};
					5'd11:
						result[0:31]<={{11{reg_A[0]}},reg_A[0:20]};
					5'd12:
						result[0:31]<={{12{reg_A[0]}},reg_A[0:19]};
					5'd13:
						result[0:31]<={{13{reg_A[0]}},reg_A[0:18]};
					5'd14:
						result[0:31]<={{14{reg_A[0]}},reg_A[0:17]};
					5'd15:
						result[0:31]<={{15{reg_A[0]}},reg_A[0:16]};
					5'd16:
						result[0:31]<={{16{reg_A[0]}},reg_A[0:15]};
					5'd17:
						result[0:31]<={{17{reg_A[0]}},reg_A[0:14]};
					5'd18:
						result[0:31]<={{18{reg_A[0]}},reg_A[0:13]};
					5'd19:
						result[0:31]<={{19{reg_A[0]}},reg_A[0:12]};
					5'd20:
						result[0:31]<={{20{reg_A[0]}},reg_A[0:11]};
					5'd21:
						result[0:31]<={{21{reg_A[0]}},reg_A[0:10]};
					5'd22:
						result[0:31]<={{22{reg_A[0]}},reg_A[0:9]};
					5'd23:
						result[0:31]<={{23{reg_A[0]}},reg_A[0:8]};
					5'd24:
						result[0:31]<={{24{reg_A[0]}},reg_A[0:7]};
					5'd25:
						result[0:31]<={{25{reg_A[0]}},reg_A[0:6]};
					5'd26:
						result[0:31]<={{26{reg_A[0]}},reg_A[0:5]};
					5'd27:
						result[0:31]<={{27{reg_A[0]}},reg_A[0:4]};
					5'd28:
						result[0:31]<={{28{reg_A[0]}},reg_A[0:3]};
					5'd29:
						result[0:31]<={{29{reg_A[0]}},reg_A[0:2]};
					5'd30:
						result[0:31]<={{30{reg_A[0]}},reg_A[0:1]};
					5'd31:
						result[0:31]<={{31{reg_A[0]}},reg_A[0]};
				endcase
				case(reg_B[59:63])
					5'd0:
						result[32:63]<=reg_A[32:63];
					5'd1:
						result[32:63]<={{1{reg_A[32]}},reg_A[32:62]};
					5'd2:
						result[32:63]<={{2{reg_A[32]}},reg_A[32:61]};
					5'd3:
						result[32:63]<={{3{reg_A[32]}},reg_A[32:60]};
					5'd4:
						result[32:63]<={{4{reg_A[32]}},reg_A[32:59]};
					5'd5:
						result[32:63]<={{5{reg_A[32]}},reg_A[32:58]};
					5'd6:
						result[32:63]<={{6{reg_A[32]}},reg_A[32:57]};
					5'd7:
						result[32:63]<={{7{reg_A[32]}},reg_A[32:56]};
					5'd8:
						result[32:63]<={{8{reg_A[32]}},reg_A[32:55]};
					5'd9:
						result[32:63]<={{9{reg_A[32]}},reg_A[32:54]};
					5'd10:
						result[32:63]<={{10{reg_A[32]}},reg_A[32:53]};
					5'd11:
						result[32:63]<={{11{reg_A[32]}},reg_A[32:52]};
					5'd12:
						result[32:63]<={{12{reg_A[32]}},reg_A[32:51]};
					5'd13:
						result[32:63]<={{13{reg_A[32]}},reg_A[32:50]};
					5'd14:
						result[32:63]<={{14{reg_A[32]}},reg_A[32:49]};
					5'd15:
						result[32:63]<={{15{reg_A[32]}},reg_A[32:48]};
					5'd16:
						result[32:63]<={{16{reg_A[32]}},reg_A[32:47]};
					5'd17:
						result[32:63]<={{17{reg_A[32]}},reg_A[32:46]};
					5'd18:
						result[32:63]<={{18{reg_A[32]}},reg_A[32:45]};
					5'd19:
						result[32:63]<={{19{reg_A[32]}},reg_A[32:44]};
					5'd20:
						result[32:63]<={{20{reg_A[32]}},reg_A[32:43]};
					5'd21:
						result[32:63]<={{21{reg_A[32]}},reg_A[32:42]};
					5'd22:
						result[32:63]<={{22{reg_A[32]}},reg_A[32:41]};
					5'd23:
						result[32:63]<={{23{reg_A[32]}},reg_A[32:40]};
					5'd24:
						result[32:63]<={{24{reg_A[32]}},reg_A[32:39]};
					5'd25:
						result[32:63]<={{25{reg_A[32]}},reg_A[32:38]};
					5'd26:
						result[32:63]<={{26{reg_A[32]}},reg_A[32:37]};
					5'd27:
						result[32:63]<={{27{reg_A[32]}},reg_A[32:36]};
					5'd28:
						result[32:63]<={{28{reg_A[32]}},reg_A[32:35]};
					5'd29:
						result[32:63]<={{29{reg_A[32]}},reg_A[32:34]};
					5'd30:
						result[32:63]<={{30{reg_A[32]}},reg_A[32:33]};
					5'd31:
						result[32:63]<={{31{reg_A[32]}},reg_A[32]};
				endcase				
				case(reg_B[91:95])
					5'd0:
						result[64:95]<=reg_A[64:95];
					5'd1:
						result[64:95]<={{1{reg_A[64]}},reg_A[64:94]};
					5'd2:
						result[64:95]<={{2{reg_A[64]}},reg_A[64:93]};
					5'd3:
						result[64:95]<={{3{reg_A[64]}},reg_A[64:92]};
					5'd4:
						result[64:95]<={{4{reg_A[64]}},reg_A[64:91]};
					5'd5:
						result[64:95]<={{5{reg_A[64]}},reg_A[64:90]};
					5'd6:
						result[64:95]<={{6{reg_A[64]}},reg_A[64:89]};
					5'd7:
						result[64:95]<={{7{reg_A[64]}},reg_A[64:88]};
					5'd8:
						result[64:95]<={{8{reg_A[64]}},reg_A[64:87]};
					5'd9:
						result[64:95]<={{9{reg_A[64]}},reg_A[64:86]};
					5'd10:
						result[64:95]<={{10{reg_A[64]}},reg_A[64:85]};
					5'd11:
						result[64:95]<={{11{reg_A[64]}},reg_A[64:84]};
					5'd12:
						result[64:95]<={{12{reg_A[64]}},reg_A[64:83]};
					5'd13:
						result[64:95]<={{13{reg_A[64]}},reg_A[64:82]};
					5'd14:
						result[64:95]<={{14{reg_A[64]}},reg_A[64:81]};
					5'd15:
						result[64:95]<={{15{reg_A[64]}},reg_A[64:80]};
					5'd16:
						result[64:95]<={{16{reg_A[64]}},reg_A[64:79]};
					5'd17:
						result[64:95]<={{17{reg_A[64]}},reg_A[64:78]};
					5'd18:
						result[64:95]<={{18{reg_A[64]}},reg_A[64:77]};
					5'd19:
						result[64:95]<={{19{reg_A[64]}},reg_A[64:76]};
					5'd20:
						result[64:95]<={{20{reg_A[64]}},reg_A[64:75]};
					5'd21:
						result[64:95]<={{21{reg_A[64]}},reg_A[64:74]};
					5'd22:
						result[64:95]<={{22{reg_A[64]}},reg_A[64:73]};
					5'd23:
						result[64:95]<={{23{reg_A[64]}},reg_A[64:72]};
					5'd24:
						result[64:95]<={{24{reg_A[64]}},reg_A[64:71]};
					5'd25:
						result[64:95]<={{25{reg_A[64]}},reg_A[64:70]};
					5'd26:
						result[64:95]<={{26{reg_A[64]}},reg_A[64:69]};
					5'd27:
						result[64:95]<={{27{reg_A[64]}},reg_A[64:68]};
					5'd28:
						result[64:95]<={{28{reg_A[64]}},reg_A[64:67]};
					5'd29:
						result[64:95]<={{29{reg_A[64]}},reg_A[64:66]};
					5'd30:
						result[64:95]<={{30{reg_A[64]}},reg_A[64:65]};
					5'd31:
						result[64:95]<={{31{reg_A[64]}},reg_A[64]};
				endcase
				case(reg_B[123:127])
					5'd0:
						result[96:127]<=reg_A[96:127];
					5'd1:
						result[96:127]<={{1{reg_A[96]}},reg_A[96:126]};
					5'd2:
						result[96:127]<={{2{reg_A[96]}},reg_A[96:125]};
					5'd3:
						result[96:127]<={{3{reg_A[96]}},reg_A[96:124]};
					5'd4:
						result[96:127]<={{4{reg_A[96]}},reg_A[96:123]};
					5'd5:
						result[96:127]<={{5{reg_A[96]}},reg_A[96:122]};
					5'd6:
						result[96:127]<={{6{reg_A[96]}},reg_A[96:121]};
					5'd7:
						result[96:127]<={{7{reg_A[96]}},reg_A[96:120]};
					5'd8:
						result[96:127]<={{8{reg_A[96]}},reg_A[96:119]};
					5'd9:
						result[96:127]<={{9{reg_A[96]}},reg_A[96:118]};
					5'd10:
						result[96:127]<={{10{reg_A[96]}},reg_A[96:117]};
					5'd11:
						result[96:127]<={{11{reg_A[96]}},reg_A[96:116]};
					5'd12:
						result[96:127]<={{12{reg_A[96]}},reg_A[96:115]};
					5'd13:
						result[96:127]<={{13{reg_A[96]}},reg_A[96:114]};
					5'd14:
						result[96:127]<={{14{reg_A[96]}},reg_A[96:113]};
					5'd15:
						result[96:127]<={{15{reg_A[96]}},reg_A[96:112]};
					5'd16:
						result[96:127]<={{16{reg_A[96]}},reg_A[96:111]};
					5'd17:
						result[96:127]<={{17{reg_A[96]}},reg_A[96:110]};
					5'd18:
						result[96:127]<={{18{reg_A[96]}},reg_A[96:109]};
					5'd19:
						result[96:127]<={{19{reg_A[96]}},reg_A[96:108]};
					5'd20:
						result[96:127]<={{20{reg_A[96]}},reg_A[96:107]};
					5'd21:
						result[96:127]<={{21{reg_A[96]}},reg_A[96:106]};
					5'd22:
						result[96:127]<={{22{reg_A[96]}},reg_A[96:105]};
					5'd23:
						result[96:127]<={{23{reg_A[96]}},reg_A[96:104]};
					5'd24:
						result[96:127]<={{24{reg_A[96]}},reg_A[96:103]};
					5'd25:
						result[96:127]<={{25{reg_A[96]}},reg_A[96:102]};
					5'd26:
						result[96:127]<={{26{reg_A[96]}},reg_A[96:101]};
					5'd27:
						result[96:127]<={{27{reg_A[96]}},reg_A[96:100]};
					5'd28:
						result[96:127]<={{28{reg_A[96]}},reg_A[96:99]};
					5'd29:
						result[96:127]<={{29{reg_A[96]}},reg_A[96:98]};
					5'd30:
						result[96:127]<={{30{reg_A[96]}},reg_A[96:97]};
					5'd31:
						result[96:127]<={{31{reg_A[96]}},reg_A[96]};
				endcase
				end
			endcase
			end



			// ==================================================================

			default:
			begin
				// Default arithmetic/logic operation
				result<=128'd0;
			end
		endcase
	end
	
	
	
	
endmodule
