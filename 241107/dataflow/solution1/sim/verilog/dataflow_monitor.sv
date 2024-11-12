
`include "dump_file_agent.svh"
`include "csv_file_dump.svh"
`include "sample_agent.svh"
`include "loop_sample_agent.svh"
`include "sample_manager.svh"
`include "nodf_module_interface.svh"
`include "nodf_module_monitor.svh"
`include "df_fifo_interface.svh"
`include "df_fifo_monitor.svh"
`include "df_process_interface.svh"
`include "df_process_monitor.svh"
`include "df_loop_interface.svh"
`include "df_loop_monitor.svh"
`include "seq_loop_interface.svh"
`include "seq_loop_monitor.svh"
`timescale 1ns/1ps

// top module for dataflow related monitors
module dataflow_monitor(
input logic clock,
input logic reset,
input logic finish
);

    df_fifo_intf fifo_intf_1(clock,reset);
    assign fifo_intf_1.rd_en = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.output_r_c_U.if_read & AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.output_r_c_U.if_empty_n;
    assign fifo_intf_1.wr_en = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.output_r_c_U.if_write & AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.output_r_c_U.if_full_n;
    assign fifo_intf_1.fifo_rd_block = ~(AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.output_r_blk_n);
    assign fifo_intf_1.fifo_wr_block = ~(AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.entry_proc_U0.output_r_c_blk_n);
    assign fifo_intf_1.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump fifo_csv_dumper_1;
    csv_file_dump cstatus_csv_dumper_1;
    df_fifo_monitor fifo_monitor_1;
    df_fifo_intf fifo_intf_2(clock,reset);
    assign fifo_intf_2.rd_en = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.tmp_U.if_read & AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.tmp_U.if_empty_n;
    assign fifo_intf_2.wr_en = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.tmp_U.if_write & AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.tmp_U.if_full_n;
    assign fifo_intf_2.fifo_rd_block = 0;
    assign fifo_intf_2.fifo_wr_block = 0;
    assign fifo_intf_2.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump fifo_csv_dumper_2;
    csv_file_dump cstatus_csv_dumper_2;
    df_fifo_monitor fifo_monitor_2;

