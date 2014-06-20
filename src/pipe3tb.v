// zhiyang ong zhiyang.ong@gmail.com
// andrew mattheisen amattheisen@yahoo.com

`timescale 1ns/10ps

module pipe3tb;
	
	// REGISTERS
	reg [0:127] dataOut_in;
	reg [0:15] wbyteen_in;
	reg regwren_in;
	reg [0:4] rwraddrd_in;
	reg reginmuxop_in;
	reg [0:127] aluOut_in;
	reg clk, reset;
	
	// WIRES
	wire [0:127] dataOut_out;
	wire [0:15] wbyteen_out;
	wire regwren_out;
	wire [0:4] rwraddrd_out;
	wire reginmuxop_out;
	wire [0:127] aluOut_out;
	
	// MODULES
	pipe3 pipe3_1(dataOut_in, dataOut_out, wbyteen_in, wbyteen_out, 
		 regwren_in, regwren_out, rwraddrd_in, rwraddrd_out, 
		 reginmuxop_in, reginmuxop_out, aluOut_in, aluOut_out,
		 clk, reset);
	
	always
		begin
		#5 clk=0;
		#5 clk=1;
		end // always
		
	initial
		begin
		#5;
		reset=1'b1;
		#10;
		reset=1'b0;
		#10;
		dataOut_in<=128'hF0000000000000000000000000000000;
		wbyteen_in<=16'hF000;
		regwren_in<=1'b1;
		rwraddrd_in<=5'b10000;
		reginmuxop_in<=1'b1;
		aluOut_in<=128'hF0000000000000000000000000000000;
		#10;
		$finish;
		end // initial
endmodule
