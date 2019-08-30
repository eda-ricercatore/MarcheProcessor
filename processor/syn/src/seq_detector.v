/**
 * This is written by Zhiyang Ong
 * for EE577b Homework 4, Question 1
 */

// Behavioral model for Finite State Machine model of the sequence detector
module seq_detect (in,clk,rst,match,err);
	
	// Output signals representing the end of the transaction
	// Indicate if the sequence is detected when set to logic high
	output match;
	// Indicate if the sequence is not detected when set to logic high
	output err;
	
	
	
	
	// Input signals
	// Input data bit of the sequence
	input in;
	/**
	 * Clock signal for the finite state machine to facilitate
	 * state transitions  
	 */
	input clk;
	/**
	 * Reset signal for the finite state machine to bring it to
	 * the initial state, Sone
	 */
	input rst;
	
	
	
	
	// Declare "wire" signals:
	//wire FSM_OUTPUT;



	
	// Declare "reg" signals: 
	reg match;					// Output signal
	reg err;
	/**
	 * state: current state of the FSM
	 * nextstate: next state of the FSM
	 */
	reg [1:0] state, nextstate;
	/**
	 * num_bits for the number of bits in this sequence of 8-bits that
	 * have been processed
	 */
	reg [3:0] num_bits;
	// Number of logic HIGH bits that have been processed
	reg [2:0] num_high;
	// Indicate if the previous sequence has been found
	reg prev_find;
	
	
	
	
	// Definitions for the states in the sequence detector
	// State of the FSM where previous input = 1
	parameter Szero = 2'b00;
	// State of the FSM where previous input = 0
	parameter Sone = 2'b01;
	/**
	 * State of the FSM where the sequence is found to be a match
	 * or mismatch; this is also used as a initial state for the FSM
	 */
	parameter Sfound = 2'b10;
	// State of the FSM where input is erroneous; input != (1 or 0)
	parameter Serr = 2'b11;				// Error state
	// Number of bits that shall be processed
	parameter total_bits = 4'd8;
	// Number of logic HIGH bits that shall be processed
	parameter total_high = 3'd5;
	
	
	
	
	
	
	// State Memory
	always @(posedge clk)
	begin
		// Synchronous reset
		if (rst)
		begin
			num_high=1'd0;
			num_bits=1'd0;
			
			// Go to the initial/error state
			state <= Serr;
		end
		else
		begin
			// Move/Proceed to the next state
			state <= nextstate;
			num_bits=num_bits+1'd1;
			
			
			if (in==1'b1)
			begin
				num_high=num_high+1;
			end
		end
	end
	
	
	
	
	
	/**
	 * Next State Logic
	 */
	always @(in or state or nextstate)
	begin
		case (state)
			Sone:
				begin
					if((num_bits==4'd2)||(num_bits==4'd3)||(num_bits==4'd6))
					begin
$display($time, ">>>>>>>>>>state",state,"num_bits",num_bits);
//						num_bits=1'd0;
//						num_high=1'd0;
					end
				
					if((in == 1'bz) || (in == 1'bx))
					begin
						/**
						 * Input signal is not a valid logic HIGH or LOW signal
						 * Input signal = Z or X
						 */
						$display($time, " << Err@1 >>");
						nextstate <= Serr;
					end
					else
					begin
						
						// A match is found!
						if ((in==1'd1) & (total_bits==num_bits)
							& (total_high==num_high))
						begin
							num_bits=1'd0;
							num_high=1'd0;
$display($time, "NUM_BITS and NUM_HIGH are RESET");
/*
if(prev_find==1'd1)
begin
	num_bits=1'd2;
	num_high=1'd1;
	prev_find=1'd0;
end
else
begin
	num_bits=1'd0;
	num_high=1'd0;
end
*/
			
							$display($time, " << Go to State Sfound >>");
							nextstate <= Sfound;
						end
						else if(in == 1'b0)
						begin
//if(num_bits==4'd5)
//if((num_bits+1)==4'd5)
/*
if((num_bits==4'd4)&(nextstate==Szero))
begin
	$display($time, "*******state",state,"num_bits",num_bits);
	num_bits=1'd2;
	num_high=1'd1;
end
*/
//if(num_bits==4'd1)
if(num_bits==4'd0)
begin
	$display($time, "##############state",state,"num_bits",num_bits);
	num_bits=4'd2;
	num_high=3'd1;
end

							$display($time, " <<pre Szero >>");
							$display(num_high,"=!=",num_bits);
							
							// Increment the number of enumerated bits
							//num_bits=num_bits+1;
							$display($time, " << Szero >>");
							$display(num_high,"=!=",num_bits);
							// Move to state zero
							nextstate <= Szero;
						end
						else
						begin
if(~((num_bits==4'd5) || (num_bits==4'd7) || (num_bits==4'd8)))
begin
	$display($time, "1----<<<state",state,"num_bits",num_bits);
	num_bits=1'd1;
	num_high=1'd1;
end
							$display($time, " << pre Sone>>");
							$display(num_high,"=!=",num_bits);
							
							// in == 1
							/**
							 * Increment the number of enumerated logic
							 * high bits
							 */
//num_high=num_high+1;
							// Increment the number of enumerated bits
							//num_bits=num_bits+1;
							$display($time, " << Sone>>");
							$display(num_high,"=!=",num_bits);
							// Remain at State one
							nextstate <= Sone;
						end
					end
				end
				
				
				
				
				
			Szero:
				begin
					if((num_bits==4'd1)||(num_bits==4'd4)||(num_bits==4'd5)
						&(num_bits==4'd7)||(num_bits==4'd8))
					begin
$display($time, "<<<<<<<<<<state",state,"num_bits",num_bits);
//						num_bits=1'd0;
//						num_high=1'd0;
					end
				
$display($time, " from state1::",state,"num_bits",num_bits,"in",in);				
					
					if((in == 1'bz) || (in == 1'bx))
					begin
						/**
						 * Input signal is not a valid logic HIGH or LOW signal
						 * Input signal = Z or X
						 */
						$display($time, " << Err@0 >>");
						nextstate <= Serr;
					end
					else
					begin
						// Remain at state ZERO
						if(in == 1'd0)
						begin
if((num_bits!=4'd2)&&(num_bits!=4'd3))
begin
	$display($time, "0---->>>state",state,"num_bits",num_bits);
	num_bits=1'd1;
	num_high=1'd0;
end
							$display($time, " << pre Szero >>");
							$display(num_high,"=!=",num_bits);
							
							// Increment the number of enumerated bits
							//num_bits=num_bits+1;
							$display($time, " << Szero >>");
							$display(num_high,"=!=",num_bits);
							nextstate <= Szero;
						end
						else
						begin
//*****************************************
if(num_bits==4'd2)
begin
	$display($time, "______________state",state,"num_bits",num_bits);
	num_bits=1'd1;
	num_high=1'd1;
end
							// Go to state ONE; in == 1
							$display($time, " << pre Sone>>");
							$display(num_high,"=!=",num_bits);
							/**
							 * Increment the number of enumerated logic
							 * high bits
							 */
//num_high=num_high+1;
							// Increment the number of enumerated bits
							//num_bits=num_bits+1;
							$display($time, " << Sone>>");
							$display(num_high,"=!=",num_bits);
							nextstate <= Sone;
						end
					end
				end
				
				
				
				
				
			Sfound:
				begin
$display($time, "NUM_BITS==0 and NUM_HIGH==0");

					num_high=1'd0;
					num_bits=1'd0;
					prev_find=1'd1;
					
					$display($time, " << Reached State Sfound >>", num_bits);
					// Reset the FSM to the state its input takes it.
					if(in == 1'd0)
					begin
						$display($time, " << Go to State Szero >>",num_bits);
						nextstate <= Szero;
					end
					else if(in == 1'd1)
					begin
						// in == 1
						num_high=1'd1;
num_bits=1'd1;
					
						$display($time, "!!!!!!!!!!!!!!!!SGo to State Sone>>",num_bits);
						nextstate <= Sone;
					end
					else
					begin
						// Logic value of "in" is invalid
						$display($time, " << Go to State Serr>>",num_bits);
						nextstate <= Serr;
					end
				end
				
				
				
				
			Serr:
				begin
$display($time, "NUM_BITS==NUM_HIGH==0");

					num_bits=1'd0;
					num_high=1'd0;
					
					
					$display($time, " << Reached State Serr >>", num_bits);
					// Reset the FSM to the state its input takes it.
					if((in == 1'd0) & (rst==1'd0))
					begin
//num_bits<=num_bits+1;
//num_bits=num_bits+1'd0;
num_bits=1'd1;
						$display($time, " << Go to State Szero >>",num_bits);
						nextstate <= Szero;
					end
				   else if((in == 1'd1) & (rst==1'd0))
					begin
//num_bits<=num_bits+1;
//num_bits=num_bits+1'd0;
num_bits=1'd1;
						// in == 1
						num_high=1'd1;
					
						$display($time, " << Go to State Sone>>",num_bits);
						nextstate <= Sone;
					end
					else
					begin
						// Logic value of "in" is invalid
						$display($time, " << Go to State Sone>>",num_bits);
						nextstate <= Serr;
					end
				end
				
				
			
			
			// Default state is the error, Serr, state
			default:
				begin
$display($time, "NUM_BITS  &&&  NUM_HIGH R RESET");

					num_high=1'd0;
					num_bits=1'd0;
					
					
					$display($time, " << Reached State Serr >>", num_bits);
					// Reset the FSM to the state its input takes it.
					if((in == 1'd0) & (rst==1'd0))
					begin
//num_bits<=num_bits+1;
//num_bits=num_bits+1'd0;
num_bits=1'd1;
						$display($time, " << Go to State Szero >>",num_bits);
						nextstate <= Szero;
					end
					else if((in == 1'd1) & (rst==1'd0))
					begin
//num_bits<=num_bits+1;
//num_bits=num_bits+1'd0;
num_bits=1'd1;
						// in == 1
						num_high=1'd1;
					
						$display($time, " << Go to State Sone>>",num_bits);
						nextstate <= Sone;
					end
					else
					begin
						// Logic value of "in" is invalid
						$display($time, " << Go to State Sone>>",num_bits);
						nextstate <= Serr;
					end
				end
		endcase
	end
	
	
	/**
	 * Output Logic - Difference between the Mealy and the Moore machine
	 * is that the output logic is dependent only on the states in the latter
	 */
	always @(state)
	begin
		case(state)
			Sone:
				begin
					match=1'd0;
					err=1'd0;
				end
			Szero:
				begin
					match=1'd0;
					err=1'd0;
				end
			Sfound:
				begin
					match=1'd1;
					err=1'd0;
				end
			Serr:
				begin
					match=1'd0;
					err=1'd1;
				end
			
			
			// Default state is the error, Serr, state
			default:
				begin
					match=1'd0;
					err=1'd1;
				end
		endcase
	end
	
endmodule
