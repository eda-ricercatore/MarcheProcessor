#####################################################################
#
# This is written by Zhiyang Ong (zhiyango@usc.edu; 6004 9194 12)
# and Andrew Mattheisen (mattheis@usc.edu; 2134 5147 11)
# for EE577b Troy WideWord Processor Project
#
#####################################################################

# Target to compile and simulate the program counter
# Requires the updating the script prog_counter.f
test_pc:
	@echo ==Test the program counter
	ncverilog -f prog_counter.f +gui


# Target to compile and simulate the program counter
# without the current program counter value as an input
# Requires the updating the script prog_counter2.f
test_pc2:
	@echo ==Test the program counter #2
	ncverilog -f prog_counter2.f +gui



# Target to compile and simulate the advanced register file
# Requires the updating the script regfileww.f
test_arf:
	@echo ==Test the advanced register file
	ncverilog -f regfileww.f +gui


# Target to compile and simulate the ALU
# Requires the updating the script alu.f
test_alu:
	@echo ==Test the ALU
	ncverilog -f alu.f +gui


# Target to compile and simulate the ALU (Andy's code
# for shift immediate instructions)
# Requires the updating the script alu_andy.f
test_alu_andy:
	@echo ==Test the ALU (Andy's version)
	ncverilog -f alu_andy.f +gui


# Target to compile and simulate the instruction memory
# Requires the updating the script instrmem.f
test_im:
	@echo ==Test the instruction memory
	ncverilog -f instrmem.f +gui


# Target to compile and simulate the data memory
# Requires the updating the script datamem.f
test_dm:
	@echo ==Test the data memory
	ncverilog -f datamem.f +gui



# Target to compile and simulate the multiplier
# Requires the updating the script mult.f
test_mult:
	@echo ==Test the multiplier
	ncverilog -f mult.f +gui






































# ================================================================
#
#	Make targets for EE 577B Homework 4
#
# ================================================================

# Target to compile and simulate the sequence detector
# Shorter test sequence
# Requires the updating the script seq_detector.f
test_sd1:
	@echo Test the sequence detector
	ncverilog -f seq_detector.f +gui


# Target to compile and simulate the sequence detector
# Longer test sequence
# Requires the updating the script seq_detector2.f
test_sd2:
	@echo Test the sequence detector
	ncverilog -f seq_detector2.f +gui


# Target to compile and simulate the PISO convertor
# Requires the updating the script piso.f
test_pis:
	@echo Test the PISO convertor
	ncverilog -f piso.f +gui


# Target to compile and simulate the SIPO convertor
# Requires the updating the script sipo.f
test_sip:
	@echo Test the SIPO convertor
	ncverilog -f sipo.f +gui


# Target to compile and simulate the register file
# Requires the updating the script regfile.f
test_rfe:
	@echo Test the register file
	ncverilog -f regfile.f +gui


# Target to compile and simulate the FIFO queue
# Requires the updating the script fifo.f
test_fif:
	@echo Test the FIFO queue
	ncverilog -f fifo.f +gui


# Target to compile and simulate the FIFO queue
# Requires the updating the script fifo.f
test_ff2:
	@echo Test the FIFO queue
	ncverilog -f fifo2.f +gui


# Target to compile and simulate the random number generator
# Store the random number in the file testfile.bit
# Requires the updating the script generatedata.f
test_rnd:
	@echo Generate some random numbers
	ncverilog -f generatedata.f +gui



# Dummy target
alicia:
	@echo Run some stuff to test my knowledge of Verilog
	ncverilog -f alicia.f +gui






