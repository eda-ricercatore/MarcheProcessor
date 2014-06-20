/**
 * This is written by Zhiyang Ong -student number 6004 9194 12-
 * for EE577b Homework 4, Question 5
 */


//`include "regfile.v"
// Behavioral model for the FIFO queue
module FIFO(data_out, empty, full, data_in, push, pop, reset, clk);
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
	//parameter DEPTH = 8;			// DEPTH = 2^DEPTH_P2 = 2^3
	parameter DEPTH = 8;			// DEPTH = 2^DEPTH_P2 = 2^3
	// Width of the register file
	parameter WIDTH = 8;
	
		
	
	
	
	
	// Output signals representing the end of the transaction
	// Output of the FIFO queue
	output [WIDTH-1:0] data_out;
	// Indicate if circular FIFO is empty when HIGH
	output empty;
	// Indicate if circular FIFO is full when HIGH
	output full;
	
	
	
	// ===============================================================
	// Input signals
	// Input data coming in to the register file
	input [WIDTH-1:0] data_in;
	// Flag to indicate if data is to be added to the circular FIFO
	input push;
	// Flag to indicate if data is to be removed from the circular FIFO
	input pop;
	// Flag to indicate if the circular FIFO should be emptied
	input reset;
	// Clock signal for the circular FIFO
	input clk;
	
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;



	
	// ===============================================================
	// Declare "reg" signals: 
	reg [WIDTH-1:0] data_out;		// Output signals
	reg empty,full;					// Output signal
	// Addresses for write and read operations
	reg [DEPTH-1:0] wraddr, rdaddr;
	// Read pointer
	//reg rd_ptr;
	// Write pointer
	//reg wr_ptr;
	// Storage locations
	reg [DEPTH-1:0] reg_file [WIDTH-1:0];
	reg [DEPTH-1:0] num_elems;
		
	
	
	
	// ===============================================================
	// Definitions for the states in the FIFO queue
	// parameter PARAM_NAME = VALUE;
	
	
	
	
	
	
	// ===============================================================
	/**
	 * Instantiate an instance of regfile() so that
	 * inputs can be passed to the Device Under Test (DUT)
	 * Given instance name is "rg"
	 */
/*
	regfile rg (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		data_out,data_in,wraddr,rdaddr,push,clk);
*/	
	
	
	
	
	
	
	// ===============================================================
	// When the signal is reset
	always @(reset)
	begin
		data_out=8'd0;
		empty=1'd0;
		full=1'd0;
		
		wraddr=8'd0;
		rdaddr=8'd0;
		num_elems=8'd0;
	end
	
	
	
	
	
	
	
	
	
	// ===============================================================
	always @(posedge clk)
	begin
		// If push and pop are HIGH, perform no operations
	
		if(push && (~full) && (~pop))
		begin
			reg_file[wraddr] = data_in;
			wraddr=(wraddr+1)%DEPTH;
			num_elems=num_elems+1;
			
			if(empty)
			begin
				empty=1'd0;
			end

			// Is the circular FIFO full?
			//if(wraddr==(rdaddr-1))
			if((wraddr==rdaddr) &&(~empty) && (num_elems==DEPTH))
			begin
				// Yes...
				full=1'd1;
			end
			else
			begin
				// NO...
				full=1'd0;
			end
		end
		else if(pop && (~empty) && (~push))
		begin
			data_out=reg_file[rdaddr];
			rdaddr=(rdaddr+1)%DEPTH;
			num_elems=num_elems-1;
			
			if(full)
			begin
				full=1'd0;
			end
			
			// Is the circular FIFO empty?
			if(wraddr==rdaddr)
			begin
				// Yes...
				empty=1'd1;
			end
			else
			begin
				// NO...
				empty=1'd0;
			end
		end
/*
		else if(full)
		begin
			if((wraddr!=rdaddr) || (num_elems!=DEPTH) || (empty))
			begin
				// Yes...
				full=1'd0;
			end
		end
		else if(empty)
		begin
			if(wraddr!=rdaddr)
			begin
				// NO...
				empty=1'd0;
			end
		end
		else if(wraddr!=rdaddr)
		begin
			empty=1'd0;
			full=1'd0;
		end
*/
	end
	
	
endmodule
