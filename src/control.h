// This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
// and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
// for EE577b Troy WideWord Processor Project


// alu 5 bit command
`define aluwadd  5'b00000
`define aluwsub  5'b00001
`define aluwnot  5'b01000
`define aluwand  5'b01001
`define aluwor   5'b01010
`define aluwxor  5'b01011
`define aluwprm  5'b01100
`define aluwsll  5'b10000
`define aluwslli  5'b10001
`define aluwsrl  5'b10100
`define aluwsrli  5'b10101
`define aluwsra  5'b10110
`define aluwsrai  5'b10111
`define alunop   5'b11000
// TROY Part 2 - multiplication commands
`define aluwmules 5'b00100 
`define aluwmuleu 5'b00101
`define aluwmulos 5'b00110
`define aluwmulou 5'b00111




// decodes for ppp
`define aa 3'b000
`define uu 3'b010
`define dd 3'b011
`define ee 3'b100
`define oo 3'b101
`define mm 3'b110
`define ll 3'b111

// decodes for ww
`define w8 2'b00
`define w16 2'b01
`define w32 2'b10

// data mem - 2 bits
`define memnop 2'b00
`define memwld 2'b01
`define memwst 2'b10


// reg file - 16 bits for wbyteen passed seperately
`define regnop 3'b000

    // wst
`define rd2wr0 3'b010
    // wld
`define rd0wr1 3'b001
    // wmv, wnot, wslli, wsrai, and wsrli
`define rd1wr1 3'b101
    // used for all other instructions
`define rd2wr1 3'b111

 
// Instruction Mem needs 1 bit
`define haz 1'b0
`define nohaz 1'b1

