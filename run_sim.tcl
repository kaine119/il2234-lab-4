vlog -sv \
    ./src/ALU.sv ./src/instruction_fsm.sv  ./src/RF.sv ./src/microprocessor.sv \
    ./tb/fake_memory.sv ./tb/fake_rom.sv ./tb/microprocessor_tb.sv

vsim -voptargs=+acc -debugDB work.microprocessor_tb

# Apply clock on 
# force -freeze sim:/RF_tb/clk 1 0, 0 {5 ns} -r 10
# force -freeze sim:/FSM_TB/clk 1 0, 0 {5 ns} -r 10

add wave -position insertpoint  \
sim:/microprocessor_tb/data_mem_read_en \
sim:/microprocessor_tb/data_mem_address \
sim:/microprocessor_tb/data_mem_write_en \
sim:/microprocessor_tb/data_mem_read_data \
sim:/microprocessor_tb/data_mem_write_data \
sim:/microprocessor_tb/instr_read_en \
sim:/microprocessor_tb/instr_read_addr \
sim:/microprocessor_tb/instr_data \
sim:/microprocessor_tb/mpu/rf_read_data_1a

run -all

# add schematic -full sim:/fp_mult_tb/dut
