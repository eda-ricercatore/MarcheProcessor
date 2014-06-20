/**
 * This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
 * and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
 * for EE577b Troy WideWord Processor Project
 */

// IMPORTANT: This requires an input text file named "rf1.fill"

// Non-synthesizable behavioral RTL model for the instruction memory
module instr_mem (instr_addr,instr,enb);
// load instr - take data out
// store - put data into the memory

	// ===============================================================
	
	// Output signals...
	// Instruction obtained/addressed from instr_addr
	output [0:31] instr;
	
	
	
	// ===============================================================
	// Input signals
	// Address where the instruction is located
	input [0:31] instr_addr;
	/**
	 * Enable signal to indicate that the instruction memory shall be
	 * from an input text file named "rf1.fill"
	 */
	input enb;
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;
	
	
	
	
	// ===============================================================
	// Definitions for the constants the instruction memory
	// parameter PARAM_NAME = VALUE;



	
	// ===============================================================
	// Declare "reg" signals: 
	reg [0:31] instr;					// Output signals
	/**
	 * (256 word) depth and (31 bits per word) width
	 */
	reg [0:31] instr_mem [0:255];		// Store the data here
	// Store instruction address in the instruction memory
	reg [0:7] temp_instr_addr;
	
	
	
	// ===============================================================
	
	initial
	begin
		/**
		 * Read the input data for r from an input file named
		 * "rf1.fill"'
		 *
		 * The system task to read data from the file must be placed
		 * in an INITIAL block
		 */
		$readmemh("rf1.fill",instr_mem);
	end
	
	
	// A change in the instruction address activates this...
	always @(instr_addr or enb)
	begin
		// If the instruction memory is enabled
		if(enb)
		begin
			// Read the next instruction from the instruction memory
			//temp_instr_addr<=instr_addr+3'd4;
			//---------------------instr<=instr_mem[temp_instr_addr];
			//temp_instr_addr<=temp_instr_addr>>2;
			instr<=instr_mem[instr_addr];
			//---------------------instr<=instr_mem[8'd5];
		end
	end
	
	
endmodule
