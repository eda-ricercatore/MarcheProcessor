////////////////////////////////////////////////////////////////////////////
// Filename        : instrmem.v
// Description     : Instruction Memory of Troy Wide Word Processor
// Author          : Dr. Rashed Z. Bhatti
// Created On      : Thu Nov 29 00:27:55 2007
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
///////////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps

module imem (/*autoarg*/
   // Outputs
   dataOut,
   // Inputs
   addr
   );
   input  [0:7] addr;
   output [0:31] dataOut;
   reg    [0:31] mem[0:255];

   assign 		 dataOut = mem[addr];


endmodule
