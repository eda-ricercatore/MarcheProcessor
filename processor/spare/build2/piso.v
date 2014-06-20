/**
 * This is written by Zhiyang Ong -student number 6004 9194 12-
 * for EE577b Homework 4, Question 2
 */

// Behavioral model for the PISO convertor
module PISO(serial_out, out_valid, data_in, load, reset_b, clk);
	/**
	 * Take input in when load and reset_b are HIGH, and out_valid
	 * is LOW, at the positive edge of the clock.
	 *
	 * Subsequently, output the values, and set out_valid to HIGH
	 * Ignore all inputs when out_valid is HIGH; and clock all the
	 * data out
	 * 
	 * Reset is active LOW
	 *
	 * Ignore otherwise
	 */
	
	// Output signals representing the end of the transaction
	// Output of the PISO convertor
	output serial_out;
	/**
	 * Indicate if the data is valid at serial_out
	 * out_valid = 1 when data is valid; it is ZERO otherwise
	 */
	output out_valid;
	
	
	
	// ===============================================================
	// Input signals
	// Input data bit sequence coming in to the PISO convertor
	input [7:0] data_in;
	/**
	 * Clock signal for the finite state machine to facilitate
	 * state transitions  
	 */
	input clk;
	/**
	 * Active low reset signal for the finite state machine to
	 * bring it to the initial state
	 */
	input reset_b;
	/**
	 * Active high flag to enable data to be loaded at the positive
	 * edge of the clock
	 */
	input load;
	
	
	
	
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;



	
	// ===============================================================
	// Declare "reg" signals: 
	reg out_valid;					// Output signal
	reg serial_out;					// Output signal
	// Outputs of the D flip-flops in the PISO converter
	reg q_dff1;						// Output of the 1st D flip-flop
	reg q_dff2;						// Output of the 2nd D flip-flop
	reg q_dff3;						// Output of the 3rd D flip-flop
	reg q_dff4;						// Output of the 4th D flip-flop
	reg q_dff5;						// Output of the 5th D flip-flop
	reg q_dff6;						// Output of the 6th D flip-flop
	reg q_dff7;						// Output of the 7th D flip-flop
	// Output of the 8th D flip-flop = out_valid
	/**
	 * Flag to indicate if input shall be used as input to the
	 * flip-flops; set flag=0 to use output of previous flip-flop
	 */
	//reg flag1;						// flag of the 1st D flip-flop
	reg flag2;						// flag of the 2nd D flip-flop
	reg flag3;						// flag of the 3rd D flip-flop
	reg flag4;						// flag of the 4th D flip-flop
	reg flag5;						// flag of the 5th D flip-flop
	reg flag6;						// flag of the 6th D flip-flop
	reg flag7;						// flag of the 7th D flip-flop						
	//reg flag8;						// flag of the 8th D flip-flop						
	
		
	
	
	
	// ===============================================================
	// Definitions for the states in the PISO convertor
	// parameter PARAM_NAME = VALUE;
	
	
	
	
	
	// ===============================================================
	// Logic for active low reset signal to reset the PISO convertor
	always @(~reset_b)
	begin
		// When "reset_b" goes low, out_valid=0
		out_valid<=1'd0;
		// Set the output of the 1st D flip-flop to ZERO
		q_dff1<=1'd0;
		// Set the output of the 2nd D flip-flop to ZERO
		q_dff2<=1'd0;
		// Set the output of the 3rd D flip-flop to ZERO
		q_dff3<=1'd0;
		// Set the output of the 4th D flip-flop to ZERO
		q_dff4<=1'd0;
		// Set the output of the 5th D flip-flop to ZERO
		q_dff5<=1'd0;
		// Set the output of the 6th D flip-flop to ZERO
		q_dff6<=1'd0;
		// Set the output of the 7th D flip-flop to ZERO
		q_dff7<=1'd0;
		// Set the output of the 8th D flip-flop to ZERO
		serial_out<=1'd0;
		
		
		flag2<=1'd1;
		flag3<=1'd1;
		flag4<=1'd1;
		flag5<=1'd1;
		flag6<=1'd1;
		flag7<=1'd1;
	end

	
	
	
	
	
	
	
	// ===============================================================
	// 1st D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(load && reset_b && (~out_valid))
		begin
			// Process input data - get the MSB
			q_dff1<=data_in[7];	
		end
		else
		begin
			/**
			 * Send in unknown value to indicate that data_in[7]
			 * has been processed
			 */
			q_dff1<=1'dx;
		end
	end
	
	
	
	
	
	// ===============================================================
	// 2nd D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(load && reset_b && (~out_valid))
		begin
			// Process input data
			q_dff2<=data_in[6];
		end
		else if(out_valid)
		begin
			$display($time, ">>>>>>> Bring in value from prev dff1");
			q_dff2<=q_dff1;
		end
	end
	
	
	
	
	
	
	// ===============================================================
	// 3rd D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(load && reset_b && (~out_valid))
		begin
			// Process input data
			q_dff3<=data_in[5];
		end
		else if(out_valid)
		begin
			$display($time, ">>>>>>> Bring in value from prev dff2");
			q_dff3<=q_dff2;
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 4th D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(load && reset_b && (~out_valid))
		begin
			// Process input data
			q_dff4<=data_in[4];
		end
		else if(out_valid)
		begin
			$display($time, ">>>>>>> Bring in value from prev dff3");
			q_dff4<=q_dff3;
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 5th D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(load && reset_b && (~out_valid))
		begin
			// Process input data
			q_dff5<=data_in[3];
		end
		else if(out_valid)
		begin
			$display($time, ">>>>>>> Bring in value from prev dff4");
			q_dff5<=q_dff4;
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 6th D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(load && reset_b && (~out_valid))
		begin
			// Process input data
			q_dff6<=data_in[2];
		end
		else if(out_valid)
		begin
			$display($time, ">>>>>>> Bring in value from prev dff5");
			q_dff6<=q_dff5;
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 7th D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(load && reset_b && (~out_valid))
		begin
			// Process input data
			q_dff7<=data_in[1];
		end
		else if(out_valid)
		begin
			$display($time, ">>>>>>> Bring in value from prev dff6");
			$display("q_dff6:::",q_dff6);
			q_dff7<=q_dff6;
			$display("q_dff7:::",q_dff7);
		end
	end
	
	
	
	
	
	
	
	
	// ===============================================================
	// 8th/Final/Last D flip-flop
	always @(posedge clk)
	begin
		// If the load enable flag and reset_b are high,
		if(load && reset_b && (~out_valid))
		begin
			serial_out<=data_in[0];
			// Set "out_valid"=1
			out_valid<=1'd1;
		end
		else if((out_valid==1) && (q_dff7!==1'dz) && (q_dff7!==1'dx))
		begin
$display($time, ">>>>>>> Bring in value from prev dff7");
if((q_dff7==1'dz) || (q_dff7==1'dx))
begin
	serial_out<=1'd0;
end
else
begin
	serial_out<=q_dff7;
end
		end
		else
		begin
$display($time, "########### REady for new input");
			// Set "out_valid"=0
			out_valid<=1'd0;
			serial_out<=1'd0;
			// Set flags to HIGH
/*
			flag2<=1'd1;
			flag3<=1'd1;
			flag4<=1'd1;
			flag5<=1'd1;
			flag6<=1'd1;
			flag7<=1'd1;
*/
		end
	end
	
	
endmodule
