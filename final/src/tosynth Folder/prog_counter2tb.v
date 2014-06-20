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


// Testbench for behavioral model for the program counter


// Import the modules that will be tested for in this testbench
`include "prog_counter2.v"

// IMPORTANT: To run this, try: ncverilog -f prog_counter.f +gui
module prog_counter2tb();
	// ============================================================
	/**
	 * Declare signal types for testbench to drive and monitor
	 * signals during the simulation of the prog_counter
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
	// next_pc output signal
	wire [0:31] n_pc;
	
	
	
	
	
	
	
	// ============================================================
	
	// Declare "reg" signals: inputs to the DUT
	// clk, rst
	reg clock,reset;
	// cur_pc
	//reg [0:31] c_pc;
	
	
	
	
	
	
	
	// ============================================================
	// Counter for loop to enumerate all the values of r
	integer count;
	
	
	
	
	
	
	
	// ============================================================
	
	// Defining constants: parameter [name_of_constant] = value;
	//parameter size_of_input = 6'd32;
	
	
	
	
	
	
	
	
	
	
	// ============================================================
	
	/**
	 * Each sequential control block, such as the initial or always
	 * block, will execute concurrently in every module at the start
	 * of the simulation
	 */
	always begin
    	/**
		 * Clock frequency is arbitrarily chosen;
		 * Period = 5ns <==> 200 MHz clock
		 */
    	#5 clock = 0;
    	#5 clock = 1;
    end	
	
	
	
	
	
	
	
	
	
	// ============================================================
	
	/**
	 * Instantiate an instance of regfile() so that
	 * inputs can be passed to the Device Under Test (DUT)
	 * Given instance name is "rg"
	 */
	prog_counter2 pc (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		// next_pc,cur_pc,rst,clk
		n_pc,reset,clock);
		
	
	
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
		//c_pc=$random;
		reset=1'b1;
		#19
		//c_pc=200;
		reset=1'b0;
		
		// Write to 8 data locations
		
		for(count=200; count<216; count=count+1)
		begin
			#10
			//c_pc=count;
			//c_pc=n_pc;
			reset=1'b0;
		end
		
		
		
		
		
		
		
		
		// end simulation
		#30
		
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
