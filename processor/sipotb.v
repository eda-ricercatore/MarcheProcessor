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
 * for EE577b Homework 4, Question 3
 */

// Testbench for behavioral model for the SIPO convertor


// Import the modules that will be tested for in this testbench
`include "sipo.v"

// IMPORTANT: To run this, try: ncverilog -f sipo.f +gui
module tb_sipo();
	/**
	 * Declare signal types for testbench to drive and monitor
	 * signals during the simulation of the SIPO convertor
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
	// data_out & out_valid output signals
	wire [7:0] d_out;
	wire valid_op;
	
	
	
	
	
	
	
	// ============================================================
	
	// Declare "reg" signals: inputs to the DUT
	// in_valid, clk, reset_b, & serial_in
	reg ip_valid,clock,reset_low,serial_ip;
	
	
	
	
	
	
	
	
	
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
	 * Instantiate an instance of SIPO() so that
	 * inputs can be passed to the Device Under Test (DUT)
	 * Given instance name is "xor1model"
	 */
	SIPO sipo_c (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		d_out,valid_op,serial_ip,ip_valid,reset_low,clock);
	
	
	
	
	
	
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
		reset_low=1'd0;						// Reset
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		#9
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd1;
		
		
		#10						// Reset
		reset_low=1'd0;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
#8
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd0;
		
		
		#10
		reset_low=1'd1;
		ip_valid=1'd0;
		serial_ip=1'd1;
		
		// New sequence...
		#10
		reset_low=1'd1;
		ip_valid=1'd1;
		serial_ip=1'd1;
		
		
		
		
		
		
		
		// end simulation
		#30
		
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
