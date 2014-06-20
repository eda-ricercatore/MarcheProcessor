/**
 * This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
 * and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
 * for EE577b Troy WideWord Processor Project
 */

`include "~/ee577b/syn/src/control.h"


/*
 *ALU Functions Included (in order coded below):

 *		ADD
 *		AND
 *		NOT
 *		OR
 *		XOR
 *		SUB
 *		PRM
 *
 *Other Functions:
 *		LD (NOP)
 *		WMV (ADD)
 *		WST (NOP)
 */




 
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



// Behavioral model for the ALU
module alu (reg_A,reg_B,ctrl_ww,alu_op,result);

	// Output signals...
	// Result from copmputing an arithmetic or logical operation
	output [0:127] result;
	
	// Input signals
	input [0:127] reg_A;
	input [0:127] reg_B;
	// Control signal bits - ww
	input [0:1] ctrl_ww;


	input [0:4] alu_op;
	
	// Defining constants: parameter [name_of_constant] = value;
	parameter max_128_bits = 128'hffffffffffffffffffffffffffffffff;

	// Declare "reg" signals: 
	reg [0:127] result;
	reg [0:127] p_pdt;
	// Temporary reg variables for WW=8, for 8-bit multiplication
	reg [0:15] p_pdt8a;
	reg [0:15] p_pdt8a2;
	reg [0:15] p_pdt8b;
	reg [0:15] p_pdt8b2;
	reg [0:15] p_pdt8c;
	reg [0:15] p_pdt8c2;
	reg [0:15] p_pdt8d;
	reg [0:15] p_pdt8d2;
	reg [0:15] p_pdt8e;
	reg [0:15] p_pdt8e2;
	reg [0:15] p_pdt8f;
	reg [0:15] p_pdt8f2;
	reg [0:15] p_pdt8g;
	reg [0:15] p_pdt8g2;
	reg [0:15] p_pdt8h;
	reg [0:15] p_pdt8h2;
	// Temporary reg variables for WW=16, for 16-bit multiplication
	reg [0:31] p_pdt16a;
	reg [0:31] p_pdt16a2;
	reg [0:31] p_pdt16a3;
	reg [0:31] p_pdt16b;
	reg [0:31] p_pdt16b2;
	reg [0:31] p_pdt16c;
	reg [0:31] p_pdt16c2;
	reg [0:31] p_pdt16d;
	reg [0:31] p_pdt16d2;
	
	integer sgn;
	integer i;
	integer j;
	
	always @(reg_A or reg_B or ctrl_ww or alu_op)
	begin
		p_pdt=128'd0;
		p_pdt8a=16'd0;
		p_pdt8a2=16'd0;
		p_pdt8b=16'd0;
		p_pdt8b2=16'd0;
		p_pdt8c=16'd0;
		p_pdt8c2=16'd0;
		p_pdt8d=16'd0;
		p_pdt8d2=16'd0;
		p_pdt8e=16'd0;
		p_pdt8e2=16'd0;
		p_pdt8f=16'd0;
		p_pdt8f2=16'd0;
		p_pdt8g=16'd0;
		p_pdt8g2=16'd0;
		p_pdt8h=16'd0;
		p_pdt8h2=16'd0;
		p_pdt16a=32'd0;
		p_pdt16a2=32'd0;
		p_pdt16b=32'd0;
		p_pdt16b2=32'd0;
		p_pdt16c=32'd0;
		p_pdt16c2=32'd0;
		p_pdt16d=32'd0;
		p_pdt16d2=32'd0;
		
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
			
			// ================================================
			
			// AND instruction
			`aluwand:
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
			
			// ==============================================
			
			
			// ================================================
			
			// NOT instruction
			`aluwnot:
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
			
			
			
			// ================================================
			
			// OR instruction
			`aluwor:
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
			
			
			// ========================================================
			
			// XOR instruction
			`aluwxor:
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

			
			// ======================================================
			
			// SUB instruction
			`aluwsub:
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
			


			// ==================================================================

			default:
			begin
				// Default arithmetic/logic operation
				result<=128'd0;
			end
		endcase
	end
	
	
	
	
endmodule
