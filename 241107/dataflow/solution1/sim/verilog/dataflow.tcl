
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set input_r__weight__output_r__return_group [add_wave_group input_r__weight__output_r__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_dataflow_top/AESL_inst_dataflow/interrupt -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_BRESP -into $input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_BREADY -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_BVALID -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_RRESP -into $input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_RDATA -into $input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_RREADY -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_RVALID -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_ARREADY -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_ARVALID -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_ARADDR -into $input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_WSTRB -into $input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_WDATA -into $input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_WREADY -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_WVALID -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_AWREADY -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_AWVALID -into $input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/s_axi_control_AWADDR -into $input_r__weight__output_r__return_group -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set output_r_group [add_wave_group output_r(axi_master) -into $coutputgroup]
set rdata_group [add_wave_group "Read Channel" -into $output_r_group]
set wdata_group [add_wave_group "Write Channel" -into $output_r_group]
set ctrl_group [add_wave_group "Handshakes" -into $output_r_group]
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_BUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_BID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_BRESP -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_RRESP -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_RUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_RID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_RDATA -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARREGION -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARQOS -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARPROT -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARBURST -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARLEN -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARADDR -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_WUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_WID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_WSTRB -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_WDATA -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWREGION -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWQOS -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWPROT -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWBURST -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWLEN -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWADDR -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem1_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set weight_group [add_wave_group weight(axi_master) -into $cinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $weight_group]
set wdata_group [add_wave_group "Write Channel" -into $weight_group]
set ctrl_group [add_wave_group "Handshakes" -into $weight_group]
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_BUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_BID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_BRESP -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_RRESP -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_RUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_RID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_RDATA -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARREGION -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARQOS -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARPROT -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARBURST -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARLEN -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARADDR -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_WUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_WID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_WSTRB -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_WDATA -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWREGION -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWQOS -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWPROT -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWBURST -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWLEN -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWADDR -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem2_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set input_r_group [add_wave_group input_r(axi_master) -into $cinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $input_r_group]
set wdata_group [add_wave_group "Write Channel" -into $input_r_group]
set ctrl_group [add_wave_group "Handshakes" -into $input_r_group]
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_BUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_BID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_BRESP -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_RRESP -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_RUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_RID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_RDATA -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARREGION -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARQOS -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARPROT -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARBURST -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARLEN -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARADDR -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_WUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_WID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_WSTRB -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_WDATA -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWREGION -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWQOS -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWPROT -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWBURST -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWLEN -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWADDR -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/AESL_inst_dataflow/m_axi_gmem0_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake(internal)" -into $designtopgroup]
add_wave /apatb_dataflow_top/AESL_inst_dataflow/ap_done -into $blocksiggroup
add_wave /apatb_dataflow_top/AESL_inst_dataflow/ap_idle -into $blocksiggroup
add_wave /apatb_dataflow_top/AESL_inst_dataflow/ap_ready -into $blocksiggroup
add_wave /apatb_dataflow_top/AESL_inst_dataflow/ap_start -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_dataflow_top/AESL_inst_dataflow/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_dataflow_top/AESL_inst_dataflow/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_dataflow_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_dataflow_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_dataflow_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_dataflow_top/LENGTH_input_r -into $tb_portdepth_group -radix hex
add_wave /apatb_dataflow_top/LENGTH_weight -into $tb_portdepth_group -radix hex
add_wave /apatb_dataflow_top/LENGTH_output_r -into $tb_portdepth_group -radix hex
add_wave /apatb_dataflow_top/LENGTH_gmem0 -into $tb_portdepth_group -radix hex
add_wave /apatb_dataflow_top/LENGTH_gmem1 -into $tb_portdepth_group -radix hex
add_wave /apatb_dataflow_top/LENGTH_gmem2 -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_input_r__weight__output_r__return_group [add_wave_group input_r__weight__output_r__return(axi_slave) -into $tbcinoutgroup]
add_wave /apatb_dataflow_top/control_INTERRUPT -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_BRESP -into $tb_input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/control_BREADY -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_BVALID -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_RRESP -into $tb_input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/control_RDATA -into $tb_input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/control_RREADY -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_RVALID -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_ARREADY -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_ARVALID -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_ARADDR -into $tb_input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/control_WSTRB -into $tb_input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/control_WDATA -into $tb_input_r__weight__output_r__return_group -radix hex
add_wave /apatb_dataflow_top/control_WREADY -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_WVALID -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_AWREADY -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_AWVALID -into $tb_input_r__weight__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/control_AWADDR -into $tb_input_r__weight__output_r__return_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_output_r_group [add_wave_group output_r(axi_master) -into $tbcoutputgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_output_r_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_output_r_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_output_r_group]
add_wave /apatb_dataflow_top/gmem1_BUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_BID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_BRESP -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_RRESP -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_RUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_RID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_RDATA -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_ARUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARREGION -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARQOS -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARPROT -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARBURST -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARLEN -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARADDR -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_WUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_WID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_WSTRB -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_WDATA -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_AWUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWREGION -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWQOS -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWPROT -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWBURST -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWLEN -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWADDR -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem1_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem1_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_weight_group [add_wave_group weight(axi_master) -into $tbcinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_weight_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_weight_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_weight_group]
add_wave /apatb_dataflow_top/gmem2_BUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_BID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_BRESP -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_RRESP -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_RUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_RID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_RDATA -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_ARUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARREGION -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARQOS -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARPROT -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARBURST -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARLEN -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARADDR -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_WUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_WID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_WSTRB -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_WDATA -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_AWUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWREGION -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWQOS -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWPROT -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWBURST -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWLEN -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWADDR -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem2_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem2_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set tb_input_r_group [add_wave_group input_r(axi_master) -into $tbcinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_input_r_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_input_r_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_input_r_group]
add_wave /apatb_dataflow_top/gmem0_BUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_BID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_BRESP -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_RRESP -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_RUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_RID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_RDATA -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_ARUSER -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARREGION -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARQOS -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARPROT -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARBURST -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARLEN -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARID -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARADDR -into $rdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_WUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_WID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_WSTRB -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_WDATA -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_AWUSER -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWREGION -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWQOS -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWPROT -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWBURST -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWLEN -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWID -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWADDR -into $wdata_group -radix hex
add_wave /apatb_dataflow_top/gmem0_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_dataflow_top/gmem0_AWVALID -into $ctrl_group -color #ffff00 -radix hex
save_wave_config dataflow.wcfg
run all

