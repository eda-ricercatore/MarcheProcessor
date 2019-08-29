#####################################################################
#
# This is written by Zhiyang Ong
# and Andrew Mattheisen
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

	
# Synthesize the shift-and-add multiplier
jpdt:
	@echo ==Synthesize the shift-and-add multiplier
	dc_shell-t -f script/jpdt.tcl	
	
	
	
	
	
# Synthesize the shift-and-add multiplier
unsmul:
	@echo ==Synthesize the shift-and-add multiplier
	dc_shell-t -f script/jpdt2.tcl	


# Synthesize the Booth multiplier
arrmul:
	@echo ==Synthesize the Booth multiplier
	dc_shell-t -f script/arrmul.tcl	



# Synthesize the Booth multiplier
arrmul1:
	@echo ==Synthesize the Booth multiplier
	dc_shell-t -f script/arrmul1.tcl	


# Synthesize the unsigned shift-and-add multiplier
andy:
	@echo ==Synthesize the unsigned shift-and-add multiplier
	dc_shell-t -f script/unsmul.tcl	



# Synthesize the cpu
cpu:
	@echo ==Synthesize the cpu
	dc_shell-t -f script/cpu.tcl	



# Synthesize the shifter
shift:
	@echo ==Synthesize the shifter
	dc_shell-t -f script/shift.tcl	
