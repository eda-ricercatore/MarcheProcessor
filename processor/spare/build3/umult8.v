module umult8(reg_A, reg_B, result);
	// INPUTS
	input [0:7] reg_A, reg_B;
	
	// OUTPUTS
	output [0:15] result;
	
	// REGISTERS
	reg [0:15] p8a_0;
	reg [0:15] p8b_0;
	reg [0:15] pt;
	reg [0:15] result;
	
	// INTEGERS (contols for loops)
	integer i;

	always @ (reg_A or reg_B)
		begin
		//   reg_B
		// x reg_A
		// -------
		// result
		
		p8a_0=16'b0;
		p8b_0=16'b0;
		pt=16'b0;
		
		
		// extend operand B
		p8b_0={{8{1'b0}},reg_B[0:7]};
		
		// extend operand A
		p8a_0={{8{1'b0}},reg_A[0:7]};

		// compute sum due to partial products
/*
		// not using for loop
		pt=pt+(p8a_0[15]?(p8b_0):16'b0);
		pt=pt+(p8a_0[14]?(p8b_0<<8'd1):16'b0);
		pt=pt+(p8a_0[13]?(p8b_0<<8'd2):16'b0);
		pt=pt+(p8a_0[12]?(p8b_0<<8'd3):16'b0);
		pt=pt+(p8a_0[11]?(p8b_0<<8'd4):16'b0);
		pt=pt+(p8a_0[10]?(p8b_0<<8'd5):16'b0);
		pt=pt+(p8a_0[9]?(p8b_0<<8'd6):16'b0);
		pt=pt+(p8a_0[8]?(p8b_0<<8'd7):16'b0);
*/
		// same computation as above, but using for loop
		for (i=15; i>7; i=i-1)
			begin
			pt=pt+(p8a_0[i]?(p8b_0<<(8'd15-i)):16'b0);
			end
		// store sum as result
		result<=pt;
		end
endmodule
