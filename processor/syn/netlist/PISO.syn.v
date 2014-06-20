
module PISO ( serial_out, out_valid, data_in, load, reset_b, clk );
  input [7:0] data_in;
  input load, reset_b, clk;
  output serial_out, out_valid;

  assign out_valid = 1'b0;
  assign serial_out = 1'b0;

endmodule

