module myAddSub(A,B,CI,ADD,BOP,Y,CO,OVF);
    input [7:0] A;
    input [7:0] B;
    input CI;
    input ADD;
    input BOP;
    output [7:0] Y;
    output CO;
    output OVF;
//------------------------------------------------------------
// This is an ADDER/SUBTRACTOR based on the adder subtractor
// that is in the schematic capture library.  I added another
// control input that zeros out the B input so that this thing
// can also be used as an incrementer/decrementer depeding on
// the carry input.
//
// parameter:
//	A............8 bit bus, input A of Adder/Subtractor
//	B............8 bit bus, input B of Adder/Subtractor
//	CI...........Carry/nBorrow input
//	ADD..........if true, perform addition, 0 perform subtraction
//	BOP..........if 1, pass B input, if 0, B = 0
//	Y............8 bit bus, 8 bit sum output
//	CO...........Carry/nBorrow output
//	OVF..........overflow status output
//
//-------------------------------------------------------------
	reg[7:0] I;
	wire [7:0] Y;
	wire C0,C1,C2,C3,C4,C5,C6;
	wire C6O;

	always @(A or B or CI or ADD or BOP)
	begin
		I[0] = A[0] ^ (B[0] & BOP) ^ ~ADD;
		I[1] = A[1] ^ (B[1] & BOP) ^ ~ADD;
		I[2] = A[2] ^ (B[2] & BOP) ^ ~ADD;
		I[3] = A[3] ^ (B[3] & BOP) ^ ~ADD;
		I[4] = A[4] ^ (B[4] & BOP) ^ ~ADD;
		I[5] = A[5] ^ (B[5] & BOP) ^ ~ADD;
		I[6] = A[6] ^ (B[6] & BOP) ^ ~ADD;
		I[7] = A[7] ^ (B[7] & BOP) ^ ~ADD;
	end


	MUXCY_L MUXCY_L0 (.LO(C0),.CI(CI),.DI(A[0]),.S(I[0]) );
	MUXCY_L MUXCY_L1 (.LO(C1),.CI(C0),.DI(A[1]),.S(I[1]) );
	MUXCY_L MUXCY_L2 (.LO(C2),.CI(C1),.DI(A[2]),.S(I[2]) );
	MUXCY_L MUXCY_L3 (.LO(C3),.CI(C2),.DI(A[3]),.S(I[3]) );
	MUXCY_L MUXCY_L4 (.LO(C4),.CI(C3),.DI(A[4]),.S(I[4]) );
	MUXCY_L MUXCY_L5 (.LO(C5),.CI(C4),.DI(A[5]),.S(I[5]) );
	MUXCY_D MUXCY_D6 (.LO(C6),.O(C6O),.CI(C5),.DI(A[6]),.S(I[6]) );
	MUXCY   MUXCY_7  (.O(CO),.CI(C6),.DI(A[7]),.S(I[7]) );
	
	XORCY XORCY0 (.O(Y[0]),.CI(CI),  .LI(I[0]));
	XORCY XORCY1 (.O(Y[1]),.CI(C0),.LI(I[1]));
	XORCY XORCY2 (.O(Y[2]),.CI(C1),.LI(I[2]));
	XORCY XORCY3 (.O(Y[3]),.CI(C2),.LI(I[3]));
	XORCY XORCY4 (.O(Y[4]),.CI(C3),.LI(I[4]));
	XORCY XORCY5 (.O(Y[5]),.CI(C4),.LI(I[5]));
	XORCY XORCY6 (.O(Y[6]),.CI(C5),.LI(I[6]));
	XORCY XORCY7 (.O(Y[7]),.CI(C6),.LI(I[7]));
	
	XOR2 X1(.O(OVF),.I0(C6O),.I1(CO));

endmodule
