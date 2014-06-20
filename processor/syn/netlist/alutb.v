/**
 * This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
 * and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
 * for EE577b Troy WideWord Processor Project
 */

`timescale 1ns/10ps
/**
 * `timescale time_unit base / precision base
 *
 * -Specifies the time units and precision for delays:
 * -time_unit is the amount of time a delay of 1 represents.
 *	The time unit must be 1 10 or 100
 * -base is the time base for each unit, ranging from seconds
 *	to femtoseconds, and must be: s ms us ns ps or fs
 * -precision and base represent how many decimal points of
 *	precision to use relative to the time units.
 */


// Testbench for behavioral model for the ALU


// Import the modules that will be tested for in this testbench
`include "alu.syn.v"
`include "/home/scf-07/zhiyango/ee577b/projs/processor/syn/netlist/control.h"
`include "/auto/home-scf-06/ee577/design_pdk/osu_stdcells/lib/tsmc018/lib/osu018_stdcells.v"


// IMPORTANT: To run this, try: ncverilog -f alu.f +gui
module tb_alu();
	// ============================================================
	/**
	 * Declare signal types for testbench to drive and monitor
	 * signals during the simulation of the ALU
	 *
	 * The reg data type holds a value until a new value is driven
	 * onto it in an "initial" or "always" block. It can only be
	 * assigned a value in an "always" or "initial" block, and is
	 * used to apply stimulus to the inputs of the DUT.
	 *
	 * The wire type is a passive data type that holds a value driven
	 * onto it by a port, assign statement or reg type. Wires cannot be
	 * assigned values inside "always" and "initial" blocks. They can
	 * be used to hold the values of the DUT's outputs
	 */
	
	// Declare "wire" signals: outputs from the DUT
	// result output signal
	wire [0:127] res;
	
	
	
	
	
	
	
	// ============================================================
	
	// Declare "reg" signals: inputs to the DUT
	// reg_A
	reg [0:127] r_A;
	// reg_B
	reg [0:127] r_B;
	// Control signal bits - ppp; ctrl_ppp
	reg [0:2] c_ppp;
	// Control signal bits - ww; ctrl_ww
	reg [0:1] c_ww;
	/**
	 * Control signal bits - determine which arithmetic or logic
	 * operation to perform; alu_op
	 */
	reg [0:4] a_op;
	// Bus/Signal to contain the expected output/result
	reg [0:127] e_r;
	
	
	
	
	// ============================================================
	
	// Defining constants: parameter [name_of_constant] = value;
	//parameter size_of_input = 6'd32;
	
	

	
	
	// ============================================================
	
	/**
	 * Instantiate an instance of alu() so that
	 * inputs can be passed to the Device Under Test (DUT)
	 * Given instance name is "rg"
	 */
	alu a_l_u (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		// alu (reg_A,reg_B,ctrl_ppp,ctrl_ww,alu_op,result)
		r_A,r_B,c_ppp,c_ww,a_op,res);
		
	
	
	// ============================================================

	/**
	 * Initial block start executing sequentially @ t=0
	 * If and when a delay is encountered, the execution of this block
	 * pauses or waits until the delay time has passed, before resuming
	 * execution
	 *
	 * Each intial or always block executes concurrently; that is,
	 * multiple "always" or "initial" blocks will execute simultaneously
	 *
	 * E.g.
	 * always
	 * begin
	 *		#10 clk_50 = ~clk_50; // Invert clock signal every 10 ns
	 *		// Clock signal has a period of 20 ns or 50 MHz
	 * end
	 */
	initial
	begin
		$sdf_annotate("../sdf/alu.sdf",a_l_u,"TYPICAL","1.0:1.0:1.0","FROM_MTM");
		
		
		
		
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");	
		
		
		
		// aluwadd AND aa AND w8
		r_A=128'h0102030405060708090a0b0c0d0e0f10;
		r_B=128'h01020304010203040507070809050607;
		e_r=128'h0204060806080a0c0e11121416131517;
		c_ppp=`aa;
		c_ww=`w8;
		a_op=`aluwadd;
		
		
		#10
		// aluwadd AND aa AND w8
		r_A=128'hfffffffffffffffffffffffffffffff9;
		r_B=128'h00000000000000000000000000000008;
		e_r=128'hffffffffffffffffffffffffffffff01;
		c_ppp=`aa;
		c_ww=`w8;
		a_op=`aluwadd;
		

		#10
		// aluwadd AND aa AND w16
		r_A=128'h00010002000300040005000600070008;
		r_B=128'h0002000400060008000c001000120014;
		e_r=128'h000300060009000c001100160019001c;
		c_ppp=`aa;
		c_ww=`w16;
		a_op=`aluwadd;
		
		
		#10
		// aluwadd AND aa AND w32
		r_A=128'h00000001000000020000000300000004;
		r_B=128'h00000005000000060000000700000008;
		e_r=128'h00000006000000080000000a0000000c;
		c_ppp=`aa;
		c_ww=`w32;
		a_op=`aluwadd;
		
		// ======================================
		 
		#10								//TIME=50
		// aluwadd AND uu AND w8
		r_A=128'h0102030405060708090a0b0c0d0f1011;
		r_B=128'h01010202030303030405060104050601;
		e_r=128'h0203050608090a0b0d10130d11141612;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w8;
		a_op=`aluwadd;
		
		
		#10
		// aluwadd AND uu AND w32
		r_A=128'h00010002000300040005000600070008;
		r_B=128'h00020002000300030001000100010003;
		e_r=128'h0003000400060007000600070008000b;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w16;
		a_op=`aluwadd;
		
		
		#10
		// aluwadd AND uu AND w32
		r_A=128'h00000001000000020000000300000004;
		r_B=128'h00000005000000060000000700000008;
		e_r=128'h00000006000000080000000100000002;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w32;
		a_op=`aluwadd;
		
		
		
		
		// end simulation
		#30
		
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
