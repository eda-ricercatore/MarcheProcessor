// zhiyang ong zhiyang.ong@gmail.com
// andrew mattheisen amattheisen@yahoo.com


// This version includes:
	// HZ1 Detection and data forwarding for HZ1
	// HZ2 detection was not necessary
	// HZ3 Detection and data forwarding for HZ3

// Current bugs (...they're features, actually)
	// No none current bugs!


// this statement is for ncverilog only
`include "control.h" 
`include "alu.v"
`include "control.v"
`include "mux128.v"
`include "pipe1.v"
`include "pipe2.v"
`include "pipe3.v"
`include "prog_counter2.v"
`include "regfileww.v"
`include "hazard_detect.v"


/*
// Synthesis include statements
`include "~/ee577b/syn/src/control.h" 
`include "~/ee577b/syn/src/alu.v"
`include "~/ee577b/syn/src/control.v"
`include "~/ee577b/syn/src/mux128.v"
`include "~/ee577b/syn/src/pipe1.v"
`include "~/ee577b/syn/src/pipe2.v"
`include "~/ee577b/syn/src/pipe3.v"
`include "~/ee577b/syn/src/prog_counter2.v"
`include "~/ee577b/syn/src/regfileww.v"
`include "~/ee577b/syn/src/hazard_detect.v"
*/



//Note that the following two lines were removed because the cpu.tb file integrates datamem
//`include datamem.v
//data_mem datamem1(data_out,data_in,mem_ctrl_addr,clk,dm_ctrl_sig);

module cpu(
        clk,          
        reset,        
        instruction,  // 32 bit instruction
        pc,           // 32 bit program counter
        dataIn,       // 128 bit data from dmem
        dataOut,      // 128 bit data to dmem
        memAddr,      // 21 bit immediate address, only 8 bits are used
        memWrEn,      // dmem write enable
        memEn        // dmem enable (to avoid spurious reads)
        );
		
	//INPUTS
	input clk, reset;
	input [0:31] instruction;	// 32 bit instruction
	input [0:127] dataIn;		// 128 bit data from dmem

	//OUTPUTS
	output [0:31] pc;	// 32 bit program counter
	output [0:127] dataOut;	 // 128 bit data to dmem
	output [0:21] memAddr; // 21 bit immediate address, only 8 bits are used
	output 	memWrEn, 	// dmem write enable
			memEn;		// dmem enable (to avoid spurious reads)

	// WIRES
	wire [0:31] pc;
	wire [0:31] instruction1, instruction2, instruction3;
	wire [0:4] aluop, aluop2;
	wire [0:1] ww, ww2;
	wire [0:1] memop;
	wire [0:20] memAddr_pre, memAddr;
	wire [0:15] wbyteen, wbyteen2, wbyteen3;
	wire [0:2] regop;
	wire regwren2, regwren3;
	wire [0:4] rrdaddra, rrdaddrb;
	wire [0:4] rwraddrd, rwraddrd2, rwraddrd3;
	wire [0:127] rd1data;
	wire [0:127] rd2data, dataOut, dataIn, dataIn3;
	wire reginmuxop, reginmuxop2, reginmuxop3;
	wire aluinmuxop;
	wire [0:127] immediate, immediate2;
	wire [0:127] aluOut, aluOut3, wrdata;
	wire memEn_pre, memWrEn_pre;
	// Wires for data forwarding
	wire hz1_a_or_d, hz1_b, hz3;
	wire [0:127] rd2data_immediate, rega, hz1data;
	wire hz3_a_or_d, hz3_b;
	wire [0:127] regahz1, regbhz1;

	// -------------  Stage 1 IF  -----------------------
	// modules for sturctural verilog
	prog_counter2 programcounter(pc, reset, clk);
	// imem is integrated in the testbench
	
	pipe1 pipe1_1(instruction, instruction1, clk, reset);

	// -------------  Stage 2 ID/RF  ---------------------
	control control1(instruction1, aluop, ww, memEn_pre, memWrEn_pre, memAddr_pre, wbyteen,
		regop, rrdaddra, rrdaddrb, rwraddrd, reginmuxop, aluinmuxop, immediate);
	regfileww regfile1(rd1data,rd2data,wrdata,rrdaddra,rrdaddrb,rwraddrd3,
	regop[0],regop[1],regwren3,wbyteen3,clk);
	mux128 aluinmux(rd2data, immediate2, rd2data_immediate, aluinmuxop2);
	// HZ1 Data Forwarding Muxes
	mux128 regb_df1_mux(rd2data_immediate, hz1data, regbhz1, hz1_b);
	mux128 rega_df1_mux(rd1data, hz1data, regahz1, hz1_a_or_d);
	// HZ3 Data Forwarding Muxes
	mux128 regb_df3_mux(regbhz1, wrdata, dataOut, hz3_b);
	mux128 rega_df3_mux(regahz1, wrdata, rega, hz3_a_or_d);
	
	
	pipe2 pipe2_1(aluop, 			aluop2,
				  ww, 				ww2, 
				  memEn_pre, 		memEn, 
				  memWrEn_pre, 		memWrEn, 
				  memAddr_pre, 		memAddr,
				  wbyteen, 			wbyteen2, 
				  regop[2], 		regwren2, 
				  rwraddrd, 		rwraddrd2, 
				  reginmuxop, 		reginmuxop2,
				  aluinmuxop,		aluinmuxop2,
				  immediate,		immediate2,
				  wrdata,			hz1data,
				  instruction1, 	instruction2, 
				  clk, 
				  reset);

	// -------------  Stage 3 MEM/EX  ---------------------
	alu alu1(rega, dataOut, ww2, aluop2, aluOut);
	//datamem - seperate module, integrated by testbench

	pipe3 pipe3_1(	dataIn, 		dataIn3, 
					wbyteen2, 		wbyteen3, 
					regwren2, 		regwren3,
					rwraddrd2, 		rwraddrd3, 
					reginmuxop2, 	reginmuxop3,
					aluOut, 		aluOut3,
					instruction2, 	instruction3,
					clk,
					reset);

	// -------------  Stage 4 WB  ---------------------
	mux128 reginmux(aluOut3, 				
					dataIn,					
									wrdata, 
					reginmuxop3				);
	// WR inputs of previously instantiated regfile used 

	// -------------  Hazard Detection -----------------
	hazard_detect hazard_detect1(instruction1, instruction2, instruction3,
		 hz1_a_or_d, hz1_b, hz3_a_or_d, hz3_b);


endmodule

