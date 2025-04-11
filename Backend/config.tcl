
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set ::env(DESIGN_NAME) cpu
set ::env(VERILOG_FILES) ../Verilog/RTL_SOLUTION3_pipeline_basic_MULT2/*.v
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "clk"
set ::env(CLOCK_PERIOD) 100
set ::env(CLOCK_TREE_SYNTH) 1

set ::env(DESIGN_IS_CORE) 1      
set ::env(SYNTH_MAX_FANOUT) 30

set ::env(SYNTH_STRATEGY) "AREA 0"
set ::env(SYNTH_NO_FLAT) 1

# Connect the layout files and abstracts
# Connect the blackbox information and timing data
set ::env(EXTRA_LEFS)      [list OpenRAM_output/sky130_sram_2rw_32x128_32.lef OpenRAM_output/sky130_sram_2rw_64x128_64.lef]
set ::env(EXTRA_GDS_FILES) [list OpenRAM_output/sky130_sram_2rw_64x128_64.gds OpenRAM_output/sky130_sram_2rw_32x128_32.gds]
set ::env(EXTRA_LIBS)      [list OpenRAM_output/sky130_sram_2rw_64x128_64_TT_1p8V_25C.lib OpenRAM_output/sky130_sram_2rw_32x128_32_TT_1p8V_25C.lib]

set ::env(BASE_SDC_FILE) H05d4a.sdc

# SRAM config
set ::env(VDD_NETS) "vccd1"
set ::env(GND_NETS) "vssd1"
set ::env(FP_PDN_MACRO_HOOKS) "\
 instruction_memory.*.dram_inst      vccd1 vssd1 vccd1 vssd1,\
 data_memory.*.spad_inst      vccd1 vssd1 vccd1 vssd1"

# Some floorplan empirical parameters
set ::env(FP_CORE_UTIL) 35
set ::env(FP_SIZING) relative
set ::env(PL_MACRO_CHANNEL) [list 80 80]
