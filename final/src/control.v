// zhiyang ong zhiyang.ong@gmail.com
// andrew mattheisen amattheisen@gmail.com

// The next line is only used for module synthesis
//`include "~/ee577b/syn/src/control.h"

module control(instr, 
   aluop, ww, 
   memEn, memWrEn, maddr, wbyteen,
   regop, rrdaddra, rrdaddrb, rwraddrd,
   reginmuxop, 
   aluinmuxop,
   immediate);

   // INPUTS
   input [0:31] instr;
   
   // OUTPUTS
   output [0:4] aluop, rrdaddra, rrdaddrb, rwraddrd;
   output [0:2] regop;
   output [0:1] ww;
   output [0:20] maddr;
   output memEn, memWrEn;
   output reginmuxop, aluinmuxop;
   output [0:15] wbyteen;
   output [0:127] immediate;
   
   // REGISTERS
   reg [0:4] aluop, rrdaddra, rrdaddrb, rwraddrd;
   reg [0:2] ppp, regop;
   reg [0:1] ww, memop;
   reg [0:20] maddr;
   reg memEn, memWrEn;
   reg reginmuxop, aluinmuxop;
   reg [0:15] wbyteen;
   reg [0:127] immediate;
   
   // PARAMETERS
   parameter zero = 1'b0;
   parameter one = 1'b1;

   always @ (ppp or ww or instr) // determine wbyteen
       begin
       if (instr[5]== 1'b1)
       begin
           wbyteen=16'b1111111111111111;
       end
       else if (ppp == `aa)
           wbyteen=16'b1111111111111111;
       else if (ppp == `uu)
           wbyteen=16'b1111111100000000;
       else if (ppp == `dd)
           wbyteen=16'b0000000011111111;
       else if (ppp == `ee)
           begin
           if (ww==`w8)
               wbyteen=16'b1010101010101010;
           else if (ww==`w16)
               wbyteen=16'b1100110011001100;
           else if (ww==`w32)
               wbyteen=16'b1111000011110000;
           else // default
               wbyteen=16'b0;
           end
        else if (ppp == `oo)
           begin
           if (ww==`w8)
               wbyteen=16'b0101010101010101;
           else if (ww==`w16)
               wbyteen=16'b0011001100110011;
           else if (ww==`w32)
               wbyteen=16'b0000111100001111;
           else // default
               wbyteen=16'b0;
           end
        else if (ppp == `mm)
           begin
           if (ww==`w8)
               wbyteen=16'b1000000000000000;
           else if (ww==`w16)
               wbyteen=16'b1100000000000000;
           else if (ww==`w32)
               wbyteen=16'b1111000000000000;
           else // default
               wbyteen=16'b0;
           end
        else if (ppp == `ll)
           begin
           if (ww==`w8)
               wbyteen=16'b0000000000000001;
           else if (ww==`w16)
               wbyteen=16'b0000000000000011;
           else if (ww==`w32)
               wbyteen=16'b0000000000001111;
           else // default
               wbyteen=16'b0;
           end
        else // default
           wbyteen=16'b0;
      end //always @ (ppp or ww)

   always @ (instr)
       begin
       immediate={instr[16:20], {123{zero}}};
       ppp=instr[21:23];
       ww=instr[24:25];
       maddr=instr[11:31];
       rwraddrd=instr[6:10];
       if (instr[2] == 1'b1) // => instr is wmv
           begin
           aluop=instr[26:31]; // alu control
           regop=`rd1wr1; // reg control
           rrdaddra=instr[11:15];
           rrdaddrb=instr[16:20];
           //memop=`memnop; // mem control
           memEn=zero;
           memWrEn=zero;
           aluinmuxop=one; // mux control
           reginmuxop=zero;
           end // if (instr[2] == 1'b1)

       else if (instr[3] == 1'b1) // must examine bits 0-5
           begin
           if ({instr[26:28], instr[31]} == 4'b0101) // immediate  shift
               begin
               aluop=instr[26:31]; // alu control
               regop=`rd1wr1; // reg control
               rrdaddra=instr[11:15];
               rrdaddrb=instr[16:20];
               //memop=`memnop; // mem control
               memEn=zero;
               memWrEn=zero;
               aluinmuxop=one; // mux control
               reginmuxop=zero;
               end
           else if (instr[26:31]==6'b001000) // instr is wnot
               begin
               aluop=instr[26:31]; // alu control
               regop=`rd1wr1; // reg control
               rrdaddra=instr[11:15];
               rrdaddrb=instr[16:20];
               //memop=`memnop; // mem control
               memEn=zero;
               memWrEn=zero;
               aluinmuxop=one; // mux control
               reginmuxop=zero;
               end
           else // all other commands
               begin
               aluop=instr[26:31]; // alu control
               regop=`rd2wr1; // reg control
               rrdaddra=instr[11:15];
               rrdaddrb=instr[16:20];
               //memop=`memnop;  // mem control
               memEn=zero;
               memWrEn=zero;
               aluinmuxop=zero; // mux control
               reginmuxop=zero;
               end
           end // else if (instr[3] == 1'b1)
       else if (instr[4]==1'b1) // => instr is wst
           begin
           aluop=`alunop; // alu control
           regop=`rd2wr0; // reg control
           rrdaddra=instr[6:10]; // note this is special
           rrdaddrb=instr[6:10]; // note this is special
           //memop=`memwst;  // mem control
           memEn=one;
           memWrEn=one;
           aluinmuxop=zero; // mux control
           reginmuxop=zero;
           end // else if (instr[4]==1'b1)
       else if (instr[5]==1'b1) // => instr is wld
           begin
           aluop=`alunop; // alu control
           regop=`rd0wr1; // reg control
           rrdaddra=instr[11:15];
           rrdaddrb=instr[16:20];
           //memop=`memwld;  // mem control
           memEn=one;
           memWrEn=zero;
           aluinmuxop=zero; // mux control
           reginmuxop=one;
           end // else if (instr[5]==1'b1)   

       else // => instr is NOP
           begin
           aluop=`alunop;
           regop=`regnop;
           rrdaddra=instr[11:15];
           rrdaddrb=instr[16:20];
           //memop=`memnop;
           memEn=zero;
           memWrEn=zero;
           reginmuxop=zero;
           aluinmuxop=zero;
           end // else
       end // always @ (instr)

endmodule             
           

