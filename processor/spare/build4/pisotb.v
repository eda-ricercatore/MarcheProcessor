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
 * This is written by Zhiyang Ong
 * for EE577b Homework 4, Question 2
 */

/**
 * Testbench for behavioral model for Finite State Machine model of the
 * PISO convertor
 */


// Import the modules that will be tested for in this testbench
`include "piso.v"

// IMPORTANT: To run this, try: ncverilog -f piso.f +gui
module tb_piso();
	/**
	 * Declare signal types for testbench to drive and monitor
	 * signals during the simulation of the PISO convertor
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
	// serial_out & out_valid output signals
	wire s_out,valid_op;
	
	
	
	
	
	
	
	// ============================================================
	
	// Declare "reg" signals: inputs to the DUT
	// load, clk, & reset_b
	reg load_en,clock,reset_low;
	reg [7:0] data_input;
	
	
	
	
	
	
	
	
	
	// ============================================================
	// Counter for loop to enumerate all the values of r
	//integer count;
	
	
	
	
	
	
	
	
	
	
	
	
	// ============================================================
	
	/**
	 * Each sequential control block, such as the initial or always
	 * block, will execute concurrently in every module at the start
	 * of the simulation
	 */
	always begin
    	// Clock frequency is arbitrarily chosen; Period=10ns
    	#5 clock = 0;
    	#5 clock = 1;
    end	
	
	
	
	
	
	
	
	
	
	// ============================================================
	
	/**
	 * Instantiate an instance of ee577bHw1q5model1() so that
	 * inputs can be passed to the Device Under Test (DUT)
	 * Given instance name is "xor1model"
	 */
	PISO pisoc (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		s_out,valid_op,data_input,load_en,reset_low,clock);
	
	
	
	
	
	
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
		// @ t=0; reset the sequence detector
		reset_low=1'd0;
		load_en=1'd1;
		data_input=8'd10;
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd13;
		
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd6;
		
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd5;
		
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd7;
		
		
		#40					// Ignored input data
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd3;
		
		
		#30					// Reset the data again
		reset_low=1'd0;
		load_en=1'd1;
		data_input=8'd2;
		
		
		#20
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd15;
		
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd9;
		
		
		#70					// Ignored input data
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd14;
		
		
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd12;
		
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd10;
		
		
		#90
		reset_low=1'd1;
		load_en=1'd0;
		data_input=8'd236;
		
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd174;
		
		
		#90
		reset_low=1'd1;
		load_en=1'd1;
		data_input=8'd214;
		
		#120
		
		
		
		// end simulation
		#30
		
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
