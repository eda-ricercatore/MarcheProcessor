// zhiyang ong 
// andrew mattheisen

`timescale 1ns/10ps

module pipe1tb;
	
	// REGISTERS
	reg [0:31] instruction_in;
	reg clk, reset;
	
	// WIRES
	wire [0:31] instruction_out;
	
	// MODULES
	pipe1 pipe1_1(instruction_in, instruction_out, clk, reset);
	
	always
		begin
		#5 clk=0;
		#5 clk=1;
		end // always
		
	initial
		begin
		#5;
		instruction_in=32'h00000000; reset=1'b1;
		#10;
		instruction_in=32'h00000000; reset=1'b0;
		#10;
		instruction_in=32'h00000001;
		#10;
		instruction_in=32'h00000002;
		#10;
		$finish;
		end // initial
endmodule
