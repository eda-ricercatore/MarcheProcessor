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



/**
 * Testbench for the non-synthesizable behavioral model for the
 * instruction memory
 */


// Import the modules that will be tested for in this testbench
`include "instrmem.v"

// IMPORTANT: To run this, try: ncverilog -f instrmem.f +gui
module tb_instrmem ();
	// ============================================================
	/**
	 * Declare signal types for testbench to drive and monitor
	 * signals during the simulation of the instruction memory
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
	// instr output signals
	wire [0:31] instruction;
	
	
	
	
	
	
	
	// ============================================================
	
	// Declare "reg" signals: inputs to the DUT
	// enb;
	reg enable;
	// instr_addr
	reg [0:127] instruction_address;
	reg [0:31] counter;
	
	
	
	
	
	
	// ============================================================
	// Counter for loop to enumerate all the values of r
	integer count;
	
	
	
	
	
	
	
	// ============================================================
	
	// Defining constants: parameter [name_of_constant] = value;
	parameter size_of_input = 6'd32;
	parameter size_of_input2 = 4'd8;
	
	
	
	
	
	
	
	
	
	// ============================================================
	
	/**
	 * Each sequential control block, such as the initial or always
	 * block, will execute concurrently in every module at the start
	 * of the simulation
	 */
//	always begin
    	/**
		 * Clock frequency is arbitrarily chosen;
		 * Period = 10ns <==> 100 MHz clock
		 */
//    	#5 clock = 0;
//    	#5 clock = 1;
//    end	
	
	
	
	
	
	
	
	
	
	// ============================================================
	
	/**
	 * Instantiate an instance of instr_mem() so that
	 * inputs can be passed to the Device Under Test (DUT)
	 * Given instance name is "im"
	 */
	instr_mem im (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		instruction_address,instruction,enable);
		
	
	
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
		
		instruction_address=32'd10;
		enable=1'd0;
		counter=32'd0;
		
		#30
		instruction_address=32'd0;
		enable=1'd1;
		//counter=32'd0;
		
		
		
		#30
		instruction_address=32'd1;
		enable=1'd1;
		
		
		
		#30
		instruction_address=32'd2;
		enable=1'd1;
		
		
		#30
		instruction_address=32'd3;
		enable=1'd1;
		
		
		
		
		/*
		instruction_address=8'd200;
		reset=1'b0;
		*/
		
		// Try reading the instruction memory without being reset
		for(count=0;count<=size_of_input2;count=count+1)
		begin
			#10
			// Randomly set the instruction address to a value
			instruction_address=counter;
			// Reset the instruction memory
			enable=1'b1;
			counter=counter+3'd1;
		end

		
		// Reset the instruction memory
		#10
		instruction_address=8'd180;
		enable=1'b0;
		

		// Read the instruction memory after being reset
		for(count=0;count<=size_of_input;count=count+1)
		begin
			#10
			// Randomly set the instruction address to a value
			instruction_address=counter;
			// Reset the instruction memory
			enable=1'b1;
			counter=counter+3'd1;
		end
		
		
		// end simulation
		#30
		
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
