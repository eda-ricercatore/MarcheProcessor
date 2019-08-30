// zhiyang ong 
// andrew mattheisen

module mux(ina, inb, out, sel);
    //INPUTS
	input [0:127] ina, inb;
	input sel;
	
	// OUTPUTS
	output [0:127] out;
	
	// REGISTERS
	reg [0:127] out;
	
	always @ (ina or inb or sel)
		begin
		out<= sel ? ina : inb;
		end // always @ (ina or inb or sel)
endmodule
