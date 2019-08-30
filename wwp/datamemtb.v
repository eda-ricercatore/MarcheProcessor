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



/**
 * Testbench for the non-synthesizable behavioral model for the
 * data memory
 */


// Import the modules that will be tested for in this testbench
`include "datamem.v"
//	Include definition of the control signals
`include "control.h"

// IMPORTANT: To run this, try: ncverilog -f datamem.f +gui
module tb_datamem ();
	// ============================================================
	/**
	 * Declare signal types for testbench to drive and monitor
	 * signals during the simulation of the data memory
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
	// data_output
	wire [0:127] data_output;
	
	
	
	
	
	
	
	
	// ============================================================
	
	// Declare "reg" signals: inputs to the DUT
	// dm_ctrl_sig
	reg [0:1] data_memory_control_signal;
	// mem_ctrl_addr output signals
	reg [0:31] memory_control_address;
	// data_input
	reg [0:127] data_input;
	reg clock;
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
	always begin
    	/**
		 * Clock frequency is arbitrarily chosen;
		 * Period = 10ns <==> 100 MHz clock
		 */
    	#5 clock = 0;
    	#5 clock = 1;
    end	
	
	
	
	
	
	
	
	
	
	// ============================================================
	
	/**
	 * Instantiate an instance of instr_mem() so that
	 * inputs can be passed to the Device Under Test (DUT)
	 * Given instance name is "im"
	 */
	data_mem dm (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		// data_out,data_in,mem_ctrl_addr,clk,dm_ctrl_sig
		data_output,data_input,memory_control_address,
		clock,data_memory_control_signal);
		
	
	
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
		
		
		//data_input=$random;
		data_input=128'h71;
		memory_control_address=32'd0;
		data_memory_control_signal=`memnop;
		counter=32'd1;
		#29
		//data_input=$random;
		data_input=128'h72;
		memory_control_address=counter;
		data_memory_control_signal=`memwst;
		counter=counter+32'd1;
//		data_memory_control_signal=10;

		
		
		
		/*
		instruction_address=8'd200;
		reset=1'b0;
		*/
		
		// Try reading the instruction memory without being reset
		for(count=0;count<=size_of_input2;count=count+1)
		begin
			#10
			//data_input=$random;
			data_input=data_input+128'd1;
			memory_control_address=counter;
			data_memory_control_signal=`memwst;
//data_memory_control_signal=10;
			counter=counter+32'd1;
		end

		counter=32'd1;
		

		// Read the instruction memory after being reset
		for(count=0;count<=size_of_input2;count=count+1)
		begin
			#10
			data_input=$random;
			memory_control_address=counter;
			data_memory_control_signal=`memwld;
//data_memory_control_signal=01;
			counter=counter+32'd1;
		end
		
		
		// NOP operation - set the output to ZEROs
		#10
		data_input=$random;
		memory_control_address=counter;
		data_memory_control_signal=`memnop;
//		data_memory_control_signal=10;
//		counter=counter+32'd1;
		
		#10
		data_input=$random;
		memory_control_address=counter;
		data_memory_control_signal=`memwld;
//data_memory_control_signal=01;
		counter=counter+32'd1;
		
		// end simulation
		#30
		
		$display($time, " << Finishing the simulation >>");
		$finish;
	end
	
	// Ask Bhatti what is the size of a byte - dependent on subfield?

endmodule
