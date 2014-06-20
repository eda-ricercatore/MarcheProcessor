/**
 * This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
 * and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
 * for EE577b Troy WideWord Processor Project
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
 */

`include "control.h"

// Behavioral model for the ALU
module arrmul (reg_A,reg_B,ctrl_ww,alu_op,result);

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
	
	
	
	
	
	
	
	
	// Defining integers: integer [name_of_integer] = value;
	// Indicates the number of bits that have been shifted
	integer sgn;
	/**
	 * Indicates the number of iterations for adding a multiplier
	 * so that these additions resemble the multiplication/shift
	 * operation with this currently enumerated bit of the
	 * multiplicand
	 */
	integer cnt;
	
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;
	



	
	// ===============================================================
	// Declare "reg" signals: 
reg [0:127] result;		// Output signals
	/**
	 * Temporary reg(s) to contain the partial products during
	 * multiplication
	 */
reg [0:127] p_pdt;
	// Temporary reg variables for WW=8, for 8-bit multiplication
	reg [0:15] p_pdt8a;
	reg [0:15] p_pdt8a2;
	reg [0:7] p_pdt8a3;
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

	
	
	
	// ===============================================================
	
	always @(reg_A or reg_B or ctrl_ww or alu_op)
	begin

$display("reg_A",reg_A);
$display("reg_B",reg_B);
		
p_pdt=128'd0;
			p_pdt8a=16'd0;
			p_pdt8a2=16'd0;
			p_pdt8a3=8'd0;
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
			p_pdt16a3=32'd0;
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

			// ======================================================
			
			
			// Unsigned Multiplication - odd subfields
			`aluwmulou:
			begin
				case(ctrl_ww)
					(`w8+2'd1):	// aluwmulou AND `w8
					begin
						p_pdt8a[8:15]=reg_A[8:15];
						p_pdt8a[0:7]=8'd0;
						p_pdt8a2[0:15]={{8{1'b0}},reg_B[8:15]};
$display("reg_A[8:15]",reg_A[8:15]);
$display("p_pdt8a2[0:15]",p_pdt8a2[0:15]);
$display("reg_B[8:15]",reg_B[8:15]);
$display("p_pdt8a[0:15]",p_pdt8a[0:15]);
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[0:15]=p_pdt[0:15]+((p_pdt8a[sgn]==1'd1)?(p_pdt8a2<<(8'd15-sgn)):16'b0);
						end
						result[0:15]=p_pdt[0:15];



						p_pdt8b[8:15]=reg_A[24:31];
						p_pdt8b[0:7]=8'd0;
						p_pdt8b2[0:15]={{8{1'b0}},reg_B[24:31]};
$display("reg_A[24:31]",reg_A[24:31]);
$display("p_pdt8b2[0:15]",p_pdt8b2[0:15]);
$display("reg_B[24:31]",reg_B[24:31]);
$display("p_pdt8b[0:15]",p_pdt8b[0:15]);
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[16:31]=p_pdt[16:31]+((p_pdt8b[sgn]==1'd1)?(p_pdt8b2<<(8'd15-sgn)):16'b0);
						end
						result[16:31]=p_pdt[16:31];



						p_pdt8c[8:15]=reg_A[40:47];
						p_pdt8c[0:7]=8'd0;
						p_pdt8c2[0:15]={{8{1'b0}},reg_B[40:47]};
$display("reg_A[40:47]",reg_A[40:47]);
$display("p_pdt8c2[0:15]",p_pdt8c2[0:15]);
$display("reg_B[40:47]",reg_B[40:47]);
$display("p_pdt8c[0:15]",p_pdt8c[0:15]);
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[32:47]=p_pdt[32:47]+((p_pdt8c[sgn]==1'd1)?(p_pdt8c2<<(8'd15-sgn)):16'b0);
$display("p_pdt[32:47]",p_pdt[32:47]);
						end
						result[32:47]=p_pdt[32:47];




						p_pdt8d[8:15]=reg_A[56:63];
						p_pdt8d[0:7]=8'd0;
						p_pdt8d2[0:15]={{8{1'b0}},reg_B[56:63]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[48:63]=p_pdt[48:63]+((p_pdt8d[sgn]==1'd1)?(p_pdt8d2<<(8'd15-sgn)):16'b0);
						end
						result[48:63]=p_pdt[48:63];



						p_pdt8e[8:15]=reg_A[72:79];
						p_pdt8e[0:7]=8'd0;
						p_pdt8e2[0:15]={{8{1'b0}},reg_B[72:79]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[64:79]=p_pdt[64:79]+((p_pdt8e[sgn]==1'd1)?(p_pdt8e2<<(8'd15-sgn)):16'b0);
						end
						result[64:79]=p_pdt[64:79];




						p_pdt8f[8:15]=reg_A[88:95];
						p_pdt8f[0:7]=8'd0;
						p_pdt8f2[0:15]={{8{1'b0}},reg_B[88:95]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[80:95]=p_pdt[80:95]+((p_pdt8f[sgn]==1'd1)?(p_pdt8f2<<(8'd15-sgn)):16'b0);
						end
						result[80:95]=p_pdt[80:95];



						p_pdt8g[8:15]=reg_A[104:111];
						p_pdt8g[0:7]=8'd0;
						p_pdt8g2[0:15]={{8{1'b0}},reg_B[104:111]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[96:111]=p_pdt[96:111]+((p_pdt8g[sgn]==1'd1)?(p_pdt8g2<<(8'd15-sgn)):16'b0);
						end
						result[96:111]=p_pdt[96:111];



						p_pdt8h[8:15]=reg_A[120:127];
						p_pdt8h[0:7]=8'd0;
						p_pdt8h2[0:15]={{8{1'b0}},reg_B[120:127]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[112:127]=p_pdt[112:127]+((p_pdt8h[sgn]==1'd1)?(p_pdt8h2<<(8'd15-sgn)):16'b0);
						end
						result[112:127]=p_pdt[112:127];



					end
					(`w16+2'b01):	// aluwmulou AND `w16
					begin
						p_pdt16a[0:31]={{16{1'b0}},reg_B[16:31]};
						p_pdt16a2[0:31]={{16{1'b0}},reg_A[16:31]};

						p_pdt16b[0:31]={{16{1'b0}},reg_B[48:63]};
						p_pdt16b2[0:31]={{16{1'b0}},reg_A[48:63]};
						
						p_pdt16c[0:31]={{16{1'b0}},reg_B[80:95]};
						p_pdt16c2[0:31]={{16{1'b0}},reg_A[80:95]};
						
						p_pdt16d[0:31]={{16{1'b0}},reg_B[112:127]};
						p_pdt16d2[0:31]={{16{1'b0}},reg_A[112:127]};
						
						for(sgn=31; sgn>=16; sgn=sgn-1)
						begin
						p_pdt[0:31]=p_pdt[0:31]+((p_pdt16a[sgn]==1'd1)?(p_pdt16a2<<(16'd31-sgn)):32'd0);
						p_pdt[32:63]=p_pdt[32:63]+((p_pdt16b[sgn]==1'd1)?(p_pdt16b2<<(16'd31-sgn)):32'd0);
						p_pdt[64:95]=p_pdt[64:95]+((p_pdt16c[sgn]==1'd1)?(p_pdt16c2<<(16'd31-sgn)):32'd0);
						p_pdt[96:127]=p_pdt[96:127]+((p_pdt16d[sgn]==1'd1)?(p_pdt16d2<<(16'd31-sgn)):32'd0);
						end
						result[0:31]=p_pdt[0:31];
						result[32:63]=p_pdt[32:63];
						result[64:95]=p_pdt[64:95];
						result[96:127]=p_pdt[96:127];


					end
					
					
					default:	// aluwmulou AND Default
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
