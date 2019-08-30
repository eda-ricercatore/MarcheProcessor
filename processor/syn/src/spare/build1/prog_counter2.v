/**
 * This is written by Zhiyang Ong
 * and Andrew Mattheisen 
 * for EE577b Troy WideWord Processor Project
 */

// Behavioral model for the 32-bit program counter
module program_counter2 (next_pc,rst,clk);

	// Output signals...
	// Incremented value of the program counter
	output [0:31] next_pc;
	
	
	
	
	// ===============================================================
	// Input signals
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
			next_pc<=next_pc+32'd4;
		end
	end
	
	
	
	
endmodule
