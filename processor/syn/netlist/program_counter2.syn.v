
module program_counter2_DW01_add_0 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   A_1_, A_0_, carry_31_, carry_30_, carry_29_, carry_28_, carry_27_,
         carry_26_, carry_25_, carry_24_, carry_23_, carry_22_, carry_21_,
         carry_20_, carry_19_, carry_18_, carry_17_, carry_16_, carry_15_,
         carry_14_, carry_13_, carry_12_, carry_11_, carry_10_, carry_9_,
         carry_8_, carry_7_, carry_6_, carry_5_, carry_4_;
  assign SUM[1] = A_1_;
  assign A_1_ = A[1];
  assign SUM[0] = A_0_;
  assign A_0_ = A[0];

  XOR2X1 U1 ( .A(A[31]), .B(carry_31_), .Y(SUM[31]) );
  AND2X1 U2 ( .A(A[30]), .B(carry_30_), .Y(carry_31_) );
  XOR2X1 U3 ( .A(carry_30_), .B(A[30]), .Y(SUM[30]) );
  AND2X1 U4 ( .A(A[29]), .B(carry_29_), .Y(carry_30_) );
  XOR2X1 U5 ( .A(carry_29_), .B(A[29]), .Y(SUM[29]) );
  AND2X1 U6 ( .A(A[28]), .B(carry_28_), .Y(carry_29_) );
  XOR2X1 U7 ( .A(carry_28_), .B(A[28]), .Y(SUM[28]) );
  AND2X1 U8 ( .A(A[27]), .B(carry_27_), .Y(carry_28_) );
  XOR2X1 U9 ( .A(carry_27_), .B(A[27]), .Y(SUM[27]) );
  AND2X1 U10 ( .A(A[26]), .B(carry_26_), .Y(carry_27_) );
  XOR2X1 U11 ( .A(carry_26_), .B(A[26]), .Y(SUM[26]) );
  AND2X1 U12 ( .A(A[25]), .B(carry_25_), .Y(carry_26_) );
  XOR2X1 U13 ( .A(carry_25_), .B(A[25]), .Y(SUM[25]) );
  AND2X1 U14 ( .A(A[24]), .B(carry_24_), .Y(carry_25_) );
  XOR2X1 U15 ( .A(carry_24_), .B(A[24]), .Y(SUM[24]) );
  AND2X1 U16 ( .A(A[23]), .B(carry_23_), .Y(carry_24_) );
  XOR2X1 U17 ( .A(carry_23_), .B(A[23]), .Y(SUM[23]) );
  AND2X1 U18 ( .A(A[22]), .B(carry_22_), .Y(carry_23_) );
  XOR2X1 U19 ( .A(carry_22_), .B(A[22]), .Y(SUM[22]) );
  AND2X1 U20 ( .A(A[21]), .B(carry_21_), .Y(carry_22_) );
  XOR2X1 U21 ( .A(carry_21_), .B(A[21]), .Y(SUM[21]) );
  AND2X1 U22 ( .A(A[20]), .B(carry_20_), .Y(carry_21_) );
  XOR2X1 U23 ( .A(carry_20_), .B(A[20]), .Y(SUM[20]) );
  AND2X1 U24 ( .A(A[19]), .B(carry_19_), .Y(carry_20_) );
  XOR2X1 U25 ( .A(carry_19_), .B(A[19]), .Y(SUM[19]) );
  AND2X1 U26 ( .A(A[18]), .B(carry_18_), .Y(carry_19_) );
  XOR2X1 U27 ( .A(carry_18_), .B(A[18]), .Y(SUM[18]) );
  AND2X1 U28 ( .A(A[17]), .B(carry_17_), .Y(carry_18_) );
  XOR2X1 U29 ( .A(carry_17_), .B(A[17]), .Y(SUM[17]) );
  AND2X1 U30 ( .A(A[16]), .B(carry_16_), .Y(carry_17_) );
  XOR2X1 U31 ( .A(carry_16_), .B(A[16]), .Y(SUM[16]) );
  AND2X1 U32 ( .A(A[15]), .B(carry_15_), .Y(carry_16_) );
  XOR2X1 U33 ( .A(carry_15_), .B(A[15]), .Y(SUM[15]) );
  AND2X1 U34 ( .A(A[14]), .B(carry_14_), .Y(carry_15_) );
  XOR2X1 U35 ( .A(carry_14_), .B(A[14]), .Y(SUM[14]) );
  AND2X1 U36 ( .A(A[13]), .B(carry_13_), .Y(carry_14_) );
  XOR2X1 U37 ( .A(carry_13_), .B(A[13]), .Y(SUM[13]) );
  AND2X1 U38 ( .A(A[12]), .B(carry_12_), .Y(carry_13_) );
  XOR2X1 U39 ( .A(carry_12_), .B(A[12]), .Y(SUM[12]) );
  AND2X1 U40 ( .A(A[11]), .B(carry_11_), .Y(carry_12_) );
  XOR2X1 U41 ( .A(carry_11_), .B(A[11]), .Y(SUM[11]) );
  AND2X1 U42 ( .A(A[10]), .B(carry_10_), .Y(carry_11_) );
  XOR2X1 U43 ( .A(carry_10_), .B(A[10]), .Y(SUM[10]) );
  AND2X1 U44 ( .A(A[9]), .B(carry_9_), .Y(carry_10_) );
  XOR2X1 U45 ( .A(carry_9_), .B(A[9]), .Y(SUM[9]) );
  AND2X1 U46 ( .A(A[8]), .B(carry_8_), .Y(carry_9_) );
  XOR2X1 U47 ( .A(carry_8_), .B(A[8]), .Y(SUM[8]) );
  AND2X1 U48 ( .A(A[7]), .B(carry_7_), .Y(carry_8_) );
  XOR2X1 U49 ( .A(carry_7_), .B(A[7]), .Y(SUM[7]) );
  AND2X1 U50 ( .A(A[6]), .B(carry_6_), .Y(carry_7_) );
  XOR2X1 U51 ( .A(carry_6_), .B(A[6]), .Y(SUM[6]) );
  AND2X1 U52 ( .A(A[5]), .B(carry_5_), .Y(carry_6_) );
  XOR2X1 U53 ( .A(carry_5_), .B(A[5]), .Y(SUM[5]) );
  AND2X1 U54 ( .A(A[4]), .B(carry_4_), .Y(carry_5_) );
  XOR2X1 U55 ( .A(carry_4_), .B(A[4]), .Y(SUM[4]) );
  AND2X1 U56 ( .A(A[3]), .B(A[2]), .Y(carry_4_) );
  XOR2X1 U57 ( .A(A[2]), .B(A[3]), .Y(SUM[3]) );
  INVX1 U58 ( .A(A[2]), .Y(SUM[2]) );
