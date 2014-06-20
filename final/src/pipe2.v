// Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
//  Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
// EE577b Troy WideWord Processor Project


// make module match terms in module defn'
module pipe2(aluop_in,			aluop_out,
			 ww_in, 			ww_out, 
			 memEn_in, 			memEn_out, 
			 memWrEn_in, 		memWrEn_out, 
			 memAddr_in, 		memAddr_out,
			 wbyteen_in, 		wbyteen_out, 
			 regwren_in, 		regwren_out, 
			 rwraddrd_in, 		rwraddrd_out, 
			 reginmuxop_in, 	reginmuxop_out,
			 aluinmuxop_in,		aluinmuxop_out,
			 immediate_in,		immediate_out,
			 wrdata,			hz1data,
			 instruction_in, 	instruction_out, 
			 clk, 
			 reset);

	// INPUTS
	input [0:4] aluop_in;
	input [0:1] ww_in;
	input memEn_in, memWrEn_in;
	input [0:20] memAddr_in;
	input [0:15] wbyteen_in;
	input regwren_in;
	input [0:4] rwraddrd_in;
	input reginmuxop_in;
	input aluinmuxop_in;
	input [0:127] immediate_in;
	input [0:127] wrdata;
	input [0:31] instruction_in;
	input clk, reset;
	
	// OUTPUTS
	output [0:4] aluop_out;
	output [0:1] ww_out;
	output memWrEn_out;
	output memEn_out;
	output [0:20] memAddr_out;
	output [0:15] wbyteen_out;
	output regwren_out;
	output [0:4] rwraddrd_out;
	output reginmuxop_out;
	output aluinmuxop_out;
	output [0:127] immediate_out;
	output [0:127] hz1data;
	output [0:31] instruction_out;	
	
	//REGISTERS
	reg [0:4] aluop_out;
	reg [0:2] ppp_out;
	reg [0:1] ww_out;
	reg memWrEn_out;
	reg memEn_out;
	reg [0:20] memAddr_out;
	reg [0:15] wbyteen_out;
	reg regwren_out;
	reg [0:4] rwraddrd_out;
	reg reginmuxop_out;
	reg aluinmuxop_out;
	reg [0:127]immediate_out;
	reg [0:127] hz1data;
	reg [0:31] instruction_out;	
	
	always @ (posedge clk)
		begin
		if (reset == 1'b1)
			begin
			aluop_out<=5'b0;
			ww_out<=2'b0;
			memWrEn_out<=1'b0;
			memEn_out<=1'b0;
			memAddr_out<=21'b0;
			wbyteen_out<=16'b0;
			regwren_out<=1'b0;
			rwraddrd_out<=5'b0;
			reginmuxop_out<=1'b0;
			aluinmuxop_out<=1'b0;
			immediate_out<=128'b0;
			hz1data<=128'b0;
			instruction_out<=32'b0;
			end
		else
			begin
			aluop_out<=aluop_in;
			ww_out<=ww_in;
			memWrEn_out<=memWrEn_in;
			memEn_out<=memEn_in;
			memAddr_out<=memAddr_in;
			wbyteen_out<=wbyteen_in;
			regwren_out<=regwren_in;
			rwraddrd_out<=rwraddrd_in;
			reginmuxop_out<=reginmuxop_in;
			aluinmuxop_out<=aluinmuxop_in;
			immediate_out<=immediate_in;
			hz1data<=wrdata;
			instruction_out<=instruction_in;
			end
		end // always @ (posedge clk);

endmodule