logic region_0_idle;
logic [31:0] region_0_start_cnt;
logic [31:0] region_0_done_cnt;
assign region_0_idle = (region_0_start_cnt == region_0_done_cnt) && AESL_inst_dataflow.ap_start == 1'b0 ;
always @(posedge clock) begin
    if (reset == 1'b1)
        region_0_start_cnt <= 32'h0;
    else if (AESL_inst_dataflow.ap_start == 1'b1 && AESL_inst_dataflow.ap_ready == 1'b1)
        region_0_start_cnt <= region_0_start_cnt + 32'h1;
    else;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        region_0_done_cnt <= 32'h0;
    else if (AESL_inst_dataflow.ap_done == 1'b1)
        region_0_done_cnt <= region_0_done_cnt + 32'h1;
    else;
end

logic region_1_idle;
logic [31:0] region_1_start_cnt;
logic [31:0] region_1_done_cnt;
assign region_1_idle = (region_1_start_cnt == region_1_done_cnt) && AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_start == 1'b0 ;
always @(posedge clock) begin
    if (reset == 1'b1)
        region_1_start_cnt <= 32'h0;
    else if (AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_start == 1'b1 && AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_ready == 1'b1)
        region_1_start_cnt <= region_1_start_cnt + 32'h1;
    else;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        region_1_done_cnt <= 32'h0;
    else if (AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_done == 1'b1 && AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_continue == 1'b1)
        region_1_done_cnt <= region_1_done_cnt + 32'h1;
    else;
end


    df_process_intf process_intf_1(clock,reset);
    assign process_intf_1.ap_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_start;
    assign process_intf_1.ap_ready = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_ready;
    assign process_intf_1.ap_done = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_done;
    assign process_intf_1.ap_continue = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_continue;
    assign process_intf_1.real_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_start;
    assign process_intf_1.pin_stall = 1'b0;
    assign process_intf_1.pout_stall = 1'b0;
    assign process_intf_1.cin_stall = 1'b0;
    assign process_intf_1.cout_stall = 1'b0;
    assign process_intf_1.region_idle = region_0_idle;
    assign process_intf_1.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_1;
    csv_file_dump pstatus_csv_dumper_1;
    df_process_monitor process_monitor_1;
    df_process_intf process_intf_2(clock,reset);
    assign process_intf_2.ap_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.entry_proc_U0.ap_start;
    assign process_intf_2.ap_ready = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.entry_proc_U0.ap_ready;
    assign process_intf_2.ap_done = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.entry_proc_U0.ap_done;
    assign process_intf_2.ap_continue = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.entry_proc_U0.ap_continue;
    assign process_intf_2.real_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.entry_proc_U0.ap_start;
    assign process_intf_2.pin_stall = 1'b0;
    assign process_intf_2.pout_stall = 1'b0 | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.entry_proc_U0.output_r_c_blk_n;
    assign process_intf_2.cin_stall = 1'b0;
    assign process_intf_2.cout_stall = 1'b0;
    assign process_intf_2.region_idle = region_1_idle;
    assign process_intf_2.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_2;
    csv_file_dump pstatus_csv_dumper_2;
    df_process_monitor process_monitor_2;
    df_process_intf process_intf_3(clock,reset);
    assign process_intf_3.ap_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_start;
    assign process_intf_3.ap_ready = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ready;
    assign process_intf_3.ap_done = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_done;
    assign process_intf_3.ap_continue = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_continue;
    assign process_intf_3.real_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_start;
    assign process_intf_3.pin_stall = 1'b0;
    assign process_intf_3.pout_stall = 1'b0;
    assign process_intf_3.cin_stall = 1'b0;
    assign process_intf_3.cout_stall = 1'b0 | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.input_buf_U.i_full_n | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.input_buf_1_U.i_full_n;
    assign process_intf_3.region_idle = region_1_idle;
    assign process_intf_3.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_3;
    csv_file_dump pstatus_csv_dumper_3;
    df_process_monitor process_monitor_3;
    df_process_intf process_intf_4(clock,reset);
    assign process_intf_4.ap_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_start;
    assign process_intf_4.ap_ready = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ready;
    assign process_intf_4.ap_done = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_done;
    assign process_intf_4.ap_continue = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_continue;
    assign process_intf_4.real_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_start;
    assign process_intf_4.pin_stall = 1'b0;
    assign process_intf_4.pout_stall = 1'b0;
    assign process_intf_4.cin_stall = 1'b0;
    assign process_intf_4.cout_stall = 1'b0 | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weight_buf_U.i_full_n | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weight_buf_1_U.i_full_n;
    assign process_intf_4.region_idle = region_1_idle;
    assign process_intf_4.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_4;
    csv_file_dump pstatus_csv_dumper_4;
    df_process_monitor process_monitor_4;
    df_process_intf process_intf_5(clock,reset);
    assign process_intf_5.ap_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_start;
    assign process_intf_5.ap_ready = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ready;
    assign process_intf_5.ap_done = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_done;
    assign process_intf_5.ap_continue = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_continue;
    assign process_intf_5.real_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_start;
    assign process_intf_5.pin_stall = 1'b0;
    assign process_intf_5.pout_stall = 1'b0;
    assign process_intf_5.cin_stall = 1'b0 | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.input_buf_U.t_empty_n | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.input_buf_1_U.t_empty_n | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weight_buf_U.t_empty_n | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weight_buf_1_U.t_empty_n;
    assign process_intf_5.cout_stall = 1'b0 | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.output_buf_U.i_full_n;
    assign process_intf_5.region_idle = region_1_idle;
    assign process_intf_5.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_5;
    csv_file_dump pstatus_csv_dumper_5;
    df_process_monitor process_monitor_5;
    df_process_intf process_intf_6(clock,reset);
    assign process_intf_6.ap_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_start;
    assign process_intf_6.ap_ready = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_ready;
    assign process_intf_6.ap_done = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_done;
    assign process_intf_6.ap_continue = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_continue;
    assign process_intf_6.real_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_start;
    assign process_intf_6.pin_stall = 1'b0 | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.output_r_blk_n;
    assign process_intf_6.pout_stall = 1'b0;
    assign process_intf_6.cin_stall = 1'b0 | ~AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.output_buf_U.t_empty_n;
    assign process_intf_6.cout_stall = 1'b0;
    assign process_intf_6.region_idle = region_1_idle;
    assign process_intf_6.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_6;
    csv_file_dump pstatus_csv_dumper_6;
    df_process_monitor process_monitor_6;

    nodf_module_intf module_intf_1(clock,reset);
    assign module_intf_1.ap_start = AESL_inst_dataflow.ap_start;
    assign module_intf_1.ap_ready = AESL_inst_dataflow.ap_ready;
    assign module_intf_1.ap_done = AESL_inst_dataflow.ap_done;
    assign module_intf_1.ap_continue = 1'b1;
    assign module_intf_1.finish = finish;
    csv_file_dump mstatus_csv_dumper_1;
    nodf_module_monitor module_monitor_1;

    df_loop_intf df_loop_intf_1(clock,reset);
    assign df_loop_intf_1.body_start = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_start;
    assign df_loop_intf_1.body_ready = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_ready;
    assign df_loop_intf_1.body_done = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_done;
    assign df_loop_intf_1.body_continue = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.ap_continue;
    assign df_loop_intf_1.loop_start = AESL_inst_dataflow.ap_start;
    assign df_loop_intf_1.loop_ready = AESL_inst_dataflow.ap_ready;
    assign df_loop_intf_1.loop_done = AESL_inst_dataflow.ap_done;
    assign df_loop_intf_1.loop_continue = 1'b1;
    csv_file_dump df_loop_csv_dumper_1;
    df_loop_monitor df_loop_monitor_1;
    seq_loop_intf#(74) seq_loop_intf_1(clock,reset);
    assign seq_loop_intf_1.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state71;
    assign seq_loop_intf_1.pre_states_valid = 1'b1;
    assign seq_loop_intf_1.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state71;
    assign seq_loop_intf_1.post_states_valid = 1'b1;
    assign seq_loop_intf_1.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state72;
    assign seq_loop_intf_1.quit_states_valid = 1'b1;
    assign seq_loop_intf_1.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_CS_fsm;
    assign seq_loop_intf_1.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state72;
    assign seq_loop_intf_1.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state74;
    assign seq_loop_intf_1.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_1.one_state_loop = 1'b0;
    assign seq_loop_intf_1.one_state_block = 1'b0;
    assign seq_loop_intf_1.finish = finish;
    csv_file_dump seq_loop_csv_dumper_1;
    seq_loop_monitor #(74) seq_loop_monitor_1;
    seq_loop_intf#(74) seq_loop_intf_2(clock,reset);
    assign seq_loop_intf_2.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state70;
    assign seq_loop_intf_2.pre_states_valid = 1'b1;
    assign seq_loop_intf_2.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state1;
    assign seq_loop_intf_2.post_states_valid = 1'b1;
    assign seq_loop_intf_2.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state71;
    assign seq_loop_intf_2.quit_states_valid = 1'b1;
    assign seq_loop_intf_2.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_CS_fsm;
    assign seq_loop_intf_2.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state71;
    assign seq_loop_intf_2.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.readDram_U0.ap_ST_fsm_state72;
    assign seq_loop_intf_2.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_2.one_state_loop = 1'b0;
    assign seq_loop_intf_2.one_state_block = 1'b0;
    assign seq_loop_intf_2.finish = finish;
    csv_file_dump seq_loop_csv_dumper_2;
    seq_loop_monitor #(74) seq_loop_monitor_2;
    seq_loop_intf#(74) seq_loop_intf_3(clock,reset);
    assign seq_loop_intf_3.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state71;
    assign seq_loop_intf_3.pre_states_valid = 1'b1;
    assign seq_loop_intf_3.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state71;
    assign seq_loop_intf_3.post_states_valid = 1'b1;
    assign seq_loop_intf_3.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state72;
    assign seq_loop_intf_3.quit_states_valid = 1'b1;
    assign seq_loop_intf_3.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_CS_fsm;
    assign seq_loop_intf_3.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state72;
    assign seq_loop_intf_3.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state74;
    assign seq_loop_intf_3.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_3.one_state_loop = 1'b0;
    assign seq_loop_intf_3.one_state_block = 1'b0;
    assign seq_loop_intf_3.finish = finish;
    csv_file_dump seq_loop_csv_dumper_3;
    seq_loop_monitor #(74) seq_loop_monitor_3;
    seq_loop_intf#(74) seq_loop_intf_4(clock,reset);
    assign seq_loop_intf_4.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state70;
    assign seq_loop_intf_4.pre_states_valid = 1'b1;
    assign seq_loop_intf_4.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state1;
    assign seq_loop_intf_4.post_states_valid = 1'b1;
    assign seq_loop_intf_4.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state71;
    assign seq_loop_intf_4.quit_states_valid = 1'b1;
    assign seq_loop_intf_4.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_CS_fsm;
    assign seq_loop_intf_4.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state71;
    assign seq_loop_intf_4.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.weightDram_U0.ap_ST_fsm_state72;
    assign seq_loop_intf_4.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_4.one_state_loop = 1'b0;
    assign seq_loop_intf_4.one_state_block = 1'b0;
    assign seq_loop_intf_4.finish = finish;
    csv_file_dump seq_loop_csv_dumper_4;
    seq_loop_monitor #(74) seq_loop_monitor_4;
    seq_loop_intf#(8) seq_loop_intf_5(clock,reset);
    assign seq_loop_intf_5.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state2;
    assign seq_loop_intf_5.pre_states_valid = 1'b1;
    assign seq_loop_intf_5.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state2;
    assign seq_loop_intf_5.post_states_valid = 1'b1;
    assign seq_loop_intf_5.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state3;
    assign seq_loop_intf_5.quit_states_valid = 1'b1;
    assign seq_loop_intf_5.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_CS_fsm;
    assign seq_loop_intf_5.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state3;
    assign seq_loop_intf_5.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state4;
    assign seq_loop_intf_5.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_5.one_state_loop = 1'b0;
    assign seq_loop_intf_5.one_state_block = 1'b0;
    assign seq_loop_intf_5.finish = finish;
    csv_file_dump seq_loop_csv_dumper_5;
    seq_loop_monitor #(8) seq_loop_monitor_5;
    seq_loop_intf#(8) seq_loop_intf_6(clock,reset);
    assign seq_loop_intf_6.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state1;
    assign seq_loop_intf_6.pre_states_valid = 1'b1;
    assign seq_loop_intf_6.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state5;
    assign seq_loop_intf_6.post_states_valid = 1'b1;
    assign seq_loop_intf_6.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state2;
    assign seq_loop_intf_6.quit_states_valid = 1'b1;
    assign seq_loop_intf_6.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_CS_fsm;
    assign seq_loop_intf_6.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state2;
    assign seq_loop_intf_6.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state3;
    assign seq_loop_intf_6.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_6.one_state_loop = 1'b0;
    assign seq_loop_intf_6.one_state_block = 1'b0;
    assign seq_loop_intf_6.finish = finish;
    csv_file_dump seq_loop_csv_dumper_6;
    seq_loop_monitor #(8) seq_loop_monitor_6;
    seq_loop_intf#(8) seq_loop_intf_7(clock,reset);
    assign seq_loop_intf_7.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state5;
    assign seq_loop_intf_7.pre_states_valid = 1'b1;
    assign seq_loop_intf_7.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state8;
    assign seq_loop_intf_7.post_states_valid = 1'b1;
    assign seq_loop_intf_7.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state6;
    assign seq_loop_intf_7.quit_states_valid = 1'b1;
    assign seq_loop_intf_7.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_CS_fsm;
    assign seq_loop_intf_7.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state6;
    assign seq_loop_intf_7.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state7;
    assign seq_loop_intf_7.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_7.one_state_loop = 1'b0;
    assign seq_loop_intf_7.one_state_block = 1'b0;
    assign seq_loop_intf_7.finish = finish;
    csv_file_dump seq_loop_csv_dumper_7;
    seq_loop_monitor #(8) seq_loop_monitor_7;
    seq_loop_intf#(8) seq_loop_intf_8(clock,reset);
    assign seq_loop_intf_8.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state2;
    assign seq_loop_intf_8.pre_states_valid = 1'b1;
    assign seq_loop_intf_8.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state1;
    assign seq_loop_intf_8.post_states_valid = 1'b1;
    assign seq_loop_intf_8.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state5;
    assign seq_loop_intf_8.quit_states_valid = 1'b1;
    assign seq_loop_intf_8.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_CS_fsm;
    assign seq_loop_intf_8.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state5;
    assign seq_loop_intf_8.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.run_PE_U0.ap_ST_fsm_state8;
    assign seq_loop_intf_8.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_8.one_state_loop = 1'b0;
    assign seq_loop_intf_8.one_state_block = 1'b0;
    assign seq_loop_intf_8.finish = finish;
    csv_file_dump seq_loop_csv_dumper_8;
    seq_loop_monitor #(8) seq_loop_monitor_8;
    seq_loop_intf#(73) seq_loop_intf_9(clock,reset);
    assign seq_loop_intf_9.pre_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_ST_fsm_state1;
    assign seq_loop_intf_9.pre_states_valid = 1'b1;
    assign seq_loop_intf_9.post_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_ST_fsm_state4;
    assign seq_loop_intf_9.post_states_valid = 1'b1;
    assign seq_loop_intf_9.quit_loop_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_ST_fsm_state2;
    assign seq_loop_intf_9.quit_states_valid = 1'b1;
    assign seq_loop_intf_9.cur_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_CS_fsm;
    assign seq_loop_intf_9.iter_start_state = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_ST_fsm_state2;
    assign seq_loop_intf_9.iter_end_state0 = AESL_inst_dataflow.dataflow_in_loop_VITIS_LOOP_112_1_U0.writeDram_U0.ap_ST_fsm_state3;
    assign seq_loop_intf_9.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_9.one_state_loop = 1'b0;
    assign seq_loop_intf_9.one_state_block = 1'b0;
    assign seq_loop_intf_9.finish = finish;
    csv_file_dump seq_loop_csv_dumper_9;
    seq_loop_monitor #(73) seq_loop_monitor_9;

    sample_manager sample_manager_inst;

initial begin
    sample_manager_inst = new;

    fifo_csv_dumper_1 = new("./depth1.csv");
    cstatus_csv_dumper_1 = new("./chan_status1.csv");
    fifo_monitor_1 = new(fifo_csv_dumper_1,fifo_intf_1,cstatus_csv_dumper_1);
    fifo_csv_dumper_2 = new("./depth2.csv");
    cstatus_csv_dumper_2 = new("./chan_status2.csv");
    fifo_monitor_2 = new(fifo_csv_dumper_2,fifo_intf_2,cstatus_csv_dumper_2);

    pstall_csv_dumper_1 = new("./stalling1.csv");
    pstatus_csv_dumper_1 = new("./status1.csv");
    process_monitor_1 = new(pstall_csv_dumper_1,process_intf_1,pstatus_csv_dumper_1);
    pstall_csv_dumper_2 = new("./stalling2.csv");
    pstatus_csv_dumper_2 = new("./status2.csv");
    process_monitor_2 = new(pstall_csv_dumper_2,process_intf_2,pstatus_csv_dumper_2);
    pstall_csv_dumper_3 = new("./stalling3.csv");
    pstatus_csv_dumper_3 = new("./status3.csv");
    process_monitor_3 = new(pstall_csv_dumper_3,process_intf_3,pstatus_csv_dumper_3);
    pstall_csv_dumper_4 = new("./stalling4.csv");
    pstatus_csv_dumper_4 = new("./status4.csv");
    process_monitor_4 = new(pstall_csv_dumper_4,process_intf_4,pstatus_csv_dumper_4);
    pstall_csv_dumper_5 = new("./stalling5.csv");
    pstatus_csv_dumper_5 = new("./status5.csv");
    process_monitor_5 = new(pstall_csv_dumper_5,process_intf_5,pstatus_csv_dumper_5);
    pstall_csv_dumper_6 = new("./stalling6.csv");
    pstatus_csv_dumper_6 = new("./status6.csv");
    process_monitor_6 = new(pstall_csv_dumper_6,process_intf_6,pstatus_csv_dumper_6);

    mstatus_csv_dumper_1 = new("./module_status1.csv");
    module_monitor_1 = new(module_intf_1,mstatus_csv_dumper_1);

    df_loop_csv_dumper_1 = new("./df_loop_status1.csv");
    df_loop_monitor_1 = new(df_loop_intf_1,df_loop_csv_dumper_1);


    seq_loop_csv_dumper_1 = new("./seq_loop_status1.csv");
    seq_loop_monitor_1 = new(seq_loop_intf_1,seq_loop_csv_dumper_1);
    seq_loop_csv_dumper_2 = new("./seq_loop_status2.csv");
    seq_loop_monitor_2 = new(seq_loop_intf_2,seq_loop_csv_dumper_2);
    seq_loop_csv_dumper_3 = new("./seq_loop_status3.csv");
    seq_loop_monitor_3 = new(seq_loop_intf_3,seq_loop_csv_dumper_3);
    seq_loop_csv_dumper_4 = new("./seq_loop_status4.csv");
    seq_loop_monitor_4 = new(seq_loop_intf_4,seq_loop_csv_dumper_4);
    seq_loop_csv_dumper_5 = new("./seq_loop_status5.csv");
    seq_loop_monitor_5 = new(seq_loop_intf_5,seq_loop_csv_dumper_5);
    seq_loop_csv_dumper_6 = new("./seq_loop_status6.csv");
    seq_loop_monitor_6 = new(seq_loop_intf_6,seq_loop_csv_dumper_6);
    seq_loop_csv_dumper_7 = new("./seq_loop_status7.csv");
    seq_loop_monitor_7 = new(seq_loop_intf_7,seq_loop_csv_dumper_7);
    seq_loop_csv_dumper_8 = new("./seq_loop_status8.csv");
    seq_loop_monitor_8 = new(seq_loop_intf_8,seq_loop_csv_dumper_8);
    seq_loop_csv_dumper_9 = new("./seq_loop_status9.csv");
    seq_loop_monitor_9 = new(seq_loop_intf_9,seq_loop_csv_dumper_9);


    sample_manager_inst.add_one_monitor(fifo_monitor_1);
    sample_manager_inst.add_one_monitor(fifo_monitor_2);
    sample_manager_inst.add_one_monitor(process_monitor_1);
    sample_manager_inst.add_one_monitor(process_monitor_2);
    sample_manager_inst.add_one_monitor(process_monitor_3);
    sample_manager_inst.add_one_monitor(process_monitor_4);
    sample_manager_inst.add_one_monitor(process_monitor_5);
    sample_manager_inst.add_one_monitor(process_monitor_6);
    sample_manager_inst.add_one_monitor(module_monitor_1);
    sample_manager_inst.add_one_monitor(df_loop_monitor_1);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_1);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_2);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_3);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_4);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_5);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_6);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_7);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_8);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_9);
    
    fork
        sample_manager_inst.start_monitor();
        last_transaction_done;
    join
    disable fork;

    sample_manager_inst.start_dump();
end

    task last_transaction_done();
        wait(reset == 0);
        while(1) begin
            if (finish == 1'b1 || deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock == 1'b1) begin
                @(negedge clock);
                break;
            end
            else
                @(posedge clock);
        end
    endtask


endmodule
