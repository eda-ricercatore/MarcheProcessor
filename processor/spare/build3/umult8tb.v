/**
 * This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
 * and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
 * for EE577b Troy WideWord Processor Project
 */

`timescale 1ns/10ps



// IMPORTANT: To run this, try: ncverilog -f alu.f +gui
module umult8tb();
	
	wire [0:15] result;
	
	reg [0:7] reg_A, reg_B;
	
	reg [0:15] e_result;
	
	
	
	umult8 umult8_1 (reg_A,reg_B,result);
	
	
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");	
		
		reg_B=8'h02;
		reg_A=8'h03;
		e_result=16'h06;
		#10;
		
		
		
		// end simulation
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
