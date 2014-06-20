
module SIPO ( data_out, out_valid, serial_in, in_valid, reset_b, clk );
  output [7:0] data_out;
  input serial_in, in_valid, reset_b, clk;
  output out_valid;

  assign out_valid = 1'b0;
  assign data_out[0] = 1'b0;
  assign data_out[1] = 1'b0;
  assign data_out[2] = 1'b0;
  assign data_out[3] = 1'b0;
  assign data_out[4] = 1'b0;
  assign data_out[5] = 1'b0;
  assign data_out[6] = 1'b0;
  assign data_out[7] = 1'b0;

endmodule

