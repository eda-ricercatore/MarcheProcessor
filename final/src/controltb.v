// zhiyang ong zhiyang.ong@gmail.com
// andrew mattheisen amattheisen@gmeil.com

`timescale 1ns/10ps
`include "control.h"


module controltb;

    reg [0:31] instr; 
    reg clk;
    wire [0:4] aluop, rrdaddra, rrdaddrb, rwraddrd;
    wire [0:2] ppp, regop, memop;
    wire [0:1] ww;
    wire [0:20] maddr;
    wire reginmuxop, aluinmuxop;
    wire [0:15] wbyteen;
    wire [0:31] immediate;

    control control1(instr, 
        aluop, ppp, ww, 
        memop, maddr, wbyteen,
        regop, rrdaddra, rrdaddrb, rwraddrd,
        reginmuxop, 
        aluinmuxop,
        immediate);


    always
        begin
        #5 clk=0;
        #5 clk=1;
        end // always

    initial
        begin
        #5;
        //wadd
        instr=32'b00010001101010100101100000000000; // ADD
        #10;
        instr=32'b00010001101010100101101001000000; // ADD
        #10;
        instr=32'b00010001101010100101110000000000; // ADD
        #10;
        instr=32'b00010001101010100101110001000000; // ADD
        #10;    
        instr=32'b00010001101010100101110010000000; // ADD
        #10; 
        instr=32'b00010001101010100101110010001001; // AND
        #10;
        instr=32'b00000101101000000000000000000001; // LD
        #10;
        instr=32'b00100001101010100000010010001001; // VMV
        #10;
        instr=32'b00010001101010100000010100001000; // NOT
        #10;        
        instr=32'b00010001101010100101110101001010; // OR
        #10;
        instr=32'b00010001101010100101110100001100; // PRM
        #10;
        instr=32'b00010001101010100101110101010000; // SLL
        #10;
        instr=32'b00010001101010100111110110010001; // SLLI
        #10;
        instr=32'b00010001101010100101110110010110; // SRA
        #10;
        instr=32'b00010001101010100111110110010111; // SRAI
        #10;
        instr=32'b00010001101010100101110110010100; // SRL
        #10;
        instr=32'b00010001101010100111110110010101; // SRLI
        #10;
        instr=32'b00001001101000000000000000000001; // ST
        #10;
        instr=32'b00010001101010100101111001000001; // SUB
        #10;
        instr=32'b00010001101010100101111101001011; // XOR
        #10;
        instr=32'b00000001101010100101110110001011; // NOP
        #10;
        
        
        $finish;
        end // intial
     
    initial
        begin
	$shm_open("tb.shm");
	$shm_probe("AC");	
        end

endmodule


