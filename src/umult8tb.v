/**
 * This is written by Zhiyang Ong
 * and Andrew Mattheisen 
 * for EE577b Troy WideWord Processor Project
 */

`timescale 1ns/10ps
`include "control.h"


// IMPORTANT: To run this, try: ncverilog -f alu.f +gui
module umult8tb();
	
	wire [0:127] result;
	
	reg [0:127] reg_A, reg_B;
	
	reg [0:127] e_result;
	
	reg [0:1] ctrl_ww;
	
	umult8 umult8_1 (reg_A,reg_B,result,ctrl_ww);
	
	
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");	
		
		ctrl_ww=	2'b01;
		reg_B=		128'h02000000020000000200000002000000;
		reg_A=		128'h03000000030000000300000003000000;
		e_result=	128'h06000000060000000600000006000000;
		#10;
		
		ctrl_ww=	2'b10;
		reg_B=		128'h00020000000200000002000000020000;
		reg_A=		128'h00030000000300000003000000030000;
		e_result=	128'h00060000000600000006000000060000;
		#10;
		
		
		// end simulation
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
