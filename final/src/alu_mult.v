/**
 * This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
 * and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
 * for EE577b Troy WideWord Processor Project
 */


//included for synthesis
`include "~/ee577b/syn/src/control.h"


/*
 *ALU Functions Included (in order coded below):
 *		mules
 *		mulos
 *		muleu
 *		mulou
 */


module alu_mult(reg_A,reg_B,ctrl_ww,alu_op,result);

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

// !!TROY PART 2 START!!




			// ======================================================
			
			
			// Signed Multiplication - even subfields
			`aluwmules:
			begin
				case(ctrl_ww)
					(`w8+2'b1):	// aluwmules AND `w8
					begin
						// Process the 1st byte
						
						// Process operand B
						p_pdt8a2[8:15]=reg_B[0:7];
						p_pdt8a2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[0]==1'd1)
						begin
							p_pdt8a[8:15]=1+~reg_A[0:7];

							if(reg_B[0]==1'd1)
							begin
								p_pdt8a2[8:15]=1+~reg_B[0:7];
							end
							else
							begin
								p_pdt8a2[8:15]=reg_B[0:7];
							end

						end
						else
						begin
							p_pdt8a[8:15]=reg_A[0:7];
						end
						p_pdt8a[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8a2[15]==1'd1) 
						begin
							p_pdt[0:15]=p_pdt[0:15] - p_pdt8a[0:15];
						end
						else
						begin
							p_pdt[0:15]=p_pdt[0:15]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8a2[sgn]==1'b1) && (p_pdt8a2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[0:15]=p_pdt[0:15]-(p_pdt8a<<(7-(sgn%8)));
							end
							else if((p_pdt8a2[sgn]==1'b0) && (p_pdt8a2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[0:15]=p_pdt[0:15]+(p_pdt8a<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[0:15]=p_pdt[0:15]+0;
							end
						end
						if(p_pdt8a[8]==1'd1)
						begin
							result[0:15]<=1+~p_pdt[0:15];
						end
						else
						begin
							result[0:15]<=p_pdt[0:15];
						end




						// Process the 2nd byte

						// Process operand B
						p_pdt8b2[8:15]=reg_B[16:23];
						p_pdt8b2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[16]==1'd1)
						begin
							p_pdt8b[8:15]=1+~reg_A[16:23];

							if(reg_B[16]==1'd1)
							begin
								p_pdt8b2[8:15]=1+~reg_B[16:23];
							end
							else
							begin
								p_pdt8b2[8:15]=reg_B[16:23];
							end

						end
						else
						begin
							p_pdt8b[8:15]=reg_A[16:23];
						end
						p_pdt8b[0:7]=8'd0;
$display("p_pdt8b[0:15]",p_pdt8b[0:15]);
$display("p_pdt8b2[0:15]",p_pdt8b2[0:15]);
						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8b2[15]==1'd1) 
						begin
							p_pdt[16:31]=p_pdt[16:31] - p_pdt8b[0:15];
						end
						else
						begin
							p_pdt[16:31]=p_pdt[16:31]+0;
						end
$display("p_pdt[16:31]",p_pdt[16:31]);
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8b2[sgn]==1'b1) && (p_pdt8b2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[16:31]=p_pdt[16:31]-(p_pdt8b<<(7-(sgn%8)));
$display("MINUSp_pdt[16:31]",p_pdt[16:31]);
							end
							else if((p_pdt8b2[sgn]==1'b0) && (p_pdt8b2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[16:31]=p_pdt[16:31]+(p_pdt8b<<(7-(sgn%8)));
$display("ADDp_pdt[16:31]",p_pdt[16:31]);
							end
							else
							begin
								p_pdt[16:31]=p_pdt[16:31]+0;
$display("ZEROp_pdt[16:31]",p_pdt[16:31]);
							end
						end
						if(p_pdt8b[8]==1'd1)
						begin
							result[16:31]<=1+~p_pdt[16:31];
$display("INVp_pdt[16:31]",p_pdt[16:31]);
						end
						else
						begin
							result[16:31]<=p_pdt[16:31];
$display("RESp_pdt[16:31]",p_pdt[16:31]);
						end






						// Process the 3rd byte
						
						// Process operand B
						p_pdt8c2[8:15]=reg_B[32:39];
						p_pdt8c2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[32]==1'd1)
						begin
							p_pdt8c[8:15]=1+~reg_A[32:39];

							if(reg_B[32]==1'd1)
							begin
								p_pdt8c2[8:15]=1+~reg_B[32:39];
							end
							else
							begin
								p_pdt8c2[8:15]=reg_B[32:39];
							end

						end
						else
						begin
							p_pdt8c[8:15]=reg_A[32:39];
						end
						p_pdt8c[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8c2[15]==1'd1) 
						begin
							p_pdt[32:47]=p_pdt[32:47] - p_pdt8c[0:15];
						end
						else
						begin
							p_pdt[32:47]=p_pdt[32:47]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8c2[sgn]==1'b1) && (p_pdt8c2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[32:47]=p_pdt[32:47]-(p_pdt8c<<(7-(sgn%8)));
							end
							else if((p_pdt8c2[sgn]==1'b0) && (p_pdt8c2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[32:47]=p_pdt[32:47]+(p_pdt8c<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[32:47]=p_pdt[32:47]+0;
							end
						end
						if(p_pdt8c[8]==1'd1)
						begin
							result[32:47]<=1+~p_pdt[32:47];
						end
						else
						begin
							result[32:47]<=p_pdt[32:47];
						end




						// Process the 4th byte
						
						// Process operand B
						p_pdt8d2[8:15]=reg_B[48:55];
						p_pdt8d2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[48]==1'd1)
						begin
							p_pdt8d[8:15]=1+~reg_A[48:55];

							if(reg_B[48]==1'd1)
							begin
								p_pdt8d2[8:15]=1+~reg_B[48:55];
							end
							else
							begin
								p_pdt8d2[8:15]=reg_B[48:55];
							end

						end
						else
						begin
							p_pdt8d[8:15]=reg_A[48:55];
						end
						p_pdt8d[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8d2[15]==1'd1) 
						begin
							p_pdt[48:63]=p_pdt[48:63] - p_pdt8d[0:15];
						end
						else
						begin
							p_pdt[48:63]=p_pdt[48:63]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8d2[sgn]==1'b1) && (p_pdt8d2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[48:63]=p_pdt[48:63]-(p_pdt8d<<(7-(sgn%8)));
							end
							else if((p_pdt8d2[sgn]==1'b0) && (p_pdt8d2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[48:63]=p_pdt[48:63]+(p_pdt8d<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[48:63]=p_pdt[48:63]+0;
							end
						end
						if(p_pdt8d[8]==1'd1)
						begin
							result[48:63]<=1+~p_pdt[48:63];
						end
						else
						begin
							result[48:63]<=p_pdt[48:63];
						end




						// Process the 5th byte
						
						// Process operand B
						p_pdt8e2[8:15]=reg_B[64:71];
						p_pdt8e2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[64]==1'd1)
						begin
							p_pdt8e[8:15]=1+~reg_A[64:71];

							if(reg_B[64]==1'd1)
							begin
								p_pdt8e2[8:15]=1+~reg_B[64:71];
							end
							else
							begin
								p_pdt8e2[8:15]=reg_B[64:71];
							end

						end
						else
						begin
							p_pdt8e[8:15]=reg_A[64:71];
						end
						p_pdt8e[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8e2[15]==1'd1) 
						begin
							p_pdt[64:79]=p_pdt[64:79] - p_pdt8e[0:15];
						end
						else
						begin
							p_pdt[64:79]=p_pdt[64:79]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8e2[sgn]==1'b1) && (p_pdt8e2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[64:79]=p_pdt[64:79]-(p_pdt8e<<(7-(sgn%8)));
							end
							else if((p_pdt8e2[sgn]==1'b0) && (p_pdt8e2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[64:79]=p_pdt[64:79]+(p_pdt8e<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[64:79]=p_pdt[64:79]+0;
							end
						end
						if(p_pdt8e[8]==1'd1)
						begin
							result[64:79]<=1+~p_pdt[64:79];
						end
						else
						begin
							result[64:79]<=p_pdt[64:79];
						end



						// Process the 6th byte

						// Process operand B
						p_pdt8f2[8:15]=reg_B[80:87];
						p_pdt8f2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[80]==1'd1)
						begin
							p_pdt8f[8:15]=1+~reg_A[80:87];

							if(reg_B[80]==1'd1)
							begin
								p_pdt8f2[8:15]=1+~reg_B[80:87];
							end
							else
							begin
								p_pdt8f2[8:15]=reg_B[80:87];
							end

						end
						else
						begin
							p_pdt8f[8:15]=reg_A[80:87];
						end
						p_pdt8f[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8f2[15]==1'd1) 
						begin
							p_pdt[80:95]=p_pdt[80:95] - p_pdt8f[0:15];
						end
						else
						begin
							p_pdt[80:95]=p_pdt[80:95]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8f2[sgn]==1'b1) && (p_pdt8f2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[80:95]=p_pdt[80:95]-(p_pdt8f<<(7-(sgn%8)));
							end
							else if((p_pdt8f2[sgn]==1'b0) && (p_pdt8f2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[80:95]=p_pdt[80:95]+(p_pdt8f<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[80:95]=p_pdt[80:95]+0;
							end
						end
						if(p_pdt8f[8]==1'd1)
						begin
							result[80:95]<=1+~p_pdt[80:95];
						end
						else
						begin
							result[80:95]<=p_pdt[80:95];
						end







						// Process the 7th byte	
						
						// Process operand B
						p_pdt8g2[8:15]=reg_B[96:103];
						p_pdt8g2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[96]==1'd1)
						begin
							p_pdt8g[8:15]=1+~reg_A[96:103];

							if(reg_B[96]==1'd1)
							begin
								p_pdt8g2[8:15]=1+~reg_B[96:103];
							end
							else
							begin
								p_pdt8g2[8:15]=reg_B[96:103];
							end

						end
						else
						begin
							p_pdt8g[8:15]=reg_A[96:103];
						end
						p_pdt8g[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8g2[15]==1'd1) 
						begin
							p_pdt[96:111]=p_pdt[96:111] - p_pdt8g[0:15];
						end
						else
						begin
							p_pdt[96:111]=p_pdt[96:111]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8g2[sgn]==1'b1) && (p_pdt8g2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[96:111]=p_pdt[96:111]-(p_pdt8g<<(7-(sgn%8)));
							end
							else if((p_pdt8g2[sgn]==1'b0) && (p_pdt8g2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[96:111]=p_pdt[96:111]+(p_pdt8g<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[96:111]=p_pdt[96:111]+0;
							end
						end
						if(p_pdt8g[8]==1'd1)
						begin
							result[96:111]<=1+~p_pdt[96:111];
						end
						else
						begin
							result[96:111]<=p_pdt[96:111];
						end
						






						// Process the 8th byte

						// Process operand B
						p_pdt8h2[8:15]=reg_B[112:119];
						p_pdt8h2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[112]==1'd1)
						begin
							p_pdt8h[8:15]=1+~reg_A[112:119];

							if(reg_B[112]==1'd1)
							begin
								p_pdt8h2[8:15]=1+~reg_B[112:119];
							end
							else
							begin
								p_pdt8h2[8:15]=reg_B[112:119];
							end

						end
						else
						begin
							p_pdt8h[8:15]=reg_A[112:119];
						end
						p_pdt8h[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8h2[15]==1'd1) 
						begin
							p_pdt[112:127]=p_pdt[112:127] - p_pdt8h[0:15];
						end
						else
						begin
							p_pdt[112:127]=p_pdt[112:127]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8h2[sgn]==1'b1) && (p_pdt8h2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[112:127]=p_pdt[112:127]-(p_pdt8h<<(7-(sgn%8)));
							end
							else if((p_pdt8h2[sgn]==1'b0) && (p_pdt8h2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[112:127]=p_pdt[112:127]+(p_pdt8h<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[112:127]=p_pdt[112:127]+0;
							end
						end
						if(p_pdt8h[8]==1'd1)
						begin
							result[112:127]<=1+~p_pdt[112:127];
						end
						else
						begin
							result[112:127]<=p_pdt[112:127];
						end

					// =======================================================
					// =======================================================
					// =======================================================
					end
					(`w16+2'b1):	// aluwmules AND `w16
					begin

						// Process the first pair of bytes
						// Process operand B
						p_pdt16a2[16:31]=reg_B[0:15];
						p_pdt16a2[0:15]=16'd0;
						
						// Process operand A
						if(reg_A[0]==1'd1)
						begin
							p_pdt16a[16:31]=1+~reg_A[0:15];

							if(reg_B[0]==1'd1)
							begin
								p_pdt16a2[16:31]=1+~reg_B[0:15];
							end
							else
							begin
								p_pdt16a2[16:31]=reg_B[0:15];
							end

						end
						else
						begin
							p_pdt16a[16:31]=reg_A[0:15];
						end
						p_pdt16a[0:15]=16'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt16a2[31]==1'd1) 
						begin
							p_pdt[0:31]=p_pdt[0:31] - p_pdt16a[0:31];
						end
						else
						begin
							p_pdt[0:31]=p_pdt[0:31]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=30; sgn>=16; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt16a2[sgn]==1'b1) && (p_pdt16a2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[0:31]=p_pdt[0:31]-(p_pdt16a<<(15-(sgn%16)));
							end
							else if((p_pdt16a2[sgn]==1'b0) && (p_pdt16a2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[0:31]=p_pdt[0:31]+(p_pdt16a<<(15-(sgn%16)));
							end
							else
							begin
								p_pdt[0:31]=p_pdt[0:31]+0;
							end
						end
						if(p_pdt16a[16]==1'd1)
						begin
							result[0:31]<=1+~p_pdt[0:31];
						end
						else
						begin
							result[0:31]<=p_pdt[0:31];
						end



						// Process the second pair of bytes

						// Process operand B
						p_pdt16b2[16:31]=reg_B[32:47];
						p_pdt16b2[0:15]=16'd0;
						
						// Process operand A
						if(reg_A[32]==1'd1)
						begin
							p_pdt16b[16:31]=1+~reg_A[32:47];

							if(reg_B[32]==1'd1)
							begin
								p_pdt16b2[16:31]=1+~reg_B[32:47];
							end
							else
							begin
								p_pdt16b2[16:31]=reg_B[32:47];
							end

						end
						else
						begin
							p_pdt16b[16:31]=reg_A[0:15];
						end
						p_pdt16b[0:15]=16'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt16b2[31]==1'd1) 
						begin
							p_pdt[32:63]=p_pdt[32:63] - p_pdt16b[0:31];
						end
						else
						begin
							p_pdt[32:63]=p_pdt[32:63]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=30; sgn>=16; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt16b2[sgn]==1'b1) && (p_pdt16b2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[32:63]=p_pdt[32:63]-(p_pdt16b<<(15-(sgn%16)));
							end
							else if((p_pdt16b2[sgn]==1'b0) && (p_pdt16b2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[32:63]=p_pdt[32:63]+(p_pdt16b<<(15-(sgn%16)));
							end
							else
							begin
								p_pdt[32:63]=p_pdt[32:63]+0;
							end
						end
						if(p_pdt16b[16]==1'd1)
						begin
							result[32:63]<=1+~p_pdt[32:63];
						end
						else
						begin
							result[32:63]<=p_pdt[32:63];
						end



						// Process the third pair of bytes

						// Process operand B
						p_pdt16c2[16:31]=reg_B[64:79];
						p_pdt16c2[0:15]=16'd0;
						
						// Process operand A
						if(reg_A[64]==1'd1)
						begin
							p_pdt16c[16:31]=1+~reg_A[64:79];

							if(reg_B[64]==1'd1)
							begin
								p_pdt16c2[16:31]=1+~reg_B[64:79];
							end
							else
							begin
								p_pdt16c2[16:31]=reg_B[64:79];
							end

						end
						else
						begin
							p_pdt16c[16:31]=reg_A[64:79];
						end
						p_pdt16c[0:15]=16'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt16c2[31]==1'd1) 
						begin
							p_pdt[64:95]=p_pdt[64:95] - p_pdt16c[0:31];
						end
						else
						begin
							p_pdt[64:95]=p_pdt[64:95]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=30; sgn>=16; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt16c2[sgn]==1'b1) && (p_pdt16c2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[64:95]=p_pdt[64:95]-(p_pdt16c<<(15-(sgn%16)));
							end
							else if((p_pdt16c2[sgn]==1'b0) && (p_pdt16c2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[64:95]=p_pdt[64:95]+(p_pdt16c<<(15-(sgn%16)));
							end
							else
							begin
								p_pdt[64:95]=p_pdt[64:95]+0;
							end
						end
						if(p_pdt16c[16]==1'd1)
						begin
							result[64:95]<=1+~p_pdt[64:95];
						end
						else
						begin
							result[64:95]<=p_pdt[64:95];
						end



						// Process the fourth pair of bytes
						
						// Process operand B
						p_pdt16d2[16:31]=reg_B[96:111];
						p_pdt16d2[0:15]=16'd0;
						
						// Process operand A
						if(reg_A[96]==1'd1)
						begin
							p_pdt16d[16:31]=1+~reg_A[96:111];

							if(reg_B[96]==1'd1)
							begin
								p_pdt16d2[16:31]=1+~reg_B[96:111];
							end
							else
							begin
								p_pdt16d2[16:31]=reg_B[96:111];
							end

						end
						else
						begin
							p_pdt16d[16:31]=reg_A[96:111];
						end
						p_pdt16d[0:15]=16'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt16d2[31]==1'd1) 
						begin
							p_pdt[96:127]=p_pdt[96:127] - p_pdt16d[0:31];
						end
						else
						begin
							p_pdt[96:127]=p_pdt[96:127]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=30; sgn>=16; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt16d2[sgn]==1'b1) && (p_pdt16d2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[96:127]=p_pdt[96:127]-(p_pdt16d<<(15-(sgn%16)));
							end
							else if((p_pdt16d2[sgn]==1'b0) && (p_pdt16d2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[96:127]=p_pdt[96:127]+(p_pdt16d<<(15-(sgn%16)));
							end
							else
							begin
								p_pdt[96:127]=p_pdt[96:127]+0;
							end
						end
						if(p_pdt16d[16]==1'd1)
						begin
							result[96:127]<=1+~p_pdt[96:127];
						end
						else
						begin
							result[96:127]<=p_pdt[96:127];
						end
					end
					
					
					default:	// aluwmules AND Default
						begin
							result<=128'd0;
						end
					endcase
			end						



			// ======================================================
			// Signed Multiplication - odd subfields
			`aluwmulos:
			begin
				case(ctrl_ww)
					(`w8+2'b1):	// aluwmulos AND `w8
					begin
						// Process the 1st byte
						
						// Process operand B
						p_pdt8a2[8:15]=reg_B[8:15];
						p_pdt8a2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[8]==1'd1)
						begin
							p_pdt8a[8:15]=1+~reg_A[8:15];

							if(reg_B[8]==1'd1)
							begin
								p_pdt8a2[8:15]=1+~reg_B[8:15];
							end
							else
							begin
								p_pdt8a2[8:15]=reg_B[8:15];
							end

						end
						else
						begin
							p_pdt8a[8:15]=reg_A[8:15];
						end
						p_pdt8a[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8a2[15]==1'd1) 
						begin
							p_pdt[0:15]=p_pdt[0:15] - p_pdt8a[0:15];
						end
						else
						begin
							p_pdt[0:15]=p_pdt[0:15]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8a2[sgn]==1'b1) && (p_pdt8a2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[0:15]=p_pdt[0:15]-(p_pdt8a<<(7-(sgn%8)));
							end
							else if((p_pdt8a2[sgn]==1'b0) && (p_pdt8a2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[0:15]=p_pdt[0:15]+(p_pdt8a<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[0:15]=p_pdt[0:15]+0;
							end
						end
						if(p_pdt8a[8]==1'd1)
						begin
							result[0:15]<=1+~p_pdt[0:15];
						end
						else
						begin
							result[0:15]<=p_pdt[0:15];
						end




						// Process the 2nd byte

						// Process operand B
						p_pdt8b2[8:15]=reg_B[24:31];
						p_pdt8b2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[24]==1'd1)
						begin
							p_pdt8b[8:15]=1+~reg_A[24:31];

							if(reg_B[24]==1'd1)
							begin
								p_pdt8b2[8:15]=1+~reg_B[24:31];
							end
							else
							begin
								p_pdt8b2[8:15]=reg_B[24:31];
							end

						end
						else
						begin
							p_pdt8b[8:15]=reg_A[24:31];
						end
						p_pdt8b[0:7]=8'd0;
						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8b2[15]==1'd1) 
						begin
							p_pdt[16:31]=p_pdt[16:31] - p_pdt8b[0:15];
						end
						else
						begin
							p_pdt[16:31]=p_pdt[16:31]+0;
						end
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8b2[sgn]==1'b1) && (p_pdt8b2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[16:31]=p_pdt[16:31]-(p_pdt8b<<(7-(sgn%8)));
							end
							else if((p_pdt8b2[sgn]==1'b0) && (p_pdt8b2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[16:31]=p_pdt[16:31]+(p_pdt8b<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[16:31]=p_pdt[16:31]+0;
							end
						end
						if(p_pdt8b[8]==1'd1)
						begin
							result[16:31]<=1+~p_pdt[16:31];
						end
						else
						begin
							result[16:31]<=p_pdt[16:31];
						end






						// Process the 3rd byte
						
						// Process operand B
						p_pdt8c2[8:15]=reg_B[40:47];
						p_pdt8c2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[40]==1'd1)
						begin
							p_pdt8c[8:15]=1+~reg_A[40:47];

							if(reg_B[40]==1'd1)
							begin
								p_pdt8c2[8:15]=1+~reg_B[40:47];
							end
							else
							begin
								p_pdt8c2[8:15]=reg_B[40:47];
							end

						end
						else
						begin
							p_pdt8c[8:15]=reg_A[40:47];
						end
						p_pdt8c[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8c2[15]==1'd1) 
						begin
							p_pdt[32:47]=p_pdt[32:47] - p_pdt8c[0:15];
						end
						else
						begin
							p_pdt[32:47]=p_pdt[32:47]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8c2[sgn]==1'b1) && (p_pdt8c2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[32:47]=p_pdt[32:47]-(p_pdt8c<<(7-(sgn%8)));
							end
							else if((p_pdt8c2[sgn]==1'b0) && (p_pdt8c2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[32:47]=p_pdt[32:47]+(p_pdt8c<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[32:47]=p_pdt[32:47]+0;
							end
						end
						if(p_pdt8c[8]==1'd1)
						begin
							result[32:47]<=1+~p_pdt[32:47];
						end
						else
						begin
							result[32:47]<=p_pdt[32:47];
						end




						// Process the 4th byte
						
						// Process operand B
						p_pdt8d2[8:15]=reg_B[56:63];
						p_pdt8d2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[56]==1'd1)
						begin
							p_pdt8d[8:15]=1+~reg_A[56:63];

							if(reg_B[56]==1'd1)
							begin
								p_pdt8d2[8:15]=1+~reg_B[56:63];
							end
							else
							begin
								p_pdt8d2[8:15]=reg_B[56:63];
							end

						end
						else
						begin
							p_pdt8d[8:15]=reg_A[56:63];
						end
						p_pdt8d[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8d2[15]==1'd1) 
						begin
							p_pdt[48:63]=p_pdt[48:63] - p_pdt8d[0:15];
						end
						else
						begin
							p_pdt[48:63]=p_pdt[48:63]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8d2[sgn]==1'b1) && (p_pdt8d2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[48:63]=p_pdt[48:63]-(p_pdt8d<<(7-(sgn%8)));
							end
							else if((p_pdt8d2[sgn]==1'b0) && (p_pdt8d2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[48:63]=p_pdt[48:63]+(p_pdt8d<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[48:63]=p_pdt[48:63]+0;
							end
						end
						if(p_pdt8d[8]==1'd1)
						begin
							result[48:63]<=1+~p_pdt[48:63];
						end
						else
						begin
							result[48:63]<=p_pdt[48:63];
						end




						// Process the 5th byte
						
						// Process operand B
						p_pdt8e2[8:15]=reg_B[72:79];
						p_pdt8e2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[72]==1'd1)
						begin
							p_pdt8e[8:15]=1+~reg_A[72:79];

							if(reg_B[72]==1'd1)
							begin
								p_pdt8e2[8:15]=1+~reg_B[72:79];
							end
							else
							begin
								p_pdt8e2[8:15]=reg_B[72:79];
							end

						end
						else
						begin
							p_pdt8e[8:15]=reg_A[72:79];
						end
						p_pdt8e[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8e2[15]==1'd1) 
						begin
							p_pdt[64:79]=p_pdt[64:79] - p_pdt8e[0:15];
						end
						else
						begin
							p_pdt[64:79]=p_pdt[64:79]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8e2[sgn]==1'b1) && (p_pdt8e2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[64:79]=p_pdt[64:79]-(p_pdt8e<<(7-(sgn%8)));
							end
							else if((p_pdt8e2[sgn]==1'b0) && (p_pdt8e2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[64:79]=p_pdt[64:79]+(p_pdt8e<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[64:79]=p_pdt[64:79]+0;
							end
						end
						if(p_pdt8e[8]==1'd1)
						begin
							result[64:79]<=1+~p_pdt[64:79];
						end
						else
						begin
							result[64:79]<=p_pdt[64:79];
						end



						// Process the 6th byte

						// Process operand B
						p_pdt8f2[8:15]=reg_B[88:95];
						p_pdt8f2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[88]==1'd1)
						begin
							p_pdt8f[8:15]=1+~reg_A[88:95];

							if(reg_B[88]==1'd1)
							begin
								p_pdt8f2[8:15]=1+~reg_B[88:95];
							end
							else
							begin
								p_pdt8f2[8:15]=reg_B[88:95];
							end

						end
						else
						begin
							p_pdt8f[8:15]=reg_A[88:95];
						end
						p_pdt8f[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8f2[15]==1'd1) 
						begin
							p_pdt[80:95]=p_pdt[80:95] - p_pdt8f[0:15];
						end
						else
						begin
							p_pdt[80:95]=p_pdt[80:95]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8f2[sgn]==1'b1) && (p_pdt8f2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[80:95]=p_pdt[80:95]-(p_pdt8f<<(7-(sgn%8)));
							end
							else if((p_pdt8f2[sgn]==1'b0) && (p_pdt8f2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[80:95]=p_pdt[80:95]+(p_pdt8f<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[80:95]=p_pdt[80:95]+0;
							end
						end
						if(p_pdt8f[8]==1'd1)
						begin
							result[80:95]<=1+~p_pdt[80:95];
						end
						else
						begin
							result[80:95]<=p_pdt[80:95];
						end







						// Process the 7th byte	
						
						// Process operand B
						p_pdt8g2[8:15]=reg_B[104:111];
						p_pdt8g2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[104]==1'd1)
						begin
							p_pdt8g[8:15]=1+~reg_A[104:111];

							if(reg_B[104]==1'd1)
							begin
								p_pdt8g2[8:15]=1+~reg_B[104:111];
							end
							else
							begin
								p_pdt8g2[8:15]=reg_B[104:111];
							end

						end
						else
						begin
							p_pdt8g[8:15]=reg_A[104:111];
						end
						p_pdt8g[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8g2[15]==1'd1) 
						begin
							p_pdt[96:111]=p_pdt[96:111] - p_pdt8g[0:15];
						end
						else
						begin
							p_pdt[96:111]=p_pdt[96:111]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8g2[sgn]==1'b1) && (p_pdt8g2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[96:111]=p_pdt[96:111]-(p_pdt8g<<(7-(sgn%8)));
							end
							else if((p_pdt8g2[sgn]==1'b0) && (p_pdt8g2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[96:111]=p_pdt[96:111]+(p_pdt8g<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[96:111]=p_pdt[96:111]+0;
							end
						end
						if(p_pdt8g[8]==1'd1)
						begin
							result[96:111]<=1+~p_pdt[96:111];
						end
						else
						begin
							result[96:111]<=p_pdt[96:111];
						end
						






						// Process the 8th byte

						// Process operand B
						p_pdt8h2[8:15]=reg_B[120:127];
						p_pdt8h2[0:7]=8'd0;
						
						// Process operand A
						if(reg_A[120]==1'd1)
						begin
							p_pdt8h[8:15]=1+~reg_A[120:127];

							if(reg_B[120]==1'd1)
							begin
								p_pdt8h2[8:15]=1+~reg_B[120:127];
							end
							else
							begin
								p_pdt8h2[8:15]=reg_B[120:127];
							end

						end
						else
						begin
							p_pdt8h[8:15]=reg_A[120:127];
						end
						p_pdt8h[0:7]=8'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt8h2[15]==1'd1) 
						begin
							p_pdt[112:127]=p_pdt[112:127] - p_pdt8h[0:15];
						end
						else
						begin
							p_pdt[112:127]=p_pdt[112:127]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=14; sgn>=8; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt8h2[sgn]==1'b1) && (p_pdt8h2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[112:127]=p_pdt[112:127]-(p_pdt8h<<(7-(sgn%8)));
							end
							else if((p_pdt8h2[sgn]==1'b0) && (p_pdt8h2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[112:127]=p_pdt[112:127]+(p_pdt8h<<(7-(sgn%8)));
							end
							else
							begin
								p_pdt[112:127]=p_pdt[112:127]+0;
							end
						end
						if(p_pdt8h[8]==1'd1)
						begin
							result[112:127]<=1+~p_pdt[112:127];
						end
						else
						begin
							result[112:127]<=p_pdt[112:127];
						end

					// ---------------------------------------

					end
					(`w16+2'b1):	// aluwmulos AND `w16
					begin

						// Process the first pair of bytes
						// Process operand B
						p_pdt16a2[16:31]=reg_B[16:31];
						p_pdt16a2[0:15]=16'd0;
						
						// Process operand A
						if(reg_A[16]==1'd1)
						begin
							p_pdt16a[16:31]=1+~reg_A[16:31];

							if(reg_B[16]==1'd1)
							begin
								p_pdt16a2[16:31]=1+~reg_B[16:31];
							end
							else
							begin
								p_pdt16a2[16:31]=reg_B[16:31];
							end

						end
						else
						begin
							p_pdt16a[16:31]=reg_A[16:31];
						end
						p_pdt16a[0:15]=16'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt16a2[31]==1'd1) 
						begin
							p_pdt[0:31]=p_pdt[0:31] - p_pdt16a[0:31];
						end
						else
						begin
							p_pdt[0:31]=p_pdt[0:31]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=30; sgn>=16; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt16a2[sgn]==1'b1) && (p_pdt16a2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[0:31]=p_pdt[0:31]-(p_pdt16a<<(15-(sgn%16)));
							end
							else if((p_pdt16a2[sgn]==1'b0) && (p_pdt16a2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[0:31]=p_pdt[0:31]+(p_pdt16a<<(15-(sgn%16)));
							end
							else
							begin
								p_pdt[0:31]=p_pdt[0:31]+0;
							end
						end
						if(p_pdt16a[16]==1'd1)
						begin
							result[0:31]<=1+~p_pdt[0:31];
						end
						else
						begin
							result[0:31]<=p_pdt[0:31];
						end



						// Process the second pair of bytes

						// Process operand B
						p_pdt16b2[16:31]=reg_B[48:63];
						p_pdt16b2[0:15]=16'd0;
						
						// Process operand A
						if(reg_A[48]==1'd1)
						begin
							p_pdt16b[16:31]=1+~reg_A[48:63];

							if(reg_B[48]==1'd1)
							begin
								p_pdt16b2[16:31]=1+~reg_B[48:63];
							end
							else
							begin
								p_pdt16b2[16:31]=reg_B[48:63];
							end

						end
						else
						begin
							p_pdt16b[16:31]=reg_A[48:63];
						end
						p_pdt16b[0:15]=16'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt16b2[31]==1'd1) 
						begin
							p_pdt[32:63]=p_pdt[32:63] - p_pdt16b[0:31];
						end
						else
						begin
							p_pdt[32:63]=p_pdt[32:63]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=30; sgn>=16; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt16b2[sgn]==1'b1) && (p_pdt16b2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[32:63]=p_pdt[32:63]-(p_pdt16b<<(15-(sgn%16)));
							end
							else if((p_pdt16b2[sgn]==1'b0) && (p_pdt16b2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[32:63]=p_pdt[32:63]+(p_pdt16b<<(15-(sgn%16)));
							end
							else
							begin
								p_pdt[32:63]=p_pdt[32:63]+0;
							end
						end
						if(p_pdt16b[16]==1'd1)
						begin
							result[32:63]<=1+~p_pdt[32:63];
						end
						else
						begin
							result[32:63]<=p_pdt[32:63];
						end



						// Process the third pair of bytes

						// Process operand B
						p_pdt16c2[16:31]=reg_B[80:95];
						p_pdt16c2[0:15]=16'd0;
						
						// Process operand A
						if(reg_A[80]==1'd1)
						begin
							p_pdt16c[16:31]=1+~reg_A[80:95];

							if(reg_B[80]==1'd1)
							begin
								p_pdt16c2[16:31]=1+~reg_B[80:95];
							end
							else
							begin
								p_pdt16c2[16:31]=reg_B[80:95];
							end

						end
						else
						begin
							p_pdt16c[16:31]=reg_A[80:95];
						end
						p_pdt16c[0:15]=16'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt16c2[31]==1'd1) 
						begin
							p_pdt[64:95]=p_pdt[64:95] - p_pdt16c[0:31];
						end
						else
						begin
							p_pdt[64:95]=p_pdt[64:95]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=30; sgn>=16; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt16c2[sgn]==1'b1) && (p_pdt16c2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[64:95]=p_pdt[64:95]-(p_pdt16c<<(15-(sgn%16)));
							end
							else if((p_pdt16c2[sgn]==1'b0) && (p_pdt16c2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[64:95]=p_pdt[64:95]+(p_pdt16c<<(15-(sgn%16)));
							end
							else
							begin
								p_pdt[64:95]=p_pdt[64:95]+0;
							end
						end
						if(p_pdt16c[16]==1'd1)
						begin
							result[64:95]<=1+~p_pdt[64:95];
						end
						else
						begin
							result[64:95]<=p_pdt[64:95];
						end



						// Process the fourth pair of bytes
						
						// Process operand B
						p_pdt16d2[16:31]=reg_B[112:127];
						p_pdt16d2[0:15]=16'd0;
						
						// Process operand A
						if(reg_A[112]==1'd1)
						begin
							p_pdt16d[16:31]=1+~reg_A[112:127];

							if(reg_B[112]==1'd1)
							begin
								p_pdt16d2[16:31]=1+~reg_B[112:127];
							end
							else
							begin
								p_pdt16d2[16:31]=reg_B[112:127];
							end

						end
						else
						begin
							p_pdt16d[16:31]=reg_A[112:127];
						end
						p_pdt16d[0:15]=16'd0;

						
						// Determine the 1st recoded bit and compute the result
						if(p_pdt16d2[31]==1'd1) 
						begin
							p_pdt[96:127]=p_pdt[96:127] - p_pdt16d[0:31];
						end
						else
						begin
							p_pdt[96:127]=p_pdt[96:127]+0;
						end
						
						// Multiply the numbers using the shift-and-add method
						for(sgn=30; sgn>=16; sgn=sgn-1)
						begin
							/**
							 * Shift the multiplier to determine the partial
							 * product for this current shift
							 */
							if((p_pdt16d2[sgn]==1'b1) && (p_pdt16d2[sgn+1]==1'b0))
							begin
								// Compute the partial products and sum them up
								p_pdt[96:127]=p_pdt[96:127]-(p_pdt16d<<(15-(sgn%16)));
							end
							else if((p_pdt16d2[sgn]==1'b0) && (p_pdt16d2[sgn+1]==1'b1))
							begin
								// Compute the partial products and sum them up
								p_pdt[96:127]=p_pdt[96:127]+(p_pdt16d<<(15-(sgn%16)));
							end
							else
							begin
								p_pdt[96:127]=p_pdt[96:127]+0;
							end
						end
						if(p_pdt16d[16]==1'd1)
						begin
							result[96:127]<=1+~p_pdt[96:127];
						end
						else
						begin
							result[96:127]<=p_pdt[96:127];
						end
					end
					
					
					default:	// aluwmules AND Default
					begin
						result<=128'd0;
					end
				endcase
			end





			// ===========================================
			// Unsigned Multiplication - even subfields
			`aluwmuleu:
				begin
					case(ctrl_ww)
					(`w8+2'b1):
						begin
						
						// 1st even byte
						// extend operand B
						p_pdt8a2={{8{1'b0}},reg_B[0+(16*0):7+(16*0)]}; 
						// extend operand A
						p_pdt8a={{8{1'b0}},reg_A[0+(16*0):7+(16*0)]}; 
						// i loops through each bit to compute sum of partial products
						for (i=15; i>7; i=i-1)
							p_pdt[0+(16*0):15+(16*0)]=p_pdt[0+(16*0):15+(16*0)] 
							+ (p_pdt8a[i]?(p_pdt8a2<<(8'd15-i)):16'b0);

						// 2nd even byte
						// extend operand B
						p_pdt8b2={{8{1'b0}},reg_B[0+(16*1):7+(16*1)]}; 
						// extend operand A
						p_pdt8b={{8{1'b0}},reg_A[0+(16*1):7+(16*1)]}; 
						// i loops through each bit to compute sum of partial products
						for (i=15; i>7; i=i-1)
							p_pdt[0+(16*1):15+(16*1)]=p_pdt[0+(16*1):15+(16*1)] 
							+ (p_pdt8b[i]?(p_pdt8b2<<(8'd15-i)):16'b0);

						// 3rd even byte
						// extend operand B
						p_pdt8c2={{8{1'b0}},reg_B[0+(16*2):7+(16*2)]}; 
						// extend operand A
						p_pdt8c={{8{1'b0}},reg_A[0+(16*2):7+(16*2)]}; 
						// i loops through each bit to compute sum of partial products
						for (i=15; i>7; i=i-1)
							p_pdt[0+(16*2):15+(16*2)]=p_pdt[0+(16*2):15+(16*2)] 
							+ (p_pdt8c[i]?(p_pdt8c2<<(8'd15-i)):16'b0);

						// 4th even byte
						// extend operand B
						p_pdt8d2={{8{1'b0}},reg_B[0+(16*3):7+(16*3)]}; 
						// extend operand A
						p_pdt8d={{8{1'b0}},reg_A[0+(16*3):7+(16*3)]}; 
						// i loops through each bit to compute sum of partial products
						for (i=15; i>7; i=i-1)
							p_pdt[0+(16*3):15+(16*3)]=p_pdt[0+(16*3):15+(16*3)] 
							+ (p_pdt8d[i]?(p_pdt8d2<<(8'd15-i)):16'b0);

						// 5th even byte
						// extend operand B
						p_pdt8e2={{8{1'b0}},reg_B[0+(16*4):7+(16*4)]}; 
						// extend operand A
						p_pdt8e={{8{1'b0}},reg_A[0+(16*4):7+(16*4)]}; 
						// i loops through each bit to compute sum of partial products
						for (i=15; i>7; i=i-1)
							p_pdt[0+(16*4):15+(16*4)]=p_pdt[0+(16*4):15+(16*4)] 
							+ (p_pdt8e[i]?(p_pdt8e2<<(8'd15-i)):16'b0);

						// 6th even byte
						// extend operand B
						p_pdt8f2={{8{1'b0}},reg_B[0+(16*5):7+(16*5)]}; 
						// extend operand A
						p_pdt8f={{8{1'b0}},reg_A[0+(16*5):7+(16*5)]}; 
						// i loops through each bit to compute sum of partial products
						for (i=15; i>7; i=i-1)
							p_pdt[0+(16*5):15+(16*5)]=p_pdt[0+(16*5):15+(16*5)] 
							+ (p_pdt8f[i]?(p_pdt8f2<<(8'd15-i)):16'b0);

						// 7th even byte
						// extend operand B
						p_pdt8g2={{8{1'b0}},reg_B[0+(16*6):7+(16*6)]}; 
						// extend operand A
						p_pdt8g={{8{1'b0}},reg_A[0+(16*6):7+(16*6)]}; 
						// i loops through each bit to compute sum of partial products
						for (i=15; i>7; i=i-1)
							p_pdt[0+(16*6):15+(16*6)]=p_pdt[0+(16*6):15+(16*6)] 
							+ (p_pdt8g[i]?(p_pdt8g2<<(8'd15-i)):16'b0);

						// 8th even byte
						// extend operand B
						p_pdt8h2={{8{1'b0}},reg_B[0+(16*7):7+(16*7)]}; 
						// extend operand A
						p_pdt8h={{8{1'b0}},reg_A[0+(16*7):7+(16*7)]}; 
						// i loops through each bit to compute sum of partial products
						for (i=15; i>7; i=i-1)
							p_pdt[0+(16*7):15+(16*7)]=p_pdt[0+(16*7):15+(16*7)] 
							+ (p_pdt8h[i]?(p_pdt8h2<<(8'd15-i)):16'b0);

						result<=p_pdt;
						end // case (`w8+2'b1)

					(`w16+2'b1):
						begin

						// 1st word
						// extend operand B
						p_pdt16a2={{16{1'b0}},reg_B[0+(32*0):15+(32*0)]};
						// extend operand A
						p_pdt16a={{16{1'b0}},reg_A[0+(32*0):15+(32*0)]};
						// i loops through each bit to compute sum due to partial products
						for (i=31; i>15; i=i-1)
							p_pdt[0+(32*0):31+(32*0)]=p_pdt[0+(32*0):31+(32*0)] 
							+ (p_pdt16a[i]?(p_pdt16a2<<(8'd31-i)):32'b0);

						// 2nd word
						// extend operand B
						p_pdt16b2={{16{1'b0}},reg_B[0+(32*1):15+(32*1)]};
						// extend operand A
						p_pdt16b={{16{1'b0}},reg_A[0+(32*1):15+(32*1)]};
						// i loops through each bit to compute sum due to partial products
						for (i=31; i>15; i=i-1)
							p_pdt[0+(32*1):31+(32*1)]=p_pdt[0+(32*1):31+(32*1)] 
							+ (p_pdt16b[i]?(p_pdt16b2<<(8'd31-i)):32'b0);

						// 3rd word
						// extend operand B
						p_pdt16c2={{16{1'b0}},reg_B[0+(32*2):15+(32*2)]};
						// extend operand A
						p_pdt16c={{16{1'b0}},reg_A[0+(32*2):15+(32*2)]};
						// i loops through each bit to compute sum due to partial products
						for (i=31; i>15; i=i-1)
							p_pdt[0+(32*2):31+(32*2)]=p_pdt[0+(32*2):31+(32*2)] 
							+ (p_pdt16c[i]?(p_pdt16c2<<(8'd31-i)):32'b0);

						// 4th word
						// extend operand B
						p_pdt16d2={{16{1'b0}},reg_B[0+(32*3):15+(32*3)]};
						// extend operand A
						p_pdt16d={{16{1'b0}},reg_A[0+(32*3):15+(32*3)]};
						// i loops through each bit to compute sum due to partial products
						for (i=31; i>15; i=i-1)
							p_pdt[0+(32*3):31+(32*3)]=p_pdt[0+(32*3):31+(32*3)] 
							+ (p_pdt16d[i]?(p_pdt16d2<<(8'd31-i)):32'b0);

						result<=p_pdt;
						end // case (`w16+2'b1)

					default:
						begin
						result<=128'd0;
						end
					endcase // case(ctrl_ww)
				end



			// ===================================
			// Unsigned Multiplication - odd subfields
			`aluwmulou:
			begin
				case(ctrl_ww)
					(`w8+2'd1):	// aluwmulou AND `w8
					begin
						p_pdt8a[8:15]=reg_A[8:15];
						p_pdt8a[0:7]=8'd0;
						p_pdt8a2[0:15]={{8{1'b0}},reg_B[8:15]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[0:15]=p_pdt[0:15]+((p_pdt8a[sgn]==1'd1)?(p_pdt8a2<<(8'd15-sgn)):16'b0);
						end

						p_pdt8b[8:15]=reg_A[24:31];
						p_pdt8b[0:7]=8'd0;
						p_pdt8b2[0:15]={{8{1'b0}},reg_B[24:31]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[16:31]=p_pdt[16:31]+((p_pdt8b[sgn]==1'd1)?(p_pdt8b2<<(8'd15-sgn)):16'b0);
						end

						p_pdt8c[8:15]=reg_A[40:47];
						p_pdt8c[0:7]=8'd0;
						p_pdt8c2[0:15]={{8{1'b0}},reg_B[40:47]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[32:47]=p_pdt[32:47]+((p_pdt8c[sgn]==1'd1)?(p_pdt8c2<<(8'd15-sgn)):16'b0);
						end

						p_pdt8d[8:15]=reg_A[56:63];
						p_pdt8d[0:7]=8'd0;
						p_pdt8d2[0:15]={{8{1'b0}},reg_B[56:63]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[48:63]=p_pdt[48:63]+((p_pdt8d[sgn]==1'd1)?(p_pdt8d2<<(8'd15-sgn)):16'b0);
						end

						p_pdt8e[8:15]=reg_A[72:79];
						p_pdt8e[0:7]=8'd0;
						p_pdt8e2[0:15]={{8{1'b0}},reg_B[72:79]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[64:79]=p_pdt[64:79]+((p_pdt8e[sgn]==1'd1)?(p_pdt8e2<<(8'd15-sgn)):16'b0);
						end

						p_pdt8f[8:15]=reg_A[88:95];
						p_pdt8f[0:7]=8'd0;
						p_pdt8f2[0:15]={{8{1'b0}},reg_B[88:95]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[80:95]=p_pdt[80:95]+((p_pdt8f[sgn]==1'd1)?(p_pdt8f2<<(8'd15-sgn)):16'b0);
						end

						p_pdt8g[8:15]=reg_A[104:111];
						p_pdt8g[0:7]=8'd0;
						p_pdt8g2[0:15]={{8{1'b0}},reg_B[104:111]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[96:111]=p_pdt[96:111]+((p_pdt8g[sgn]==1'd1)?(p_pdt8g2<<(8'd15-sgn)):16'b0);
						end

						p_pdt8h[8:15]=reg_A[120:127];
						p_pdt8h[0:7]=8'd0;
						p_pdt8h2[0:15]={{8{1'b0}},reg_B[120:127]};
						for(sgn=15; sgn>=8; sgn=sgn-1)
						begin
						p_pdt[112:127]=p_pdt[112:127]+((p_pdt8h[sgn]==1'd1)?(p_pdt8h2<<(8'd15-sgn)):16'b0);
						end

						result<=p_pdt;
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

						result<=p_pdt;
					end
					
					
					default:	// aluwmulou AND Default
						begin
							result<=128'd0;
						end
					endcase
			end

// !!TROY PART 2 END!!

			// ==================================================================

			default:
			begin
				// Default arithmetic/logic operation
				result<=128'd0;
			end
		endcase
	end
	
	
	
	
endmodule
