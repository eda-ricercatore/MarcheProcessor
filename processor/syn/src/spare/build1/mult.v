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

`include "/auto/home-scf-07/zhiyango/ee577b/projs/processor/syn/src/control.h"

// Behavioral model for the ALU
module alu (reg_A,reg_B,ctrl_ww,alu_op,result);

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
	// Control signal bits - ww
	input [0:1] ctrl_ww;
	/**
	 * Control signal bits - determine which arithmetic or logic
	 * operation to perform
	 */
	input [0:4] alu_op;
	/**
	 * May also include: branch_offset[n:0], is_branch
	 * Size of branch offset is specified in the Instruction Set
	 * Architecture
	 *
	 * The reset signal for the ALU is ignored
	 */
	
	
	
	
	
	
	
	
	// Defining constants: parameter [name_of_constant] = value;
	
	
	
	
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;
	



	
	// ===============================================================
	// Declare "reg" signals: 
	reg [0:127] result;		// Output signals

	
	
	
	// ===============================================================
	
	always @(reg_A or reg_B or ctrl_ww or alu_op)
	begin
		/**
		 * Based on the assigned arithmetic or logic instruction,
		 * carry out the appropriate function on the operands
		 */
		case(alu_op)

			// ======================================================
			
			
			// Unsigned Multiplication - even subfields
			`aluwmuleu:
			begin
				case(ctrl_ww)
					`w8:	// aluwsrl AND `aa AND `w8
					begin
						result[0:15]=reg_A[0:7]*reg_B[0:7];
						result[16:31]=reg_A[16:23]*reg_B[16:23];
						result[32:47]=reg_A[32:39]*reg_B[32:39];
						result[48:63]=reg_A[48:55]*reg_B[48:55];
						result[64:79]=reg_A[64:71]*reg_B[64:71];
						result[80:95]=reg_A[80:87]*reg_B[80:87];
						result[96:111]=reg_A[96:103]*reg_B[96:103];
						result[112:127]=reg_A[112:119]*reg_B[112:119];
					end
					`w16:	// aluwsrl AND `aa AND `w16
					begin
						result[0:31]=reg_A[0:15]*reg_B[0:15];
						result[32:63]=reg_A[32:47]*reg_B[32:47];
						result[64:95]=reg_A[64:79]*reg_B[64:79];
						result[96:127]=reg_A[96:111]*reg_B[96:111];
					end
					
					
					default:	// aluwsrl AND `aa AND Default
						begin
						result=128'd0;
						end
					endcase
			end




			
			
			// Unsigned Multiplication - odd subfields
			`aluwmulou:
			begin
				case(ctrl_ww)
					`w8:	// aluwsrl AND `aa AND `w8
					begin
						result[0:15]=reg_A[8:15]*reg_B[8:15];
						result[16:31]=reg_A[24:31]*reg_B[24:31];
						result[32:47]=reg_A[40:47]*reg_B[40:47];
						result[48:63]=reg_A[56:63]*reg_B[56:63];
						result[64:79]=reg_A[72:79]*reg_B[72:79];
						result[80:95]=reg_A[88:95]*reg_B[88:95];
						result[96:111]=reg_A[104:111]*reg_B[104:111];
						result[112:127]=reg_A[120:127]*reg_B[120:127];
					end
					`w16:	// aluwsrl AND `aa AND `w16
					begin
						result[0:31]=reg_A[16:31]*reg_B[16:31];
						result[32:63]=reg_A[48:63]*reg_B[48:63];
						result[64:95]=reg_A[80:95]*reg_B[80:95];
						result[96:127]=reg_A[112:127]*reg_B[112:127];
					end
					
					
						
					default:	// aluwsrl AND `aa AND Default
						begin
						result=128'd0;
						end
					endcase
			end




						
			default:
			begin
				// Default arithmetic/logic operation
				result=128'd0;
			end
		endcase
	end
	
	
	
	
endmodule
