// This is written by Zhiyang Ong
// and Andrew Mattheisen 
// for EE577b Troy WideWord Processor Project



module pipe1(instruction_in, instruction_out, clk, reset);
	
	// INPUTS
	input [0:31] instruction_in;
	input clk, reset;
	
	// OUTPUTS
	output [0:31] instruction_out;
	
	//REGISTERS
	reg [0:31] instruction_out;
	
	always @ (posedge clk)
		begin
		if (reset == 1'b1)
			begin
			instruction_out [0:31] <= 32'b0;
			end
		else
			begin
			instruction_out [0:31] <= instruction_in [0:31];
			end
		end
endmodule
