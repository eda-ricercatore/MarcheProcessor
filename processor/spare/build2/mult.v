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
	
	
	
	
	
	
	
	
	// Defining integers: integer [name_of_integer] = value;
	integer sgn;
	
	
	
	
	
	
	
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

			// ======================================================
			
			
			// Unsigned Multiplication - even subfields
			`aluwmuleu:
			begin
				case(ctrl_ww)
					`w8:	// aluwmuleu AND `w8
					begin
p_pdt8a[8:15]=reg_A[0:7];
p_pdt8a[0:7]=8'd0;
//$display("p_pdt8a[0:15]",p_pdt8a[0:15]);
//$display("p_pdt8a[8:15]",p_pdt8a[8:15]);
//$display("p_pdt8a[0:7]",p_pdt8a[0:7]);
						for(sgn=7; sgn>=0; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[0:15]=p_pdt[0:15]+(p_pdt8a<<(7-sgn));
//$display("@@@@@@p_pdt8a[0:15]",p_pdt8a[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[0:15]",p_pdt[sgn],"(7-sgn)",(7-sgn),"SGN::",sgn);
//$display("======p_pdt8a<<sgn",(p_pdt8a<<(7-sgn)),"QWERTY",p_pdt[0:15],"***\n");

						end

result[0:15]=p_pdt[0:15];
//$display("result[0:15]",result[0:15]);














p_pdt8b[8:15]=reg_A[16:23];
p_pdt8b[0:7]=8'd0;
//$display("p_pdt8b[0:15]",p_pdt8b[0:15]);
//$display("p_pdt8b[8:15]",p_pdt8b[8:15]);
//$display("p_pdt8b[0:7]",p_pdt8b[0:7]);
						for(sgn=23; sgn>=16; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[16:31]=p_pdt[16:31]+(p_pdt8b<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8b[0:15]",p_pdt8b[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[16:31]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8b<<sgn",(p_pdt8b<<(7-(sgn%8))),"QWERTY",p_pdt[16:31],"***\n");

						end

result[16:31]=p_pdt[16:31];
//$display("result[16:31]",result[16:31]);















p_pdt8c[8:15]=reg_A[32:39];
p_pdt8c[0:7]=8'd0;
//$display("p_pdt8c[0:15]",p_pdt8c[0:15]);
//$display("p_pdt8c[8:15]",p_pdt8c[8:15]);
//$display("p_pdt8c[0:7]",p_pdt8c[0:7]);
						for(sgn=39; sgn>=32; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[32:47]=p_pdt[32:47]+(p_pdt8c<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8c[0:15]",p_pdt8c[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[32:47]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8c<<sgn",(p_pdt8c<<(7-(sgn%8))),"QWERTY",p_pdt[32:47],"***\n");

						end

result[32:47]=p_pdt[32:47];
//$display("result[32:47]",result[32:47]);


















p_pdt8d[8:15]=reg_A[48:55];
p_pdt8d[0:7]=8'd0;
//$display("p_pdt8d[0:15]",p_pdt8d[0:15]);
//$display("p_pdt8d[8:15]",p_pdt8d[8:15]);
//$display("p_pdt8d[0:7]",p_pdt8d[0:7]);
						for(sgn=55; sgn>=48; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[48:63]=p_pdt[48:63]+(p_pdt8d<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8d[0:15]",p_pdt8d[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[48:63]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8d<<sgn",(p_pdt8d<<(7-(sgn%8))),"QWERTY",p_pdt[48:63],"***\n");

						end

result[48:63]=p_pdt[48:63];
//$display("result[48:63]",result[48:63]);













p_pdt8e[8:15]=reg_A[64:71];
p_pdt8e[0:7]=8'd0;
//$display("p_pdt8e[0:15]",p_pdt8e[0:15]);
//$display("p_pdt8e[8:15]",p_pdt8e[8:15]);
//$display("p_pdt8e[0:7]",p_pdt8e[0:7]);
						for(sgn=71; sgn>=64; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[64:79]=p_pdt[64:79]+(p_pdt8e<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8e[0:15]",p_pdt8e[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[64:79]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8e<<sgn",(p_pdt8e<<(7-(sgn%8))),"QWERTY",p_pdt[64:79],"***\n");

						end

result[64:79]=p_pdt[64:79];
//$display("result[64:79]",result[64:79]);
























p_pdt8f[8:15]=reg_A[80:87];
p_pdt8f[0:7]=8'd0;
//$display("p_pdt8f[0:15]",p_pdt8f[0:15]);
//$display("p_pdt8f[8:15]",p_pdt8f[8:15]);
//$display("p_pdt8f[0:7]",p_pdt8f[0:7]);
						for(sgn=87; sgn>=80; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[80:95]=p_pdt[80:95]+(p_pdt8f<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8f[0:15]",p_pdt8f[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[80:95]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8f<<sgn",(p_pdt8f<<(7-(sgn%8))),"QWERTY",p_pdt[80:95],"***\n");

						end

result[80:95]=p_pdt[80:95];
//$display("result[80:95]",result[80:95]);



















p_pdt8g[8:15]=reg_A[96:103];
p_pdt8g[0:7]=8'd0;
//$display("p_pdt8g[0:15]",p_pdt8g[0:15]);
//$display("p_pdt8g[8:15]",p_pdt8g[8:15]);
//$display("p_pdt8g[0:7]",p_pdt8g[0:7]);
						for(sgn=103; sgn>=96; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[96:111]=p_pdt[96:111]+(p_pdt8g<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8g[0:15]",p_pdt8g[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[96:111]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8g<<sgn",(p_pdt8g<<(7-(sgn%8))),"QWERTY",p_pdt[96:111],"***\n");

						end

result[96:111]=p_pdt[96:111];
//$display("result[96:111]",result[96:111]);





















p_pdt8h[8:15]=reg_A[112:119];
p_pdt8h[0:7]=8'd0;
//$display("p_pdt8h[0:15]",p_pdt8h[0:15]);
//$display("p_pdt8h[8:15]",p_pdt8h[8:15]);
//$display("p_pdt8h[0:7]",p_pdt8h[0:7]);
						for(sgn=119; sgn>=112; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[112:127]=p_pdt[112:127]+(p_pdt8h<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8h[0:15]",p_pdt8h[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[112:127]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8h<<sgn",(p_pdt8h<<(7-(sgn%8))),"QWERTY",p_pdt[112:127],"***\n");

						end

result[112:127]=p_pdt[112:127];
//$display("result[112:127]",result[112:127]);




					end
					`w16:	// aluwmuleu AND `w16
					begin



p_pdt16a[16:31]=reg_A[0:15];
p_pdt16a[0:15]=8'd0;
//$display("reg_A[0:15]",reg_A[0:15]);
//$display("reg_B[0:15]",reg_B[0:15]);
//$display("p_pdt16a[0:31]",p_pdt16a[0:31]);
//$display("p_pdt16a[16:31]",p_pdt16a[16:31]);
//$display("p_pdt16a[0:15]",p_pdt16a[0:15]);
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								//p_pdt[0:31]<=p_pdt[0:31]+(p_pdt16a<<(15-sgn));
								p_pdt[0:31]=p_pdt[0:31]+(reg_A[0:15]<<(15-sgn));
//$display("@@@@@@p_pdt16a[0:31]",p_pdt16a[0:31],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[0:31]",p_pdt[sgn],"(15-sgn)",(15-sgn),"SGN::",sgn);
//$display("======reg_A[0:15]<<sgn",(reg_A[0:15]<<(15-sgn)),"QWERTY",p_pdt[0:31],"***\n");
//$display("reg_A[0:15]",reg_A[0:15]);
						end

result[0:31]=p_pdt[0:31];
//$display("result[0:31]",result[0:31]);





















p_pdt16b[16:31]=reg_A[32:47];
p_pdt16b[0:15]=8'd0;
//$display("reg_A[32:47]",reg_A[32:47]);
//$display("reg_B[32:47]",reg_B[32:47]);
//$display("p_pdt16b[0:31]",p_pdt16b[0:31]);
//$display("p_pdt16b[16:31]",p_pdt16b[16:31]);
//$display("p_pdt16b[0:15]",p_pdt16b[0:15]);
						for(sgn=47; sgn>=32; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								//p_pdt[32:63]<=p_pdt[32:63]+(p_pdt16b<<(15-(sgn%16)));
								p_pdt[32:63]=p_pdt[32:63]+(reg_A[32:47]<<(15-(sgn%16)));
//$display("@@@@@@p_pdt16b[32:63]",p_pdt16b[0:31],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[32:63]",p_pdt[sgn],"(15-(sgn MOD 16))",(15-(sgn%16)),"SGN::",sgn);
//$display("======reg_A[32:47]<<sgn",(reg_A[32:47]<<(15-(sgn%16))),"QWERTY",p_pdt[32:63],"***\n");

						end

result[32:63]=p_pdt[32:63];
//$display("result[32:63]",result[32:63]);





















p_pdt16c[16:31]=reg_A[64:79];
p_pdt16c[0:15]=8'd0;
//$display("reg_A[64:79]",reg_A[64:79]);
//$display("reg_B[64:79]",reg_B[64:79]);
//$display("p_pdt16c[0:31]",p_pdt16c[0:31]);
//$display("p_pdt16c[0:15]",p_pdt16c[0:15]);
//$display("p_pdt16c[16:31]",p_pdt16c[16:31]);
						for(sgn=79; sgn>=64; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								//p_pdt[64:95]=p_pdt[64:95]+(p_pdt16c<<(15-(sgn%16)));
								p_pdt[64:95]=p_pdt[64:95]+(reg_A[64:79]<<(15-(sgn%16)));
//$display("@@@@@@p_pdt16c[64:95]",p_pdt16c[0:31],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[64:95]",p_pdt[sgn],"(15-(sgn MOD 16))",(15-(sgn%16)),"SGN::",sgn);
//$display("======p_pdt16c<<sgn",(reg_A[64:79]<<(15-(sgn%16))),"QWERTY",p_pdt[64:95],"***\n");

						end

result[64:95]=p_pdt[64:95];
//$display("result[64:95]",result[64:95]);























p_pdt16d[16:31]=reg_A[96:111];
p_pdt16d[0:15]=8'd0;
//$display("reg_A[96:111]",reg_A[96:111]);
//$display("reg_B[96:111]",reg_B[96:111]);
//$display("p_pdt16d[0:31]",p_pdt16d[0:31]);
//$display("p_pdt16d[0:15]",p_pdt16d[0:15]);
//$display("p_pdt16d[16:31]",p_pdt16d[16:31]);
						for(sgn=111; sgn>=96; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								//p_pdt[96:127]<=p_pdt[96:127]+(p_pdt16d<<(15-(sgn%16)));
								p_pdt[96:127]=p_pdt[96:127]+(reg_A[96:111]<<(15-(sgn%16)));
//$display("@@@@@@p_pdt16d[96:127]",p_pdt16d[0:31],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[96:127]",p_pdt[sgn],"(15-(sgn MOD 16))",(15-(sgn%16)),"SGN::",sgn);
//$display("======p_pdt16d<<sgn",(reg_A[96:111]<<(15-(sgn%16))),"QWERTY",p_pdt[96:127],"***\n");

						end

result[96:127]=p_pdt[96:127];
//$display("result[96:127]",result[96:127]);




					end
					
					
					default:	// aluwmuleu AND Default
						begin
result=128'd0;
						end
					endcase
			end
			


/**
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 * =====================================================================================
 */
 
 
 
 
 			// ======================================================
			
			
			// Unsigned Multiplication - odd subfields
			`aluwmulou:
			begin
				case(ctrl_ww)
					`w8:	// aluwmulou AND `w8
					begin
p_pdt8a[8:15]=reg_A[8:15];
p_pdt8a[0:7]=8'd0;
//$display("p_pdt8a[0:15]",p_pdt8a[0:15]);
//$display("p_pdt8a[8:15]",p_pdt8a[8:15]);
//$display("p_pdt8a[0:7]",p_pdt8a[0:7]);
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[0:15]=p_pdt[0:15]+(p_pdt8a<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8a[0:15]",p_pdt8a[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[0:15]",p_pdt[sgn],"(7-(sgn MOD 8))",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8a<<sgn",(p_pdt8a<<(7-(sgn%8))),"QWERTY",p_pdt[0:15],"***\n");

						end

result[0:15]=p_pdt[0:15];
//$display("result[0:15]",result[0:15]);














p_pdt8b[8:15]=reg_A[24:31];
p_pdt8b[0:7]=8'd0;
//$display("p_pdt8b[0:15]",p_pdt8b[0:15]);
//$display("p_pdt8b[8:15]",p_pdt8b[8:15]);
//$display("p_pdt8b[0:7]",p_pdt8b[0:7]);
						for(sgn=31; sgn>=24; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[16:31]=p_pdt[16:31]+(p_pdt8b<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8b[0:15]",p_pdt8b[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[16:31]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8b<<sgn",(p_pdt8b<<(7-(sgn%8))),"QWERTY",p_pdt[16:31],"***\n");

						end

result[16:31]=p_pdt[16:31];
//$display("result[16:31]",result[16:31]);















p_pdt8c[8:15]=reg_A[40:47];
p_pdt8c[0:7]=8'd0;
//$display("p_pdt8c[0:15]",p_pdt8c[0:15]);
//$display("p_pdt8c[8:15]",p_pdt8c[8:15]);
//$display("p_pdt8c[0:7]",p_pdt8c[0:7]);
						for(sgn=39; sgn>=33; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[32:47]=p_pdt[32:47]+(p_pdt8c<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8c[0:15]",p_pdt8c[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[32:47]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8c<<sgn",(p_pdt8c<<(7-(sgn%8))),"QWERTY",p_pdt[32:47],"***\n");

						end

result[32:47]=p_pdt[32:47];
//$display("result[32:47]",result[32:47]);


















p_pdt8d[8:15]=reg_A[56:63];
p_pdt8d[0:7]=8'd0;
//$display("p_pdt8d[0:15]",p_pdt8d[0:15]);
//$display("p_pdt8d[8:15]",p_pdt8d[8:15]);
//$display("p_pdt8d[0:7]",p_pdt8d[0:7]);
						for(sgn=55; sgn>=48; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[48:63]=p_pdt[48:63]+(p_pdt8d<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8d[0:15]",p_pdt8d[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[48:63]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8d<<sgn",(p_pdt8d<<(7-(sgn%8))),"QWERTY",p_pdt[48:63],"***\n");

						end

result[48:63]=p_pdt[48:63];
//$display("result[48:63]",result[48:63]);













p_pdt8e[8:15]=reg_A[72:79];
p_pdt8e[0:7]=8'd0;
//$display("p_pdt8e[0:15]",p_pdt8e[0:15]);
//$display("p_pdt8e[8:15]",p_pdt8e[8:15]);
//$display("p_pdt8e[0:7]",p_pdt8e[0:7]);
						for(sgn=79; sgn>=72; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[64:79]=p_pdt[64:79]+(p_pdt8e<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8e[0:15]",p_pdt8e[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[64:79]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8e<<sgn",(p_pdt8e<<(7-(sgn%8))),"QWERTY",p_pdt[64:79],"***\n");

						end

result[64:79]=p_pdt[64:79];
//$display("result[64:79]",result[64:79]);
























p_pdt8f[8:15]=reg_A[88:95];
p_pdt8f[0:7]=8'd0;
//$display("p_pdt8f[0:15]",p_pdt8f[0:15]);
//$display("p_pdt8f[8:15]",p_pdt8f[8:15]);
//$display("p_pdt8f[0:7]",p_pdt8f[0:7]);
						for(sgn=95; sgn>=88; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[80:95]=p_pdt[80:95]+(p_pdt8f<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8f[0:15]",p_pdt8f[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[80:95]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8f<<sgn",(p_pdt8f<<(7-(sgn%8))),"QWERTY",p_pdt[80:95],"***\n");

						end
result[80:95]=p_pdt[80:95];
//$display("result[80:95]",result[80:95]);




















p_pdt8g[8:15]=reg_A[104:111];
p_pdt8g[0:7]=8'd0;
//$display("p_pdt8g[0:15]",p_pdt8g[0:15]);
//$display("p_pdt8g[8:15]",p_pdt8g[8:15]);
//$display("p_pdt8g[0:7]",p_pdt8g[0:7]);
						for(sgn=111; sgn>=104; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[96:111]=p_pdt[96:111]+(p_pdt8g<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8g[0:15]",p_pdt8g[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[96:111]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8g<<sgn",(p_pdt8g<<(7-(sgn%8))),"QWERTY",p_pdt[96:111],"***\n");

						end

result[96:111]=p_pdt[96:111];
//$display("result[96:111]",result[96:111]);





















p_pdt8h[8:15]=reg_A[120:127];
p_pdt8h[0:7]=8'd0;
//$display("p_pdt8h[0:15]",p_pdt8h[0:15]);
//$display("p_pdt8h[8:15]",p_pdt8h[8:15]);
//$display("p_pdt8h[0:7]",p_pdt8h[0:7]);
						for(sgn=127; sgn>=120; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								p_pdt[112:127]=p_pdt[112:127]+(p_pdt8h<<(7-(sgn%8)));
//$display("@@@@@@p_pdt8h[0:15]",p_pdt8h[0:15],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[112:127]",p_pdt[sgn],"(7-sgn)",(7-(sgn%8)),"SGN::",sgn);
//$display("======p_pdt8h<<sgn",(p_pdt8h<<(7-(sgn%8))),"QWERTY",p_pdt[112:127],"***\n");

						end

result[112:127]=p_pdt[112:127];
//$display("result[112:127]",result[112:127]);




					end
					`w16:	// aluwmulou AND `w16
					begin



p_pdt16a[16:31]=reg_A[16:31];
p_pdt16a[0:15]=8'd0;
//$display("reg_A[0:15]",reg_A[0:15]);
//$display("reg_B[0:15]",reg_B[0:15]);
//$display("p_pdt16a[0:31]",p_pdt16a[0:31]);
//$display("p_pdt16a[16:31]",p_pdt16a[16:31]);
//$display("p_pdt16a[0:15]",p_pdt16a[0:15]);
						for(sgn=31; sgn>=16; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								//p_pdt[0:31]<=p_pdt[0:31]+(p_pdt16a<<(15-sgn));
								p_pdt[0:31]=p_pdt[0:31]+(reg_A[16:31]<<(15-(sgn%16)));
//$display("@@@@@@p_pdt16a[0:31]",p_pdt16a[0:31],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[0:31]",p_pdt[sgn],"(15-(sgn MOD 16))",(15-(sgn%16)),"SGN::",sgn);
//$display("======reg_A[0:15]<<sgn",(reg_A[0:15]<<(15-(sgn%16))),"QWERTY",p_pdt[0:31],"***\n");
//$display("reg_A[0:15]",reg_A[0:15]);
						end

result[0:31]=p_pdt[0:31];
//$display("result[0:31]",result[0:31]);





















p_pdt16b[16:31]=reg_A[48:63];
p_pdt16b[0:15]=8'd0;
//$display("reg_A[48:63]",reg_A[48:63]);
//$display("reg_B[48:63]",reg_B[48:63]);
//$display("p_pdt16b[0:31]",p_pdt16b[0:31]);
//$display("p_pdt16b[16:31]",p_pdt16b[16:31]);
//$display("p_pdt16b[0:15]",p_pdt16b[0:15]);
						for(sgn=63; sgn>=48; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								//p_pdt[32:63]<=p_pdt[32:63]+(p_pdt16b<<(15-(sgn%16)));
								p_pdt[32:63]=p_pdt[32:63]+(reg_A[48:63]<<(15-(sgn%16)));
//$display("@@@@@@p_pdt16b[32:63]",p_pdt16b[0:31],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[32:63]",p_pdt[sgn],"(15-(sgn MOD 16))",(15-(sgn%16)),"SGN::",sgn);
//$display("======reg_A[48:63]<<sgn",(reg_A[48:63]<<(15-(sgn%16))),"QWERTY",p_pdt[32:63],"***\n");

						end

result[32:63]=p_pdt[32:63];
//$display("result[32:63]",result[32:63]);





















p_pdt16c[16:31]=reg_A[80:95];
p_pdt16c[0:15]=8'd0;
//$display("reg_A[64:79]",reg_A[64:79]);
//$display("reg_B[64:79]",reg_B[64:79]);
//$display("p_pdt16c[0:31]",p_pdt16c[0:31]);
//$display("p_pdt16c[0:15]",p_pdt16c[0:15]);
//$display("p_pdt16c[16:31]",p_pdt16c[16:31]);
						for(sgn=95; sgn>=80; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								//p_pdt[64:95]=p_pdt[64:95]+(p_pdt16c<<(15-(sgn%16)));
								p_pdt[64:95]=p_pdt[64:95]+(reg_A[80:95]<<(15-(sgn%16)));
//$display("@@@@@@p_pdt16c[64:95]",p_pdt16c[0:31],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[64:95]",p_pdt[sgn],"(15-(sgn MOD 16))",(15-(sgn%16)),"SGN::",sgn);
//$display("======p_pdt16c<<sgn",(reg_A[80:95]<<(15-(sgn%16))),"QWERTY",p_pdt[64:95],"***\n");

						end

result[64:95]=p_pdt[64:95];
//$display("result[64:95]",result[64:95]);























p_pdt16d[16:31]=reg_A[112:127];
p_pdt16d[0:15]=8'd0;
//$display("reg_A[112:127]",reg_A[112:127]);
//$display("reg_B[112:127]",reg_B[112:127]);
//$display("p_pdt16d[0:31]",p_pdt16d[0:31]);
//$display("p_pdt16d[0:15]",p_pdt16d[0:15]);
//$display("p_pdt16d[16:31]",p_pdt16d[16:31]);
						for(sgn=127; sgn>=112; sgn=sgn-1)
						begin
							if(reg_B[sgn]==1'b1)
							begin
								//p_pdt8=p_pd8t+(p_pdt8<<sgn);
								//p_pdt[96:127]<=p_pdt[96:127]+(p_pdt16d<<(15-(sgn%16)));
								p_pdt[96:127]=p_pdt[96:127]+(reg_A[112:127]<<(15-(sgn%16)));
//$display("@@@@@@p_pdt16d[96:127]",p_pdt16d[0:31],"sgn",sgn,"!!!");
							end
//$display("======p_pdt[96:127]",p_pdt[sgn],"(15-(sgn MOD 16))",(15-(sgn%16)),"SGN::",sgn);
//$display("======p_pdt16d<<sgn",(reg_A[112:127]<<(15-(sgn%16))),"QWERTY",p_pdt[96:127],"***\n");

						end

result[96:127]=p_pdt[96:127];
//$display("result[96:127]",result[96:127]);




					end
					
					
					default:	// aluwmulou AND Default
						begin
result=128'd0;
						end
					endcase
			end

/**
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 * =============================================================================
 */
						
						
			// ======================================================
			
			
			// Signed Multiplication - odd subfields
			`aluwmulos:
			begin
				case(ctrl_ww)
					`w8:	// aluwmulos AND `w8
					begin
						// Process the 1st byte
						
						if(reg_A[8]==0)
						begin
							p_pdt8a[8:15]=reg_A[8:15];
						end
						else
						begin
							p_pdt8a[8:15]=1+~reg_A[8:15];
						end
						p_pdt8b[0:7]=8'd0;

						if(reg_B[8]==0)
						begin
							p_pdt8a2[8:15]=reg_B[8:15];
						end
						else
						begin
							p_pdt8a2[8:15]=1+~reg_B[8:15];
						end
						p_pdt8b2[0:7]=8'd0;

						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							if(p_pdt8a2[sgn]==1'b1)
							begin
								p_pdt[0:15]=p_pdt[0:15]+(p_pdt8a<<(7-(sgn%8)));
							end
						end


						if(reg_A[8]^reg_B[8])
						begin
							result[0:15]=1+~p_pdt[0:15];
						end
						else
						begin
							result[0:15]=p_pdt[0:15];
						end



						// Process the 2nd byte

						if(reg_A[24]==0)
						begin
							p_pdt8b[8:15]=reg_A[24:31];
						end
						else
						begin
							p_pdt8b[8:15]=1+~reg_A[24:31];
						end
						p_pdt8b[0:7]=8'd0;
						if(reg_B[24]==0)
						begin
							p_pdt8b2[8:15]=reg_B[24:31];
						end
						else
						begin
							p_pdt8b2[8:15]=1+~reg_B[24:31];
						end
						p_pdt8b2[0:7]=8'd0;
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							if(p_pdt8b2[sgn]==1'b1)
							begin
								p_pdt[16:31]=p_pdt[16:31]+(p_pdt8b<<(7-(sgn%8)));
							end
						end

						if(reg_A[24]^reg_B[24])
						begin
							result[16:31]=1+~p_pdt[16:31];
						end
						else
						begin
							result[16:31]=p_pdt[16:31];
						end






						// Process the 3rd byte
						
						// Convert operand A to a positive number
						if(reg_A[40]==0)
						begin
							p_pdt8c[8:15]=reg_A[40:47];
						end
						else
						begin
							p_pdt8c[8:15]=1+~reg_A[40:47];
						end
						p_pdt8c[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[40]==0)
						begin
							p_pdt8c2[8:15]=reg_B[40:47];
						end
						else
						begin
							p_pdt8c2[8:15]=1+~reg_B[40:47];
						end
						p_pdt8c2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8c2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[32:47]=p_pdt[32:47]+(p_pdt8c<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[40]^reg_B[40])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[32:47]=1+~p_pdt[32:47];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[32:47]=p_pdt[32:47];
						end




						// Process the 4th byte
						
						// Convert operand A to a positive number
						if(reg_A[56]==0)
						begin
							p_pdt8d[8:15]=reg_A[56:63];
						end
						else
						begin
							p_pdt8d[8:15]=1+~reg_A[56:63];
						end
						p_pdt8d[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[56]==0)
						begin
							p_pdt8d2[8:15]=reg_B[56:63];
						end
						else
						begin
							p_pdt8d2[8:15]=1+~reg_B[56:63];
						end
						p_pdt8d2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8d2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[48:63]=p_pdt[48:63]+(p_pdt8d<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[56]^reg_B[56])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[48:63]=1+~p_pdt[48:63];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[48:63]=p_pdt[48:63];
						end




						// Process the 5th byte
						
						// Convert operand A to a positive number
						if(reg_A[72]==0)
						begin
							p_pdt8e[8:15]=reg_A[72:79];
						end
						else
						begin
							p_pdt8e[8:15]=1+~reg_A[72:79];
						end
						p_pdt8e[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[72]==0)
						begin
							p_pdt8e2[8:15]=reg_B[72:79];
						end
						else
						begin
							p_pdt8e2[8:15]=1+~reg_B[72:79];
						end
						p_pdt8e2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8e2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[64:79]=p_pdt[64:79]+(p_pdt8e<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[72]^reg_B[72])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[64:79]=1+~p_pdt[64:79];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[64:79]=p_pdt[64:79];
						end


						// Process the 6th byte

						// Convert operand A to a positive number
						if(reg_A[88]==0)
						begin
							p_pdt8f[8:15]=reg_A[88:95];
						end
						else
						begin
							p_pdt8f[8:15]=1+~reg_A[88:95];
						end
						p_pdt8f[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[88]==0)
						begin
							p_pdt8f2[8:15]=reg_B[88:95];
						end
						else
						begin
							p_pdt8f2[8:15]=1+~reg_B[88:95];
						end
						p_pdt8f2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8f2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[80:95]=p_pdt[80:95]+(p_pdt8f<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[88]^reg_B[88])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[80:95]=1+~p_pdt[80:95];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[80:95]=p_pdt[80:95];
						end


						// Process the 7th byte
						
						
						// Convert operand A to a positive number
						if(reg_A[104]==0)
						begin
							p_pdt8g[8:15]=reg_A[104:111];
						end
						else
						begin
							p_pdt8g[8:15]=1+~reg_A[104:111];
						end
						p_pdt8g[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[104]==0)
						begin
							p_pdt8g2[8:15]=reg_B[104:111];
						end
						else
						begin
							p_pdt8g2[8:15]=1+~reg_B[104:111];
						end
						p_pdt8g2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8g2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[96:111]=p_pdt[96:111]+(p_pdt8g<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[104]^reg_B[104])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[96:111]=1+~p_pdt[96:111];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[96:111]=p_pdt[96:111];
						end


						// Process the 8th byte


						// Convert operand A to a positive number
						if(reg_A[120]==0)
						begin
							p_pdt8h[8:15]=reg_A[120:127];
						end
						else
						begin
							p_pdt8h[8:15]=1+~reg_A[120:127];
						end
						p_pdt8h[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[120]==0)
						begin
							p_pdt8h2[8:15]=reg_B[120:127];
						end
						else
						begin
							p_pdt8h2[8:15]=1+~reg_B[120:127];
						end
						p_pdt8h2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8h2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[112:127]=p_pdt[112:127]+(p_pdt8h<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[120]^reg_B[120])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[112:127]=1+~p_pdt[112:127];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[112:127]=p_pdt[112:127];
						end


					// =======================================================
					// =======================================================
					// =======================================================

					end
					`w16:	// aluwmulos AND `w16
					begin

						// Process the first pair of bytes

						// Convert operand A to a positive number
						if(reg_A[16]==0)
						begin
							p_pdt16a[16:31]=reg_A[16:31];
						end
						else
						begin
							p_pdt16a[16:31]=1+~reg_A[16:31];
						end
						p_pdt16a[0:15]=16'd0;

						// Convert operand B to a positive number
						if(reg_B[16]==0)
						begin
							p_pdt16a2[16:31]=reg_B[16:31];
						end
						else
						begin
							p_pdt16a2[16:31]=1+~reg_B[16:31];
						end
						p_pdt16a2[0:15]=16'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=31; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt16a2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[0:31]=p_pdt[0:31]+(p_pdt16a<<(15-(sgn%16)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[16]^reg_B[16])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[0:31]=1+~p_pdt[0:31];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[0:31]=p_pdt[0:31];
						end



						// Process the second pair of bytes

						// Convert operand A to a positive number
						if(reg_A[48]==0)
						begin
							p_pdt16b[16:31]=reg_A[48:63];
						end
						else
						begin
							p_pdt16b[16:31]=1+~reg_A[48:63];
						end
						p_pdt16b[0:15]=16'd0;

						// Convert operand B to a positive number
						if(reg_B[48]==0)
						begin
							p_pdt16b2[16:31]=reg_B[48:63];
						end
						else
						begin
							p_pdt16b2[16:31]=1+~reg_B[48:63];
						end
						p_pdt16b2[0:15]=16'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=31; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt16b2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[32:63]=p_pdt[32:63]+(p_pdt16b<<(15-(sgn%16)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[48]^reg_B[48])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[32:63]=1+~p_pdt[32:63];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[32:63]=p_pdt[32:63];
						end



						// Process the third pair of bytes

						// Convert operand A to a positive number
						if(reg_A[80]==0)
						begin
							p_pdt16c[16:31]=reg_A[80:95];
						end
						else
						begin
							p_pdt16c[16:31]=1+~reg_A[80:95];
						end
						p_pdt16c[0:15]=16'd0;

						// Convert operand B to a positive number
						if(reg_B[80]==0)
						begin
							p_pdt16c2[16:31]=reg_B[80:95];
						end
						else
						begin
							p_pdt16c2[16:31]=1+~reg_B[80:95];
						end
						p_pdt16c2[0:15]=16'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=31; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt16c2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[64:95]=p_pdt[64:95]+(p_pdt16c<<(15-(sgn%16)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[80]^reg_B[80])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[64:95]=1+~p_pdt[64:95];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[64:95]=p_pdt[64:95];
						end


						// Process the fourth pair of bytes

						// Convert operand A to a positive number
						if(reg_A[112]==0)
						begin
							p_pdt16d[16:31]=reg_A[112:127];
						end
						else
						begin
							p_pdt16d[16:31]=1+~reg_A[112:127];
						end
						p_pdt16d[0:15]=16'd0;

						// Convert operand B to a positive number
						if(reg_B[112]==0)
						begin
							p_pdt16d2[16:31]=reg_B[112:127];
						end
						else
						begin
							p_pdt16d2[16:31]=1+~reg_B[112:127];
						end
						p_pdt16d2[0:15]=16'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=31; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt16d2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[96:127]=p_pdt[96:127]+(p_pdt16d<<(15-(sgn%16)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[112]^reg_B[112])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[96:127]=1+~p_pdt[96:127];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[96:127]=p_pdt[96:127];
						end

					end
					
					
					default:	// aluwmulos AND Default
						begin
							result=128'd0;
						end
					endcase
			end










			// ======================================================
			
			
			// Signed Multiplication - even subfields
			`aluwmules:
			begin
				case(ctrl_ww)
					`w8:	// aluwmules AND `w8
					begin
						// Process the 1st byte
						
						if(reg_A[0]==0)
						begin
							p_pdt8a[8:15]=reg_A[0:7];
						end
						else
						begin
							p_pdt8a[8:15]=1+~reg_A[0:7];
						end
						p_pdt8b[0:7]=8'd0;

						if(reg_B[0]==0)
						begin
							p_pdt8a2[8:15]=reg_B[0:7];
						end
						else
						begin
							p_pdt8a2[8:15]=1+~reg_B[0:7];
						end
						p_pdt8b2[0:7]=8'd0;

						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							if(p_pdt8a2[sgn]==1'b1)
							begin
								p_pdt[0:15]=p_pdt[0:15]+(p_pdt8a<<(7-(sgn%8)));
							end
						end


						if(reg_A[0]^reg_B[0])
						begin
							result[0:15]=1+~p_pdt[0:15];
						end
						else
						begin
							result[0:15]=p_pdt[0:15];
						end



						// Process the 2nd byte

						if(reg_A[16]==0)
						begin
							p_pdt8b[8:15]=reg_A[16:23];
						end
						else
						begin
							p_pdt8b[8:15]=1+~reg_A[16:23];
						end
						p_pdt8b[0:7]=8'd0;
						if(reg_B[16]==0)
						begin
							p_pdt8b2[8:15]=reg_B[16:23];
						end
						else
						begin
							p_pdt8b2[8:15]=1+~reg_B[16:23];
						end
						p_pdt8b2[0:7]=8'd0;
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							if(p_pdt8b2[sgn]==1'b1)
							begin
								p_pdt[16:31]=p_pdt[16:31]+(p_pdt8b<<(7-(sgn%8)));
							end
						end

						if(reg_A[16]^reg_B[16])
						begin
							result[16:31]=1+~p_pdt[16:31];
						end
						else
						begin
							result[16:31]=p_pdt[16:31];
						end






						// Process the 3rd byte
						
						// Convert operand A to a positive number
						if(reg_A[32]==0)
						begin
							p_pdt8c[8:15]=reg_A[32:39];
						end
						else
						begin
							p_pdt8c[8:15]=1+~reg_A[32:39];
						end
						p_pdt8c[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[32]==0)
						begin
							p_pdt8c2[8:15]=reg_B[32:39];
						end
						else
						begin
							p_pdt8c2[8:15]=1+~reg_B[32:39];
						end
						p_pdt8c2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8c2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[32:47]=p_pdt[32:47]+(p_pdt8c<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[32]^reg_B[32])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[32:47]=1+~p_pdt[32:47];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[32:47]=p_pdt[32:47];
						end




						// Process the 4th byte
						
						// Convert operand A to a positive number
						if(reg_A[48]==0)
						begin
							p_pdt8d[8:15]=reg_A[48:55];
						end
						else
						begin
							p_pdt8d[8:15]=1+~reg_A[48:55];
						end
						p_pdt8d[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[48]==0)
						begin
							p_pdt8d2[8:15]=reg_B[48:55];
						end
						else
						begin
							p_pdt8d2[8:15]=1+~reg_B[48:55];
						end
						p_pdt8d2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8d2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[48:63]=p_pdt[48:63]+(p_pdt8d<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[48]^reg_B[48])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[48:63]=1+~p_pdt[48:63];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[48:63]=p_pdt[48:63];
						end




						// Process the 5th byte
						
						// Convert operand A to a positive number
						if(reg_A[64]==0)
						begin
							p_pdt8e[8:15]=reg_A[64:71];
						end
						else
						begin
							p_pdt8e[8:15]=1+~reg_A[64:71];
						end
						p_pdt8e[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[64]==0)
						begin
							p_pdt8e2[8:15]=reg_B[64:71];
						end
						else
						begin
							p_pdt8e2[8:15]=1+~reg_B[64:71];
						end
						p_pdt8e2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8e2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[64:79]=p_pdt[64:79]+(p_pdt8e<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[64]^reg_B[64])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[64:79]=1+~p_pdt[64:79];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[64:79]=p_pdt[64:79];
						end


						// Process the 6th byte

						// Convert operand A to a positive number
						if(reg_A[80]==0)
						begin
							p_pdt8f[8:15]=reg_A[80:87];
						end
						else
						begin
							p_pdt8f[8:15]=1+~reg_A[80:87];
						end
						p_pdt8f[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[80]==0)
						begin
							p_pdt8f2[8:15]=reg_B[80:87];
						end
						else
						begin
							p_pdt8f2[8:15]=1+~reg_B[80:87];
						end
						p_pdt8f2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8f2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[80:95]=p_pdt[80:95]+(p_pdt8f<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[80]^reg_B[80])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[80:95]=1+~p_pdt[80:95];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[80:95]=p_pdt[80:95];
						end


						// Process the 7th byte
						
						
						// Convert operand A to a positive number
						if(reg_A[96]==0)
						begin
							p_pdt8g[8:15]=reg_A[96:103];
						end
						else
						begin
							p_pdt8g[8:15]=1+~reg_A[96:103];
						end
						p_pdt8g[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[96]==0)
						begin
							p_pdt8g2[8:15]=reg_B[96:103];
						end
						else
						begin
							p_pdt8g2[8:15]=1+~reg_B[96:103];
						end
						p_pdt8g2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8g2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[96:111]=p_pdt[96:111]+(p_pdt8g<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[96]^reg_B[96])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[96:111]=1+~p_pdt[96:111];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[96:111]=p_pdt[96:111];
						end


						// Process the 8th byte


						// Convert operand A to a positive number
						if(reg_A[112]==0)
						begin
							p_pdt8h[8:15]=reg_A[112:119];
						end
						else
						begin
							p_pdt8h[8:15]=1+~reg_A[112:119];
						end
						p_pdt8h[0:7]=8'd0;

						// Convert operand B to a positive number
						if(reg_B[112]==0)
						begin
							p_pdt8h2[8:15]=reg_B[112:119];
						end
						else
						begin
							p_pdt8h2[8:15]=1+~reg_B[112:119];
						end
						p_pdt8h2[0:7]=8'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=15; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt8h2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[112:127]=p_pdt[112:127]+(p_pdt8h<<(7-(sgn%8)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[112]^reg_B[112])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[112:127]=1+~p_pdt[112:127];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[112:127]=p_pdt[112:127];
						end


					// =======================================================
					// =======================================================
					// =======================================================

					end
					`w16:	// aluwmules AND `w16
					begin

						// Process the first pair of bytes

						// Convert operand A to a positive number
						if(reg_A[0]==0)
						begin
							p_pdt16a[16:31]=reg_A[0:15];
						end
						else
						begin
							p_pdt16a[16:31]=1+~reg_A[0:15];
						end
						p_pdt16a[0:15]=16'd0;

						// Convert operand B to a positive number
						if(reg_B[0]==0)
						begin
							p_pdt16a2[16:31]=reg_B[0:15];
						end
						else
						begin
							p_pdt16a2[16:31]=1+~reg_B[0:15];
						end
						p_pdt16a2[0:15]=16'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=31; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt16a2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[0:31]=p_pdt[0:31]+(p_pdt16a<<(15-(sgn%16)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[0]^reg_B[0])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[0:31]=1+~p_pdt[0:31];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[0:31]=p_pdt[0:31];
						end



						// Process the second pair of bytes

						// Convert operand A to a positive number
						if(reg_A[32]==0)
						begin
							p_pdt16b[16:31]=reg_A[32:47];
						end
						else
						begin
							p_pdt16b[16:31]=1+~reg_A[32:47];
						end
						p_pdt16b[0:15]=16'd0;

						// Convert operand B to a positive number
						if(reg_B[32]==0)
						begin
							p_pdt16b2[16:31]=reg_B[32:47];
						end
						else
						begin
							p_pdt16b2[16:31]=1+~reg_B[32:47];
						end
						p_pdt16b2[0:15]=16'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=31; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt16b2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[32:63]=p_pdt[32:63]+(p_pdt16b<<(15-(sgn%16)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[32]^reg_B[32])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[32:63]=1+~p_pdt[32:63];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[32:63]=p_pdt[32:63];
						end



						// Process the third pair of bytes

						// Convert operand A to a positive number
						if(reg_A[64]==0)
						begin
							p_pdt16c[16:31]=reg_A[64:79];
						end
						else
						begin
							p_pdt16c[16:31]=1+~reg_A[64:79];
						end
						p_pdt16c[0:15]=16'd0;

						// Convert operand B to a positive number
						if(reg_B[64]==0)
						begin
							p_pdt16c2[16:31]=reg_B[64:79];
						end
						else
						begin
							p_pdt16c2[16:31]=1+~reg_B[64:79];
						end
						p_pdt16c2[0:15]=16'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=31; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt16c2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[64:95]=p_pdt[64:95]+(p_pdt16c<<(15-(sgn%16)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[64]^reg_B[64])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[64:95]=1+~p_pdt[64:95];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[64:95]=p_pdt[64:95];
						end


						// Process the fourth pair of bytes

						// Convert operand A to a positive number
						if(reg_A[96]==0)
						begin
							p_pdt16d[16:31]=reg_A[96:111];
						end
						else
						begin
							p_pdt16d[16:31]=1+~reg_A[96:111];
						end
						p_pdt16d[0:15]=16'd0;

						// Convert operand B to a positive number
						if(reg_B[96]==0)
						begin
							p_pdt16d2[16:31]=reg_B[96:111];
						end
						else
						begin
							p_pdt16d2[16:31]=1+~reg_B[96:111];
						end
						p_pdt16d2[0:15]=16'd0;

						// Multiply the numbers using the shift-and-add method
						for(sgn=31; sgn>=0; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if(p_pdt16d2[sgn]==1'b1)
							begin
								// Compute the partial products and sum them up
								p_pdt[96:127]=p_pdt[96:127]+(p_pdt16d<<(15-(sgn%16)));
							end
						end


						/**
						 * Perform two's complement operation on the result
						 * if the product is a result of multiplying a positive
						 * number to a negative number
						 */
						if(reg_A[96]^reg_B[96])
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[96:127]=1+~p_pdt[96:127];
						end
						else
						begin
							/**
							 * The result is negative. Perform two's complement
							 * operation
							 */
							result[96:127]=p_pdt[96:127];
						end

					end
					
					
					default:	// aluwmules AND Default
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
