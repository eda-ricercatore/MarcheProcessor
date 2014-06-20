


// only used for synthesis
`include "~/ee577b/syn/src/control.h"


module umult8(reg_A, reg_B, result, ctrl_ww);
	// INPUTS
	input [0:127] reg_A, reg_B;
	input [0:1] ctrl_ww;
	
	// OUTPUTS
	output [0:127] result;
	
	// REGISTERS
	reg [0:15] p_pdt8a, p_pdt8a2;
	reg [0:15] p_pdt8b, p_pdt8b2;
	reg [0:15] p_pdt8c, p_pdt8c2;
	reg [0:15] p_pdt8d, p_pdt8d2;
	reg [0:15] p_pdt8e, p_pdt8e2;
	reg [0:15] p_pdt8f, p_pdt8f2;
	reg [0:15] p_pdt8g, p_pdt8g2;
	reg [0:15] p_pdt8h, p_pdt8h2;
	
	reg [0:31] p_pdt16a, p_pdt16a2;
	reg [0:31] p_pdt16b, p_pdt16b2;
	reg [0:31] p_pdt16c, p_pdt16c2;
	reg [0:31] p_pdt16d, p_pdt16d2;
	
	reg [0:127] p_pdt;
	reg [0:127] result;
	
	// INTEGERS (contols for loops)
	integer i;
	
	always @ (reg_A or reg_B or ctrl_ww)
		begin
		//   reg_B
		// x reg_A
		// -------
		// result
		
		p_pdt8a=16'b0;
		p_pdt8a2=16'b0;
		p_pdt8b=16'b0;
		p_pdt8b2=16'b0;
		p_pdt8c=16'b0;
		p_pdt8c2=16'b0;
		p_pdt8d=16'b0;
		p_pdt8d2=16'b0;
		p_pdt8e=16'b0;
		p_pdt8e2=16'b0;
		p_pdt8f=16'b0;
		p_pdt8f2=16'b0;
		p_pdt8g=16'b0;
		p_pdt8g2=16'b0;
		p_pdt8h=16'b0;
		p_pdt8h2=16'b0;
		
		p_pdt16a=32'b0;
		p_pdt16a2=32'b0;
		p_pdt16b=32'b0;
		p_pdt16b2=32'b0;
		p_pdt16c=32'b0;
		p_pdt16c2=32'b0;
		p_pdt16d=32'b0;
		p_pdt16d2=32'b0;
		
		p_pdt=128'b0;
		
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

endmodule

/*		
		// extend operand B
		p8b_0={{8{1'b0}},reg_B[0:7]};
		
		// extend operand A
		p8a_0={{8{1'b0}},reg_A[0:7]};

		// compute sum due to partial products

			// not using for loop
		// pt=pt+(p8a_0[15]?(p8b_0):16'b0);
		// pt=pt+(p8a_0[14]?(p8b_0<<8'd1):16'b0);
		// pt=pt+(p8a_0[13]?(p8b_0<<8'd2):16'b0);
		// pt=pt+(p8a_0[12]?(p8b_0<<8'd3):16'b0);
		// pt=pt+(p8a_0[11]?(p8b_0<<8'd4):16'b0);
		// pt=pt+(p8a_0[10]?(p8b_0<<8'd5):16'b0);
		// pt=pt+(p8a_0[9]?(p8b_0<<8'd6):16'b0);
		// pt=pt+(p8a_0[8]?(p8b_0<<8'd7):16'b0);

		// same computation as above, but using for loop
		for (i=15; i>7; i=i-1)
			begin
			pt=pt+(p8a_0[i]?(p8b_0<<(8'd15-i)):16'b0);
			end
		// store sum as result
		result<=pt;
		end
*/



