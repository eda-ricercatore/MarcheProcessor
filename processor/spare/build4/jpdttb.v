/**
 * This is written by Zhiyang Ong 
 * and Andrew Mattheisen 
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
`include "jpdt.v"
`include "control.h"

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
		r_A,r_B,c_ww,a_op,res);
		
	
	
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
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");	
		
		
		// aluwmuleu AND w8
/*
r_A=31'h0402050f;
r_B=31'h0301020c;
e_r=31'h000c0006;
		c_ww=`w8;
		a_op=`aluwmuleu;
*/
		r_A=128'h0402030405060708f00a0b0cff0eff00;
		r_B=128'h03010202030303031004f505ff09fe10;
		e_r=128'h000c0006000f00150f000a87fe01fd02;
		c_ww=`w8;
		a_op=`aluwmuleu;
		
		
		#10
		// aluwmuleu AND w16
		r_A=128'h000100020000ffff000f10bff103ffff;
		r_B=128'h000200040006ffff000c100000120014;
		e_r=128'h0000000200000000000000b40010f236;
		c_ww=`w16;
		a_op=`aluwmuleu;
		
		
		
		
		// ======================================
		
		
		
		#10
		// aluwmulou AND w8
		r_A=128'h0102030405060708090aff0c0dff0fff;
		r_B=128'h01010202030303031004040508000fff;
		e_r=128'h00020008001200180028003c0000fe01;
		c_ww=`w8;
		a_op=`aluwmulou;
		
		
		#10
		// aluwmulou AND w16
		r_A=128'h0001000200000008000f10bff103ffff;
		r_B=128'h0002000400060008000c001000120014;
		e_r=128'h000000080000004000010bf00013ffec;
		c_ww=`w16;
		a_op=`aluwmulou;
		
		
		
		// ======================================
		
		
		
		#10
		// aluwmulos AND w8
		/*
		r_A=128'h010330405060708090aff0c0dff0ff02;
		r_B=128'h01fa0202030303031004040508000f08;
		*/
		r_A=128'h0180010501f9015301040100013c0100;
		r_B=128'h017f010901fa010001fd01f101b80100;
		e_r=128'hc080002d002a0000fff40000ef200000;
		c_ww=`w8;
		a_op=`aluwmulos;
		
		
		
		#10
		// aluwmulos AND w16

		r_A=128'h1111000211118000111120541111fff9;
		r_B=128'hffff0004ffff7fffffff0000fffffffd;
		e_r=128'h00000008c00080000000000000000015;
		c_ww=`w16;
		a_op=`aluwmulos;
	
		
		
		
		
		
		
		// ======================================
		
		
		
		#10
		// aluwmules AND w8
		/*
		r_A=128'h0180010501f9015301040100013c0100;
		r_B=128'h017f010901fa010001fd01f101b80100;
		*/
		r_A=128'h80010501f9015301040100013c010001;
		r_B=128'h7f010901fa010001fd01f101b8010001;
		e_r=128'hc080002d002a0000fff40000ef200000;
		c_ww=`w8;
		a_op=`aluwmules;
		
		
		
		#10
		// aluwmules AND w16
		/*
		r_A=128'h1111000211118000111120541111fff9;
		r_B=128'hffff0004ffff7fffffff0000fffffffd;
		*/
		r_A=128'h000211118000111120541111fff91111;
		r_B=128'h0004ffff7fffffff0000fffffffdffff;
		e_r=128'h00000008c00080000000000000000015;
		c_ww=`w16;
		a_op=`aluwmules;
	
		
		// end simulation
		#30
		
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
