/**
 * This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
 * and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
 * for EE577b Troy WideWord Processor Project
 */

/**
 * Reference:
 * Nestoras Tzartzanis, EE 577B Verilog Example, Jan 25, 1996
 * http://www-scf.usc.edu/~ee577/tutorial/verilog/counter.v
 */

// Behavioral model for the 32-bit program counter
module program_counter (next_pc,cur_pc,rst,clk);

	// Output signals...
	// Incremented value of the program counter
	output [0:31] next_pc;
	
	
	
	
	// ===============================================================
	// Input signals
	// Current value of the program counter
	input [0:31] cur_pc;
	// Clock signal for the program counter
	input clk;
	// Reset signal for the program counter
	input rst;
	/**
	 * May also include: branch_offset[n:0], is_branch
	 * Size of branch offset is specified in the Instruction Set
	 * Architecture
	 */
	
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;
	



	
	// ===============================================================
	// Declare "reg" signals: 
	reg [0:31] next_pc;		// Output signals

	
	
	
	// ===============================================================
	
	always @(posedge clk)
	begin
		// If the reset signal sis set to HIGH
		if(rst)
		begin
			// Set its value to ZERO
			next_pc<=32'd0;
		end
		else
		begin
			next_pc<=cur_pc+32'd4;
		end
	end
	
	
	
	
endmodule
