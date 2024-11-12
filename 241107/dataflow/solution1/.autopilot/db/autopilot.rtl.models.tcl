set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME dataflow_entry_proc}
  {SRCNAME readDram MODELNAME readDram RTLNAME dataflow_readDram}
  {SRCNAME weightDram MODELNAME weightDram RTLNAME dataflow_weightDram}
  {SRCNAME run_PE MODELNAME run_PE RTLNAME dataflow_run_PE
    SUBMODULES {
      {MODELNAME dataflow_mux_22_8_1_1 RTLNAME dataflow_mux_22_8_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dataflow_mul_8s_8s_16_1_1 RTLNAME dataflow_mul_8s_8s_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dataflow_run_PE_output_reg_RAM_AUTO_1R1W RTLNAME dataflow_run_PE_output_reg_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dataflow_run_PE_output_temp_0_RAM_AUTO_1R1W RTLNAME dataflow_run_PE_output_temp_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME writeDram MODELNAME writeDram RTLNAME dataflow_writeDram}
  {SRCNAME dataflow_in_loop_VITIS_LOOP_112_1 MODELNAME dataflow_in_loop_VITIS_LOOP_112_1 RTLNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1
    SUBMODULES {
      {MODELNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1_input_buf_RAM_AUTO_1R1W_memcore RTLNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1_input_buf_RAM_AUTO_1R1W_memcore BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1_input_buf_RAM_AUTO_1R1W RTLNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1_input_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2}
      {MODELNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1_output_buf_RAM_AUTO_1R1W_memcore RTLNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1_output_buf_RAM_AUTO_1R1W_memcore BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1_output_buf_RAM_AUTO_1R1W RTLNAME dataflow_dataflow_in_loop_VITIS_LOOP_112_1_output_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2}
      {MODELNAME dataflow_fifo_w64_d4_S RTLNAME dataflow_fifo_w64_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME dataflow_fifo_w2_d2_S RTLNAME dataflow_fifo_w2_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
  {SRCNAME dataflow MODELNAME dataflow RTLNAME dataflow IS_TOP 1
    SUBMODULES {
      {MODELNAME dataflow_gmem0_m_axi RTLNAME dataflow_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME dataflow_gmem2_m_axi RTLNAME dataflow_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME dataflow_gmem1_m_axi RTLNAME dataflow_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME dataflow_control_s_axi RTLNAME dataflow_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
