
module seq_detect ( in, clk, rst, match, err );
  input in, clk, rst;
  output match, err;
  wire   state76_0_, n201;
  wire   [1:0] state;

  DFFPOSX1 state_reg_0_ ( .D(state76_0_), .CLK(clk), .Q(state[0]) );
  DFFPOSX1 state_reg_1_ ( .D(rst), .CLK(clk), .Q(state[1]) );
  OR2X1 U74 ( .A(rst), .B(in), .Y(state76_0_) );
  NOR2X1 U75 ( .A(state[0]), .B(n201), .Y(match) );
  INVX1 U76 ( .A(state[1]), .Y(n201) );
  AND2X1 U77 ( .A(state[1]), .B(state[0]), .Y(err) );
endmodule

