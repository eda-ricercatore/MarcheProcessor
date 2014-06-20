// zhiyang ong zhiyang.ong@gmail.com
// andrew mattheisen amattheisen@yahoo.com

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

`include control.h

`include mux.v
`include alu.v
`include reg

module cpu(Clk, 
        	Reset, 
        	Instruction,    // 32 bit instruction
        	ProgramCounter, // 32 bit program counter
        	DataIn,         // 128 bit data from dmem
        	DataOut,        // 128 bit data to dmem
        	MemAddr,        // 21 bit immediate address, only 8 bits are used
        	MemWrEn,        // dmem write enable
        	MemEn           // dmeme enable (to avoid spurious reads)
        );
	//INPUTS
	input Clk, Reset;
	input [0:31] Instruction,    // 32 bit instruction
				 ProgramCounter; // 32 bit program counter
	input [0:127] DataIn;         // 128 bit data from dmem

	//OUTPUTS
	output 


	reg 

	DataOut,        // 128 bit data to dmem
	MemAddr,        // 21 bit immediate address, only 8 bits are used
	MemWrEn,        // dmem write enable
	MemEn           // dmeme enable (to avoid spurious reads)
