/**
 * This is written by Zhiyang Ong
 * for EE577b Homework 4, Question 3
 */

// Behavioral model for the SIPO convertor
module SIPO(data_out, out_valid, serial_in, in_valid, reset_b, clk);
	
	// Output signals representing the end of the transaction
	// Output of the SIPO convertor
	output [7:0] data_out;
	/**
	 * Indicate if the data is valid at data_out
	 * out_valid = 1 when data is valid; it is ZERO otherwise
	 */
	output out_valid;
	
	
	
	// ===============================================================
	// Input signals
	// Input data bit coming in to the SIPO convertor
	input serial_in;
	// Clock signal to facilitate state transitions  
	input clk;
	// Active low reset signal to bring all outputs to ZERO
	input reset_b;
	/**
	 * Active high flag to enable data to be loaded at the positive
	 * edge of the clock
	 */
	input in_valid;
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;



	
	// ===============================================================
	// Declare "reg" signals: 
	reg out_valid;					// Output signal
	reg [7:0] data_out;					// Output signal
	// Outputs of the D flip-flops in the SIPO converter
	reg [7:0] q_dff;				// Output of the D flip-flops
	// Flag to indicate if the flip-flops have their outputs set
	reg flag1;						// flag of the 1st D flip-flop
	reg flag2;						// flag of the 2nd D flip-flop
	reg flag3;						// flag of the 3rd D flip-flop
	reg flag4;						// flag of the 4th D flip-flop
	reg flag5;						// flag of the 5th D flip-flop
	reg flag6;						// flag of the 6th D flip-flop
	reg flag7;						// flag of the 7th D flip-flop						
	reg flag8;						// flag of the 8th D flip-flop						
	
		
	
	
	
	// ===============================================================
	// Definitions for the states in the SIPO convertor
	// parameter PARAM_NAME = VALUE;
	
	
	
	
	
	// ===============================================================
	// Logic for active low reset signal to reset the SIPO convertor
	always @(~reset_b)
	begin
		// When "reset_b" goes low, out_valid=0
		out_valid<=1'd0;
		// Set the output of the SIPO convertor to ZERO
		data_out<=8'd0;
		
		// Set the output of the D flip-flops to ZERO
		q_dff<=8'd0;
		
		
		// Set the flags for the flip-flops to zero
		flag1<=1'd1;
		flag2<=1'd1;
		flag3<=1'd1;
		flag4<=1'd1;
		flag5<=1'd1;
		flag6<=1'd1;
		flag7<=1'd1;
		flag8<=1'd1;
	end

	
	
	
	
	
	
	
	// ===============================================================
	// 1st D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(in_valid && reset_b &&  (~out_valid))
		begin
			if(flag1==1)
			begin
$display($time,"Process input #1",serial_in);
				q_dff[0]<=serial_in;
				flag1<=1'd0;
			end
		end
	end
	
	
	
	
	
	// ===============================================================
	// 2nd D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(in_valid && reset_b && (~out_valid))
		begin
			if((flag2==1) && (flag1==0))
			begin
$display($time,"Process input #2",serial_in);
				q_dff[1]<=serial_in;
				flag2<=1'd0;
			end
		end
	end
	
	
	
	
	
	
	// ===============================================================
	// 3rd D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(in_valid && reset_b && (~out_valid))
		begin
			if((flag3==1) && (flag2==0))
			begin
$display($time,"Process input #3",serial_in);
				q_dff[2]<=serial_in;
				flag3<=1'd0;
			end
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 4th D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(in_valid && reset_b && (~out_valid))
		begin
			if((flag4==1) && (flag3==0))
			begin
$display($time,"Process input #4",serial_in);
				q_dff[3]<=serial_in;
				flag4<=1'd0;
			end
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 5th D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(in_valid && reset_b && (~out_valid))
		begin
			if((flag5==1) && (flag4==0))
			begin
$display($time,"Process input #5",serial_in);
				q_dff[4]<=serial_in;
				flag5<=1'd0;
			end
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 6th D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(in_valid && reset_b && (~out_valid))
		begin
			if((flag6==1) && (flag5==0))
			begin
$display($time,"Process input #6",serial_in);
				q_dff[5]<=serial_in;
				flag6<=1'd0;
			end
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 7th D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(in_valid && reset_b && (~out_valid))
		begin
			if((flag7==1) && (flag6==0))
			begin
$display($time,"Process input #7",serial_in);
				q_dff[6]<=serial_in;
				flag7<=1'd0;
			end
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 8th/Final/Last D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(in_valid && reset_b && (~out_valid))
		begin
			if((flag8==1) && (flag7==0))
			begin
$display($time,"Process input #8",serial_in);
				q_dff[7]<=serial_in;
				flag8<=1'd0;
				out_valid<=1'd1;
			end
		end
		else if(out_valid)
		begin
$display($time,"Produce the output and reset data",serial_in);
			data_out<=q_dff;

			flag1<=1'd1;
			flag2<=1'd1;
			flag3<=1'd1;
			flag4<=1'd1;
			flag5<=1'd1;
			flag6<=1'd1;
			flag7<=1'd1;
			flag8<=1'd1;
			
			out_valid<=1'd0;
			q_dff<=8'd0;

		end
	end
	
	
endmodule
