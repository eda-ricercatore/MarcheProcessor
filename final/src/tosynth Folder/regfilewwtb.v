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



// Testbench for behavioral model for the advanced register file


// Import the modules that will be tested for in this testbench
`include "regfileww.v"

// IMPORTANT: To run this, try: ncverilog -f regfileww.f +gui
module regfilewwtb();
	// ============================================================
	/**
	 * Declare signal types for testbench to drive and monitor
	 * signals during the simulation of the advanced register file
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
	// rd1data or rd2data output signals
	wire [127:0] rd1_d,rd2_d;
	
	
	
	
	
	
	
	// ============================================================
	
	// Declare "reg" signals: inputs to the DUT
	// clk, wren,rd1en,rd2en;
	reg clock,wr_en,r1_en,r2_en;
	// wrdata
	reg [127:0] wr_d;
	// wraddr, rd1addr, rd2addr
	reg [4:0] w_addr,r1_addr,r2_addr;
	// wrbyteen
	reg [15:0] wrbytn;
	// 32 Words of 128-bits
	reg r[0:31];
	reg [127:0] r_row;
	
	
	
	
	
	
	
	// ============================================================
	// Counter for loop to enumerate all the values of r
	integer count;
	
	
	
	
	
	
	
	// ============================================================
	
	// Defining constants: parameter [name_of_constant] = value;
	parameter size_of_input = 6'd32;
	
	
	
	
	
	
	
	
	
	
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
    	#2.5 clock = 0;
    	#2.5 clock = 1;
    end	
	
	
	
	
	
	
	
	
	
	// ============================================================
	
	/**
	 * Instantiate an instance of regfile() so that
	 * inputs can be passed to the Device Under Test (DUT)
	 * Given instance name is "rg"
	 */
	regfileww rg (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		rd1_d,rd2_d,wr_d,r1_addr,r2_addr,w_addr,r1_en,r2_en,
		wr_en,wrbytn,clock);
		
	
	
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
		/**
		 * Read the input data for r from an input file named
		 * "testfile.bit"
		 */
		$readmemb("testfile.bit",r);
/*		
		for(count=0;count<=size_of_input;count=count+1)
		begin
			#10
			//$display("Next");
			r_row=r[count];
			$display("Next",r_row);
		end
*/
		
		// Write to 8 data locations
		
		#20
		wr_d=128'h787897ea12fec60cae787897eac22354;
		r1_addr=5'd10;
		r2_addr=5'd11;
		w_addr=5'd0;
		wrbytn=16'hff;
		r1_en=0;
		r2_en=0;
		wr_en=1;
		
		
		#20
		wr_d=128'h72348973465465465464645664654666;
		r1_addr=5'd10;
		r2_addr=5'd11;
		w_addr=5'd1;
		wrbytn=16'h7f;
		r1_en=0;
		r2_en=0;
		wr_en=1;
		
		
		
		#20
		wr_d=128'h48545618548486131875531264684565;
		r1_addr=5'd10;
		r2_addr=5'd11;
		w_addr=5'd2;
		wrbytn=16'h3f;
		r1_en=0;
		r2_en=0;
		wr_en=1;
		
		
		
		#20
		wr_d=128'h48646517897894613514684987984614;
		r1_addr=5'd10;
		r2_addr=5'd11;
		w_addr=5'd3;
		wrbytn=16'h1f;
		r1_en=0;
		r2_en=0;
		wr_en=1;
		
		
		
		// ===================================
		
		#20
		wr_d=128'hcaacecce09c4ae54864c6ae464ca3544;
		r1_addr=5'd10;
		r2_addr=5'd11;
		w_addr=5'd4;
		wrbytn=16'hfff;
		r1_en=0;
		r2_en=0;
		wr_en=1;
		
		
		
		#20
		wr_d=128'hceac45564c1ae151c53ae15c153ae1c4;
		r1_addr=5'd10;
		r2_addr=5'd11;
		w_addr=5'd5;
		wrbytn=16'h7ff;
		r1_en=0;
		r2_en=0;
		wr_en=1;
		
		
		
		#20
		wr_d=128'hdc46da456c1ad561c65ad1c6ad61c455;
		r1_addr=5'd10;
		r2_addr=5'd11;
		w_addr=5'd6;
		wrbytn=16'h3ff;
		r1_en=0;
		r2_en=0;
		wr_en=1;
		
		
		
		#20
		//wr_d=128'h18342cad864c65da4654cad646c5d4a564cd56ca552;
		wr_d=128'hc65da4654cad646c5d4a564cd56ca552;
		r1_addr=5'd10;
		r2_addr=5'd11;
		w_addr=5'd7;
		wrbytn=16'h1ff;
		r1_en=0;
		r2_en=0;
		wr_en=1;
		
		
		
		// Read the data from the aforementioned locations
		#20
		wr_d=128'd12345;
		r1_addr=5'd0;
		r2_addr=5'd7;
		w_addr=5'd20;
		wrbytn=16'hffff;
		r1_en=1;
		r2_en=1;
		wr_en=0;
		
		
		#20
		wr_d=128'd12345;
		r1_addr=5'd1;
		r2_addr=5'd6;
		w_addr=5'd20;
		wrbytn=16'h7fff;
		r1_en=1;
		r2_en=1;
		wr_en=0;
		
		
		#20
		wr_d=128'd12345;
		r1_addr=5'd2;
		r2_addr=5'd5;
		w_addr=5'd20;
		wrbytn=16'hff;
		r1_en=1;
		r2_en=1;
		wr_en=0;
		
		
		#20
		wr_d=128'd12345;
		r1_addr=5'd3;
		r2_addr=5'd4;
		w_addr=5'd20;
		wrbytn=16'hff;
		r1_en=1;
		r2_en=1;
		wr_en=0;
		
		
		// ====================================================
		
		#20
		wr_d=128'd12345;
		r1_addr=5'd4;
		r2_addr=5'd3;
		w_addr=5'd20;
		wrbytn=16'hff;
		r1_en=1;
		r2_en=1;
		wr_en=0;
		
		
		#20
		wr_d=128'd12345;
		r1_addr=5'd5;
		r2_addr=5'd2;
		w_addr=5'd20;
		wrbytn=16'hff;
		r1_en=1;
		r2_en=1;
		wr_en=0;
		
		
		#20
		wr_d=128'd12345;
		r1_addr=5'd6;
		r2_addr=5'd1;
		w_addr=5'd20;
		wrbytn=16'hff;
		r1_en=1;
		r2_en=1;
		wr_en=0;
		
		
		#20
		wr_d=128'd12345;
		r1_addr=5'd7;
		r2_addr=5'd0;
		w_addr=5'd20;
		wrbytn=16'hff;
		r1_en=1;
		r2_en=1;
		wr_en=0;
		
		
		
		
		
		
		
		// end simulation
		#30
		
		$display($time, " << Finishing the simulation >>");
		$finish;
	end

endmodule
