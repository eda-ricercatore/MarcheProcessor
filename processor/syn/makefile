#####################################################################
#
# This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
# and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
# for EE577b Troy WideWord Processor Project
#
#####################################################################


# Synthesize the program counter
pc:
	@echo ==Synthesize the program counter
	dc_shell-t -f script/progcounter.tcl


# Synthesize the program counter
# without the current program counter value as an input
pc2:
	@echo ==Synthesize the program counter #2
	dc_shell-t -f script/progcounter2.tcl



# Synthesize the advanced register file
regfile:
	@echo ==Synthesize the advanced register file
	dc_shell-t -f script/regfileww.tcl




# Synthesize the sequence detector
seqdec:
	@echo ==Test the sequence detector
	#dc_shell-t ; "source script/seq_detect.tcl"


# Synthesize the alu
alu:
	@echo ==Synthesize the ALU
	dc_shell-t -f script/alu.tcl
	
	
# Synthesize the multiplier
mult:
	@echo ==Synthesize the multiplier
	dc_shell-t -f script/mult.tcl

	
	
	
	
