			// ======================================================
			integer i;
			integer j;
			
			// Unsigned Multiplication - even subfields
			`aluwmuleu:
			begin
				case(ctrl_ww)
					(`w8+2'b1):
						begin
						// J loops through all even bytes to compute result
						for (j=0;j<8;j=j+1)
							begin
							// extend operand B
							p_pdt8b={{8{1'b0}},reg_B[0+(16*j):7+(16*j)]};
							// extend operand A
							p_pdt8a={{8{1'b0}},reg_A[0+(16*j):7+(16*j)]};
							// i loops through each bit to compute sum due to partial products
							for (i=15; i>7; i=i-1)
								begin
								p_pdt[0+(16*j):15+(16*j)]=p_pdt[0+(16*j):15+(16*j)] 
								+ (p_pdt8a[i]?(p_pdt8b<<(8'd15-i)):16'b0);
								end
							end
						result<=p_pdt;
						end // case (`w8+2'b1)

					(`w16+2'b1):
						begin
						// J loops through all even bytes to compute result
						for (j=0;j<4;j=j+1)
							begin
							// extend operand B
							p_pdt16b={{16{1'b0}},reg_B[0+(32*j):15+(32*j)]};
							// extend operand A
							p_pdt16a={{16{1'b0}},reg_A[0+(32*j):15+(32*j)]};
							// i loops through each bit to compute sum due to partial products
							for (i=31; i>15; i=i-1)
								begin
								p_pdt[0+(32*j):31+(32*j)]=p_pdt[0+(32*j):31+(32*j)] 
								+ (p_pdt16a[i]?(p_pdt16b<<(8'd32-i)):32'b0);
								end
							end
						result<=p_pdt;
						end // case (`w16+2'b1)

					default:
						begin
						result<=128'd0;
						end
					endcase // case(ctrl_ww)
			end	 // alumuleu
