/**
 * This is written by Zhiyang Ong -student number 6004 9194 12-
 * for EE577b Homework 4, Question 4
 */

// Behavioral model for the register file
module regfile(data_out, data_in, wraddr, rdaddr, wren, clk);
	// Definitions for the constants the SIPO convertor
	// parameter PARAM_NAME = VALUE;
	/**
	 * Depth = number of rows for the register file
	 *
	 * The construct base**exponent is not synthesizable for our
	 * tool and technology library set up. It should be with the latest
	 * version of Verilog, Verilog 2005
	 */
	//parameter DEPTH = 3;			// DEPTH = 2^DEPTH_P2 = 2^3
//	parameter DEPTH = 8;			// DEPTH = 2^DEPTH_P2 = 2^3
parameter DEPTH = 8;			// DEPTH = 2^DEPTH_P2 = 2^3
	// Width of the register file
	parameter WIDTH = 8;
	
		
	
	
	
	// ===============================================================
	
	// Output signals...
	// Output of the register file
	output [WIDTH-1:0] data_out;
	
	
	
	// ===============================================================
	// Input signals
	// Input data coming in to the register file
	input [WIDTH-1:0] data_in;
	// Clock signal to facilitate state transitions  
	input clk;
	// Write enable signal to facilitate writing signals
	input wren;
	// Addresses for write and read operations
	input [DEPTH-1:0] wraddr, rdaddr;
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;



	
	// ===============================================================
	// Declare "reg" signals: 
	reg [WIDTH-1:0] data_out;		// Output signal
	reg [DEPTH-1:0] reg_file [WIDTH-1:0];
//	reg [WIDTH-1:0] reg_file [DEPTH-1:0];
	
	
	
	
	// ===============================================================
	
	always @(posedge clk)
	begin
		if(wren)
		begin
			reg_file[wraddr] <= data_in;
		end
		else
		begin
			data_out<=reg_file[rdaddr];
		end
	end
	
	
	
	
endmodule
