// Zhiyang Ong
// Andrew Mattheisen
// hazard_detect.v


module hazard_detect(instruction1, instruction2, instruction3, 
		hz1_a_or_d, hz1_b, /*hz2_a_or_d, hz2_b,*/ hz3_a_or_d, hz3_b);

	// INPUTS
	input [0:31] instruction1, instruction2, instruction3;
	
	// OUTPUTS
	output hz1_a_or_d, hz1_b, /*hz2_a_or_d, hz2_b,*/ hz3_a_or_d, hz3_b;
	
	// REGISTERS
	reg hz1_a_or_d, hz1_b, /*hz2_a_or_d, hz2_b,*/ hz3_a_or_d, hz3_b;
	
	// PARAMETERS
	parameter zero = 1'b0;
	parameter one = 1'b1;

	// HZ1 Detection
	always @ (instruction1 or instruction3)
		begin
		// Determine registers instruction1 reads
//---------------------------------------------
		if (instruction1[2] == 1'b1) // => instruction1 is wmv
			begin
				// value of Reg Alpha is used by instruction1
				// Determine registers instruction3 writes to
				if (instruction3[2] == 1'b1) // => instruction3 is wmv
					begin
						// value of Reg Delta is used by instruction3
						hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
						hz1_b<=zero;
					end // if (instruction3[2] == 1'b1)
				else if (instruction3[3] == 1'b1) // must examine bits 0-5
					begin
					if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
							hz1_b<=zero;
						end
					else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
							hz1_b<=zero;
						end
					else // instruction3 is any other command
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
							hz1_b<=zero;
						end
					end // else if (instruction3[3] == 1'b1)
				else if (instruction3[4]==1'b1) // => instruction3 is wst
					begin
						// No Registers are used by instruction3
						hz1_a_or_d <= zero;
						hz1_b<=zero;
					end // else if (instruction3[4]==1'b1)
				else if (instruction3[5]==1'b1) // => instruction3 is wld
					begin
						// value of Reg Delta is used by instruction3
						hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
						hz1_b<=zero;
					end // else if (instruction3[5]==1'b1)   
				else // => instruction3 is NOP
					begin
						// No Registers are used by instruction3
						hz1_a_or_d <= zero;
						hz1_b<=zero;
					end // else
			end // if (instruction1[2] == 1'b1)
// -------------------------------------------------------
		else if (instruction1[3] == 1'b1) // must examine bits 0-5
			begin
			if ({instruction1[26:28], instruction1[31]} == 4'b0101) // instruction1 is immediate  shift
				begin
					// value of Reg Alpha is used by instruction1
					// Determine registers instruction3 writes to
					if (instruction3[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
							hz1_b<=zero;
						end // if (instruction3[2] == 1'b1)
					else if (instruction3[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
								hz1_b<=zero;
							end
						else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
								hz1_b<=zero;
							end
						else // instruction3 is any other command
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
								hz1_b<=zero;
							end
						end // else if (instruction3[3] == 1'b1)
					else if (instruction3[4]==1'b1) // => instruction3 is wst
						begin
							// No Registers are used by instruction3
							hz1_a_or_d <= zero;
							hz1_b<=zero;
						end // else if (instruction3[4]==1'b1)
					else if (instruction3[5]==1'b1) // => instruction3 is wld
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
							hz1_b<=zero;
						end // else if (instruction3[5]==1'b1)   
					else // => instruction3 is NOP
						begin
							// No Registers are used by instruction3
							hz1_a_or_d <= zero;
							hz1_b<=zero;
						end // else
				end
// -------------------------------------------------------
			else if (instruction1[26:31]==6'b001000) // instruction1 is wnot
				begin
					// value of Reg Alpha is used by instruction1
					// Determine registers instruction3 writes to
					if (instruction3[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
							hz1_b<=zero;
						end // if (instruction3[2] == 1'b1)
					else if (instruction3[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
								hz1_b<=zero;
							end
						else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
								hz1_b<=zero;
							end
						else // instruction3 is any other command
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
								hz1_b<=zero;
							end
						end // else if (instruction3[3] == 1'b1)
					else if (instruction3[4]==1'b1) // => instruction3 is wst
						begin
							// No Registers are used by instruction3
							hz1_a_or_d <= zero;
							hz1_b<=zero;
						end // else if (instruction3[4]==1'b1)
					else if (instruction3[5]==1'b1) // => instruction3 is wld
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero;
							hz1_b<=zero;
						end // else if (instruction3[5]==1'b1)   
					else // => instruction3 is NOP
						begin
							// No Registers are used by instruction3
							hz1_a_or_d <= zero;
							hz1_b<=zero;
						end // else
				end
// -------------------------------------------------------
			else // instruction1 is any other command
				begin
					// values of Reg Alpha and Reg Bravo are used by instruction1
					// Determine registers instruction3 writes to
					if (instruction3[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero; 
							hz1_b <= (instruction1[16:20]==instruction3[6:10])? one : zero;
						end // if (instruction3[2] == 1'b1)
					else if (instruction3[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero; 
								hz1_b <= (instruction1[16:20]==instruction3[6:10])? one : zero;
							end
						else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero; 
								hz1_b <= (instruction1[16:20]==instruction3[6:10])? one : zero;
							end
						else // instruction3 is any other command
							begin
								// value of Reg Delta is used by instruction3
								hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero; 
								hz1_b <= (instruction1[16:20]==instruction3[6:10])? one : zero;
							end
						end // else if (instruction3[3] == 1'b1)
					else if (instruction3[4]==1'b1) // => instruction3 is wst
						begin
							// No Registers are used by instruction3
							hz1_a_or_d <= zero;
							hz1_b <= zero;
						end // else if (instruction3[4]==1'b1)
					else if (instruction3[5]==1'b1) // => instruction3 is wld
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[11:15]==instruction3[6:10])? one : zero; 
							hz1_b <= (instruction1[16:20]==instruction3[6:10])? one : zero;
						end // else if (instruction3[5]==1'b1)   
					else // => instruction3 is NOP
						begin
							// No Registers are used by instruction3
							hz1_a_or_d <= zero;
							hz1_b <= zero;
						end // else
				end
			end // else if (instruction1[3] == 1'b1)
// ------------------------------------------------------
		else if (instruction1[4]==1'b1) // => instruction1 is wst
			begin
				// value of Reg Delta (writeback) is used by instruction1
				// Determine registers instruction3 writes to
				if (instruction3[2] == 1'b1) // => instr is wmv
					begin
						// value of Reg Delta is used by instruction3
						hz1_a_or_d <= (instruction1[6:10]==instruction3[6:10])? one : zero;
						hz1_b <= zero;
					end // if (instruction3[2] == 1'b1)
				else if (instruction3[3] == 1'b1) // must examine bits 0-5
					begin
					if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[6:10]==instruction3[6:10])? one : zero;
							hz1_b <= zero;
						end
					else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[6:10]==instruction3[6:10])? one : zero;
							hz1_b <= zero;
						end
					else // instruction3 is any other command
						begin
							// value of Reg Delta is used by instruction3
							hz1_a_or_d <= (instruction1[6:10]==instruction3[6:10])? one : zero;
							hz1_b <= zero;
						end
					end // else if (instruction3[3] == 1'b1)
				else if (instruction3[4]==1'b1) // => instruction3 is wst
					begin
						// No Registers are used by instruction3
						hz1_a_or_d <= zero;
						hz1_b <= zero;
					end // else if (instruction3[4]==1'b1)
				else if (instruction3[5]==1'b1) // => instruction3 is wld
					begin
						// value of Reg Delta is used by instruction3
						hz1_a_or_d <= (instruction1[6:10]==instruction3[6:10])? one : zero;
						hz1_b <= zero;
					end // else if (instruction3[5]==1'b1)   
				else // => instruction3 is NOP
					begin
						// No Registers are used by instruction3
						hz1_a_or_d <= zero;
						hz1_b <= zero;
					end // else
			end // else if (instruction1[4]==1'b1)
// ------------------------------------------------------
		else if (instruction1[5]==1'b1) // => instruction1 is wld
			begin
				// No Registers are used by instruction1
				hz1_a_or_d <= zero;
				hz1_b <= zero;
			end // else if (instruction1[5]==1'b1)   
// ------------------------------------------------------
		else // => instruction1 is NOP
			begin
				// No Registers are used by instruction1
				hz1_a_or_d <= zero;
				hz1_b <= zero;
			end // else
// -------------------------------------------------------
		end // always @ (instruction1 or instruction3)



// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================


/* 
	// HZ2 Detection
	always @ (instruction1 or instruction2)
		begin
		// Determine registers instruction1 reads
//---------------------------------------------
		if (instruction1[2] == 1'b1) // => instr is wmv
			begin
				// value of Reg Alpha is used by instruction1
				// Determine registers instruction2 writes to
				if (instruction2[2] == 1'b1) // => instr is wmv
					begin
						// value of Reg Delta is used by instruction2
						hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
						hz2_b <= zero;
					end // if (instruction2[2] == 1'b1)
				else if (instruction2[3] == 1'b1) // must examine bits 0-5
					begin
					if ({instruction2[26:28], instruction2[31]} == 4'b0101) // instruction2 is immediate  shift
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end
					else if (instruction2[26:31]==6'b001000) // instruction2 is wnot
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end
					else // instruction2 is any other command
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end
					end // else if (instruction2[3] == 1'b1)
				else if (instruction2[4]==1'b1) // => instruction2 is wst
					begin
						// No Registers are used by instruction2
						hz2_a_or_d <= zero;
						hz2_b <= zero;
					end // else if (instruction2[4]==1'b1)
				else if (instruction2[5]==1'b1) // => instruction2 is wld
					begin
						// value of Reg Delta is used by instruction2
						hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
						hz2_b <= zero;
					end // else if (instruction2[5]==1'b1)   
				else // => instruction2 is NOP
					begin
						// No Registers are used by instruction2
						hz2_a_or_d <= zero;
						hz2_b <= zero;
					end // else
			end // if (instruction1[2] == 1'b1)
// -------------------------------------------------------
		else if (instruction1[3] == 1'b1) // must examine bits 0-5
			begin
			if ({instruction1[26:28], instruction1[31]} == 4'b0101) // instruction1 is immediate  shift
				begin
					// value of Reg Alpha is used by instruction1
					// Determine registers instruction2 writes to
					if (instruction2[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end // if (instruction2[2] == 1'b1)
					else if (instruction2[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction2[26:28], instruction2[31]} == 4'b0101) // instruction2 is immediate  shift
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= zero;
							end
						else if (instruction2[26:31]==6'b001000) // instruction2 is wnot
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= zero;
							end
						else // instruction2 is any other command
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= zero;
							end
						end // else if (instruction2[3] == 1'b1)
					else if (instruction2[4]==1'b1) // => instruction2 is wst
						begin
							// No Registers are used by instruction2
							hz2_a_or_d <= zero;
							hz2_b <= zero;
						end // else if (instruction2[4]==1'b1)
					else if (instruction2[5]==1'b1) // => instruction2 is wld
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end // else if (instruction2[5]==1'b1)   
					else // => instruction2 is NOP
						begin
							// No Registers are used by instruction2
							hz2_a_or_d <= zero;
							hz2_b <= zero;
						end // else
				end
// -------------------------------------------------------
			else if (instruction1[26:31]==6'b001000) // instruction1 is wnot
				begin
					// value of Reg Alpha is used by instruction1
					// Determine registers instruction2 writes to
					if (instruction2[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end // if (instruction2[2] == 1'b1)
					else if (instruction2[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction2[26:28], instruction2[31]} == 4'b0101) // instruction2 is immediate  shift
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= zero;
							end
						else if (instruction2[26:31]==6'b001000) // instruction2 is wnot
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= zero;
							end
						else // instruction2 is any other command
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= zero;
							end
						end // else if (instruction2[3] == 1'b1)
					else if (instruction2[4]==1'b1) // => instruction2 is wst
						begin
							// No Registers are used by instruction2
							hz2_a_or_d <= zero;
							hz2_b <= zero;
						end // else if (instruction2[4]==1'b1)
					else if (instruction2[5]==1'b1) // => instruction2 is wld
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end // else if (instruction2[5]==1'b1)   
					else // => instruction2 is NOP
						begin
							// No Registers are used by instruction2
							hz2_a_or_d <= zero;
							hz2_b <= zero;
						end // else
				end
// -------------------------------------------------------
			else // instruction1 is any other command
				begin
					// values of Reg Alpha and Reg Bravo are used by instruction1
					// Determine registers instruction2 writes to
					if (instruction2[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= (instruction1[16:20]==instruction2[6:10])? one : zero;
						end // if (instruction2[2] == 1'b1)
					else if (instruction2[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction2[26:28], instruction2[31]} == 4'b0101) // instruction2 is immediate  shift
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= (instruction1[16:20]==instruction2[6:10])? one : zero;
							end
						else if (instruction2[26:31]==6'b001000) // instruction2 is wnot
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= (instruction1[16:20]==instruction2[6:10])? one : zero;
							end
						else // instruction2 is any other command
							begin
								// value of Reg Delta is used by instruction2
								hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
								hz2_b <= (instruction1[16:20]==instruction2[6:10])? one : zero;
							end
						end // else if (instruction2[3] == 1'b1)
					else if (instruction2[4]==1'b1) // => instruction2 is wst
						begin
							// No Registers are used by instruction2
							hz2_a_or_d <= zero;
							hz2_b <= zero;
						end // else if (instruction2[4]==1'b1)
					else if (instruction2[5]==1'b1) // => instruction2 is wld
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[11:15]==instruction2[6:10])? one : zero;
							hz2_b <= (instruction1[16:20]==instruction2[6:10])? one : zero;
						end // else if (instruction2[5]==1'b1)   
					else // => instruction2 is NOP
						begin
							// No Registers are used by instruction2
							hz2_a_or_d <= zero;
							hz2_b <= zero;
						end // else
				end
			end // else if (instruction1[3] == 1'b1)
// ------------------------------------------------------
		else if (instruction1[4]==1'b1) // => instruction1 is wst
			begin
				// value of Reg Delta (writeback) is used by instruction1
				// Determine registers instruction2 writes to
				if (instruction2[2] == 1'b1) // => instr is wmv
					begin
						// value of Reg Delta is used by instruction2
						hz2_a_or_d <= (instruction1[6:10]==instruction2[6:10])? one : zero;
						hz2_b <= zero;
					end // if (instruction2[2] == 1'b1)
				else if (instruction2[3] == 1'b1) // must examine bits 0-5
					begin
					if ({instruction2[26:28], instruction2[31]} == 4'b0101) // instruction2 is immediate  shift
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[6:10]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end
					else if (instruction2[26:31]==6'b001000) // instruction2 is wnot
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[6:10]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end
					else // instruction2 is any other command
						begin
							// value of Reg Delta is used by instruction2
							hz2_a_or_d <= (instruction1[6:10]==instruction2[6:10])? one : zero;
							hz2_b <= zero;
						end
					end // else if (instruction2[3] == 1'b1)
				else if (instruction2[4]==1'b1) // => instruction2 is wst
					begin
						// No Registers are used by instruction2
						hz2_a_or_d <= zero;
						hz2_b <= zero;
					end // else if (instruction2[4]==1'b1)
				else if (instruction2[5]==1'b1) // => instruction2 is wld
					begin
						// value of Reg Delta is used by instruction2
						hz2_a_or_d <= (instruction1[6:10]==instruction2[6:10])? one : zero;
						hz2_b <= zero;
					end // else if (instruction2[5]==1'b1)   
				else // => instruction2 is NOP
					begin
						// No Registers are used by instruction2
						hz2_a_or_d <= zero;
						hz2_b <= zero;
					end // else
			end // else if (instruction1[4]==1'b1)
// ------------------------------------------------------
		else if (instruction1[5]==1'b1) // => instruction1 is wld
			begin
				// No Registers are used by instruction1
				hz2_a_or_d <= zero;
				hz2_b <= zero;
			end // else if (instruction1[5]==1'b1)   
// ------------------------------------------------------
		else // => instruction1 is NOP
			begin
				// No Registers are used by instruction1
				hz2_a_or_d <= zero;
				hz2_b <= zero;
			end // else
// -------------------------------------------------------
		end // always @ (instruction1 or instruction2)
*/

// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================
// ================================================================================================================


	// HZ3 Detection
	always @ (instruction2 or instruction3)
		begin
		// Determine registers instruction2 reads
//---------------------------------------------
		if (instruction2[2] == 1'b1) // => instr is wmv
			begin
				// value of Reg Alpha is used by instruction2
				// Determine registers instruction3 writes to
				if (instruction3[2] == 1'b1) // => instr is wmv
					begin
						// value of Reg Delta is used by instruction3
						hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
						hz3_b <= zero;
					end // if (instruction3[2] == 1'b1)
				else if (instruction3[3] == 1'b1) // must examine bits 0-5
					begin
					if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end
					else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end
					else // instruction3 is any other command
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end
					end // else if (instruction3[3] == 1'b1)
				else if (instruction3[4]==1'b1) // => instruction3 is wst
					begin
						// No Registers are used by instruction3
						hz3_a_or_d <= zero;
						hz3_b <= zero;
					end // else if (instruction3[4]==1'b1)
				else if (instruction3[5]==1'b1) // => instruction3 is wld
					begin
						// value of Reg Delta is used by instruction3
						hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
						hz3_b <= zero;
					end // else if (instruction3[5]==1'b1)   
				else // => instruction3 is NOP
					begin
						// No Registers are used by instruction3
						hz3_a_or_d <= zero;
						hz3_b <= zero;
					end // else
			end // if (instruction2[2] == 1'b1)
// -------------------------------------------------------
		else if (instruction2[3] == 1'b1) // must examine bits 0-5
			begin
			if ({instruction2[26:28], instruction2[31]} == 4'b0101) // instruction2 is immediate  shift
				begin
					// value of Reg Alpha is used by instruction2
					// Determine registers instruction3 writes to
					if (instruction3[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end // if (instruction3[2] == 1'b1)
					else if (instruction3[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= zero;
							end
						else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= zero;
							end
						else // instruction3 is any other command
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= zero;
							end
						end // else if (instruction3[3] == 1'b1)
					else if (instruction3[4]==1'b1) // => instruction3 is wst
						begin
							// No Registers are used by instruction3
							hz3_a_or_d <= zero;
							hz3_b <= zero;
						end // else if (instruction3[4]==1'b1)
					else if (instruction3[5]==1'b1) // => instruction3 is wld
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end // else if (instruction3[5]==1'b1)   
					else // => instruction3 is NOP
						begin
							// No Registers are used by instruction3
							hz3_a_or_d <= zero;
							hz3_b <= zero;
						end // else
				end
// -------------------------------------------------------
			else if (instruction2[26:31]==6'b001000) // instruction2 is wnot
				begin
					// value of Reg Alpha is used by instruction2
					// Determine registers instruction3 writes to
					if (instruction3[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end // if (instruction3[2] == 1'b1)
					else if (instruction3[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= zero;
							end
						else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= zero;
							end
						else // instruction3 is any other command
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= zero;
							end
						end // else if (instruction3[3] == 1'b1)
					else if (instruction3[4]==1'b1) // => instruction3 is wst
						begin
							// No Registers are used by instruction3
							hz3_a_or_d <= zero;
							hz3_b <= zero;
						end // else if (instruction3[4]==1'b1)
					else if (instruction3[5]==1'b1) // => instruction3 is wld
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end // else if (instruction3[5]==1'b1)   
					else // => instruction3 is NOP
						begin
							// No Registers are used by instruction3
							hz3_a_or_d <= zero;
							hz3_b <= zero;
						end // else
				end
// -------------------------------------------------------
			else // instruction2 is any other command
				begin
					// values of Reg Alpha and Reg Bravo are used by instruction2
					// Determine registers instruction3 writes to
					if (instruction3[2] == 1'b1) // => instr is wmv
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= (instruction2[16:20]==instruction3[6:10])? one : zero;
						end // if (instruction3[2] == 1'b1)
					else if (instruction3[3] == 1'b1) // must examine bits 0-5
						begin
						if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= (instruction2[16:20]==instruction3[6:10])? one : zero;
							end
						else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= (instruction2[16:20]==instruction3[6:10])? one : zero;
							end
						else // instruction3 is any other command
							begin
								// value of Reg Delta is used by instruction3
								hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
								hz3_b <= (instruction2[16:20]==instruction3[6:10])? one : zero;
							end
						end // else if (instruction3[3] == 1'b1)
					else if (instruction3[4]==1'b1) // => instruction3 is wst
						begin
							// No Registers are used by instruction3
							hz3_a_or_d <= zero;
							hz3_b <= zero;
						end // else if (instruction3[4]==1'b1)
					else if (instruction3[5]==1'b1) // => instruction3 is wld
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[11:15]==instruction3[6:10])? one : zero;
							hz3_b <= (instruction2[16:20]==instruction3[6:10])? one : zero;
						end // else if (instruction3[5]==1'b1)   
					else // => instruction3 is NOP
						begin
							// No Registers are used by instruction3
							hz3_a_or_d <= zero;
							hz3_b <= zero;
						end // else
				end
			end // else if (instruction2[3] == 1'b1)
// ------------------------------------------------------
		else if (instruction2[4]==1'b1) // => instruction2 is wst
			begin
				// value of Reg Delta (writeback) is used by instruction2
				// Determine registers instruction3 writes to
				if (instruction3[2] == 1'b1) // => instr is wmv
					begin
						// value of Reg Delta is used by instruction3
						hz3_a_or_d <= (instruction2[6:10]==instruction3[6:10])? one : zero;
						hz3_b <= zero;
					end // if (instruction3[2] == 1'b1)
				else if (instruction3[3] == 1'b1) // must examine bits 0-5
					begin
					if ({instruction3[26:28], instruction3[31]} == 4'b0101) // instruction3 is immediate  shift
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[6:10]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end
					else if (instruction3[26:31]==6'b001000) // instruction3 is wnot
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[6:10]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end
					else // instruction3 is any other command
						begin
							// value of Reg Delta is used by instruction3
							hz3_a_or_d <= (instruction2[6:10]==instruction3[6:10])? one : zero;
							hz3_b <= zero;
						end
					end // else if (instruction3[3] == 1'b1)
				else if (instruction3[4]==1'b1) // => instruction3 is wst
					begin
						// No Registers are used by instruction3
						hz3_a_or_d <= zero;
						hz3_b <= zero;
					end // else if (instruction3[4]==1'b1)
				else if (instruction3[5]==1'b1) // => instruction3 is wld
					begin
						// value of Reg Delta is used by instruction3
						hz3_a_or_d <= (instruction2[6:10]==instruction3[6:10])? one : zero;
						hz3_b <= zero;
					end // else if (instruction3[5]==1'b1)   
				else // => instruction3 is NOP
					begin
						// No Registers are used by instruction3
						hz3_a_or_d <= zero;
						hz3_b <= zero;
					end // else
			end // else if (instruction2[4]==1'b1)
// ------------------------------------------------------
		else if (instruction2[5]==1'b1) // => instruction2 is wld
			begin
				// No Registers are used by instruction2
				hz3_a_or_d <= zero;
				hz3_b <= zero;
			end // else if (instruction2[5]==1'b1)   
// ------------------------------------------------------
		else // => instruction2 is NOP
			begin
				// No Registers are used by instruction2
				hz3_a_or_d <= zero;
				hz3_b <= zero;
			end // else
// -------------------------------------------------------
		end // always @ (instruction2 or instruction3)







endmodule
