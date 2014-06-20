//
//
//	counter: The counter module.
//		 The counter plays the role of PC since
//		 the instruction set doesn't include any control
//		 transfer instructions.
//	Parameter List:
//		clk:	the clock (input)
//		reset:	it resets the counter synchronously (input)
//		cnt:	the output of the counter (output)
//
//	Author:	Nestoras Tzartzanis
//	Date:	1/25/96
//	EE577b Verilog Example
//
//

module counter (clk, reset, cnt);

input		clk;
input		reset;
output	[7:0]	cnt;

//	The outputs are defined as registers too
reg	[7:0]	cnt;

//	The counter doesn't have any delay since the
//	output is latched when the posedge of the clock happens.
//	To be closer to the hardware implementation,
//	I could use a temporary value which would store
//	the intermediate result of the counter.
always @(posedge clk)
	if (!reset)
		cnt = cnt + 1;
	else
		cnt = 0;

endmodule
