// This is written by Zhiyang Ong 
// and Andrew Mattheisen 
// for EE577b Troy WideWord Processor Project



module pipe3(dataOut_in, dataOut_out, wbyteen_in, wbyteen_out, 
		 regwren_in, regwren_out, rwraddrd_in, rwraddrd_out, 
		 reginmuxop_in, reginmuxop_out, aluOut_in, aluOut_out,
		 instruction_in, instruction_out, clk, reset);
	
	// INPUTS
	input [0:127] dataOut_in;
	input [0:15] wbyteen_in;
	input regwren_in;
	input [0:4] rwraddrd_in;
	input reginmuxop_in;
	input [0:127] aluOut_in;
	input [0:31] instruction_in;


	input clk, reset;
	
	// OUTPUTS
	output [0:127] dataOut_out;
	output [0:15] wbyteen_out;
	output regwren_out;
	output [0:15] rwraddrd_out;
	output reginmuxop_out;
	output [0:127] aluOut_out;
	output [0:31] instruction_out;
	
	//REGISTERS
	reg [0:127] dataOut_out;
	reg [0:15] wbyteen_out;
	reg regwren_out;
	reg [0:4] rwraddrd_out;
	reg reginmuxop_out;
	reg [0:127] aluOut_out;
	reg [0:31] instruction_out;
	
	always @ (posedge clk)
		begin
		if (reset == 1'b1)
			begin
			dataOut_out<=128'b0;
			wbyteen_out<=16'b0;
			regwren_out<=1'b0;
			rwraddrd_out<=5'b0;
			reginmuxop_out<=1'b0;
			aluOut_out<=128'b0;
			instruction_out<=32'b0;
			end
		else
			begin
			dataOut_out<=dataOut_in;
			wbyteen_out<=wbyteen_in;
			regwren_out<=regwren_in;
			rwraddrd_out<=rwraddrd_in;
			reginmuxop_out<=reginmuxop_in;
			aluOut_out<=aluOut_in;
			instruction_out<=instruction_in;
			end
		end

endmodule
