// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dataflow_weightDram (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        m_axi_gmem2_AWVALID,
        m_axi_gmem2_AWREADY,
        m_axi_gmem2_AWADDR,
        m_axi_gmem2_AWID,
        m_axi_gmem2_AWLEN,
        m_axi_gmem2_AWSIZE,
        m_axi_gmem2_AWBURST,
        m_axi_gmem2_AWLOCK,
        m_axi_gmem2_AWCACHE,
        m_axi_gmem2_AWPROT,
        m_axi_gmem2_AWQOS,
        m_axi_gmem2_AWREGION,
        m_axi_gmem2_AWUSER,
        m_axi_gmem2_WVALID,
        m_axi_gmem2_WREADY,
        m_axi_gmem2_WDATA,
        m_axi_gmem2_WSTRB,
        m_axi_gmem2_WLAST,
        m_axi_gmem2_WID,
        m_axi_gmem2_WUSER,
        m_axi_gmem2_ARVALID,
        m_axi_gmem2_ARREADY,
        m_axi_gmem2_ARADDR,
        m_axi_gmem2_ARID,
        m_axi_gmem2_ARLEN,
        m_axi_gmem2_ARSIZE,
        m_axi_gmem2_ARBURST,
        m_axi_gmem2_ARLOCK,
        m_axi_gmem2_ARCACHE,
        m_axi_gmem2_ARPROT,
        m_axi_gmem2_ARQOS,
        m_axi_gmem2_ARREGION,
        m_axi_gmem2_ARUSER,
        m_axi_gmem2_RVALID,
        m_axi_gmem2_RREADY,
        m_axi_gmem2_RDATA,
        m_axi_gmem2_RLAST,
        m_axi_gmem2_RID,
        m_axi_gmem2_RFIFONUM,
        m_axi_gmem2_RUSER,
        m_axi_gmem2_RRESP,
        m_axi_gmem2_BVALID,
        m_axi_gmem2_BREADY,
        m_axi_gmem2_BRESP,
        m_axi_gmem2_BID,
        m_axi_gmem2_BUSER,
        weight_buf_address0,
        weight_buf_ce0,
        weight_buf_we0,
        weight_buf_d0,
        weight_buf_1_address0,
        weight_buf_1_ce0,
        weight_buf_1_we0,
        weight_buf_1_d0,
        channel_i
);

