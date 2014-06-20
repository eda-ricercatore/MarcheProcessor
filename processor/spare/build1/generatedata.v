/**
 * This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
 * and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
 */

`timescale 1ns/100ps
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
 * Testbench for creating a string of random numbers and storing
 * them into a file named "testfile.bit"
 */


// IMPORTANT: To run this, try: ncverilog -f ee577bHw2q2.f +gui
module tb_acs();
	// Declare integers
	// Counter for the FOR loop enumeration
	integer count;
	// Multichannel descriptor for associated file that is opened
	integer md_fopen;
	// Randomly generated input data bit for the transmitter
	reg [0:24] data;
	
	
	// Declare constants
	// Maximum number of data bits in the stream
	parameter max_amt_of_data = 9'd255;
	

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
		$display(" << Starting the simulation >>");

		/**
		 * $display automatically adds a newline character to
		 * the end of its output, whereas the $write task does not.
		 *
		 * Any null parameter produces a single space character
		 * in the display. (A null parameter is characterized by
		 * two adjacent commas in the parameter list.)
		 *
		 *
		 */
		
		
		// Open a file channel descriptor for writing
		md_fopen=$fopen("rf.fill");
		/**
		 * Assert that the file can be opened for read/write
		 * operations; else, end the simulation/execution
		 */
		if (md_fopen == 0) $finish;
		
		
		// Write a stream of 256 bits to the output file
		for(count=0; count<max_amt_of_data; count=count+1)
		begin
			/**
			 * Assign the input data bit to a randomly
			 * generated number
			 */
			data = $random;
			//$fwrite(md_fopen,data);
			$fdisplay(md_fopen,data);
		end
		
		/**
		 * Assign the last input data bit to a randomly
		 * generated number
		 */
		data = $random;
		$fdisplay(md_fopen,data);
		
		// Close a file channel descriptor for writing
		$fclose(md_fopen);
		
		
		#20;
		
		$display(" << Finishing the simulation >>");
		$finish;
	end

endmodule
