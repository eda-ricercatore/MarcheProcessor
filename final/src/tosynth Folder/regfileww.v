 // This is written by Zhiyang Ong
 //and Andrew Mattheisen
 //for EE577b Troy WideWord Processor Project


module regfileww(rd1data, rd2data, wrdata, rd1addr, rd2addr, wraddr,
	rd1en, rd2en, wren, wbyteen, clk);

	// OUTPUTS
	output [0:127] rd1data, rd2data;

	// INPUTS
	input [0:127] wrdata;
	input clk;
	input wren;
	input rd1en, rd2en;
	input [0:4] wraddr, rd1addr, rd2addr;
	input [0:15] wbyteen;
	
	reg [0:127] rd1data, rd2data;
	reg [0:127] reg_file [0:31];
	reg [0:127] result, temp;
	
	
	// ===============================================================
	
	always @(posedge clk)
	begin
		
		result=128'b0;
		temp=128'b0;
		rd1data=128'b0;
		rd2data=128'b0;
				
		if(wren)
		begin
			temp=reg_file[wraddr];
			result[0:7]=(wbyteen[0]==1'b1)? wrdata[0:7]:temp[0:7];
			result[8:15]=(wbyteen[1]==1'b1)? wrdata[8:15]:temp[8:15];
			result[16:23]=(wbyteen[2]==1'b1)? wrdata[16:23]:temp[16:23];
			result[24:31]=(wbyteen[3]==1'b1)? wrdata[24:31]:temp[24:31];
			result[32:39]=(wbyteen[4]==1'b1)? wrdata[32:39]:temp[32:39];
			result[40:47]=(wbyteen[5]==1'b1)? wrdata[40:47]:temp[40:47];
			result[48:55]=(wbyteen[6]==1'b1)? wrdata[48:55]:temp[48:55];
			result[56:63]=(wbyteen[7]==1'b1)? wrdata[56:63]:temp[56:63];
			result[64:71]=(wbyteen[8]==1'b1)? wrdata[64:71]:temp[64:71];
			result[72:79]=(wbyteen[9]==1'b1)? wrdata[72:79]:temp[72:79];
			result[80:87]=(wbyteen[10]==1'b1)? wrdata[80:87]:temp[80:87];
			result[88:95]=(wbyteen[11]==1'b1)? wrdata[88:95]:temp[88:95];
			result[96:103]=(wbyteen[12]==1'b1)? wrdata[96:103]:temp[96:103];
			result[104:111]=(wbyteen[13]==1'b1)? wrdata[104:111]:temp[104:111];
			result[112:119]=(wbyteen[14]==1'b1)? wrdata[112:119]:temp[112:119];
			result[120:127]=(wbyteen[15]==1'b1)? wrdata[120:127]:temp[120:127];
			reg_file[wraddr] = result;
		end
		
		// before synthesis, change the zs to 0!!!
		rd1data=rd1en?reg_file[rd1addr]:128'd0;
		rd2data=rd2en?reg_file[rd2addr]:128'd0;
	end
	
	
	
	
endmodule