parameter    ap_ST_fsm_state1 = 74'd1;
parameter    ap_ST_fsm_state2 = 74'd2;
parameter    ap_ST_fsm_state3 = 74'd4;
parameter    ap_ST_fsm_state4 = 74'd8;
parameter    ap_ST_fsm_state5 = 74'd16;
parameter    ap_ST_fsm_state6 = 74'd32;
parameter    ap_ST_fsm_state7 = 74'd64;
parameter    ap_ST_fsm_state8 = 74'd128;
parameter    ap_ST_fsm_state9 = 74'd256;
parameter    ap_ST_fsm_state10 = 74'd512;
parameter    ap_ST_fsm_state11 = 74'd1024;
parameter    ap_ST_fsm_state12 = 74'd2048;
parameter    ap_ST_fsm_state13 = 74'd4096;
parameter    ap_ST_fsm_state14 = 74'd8192;
parameter    ap_ST_fsm_state15 = 74'd16384;
parameter    ap_ST_fsm_state16 = 74'd32768;
parameter    ap_ST_fsm_state17 = 74'd65536;
parameter    ap_ST_fsm_state18 = 74'd131072;
parameter    ap_ST_fsm_state19 = 74'd262144;
parameter    ap_ST_fsm_state20 = 74'd524288;
parameter    ap_ST_fsm_state21 = 74'd1048576;
parameter    ap_ST_fsm_state22 = 74'd2097152;
parameter    ap_ST_fsm_state23 = 74'd4194304;
parameter    ap_ST_fsm_state24 = 74'd8388608;
parameter    ap_ST_fsm_state25 = 74'd16777216;
parameter    ap_ST_fsm_state26 = 74'd33554432;
parameter    ap_ST_fsm_state27 = 74'd67108864;
parameter    ap_ST_fsm_state28 = 74'd134217728;
parameter    ap_ST_fsm_state29 = 74'd268435456;
parameter    ap_ST_fsm_state30 = 74'd536870912;
parameter    ap_ST_fsm_state31 = 74'd1073741824;
parameter    ap_ST_fsm_state32 = 74'd2147483648;
parameter    ap_ST_fsm_state33 = 74'd4294967296;
parameter    ap_ST_fsm_state34 = 74'd8589934592;
parameter    ap_ST_fsm_state35 = 74'd17179869184;
parameter    ap_ST_fsm_state36 = 74'd34359738368;
parameter    ap_ST_fsm_state37 = 74'd68719476736;
parameter    ap_ST_fsm_state38 = 74'd137438953472;
parameter    ap_ST_fsm_state39 = 74'd274877906944;
parameter    ap_ST_fsm_state40 = 74'd549755813888;
parameter    ap_ST_fsm_state41 = 74'd1099511627776;
parameter    ap_ST_fsm_state42 = 74'd2199023255552;
parameter    ap_ST_fsm_state43 = 74'd4398046511104;
parameter    ap_ST_fsm_state44 = 74'd8796093022208;
parameter    ap_ST_fsm_state45 = 74'd17592186044416;
parameter    ap_ST_fsm_state46 = 74'd35184372088832;
parameter    ap_ST_fsm_state47 = 74'd70368744177664;
parameter    ap_ST_fsm_state48 = 74'd140737488355328;
parameter    ap_ST_fsm_state49 = 74'd281474976710656;
parameter    ap_ST_fsm_state50 = 74'd562949953421312;
parameter    ap_ST_fsm_state51 = 74'd1125899906842624;
parameter    ap_ST_fsm_state52 = 74'd2251799813685248;
parameter    ap_ST_fsm_state53 = 74'd4503599627370496;
parameter    ap_ST_fsm_state54 = 74'd9007199254740992;
parameter    ap_ST_fsm_state55 = 74'd18014398509481984;
parameter    ap_ST_fsm_state56 = 74'd36028797018963968;
parameter    ap_ST_fsm_state57 = 74'd72057594037927936;
parameter    ap_ST_fsm_state58 = 74'd144115188075855872;
parameter    ap_ST_fsm_state59 = 74'd288230376151711744;
parameter    ap_ST_fsm_state60 = 74'd576460752303423488;
parameter    ap_ST_fsm_state61 = 74'd1152921504606846976;
parameter    ap_ST_fsm_state62 = 74'd2305843009213693952;
parameter    ap_ST_fsm_state63 = 74'd4611686018427387904;
parameter    ap_ST_fsm_state64 = 74'd9223372036854775808;
parameter    ap_ST_fsm_state65 = 74'd18446744073709551616;
parameter    ap_ST_fsm_state66 = 74'd36893488147419103232;
parameter    ap_ST_fsm_state67 = 74'd73786976294838206464;
parameter    ap_ST_fsm_state68 = 74'd147573952589676412928;
parameter    ap_ST_fsm_state69 = 74'd295147905179352825856;
parameter    ap_ST_fsm_state70 = 74'd590295810358705651712;
parameter    ap_ST_fsm_state71 = 74'd1180591620717411303424;
parameter    ap_ST_fsm_state72 = 74'd2361183241434822606848;
parameter    ap_ST_fsm_state73 = 74'd4722366482869645213696;
parameter    ap_ST_fsm_state74 = 74'd9444732965739290427392;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem2_AWVALID;
input   m_axi_gmem2_AWREADY;
output  [63:0] m_axi_gmem2_AWADDR;
output  [0:0] m_axi_gmem2_AWID;
output  [31:0] m_axi_gmem2_AWLEN;
output  [2:0] m_axi_gmem2_AWSIZE;
output  [1:0] m_axi_gmem2_AWBURST;
output  [1:0] m_axi_gmem2_AWLOCK;
output  [3:0] m_axi_gmem2_AWCACHE;
output  [2:0] m_axi_gmem2_AWPROT;
output  [3:0] m_axi_gmem2_AWQOS;
output  [3:0] m_axi_gmem2_AWREGION;
output  [0:0] m_axi_gmem2_AWUSER;
output   m_axi_gmem2_WVALID;
input   m_axi_gmem2_WREADY;
output  [7:0] m_axi_gmem2_WDATA;
output  [0:0] m_axi_gmem2_WSTRB;
output   m_axi_gmem2_WLAST;
output  [0:0] m_axi_gmem2_WID;
output  [0:0] m_axi_gmem2_WUSER;
output   m_axi_gmem2_ARVALID;
input   m_axi_gmem2_ARREADY;
output  [63:0] m_axi_gmem2_ARADDR;
output  [0:0] m_axi_gmem2_ARID;
output  [31:0] m_axi_gmem2_ARLEN;
output  [2:0] m_axi_gmem2_ARSIZE;
output  [1:0] m_axi_gmem2_ARBURST;
output  [1:0] m_axi_gmem2_ARLOCK;
output  [3:0] m_axi_gmem2_ARCACHE;
output  [2:0] m_axi_gmem2_ARPROT;
output  [3:0] m_axi_gmem2_ARQOS;
output  [3:0] m_axi_gmem2_ARREGION;
output  [0:0] m_axi_gmem2_ARUSER;
input   m_axi_gmem2_RVALID;
output   m_axi_gmem2_RREADY;
input  [7:0] m_axi_gmem2_RDATA;
input   m_axi_gmem2_RLAST;
input  [0:0] m_axi_gmem2_RID;
input  [10:0] m_axi_gmem2_RFIFONUM;
input  [0:0] m_axi_gmem2_RUSER;
input  [1:0] m_axi_gmem2_RRESP;
input   m_axi_gmem2_BVALID;
output   m_axi_gmem2_BREADY;
input  [1:0] m_axi_gmem2_BRESP;
input  [0:0] m_axi_gmem2_BID;
input  [0:0] m_axi_gmem2_BUSER;
output  [2:0] weight_buf_address0;
output   weight_buf_ce0;
output   weight_buf_we0;
output  [7:0] weight_buf_d0;
output  [2:0] weight_buf_1_address0;
output   weight_buf_1_ce0;
output   weight_buf_1_we0;
output  [7:0] weight_buf_1_d0;
input  [1:0] channel_i;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_gmem2_ARVALID;
reg m_axi_gmem2_RREADY;
reg weight_buf_ce0;
reg weight_buf_we0;
reg weight_buf_1_ce0;
reg weight_buf_1_we0;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [73:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    gmem2_blk_n_AR;
reg    gmem2_blk_n_R;
wire    ap_CS_fsm_state73;
wire   [2:0] tmp_i_fu_133_p3;
reg   [2:0] tmp_i_reg_204;
wire    ap_CS_fsm_state70;
wire   [1:0] add_ln19_fu_150_p2;
reg   [1:0] add_ln19_reg_212;
wire    ap_CS_fsm_state71;
wire   [0:0] empty_31_fu_156_p1;
reg   [0:0] empty_31_reg_217;
wire   [0:0] icmp_ln19_fu_144_p2;
reg   [2:0] weight_buf_addr_reg_221;
wire    ap_CS_fsm_state72;
reg   [2:0] weight_buf_1_addr_reg_226;
wire   [1:0] add_ln21_fu_181_p2;
reg   [1:0] add_ln21_reg_234;
reg   [7:0] gmem2_addr_read_reg_239;
reg   [1:0] ci_reg_110;
wire    ap_CS_fsm_state74;
wire   [63:0] zext_ln24_1_fu_169_p1;
reg    ap_block_state1;
reg   [1:0] ki_fu_64;
wire   [0:0] icmp_ln21_fu_175_p2;
wire   [2:0] zext_ln24_fu_160_p1;
wire   [2:0] add_ln24_fu_164_p2;
reg   [73:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_ST_fsm_state22_blk;
wire    ap_ST_fsm_state23_blk;
wire    ap_ST_fsm_state24_blk;
wire    ap_ST_fsm_state25_blk;
wire    ap_ST_fsm_state26_blk;
wire    ap_ST_fsm_state27_blk;
wire    ap_ST_fsm_state28_blk;
wire    ap_ST_fsm_state29_blk;
wire    ap_ST_fsm_state30_blk;
wire    ap_ST_fsm_state31_blk;
wire    ap_ST_fsm_state32_blk;
wire    ap_ST_fsm_state33_blk;
wire    ap_ST_fsm_state34_blk;
wire    ap_ST_fsm_state35_blk;
wire    ap_ST_fsm_state36_blk;
wire    ap_ST_fsm_state37_blk;
wire    ap_ST_fsm_state38_blk;
wire    ap_ST_fsm_state39_blk;
wire    ap_ST_fsm_state40_blk;
wire    ap_ST_fsm_state41_blk;
wire    ap_ST_fsm_state42_blk;
wire    ap_ST_fsm_state43_blk;
wire    ap_ST_fsm_state44_blk;
wire    ap_ST_fsm_state45_blk;
wire    ap_ST_fsm_state46_blk;
wire    ap_ST_fsm_state47_blk;
wire    ap_ST_fsm_state48_blk;
wire    ap_ST_fsm_state49_blk;
wire    ap_ST_fsm_state50_blk;
wire    ap_ST_fsm_state51_blk;
wire    ap_ST_fsm_state52_blk;
wire    ap_ST_fsm_state53_blk;
wire    ap_ST_fsm_state54_blk;
wire    ap_ST_fsm_state55_blk;
wire    ap_ST_fsm_state56_blk;
wire    ap_ST_fsm_state57_blk;
wire    ap_ST_fsm_state58_blk;
wire    ap_ST_fsm_state59_blk;
wire    ap_ST_fsm_state60_blk;
wire    ap_ST_fsm_state61_blk;
wire    ap_ST_fsm_state62_blk;
wire    ap_ST_fsm_state63_blk;
wire    ap_ST_fsm_state64_blk;
wire    ap_ST_fsm_state65_blk;
wire    ap_ST_fsm_state66_blk;
wire    ap_ST_fsm_state67_blk;
wire    ap_ST_fsm_state68_blk;
wire    ap_ST_fsm_state69_blk;
wire    ap_ST_fsm_state70_blk;
wire    ap_ST_fsm_state71_blk;
wire    ap_ST_fsm_state72_blk;
reg    ap_ST_fsm_state73_blk;
wire    ap_ST_fsm_state74_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 74'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state71) & (icmp_ln19_fu_144_p2 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state71) & (icmp_ln19_fu_144_p2 == 1'd0))) begin
        ci_reg_110 <= 2'd0;
    end else if ((1'b1 == ap_CS_fsm_state74)) begin
        ci_reg_110 <= add_ln21_reg_234;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem2_ARREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        ki_fu_64 <= 2'd0;
    end else if (((icmp_ln21_fu_175_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state72))) begin
        ki_fu_64 <= add_ln19_reg_212;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state71)) begin
        add_ln19_reg_212 <= add_ln19_fu_150_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state72)) begin
        add_ln21_reg_234 <= add_ln21_fu_181_p2;
        weight_buf_1_addr_reg_226 <= zext_ln24_1_fu_169_p1;
        weight_buf_addr_reg_221 <= zext_ln24_1_fu_169_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state71) & (icmp_ln19_fu_144_p2 == 1'd0))) begin
        empty_31_reg_217 <= empty_31_fu_156_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state73)) begin
        gmem2_addr_read_reg_239 <= m_axi_gmem2_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state70)) begin
        tmp_i_reg_204[2 : 1] <= tmp_i_fu_133_p3[2 : 1];
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem2_ARREADY == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

