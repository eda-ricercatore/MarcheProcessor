// zhiyang ong zhiyang.ong@gmail.com
// andrew mattheisen amattheisen@yahoo.com

`timescale 1ns/10ps

module pipe2tb;
	
	// REGISTERS
	reg [0:4] aluop_in;
	reg [0:2] ppp_in; 
	reg [0:1] ww_in;
	reg [0:1] memop_in;
	reg [0:20] memAddr_in;
	reg [0:15] wbyteen_in;
	reg regwren_in;
	reg [0:4] rwraddrd_in;
	reg reginmuxop_in;
	reg [0:127] rd1data_in;
	reg [0:127] rd2data_in;
	reg clk, reset;
	
	// WIRES
	wire [0:4] aluop_out;
	wire [0:2] ppp_out;
	wire [0:1] ww_out;
	wire memWrEn_out;
	wire memEn_out;
	wire [0:20] memAddr_out;
	wire [0:15] wbyteen_out;
	wire regwren_out;
	wire [0:4] rwraddrd_out;
	wire reginmuxop_out;
	wire [0:127] rd1data_out;
	wire [0:127] rd2data_out;
	
	// MODULES
	pipe2 pipe2_1(aluop_in, aluop_out, ppp_in, ppp_out, ww_in, ww_out, 
		 memop_in, memWrEn_out, memEn_out, memAddr_in, memAddr_out,
		 wbyteen_in, wbyteen_out, regwren_in, regwren_out, rwraddrd_in,
		 rwraddrd_out, reginmuxop_in, reginmuxop_out,
		 rd1data_in, rd1data_out, rd2data_in, rd2data_out, clk, reset);
	
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
			aluop_in<=5'b1;
			ppp_in<=3'b1; 
			ww_in<=2'b1;
			memop_in<=2'b11;
			memAddr_in<=21'b1;
			wbyteen_in<=16'b1;
			regwren_in<=1'b1;
			rwraddrd_in<=5'b1;
			reginmuxop_in<=1'b1;
			rd1data_in<=128'b1;
			rd2data_in<=128'b1;
		#10;
		$finish;
		end // initial
endmodule