endmodule


module program_counter2 ( next_pc, rst, clk );
  output [0:31] next_pc;
  input rst, clk;
  wire   next_pc37_0_, next_pc37_1_, next_pc37_2_, next_pc37_3_, next_pc37_4_,
         next_pc37_5_, next_pc37_6_, next_pc37_7_, next_pc37_8_, next_pc37_9_,
         next_pc37_10_, next_pc37_11_, next_pc37_12_, next_pc37_13_,
         next_pc37_14_, next_pc37_15_, next_pc37_16_, next_pc37_17_,
         next_pc37_18_, next_pc37_19_, next_pc37_20_, next_pc37_21_,
         next_pc37_22_, next_pc37_23_, next_pc37_24_, next_pc37_25_,
         next_pc37_26_, next_pc37_27_, next_pc37_28_, next_pc37_29_,
         next_pc37_30_, next_pc37_31_, n49_2_, next_pc45_0_, next_pc45_2_,
         next_pc45_3_, next_pc45_4_, next_pc45_5_, next_pc45_6_, next_pc45_7_,
         next_pc45_8_, next_pc45_9_, next_pc45_10_, next_pc45_11_,
         next_pc45_12_, next_pc45_13_, next_pc45_14_, next_pc45_15_,
         next_pc45_16_, next_pc45_17_, next_pc45_18_, next_pc45_19_,
         next_pc45_20_, next_pc45_21_, next_pc45_22_, next_pc45_23_,
         next_pc45_24_, next_pc45_25_, next_pc45_26_, next_pc45_27_,
         next_pc45_28_, next_pc45_29_, next_pc45_30_, next_pc45_31_, n56,
         SYNOPSYS_UNCONNECTED_1;

  DFFPOSX1 next_pc_reg_31_ ( .D(next_pc37_31_), .CLK(clk), .Q(next_pc[31]) );
  DFFPOSX1 next_pc_reg_30_ ( .D(next_pc37_30_), .CLK(clk), .Q(next_pc[30]) );
  DFFPOSX1 next_pc_reg_29_ ( .D(next_pc37_29_), .CLK(clk), .Q(next_pc[29]) );
  DFFPOSX1 next_pc_reg_28_ ( .D(next_pc37_28_), .CLK(clk), .Q(next_pc[28]) );
  DFFPOSX1 next_pc_reg_27_ ( .D(next_pc37_27_), .CLK(clk), .Q(next_pc[27]) );
  DFFPOSX1 next_pc_reg_26_ ( .D(next_pc37_26_), .CLK(clk), .Q(next_pc[26]) );
  DFFPOSX1 next_pc_reg_25_ ( .D(next_pc37_25_), .CLK(clk), .Q(next_pc[25]) );
  DFFPOSX1 next_pc_reg_24_ ( .D(next_pc37_24_), .CLK(clk), .Q(next_pc[24]) );
  DFFPOSX1 next_pc_reg_23_ ( .D(next_pc37_23_), .CLK(clk), .Q(next_pc[23]) );
  DFFPOSX1 next_pc_reg_22_ ( .D(next_pc37_22_), .CLK(clk), .Q(next_pc[22]) );
  DFFPOSX1 next_pc_reg_21_ ( .D(next_pc37_21_), .CLK(clk), .Q(next_pc[21]) );
  DFFPOSX1 next_pc_reg_20_ ( .D(next_pc37_20_), .CLK(clk), .Q(next_pc[20]) );
  DFFPOSX1 next_pc_reg_19_ ( .D(next_pc37_19_), .CLK(clk), .Q(next_pc[19]) );
  DFFPOSX1 next_pc_reg_18_ ( .D(next_pc37_18_), .CLK(clk), .Q(next_pc[18]) );
  DFFPOSX1 next_pc_reg_17_ ( .D(next_pc37_17_), .CLK(clk), .Q(next_pc[17]) );
  DFFPOSX1 next_pc_reg_16_ ( .D(next_pc37_16_), .CLK(clk), .Q(next_pc[16]) );
  DFFPOSX1 next_pc_reg_15_ ( .D(next_pc37_15_), .CLK(clk), .Q(next_pc[15]) );
  DFFPOSX1 next_pc_reg_14_ ( .D(next_pc37_14_), .CLK(clk), .Q(next_pc[14]) );
  DFFPOSX1 next_pc_reg_13_ ( .D(next_pc37_13_), .CLK(clk), .Q(next_pc[13]) );
  DFFPOSX1 next_pc_reg_12_ ( .D(next_pc37_12_), .CLK(clk), .Q(next_pc[12]) );
  DFFPOSX1 next_pc_reg_11_ ( .D(next_pc37_11_), .CLK(clk), .Q(next_pc[11]) );
  DFFPOSX1 next_pc_reg_10_ ( .D(next_pc37_10_), .CLK(clk), .Q(next_pc[10]) );
  DFFPOSX1 next_pc_reg_9_ ( .D(next_pc37_9_), .CLK(clk), .Q(next_pc[9]) );
  DFFPOSX1 next_pc_reg_8_ ( .D(next_pc37_8_), .CLK(clk), .Q(next_pc[8]) );
  DFFPOSX1 next_pc_reg_7_ ( .D(next_pc37_7_), .CLK(clk), .Q(next_pc[7]) );
  DFFPOSX1 next_pc_reg_6_ ( .D(next_pc37_6_), .CLK(clk), .Q(next_pc[6]) );
  DFFPOSX1 next_pc_reg_5_ ( .D(next_pc37_5_), .CLK(clk), .Q(next_pc[5]) );
  DFFPOSX1 next_pc_reg_4_ ( .D(next_pc37_4_), .CLK(clk), .Q(next_pc[4]) );
  DFFPOSX1 next_pc_reg_3_ ( .D(next_pc37_3_), .CLK(clk), .Q(next_pc[3]) );
  DFFPOSX1 next_pc_reg_2_ ( .D(next_pc37_2_), .CLK(clk), .Q(next_pc[2]) );
  DFFPOSX1 next_pc_reg_1_ ( .D(next_pc37_1_), .CLK(clk), .Q(next_pc[1]) );
  DFFPOSX1 next_pc_reg_0_ ( .D(next_pc37_0_), .CLK(clk), .Q(next_pc[0]) );
  program_counter2_DW01_add_0 add_60 ( .A(next_pc), .B({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b1, 1'b0, 1'b0}), .CI(1'b0), .SUM({next_pc45_0_, n49_2_, 
        next_pc45_2_, next_pc45_3_, next_pc45_4_, next_pc45_5_, next_pc45_6_, 
        next_pc45_7_, next_pc45_8_, next_pc45_9_, next_pc45_10_, next_pc45_11_, 
        next_pc45_12_, next_pc45_13_, next_pc45_14_, next_pc45_15_, 
        next_pc45_16_, next_pc45_17_, next_pc45_18_, next_pc45_19_, 
        next_pc45_20_, next_pc45_21_, next_pc45_22_, next_pc45_23_, 
        next_pc45_24_, next_pc45_25_, next_pc45_26_, next_pc45_27_, 
        next_pc45_28_, next_pc45_29_, next_pc45_30_, next_pc45_31_}), .CO(
        SYNOPSYS_UNCONNECTED_1) );
  AND2X1 U50 ( .A(next_pc45_9_), .B(n56), .Y(next_pc37_9_) );
  AND2X1 U51 ( .A(next_pc45_8_), .B(n56), .Y(next_pc37_8_) );
  AND2X1 U52 ( .A(next_pc45_7_), .B(n56), .Y(next_pc37_7_) );
  AND2X1 U53 ( .A(next_pc45_6_), .B(n56), .Y(next_pc37_6_) );
  AND2X1 U54 ( .A(next_pc45_5_), .B(n56), .Y(next_pc37_5_) );
  AND2X1 U55 ( .A(next_pc45_4_), .B(n56), .Y(next_pc37_4_) );
  AND2X1 U56 ( .A(next_pc45_3_), .B(n56), .Y(next_pc37_3_) );
  AND2X1 U57 ( .A(next_pc45_31_), .B(n56), .Y(next_pc37_31_) );
  AND2X1 U58 ( .A(next_pc45_30_), .B(n56), .Y(next_pc37_30_) );
  AND2X1 U59 ( .A(next_pc45_2_), .B(n56), .Y(next_pc37_2_) );
  AND2X1 U60 ( .A(next_pc45_29_), .B(n56), .Y(next_pc37_29_) );
  AND2X1 U61 ( .A(next_pc45_28_), .B(n56), .Y(next_pc37_28_) );
  AND2X1 U62 ( .A(next_pc45_27_), .B(n56), .Y(next_pc37_27_) );
  AND2X1 U63 ( .A(next_pc45_26_), .B(n56), .Y(next_pc37_26_) );
  AND2X1 U64 ( .A(next_pc45_25_), .B(n56), .Y(next_pc37_25_) );
  AND2X1 U65 ( .A(next_pc45_24_), .B(n56), .Y(next_pc37_24_) );
  AND2X1 U66 ( .A(next_pc45_23_), .B(n56), .Y(next_pc37_23_) );
  AND2X1 U67 ( .A(next_pc45_22_), .B(n56), .Y(next_pc37_22_) );
  AND2X1 U68 ( .A(next_pc45_21_), .B(n56), .Y(next_pc37_21_) );
  AND2X1 U69 ( .A(next_pc45_20_), .B(n56), .Y(next_pc37_20_) );
  AND2X1 U70 ( .A(n49_2_), .B(n56), .Y(next_pc37_1_) );
  AND2X1 U71 ( .A(next_pc45_19_), .B(n56), .Y(next_pc37_19_) );
  AND2X1 U72 ( .A(next_pc45_18_), .B(n56), .Y(next_pc37_18_) );
  AND2X1 U73 ( .A(next_pc45_17_), .B(n56), .Y(next_pc37_17_) );
  AND2X1 U74 ( .A(next_pc45_16_), .B(n56), .Y(next_pc37_16_) );
  AND2X1 U75 ( .A(next_pc45_15_), .B(n56), .Y(next_pc37_15_) );
  AND2X1 U76 ( .A(next_pc45_14_), .B(n56), .Y(next_pc37_14_) );
  AND2X1 U77 ( .A(next_pc45_13_), .B(n56), .Y(next_pc37_13_) );
  AND2X1 U78 ( .A(next_pc45_12_), .B(n56), .Y(next_pc37_12_) );
  AND2X1 U79 ( .A(next_pc45_11_), .B(n56), .Y(next_pc37_11_) );
  AND2X1 U80 ( .A(next_pc45_10_), .B(n56), .Y(next_pc37_10_) );
  AND2X1 U81 ( .A(next_pc45_0_), .B(n56), .Y(next_pc37_0_) );
  INVX1 U82 ( .A(rst), .Y(n56) );
endmodule