assign ap_ST_fsm_state21_blk = 1'b0;

assign ap_ST_fsm_state22_blk = 1'b0;

assign ap_ST_fsm_state23_blk = 1'b0;

assign ap_ST_fsm_state24_blk = 1'b0;

assign ap_ST_fsm_state25_blk = 1'b0;

assign ap_ST_fsm_state26_blk = 1'b0;

assign ap_ST_fsm_state27_blk = 1'b0;

assign ap_ST_fsm_state28_blk = 1'b0;

assign ap_ST_fsm_state29_blk = 1'b0;

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state30_blk = 1'b0;

assign ap_ST_fsm_state31_blk = 1'b0;

assign ap_ST_fsm_state32_blk = 1'b0;

assign ap_ST_fsm_state33_blk = 1'b0;

assign ap_ST_fsm_state34_blk = 1'b0;

assign ap_ST_fsm_state35_blk = 1'b0;

assign ap_ST_fsm_state36_blk = 1'b0;

assign ap_ST_fsm_state37_blk = 1'b0;

assign ap_ST_fsm_state38_blk = 1'b0;

assign ap_ST_fsm_state39_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state40_blk = 1'b0;

assign ap_ST_fsm_state41_blk = 1'b0;

assign ap_ST_fsm_state42_blk = 1'b0;

