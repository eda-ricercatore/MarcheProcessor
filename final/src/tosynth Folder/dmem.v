//////////////////////////////////////////////////////////////////
// Filename        : dmem.v
// Description     : Data Memory of Troy Wide Word Processor
// Author          : Dr. Rashed Z. Bhatti
// Created On      : Thu Nov 29 01:59:54 2007
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
//////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

module dmem (
			 clk,
			 memAddr,
			 dataIn,
			 wrEn,
			 memEn,
			 dataOut
			 );

   input 	   clk;
   input 	   wrEn;
   input 	   memEn;
   input [0:7] memAddr;
   input [0:127] dataIn;
   output [0:127] dataOut;

   reg [0:127] 	  mem[0:255];
   reg 			  r_memEn;
   reg [0:7]  	  r_memAddr;

   // Input Registers
   always @ (posedge clk)
	 begin
		r_memEn   <= memEn;
		r_memAddr <= #1 memAddr;
	 end

   assign dataOut = r_memEn ? mem[r_memAddr] : 0;

   // Write Operation
   always@(posedge clk)
	 begin
		if(memEn & wrEn)
		  mem[memAddr] <= #1 dataIn;
	 end

endmodule
