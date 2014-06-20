// zhiyang ong zhiyang.ong@gmail.com
// andrew mattheisen amattheisen@yahoo.com

`timescale 1ns/10ps

module mux128tb;
	
	// REGISTERS
	reg [0:127] ina, inb;
	reg sel;
	
	// WIRES
	wire [0:127] out;
	
	// MODULES
	mux128 mux128_1(ina, inb, out, sel);
	
	
	initial
		begin
		#10;
		ina=128'h00000000000000000000000000000000;
		inb=128'h11111111111111111111111111111111;
		sel=1'b0;
		#10;
		sel=1'b1;
		#10;
		$finish;
		end
endmodule