assign ap_ST_fsm_state43_blk = 1'b0;

assign ap_ST_fsm_state44_blk = 1'b0;

assign ap_ST_fsm_state45_blk = 1'b0;

assign ap_ST_fsm_state46_blk = 1'b0;

assign ap_ST_fsm_state47_blk = 1'b0;

assign ap_ST_fsm_state48_blk = 1'b0;

assign ap_ST_fsm_state49_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state50_blk = 1'b0;

assign ap_ST_fsm_state51_blk = 1'b0;

assign ap_ST_fsm_state52_blk = 1'b0;

assign ap_ST_fsm_state53_blk = 1'b0;

assign ap_ST_fsm_state54_blk = 1'b0;

assign ap_ST_fsm_state55_blk = 1'b0;

assign ap_ST_fsm_state56_blk = 1'b0;

assign ap_ST_fsm_state57_blk = 1'b0;

assign ap_ST_fsm_state58_blk = 1'b0;

assign ap_ST_fsm_state59_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state60_blk = 1'b0;

assign ap_ST_fsm_state61_blk = 1'b0;

assign ap_ST_fsm_state62_blk = 1'b0;

assign ap_ST_fsm_state63_blk = 1'b0;

assign ap_ST_fsm_state64_blk = 1'b0;

assign ap_ST_fsm_state65_blk = 1'b0;

