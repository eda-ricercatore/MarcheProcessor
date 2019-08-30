/**
 * This is written by Zhiyang Ong 
 * and Andrew Mattheisen 
 * for EE577b Troy WideWord Processor Project
 */


//	Include definition of the control signals
`include	"control.h"

// Behavioral model for the register file
module RegFileWW(rd1data,rd2data,wrdata,rd1addr,rd2addr,wraddr,
	rd1en,rd2en,wren,wrbyteen,clk);


	// Definitions for the constants the advanced register file
	// parameter PARAM_NAME = VALUE;

	
		
	
	
	
	// ===============================================================
	
	// Output signals...
	/**
	 * Output data that's read from the 2 ports of the advanced
	 * register file: data from Port 1 and Port 2
	 *
	 * Stay at high impedance state if no read operation is performed
	 */
	output [127:0] rd1data,rd2data;
	
	
	
	// ===============================================================
	// Input signals
	// Input data coming into the write port of the register file
	input [0:127] wrdata;
	// Clock signal to facilitate state transitions  
	input clk;
	// Write enable signal to facilitate writing signals; active-high
	input wren;
	// Read enable signals for two read ports; active-high
	input rd1en, rd2en;
	/**
	 * Addresses for write and read operations
	 *
	 * wraddr must have valid output data at positive edge of the
	 * clock when wren is set to logic HIGH
	 *
	 * rd?addr should contain valid value when rd?en = HIGH
	 */
	input [4:0] wraddr, rd1addr, rd2addr;
	/**
	 * Byte-write enable signals: one for each byte of the data
	 *
	 * Asserted high when each byte of the address word needs to be
	 * updated during the write operation
	 */
	input [15:0] wrbyteen;
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;
	



	
	// ===============================================================
	// Declare "reg" signals: 
	reg [127:0] rd1data,rd2data;		// Output signals
	/**
	 * (32 word) depth and (128 bits per word) width
	 */
	reg [127:0] reg_file [31:0];		// Store the data here
	
	reg [127:0] ones;					// 128-bit ones
	reg [127:0] result;					// ones & operand
	reg [7:0] operand;					// Write data to operate with
	
	
	
	// ===============================================================
	
	always @(posedge clk)
	begin
		ones=128'd0;
		ones=ones-1'd1;
	
		if(wren)
		begin
			if(wrbyteen==16'h1)
			begin
				operand=wrdata[0:7];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h3)
			begin
				operand=wrdata[8:15];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h7)
			begin
				operand=wrdata[16:23];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'hf)
			begin
				operand=wrdata[24:31];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h1f)
			begin
				operand=wrdata[32:39];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h3f)
			begin
				operand=wrdata[40:47];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h7f)
			begin
				operand=wrdata[48:55];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'hff)
			begin
				operand=wrdata[56:63];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h1ff)
			begin
				operand=wrdata[64:71];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h3ff)
			begin
				operand=wrdata[72:79];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h7ff)
			begin
				operand=wrdata[80:87];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'hfff)
			begin
				operand=wrdata[88:95];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h1fff)
			begin
				operand=wrdata[96:103];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h3fff)
			begin
				operand=wrdata[104:111];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'h7fff)
			begin
				operand=wrdata[112:119];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			else if(wrbyteen==16'hffff)
			begin
				operand=wrdata[120:127];
				result = ones & operand;
				reg_file[wraddr] <= result;
			end
			
		end
		
		if(rd1en && (rd1addr!==5'dx) && (rd1addr!==5'dz))
		begin
			rd1data<=reg_file[rd1addr];
		end
		else
		begin
			rd1data=128'dz;
		end
		
		
		
		if(rd2en && (rd2addr!==5'dx) && (rd2addr!==5'dz))
		begin
			rd2data<=reg_file[rd2addr];
		end
		else
		begin
			rd2data=128'dz;
		end
	end
	
	
	
	
endmodule
