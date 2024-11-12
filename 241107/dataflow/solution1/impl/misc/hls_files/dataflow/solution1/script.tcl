############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project dataflow
set_top dataflow
add_files dataflow_ex_5.cpp
add_files -tb dataflow_tb.cpp
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 100MHz -name default
config_export -format xo -rtl verilog -vivado_clock 100MHz
#source "./dataflow/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -wave_debug -trace_level all
export_design -rtl verilog -format xo