assign ap_ST_fsm_state66_blk = 1'b0;

assign ap_ST_fsm_state67_blk = 1'b0;

assign ap_ST_fsm_state68_blk = 1'b0;

assign ap_ST_fsm_state69_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state70_blk = 1'b0;

assign ap_ST_fsm_state71_blk = 1'b0;

assign ap_ST_fsm_state72_blk = 1'b0;

always @ (*) begin
    if ((m_axi_gmem2_RVALID == 1'b0)) begin
        ap_ST_fsm_state73_blk = 1'b1;
    end else begin
        ap_ST_fsm_state73_blk = 1'b0;
    end
end

assign ap_ST_fsm_state74_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) & (icmp_ln19_fu_144_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) & (icmp_ln19_fu_144_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        gmem2_blk_n_AR = m_axi_gmem2_ARREADY;
    end else begin
        gmem2_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state73)) begin
        gmem2_blk_n_R = m_axi_gmem2_RVALID;
    end else begin
        gmem2_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem2_ARREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axi_gmem2_ARVALID = 1'b1;
    end else begin
        m_axi_gmem2_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state73) & (m_axi_gmem2_RVALID == 1'b1))) begin
        m_axi_gmem2_RREADY = 1'b1;
    end else begin
        m_axi_gmem2_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state74)) begin
        weight_buf_1_ce0 = 1'b1;
    end else begin
        weight_buf_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state74) & (empty_31_reg_217 == 1'd1))) begin
        weight_buf_1_we0 = 1'b1;
    end else begin
        weight_buf_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state74)) begin
        weight_buf_ce0 = 1'b1;
    end else begin
        weight_buf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state74) & (empty_31_reg_217 == 1'd0))) begin
        weight_buf_we0 = 1'b1;
    end else begin
        weight_buf_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem2_ARREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state35;
        end
        ap_ST_fsm_state35 : begin
            ap_NS_fsm = ap_ST_fsm_state36;
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            ap_NS_fsm = ap_ST_fsm_state38;
        end
        ap_ST_fsm_state38 : begin
            ap_NS_fsm = ap_ST_fsm_state39;
        end
        ap_ST_fsm_state39 : begin
            ap_NS_fsm = ap_ST_fsm_state40;
        end
        ap_ST_fsm_state40 : begin
            ap_NS_fsm = ap_ST_fsm_state41;
        end
        ap_ST_fsm_state41 : begin
            ap_NS_fsm = ap_ST_fsm_state42;
        end
        ap_ST_fsm_state42 : begin
            ap_NS_fsm = ap_ST_fsm_state43;
        end
        ap_ST_fsm_state43 : begin
            ap_NS_fsm = ap_ST_fsm_state44;
        end
        ap_ST_fsm_state44 : begin
            ap_NS_fsm = ap_ST_fsm_state45;
        end
        ap_ST_fsm_state45 : begin
            ap_NS_fsm = ap_ST_fsm_state46;
        end
        ap_ST_fsm_state46 : begin
            ap_NS_fsm = ap_ST_fsm_state47;
        end
        ap_ST_fsm_state47 : begin
            ap_NS_fsm = ap_ST_fsm_state48;
        end
        ap_ST_fsm_state48 : begin
            ap_NS_fsm = ap_ST_fsm_state49;
        end
        ap_ST_fsm_state49 : begin
            ap_NS_fsm = ap_ST_fsm_state50;
        end
        ap_ST_fsm_state50 : begin
            ap_NS_fsm = ap_ST_fsm_state51;
        end
        ap_ST_fsm_state51 : begin
            ap_NS_fsm = ap_ST_fsm_state52;
        end
        ap_ST_fsm_state52 : begin
            ap_NS_fsm = ap_ST_fsm_state53;
        end
        ap_ST_fsm_state53 : begin
            ap_NS_fsm = ap_ST_fsm_state54;
        end
        ap_ST_fsm_state54 : begin
            ap_NS_fsm = ap_ST_fsm_state55;
        end
        ap_ST_fsm_state55 : begin
            ap_NS_fsm = ap_ST_fsm_state56;
        end
        ap_ST_fsm_state56 : begin
            ap_NS_fsm = ap_ST_fsm_state57;
        end
        ap_ST_fsm_state57 : begin
            ap_NS_fsm = ap_ST_fsm_state58;
        end
        ap_ST_fsm_state58 : begin
            ap_NS_fsm = ap_ST_fsm_state59;
        end
        ap_ST_fsm_state59 : begin
            ap_NS_fsm = ap_ST_fsm_state60;
        end
        ap_ST_fsm_state60 : begin
            ap_NS_fsm = ap_ST_fsm_state61;
        end
        ap_ST_fsm_state61 : begin
            ap_NS_fsm = ap_ST_fsm_state62;
        end
        ap_ST_fsm_state62 : begin
            ap_NS_fsm = ap_ST_fsm_state63;
        end
        ap_ST_fsm_state63 : begin
            ap_NS_fsm = ap_ST_fsm_state64;
        end
        ap_ST_fsm_state64 : begin
            ap_NS_fsm = ap_ST_fsm_state65;
        end
        ap_ST_fsm_state65 : begin
            ap_NS_fsm = ap_ST_fsm_state66;
        end
        ap_ST_fsm_state66 : begin
            ap_NS_fsm = ap_ST_fsm_state67;
        end
        ap_ST_fsm_state67 : begin
            ap_NS_fsm = ap_ST_fsm_state68;
        end
        ap_ST_fsm_state68 : begin
            ap_NS_fsm = ap_ST_fsm_state69;
        end
        ap_ST_fsm_state69 : begin
            ap_NS_fsm = ap_ST_fsm_state70;
        end
        ap_ST_fsm_state70 : begin
            ap_NS_fsm = ap_ST_fsm_state71;
        end
        ap_ST_fsm_state71 : begin
            if (((1'b1 == ap_CS_fsm_state71) & (icmp_ln19_fu_144_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state72;
            end
        end
        ap_ST_fsm_state72 : begin
            if (((icmp_ln21_fu_175_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state72))) begin
                ap_NS_fsm = ap_ST_fsm_state71;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state73;
            end
        end
        ap_ST_fsm_state73 : begin
            if (((1'b1 == ap_CS_fsm_state73) & (m_axi_gmem2_RVALID == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state74;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state73;
            end
        end
        ap_ST_fsm_state74 : begin
            ap_NS_fsm = ap_ST_fsm_state72;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln19_fu_150_p2 = (ki_fu_64 + 2'd1);

assign add_ln21_fu_181_p2 = (ci_reg_110 + 2'd1);

assign add_ln24_fu_164_p2 = (tmp_i_reg_204 + zext_ln24_fu_160_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state70 = ap_CS_fsm[32'd69];

assign ap_CS_fsm_state71 = ap_CS_fsm[32'd70];

assign ap_CS_fsm_state72 = ap_CS_fsm[32'd71];

assign ap_CS_fsm_state73 = ap_CS_fsm[32'd72];

assign ap_CS_fsm_state74 = ap_CS_fsm[32'd73];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign empty_31_fu_156_p1 = ki_fu_64[0:0];

assign icmp_ln19_fu_144_p2 = ((ki_fu_64 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln21_fu_175_p2 = ((ci_reg_110 == 2'd2) ? 1'b1 : 1'b0);

assign m_axi_gmem2_ARADDR = 64'd0;

assign m_axi_gmem2_ARBURST = 2'd0;

assign m_axi_gmem2_ARCACHE = 4'd0;

assign m_axi_gmem2_ARID = 1'd0;

assign m_axi_gmem2_ARLEN = 32'd4;

assign m_axi_gmem2_ARLOCK = 2'd0;

assign m_axi_gmem2_ARPROT = 3'd0;

assign m_axi_gmem2_ARQOS = 4'd0;

assign m_axi_gmem2_ARREGION = 4'd0;

assign m_axi_gmem2_ARSIZE = 3'd0;

assign m_axi_gmem2_ARUSER = 1'd0;

assign m_axi_gmem2_AWADDR = 64'd0;

assign m_axi_gmem2_AWBURST = 2'd0;

assign m_axi_gmem2_AWCACHE = 4'd0;

assign m_axi_gmem2_AWID = 1'd0;

assign m_axi_gmem2_AWLEN = 32'd0;

assign m_axi_gmem2_AWLOCK = 2'd0;

assign m_axi_gmem2_AWPROT = 3'd0;

assign m_axi_gmem2_AWQOS = 4'd0;

assign m_axi_gmem2_AWREGION = 4'd0;

assign m_axi_gmem2_AWSIZE = 3'd0;

assign m_axi_gmem2_AWUSER = 1'd0;

assign m_axi_gmem2_AWVALID = 1'b0;

assign m_axi_gmem2_BREADY = 1'b0;

assign m_axi_gmem2_WDATA = 8'd0;

assign m_axi_gmem2_WID = 1'd0;

assign m_axi_gmem2_WLAST = 1'b0;

assign m_axi_gmem2_WSTRB = 1'd0;

assign m_axi_gmem2_WUSER = 1'd0;

assign m_axi_gmem2_WVALID = 1'b0;

assign tmp_i_fu_133_p3 = {{channel_i}, {1'd0}};

assign weight_buf_1_address0 = weight_buf_1_addr_reg_226;

assign weight_buf_1_d0 = gmem2_addr_read_reg_239;

assign weight_buf_address0 = weight_buf_addr_reg_221;

assign weight_buf_d0 = gmem2_addr_read_reg_239;

assign zext_ln24_1_fu_169_p1 = add_ln24_fu_164_p2;

assign zext_ln24_fu_160_p1 = ci_reg_110;

always @ (posedge ap_clk) begin
    tmp_i_reg_204[0] <= 1'b0;
end

endmodule //dataflow_weightDram