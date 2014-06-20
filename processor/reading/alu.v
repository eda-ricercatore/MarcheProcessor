//****************************************************
// 6502 soft core project
// 8 bit ALU module
// Created March 14, 2005
// Author: Jim Patchell
//
// This code can be used for any purpose, except as
// a being used to turn in as a homework problem for
// school courses...note to teachers...your student
// did not do this work...
//
//****************************************************

module alu(CLK,RESET,A,B,Y,OP,C,N,V,Z);

//****************************************************
// 8 bit arithmetic logic unit
//
// parameter:
//	CLK.......system clock
//	RESET.....System Reset
//	A.........A input
//	B.........B input
//	OP........operation to perform
//	Y.........8 bit result output
//	C.........carry status
//	V.........overflow status
//	N.........sign status
//	Z.........zero status
//
//****************************************************
	input CLK,RESET;
	input [7:0] A;
	input [7:0] B;
	input [15:0] OP;
	output [7:0] Y;
	output C;
	output V;
	output N;
	output Z;
//------------------------------------------------------
// internal nodes
//------------------------------------------------------
	reg [7:0] Y,LogicUnit,AluNoShift;
	wire [7:0]	ArithUnit;
	reg shiftout;
	wire C,V,N,Z;

	wire carryout;
	wire ovf;
	reg Neg;		//negative status from ALU
	reg Zero;		//Zero Status from ALU

	//-----------------------------------------------------------
	// Arithmetic unit
	//
	// gona use myAddSub for this part...it seems to work right...
	// rather than trying to infer the thing.
	//
	// operation of the adder subtractor is as follows
	//
	// OP[0] OP[1] carry | operation
	//  0      0     0   | Y = A - 1;
	//  0      0     1   | Y = A;
	//  0      1     0   | Y = A - B - 1;
	//  0      1     1   | Y = A - B;
	//  1      0     0   | Y = A;
	//  1      0     1   | Y = A + 1;
	//  1      1     0   | Y = A + B;
	//  1      1     1   | Y = A + B + 1; 
	//
	//------------------------------------------------------------

	myAddSub Add1(.A(A),.B(B),.CI(C),.ADD(OP[0]),.BOP(OP[1]),.Y(ArithUnit),.CO(carryout),.OVF(ovf));

	//---------------------------------------------
	// Logic Unit
	// OP[1] OP[0] | operation
	//	0     0   | Y = A and B
	//	0     1   | Y = A or B
	//	1     0   | Y = A xor B
	//	1     1   | Y = Not A
	//---------------------------------------------

	always @ (A or B or OP[1:0])
	begin
		case (OP[1:0])
			2'b00:LogicUnit = A & B;
			2'b01:LogicUnit = A | B;
			2'b10:LogicUnit = A ^ B;
			2'b11:LogicUnit = !A;
			default:LogicUnit = 8'bx;
		endcase
	end
	//----------------------------------------------
	// Select between logic and arithmatic
	// OP[2]		| operation
	//	0		| Arithmetic operation
	//	1		| Logical Operation
	//----------------------------------------------
	always @ (OP[2] or LogicUnit or ArithUnit)
	begin
		if(OP[2])
			AluNoShift = LogicUnit;
		else
			AluNoShift = ArithUnit[7:0];
 	end
	//-----------------------------------------------
	// Shift operations
	//
	//	OP[3]	OP[4]	OP[5]	| operation
	//	  0		  0		  0		| NOP
	//	  1		  0		  0		| Shift Left (ASL)
	//	  0		  1		  0		| Arithmentic Shift Right (ASR..new)
	//	  1		  1		  0		| Logical Shift Right  (LSR)
	//	  0		  0		  1		| Rotate Left (ROL)
	//	  1		  0		  1		| Rotate Right (ROR)
	//	  0		  1		  1		| NOP
	//	  1		  1		  1		| NOP
	//-----------------------------------------------
	always @ (OP[5:3] or AluNoShift or C)
	begin
		case(OP[5:3])
			3'b000: begin
				Y = AluNoShift;	//do not shift output
				shiftout = 0;
				end
			3'b001: begin
				Y = {AluNoShift[6:0],1'b0};	//ASL
				shiftout = AluNoShift[7];
				end
			3'b010: begin
				Y = {AluNoShift[7],AluNoShift[7:1]};	//ASR
				shiftout = AluNoShift[0];
				end
			3'b011: begin
				Y = {1'b0,AluNoShift[7:1]};	//LSR
				shiftout = AluNoShift[0];
				end
			3'b100: begin
				Y = {AluNoShift[6:0],C};
				shiftout = AluNoShift[7];
				end
			3'b101: begin
				Y = {C,AluNoShift[7:1]};	//LSR
				shiftout = AluNoShift[0];
				end
			3'b110: begin
				Y = AluNoShift;	//do not shift output
				shiftout = 0;
				end
			3'b111: begin
				Y = AluNoShift;	//do not shift output
				shiftout = 0;
				end
			default: begin
				Y = 8'bx;
				shiftout = 0;
				end
		endcase
 	end
	//-----------------------------------------------------------
	// Generate the status bits for the status registers
	//
	//-----------------------------------------------------------

	always @(Y)
	begin
		if(!Y[0] & !Y[1] & !Y[2] & !Y[3] & !Y[4] & !Y[5] & !Y[6] & !Y[7])
			Zero = 1;
		else
			Zero = 0;
	end

	always @ (Y[7])
		Neg = Y[7];

	//-----------------------------------------------------------
	// Carry Status Register
	//	OP[6]	OP[7]	OP[8]	| operation
	//	  0		  0		  0		| NOP
	//	  0		  0		  1		| Carry <- Adder/Sub Carry/Borrow
	//	  1		  0		  1		| Carry <- Shifter Out
	//	  0		  1		  1		| Carry <- 0
	//	  1		  1		  1		| Carry <- 1
	//-----------------------------------------------------------
	
	status CARRY1(.clk(CLK),.reset(RESET),.load(OP[8]),.a(carryout),.b(shiftout),.c(1'b0),.d(1'b1),.sel(OP[7:6]),.s(C));

	//-----------------------------------------------------------
	// Overflow status register
	//	OP[9]	OP[10]	OP[11]	| operation
	//	  0		  0		  0		| NOP
	//	  0		  0		  1		| Overflow <- Adder/Sub Overflow
	//	  1		  0		  1		| Overflow <- External
	//	  0		  1		  1		| Overflow <- 0
	//	  1		  1		  1		| Overflow <- 1
	//-----------------------------------------------------------

	status OVF1(.clk(CLK),.reset(RESET),.load(OP[11]),.a(ovf),.b(Y[6]),.c(1'b0),.d(1'b1),.sel(OP[10:9]),.s(V));

	//-----------------------------------------------------------
	// Zero Status Register
	//	OP[12]	OP[13]	| operation
	//	  0		  0		| NOP
	//	  1		  0		| Zero <- Zero Input1
	//	  0		  1		| Zero <- Zero Input2
	//	  1		  1		| Zero <- 0
	//-----------------------------------------------------------

	status ZERO1(.clk(CLK),.reset(RESET),.load(1'b1),.a(Z),.b(Zero),.c(1'b1),.d(1'b0),.sel(OP[13:12]),.s(Z));

	//-----------------------------------------------------------
	// Negative Status Register
	//	OP[14]	OP[15]	| operation
	//	  0		  0		| NOP
	//	  1		  0		| Neg <- Neg Input1
	//	  0		  1		| Neg <- Neg Input2
	//	  1		  1		| Neg <- 0
	//-----------------------------------------------------------

	status NEG1(.clk(CLK),.reset(RESET),.load(1'b1),.a(N),.b(Neg),.c(1'b1),.d(1'b0),.sel(OP[15:14]),.s(N));

endmodule
