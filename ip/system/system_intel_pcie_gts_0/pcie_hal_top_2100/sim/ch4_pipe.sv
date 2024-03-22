// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module ch4_pipe #(
    parameter x_mux_sm_hssi_pcie_pcs_clk_mux_0__sel = "SEL_SAME_QUAD_PCLK0",
    parameter x_mux_sm_hssi_pcie_pcs_clk_mux_1__sel = "SEL_SAME_QUAD_PCLK0",
    parameter x_mux_sm_hssi_pcie_pcs_clk_mux_2__sel = "SEL_SAME_QUAD_PCLK0",
    parameter x_mux_sm_hssi_pcie_pcs_clk_mux_3__sel = "SEL_SAME_QUAD_PCLK0",
    parameter x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__sel = "SEL_UNUSED",
    parameter x_decoder_sm_hssi_pcie_pcs_hps_demux_0__sel = "SEL_UNUSED",
    parameter x_mux_sm_hssi_pcie_pcs_hps_mux_0__sel = "SEL_UNUSED",
    parameter x_mux_sm_hssi_pcie_pcs_rst_mux_0__sel = "SEL_SAME_QUAD_PCS_RST",
    parameter x_mux_sm_hssi_pcie_pcs_rst_mux_1__sel = "SEL_SAME_QUAD_PCS_RST",
    parameter x_mux_sm_hssi_pcie_pcs_rst_mux_2__sel = "SEL_SAME_QUAD_PCS_RST",
    parameter x_mux_sm_hssi_pcie_pcs_rst_mux_3__sel = "SEL_SAME_QUAD_PCS_RST",
    parameter x_mux_sm_hssi_pcie_pcs_rx_demux_0__sel = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter x_mux_sm_hssi_pcie_pcs_rx_demux_1__sel = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter x_mux_sm_hssi_pcie_pcs_rx_demux_2__sel = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter x_mux_sm_hssi_pcie_pcs_rx_demux_3__sel = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter x_mux_sm_hssi_pcie_pcs_tx_mux_0__sel = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter x_mux_sm_hssi_pcie_pcs_tx_mux_1__sel = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter x_mux_sm_hssi_pcie_pcs_tx_mux_2__sel = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter x_mux_sm_hssi_pcie_pcs_tx_mux_3__sel = "SEL_SAME_QUAD_PCIE_CTRL"
)
 (
        input         o_pcs_lane0_pclk,
        input         o_pcs_lane1_pclk,
        input         o_pcs_lane2_pclk,
        output        pcie_pcs_clk_mux_u0__o_clk,
        output        pcie_pcs_clk_mux_u1__o_clk,
        output        pcie_pcs_clk_mux_u2__o_clk,
        output        pcie_pcs_clk_mux_u3__o_clk,

        output        x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__o_hps_clk,

        input         x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_ebuf_mode,
        input [3:0]   x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown,
        input [1:0]   x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate,
        input         x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxeqtraining,
        input         x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxpolarity,
        input         x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxtermination,
        input [15:0]  x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata,
        input [1:0]   x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak,
        input         x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdtctrx_lb,
        input         x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txelecidle,
        input         x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txoneszeros,

        output        x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_phystatus,
        output [15:0] x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata,
        output [1:0]  x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak,
        output        x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxelecidle_a,
        output [2:0]  x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus,
        output        x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxvalid,

        input         o_pcs0_pipe_rst_n,
        input         o_pcs1_pipe_rst_n,
        input         o_pcs2_pipe_rst_n,
        input         o_pcs3_pipe_rst_n,
        input         x_mux_sm_hssi_pcie_pcs_rst_mux_1__i_hps_rst_rstn,
        input         x_mux_sm_hssi_pcie_pcs_rst_mux_2__i_hps_rst_rstn,
        output        pcie_pcs_rst_mux_u0__o_rstn,
        output        pcie_pcs_rst_mux_u1__o_rstn,
        output        pcie_pcs_rst_mux_u2__o_rstn,
        output        pcie_pcs_rst_mux_u3__o_rstn,

        input  [5:0]  pcie_pcs_lane_u0__o_rxpipe_dirfeedback,
        input  [7:0]  pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit,
        input  [5:0]  pcie_pcs_lane_u0__o_rxpipe_localfs,
        input  [5:0]  pcie_pcs_lane_u0__o_rxpipe_locallf,
        input         pcie_pcs_lane_u0__o_rxpipe_localtxcoefficientsvalid,
        input  [17:0] pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients,
        input  [7:0]  pcie_pcs_lane_u0__o_rxpipe_p2m_bus,
        input         pcie_pcs_lane_u0__o_rxpipe_pclkchangeok,
        input         pcie_pcs_lane_u0__o_rxpipe_phystatus,
        input  [39:0] pcie_pcs_lane_u0__o_rxpipe_rxdata,
        input  [3:0]  pcie_pcs_lane_u0__o_rxpipe_rxdatak,
        input         pcie_pcs_lane_u0__o_rxpipe_rxdatavalid,
        input         pcie_pcs_lane_u0__o_rxpipe_rxelecidlea,
        input         pcie_pcs_lane_u0__o_rxpipe_rxstandbystatus,
        input         pcie_pcs_lane_u0__o_rxpipe_rxstartblock,
        input  [2:0]  pcie_pcs_lane_u0__o_rxpipe_rxstatus,
        input  [3:0]  pcie_pcs_lane_u0__o_rxpipe_rxsyncheader,
        input         pcie_pcs_lane_u0__o_rxpipe_rxvalid,
        output [5:0]  o_same_quad_rxpipe0_dirfeedback,
        output [7:0]  o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit,
        output [5:0]  o_same_quad_rxpipe0_localfs,
        output [5:0]  o_same_quad_rxpipe0_locallf,
        output        o_same_quad_rxpipe0_localtxcoefficientsvalid,
        output [17:0] o_same_quad_rxpipe0_localtxpresetcoefficients,
        output [7:0]  o_same_quad_rxpipe0_p2m_bus,
        output        o_same_quad_rxpipe0_pclkchangeok,
        output        o_same_quad_rxpipe0_phystatus,
        output [39:0] o_same_quad_rxpipe0_rxdata,
        output [3:0]  o_same_quad_rxpipe0_rxdatak,
        output        o_same_quad_rxpipe0_rxdatavalid,
        output        o_same_quad_rxpipe0_rxelecidlea,
        output        o_same_quad_rxpipe0_rxstandbystatus,
        output        o_same_quad_rxpipe0_rxstartblock,
        output [2:0]  o_same_quad_rxpipe0_rxstatus,
        output [3:0]  o_same_quad_rxpipe0_rxsyncheader,
        output        o_same_quad_rxpipe0_rxvalid,
        input  [5:0]  pcie_pcs_lane_u1__o_rxpipe_dirfeedback,
        input  [7:0]  pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit,
        input  [5:0]  pcie_pcs_lane_u1__o_rxpipe_localfs,
        input  [5:0]  pcie_pcs_lane_u1__o_rxpipe_locallf,
        input         pcie_pcs_lane_u1__o_rxpipe_localtxcoefficientsvalid,
        input  [17:0] pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients,
        input  [7:0]  pcie_pcs_lane_u1__o_rxpipe_p2m_bus,
        input         pcie_pcs_lane_u1__o_rxpipe_pclkchangeok,
        input         pcie_pcs_lane_u1__o_rxpipe_phystatus,
        input  [39:0] pcie_pcs_lane_u1__o_rxpipe_rxdata,
        input  [3:0]  pcie_pcs_lane_u1__o_rxpipe_rxdatak,
        input         pcie_pcs_lane_u1__o_rxpipe_rxdatavalid,
        input         pcie_pcs_lane_u1__o_rxpipe_rxelecidlea,
        input         pcie_pcs_lane_u1__o_rxpipe_rxstandbystatus,
        input         pcie_pcs_lane_u1__o_rxpipe_rxstartblock,
        input  [2:0]  pcie_pcs_lane_u1__o_rxpipe_rxstatus,
        input  [3:0]  pcie_pcs_lane_u1__o_rxpipe_rxsyncheader,
        input         pcie_pcs_lane_u1__o_rxpipe_rxvalid,
        output [5:0]  o_same_quad_rxpipe1_dirfeedback,
        output [7:0]  o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit,
        output [5:0]  o_same_quad_rxpipe1_localfs,
        output [5:0]  o_same_quad_rxpipe1_locallf,
        output        o_same_quad_rxpipe1_localtxcoefficientsvalid,
        output [17:0] o_same_quad_rxpipe1_localtxpresetcoefficients,
        output [7:0]  o_same_quad_rxpipe1_p2m_bus,
        output        o_same_quad_rxpipe1_pclkchangeok,
        output        o_same_quad_rxpipe1_phystatus,
        output [39:0] o_same_quad_rxpipe1_rxdata,
        output [3:0]  o_same_quad_rxpipe1_rxdatak,
        output        o_same_quad_rxpipe1_rxdatavalid,
        output        o_same_quad_rxpipe1_rxelecidlea,
        output        o_same_quad_rxpipe1_rxstandbystatus,
        output        o_same_quad_rxpipe1_rxstartblock,
        output [2:0]  o_same_quad_rxpipe1_rxstatus,
        output [3:0]  o_same_quad_rxpipe1_rxsyncheader,
        output        o_same_quad_rxpipe1_rxvalid,
        input  [5:0]  pcie_pcs_lane_u2__o_rxpipe_dirfeedback,
        input  [7:0]  pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit,
        input  [5:0]  pcie_pcs_lane_u2__o_rxpipe_localfs,
        input  [5:0]  pcie_pcs_lane_u2__o_rxpipe_locallf,
        input         pcie_pcs_lane_u2__o_rxpipe_localtxcoefficientsvalid,
        input  [17:0] pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients,
        input  [7:0]  pcie_pcs_lane_u2__o_rxpipe_p2m_bus,
        input         pcie_pcs_lane_u2__o_rxpipe_pclkchangeok,
        input         pcie_pcs_lane_u2__o_rxpipe_phystatus,
        input  [39:0] pcie_pcs_lane_u2__o_rxpipe_rxdata,
        input  [3:0]  pcie_pcs_lane_u2__o_rxpipe_rxdatak,
        input         pcie_pcs_lane_u2__o_rxpipe_rxdatavalid,
        input         pcie_pcs_lane_u2__o_rxpipe_rxelecidlea,
        input         pcie_pcs_lane_u2__o_rxpipe_rxstandbystatus,
        input         pcie_pcs_lane_u2__o_rxpipe_rxstartblock,
        input  [2:0]  pcie_pcs_lane_u2__o_rxpipe_rxstatus,
        input  [3:0]  pcie_pcs_lane_u2__o_rxpipe_rxsyncheader,
        input         pcie_pcs_lane_u2__o_rxpipe_rxvalid,
        output [5:0]  o_same_quad_rxpipe2_dirfeedback,
        output [7:0]  o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit,
        output [5:0]  o_same_quad_rxpipe2_localfs,
        output [5:0]  o_same_quad_rxpipe2_locallf,
        output        o_same_quad_rxpipe2_localtxcoefficientsvalid,
        output [17:0] o_same_quad_rxpipe2_localtxpresetcoefficients,
        output [7:0]  o_same_quad_rxpipe2_p2m_bus,
        output        o_same_quad_rxpipe2_pclkchangeok,
        output        o_same_quad_rxpipe2_phystatus,
        output [39:0] o_same_quad_rxpipe2_rxdata,
        output [3:0]  o_same_quad_rxpipe2_rxdatak,
        output        o_same_quad_rxpipe2_rxdatavalid,
        output        o_same_quad_rxpipe2_rxelecidlea,
        output        o_same_quad_rxpipe2_rxstandbystatus,
        output        o_same_quad_rxpipe2_rxstartblock,
        output [2:0]  o_same_quad_rxpipe2_rxstatus,
        output [3:0]  o_same_quad_rxpipe2_rxsyncheader,
        output        o_same_quad_rxpipe2_rxvalid,
        input  [5:0]  pcie_pcs_lane_u3__o_rxpipe_dirfeedback,
        input  [7:0]  pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit,
        input  [5:0]  pcie_pcs_lane_u3__o_rxpipe_localfs,
        input  [5:0]  pcie_pcs_lane_u3__o_rxpipe_locallf,
        input         pcie_pcs_lane_u3__o_rxpipe_localtxcoefficientsvalid,
        input  [17:0] pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients,
        input  [7:0]  pcie_pcs_lane_u3__o_rxpipe_p2m_bus,
        input         pcie_pcs_lane_u3__o_rxpipe_pclkchangeok,
        input         pcie_pcs_lane_u3__o_rxpipe_phystatus,
        input  [39:0] pcie_pcs_lane_u3__o_rxpipe_rxdata,
        input  [3:0]  pcie_pcs_lane_u3__o_rxpipe_rxdatak,
        input         pcie_pcs_lane_u3__o_rxpipe_rxdatavalid,
        input         pcie_pcs_lane_u3__o_rxpipe_rxelecidlea,
        input         pcie_pcs_lane_u3__o_rxpipe_rxstandbystatus,
        input         pcie_pcs_lane_u3__o_rxpipe_rxstartblock,
        input  [2:0]  pcie_pcs_lane_u3__o_rxpipe_rxstatus,
        input  [3:0]  pcie_pcs_lane_u3__o_rxpipe_rxsyncheader,
        input         pcie_pcs_lane_u3__o_rxpipe_rxvalid,
        output [5:0]  o_same_quad_rxpipe3_dirfeedback,
        output [7:0]  o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit,
        output [5:0]  o_same_quad_rxpipe3_localfs,
        output [5:0]  o_same_quad_rxpipe3_locallf,
        output        o_same_quad_rxpipe3_localtxcoefficientsvalid,
        output [17:0] o_same_quad_rxpipe3_localtxpresetcoefficients,
        output [7:0]  o_same_quad_rxpipe3_p2m_bus,
        output        o_same_quad_rxpipe3_pclkchangeok,
        output        o_same_quad_rxpipe3_phystatus,
        output [39:0] o_same_quad_rxpipe3_rxdata,
        output [3:0]  o_same_quad_rxpipe3_rxdatak,
        output        o_same_quad_rxpipe3_rxdatavalid,
        output        o_same_quad_rxpipe3_rxelecidlea,
        output        o_same_quad_rxpipe3_rxstandbystatus,
        output        o_same_quad_rxpipe3_rxstartblock,
        output [2:0]  o_same_quad_rxpipe3_rxstatus,
        output [3:0]  o_same_quad_rxpipe3_rxsyncheader,
        output        o_same_quad_rxpipe3_rxvalid,

        input         o_txpipe0_asyncpowerchangeack,
        input         o_txpipe0_blockaligncontrol,
        input         o_txpipe0_cfg_hw_auto_sp_dis,
        input         o_txpipe0_dirchange,
        input         o_txpipe0_ebuf_mode,
        input         o_txpipe0_encodedecodebypass,
        input [5:0]   o_txpipe0_fs,
        input         o_txpipe0_getlocalpresetcoefficients,
        input         o_txpipe0_invalidrequest,
        input [5:0]   o_txpipe0_lf,
        input [4:0]   o_txpipe0_localpresetindex,
        input         o_txpipe0_lowpin_nt,
        input [7:0]   o_txpipe0_m2p_bus,
        input [2:0]   o_txpipe0_pclk_rate,
        input         o_txpipe0_pclkchangeack,
        input [3:0]   o_txpipe0_phy_mode_nt,
        input [3:0]   o_txpipe0_powerdown,
        input [2:0]   o_txpipe0_rate,
        input         o_txpipe0_rxelecidle_disable_a,
        input         o_txpipe0_rxeqclr,
        input         o_txpipe0_rxeqeval,
        input         o_txpipe0_rxeqinprogress,
        input         o_txpipe0_rxeqtraining,
        input         o_txpipe0_rxpolarity,
        input [2:0]   o_txpipe0_rxpresethint,
        input         o_txpipe0_rxstandby,
        input         o_txpipe0_rxtermination,
        input         o_txpipe0_srisenable,
        input         o_txpipe0_txcmnmode_disable_a,
        input         o_txpipe0_txcompliance,
        input [39:0]  o_txpipe0_txdata,
        input [3:0]   o_txpipe0_txdatak,
        input         o_txpipe0_txdatavalid,
        input [17:0]  o_txpipe0_txdeemph,
        input         o_txpipe0_txdtctrx_lb,
        input         o_txpipe0_txelecidle,
        input [2:0]   o_txpipe0_txmargin,
        input         o_txpipe0_txoneszeros,
        input         o_txpipe0_txstartblock,
        input         o_txpipe0_txswing,
        input [3:0]   o_txpipe0_txsyncheader,
        input [2:0]   o_txpipe0_width,
        output        pcie_pcs_tx_mux_u0__o_txpipe_asyncpowerchangeack,
        output        pcie_pcs_tx_mux_u0__o_txpipe_blockaligncontrol,
        output        pcie_pcs_tx_mux_u0__o_txpipe_cfg_hw_auto_sp_dis,
        output        pcie_pcs_tx_mux_u0__o_txpipe_dirchange,
        output        pcie_pcs_tx_mux_u0__o_txpipe_ebuf_mode,
        output        pcie_pcs_tx_mux_u0__o_txpipe_encodedecodebypass,
        output [5:0]  pcie_pcs_tx_mux_u0__o_txpipe_fs,
        output        pcie_pcs_tx_mux_u0__o_txpipe_getlocalpresetcoefficients,
        output        pcie_pcs_tx_mux_u0__o_txpipe_invalidrequest,
        output [5:0]  pcie_pcs_tx_mux_u0__o_txpipe_lf,
        output [4:0]  pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex,
        output        pcie_pcs_tx_mux_u0__o_txpipe_lowpin_nt,
        output [7:0]  pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus,
        output [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate,
        output        pcie_pcs_tx_mux_u0__o_txpipe_pclkchangeack,
        output [3:0]  pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt,
        output [3:0]  pcie_pcs_tx_mux_u0__o_txpipe_powerdown,
        output [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_rate,
        output        pcie_pcs_tx_mux_u0__o_txpipe_rxelecidle_disable_a,
        output        pcie_pcs_tx_mux_u0__o_txpipe_rxeqclr,
        output        pcie_pcs_tx_mux_u0__o_txpipe_rxeqeval,
        output        pcie_pcs_tx_mux_u0__o_txpipe_rxeqinprogress,
        output        pcie_pcs_tx_mux_u0__o_txpipe_rxeqtraining,
        output        pcie_pcs_tx_mux_u0__o_txpipe_rxpolarity,
        output [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint,
        output        pcie_pcs_tx_mux_u0__o_txpipe_rxstandby,
        output        pcie_pcs_tx_mux_u0__o_txpipe_rxtermination,
        output        pcie_pcs_tx_mux_u0__o_txpipe_srisenable,
        output        pcie_pcs_tx_mux_u0__o_txpipe_txcmnmode_disable_a,
        output        pcie_pcs_tx_mux_u0__o_txpipe_txcompliance,
        output [39:0] pcie_pcs_tx_mux_u0__o_txpipe_txdata,
        output [3:0]  pcie_pcs_tx_mux_u0__o_txpipe_txdatak,
        output        pcie_pcs_tx_mux_u0__o_txpipe_txdatavalid,
        output [17:0] pcie_pcs_tx_mux_u0__o_txpipe_txdeemph,
        output        pcie_pcs_tx_mux_u0__o_txpipe_txdtctrx_lb,
        output        pcie_pcs_tx_mux_u0__o_txpipe_txelecidle,
        output [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_txmargin,
        output        pcie_pcs_tx_mux_u0__o_txpipe_txoneszeros,
        output        pcie_pcs_tx_mux_u0__o_txpipe_txstartblock,
        output        pcie_pcs_tx_mux_u0__o_txpipe_txswing,
        output [3:0]  pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader,
        output [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_width,
        input         o_txpipe1_asyncpowerchangeack,
        input         o_txpipe1_blockaligncontrol,
        input         o_txpipe1_cfg_hw_auto_sp_dis,
        input         o_txpipe1_dirchange,
        input         o_txpipe1_ebuf_mode,
        input         o_txpipe1_encodedecodebypass,
        input [5:0]   o_txpipe1_fs,
        input         o_txpipe1_getlocalpresetcoefficients,
        input         o_txpipe1_invalidrequest,
        input [5:0]   o_txpipe1_lf,
        input [4:0]   o_txpipe1_localpresetindex,
        input         o_txpipe1_lowpin_nt,
        input [7:0]   o_txpipe1_m2p_bus,
        input [2:0]   o_txpipe1_pclk_rate,
        input         o_txpipe1_pclkchangeack,
        input [3:0]   o_txpipe1_phy_mode_nt,
        input [3:0]   o_txpipe1_powerdown,
        input [2:0]   o_txpipe1_rate,
        input         o_txpipe1_rxelecidle_disable_a,
        input         o_txpipe1_rxeqclr,
        input         o_txpipe1_rxeqeval,
        input         o_txpipe1_rxeqinprogress,
        input         o_txpipe1_rxeqtraining,
        input         o_txpipe1_rxpolarity,
        input [2:0]   o_txpipe1_rxpresethint,
        input         o_txpipe1_rxstandby,
        input         o_txpipe1_rxtermination,
        input         o_txpipe1_srisenable,
        input         o_txpipe1_txcmnmode_disable_a,
        input         o_txpipe1_txcompliance,
        input [39:0]  o_txpipe1_txdata,
        input [3:0]   o_txpipe1_txdatak,
        input         o_txpipe1_txdatavalid,
        input [17:0]  o_txpipe1_txdeemph,
        input         o_txpipe1_txdtctrx_lb,
        input         o_txpipe1_txelecidle,
        input [2:0]   o_txpipe1_txmargin,
        input         o_txpipe1_txoneszeros,
        input         o_txpipe1_txstartblock,
        input         o_txpipe1_txswing,
        input [3:0]   o_txpipe1_txsyncheader,
        input [2:0]   o_txpipe1_width,
        output        pcie_pcs_tx_mux_u1__o_txpipe_asyncpowerchangeack,
        output        pcie_pcs_tx_mux_u1__o_txpipe_blockaligncontrol,
        output        pcie_pcs_tx_mux_u1__o_txpipe_cfg_hw_auto_sp_dis,
        output        pcie_pcs_tx_mux_u1__o_txpipe_dirchange,
        output        pcie_pcs_tx_mux_u1__o_txpipe_ebuf_mode,
        output        pcie_pcs_tx_mux_u1__o_txpipe_encodedecodebypass,
        output [5:0]  pcie_pcs_tx_mux_u1__o_txpipe_fs,
        output        pcie_pcs_tx_mux_u1__o_txpipe_getlocalpresetcoefficients,
        output        pcie_pcs_tx_mux_u1__o_txpipe_invalidrequest,
        output [5:0]  pcie_pcs_tx_mux_u1__o_txpipe_lf,
        output [4:0]  pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex,
        output        pcie_pcs_tx_mux_u1__o_txpipe_lowpin_nt,
        output [7:0]  pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus,
        output [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate,
        output        pcie_pcs_tx_mux_u1__o_txpipe_pclkchangeack,
        output [3:0]  pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt,
        output [3:0]  pcie_pcs_tx_mux_u1__o_txpipe_powerdown,
        output [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_rate,
        output        pcie_pcs_tx_mux_u1__o_txpipe_rxelecidle_disable_a,
        output        pcie_pcs_tx_mux_u1__o_txpipe_rxeqclr,
        output        pcie_pcs_tx_mux_u1__o_txpipe_rxeqeval,
        output        pcie_pcs_tx_mux_u1__o_txpipe_rxeqinprogress,
        output        pcie_pcs_tx_mux_u1__o_txpipe_rxeqtraining,
        output        pcie_pcs_tx_mux_u1__o_txpipe_rxpolarity,
        output [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint,
        output        pcie_pcs_tx_mux_u1__o_txpipe_rxstandby,
        output        pcie_pcs_tx_mux_u1__o_txpipe_rxtermination,
        output        pcie_pcs_tx_mux_u1__o_txpipe_srisenable,
        output        pcie_pcs_tx_mux_u1__o_txpipe_txcmnmode_disable_a,
        output        pcie_pcs_tx_mux_u1__o_txpipe_txcompliance,
        output [39:0] pcie_pcs_tx_mux_u1__o_txpipe_txdata,
        output [3:0]  pcie_pcs_tx_mux_u1__o_txpipe_txdatak,
        output        pcie_pcs_tx_mux_u1__o_txpipe_txdatavalid,
        output [17:0] pcie_pcs_tx_mux_u1__o_txpipe_txdeemph,
        output        pcie_pcs_tx_mux_u1__o_txpipe_txdtctrx_lb,
        output        pcie_pcs_tx_mux_u1__o_txpipe_txelecidle,
        output [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_txmargin,
        output        pcie_pcs_tx_mux_u1__o_txpipe_txoneszeros,
        output        pcie_pcs_tx_mux_u1__o_txpipe_txstartblock,
        output        pcie_pcs_tx_mux_u1__o_txpipe_txswing,
        output [3:0]  pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader,
        output [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_width,
        input         o_txpipe2_asyncpowerchangeack,
        input         o_txpipe2_blockaligncontrol,
        input         o_txpipe2_cfg_hw_auto_sp_dis,
        input         o_txpipe2_dirchange,
        input         o_txpipe2_ebuf_mode,
        input         o_txpipe2_encodedecodebypass,
        input [5:0]   o_txpipe2_fs,
        input         o_txpipe2_getlocalpresetcoefficients,
        input         o_txpipe2_invalidrequest,
        input [5:0]   o_txpipe2_lf,
        input [4:0]   o_txpipe2_localpresetindex,
        input         o_txpipe2_lowpin_nt,
        input [7:0]   o_txpipe2_m2p_bus,
        input [2:0]   o_txpipe2_pclk_rate,
        input         o_txpipe2_pclkchangeack,
        input [3:0]   o_txpipe2_phy_mode_nt,
        input [3:0]   o_txpipe2_powerdown,
        input [2:0]   o_txpipe2_rate,
        input         o_txpipe2_rxelecidle_disable_a,
        input         o_txpipe2_rxeqclr,
        input         o_txpipe2_rxeqeval,
        input         o_txpipe2_rxeqinprogress,
        input         o_txpipe2_rxeqtraining,
        input         o_txpipe2_rxpolarity,
        input [2:0]   o_txpipe2_rxpresethint,
        input         o_txpipe2_rxstandby,
        input         o_txpipe2_rxtermination,
        input         o_txpipe2_srisenable,
        input         o_txpipe2_txcmnmode_disable_a,
        input         o_txpipe2_txcompliance,
        input [39:0]  o_txpipe2_txdata,
        input [3:0]   o_txpipe2_txdatak,
        input         o_txpipe2_txdatavalid,
        input [17:0]  o_txpipe2_txdeemph,
        input         o_txpipe2_txdtctrx_lb,
        input         o_txpipe2_txelecidle,
        input [2:0]   o_txpipe2_txmargin,
        input         o_txpipe2_txoneszeros,
        input         o_txpipe2_txstartblock,
        input         o_txpipe2_txswing,
        input [3:0]   o_txpipe2_txsyncheader,
        input [2:0]   o_txpipe2_width,
        output        pcie_pcs_tx_mux_u2__o_txpipe_asyncpowerchangeack,
        output        pcie_pcs_tx_mux_u2__o_txpipe_blockaligncontrol,
        output        pcie_pcs_tx_mux_u2__o_txpipe_cfg_hw_auto_sp_dis,
        output        pcie_pcs_tx_mux_u2__o_txpipe_dirchange,
        output        pcie_pcs_tx_mux_u2__o_txpipe_ebuf_mode,
        output        pcie_pcs_tx_mux_u2__o_txpipe_encodedecodebypass,
        output [5:0]  pcie_pcs_tx_mux_u2__o_txpipe_fs,
        output        pcie_pcs_tx_mux_u2__o_txpipe_getlocalpresetcoefficients,
        output        pcie_pcs_tx_mux_u2__o_txpipe_invalidrequest,
        output [5:0]  pcie_pcs_tx_mux_u2__o_txpipe_lf,
        output [4:0]  pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex,
        output        pcie_pcs_tx_mux_u2__o_txpipe_lowpin_nt,
        output [7:0]  pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus,
        output [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate,
        output        pcie_pcs_tx_mux_u2__o_txpipe_pclkchangeack,
        output [3:0]  pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt,
        output [3:0]  pcie_pcs_tx_mux_u2__o_txpipe_powerdown,
        output [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_rate,
        output        pcie_pcs_tx_mux_u2__o_txpipe_rxelecidle_disable_a,
        output        pcie_pcs_tx_mux_u2__o_txpipe_rxeqclr,
        output        pcie_pcs_tx_mux_u2__o_txpipe_rxeqeval,
        output        pcie_pcs_tx_mux_u2__o_txpipe_rxeqinprogress,
        output        pcie_pcs_tx_mux_u2__o_txpipe_rxeqtraining,
        output        pcie_pcs_tx_mux_u2__o_txpipe_rxpolarity,
        output [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint,
        output        pcie_pcs_tx_mux_u2__o_txpipe_rxstandby,
        output        pcie_pcs_tx_mux_u2__o_txpipe_rxtermination,
        output        pcie_pcs_tx_mux_u2__o_txpipe_srisenable,
        output        pcie_pcs_tx_mux_u2__o_txpipe_txcmnmode_disable_a,
        output        pcie_pcs_tx_mux_u2__o_txpipe_txcompliance,
        output [39:0] pcie_pcs_tx_mux_u2__o_txpipe_txdata,
        output [3:0]  pcie_pcs_tx_mux_u2__o_txpipe_txdatak,
        output        pcie_pcs_tx_mux_u2__o_txpipe_txdatavalid,
        output [17:0] pcie_pcs_tx_mux_u2__o_txpipe_txdeemph,
        output        pcie_pcs_tx_mux_u2__o_txpipe_txdtctrx_lb,
        output        pcie_pcs_tx_mux_u2__o_txpipe_txelecidle,
        output [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_txmargin,
        output        pcie_pcs_tx_mux_u2__o_txpipe_txoneszeros,
        output        pcie_pcs_tx_mux_u2__o_txpipe_txstartblock,
        output        pcie_pcs_tx_mux_u2__o_txpipe_txswing,
        output [3:0]  pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader,
        output [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_width,
        input         o_txpipe3_asyncpowerchangeack,
        input         o_txpipe3_blockaligncontrol,
        input         o_txpipe3_cfg_hw_auto_sp_dis,
        input         o_txpipe3_dirchange,
        input         o_txpipe3_ebuf_mode,
        input         o_txpipe3_encodedecodebypass,
        input [5:0]   o_txpipe3_fs,
        input         o_txpipe3_getlocalpresetcoefficients,
        input         o_txpipe3_invalidrequest,
        input [5:0]   o_txpipe3_lf,
        input [4:0]   o_txpipe3_localpresetindex,
        input         o_txpipe3_lowpin_nt,
        input [7:0]   o_txpipe3_m2p_bus,
        input [2:0]   o_txpipe3_pclk_rate,
        input         o_txpipe3_pclkchangeack,
        input [3:0]   o_txpipe3_phy_mode_nt,
        input [3:0]   o_txpipe3_powerdown,
        input [2:0]   o_txpipe3_rate,
        input         o_txpipe3_rxelecidle_disable_a,
        input         o_txpipe3_rxeqclr,
        input         o_txpipe3_rxeqeval,
        input         o_txpipe3_rxeqinprogress,
        input         o_txpipe3_rxeqtraining,
        input         o_txpipe3_rxpolarity,
        input [2:0]   o_txpipe3_rxpresethint,
        input         o_txpipe3_rxstandby,
        input         o_txpipe3_rxtermination,
        input         o_txpipe3_srisenable,
        input         o_txpipe3_txcmnmode_disable_a,
        input         o_txpipe3_txcompliance,
        input [39:0]  o_txpipe3_txdata,
        input [3:0]   o_txpipe3_txdatak,
        input         o_txpipe3_txdatavalid,
        input [17:0]  o_txpipe3_txdeemph,
        input         o_txpipe3_txdtctrx_lb,
        input         o_txpipe3_txelecidle,
        input [2:0]   o_txpipe3_txmargin,
        input         o_txpipe3_txoneszeros,
        input         o_txpipe3_txstartblock,
        input         o_txpipe3_txswing,
        input [3:0]   o_txpipe3_txsyncheader,
        input [2:0]   o_txpipe3_width,
        output        pcie_pcs_tx_mux_u3__o_txpipe_asyncpowerchangeack,
        output        pcie_pcs_tx_mux_u3__o_txpipe_blockaligncontrol,
        output        pcie_pcs_tx_mux_u3__o_txpipe_cfg_hw_auto_sp_dis,
        output        pcie_pcs_tx_mux_u3__o_txpipe_dirchange,
        output        pcie_pcs_tx_mux_u3__o_txpipe_ebuf_mode,
        output        pcie_pcs_tx_mux_u3__o_txpipe_encodedecodebypass,
        output [5:0]  pcie_pcs_tx_mux_u3__o_txpipe_fs,
        output        pcie_pcs_tx_mux_u3__o_txpipe_getlocalpresetcoefficients,
        output        pcie_pcs_tx_mux_u3__o_txpipe_invalidrequest,
        output [5:0]  pcie_pcs_tx_mux_u3__o_txpipe_lf,
        output [4:0]  pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex,
        output        pcie_pcs_tx_mux_u3__o_txpipe_lowpin_nt,
        output [7:0]  pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus,
        output [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate,
        output        pcie_pcs_tx_mux_u3__o_txpipe_pclkchangeack,
        output [3:0]  pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt,
        output [3:0]  pcie_pcs_tx_mux_u3__o_txpipe_powerdown,
        output [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_rate,
        output        pcie_pcs_tx_mux_u3__o_txpipe_rxelecidle_disable_a,
        output        pcie_pcs_tx_mux_u3__o_txpipe_rxeqclr,
        output        pcie_pcs_tx_mux_u3__o_txpipe_rxeqeval,
        output        pcie_pcs_tx_mux_u3__o_txpipe_rxeqinprogress,
        output        pcie_pcs_tx_mux_u3__o_txpipe_rxeqtraining,
        output        pcie_pcs_tx_mux_u3__o_txpipe_rxpolarity,
        output [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint,
        output        pcie_pcs_tx_mux_u3__o_txpipe_rxstandby,
        output        pcie_pcs_tx_mux_u3__o_txpipe_rxtermination,
        output        pcie_pcs_tx_mux_u3__o_txpipe_srisenable,
        output        pcie_pcs_tx_mux_u3__o_txpipe_txcmnmode_disable_a,
        output        pcie_pcs_tx_mux_u3__o_txpipe_txcompliance,
        output [39:0] pcie_pcs_tx_mux_u3__o_txpipe_txdata,
        output [3:0]  pcie_pcs_tx_mux_u3__o_txpipe_txdatak,
        output        pcie_pcs_tx_mux_u3__o_txpipe_txdatavalid,
        output [17:0] pcie_pcs_tx_mux_u3__o_txpipe_txdeemph,
        output        pcie_pcs_tx_mux_u3__o_txpipe_txdtctrx_lb,
        output        pcie_pcs_tx_mux_u3__o_txpipe_txelecidle,
        output [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_txmargin,
        output        pcie_pcs_tx_mux_u3__o_txpipe_txoneszeros,
        output        pcie_pcs_tx_mux_u3__o_txpipe_txstartblock,
        output        pcie_pcs_tx_mux_u3__o_txpipe_txswing,
        output [3:0]  pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader,
        output [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_width
);

        wire o_pcs_lane0_pclk_0;
        wire o_pcs_lane1_pclk_0;
        wire o_pcs_lane2_pclk_0;
        wire n1_5;
        wire pcie_pcs_clk_mux_u0__o_clk_0;
        wire pcie_pcs_clk_mux_u1__o_clk_0;
        wire pcie_pcs_clk_mux_u2__o_clk_0;
        wire pcie_pcs_clk_mux_u3__o_clk_0;

        wire x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__o_hps_clk_1;

        wire        x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_ebuf_mode_1;
        wire [3:0]  x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0;
        wire [1:0]  x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate_0;
        wire        x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxeqtraining_1;
        wire        x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxpolarity_1;
        wire        x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxtermination_1;
        wire [15:0] x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0;
        wire [1:0]  x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak_0;
        wire        x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdtctrx_lb_1;
        wire        x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txelecidle_1;
        wire        x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txoneszeros_1;

        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_asyncpowerchangeack_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_blockaligncontrol_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_dirchange_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_ebuf_mode_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_encodedecodebypass_0;
        wire [5:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_invalidrequest_0;
        wire [5:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0;
        wire [4:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lowpin_nt_0;
        wire [7:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclk_rate_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclkchangeack_0;
        wire [3:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0;
        wire [3:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rate_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqclr_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqeval_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqinprogress_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqtraining_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpolarity_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpresethint_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxstandby_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxtermination_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_srisenable_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txcompliance_0;
        wire [39:0] pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0;
        wire [3:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatavalid_0;
        wire [17:0] pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdtctrx_lb_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txelecidle_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txmargin_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txoneszeros_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txstartblock_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txswing_0;
        wire [3:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_width_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_asyncpowerchangeack_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_blockaligncontrol_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_dirchange_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_ebuf_mode_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_encodedecodebypass_0;
        wire [5:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_invalidrequest_0;
        wire [5:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0;
        wire [4:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lowpin_nt_0;
        wire [7:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclk_rate_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclkchangeack_0;
        wire [3:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0;
        wire [3:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rate_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqclr_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqeval_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqinprogress_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqtraining_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpolarity_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpresethint_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxstandby_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxtermination_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_srisenable_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txcompliance_0;
        wire [39:0] pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0;
        wire [3:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatavalid_0;
        wire [17:0] pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdtctrx_lb_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txelecidle_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txmargin_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txoneszeros_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txstartblock_0;
        wire        pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txswing_0;
        wire [3:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0;
        wire [2:0]  pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_width_0;

        wire [5:0]  pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0;
        wire [7:0]  pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0;
        wire [5:0]  pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0;
        wire        pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxcoefficientsvalid_0;
        wire [17:0] pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0;
        wire [7:0]  pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0;
        wire        pcie_pcs_rx_demux_u1__o_hps_rxpipe_pclkchangeok_0;
        wire        pcie_pcs_rx_demux_u1__o_hps_rxpipe_phystatus_0;
        wire [39:0] pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0;
        wire [3:0]  pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0;
        wire        pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatavalid_0;
        wire        pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxelecidlea_0;
        wire        pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstandbystatus_0;
        wire        pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstartblock_0;
        wire [2:0]  pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstatus_0;
        wire [3:0]  pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0;
        wire        pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxvalid_0;
        wire [5:0]  pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0;
        wire [7:0]  pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0;
        wire [5:0]  pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0;
        wire        pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxcoefficientsvalid_0;
        wire [17:0] pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0;
        wire [7:0]  pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0;
        wire        pcie_pcs_rx_demux_u2__o_hps_rxpipe_pclkchangeok_0;
        wire        pcie_pcs_rx_demux_u2__o_hps_rxpipe_phystatus_0;
        wire [39:0] pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0;
        wire [3:0]  pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0;
        wire        pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatavalid_0;
        wire        pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxelecidlea_0;
        wire        pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstandbystatus_0;
        wire        pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstartblock_0;
        wire [2:0]  pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstatus_0;
        wire [3:0]  pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0;
        wire        pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxvalid_0;
        wire        x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_phystatus_1;
        wire [15:0] x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0;
        wire [1:0]  x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak_0;
        wire        x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxelecidle_a_1;
        wire [2:0]  x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus_0;
        wire        x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxvalid_1;

        wire o_pcs0_pipe_rst_n_0;
        wire o_pcs1_pipe_rst_n_0;
        wire o_pcs2_pipe_rst_n_0;
        wire o_pcs3_pipe_rst_n_0;
        wire x_mux_sm_hssi_pcie_pcs_rst_mux_1__i_hps_rst_rstn_1;
        wire x_mux_sm_hssi_pcie_pcs_rst_mux_2__i_hps_rst_rstn_1;
        wire pcie_pcs_rst_mux_u0__o_rstn_0;
        wire pcie_pcs_rst_mux_u1__o_rstn_0;
        wire pcie_pcs_rst_mux_u2__o_rstn_0;
        wire pcie_pcs_rst_mux_u3__o_rstn_0;

        wire [5:0]  pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0;
        wire [7:0]  pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  pcie_pcs_lane_u0__o_rxpipe_localfs_0;
        wire [5:0]  pcie_pcs_lane_u0__o_rxpipe_locallf_0;
        wire        pcie_pcs_lane_u0__o_rxpipe_localtxcoefficientsvalid_0;
        wire [17:0] pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0;
        wire [7:0]  pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0;
        wire        pcie_pcs_lane_u0__o_rxpipe_pclkchangeok_0;
        wire        pcie_pcs_lane_u0__o_rxpipe_phystatus_0;
        wire [39:0] pcie_pcs_lane_u0__o_rxpipe_rxdata_0;
        wire [3:0]  pcie_pcs_lane_u0__o_rxpipe_rxdatak_0;
        wire        pcie_pcs_lane_u0__o_rxpipe_rxdatavalid_0;
        wire        pcie_pcs_lane_u0__o_rxpipe_rxelecidlea_0;
        wire        pcie_pcs_lane_u0__o_rxpipe_rxstandbystatus_0;
        wire        pcie_pcs_lane_u0__o_rxpipe_rxstartblock_0;
        wire [2:0]  pcie_pcs_lane_u0__o_rxpipe_rxstatus_0;
        wire [3:0]  pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0;
        wire        pcie_pcs_lane_u0__o_rxpipe_rxvalid_0;
        wire [5:0]  o_same_quad_rxpipe0_dirfeedback_0;
        wire [7:0]  o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  o_same_quad_rxpipe0_localfs_0;
        wire [5:0]  o_same_quad_rxpipe0_locallf_0;
        wire        o_same_quad_rxpipe0_localtxcoefficientsvalid_0;
        wire [17:0] o_same_quad_rxpipe0_localtxpresetcoefficients_0;
        wire [7:0]  o_same_quad_rxpipe0_p2m_bus_0;
        wire        o_same_quad_rxpipe0_pclkchangeok_0;
        wire        o_same_quad_rxpipe0_phystatus_0;
        wire [39:0] o_same_quad_rxpipe0_rxdata_0;
        wire [3:0]  o_same_quad_rxpipe0_rxdatak_0;
        wire        o_same_quad_rxpipe0_rxdatavalid_0;
        wire        o_same_quad_rxpipe0_rxelecidlea_0;
        wire        o_same_quad_rxpipe0_rxstandbystatus_0;
        wire        o_same_quad_rxpipe0_rxstartblock_0;
        wire [2:0]  o_same_quad_rxpipe0_rxstatus_0;
        wire [3:0]  o_same_quad_rxpipe0_rxsyncheader_0;
        wire        o_same_quad_rxpipe0_rxvalid_0;
        wire [5:0]  pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0;
        wire [7:0]  pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  pcie_pcs_lane_u1__o_rxpipe_localfs_0;
        wire [5:0]  pcie_pcs_lane_u1__o_rxpipe_locallf_0;
        wire        pcie_pcs_lane_u1__o_rxpipe_localtxcoefficientsvalid_0;
        wire [17:0] pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0;
        wire [7:0]  pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0;
        wire        pcie_pcs_lane_u1__o_rxpipe_pclkchangeok_0;
        wire        pcie_pcs_lane_u1__o_rxpipe_phystatus_0;
        wire [39:0] pcie_pcs_lane_u1__o_rxpipe_rxdata_0;
        wire [3:0]  pcie_pcs_lane_u1__o_rxpipe_rxdatak_0;
        wire        pcie_pcs_lane_u1__o_rxpipe_rxdatavalid_0;
        wire        pcie_pcs_lane_u1__o_rxpipe_rxelecidlea_0;
        wire        pcie_pcs_lane_u1__o_rxpipe_rxstandbystatus_0;
        wire        pcie_pcs_lane_u1__o_rxpipe_rxstartblock_0;
        wire [2:0]  pcie_pcs_lane_u1__o_rxpipe_rxstatus_0;
        wire [3:0]  pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0;
        wire        pcie_pcs_lane_u1__o_rxpipe_rxvalid_0;
        wire [5:0]  o_same_quad_rxpipe1_dirfeedback_0;
        wire [7:0]  o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  o_same_quad_rxpipe1_localfs_0;
        wire [5:0]  o_same_quad_rxpipe1_locallf_0;
        wire        o_same_quad_rxpipe1_localtxcoefficientsvalid_0;
        wire [17:0] o_same_quad_rxpipe1_localtxpresetcoefficients_0;
        wire [7:0]  o_same_quad_rxpipe1_p2m_bus_0;
        wire        o_same_quad_rxpipe1_pclkchangeok_0;
        wire        o_same_quad_rxpipe1_phystatus_0;
        wire [39:0] o_same_quad_rxpipe1_rxdata_0;
        wire [3:0]  o_same_quad_rxpipe1_rxdatak_0;
        wire        o_same_quad_rxpipe1_rxdatavalid_0;
        wire        o_same_quad_rxpipe1_rxelecidlea_0;
        wire        o_same_quad_rxpipe1_rxstandbystatus_0;
        wire        o_same_quad_rxpipe1_rxstartblock_0;
        wire [2:0]  o_same_quad_rxpipe1_rxstatus_0;
        wire [3:0]  o_same_quad_rxpipe1_rxsyncheader_0;
        wire        o_same_quad_rxpipe1_rxvalid_0;
        wire [5:0]  pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0;
        wire [7:0]  pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  pcie_pcs_lane_u2__o_rxpipe_localfs_0;
        wire [5:0]  pcie_pcs_lane_u2__o_rxpipe_locallf_0;
        wire        pcie_pcs_lane_u2__o_rxpipe_localtxcoefficientsvalid_0;
        wire [17:0] pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0;
        wire [7:0]  pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0;
        wire        pcie_pcs_lane_u2__o_rxpipe_pclkchangeok_0;
        wire        pcie_pcs_lane_u2__o_rxpipe_phystatus_0;
        wire [39:0] pcie_pcs_lane_u2__o_rxpipe_rxdata_0;
        wire [3:0]  pcie_pcs_lane_u2__o_rxpipe_rxdatak_0;
        wire        pcie_pcs_lane_u2__o_rxpipe_rxdatavalid_0;
        wire        pcie_pcs_lane_u2__o_rxpipe_rxelecidlea_0;
        wire        pcie_pcs_lane_u2__o_rxpipe_rxstandbystatus_0;
        wire        pcie_pcs_lane_u2__o_rxpipe_rxstartblock_0;
        wire [2:0]  pcie_pcs_lane_u2__o_rxpipe_rxstatus_0;
        wire [3:0]  pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0;
        wire        pcie_pcs_lane_u2__o_rxpipe_rxvalid_0;
        wire [5:0]  o_same_quad_rxpipe2_dirfeedback_0;
        wire [7:0]  o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  o_same_quad_rxpipe2_localfs_0;
        wire [5:0]  o_same_quad_rxpipe2_locallf_0;
        wire        o_same_quad_rxpipe2_localtxcoefficientsvalid_0;
        wire [17:0] o_same_quad_rxpipe2_localtxpresetcoefficients_0;
        wire [7:0]  o_same_quad_rxpipe2_p2m_bus_0;
        wire        o_same_quad_rxpipe2_pclkchangeok_0;
        wire        o_same_quad_rxpipe2_phystatus_0;
        wire [39:0] o_same_quad_rxpipe2_rxdata_0;
        wire [3:0]  o_same_quad_rxpipe2_rxdatak_0;
        wire        o_same_quad_rxpipe2_rxdatavalid_0;
        wire        o_same_quad_rxpipe2_rxelecidlea_0;
        wire        o_same_quad_rxpipe2_rxstandbystatus_0;
        wire        o_same_quad_rxpipe2_rxstartblock_0;
        wire [2:0]  o_same_quad_rxpipe2_rxstatus_0;
        wire [3:0]  o_same_quad_rxpipe2_rxsyncheader_0;
        wire        o_same_quad_rxpipe2_rxvalid_0;
        wire [5:0]  pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0;
        wire [7:0]  pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  pcie_pcs_lane_u3__o_rxpipe_localfs_0;
        wire [5:0]  pcie_pcs_lane_u3__o_rxpipe_locallf_0;
        wire        pcie_pcs_lane_u3__o_rxpipe_localtxcoefficientsvalid_0;
        wire [17:0] pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0;
        wire [7:0]  pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0;
        wire        pcie_pcs_lane_u3__o_rxpipe_pclkchangeok_0;
        wire        pcie_pcs_lane_u3__o_rxpipe_phystatus_0;
        wire [39:0] pcie_pcs_lane_u3__o_rxpipe_rxdata_0;
        wire [3:0]  pcie_pcs_lane_u3__o_rxpipe_rxdatak_0;
        wire        pcie_pcs_lane_u3__o_rxpipe_rxdatavalid_0;
        wire        pcie_pcs_lane_u3__o_rxpipe_rxelecidlea_0;
        wire        pcie_pcs_lane_u3__o_rxpipe_rxstandbystatus_0;
        wire        pcie_pcs_lane_u3__o_rxpipe_rxstartblock_0;
        wire [2:0]  pcie_pcs_lane_u3__o_rxpipe_rxstatus_0;
        wire [3:0]  pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0;
        wire        pcie_pcs_lane_u3__o_rxpipe_rxvalid_0;
        wire [5:0]  o_same_quad_rxpipe3_dirfeedback_0;
        wire [7:0]  o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0;
        wire [5:0]  o_same_quad_rxpipe3_localfs_0;
        wire [5:0]  o_same_quad_rxpipe3_locallf_0;
        wire        o_same_quad_rxpipe3_localtxcoefficientsvalid_0;
        wire [17:0] o_same_quad_rxpipe3_localtxpresetcoefficients_0;
        wire [7:0]  o_same_quad_rxpipe3_p2m_bus_0;
        wire        o_same_quad_rxpipe3_pclkchangeok_0;
        wire        o_same_quad_rxpipe3_phystatus_0;
        wire [39:0] o_same_quad_rxpipe3_rxdata_0;
        wire [3:0]  o_same_quad_rxpipe3_rxdatak_0;
        wire        o_same_quad_rxpipe3_rxdatavalid_0;
        wire        o_same_quad_rxpipe3_rxelecidlea_0;
        wire        o_same_quad_rxpipe3_rxstandbystatus_0;
        wire        o_same_quad_rxpipe3_rxstartblock_0;
        wire [2:0]  o_same_quad_rxpipe3_rxstatus_0;
        wire [3:0]  o_same_quad_rxpipe3_rxsyncheader_0;
        wire        o_same_quad_rxpipe3_rxvalid_0;

        wire tmp_6226;
        wire tmp_6227;
        wire tmp_6228;
        wire tmp_6229;
        wire tmp_6230;
        wire tmp_6231;
        wire tmp_6232;
        wire tmp_6233;
        wire tmp_6234;
        wire tmp_6235;
        wire tmp_6236;
        wire tmp_6237;
        wire tmp_6238;
        wire tmp_6239;
        wire tmp_6240;
        wire tmp_6241;
        wire tmp_6242;
        wire tmp_6243;
        wire tmp_6244;
        wire tmp_6245;
        wire tmp_6246;
        wire tmp_6247;
        wire tmp_6248;
        wire tmp_6249;
        wire tmp_6250;
        wire tmp_6251;
        wire tmp_6252;
        wire tmp_6253;
        wire tmp_6254;
        wire tmp_6255;
        wire tmp_6256;
        wire tmp_6257;
        wire tmp_6258;
        wire tmp_6259;
        wire tmp_6260;
        wire tmp_6261;
        wire tmp_6262;
        wire tmp_6263;
        wire tmp_6264;
        wire tmp_6265;
        wire tmp_6266;
        wire tmp_6267;
        wire tmp_6268;
        wire tmp_6269;
        wire tmp_6270;
        wire tmp_6271;
        wire tmp_6272;
        wire tmp_6273;
        wire tmp_6274;
        wire tmp_6275;
        wire tmp_6276;
        wire tmp_6277;
        wire tmp_6278;
        wire tmp_6279;
        wire tmp_6280;
        wire tmp_6281;
        wire tmp_6282;
        wire tmp_6283;
        wire tmp_6284;
        wire tmp_6285;
        wire tmp_6286;
        wire tmp_6287;
        wire tmp_6288;
        wire tmp_6289;
        wire tmp_6290;
        wire tmp_6291;
        wire tmp_6292;
        wire tmp_6293;
        wire tmp_6294;
        wire tmp_6295;
        wire tmp_6296;
        wire tmp_6297;
        wire tmp_6298;
        wire tmp_6299;
        wire tmp_6300;
        wire tmp_6301;
        wire tmp_6302;
        wire tmp_6303;
        wire tmp_6304;
        wire tmp_6305;
        wire tmp_6306;
        wire tmp_6307;
        wire tmp_6308;
        wire tmp_6309;
        wire tmp_6310;
        wire tmp_6311;
        wire tmp_6312;
        wire tmp_6313;
        wire tmp_6314;
        wire tmp_6315;
        wire tmp_6316;
        wire tmp_6317;
        wire tmp_6318;
        wire tmp_6319;
        wire tmp_6320;
        wire tmp_6321;
        wire tmp_6322;
        wire tmp_6323;
        wire tmp_6324;
        wire tmp_6325;
        wire tmp_6326;
        wire tmp_6327;
        wire tmp_6328;
        wire tmp_6329;
        wire tmp_6330;
        wire tmp_6331;
        wire tmp_6332;
        wire tmp_6333;
        wire tmp_6334;
        wire tmp_6335;
        wire tmp_6336;
        wire tmp_6337;
        wire tmp_6338;
        wire tmp_6339;
        wire tmp_6340;
        wire tmp_6341;
        wire tmp_6342;
        wire tmp_6343;
        wire tmp_6344;
        wire tmp_6345;
        wire tmp_6346;
        wire tmp_6347;
        wire tmp_6348;
        wire tmp_6349;
        wire tmp_6350;
        wire tmp_6351;
        wire tmp_6352;
        wire tmp_6353;
        wire tmp_6354;
        wire tmp_6355;
        wire tmp_6356;
        wire tmp_6357;
        wire tmp_6358;
        wire tmp_6359;
        wire tmp_6360;
        wire tmp_6361;
        wire tmp_6362;
        wire tmp_6363;
        wire tmp_6364;
        wire tmp_6365;
        wire tmp_6366;
        wire tmp_6367;
        wire tmp_6368;
        wire tmp_6369;
        wire tmp_6370;
        wire tmp_6371;
        wire tmp_6372;
        wire tmp_6373;
        wire tmp_6374;
        wire tmp_6375;
        wire tmp_6376;
        wire tmp_6377;
        wire tmp_6378;
        wire tmp_6379;
        wire tmp_6380;
        wire tmp_6381;
        wire tmp_6382;
        wire tmp_6383;
        wire tmp_6384;
        wire tmp_6385;
        wire tmp_6386;
        wire tmp_6387;
        wire tmp_6388;
        wire tmp_6389;
        wire tmp_6390;
        wire tmp_6391;
        wire tmp_6392;
        wire tmp_6393;
        wire tmp_6394;
        wire tmp_6395;
        wire tmp_6396;
        wire tmp_6397;
        wire tmp_6398;
        wire tmp_6399;
        wire tmp_6400;
        wire tmp_6401;
        wire tmp_6402;
        wire tmp_6403;
        wire tmp_6404;
        wire tmp_6405;
        wire tmp_6406;
        wire tmp_6407;
        wire tmp_6408;
        wire tmp_6409;
        wire tmp_6410;
        wire tmp_6411;
        wire tmp_6412;
        wire tmp_6413;
        wire tmp_6414;
        wire tmp_6415;
        wire tmp_6416;
        wire tmp_6417;
        wire tmp_6418;
        wire tmp_6419;
        wire tmp_6420;
        wire tmp_6421;
        wire tmp_6422;
        wire tmp_6423;
        wire tmp_6424;
        wire tmp_6425;
        wire tmp_6426;
        wire tmp_6427;
        wire tmp_6428;
        wire tmp_6429;
        wire tmp_6430;
        wire tmp_6431;
        wire tmp_6432;
        wire tmp_6433;
        wire tmp_6434;
        wire tmp_6435;
        wire tmp_6436;
        wire tmp_6437;
        wire tmp_6438;
        wire tmp_6439;
        wire tmp_6440;
        wire tmp_6441;
        wire tmp_6442;
        wire tmp_6443;
        wire tmp_6444;
        wire tmp_6445;
        wire tmp_6446;
        wire tmp_6447;
        wire tmp_6448;
        wire tmp_6449;
        wire tmp_6450;
        wire tmp_6451;
        wire tmp_6452;
        wire tmp_6453;
        wire tmp_6454;
        wire tmp_6455;
        wire tmp_6456;
        wire tmp_6457;
        wire tmp_6458;
        wire tmp_6459;
        wire tmp_6460;
        wire tmp_6461;
        wire tmp_6462;
        wire tmp_6463;
        wire tmp_6464;
        wire tmp_6465;
        wire tmp_6466;
        wire tmp_6467;
        wire tmp_6468;
        wire tmp_6469;
        wire tmp_6470;
        wire tmp_6471;
        wire tmp_6472;
        wire tmp_6473;
        wire tmp_6474;
        wire tmp_6475;
        wire tmp_6476;
        wire tmp_6477;
        wire tmp_6478;
        wire tmp_6479;
        wire tmp_6480;
        wire tmp_6481;
        wire tmp_6482;
        wire tmp_6483;
        wire tmp_6484;
        wire tmp_6485;
        wire tmp_6486;
        wire tmp_6487;
        wire tmp_6488;
        wire tmp_6489;
        wire tmp_6490;
        wire tmp_6491;
        wire tmp_6492;
        wire tmp_6493;
        wire tmp_6494;
        wire tmp_6495;
        wire tmp_6496;
        wire tmp_6497;
        wire tmp_6498;
        wire tmp_6499;
        wire tmp_6500;
        wire tmp_6501;
        wire tmp_6502;
        wire tmp_6503;
        wire tmp_6504;
        wire tmp_6505;
        wire tmp_6506;
        wire tmp_6507;
        wire tmp_6508;
        wire tmp_6509;
        wire tmp_6510;
        wire tmp_6511;
        wire tmp_6512;
        wire tmp_6513;
        wire tmp_6514;
        wire tmp_6515;
        wire tmp_6516;
        wire tmp_6517;
        wire tmp_6518;
        wire tmp_6519;
        wire tmp_6520;
        wire tmp_6521;
        wire tmp_6522;
        wire tmp_6523;
        wire tmp_6524;
        wire tmp_6525;
        wire tmp_6526;
        wire tmp_6527;
        wire tmp_6528;
        wire tmp_6529;
        wire tmp_6530;
        wire tmp_6531;
        wire tmp_6532;
        wire tmp_6533;
        wire tmp_6534;
        wire tmp_6535;
        wire tmp_6536;
        wire tmp_6537;
        wire tmp_6538;
        wire tmp_6539;
        wire tmp_6540;
        wire tmp_6541;
        wire tmp_6542;
        wire tmp_6543;
        wire tmp_6544;
        wire tmp_6545;
        wire tmp_6546;
        wire tmp_6547;
        wire tmp_6548;
        wire tmp_6549;
        wire tmp_6550;
        wire tmp_6551;
        wire tmp_6552;
        wire tmp_6553;
        wire tmp_6554;
        wire tmp_6555;
        wire tmp_6556;
        wire tmp_6557;
        wire tmp_6558;
        wire tmp_6559;
        wire tmp_6560;
        wire tmp_6561;
        wire tmp_6562;
        wire tmp_6563;
        wire tmp_6564;
        wire tmp_6565;
        wire tmp_6566;
        wire tmp_6567;
        wire tmp_6568;
        wire tmp_6569;
        wire tmp_6570;
        wire tmp_6571;
        wire tmp_6572;
        wire tmp_6573;
        wire tmp_6574;
        wire tmp_6575;
        wire tmp_6576;
        wire tmp_6577;
        wire tmp_6578;
        wire tmp_6579;
        wire tmp_6580;
        wire tmp_6581;
        wire tmp_6582;
        wire tmp_6583;
        wire tmp_6584;
        wire tmp_6585;
        wire tmp_6586;
        wire tmp_6587;
        wire tmp_6588;
        wire tmp_6589;
        wire tmp_6590;
        wire tmp_6591;
        wire tmp_6592;
        wire tmp_6593;
        wire tmp_6594;
        wire tmp_6595;
        wire tmp_6596;
        wire tmp_6597;
        wire tmp_6598;
        wire tmp_6599;
        wire tmp_6600;
        wire tmp_6601;
        wire tmp_6602;
        wire tmp_6603;
        wire tmp_6604;
        wire tmp_6605;
        wire tmp_6606;
        wire tmp_6607;
        wire tmp_6608;
        wire tmp_6609;
        wire tmp_6610;
        wire tmp_6611;
        wire tmp_6612;
        wire tmp_6613;
        wire tmp_6614;
        wire tmp_6615;
        wire tmp_6616;
        wire tmp_6617;
        wire tmp_6618;
        wire tmp_6619;
        wire tmp_6620;
        wire tmp_6621;
        wire tmp_6622;
        wire tmp_6623;
        wire tmp_6624;
        wire tmp_6625;
        wire tmp_6626;
        wire tmp_6627;
        wire tmp_6628;
        wire tmp_6629;
        wire tmp_6630;
        wire tmp_6631;
        wire tmp_6632;
        wire tmp_6633;
        wire tmp_6634;
        wire tmp_6635;
        wire tmp_6636;
        wire tmp_6637;
        wire tmp_6638;
        wire tmp_6639;
        wire tmp_6640;
        wire tmp_6641;
        wire tmp_6642;
        wire tmp_6643;
        wire tmp_6644;
        wire tmp_6645;
        wire tmp_6646;
        wire tmp_6647;
        wire tmp_6648;
        wire tmp_6649;
        wire tmp_6650;
        wire tmp_6651;
        wire tmp_6652;
        wire tmp_6653;
        wire tmp_6654;
        wire tmp_6655;
        wire tmp_6656;
        wire tmp_6657;
        wire tmp_6658;
        wire tmp_6659;
        wire tmp_6660;
        wire tmp_6661;
        wire tmp_6662;
        wire tmp_6663;
        wire tmp_6664;
        wire tmp_6665;
        wire tmp_6666;
        wire tmp_6667;
        wire tmp_6668;
        wire tmp_6669;
        wire tmp_6670;
        wire tmp_6671;
        wire tmp_6672;
        wire tmp_6673;
        wire tmp_6674;
        wire tmp_6675;
        wire tmp_6676;
        wire tmp_6677;
        wire tmp_6678;
        wire tmp_6679;
        wire tmp_6680;
        wire tmp_6681;
        wire tmp_6682;
        wire tmp_6683;
        wire tmp_6684;
        wire tmp_6685;
        wire tmp_6686;
        wire tmp_6687;
        wire tmp_6688;
        wire tmp_6689;
        wire tmp_6690;
        wire tmp_6691;
        wire tmp_6692;
        wire tmp_6693;
        wire tmp_6694;
        wire tmp_6695;
        wire tmp_6696;
        wire tmp_6697;
        wire tmp_6698;
        wire tmp_6699;
        wire tmp_6700;
        wire tmp_6701;
        wire tmp_6702;
        wire tmp_6703;
        wire tmp_6704;
        wire tmp_6705;
        wire tmp_6706;
        wire tmp_6707;
        wire tmp_6708;
        wire tmp_6709;
        wire tmp_6710;
        wire tmp_6711;
        wire tmp_6712;
        wire tmp_6713;
        wire tmp_6714;
        wire tmp_6715;
        wire tmp_6716;
        wire tmp_6717;
        wire tmp_6718;
        wire tmp_6719;
        wire tmp_6720;
        wire tmp_6721;
        wire tmp_6722;
        wire tmp_6723;
        wire tmp_6724;
        wire tmp_6725;
        wire tmp_6726;
        wire tmp_6727;
        wire tmp_6728;
        wire tmp_6729;
        wire tmp_6730;
        wire tmp_6731;
        wire tmp_6732;
        wire tmp_6733;
        wire tmp_6734;
        wire tmp_6735;
        wire tmp_6736;
        wire tmp_6737;
        wire tmp_6738;
        wire tmp_6739;
        wire tmp_6740;
        wire tmp_6741;
        wire tmp_6742;
        wire tmp_6743;
        wire tmp_6744;
        wire tmp_6745;
        wire tmp_6746;
        wire tmp_6747;
        wire tmp_6748;
        wire tmp_6749;
        wire tmp_6750;
        wire tmp_6751;
        wire tmp_6752;
        wire tmp_6753;
        wire tmp_6754;
        wire tmp_6755;
        wire tmp_6756;
        wire tmp_6757;
        wire tmp_6758;
        wire tmp_6759;
        wire tmp_6760;
        wire tmp_6761;
        wire tmp_6762;
        wire tmp_6763;
        wire tmp_6764;
        wire tmp_6765;
        wire tmp_6766;
        wire tmp_6767;
        wire tmp_6768;
        wire tmp_6769;
        wire tmp_6770;
        wire tmp_6771;
        wire tmp_6772;
        wire tmp_6773;
        wire tmp_6774;
        wire tmp_6775;
        wire tmp_6776;
        wire tmp_6777;
        wire tmp_6778;
        wire tmp_6779;
        wire tmp_6780;
        wire tmp_6781;
        wire tmp_6782;
        wire tmp_6783;
        wire tmp_6784;
        wire tmp_6785;
        wire tmp_6786;
        wire tmp_6787;
        wire tmp_6788;
        wire tmp_6789;
        wire tmp_6790;
        wire tmp_6791;
        wire tmp_6792;
        wire tmp_6793;
        wire tmp_6794;
        wire tmp_6795;
        wire tmp_6796;
        wire tmp_6797;
        wire tmp_6798;
        wire tmp_6799;
        wire tmp_6800;
        wire tmp_6801;
        wire tmp_6802;
        wire tmp_6803;
        wire tmp_6804;
        wire tmp_6805;
        wire tmp_6806;
        wire tmp_6807;
        wire tmp_6808;
        wire tmp_6809;
        wire tmp_6810;
        wire tmp_6811;
        wire tmp_6812;
        wire tmp_6813;
        wire tmp_6814;
        wire tmp_6815;
        wire tmp_6816;
        wire tmp_6817;
        wire tmp_6818;
        wire tmp_6819;
        wire tmp_6820;
        wire tmp_6821;
        wire tmp_6822;
        wire tmp_6823;
        wire tmp_6824;
        wire tmp_6825;
        wire tmp_6826;
        wire tmp_6827;
        wire tmp_6828;
        wire tmp_6829;
        wire tmp_6830;
        wire tmp_6831;
        wire tmp_6832;
        wire tmp_6833;
        wire tmp_6834;
        wire tmp_6835;
        wire tmp_6836;
        wire tmp_6837;
        wire tmp_6838;
        wire tmp_6839;
        wire tmp_6840;
        wire tmp_6841;
        wire tmp_6842;
        wire tmp_6843;
        wire tmp_6844;
        wire tmp_6845;
        wire tmp_6846;
        wire tmp_6847;
        wire tmp_6848;
        wire tmp_6849;
        wire tmp_6850;
        wire tmp_6851;
        wire tmp_6852;
        wire tmp_6853;
        wire tmp_6854;
        wire tmp_6855;
        wire tmp_6856;
        wire tmp_6857;
        wire tmp_6858;
        wire tmp_6859;
        wire tmp_6860;
        wire tmp_6861;
        wire tmp_6862;
        wire tmp_6863;
        wire tmp_6864;
        wire tmp_6865;
        wire tmp_6866;
        wire tmp_6867;
        wire tmp_6868;
        wire tmp_6869;
        wire tmp_6870;
        wire tmp_6871;
        wire tmp_6872;
        wire tmp_6873;
        wire tmp_6874;
        wire tmp_6875;
        wire tmp_6876;
        wire tmp_6877;
        wire tmp_6878;
        wire tmp_6879;
        wire tmp_6880;
        wire tmp_6881;
        wire tmp_6882;
        wire tmp_6883;
        wire tmp_6884;
        wire tmp_6885;
        wire tmp_6886;
        wire tmp_6887;
        wire tmp_6888;
        wire tmp_6889;
        wire tmp_6890;
        wire tmp_6891;
        wire tmp_6892;
        wire tmp_6893;
        wire tmp_6894;
        wire tmp_6895;
        wire tmp_6896;
        wire tmp_6897;
        wire tmp_6898;
        wire tmp_6899;
        wire tmp_6900;
        wire tmp_6901;
        wire tmp_6902;
        wire tmp_6903;
        wire tmp_6904;
        wire tmp_6905;
        wire tmp_6906;
        wire tmp_6907;
        wire tmp_6908;
        wire tmp_6909;
        wire tmp_6910;
        wire tmp_6911;
        wire tmp_6912;
        wire tmp_6913;
        wire tmp_6914;
        wire tmp_6915;
        wire tmp_6916;
        wire tmp_6917;
        wire tmp_6918;
        wire tmp_6919;
        wire tmp_6920;
        wire tmp_6921;
        wire tmp_6922;
        wire tmp_6923;
        wire tmp_6924;
        wire tmp_6925;
        wire tmp_6926;
        wire tmp_6927;
        wire tmp_6928;
        wire tmp_6929;
        wire tmp_6930;
        wire tmp_6931;
        wire tmp_6932;
        wire tmp_6933;
        wire tmp_6934;
        wire tmp_6935;
        wire tmp_6936;
        wire tmp_6937;
        wire tmp_6938;
        wire tmp_6939;
        wire tmp_6940;
        wire tmp_6941;
        wire tmp_6942;
        wire tmp_6943;
        wire tmp_6944;
        wire tmp_6945;
        wire tmp_6946;
        wire tmp_6947;
        wire tmp_6948;
        wire tmp_6949;
        wire tmp_6950;
        wire tmp_6951;
        wire tmp_6952;
        wire tmp_6953;
        wire tmp_6954;
        wire tmp_6955;
        wire tmp_6956;
        wire tmp_6957;
        wire tmp_6958;
        wire tmp_6959;
        wire tmp_6960;
        wire tmp_6961;
        wire tmp_6962;
        wire tmp_6963;
        wire tmp_6964;
        wire tmp_6965;
        wire tmp_6966;
        wire tmp_6967;
        wire tmp_6968;
        wire tmp_6969;
        wire tmp_6970;
        wire tmp_6971;
        wire tmp_6972;
        wire tmp_6973;
        wire tmp_6974;
        wire tmp_6975;
        wire tmp_6976;
        wire tmp_6977;
        wire tmp_6978;
        wire tmp_6979;
        wire tmp_6980;
        wire tmp_6981;
        wire tmp_6982;
        wire tmp_6983;
        wire tmp_6984;
        wire tmp_6985;
        wire tmp_6986;
        wire tmp_6987;
        wire tmp_6988;
        wire tmp_6989;
        wire tmp_6990;
        wire tmp_6991;
        wire tmp_6992;
        wire tmp_6993;
        wire tmp_6994;
        wire tmp_6995;
        wire tmp_6996;
        wire tmp_6997;
        wire tmp_6998;
        wire tmp_6999;
        wire tmp_7000;
        wire tmp_7001;
        wire tmp_7002;
        wire tmp_7003;
        wire tmp_7004;
        wire tmp_7005;
        wire tmp_7006;
        wire tmp_7007;
        wire tmp_7008;
        wire tmp_7009;
        wire tmp_7010;
        wire tmp_7011;
        wire tmp_7012;
        wire tmp_7013;
        wire tmp_7014;
        wire tmp_7015;
        wire tmp_7016;
        wire tmp_7017;
        wire tmp_7018;
        wire tmp_7019;
        wire tmp_7020;
        wire tmp_7021;
        wire tmp_7022;
        wire tmp_7023;
        wire tmp_7024;
        wire tmp_7025;
        wire tmp_7026;
        wire tmp_7027;
        wire tmp_7028;
        wire tmp_7029;
        wire tmp_7030;
        wire tmp_7031;
        wire tmp_7032;
        wire tmp_7033;
        wire tmp_7034;
        wire tmp_7035;
        wire tmp_7036;
        wire tmp_7037;
        wire tmp_7038;
        wire tmp_7039;
        wire tmp_7040;
        wire tmp_7041;
        wire tmp_7042;
        wire tmp_7043;
        wire tmp_7044;
        wire tmp_7045;
        wire tmp_7046;
        wire tmp_7047;
        wire tmp_7048;
        wire tmp_7049;
        wire tmp_7050;
        wire tmp_7051;
        wire tmp_7052;
        wire tmp_7053;
        wire tmp_7054;
        wire tmp_7055;
        wire tmp_7056;
        wire tmp_7057;
        wire tmp_7058;
        wire tmp_7059;
        wire tmp_7060;
        wire tmp_7061;
        wire tmp_7062;
        wire tmp_7063;
        wire tmp_7064;
        wire tmp_7065;
        wire tmp_7066;
        wire tmp_7067;
        wire tmp_7068;
        wire tmp_7069;
        wire tmp_7070;
        wire tmp_7071;
        wire tmp_7072;
        wire tmp_7073;
        wire tmp_7074;
        wire tmp_7075;
        wire tmp_7076;
        wire tmp_7077;
        wire tmp_7078;
        wire tmp_7079;
        wire tmp_7080;
        wire tmp_7081;
        wire tmp_7082;
        wire tmp_7083;
        wire tmp_7084;
        wire tmp_7085;
        wire tmp_7086;
        wire tmp_7087;
        wire tmp_7088;
        wire tmp_7089;
        wire tmp_7090;
        wire tmp_7091;
        wire tmp_7092;
        wire tmp_7093;
        wire tmp_7094;
        wire tmp_7095;
        wire tmp_7096;
        wire tmp_7097;
        wire tmp_7098;
        wire tmp_7099;
        wire tmp_7100;
        wire tmp_7101;
        wire tmp_7102;
        wire tmp_7103;
        wire tmp_7104;
        wire tmp_7105;
        wire tmp_7106;
        wire tmp_7107;
        wire tmp_7108;
        wire tmp_7109;
        wire tmp_7110;
        wire tmp_7111;
        wire tmp_7112;
        wire tmp_7113;
        wire tmp_7114;
        wire tmp_7115;
        wire tmp_7116;
        wire tmp_7117;
        wire tmp_7118;
        wire tmp_7119;
        wire tmp_7120;
        wire tmp_7121;
        wire tmp_7122;
        wire tmp_7123;
        wire tmp_7124;
        wire tmp_7125;
        wire tmp_7126;
        wire tmp_7127;
        wire tmp_7128;
        wire tmp_7129;
        wire tmp_7130;
        wire tmp_7131;
        wire tmp_7132;
        wire tmp_7133;
        wire tmp_7134;
        wire tmp_7135;
        wire tmp_7136;
        wire tmp_7137;
        wire tmp_7138;
        wire tmp_7139;
        wire tmp_7140;
        wire tmp_7141;
        wire tmp_7142;
        wire tmp_7143;
        wire tmp_7144;
        wire tmp_7145;
        wire tmp_7146;
        wire tmp_7147;
        wire tmp_7148;
        wire tmp_7149;
        wire tmp_7150;
        wire tmp_7151;
        wire tmp_7152;
        wire tmp_7153;
        wire tmp_7154;
        wire tmp_7155;
        wire tmp_7156;
        wire tmp_7157;
        wire tmp_7158;
        wire tmp_7159;
        wire tmp_7160;
        wire tmp_7161;
        wire tmp_7162;
        wire tmp_7163;
        wire tmp_7164;
        wire tmp_7165;
        wire tmp_7166;
        wire tmp_7167;
        wire tmp_7168;
        wire tmp_7169;
        wire tmp_7170;
        wire tmp_7171;
        wire tmp_7172;
        wire tmp_7173;
        wire tmp_7174;
        wire tmp_7175;
        wire tmp_7176;
        wire tmp_7177;
        wire tmp_7178;
        wire tmp_7179;
        wire tmp_7180;
        wire tmp_7181;
        wire tmp_7182;
        wire tmp_7183;
        wire tmp_7184;
        wire tmp_7185;
        wire tmp_7186;
        wire tmp_7187;
        wire tmp_7188;
        wire tmp_7189;
        wire tmp_7190;
        wire tmp_7191;
        wire tmp_7192;
        wire tmp_7193;
        wire tmp_7194;
        wire tmp_7195;
        wire tmp_7196;
        wire tmp_7197;
        wire tmp_7198;
        wire tmp_7199;
        wire tmp_7200;
        wire tmp_7201;
        wire tmp_7202;
        wire tmp_7203;
        wire tmp_7204;
        wire tmp_7205;
        wire tmp_7206;
        wire tmp_7207;
        wire tmp_7208;
        wire tmp_7209;
        wire tmp_7210;
        wire tmp_7211;
        wire tmp_7212;
        wire tmp_7213;
        wire tmp_7214;
        wire tmp_7215;
        wire tmp_7216;
        wire tmp_7217;
        wire tmp_7218;
        wire tmp_7219;
        wire tmp_7220;
        wire tmp_7221;
        wire tmp_7222;
        wire tmp_7223;
        wire tmp_7224;
        wire tmp_7225;
        wire tmp_7226;
        wire tmp_7227;
        wire tmp_7228;
        wire tmp_7229;
        wire tmp_7230;
        wire tmp_7231;
        wire tmp_7232;
        wire tmp_7233;
        wire tmp_7234;
        wire tmp_7235;
        wire tmp_7236;
        wire tmp_7237;
        wire tmp_7238;
        wire tmp_7239;
        wire tmp_7240;
        wire tmp_7241;
        wire tmp_7242;
        wire tmp_7243;
        wire tmp_7244;
        wire tmp_7245;
        wire tmp_7246;
        wire tmp_7247;
        wire tmp_7248;
        wire tmp_7249;
        wire tmp_7250;
        wire tmp_7251;
        wire tmp_7252;
        wire tmp_7253;
        wire tmp_7254;
        wire tmp_7255;
        wire tmp_7256;
        wire tmp_7257;
        wire tmp_7258;
        wire tmp_7259;
        wire tmp_7260;
        wire tmp_7261;
        wire tmp_7262;
        wire tmp_7263;
        wire tmp_7264;
        wire tmp_7265;
        wire tmp_7266;
        wire tmp_7267;
        wire tmp_7268;
        wire tmp_7269;
        wire tmp_7270;
        wire tmp_7271;
        wire tmp_7272;
        wire tmp_7273;
        wire tmp_7274;
        wire tmp_7275;
        wire tmp_7276;
        wire tmp_7277;
        wire tmp_7278;
        wire tmp_7279;
        wire tmp_7280;
        wire tmp_7281;
        wire tmp_7282;
        wire tmp_7283;
        wire tmp_7284;
        wire tmp_7285;
        wire tmp_7286;
        wire tmp_7287;
        wire tmp_7288;
        wire tmp_7289;
        wire tmp_7290;
        wire tmp_7291;
        wire tmp_7292;
        wire tmp_7293;
        wire tmp_7294;
        wire tmp_7295;
        wire tmp_7296;
        wire tmp_7297;
        wire tmp_7298;
        wire tmp_7299;
        wire tmp_7300;
        wire tmp_7301;
        wire tmp_7302;
        wire tmp_7303;
        wire tmp_7304;
        wire tmp_7305;
        wire tmp_7306;
        wire tmp_7307;
        wire tmp_7308;
        wire tmp_7309;
        wire tmp_7310;
        wire tmp_7311;
        wire tmp_7312;
        wire tmp_7313;
        wire tmp_7314;
        wire tmp_7315;
        wire tmp_7316;
        wire tmp_7317;
        wire tmp_7318;
        wire tmp_7319;
        wire tmp_7320;
        wire tmp_7321;
        wire tmp_7322;
        wire tmp_7323;
        wire tmp_7324;
        wire tmp_7325;
        wire tmp_7326;
        wire tmp_7327;
        wire tmp_7328;
        wire tmp_7329;
        wire tmp_7330;
        wire tmp_7331;
        wire tmp_7332;
        wire tmp_7333;
        wire tmp_7334;
        wire tmp_7335;

        wire        o_txpipe0_asyncpowerchangeack_0;
        wire        o_txpipe0_blockaligncontrol_0;
        wire        o_txpipe0_cfg_hw_auto_sp_dis_0;
        wire        o_txpipe0_dirchange_0;
        wire        o_txpipe0_ebuf_mode_0;
        wire        o_txpipe0_encodedecodebypass_0;
        wire [5:0]  o_txpipe0_fs_0;
        wire        o_txpipe0_getlocalpresetcoefficients_0;
        wire        o_txpipe0_invalidrequest_0;
        wire [5:0]  o_txpipe0_lf_0;
        wire [4:0]  o_txpipe0_localpresetindex_0;
        wire        o_txpipe0_lowpin_nt_0;
        wire [7:0]  o_txpipe0_m2p_bus_0;
        wire [2:0]  o_txpipe0_pclk_rate_0;
        wire        o_txpipe0_pclkchangeack_0;
        wire [3:0]  o_txpipe0_phy_mode_nt_0;
        wire [3:0]  o_txpipe0_powerdown_0;
        wire [2:0]  o_txpipe0_rate_0;
        wire        o_txpipe0_rxelecidle_disable_a_0;
        wire        o_txpipe0_rxeqclr_0;
        wire        o_txpipe0_rxeqeval_0;
        wire        o_txpipe0_rxeqinprogress_0;
        wire        o_txpipe0_rxeqtraining_0;
        wire        o_txpipe0_rxpolarity_0;
        wire [2:0]  o_txpipe0_rxpresethint_0;
        wire        o_txpipe0_rxstandby_0;
        wire        o_txpipe0_rxtermination_0;
        wire        o_txpipe0_srisenable_0;
        wire        o_txpipe0_txcmnmode_disable_a_0;
        wire        o_txpipe0_txcompliance_0;
        wire [39:0] o_txpipe0_txdata_0;
        wire [3:0]  o_txpipe0_txdatak_0;
        wire        o_txpipe0_txdatavalid_0;
        wire [17:0] o_txpipe0_txdeemph_0;
        wire        o_txpipe0_txdtctrx_lb_0;
        wire        o_txpipe0_txelecidle_0;
        wire [2:0]  o_txpipe0_txmargin_0;
        wire        o_txpipe0_txoneszeros_0;
        wire        o_txpipe0_txstartblock_0;
        wire        o_txpipe0_txswing_0;
        wire [3:0]  o_txpipe0_txsyncheader_0;
        wire [2:0]  o_txpipe0_width_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_asyncpowerchangeack_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_blockaligncontrol_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_cfg_hw_auto_sp_dis_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_dirchange_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_ebuf_mode_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_encodedecodebypass_0;
        wire [5:0]  pcie_pcs_tx_mux_u0__o_txpipe_fs_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_getlocalpresetcoefficients_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_invalidrequest_0;
        wire [5:0]  pcie_pcs_tx_mux_u0__o_txpipe_lf_0;
        wire [4:0]  pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_lowpin_nt_0;
        wire [7:0]  pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0;
        wire [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_pclkchangeack_0;
        wire [3:0]  pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0;
        wire [3:0]  pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0;
        wire [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_rate_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_rxelecidle_disable_a_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_rxeqclr_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_rxeqeval_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_rxeqinprogress_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_rxeqtraining_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_rxpolarity_0;
        wire [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_rxstandby_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_rxtermination_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_srisenable_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_txcmnmode_disable_a_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_txcompliance_0;
        wire [39:0] pcie_pcs_tx_mux_u0__o_txpipe_txdata_0;
        wire [3:0]  pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_txdatavalid_0;
        wire [17:0] pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_txdtctrx_lb_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_txelecidle_0;
        wire [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_txmargin_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_txoneszeros_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_txstartblock_0;
        wire        pcie_pcs_tx_mux_u0__o_txpipe_txswing_0;
        wire [3:0]  pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0;
        wire [2:0]  pcie_pcs_tx_mux_u0__o_txpipe_width_0;
        wire        o_txpipe1_asyncpowerchangeack_0;
        wire        o_txpipe1_blockaligncontrol_0;
        wire        o_txpipe1_cfg_hw_auto_sp_dis_0;
        wire        o_txpipe1_dirchange_0;
        wire        o_txpipe1_ebuf_mode_0;
        wire        o_txpipe1_encodedecodebypass_0;
        wire [5:0]  o_txpipe1_fs_0;
        wire        o_txpipe1_getlocalpresetcoefficients_0;
        wire        o_txpipe1_invalidrequest_0;
        wire [5:0]  o_txpipe1_lf_0;
        wire [4:0]  o_txpipe1_localpresetindex_0;
        wire        o_txpipe1_lowpin_nt_0;
        wire [7:0]  o_txpipe1_m2p_bus_0;
        wire [2:0]  o_txpipe1_pclk_rate_0;
        wire        o_txpipe1_pclkchangeack_0;
        wire [3:0]  o_txpipe1_phy_mode_nt_0;
        wire [3:0]  o_txpipe1_powerdown_0;
        wire [2:0]  o_txpipe1_rate_0;
        wire        o_txpipe1_rxelecidle_disable_a_0;
        wire        o_txpipe1_rxeqclr_0;
        wire        o_txpipe1_rxeqeval_0;
        wire        o_txpipe1_rxeqinprogress_0;
        wire        o_txpipe1_rxeqtraining_0;
        wire        o_txpipe1_rxpolarity_0;
        wire [2:0]  o_txpipe1_rxpresethint_0;
        wire        o_txpipe1_rxstandby_0;
        wire        o_txpipe1_rxtermination_0;
        wire        o_txpipe1_srisenable_0;
        wire        o_txpipe1_txcmnmode_disable_a_0;
        wire        o_txpipe1_txcompliance_0;
        wire [39:0] o_txpipe1_txdata_0;
        wire [3:0]  o_txpipe1_txdatak_0;
        wire        o_txpipe1_txdatavalid_0;
        wire [17:0] o_txpipe1_txdeemph_0;
        wire        o_txpipe1_txdtctrx_lb_0;
        wire        o_txpipe1_txelecidle_0;
        wire [2:0]  o_txpipe1_txmargin_0;
        wire        o_txpipe1_txoneszeros_0;
        wire        o_txpipe1_txstartblock_0;
        wire        o_txpipe1_txswing_0;
        wire [3:0]  o_txpipe1_txsyncheader_0;
        wire [2:0]  o_txpipe1_width_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_asyncpowerchangeack_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_blockaligncontrol_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_cfg_hw_auto_sp_dis_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_dirchange_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_ebuf_mode_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_encodedecodebypass_0;
        wire [5:0]  pcie_pcs_tx_mux_u1__o_txpipe_fs_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_getlocalpresetcoefficients_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_invalidrequest_0;
        wire [5:0]  pcie_pcs_tx_mux_u1__o_txpipe_lf_0;
        wire [4:0]  pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_lowpin_nt_0;
        wire [7:0]  pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0;
        wire [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_pclkchangeack_0;
        wire [3:0]  pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0;
        wire [3:0]  pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0;
        wire [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_rate_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_rxelecidle_disable_a_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_rxeqclr_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_rxeqeval_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_rxeqinprogress_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_rxeqtraining_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_rxpolarity_0;
        wire [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_rxstandby_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_rxtermination_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_srisenable_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_txcmnmode_disable_a_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_txcompliance_0;
        wire [39:0] pcie_pcs_tx_mux_u1__o_txpipe_txdata_0;
        wire [3:0]  pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_txdatavalid_0;
        wire [17:0] pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_txdtctrx_lb_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_txelecidle_0;
        wire [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_txmargin_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_txoneszeros_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_txstartblock_0;
        wire        pcie_pcs_tx_mux_u1__o_txpipe_txswing_0;
        wire [3:0]  pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0;
        wire [2:0]  pcie_pcs_tx_mux_u1__o_txpipe_width_0;
        wire        o_txpipe2_asyncpowerchangeack_0;
        wire        o_txpipe2_blockaligncontrol_0;
        wire        o_txpipe2_cfg_hw_auto_sp_dis_0;
        wire        o_txpipe2_dirchange_0;
        wire        o_txpipe2_ebuf_mode_0;
        wire        o_txpipe2_encodedecodebypass_0;
        wire [5:0]  o_txpipe2_fs_0;
        wire        o_txpipe2_getlocalpresetcoefficients_0;
        wire        o_txpipe2_invalidrequest_0;
        wire [5:0]  o_txpipe2_lf_0;
        wire [4:0]  o_txpipe2_localpresetindex_0;
        wire        o_txpipe2_lowpin_nt_0;
        wire [7:0]  o_txpipe2_m2p_bus_0;
        wire [2:0]  o_txpipe2_pclk_rate_0;
        wire        o_txpipe2_pclkchangeack_0;
        wire [3:0]  o_txpipe2_phy_mode_nt_0;
        wire [3:0]  o_txpipe2_powerdown_0;
        wire [2:0]  o_txpipe2_rate_0;
        wire        o_txpipe2_rxelecidle_disable_a_0;
        wire        o_txpipe2_rxeqclr_0;
        wire        o_txpipe2_rxeqeval_0;
        wire        o_txpipe2_rxeqinprogress_0;
        wire        o_txpipe2_rxeqtraining_0;
        wire        o_txpipe2_rxpolarity_0;
        wire [2:0]  o_txpipe2_rxpresethint_0;
        wire        o_txpipe2_rxstandby_0;
        wire        o_txpipe2_rxtermination_0;
        wire        o_txpipe2_srisenable_0;
        wire        o_txpipe2_txcmnmode_disable_a_0;
        wire        o_txpipe2_txcompliance_0;
        wire [39:0] o_txpipe2_txdata_0;
        wire [3:0]  o_txpipe2_txdatak_0;
        wire        o_txpipe2_txdatavalid_0;
        wire [17:0] o_txpipe2_txdeemph_0;
        wire        o_txpipe2_txdtctrx_lb_0;
        wire        o_txpipe2_txelecidle_0;
        wire [2:0]  o_txpipe2_txmargin_0;
        wire        o_txpipe2_txoneszeros_0;
        wire        o_txpipe2_txstartblock_0;
        wire        o_txpipe2_txswing_0;
        wire [3:0]  o_txpipe2_txsyncheader_0;
        wire [2:0]  o_txpipe2_width_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_asyncpowerchangeack_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_blockaligncontrol_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_cfg_hw_auto_sp_dis_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_dirchange_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_ebuf_mode_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_encodedecodebypass_0;
        wire [5:0]  pcie_pcs_tx_mux_u2__o_txpipe_fs_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_getlocalpresetcoefficients_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_invalidrequest_0;
        wire [5:0]  pcie_pcs_tx_mux_u2__o_txpipe_lf_0;
        wire [4:0]  pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_lowpin_nt_0;
        wire [7:0]  pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0;
        wire [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_pclkchangeack_0;
        wire [3:0]  pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0;
        wire [3:0]  pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0;
        wire [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_rate_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_rxelecidle_disable_a_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_rxeqclr_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_rxeqeval_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_rxeqinprogress_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_rxeqtraining_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_rxpolarity_0;
        wire [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_rxstandby_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_rxtermination_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_srisenable_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_txcmnmode_disable_a_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_txcompliance_0;
        wire [39:0] pcie_pcs_tx_mux_u2__o_txpipe_txdata_0;
        wire [3:0]  pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_txdatavalid_0;
        wire [17:0] pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_txdtctrx_lb_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_txelecidle_0;
        wire [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_txmargin_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_txoneszeros_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_txstartblock_0;
        wire        pcie_pcs_tx_mux_u2__o_txpipe_txswing_0;
        wire [3:0]  pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0;
        wire [2:0]  pcie_pcs_tx_mux_u2__o_txpipe_width_0;
        wire        o_txpipe3_asyncpowerchangeack_0;
        wire        o_txpipe3_blockaligncontrol_0;
        wire        o_txpipe3_cfg_hw_auto_sp_dis_0;
        wire        o_txpipe3_dirchange_0;
        wire        o_txpipe3_ebuf_mode_0;
        wire        o_txpipe3_encodedecodebypass_0;
        wire [5:0]  o_txpipe3_fs_0;
        wire        o_txpipe3_getlocalpresetcoefficients_0;
        wire        o_txpipe3_invalidrequest_0;
        wire [5:0]  o_txpipe3_lf_0;
        wire [4:0]  o_txpipe3_localpresetindex_0;
        wire        o_txpipe3_lowpin_nt_0;
        wire [7:0]  o_txpipe3_m2p_bus_0;
        wire [2:0]  o_txpipe3_pclk_rate_0;
        wire        o_txpipe3_pclkchangeack_0;
        wire [3:0]  o_txpipe3_phy_mode_nt_0;
        wire [3:0]  o_txpipe3_powerdown_0;
        wire [2:0]  o_txpipe3_rate_0;
        wire        o_txpipe3_rxelecidle_disable_a_0;
        wire        o_txpipe3_rxeqclr_0;
        wire        o_txpipe3_rxeqeval_0;
        wire        o_txpipe3_rxeqinprogress_0;
        wire        o_txpipe3_rxeqtraining_0;
        wire        o_txpipe3_rxpolarity_0;
        wire [2:0]  o_txpipe3_rxpresethint_0;
        wire        o_txpipe3_rxstandby_0;
        wire        o_txpipe3_rxtermination_0;
        wire        o_txpipe3_srisenable_0;
        wire        o_txpipe3_txcmnmode_disable_a_0;
        wire        o_txpipe3_txcompliance_0;
        wire [39:0] o_txpipe3_txdata_0;
        wire [3:0]  o_txpipe3_txdatak_0;
        wire        o_txpipe3_txdatavalid_0;
        wire [17:0] o_txpipe3_txdeemph_0;
        wire        o_txpipe3_txdtctrx_lb_0;
        wire        o_txpipe3_txelecidle_0;
        wire [2:0]  o_txpipe3_txmargin_0;
        wire        o_txpipe3_txoneszeros_0;
        wire        o_txpipe3_txstartblock_0;
        wire        o_txpipe3_txswing_0;
        wire [3:0]  o_txpipe3_txsyncheader_0;
        wire [2:0]  o_txpipe3_width_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_asyncpowerchangeack_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_blockaligncontrol_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_cfg_hw_auto_sp_dis_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_dirchange_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_ebuf_mode_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_encodedecodebypass_0;
        wire [5:0]  pcie_pcs_tx_mux_u3__o_txpipe_fs_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_getlocalpresetcoefficients_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_invalidrequest_0;
        wire [5:0]  pcie_pcs_tx_mux_u3__o_txpipe_lf_0;
        wire [4:0]  pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_lowpin_nt_0;
        wire [7:0]  pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0;
        wire [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_pclkchangeack_0;
        wire [3:0]  pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0;
        wire [3:0]  pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0;
        wire [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_rate_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_rxelecidle_disable_a_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_rxeqclr_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_rxeqeval_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_rxeqinprogress_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_rxeqtraining_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_rxpolarity_0;
        wire [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_rxstandby_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_rxtermination_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_srisenable_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_txcmnmode_disable_a_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_txcompliance_0;
        wire [39:0] pcie_pcs_tx_mux_u3__o_txpipe_txdata_0;
        wire [3:0]  pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_txdatavalid_0;
        wire [17:0] pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_txdtctrx_lb_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_txelecidle_0;
        wire [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_txmargin_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_txoneszeros_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_txstartblock_0;
        wire        pcie_pcs_tx_mux_u3__o_txpipe_txswing_0;
        wire [3:0]  pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0;
        wire [2:0]  pcie_pcs_tx_mux_u3__o_txpipe_width_0;

        assign o_pcs_lane0_pclk_0 = o_pcs_lane0_pclk;
        assign o_pcs_lane1_pclk_0 = o_pcs_lane1_pclk;
        assign o_pcs_lane2_pclk_0 = o_pcs_lane2_pclk;
        assign pcie_pcs_clk_mux_u0__o_clk = pcie_pcs_clk_mux_u0__o_clk_0;
        assign pcie_pcs_clk_mux_u1__o_clk = pcie_pcs_clk_mux_u1__o_clk_0;
        assign pcie_pcs_clk_mux_u2__o_clk = pcie_pcs_clk_mux_u2__o_clk_0;
        assign pcie_pcs_clk_mux_u3__o_clk = pcie_pcs_clk_mux_u3__o_clk_0;

        assign x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__o_hps_clk = x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__o_hps_clk_1;

        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_ebuf_mode_1 = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_ebuf_mode;
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0[0] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown[0];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0[1] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown[1];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0[2] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown[2];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0[3] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown[3];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate_0[0] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate[0];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate_0[1] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate[1];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxeqtraining_1 = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxeqtraining;
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxpolarity_1 = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxpolarity;
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxtermination_1 = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxtermination;
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[0] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[0];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[10] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[10];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[11] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[11];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[12] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[12];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[13] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[13];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[14] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[14];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[15] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[15];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[1] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[1];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[2] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[2];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[3] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[3];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[4] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[4];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[5] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[5];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[6] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[6];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[7] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[7];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[8] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[8];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[9] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata[9];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak_0[0] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak[0];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak_0[1] = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak[1];
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdtctrx_lb_1 = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdtctrx_lb;
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txelecidle_1 = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txelecidle;
        assign x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txoneszeros_1 = x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txoneszeros;

        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_phystatus = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_phystatus_1;
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[0] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[0];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[10] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[10];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[11] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[11];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[12] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[12];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[13] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[13];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[14] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[14];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[15] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[15];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[1] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[1];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[2] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[2];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[3] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[3];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[4] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[4];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[5] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[5];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[6] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[6];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[7] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[7];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[8] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[8];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata[9] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[9];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak[0] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak_0[0];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak[1] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak_0[1];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxelecidle_a = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxelecidle_a_1;
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus[0] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus_0[0];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus[1] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus_0[1];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus[2] = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus_0[2];
        assign x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxvalid = x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxvalid_1;

        assign o_pcs0_pipe_rst_n_0 = o_pcs0_pipe_rst_n;
        assign o_pcs1_pipe_rst_n_0 = o_pcs1_pipe_rst_n;
        assign o_pcs2_pipe_rst_n_0 = o_pcs2_pipe_rst_n;
        assign o_pcs3_pipe_rst_n_0 = o_pcs3_pipe_rst_n;
        assign x_mux_sm_hssi_pcie_pcs_rst_mux_1__i_hps_rst_rstn_1 = x_mux_sm_hssi_pcie_pcs_rst_mux_1__i_hps_rst_rstn;
        assign x_mux_sm_hssi_pcie_pcs_rst_mux_2__i_hps_rst_rstn_1 = x_mux_sm_hssi_pcie_pcs_rst_mux_2__i_hps_rst_rstn;
        assign pcie_pcs_rst_mux_u0__o_rstn = pcie_pcs_rst_mux_u0__o_rstn_0;
        assign pcie_pcs_rst_mux_u1__o_rstn = pcie_pcs_rst_mux_u1__o_rstn_0;
        assign pcie_pcs_rst_mux_u2__o_rstn = pcie_pcs_rst_mux_u2__o_rstn_0;
        assign pcie_pcs_rst_mux_u3__o_rstn = pcie_pcs_rst_mux_u3__o_rstn_0;

        assign pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[5] = pcie_pcs_lane_u0__o_rxpipe_dirfeedback[5];
        assign pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[4] = pcie_pcs_lane_u0__o_rxpipe_dirfeedback[4];
        assign pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[3] = pcie_pcs_lane_u0__o_rxpipe_dirfeedback[3];
        assign pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[2] = pcie_pcs_lane_u0__o_rxpipe_dirfeedback[2];
        assign pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[1] = pcie_pcs_lane_u0__o_rxpipe_dirfeedback[1];
        assign pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[0] = pcie_pcs_lane_u0__o_rxpipe_dirfeedback[0];
        assign pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[7] = pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit[7];
        assign pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[6] = pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit[6];
        assign pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[5] = pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit[5];
        assign pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[4] = pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit[4];
        assign pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[3] = pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit[3];
        assign pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[2] = pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit[2];
        assign pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[1] = pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit[1];
        assign pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[0] = pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit[0];
        assign pcie_pcs_lane_u0__o_rxpipe_localfs_0[5] = pcie_pcs_lane_u0__o_rxpipe_localfs[5];
        assign pcie_pcs_lane_u0__o_rxpipe_localfs_0[4] = pcie_pcs_lane_u0__o_rxpipe_localfs[4];
        assign pcie_pcs_lane_u0__o_rxpipe_localfs_0[3] = pcie_pcs_lane_u0__o_rxpipe_localfs[3];
        assign pcie_pcs_lane_u0__o_rxpipe_localfs_0[2] = pcie_pcs_lane_u0__o_rxpipe_localfs[2];
        assign pcie_pcs_lane_u0__o_rxpipe_localfs_0[1] = pcie_pcs_lane_u0__o_rxpipe_localfs[1];
        assign pcie_pcs_lane_u0__o_rxpipe_localfs_0[0] = pcie_pcs_lane_u0__o_rxpipe_localfs[0];
        assign pcie_pcs_lane_u0__o_rxpipe_locallf_0[5] = pcie_pcs_lane_u0__o_rxpipe_locallf[5];
        assign pcie_pcs_lane_u0__o_rxpipe_locallf_0[4] = pcie_pcs_lane_u0__o_rxpipe_locallf[4];
        assign pcie_pcs_lane_u0__o_rxpipe_locallf_0[3] = pcie_pcs_lane_u0__o_rxpipe_locallf[3];
        assign pcie_pcs_lane_u0__o_rxpipe_locallf_0[2] = pcie_pcs_lane_u0__o_rxpipe_locallf[2];
        assign pcie_pcs_lane_u0__o_rxpipe_locallf_0[1] = pcie_pcs_lane_u0__o_rxpipe_locallf[1];
        assign pcie_pcs_lane_u0__o_rxpipe_locallf_0[0] = pcie_pcs_lane_u0__o_rxpipe_locallf[0];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxcoefficientsvalid_0 = pcie_pcs_lane_u0__o_rxpipe_localtxcoefficientsvalid;
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[17] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[17];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[16] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[16];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[15] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[15];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[14] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[14];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[13] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[13];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[12] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[12];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[11] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[11];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[10] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[10];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[9] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[9];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[8] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[8];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[7] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[7];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[6] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[6];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[5] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[5];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[4] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[4];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[3] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[3];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[2] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[2];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[1] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[1];
        assign pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[0] = pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients[0];
        assign pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[7] = pcie_pcs_lane_u0__o_rxpipe_p2m_bus[7];
        assign pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[6] = pcie_pcs_lane_u0__o_rxpipe_p2m_bus[6];
        assign pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[5] = pcie_pcs_lane_u0__o_rxpipe_p2m_bus[5];
        assign pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[4] = pcie_pcs_lane_u0__o_rxpipe_p2m_bus[4];
        assign pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[3] = pcie_pcs_lane_u0__o_rxpipe_p2m_bus[3];
        assign pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[2] = pcie_pcs_lane_u0__o_rxpipe_p2m_bus[2];
        assign pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[1] = pcie_pcs_lane_u0__o_rxpipe_p2m_bus[1];
        assign pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[0] = pcie_pcs_lane_u0__o_rxpipe_p2m_bus[0];
        assign pcie_pcs_lane_u0__o_rxpipe_pclkchangeok_0 = pcie_pcs_lane_u0__o_rxpipe_pclkchangeok;
        assign pcie_pcs_lane_u0__o_rxpipe_phystatus_0 = pcie_pcs_lane_u0__o_rxpipe_phystatus;
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[39] = pcie_pcs_lane_u0__o_rxpipe_rxdata[39];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[38] = pcie_pcs_lane_u0__o_rxpipe_rxdata[38];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[37] = pcie_pcs_lane_u0__o_rxpipe_rxdata[37];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[36] = pcie_pcs_lane_u0__o_rxpipe_rxdata[36];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[35] = pcie_pcs_lane_u0__o_rxpipe_rxdata[35];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[34] = pcie_pcs_lane_u0__o_rxpipe_rxdata[34];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[33] = pcie_pcs_lane_u0__o_rxpipe_rxdata[33];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[32] = pcie_pcs_lane_u0__o_rxpipe_rxdata[32];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[31] = pcie_pcs_lane_u0__o_rxpipe_rxdata[31];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[30] = pcie_pcs_lane_u0__o_rxpipe_rxdata[30];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[29] = pcie_pcs_lane_u0__o_rxpipe_rxdata[29];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[28] = pcie_pcs_lane_u0__o_rxpipe_rxdata[28];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[27] = pcie_pcs_lane_u0__o_rxpipe_rxdata[27];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[26] = pcie_pcs_lane_u0__o_rxpipe_rxdata[26];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[25] = pcie_pcs_lane_u0__o_rxpipe_rxdata[25];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[24] = pcie_pcs_lane_u0__o_rxpipe_rxdata[24];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[23] = pcie_pcs_lane_u0__o_rxpipe_rxdata[23];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[22] = pcie_pcs_lane_u0__o_rxpipe_rxdata[22];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[21] = pcie_pcs_lane_u0__o_rxpipe_rxdata[21];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[20] = pcie_pcs_lane_u0__o_rxpipe_rxdata[20];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[19] = pcie_pcs_lane_u0__o_rxpipe_rxdata[19];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[18] = pcie_pcs_lane_u0__o_rxpipe_rxdata[18];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[17] = pcie_pcs_lane_u0__o_rxpipe_rxdata[17];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[16] = pcie_pcs_lane_u0__o_rxpipe_rxdata[16];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[15] = pcie_pcs_lane_u0__o_rxpipe_rxdata[15];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[14] = pcie_pcs_lane_u0__o_rxpipe_rxdata[14];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[13] = pcie_pcs_lane_u0__o_rxpipe_rxdata[13];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[12] = pcie_pcs_lane_u0__o_rxpipe_rxdata[12];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[11] = pcie_pcs_lane_u0__o_rxpipe_rxdata[11];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[10] = pcie_pcs_lane_u0__o_rxpipe_rxdata[10];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[9] = pcie_pcs_lane_u0__o_rxpipe_rxdata[9];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[8] = pcie_pcs_lane_u0__o_rxpipe_rxdata[8];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[7] = pcie_pcs_lane_u0__o_rxpipe_rxdata[7];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[6] = pcie_pcs_lane_u0__o_rxpipe_rxdata[6];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[5] = pcie_pcs_lane_u0__o_rxpipe_rxdata[5];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[4] = pcie_pcs_lane_u0__o_rxpipe_rxdata[4];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[3] = pcie_pcs_lane_u0__o_rxpipe_rxdata[3];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[2] = pcie_pcs_lane_u0__o_rxpipe_rxdata[2];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[1] = pcie_pcs_lane_u0__o_rxpipe_rxdata[1];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdata_0[0] = pcie_pcs_lane_u0__o_rxpipe_rxdata[0];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdatak_0[3] = pcie_pcs_lane_u0__o_rxpipe_rxdatak[3];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdatak_0[2] = pcie_pcs_lane_u0__o_rxpipe_rxdatak[2];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdatak_0[1] = pcie_pcs_lane_u0__o_rxpipe_rxdatak[1];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdatak_0[0] = pcie_pcs_lane_u0__o_rxpipe_rxdatak[0];
        assign pcie_pcs_lane_u0__o_rxpipe_rxdatavalid_0 = pcie_pcs_lane_u0__o_rxpipe_rxdatavalid;
        assign pcie_pcs_lane_u0__o_rxpipe_rxelecidlea_0 = pcie_pcs_lane_u0__o_rxpipe_rxelecidlea;
        assign pcie_pcs_lane_u0__o_rxpipe_rxstandbystatus_0 = pcie_pcs_lane_u0__o_rxpipe_rxstandbystatus;
        assign pcie_pcs_lane_u0__o_rxpipe_rxstartblock_0 = pcie_pcs_lane_u0__o_rxpipe_rxstartblock;
        assign pcie_pcs_lane_u0__o_rxpipe_rxstatus_0[2] = pcie_pcs_lane_u0__o_rxpipe_rxstatus[2];
        assign pcie_pcs_lane_u0__o_rxpipe_rxstatus_0[1] = pcie_pcs_lane_u0__o_rxpipe_rxstatus[1];
        assign pcie_pcs_lane_u0__o_rxpipe_rxstatus_0[0] = pcie_pcs_lane_u0__o_rxpipe_rxstatus[0];
        assign pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0[3] = pcie_pcs_lane_u0__o_rxpipe_rxsyncheader[3];
        assign pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0[2] = pcie_pcs_lane_u0__o_rxpipe_rxsyncheader[2];
        assign pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0[1] = pcie_pcs_lane_u0__o_rxpipe_rxsyncheader[1];
        assign pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0[0] = pcie_pcs_lane_u0__o_rxpipe_rxsyncheader[0];
        assign pcie_pcs_lane_u0__o_rxpipe_rxvalid_0 = pcie_pcs_lane_u0__o_rxpipe_rxvalid;
        assign o_same_quad_rxpipe0_dirfeedback[5] = o_same_quad_rxpipe0_dirfeedback_0[5];
        assign o_same_quad_rxpipe0_dirfeedback[4] = o_same_quad_rxpipe0_dirfeedback_0[4];
        assign o_same_quad_rxpipe0_dirfeedback[3] = o_same_quad_rxpipe0_dirfeedback_0[3];
        assign o_same_quad_rxpipe0_dirfeedback[2] = o_same_quad_rxpipe0_dirfeedback_0[2];
        assign o_same_quad_rxpipe0_dirfeedback[1] = o_same_quad_rxpipe0_dirfeedback_0[1];
        assign o_same_quad_rxpipe0_dirfeedback[0] = o_same_quad_rxpipe0_dirfeedback_0[0];
        assign o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit[7] = o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[7];
        assign o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit[6] = o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[6];
        assign o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit[5] = o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[5];
        assign o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit[4] = o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[4];
        assign o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit[3] = o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[3];
        assign o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit[2] = o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[2];
        assign o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit[1] = o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[1];
        assign o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit[0] = o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[0];
        assign o_same_quad_rxpipe0_localfs[5] = o_same_quad_rxpipe0_localfs_0[5];
        assign o_same_quad_rxpipe0_localfs[4] = o_same_quad_rxpipe0_localfs_0[4];
        assign o_same_quad_rxpipe0_localfs[3] = o_same_quad_rxpipe0_localfs_0[3];
        assign o_same_quad_rxpipe0_localfs[2] = o_same_quad_rxpipe0_localfs_0[2];
        assign o_same_quad_rxpipe0_localfs[1] = o_same_quad_rxpipe0_localfs_0[1];
        assign o_same_quad_rxpipe0_localfs[0] = o_same_quad_rxpipe0_localfs_0[0];
        assign o_same_quad_rxpipe0_locallf[5] = o_same_quad_rxpipe0_locallf_0[5];
        assign o_same_quad_rxpipe0_locallf[4] = o_same_quad_rxpipe0_locallf_0[4];
        assign o_same_quad_rxpipe0_locallf[3] = o_same_quad_rxpipe0_locallf_0[3];
        assign o_same_quad_rxpipe0_locallf[2] = o_same_quad_rxpipe0_locallf_0[2];
        assign o_same_quad_rxpipe0_locallf[1] = o_same_quad_rxpipe0_locallf_0[1];
        assign o_same_quad_rxpipe0_locallf[0] = o_same_quad_rxpipe0_locallf_0[0];
        assign o_same_quad_rxpipe0_localtxcoefficientsvalid = o_same_quad_rxpipe0_localtxcoefficientsvalid_0;
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[17] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[17];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[16] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[16];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[15] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[15];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[14] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[14];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[13] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[13];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[12] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[12];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[11] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[11];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[10] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[10];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[9] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[9];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[8] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[8];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[7] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[7];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[6] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[6];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[5] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[5];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[4] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[4];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[3] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[3];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[2] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[2];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[1] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[1];
        assign o_same_quad_rxpipe0_localtxpresetcoefficients[0] = o_same_quad_rxpipe0_localtxpresetcoefficients_0[0];
        assign o_same_quad_rxpipe0_p2m_bus[7] = o_same_quad_rxpipe0_p2m_bus_0[7];
        assign o_same_quad_rxpipe0_p2m_bus[6] = o_same_quad_rxpipe0_p2m_bus_0[6];
        assign o_same_quad_rxpipe0_p2m_bus[5] = o_same_quad_rxpipe0_p2m_bus_0[5];
        assign o_same_quad_rxpipe0_p2m_bus[4] = o_same_quad_rxpipe0_p2m_bus_0[4];
        assign o_same_quad_rxpipe0_p2m_bus[3] = o_same_quad_rxpipe0_p2m_bus_0[3];
        assign o_same_quad_rxpipe0_p2m_bus[2] = o_same_quad_rxpipe0_p2m_bus_0[2];
        assign o_same_quad_rxpipe0_p2m_bus[1] = o_same_quad_rxpipe0_p2m_bus_0[1];
        assign o_same_quad_rxpipe0_p2m_bus[0] = o_same_quad_rxpipe0_p2m_bus_0[0];
        assign o_same_quad_rxpipe0_pclkchangeok = o_same_quad_rxpipe0_pclkchangeok_0;
        assign o_same_quad_rxpipe0_phystatus = o_same_quad_rxpipe0_phystatus_0;
        assign o_same_quad_rxpipe0_rxdata[39] = o_same_quad_rxpipe0_rxdata_0[39];
        assign o_same_quad_rxpipe0_rxdata[38] = o_same_quad_rxpipe0_rxdata_0[38];
        assign o_same_quad_rxpipe0_rxdata[37] = o_same_quad_rxpipe0_rxdata_0[37];
        assign o_same_quad_rxpipe0_rxdata[36] = o_same_quad_rxpipe0_rxdata_0[36];
        assign o_same_quad_rxpipe0_rxdata[35] = o_same_quad_rxpipe0_rxdata_0[35];
        assign o_same_quad_rxpipe0_rxdata[34] = o_same_quad_rxpipe0_rxdata_0[34];
        assign o_same_quad_rxpipe0_rxdata[33] = o_same_quad_rxpipe0_rxdata_0[33];
        assign o_same_quad_rxpipe0_rxdata[32] = o_same_quad_rxpipe0_rxdata_0[32];
        assign o_same_quad_rxpipe0_rxdata[31] = o_same_quad_rxpipe0_rxdata_0[31];
        assign o_same_quad_rxpipe0_rxdata[30] = o_same_quad_rxpipe0_rxdata_0[30];
        assign o_same_quad_rxpipe0_rxdata[29] = o_same_quad_rxpipe0_rxdata_0[29];
        assign o_same_quad_rxpipe0_rxdata[28] = o_same_quad_rxpipe0_rxdata_0[28];
        assign o_same_quad_rxpipe0_rxdata[27] = o_same_quad_rxpipe0_rxdata_0[27];
        assign o_same_quad_rxpipe0_rxdata[26] = o_same_quad_rxpipe0_rxdata_0[26];
        assign o_same_quad_rxpipe0_rxdata[25] = o_same_quad_rxpipe0_rxdata_0[25];
        assign o_same_quad_rxpipe0_rxdata[24] = o_same_quad_rxpipe0_rxdata_0[24];
        assign o_same_quad_rxpipe0_rxdata[23] = o_same_quad_rxpipe0_rxdata_0[23];
        assign o_same_quad_rxpipe0_rxdata[22] = o_same_quad_rxpipe0_rxdata_0[22];
        assign o_same_quad_rxpipe0_rxdata[21] = o_same_quad_rxpipe0_rxdata_0[21];
        assign o_same_quad_rxpipe0_rxdata[20] = o_same_quad_rxpipe0_rxdata_0[20];
        assign o_same_quad_rxpipe0_rxdata[19] = o_same_quad_rxpipe0_rxdata_0[19];
        assign o_same_quad_rxpipe0_rxdata[18] = o_same_quad_rxpipe0_rxdata_0[18];
        assign o_same_quad_rxpipe0_rxdata[17] = o_same_quad_rxpipe0_rxdata_0[17];
        assign o_same_quad_rxpipe0_rxdata[16] = o_same_quad_rxpipe0_rxdata_0[16];
        assign o_same_quad_rxpipe0_rxdata[15] = o_same_quad_rxpipe0_rxdata_0[15];
        assign o_same_quad_rxpipe0_rxdata[14] = o_same_quad_rxpipe0_rxdata_0[14];
        assign o_same_quad_rxpipe0_rxdata[13] = o_same_quad_rxpipe0_rxdata_0[13];
        assign o_same_quad_rxpipe0_rxdata[12] = o_same_quad_rxpipe0_rxdata_0[12];
        assign o_same_quad_rxpipe0_rxdata[11] = o_same_quad_rxpipe0_rxdata_0[11];
        assign o_same_quad_rxpipe0_rxdata[10] = o_same_quad_rxpipe0_rxdata_0[10];
        assign o_same_quad_rxpipe0_rxdata[9] = o_same_quad_rxpipe0_rxdata_0[9];
        assign o_same_quad_rxpipe0_rxdata[8] = o_same_quad_rxpipe0_rxdata_0[8];
        assign o_same_quad_rxpipe0_rxdata[7] = o_same_quad_rxpipe0_rxdata_0[7];
        assign o_same_quad_rxpipe0_rxdata[6] = o_same_quad_rxpipe0_rxdata_0[6];
        assign o_same_quad_rxpipe0_rxdata[5] = o_same_quad_rxpipe0_rxdata_0[5];
        assign o_same_quad_rxpipe0_rxdata[4] = o_same_quad_rxpipe0_rxdata_0[4];
        assign o_same_quad_rxpipe0_rxdata[3] = o_same_quad_rxpipe0_rxdata_0[3];
        assign o_same_quad_rxpipe0_rxdata[2] = o_same_quad_rxpipe0_rxdata_0[2];
        assign o_same_quad_rxpipe0_rxdata[1] = o_same_quad_rxpipe0_rxdata_0[1];
        assign o_same_quad_rxpipe0_rxdata[0] = o_same_quad_rxpipe0_rxdata_0[0];
        assign o_same_quad_rxpipe0_rxdatak[3] = o_same_quad_rxpipe0_rxdatak_0[3];
        assign o_same_quad_rxpipe0_rxdatak[2] = o_same_quad_rxpipe0_rxdatak_0[2];
        assign o_same_quad_rxpipe0_rxdatak[1] = o_same_quad_rxpipe0_rxdatak_0[1];
        assign o_same_quad_rxpipe0_rxdatak[0] = o_same_quad_rxpipe0_rxdatak_0[0];
        assign o_same_quad_rxpipe0_rxdatavalid = o_same_quad_rxpipe0_rxdatavalid_0;
        assign o_same_quad_rxpipe0_rxelecidlea = o_same_quad_rxpipe0_rxelecidlea_0;
        assign o_same_quad_rxpipe0_rxstandbystatus = o_same_quad_rxpipe0_rxstandbystatus_0;
        assign o_same_quad_rxpipe0_rxstartblock = o_same_quad_rxpipe0_rxstartblock_0;
        assign o_same_quad_rxpipe0_rxstatus[2] = o_same_quad_rxpipe0_rxstatus_0[2];
        assign o_same_quad_rxpipe0_rxstatus[1] = o_same_quad_rxpipe0_rxstatus_0[1];
        assign o_same_quad_rxpipe0_rxstatus[0] = o_same_quad_rxpipe0_rxstatus_0[0];
        assign o_same_quad_rxpipe0_rxsyncheader[3] = o_same_quad_rxpipe0_rxsyncheader_0[3];
        assign o_same_quad_rxpipe0_rxsyncheader[2] = o_same_quad_rxpipe0_rxsyncheader_0[2];
        assign o_same_quad_rxpipe0_rxsyncheader[1] = o_same_quad_rxpipe0_rxsyncheader_0[1];
        assign o_same_quad_rxpipe0_rxsyncheader[0] = o_same_quad_rxpipe0_rxsyncheader_0[0];
        assign o_same_quad_rxpipe0_rxvalid = o_same_quad_rxpipe0_rxvalid_0;
        assign pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[5] = pcie_pcs_lane_u1__o_rxpipe_dirfeedback[5];
        assign pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[4] = pcie_pcs_lane_u1__o_rxpipe_dirfeedback[4];
        assign pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[3] = pcie_pcs_lane_u1__o_rxpipe_dirfeedback[3];
        assign pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[2] = pcie_pcs_lane_u1__o_rxpipe_dirfeedback[2];
        assign pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[1] = pcie_pcs_lane_u1__o_rxpipe_dirfeedback[1];
        assign pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[0] = pcie_pcs_lane_u1__o_rxpipe_dirfeedback[0];
        assign pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[7] = pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit[7];
        assign pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[6] = pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit[6];
        assign pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[5] = pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit[5];
        assign pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[4] = pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit[4];
        assign pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[3] = pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit[3];
        assign pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[2] = pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit[2];
        assign pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[1] = pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit[1];
        assign pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[0] = pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit[0];
        assign pcie_pcs_lane_u1__o_rxpipe_localfs_0[5] = pcie_pcs_lane_u1__o_rxpipe_localfs[5];
        assign pcie_pcs_lane_u1__o_rxpipe_localfs_0[4] = pcie_pcs_lane_u1__o_rxpipe_localfs[4];
        assign pcie_pcs_lane_u1__o_rxpipe_localfs_0[3] = pcie_pcs_lane_u1__o_rxpipe_localfs[3];
        assign pcie_pcs_lane_u1__o_rxpipe_localfs_0[2] = pcie_pcs_lane_u1__o_rxpipe_localfs[2];
        assign pcie_pcs_lane_u1__o_rxpipe_localfs_0[1] = pcie_pcs_lane_u1__o_rxpipe_localfs[1];
        assign pcie_pcs_lane_u1__o_rxpipe_localfs_0[0] = pcie_pcs_lane_u1__o_rxpipe_localfs[0];
        assign pcie_pcs_lane_u1__o_rxpipe_locallf_0[5] = pcie_pcs_lane_u1__o_rxpipe_locallf[5];
        assign pcie_pcs_lane_u1__o_rxpipe_locallf_0[4] = pcie_pcs_lane_u1__o_rxpipe_locallf[4];
        assign pcie_pcs_lane_u1__o_rxpipe_locallf_0[3] = pcie_pcs_lane_u1__o_rxpipe_locallf[3];
        assign pcie_pcs_lane_u1__o_rxpipe_locallf_0[2] = pcie_pcs_lane_u1__o_rxpipe_locallf[2];
        assign pcie_pcs_lane_u1__o_rxpipe_locallf_0[1] = pcie_pcs_lane_u1__o_rxpipe_locallf[1];
        assign pcie_pcs_lane_u1__o_rxpipe_locallf_0[0] = pcie_pcs_lane_u1__o_rxpipe_locallf[0];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxcoefficientsvalid_0 = pcie_pcs_lane_u1__o_rxpipe_localtxcoefficientsvalid;
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[17] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[17];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[16] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[16];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[15] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[15];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[14] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[14];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[13] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[13];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[12] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[12];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[11] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[11];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[10] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[10];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[9] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[9];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[8] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[8];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[7] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[7];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[6] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[6];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[5] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[5];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[4] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[4];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[3] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[3];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[2] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[2];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[1] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[1];
        assign pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[0] = pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients[0];
        assign pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[7] = pcie_pcs_lane_u1__o_rxpipe_p2m_bus[7];
        assign pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[6] = pcie_pcs_lane_u1__o_rxpipe_p2m_bus[6];
        assign pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[5] = pcie_pcs_lane_u1__o_rxpipe_p2m_bus[5];
        assign pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[4] = pcie_pcs_lane_u1__o_rxpipe_p2m_bus[4];
        assign pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[3] = pcie_pcs_lane_u1__o_rxpipe_p2m_bus[3];
        assign pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[2] = pcie_pcs_lane_u1__o_rxpipe_p2m_bus[2];
        assign pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[1] = pcie_pcs_lane_u1__o_rxpipe_p2m_bus[1];
        assign pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[0] = pcie_pcs_lane_u1__o_rxpipe_p2m_bus[0];
        assign pcie_pcs_lane_u1__o_rxpipe_pclkchangeok_0 = pcie_pcs_lane_u1__o_rxpipe_pclkchangeok;
        assign pcie_pcs_lane_u1__o_rxpipe_phystatus_0 = pcie_pcs_lane_u1__o_rxpipe_phystatus;
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[39] = pcie_pcs_lane_u1__o_rxpipe_rxdata[39];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[38] = pcie_pcs_lane_u1__o_rxpipe_rxdata[38];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[37] = pcie_pcs_lane_u1__o_rxpipe_rxdata[37];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[36] = pcie_pcs_lane_u1__o_rxpipe_rxdata[36];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[35] = pcie_pcs_lane_u1__o_rxpipe_rxdata[35];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[34] = pcie_pcs_lane_u1__o_rxpipe_rxdata[34];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[33] = pcie_pcs_lane_u1__o_rxpipe_rxdata[33];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[32] = pcie_pcs_lane_u1__o_rxpipe_rxdata[32];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[31] = pcie_pcs_lane_u1__o_rxpipe_rxdata[31];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[30] = pcie_pcs_lane_u1__o_rxpipe_rxdata[30];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[29] = pcie_pcs_lane_u1__o_rxpipe_rxdata[29];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[28] = pcie_pcs_lane_u1__o_rxpipe_rxdata[28];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[27] = pcie_pcs_lane_u1__o_rxpipe_rxdata[27];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[26] = pcie_pcs_lane_u1__o_rxpipe_rxdata[26];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[25] = pcie_pcs_lane_u1__o_rxpipe_rxdata[25];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[24] = pcie_pcs_lane_u1__o_rxpipe_rxdata[24];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[23] = pcie_pcs_lane_u1__o_rxpipe_rxdata[23];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[22] = pcie_pcs_lane_u1__o_rxpipe_rxdata[22];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[21] = pcie_pcs_lane_u1__o_rxpipe_rxdata[21];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[20] = pcie_pcs_lane_u1__o_rxpipe_rxdata[20];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[19] = pcie_pcs_lane_u1__o_rxpipe_rxdata[19];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[18] = pcie_pcs_lane_u1__o_rxpipe_rxdata[18];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[17] = pcie_pcs_lane_u1__o_rxpipe_rxdata[17];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[16] = pcie_pcs_lane_u1__o_rxpipe_rxdata[16];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[15] = pcie_pcs_lane_u1__o_rxpipe_rxdata[15];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[14] = pcie_pcs_lane_u1__o_rxpipe_rxdata[14];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[13] = pcie_pcs_lane_u1__o_rxpipe_rxdata[13];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[12] = pcie_pcs_lane_u1__o_rxpipe_rxdata[12];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[11] = pcie_pcs_lane_u1__o_rxpipe_rxdata[11];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[10] = pcie_pcs_lane_u1__o_rxpipe_rxdata[10];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[9] = pcie_pcs_lane_u1__o_rxpipe_rxdata[9];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[8] = pcie_pcs_lane_u1__o_rxpipe_rxdata[8];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[7] = pcie_pcs_lane_u1__o_rxpipe_rxdata[7];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[6] = pcie_pcs_lane_u1__o_rxpipe_rxdata[6];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[5] = pcie_pcs_lane_u1__o_rxpipe_rxdata[5];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[4] = pcie_pcs_lane_u1__o_rxpipe_rxdata[4];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[3] = pcie_pcs_lane_u1__o_rxpipe_rxdata[3];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[2] = pcie_pcs_lane_u1__o_rxpipe_rxdata[2];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[1] = pcie_pcs_lane_u1__o_rxpipe_rxdata[1];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdata_0[0] = pcie_pcs_lane_u1__o_rxpipe_rxdata[0];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdatak_0[3] = pcie_pcs_lane_u1__o_rxpipe_rxdatak[3];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdatak_0[2] = pcie_pcs_lane_u1__o_rxpipe_rxdatak[2];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdatak_0[1] = pcie_pcs_lane_u1__o_rxpipe_rxdatak[1];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdatak_0[0] = pcie_pcs_lane_u1__o_rxpipe_rxdatak[0];
        assign pcie_pcs_lane_u1__o_rxpipe_rxdatavalid_0 = pcie_pcs_lane_u1__o_rxpipe_rxdatavalid;
        assign pcie_pcs_lane_u1__o_rxpipe_rxelecidlea_0 = pcie_pcs_lane_u1__o_rxpipe_rxelecidlea;
        assign pcie_pcs_lane_u1__o_rxpipe_rxstandbystatus_0 = pcie_pcs_lane_u1__o_rxpipe_rxstandbystatus;
        assign pcie_pcs_lane_u1__o_rxpipe_rxstartblock_0 = pcie_pcs_lane_u1__o_rxpipe_rxstartblock;
        assign pcie_pcs_lane_u1__o_rxpipe_rxstatus_0[2] = pcie_pcs_lane_u1__o_rxpipe_rxstatus[2];
        assign pcie_pcs_lane_u1__o_rxpipe_rxstatus_0[1] = pcie_pcs_lane_u1__o_rxpipe_rxstatus[1];
        assign pcie_pcs_lane_u1__o_rxpipe_rxstatus_0[0] = pcie_pcs_lane_u1__o_rxpipe_rxstatus[0];
        assign pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0[3] = pcie_pcs_lane_u1__o_rxpipe_rxsyncheader[3];
        assign pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0[2] = pcie_pcs_lane_u1__o_rxpipe_rxsyncheader[2];
        assign pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0[1] = pcie_pcs_lane_u1__o_rxpipe_rxsyncheader[1];
        assign pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0[0] = pcie_pcs_lane_u1__o_rxpipe_rxsyncheader[0];
        assign pcie_pcs_lane_u1__o_rxpipe_rxvalid_0 = pcie_pcs_lane_u1__o_rxpipe_rxvalid;

        assign o_same_quad_rxpipe1_dirfeedback[5] = o_same_quad_rxpipe1_dirfeedback_0[5];
        assign o_same_quad_rxpipe1_dirfeedback[4] = o_same_quad_rxpipe1_dirfeedback_0[4];
        assign o_same_quad_rxpipe1_dirfeedback[3] = o_same_quad_rxpipe1_dirfeedback_0[3];
        assign o_same_quad_rxpipe1_dirfeedback[2] = o_same_quad_rxpipe1_dirfeedback_0[2];
        assign o_same_quad_rxpipe1_dirfeedback[1] = o_same_quad_rxpipe1_dirfeedback_0[1];
        assign o_same_quad_rxpipe1_dirfeedback[0] = o_same_quad_rxpipe1_dirfeedback_0[0];
        assign o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit[7] = o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[7];
        assign o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit[6] = o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[6];
        assign o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit[5] = o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[5];
        assign o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit[4] = o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[4];
        assign o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit[3] = o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[3];
        assign o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit[2] = o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[2];
        assign o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit[1] = o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[1];
        assign o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit[0] = o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[0];
        assign o_same_quad_rxpipe1_localfs[5] = o_same_quad_rxpipe1_localfs_0[5];
        assign o_same_quad_rxpipe1_localfs[4] = o_same_quad_rxpipe1_localfs_0[4];
        assign o_same_quad_rxpipe1_localfs[3] = o_same_quad_rxpipe1_localfs_0[3];
        assign o_same_quad_rxpipe1_localfs[2] = o_same_quad_rxpipe1_localfs_0[2];
        assign o_same_quad_rxpipe1_localfs[1] = o_same_quad_rxpipe1_localfs_0[1];
        assign o_same_quad_rxpipe1_localfs[0] = o_same_quad_rxpipe1_localfs_0[0];
        assign o_same_quad_rxpipe1_locallf[5] = o_same_quad_rxpipe1_locallf_0[5];
        assign o_same_quad_rxpipe1_locallf[4] = o_same_quad_rxpipe1_locallf_0[4];
        assign o_same_quad_rxpipe1_locallf[3] = o_same_quad_rxpipe1_locallf_0[3];
        assign o_same_quad_rxpipe1_locallf[2] = o_same_quad_rxpipe1_locallf_0[2];
        assign o_same_quad_rxpipe1_locallf[1] = o_same_quad_rxpipe1_locallf_0[1];
        assign o_same_quad_rxpipe1_locallf[0] = o_same_quad_rxpipe1_locallf_0[0];
        assign o_same_quad_rxpipe1_localtxcoefficientsvalid = o_same_quad_rxpipe1_localtxcoefficientsvalid_0;
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[17] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[17];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[16] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[16];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[15] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[15];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[14] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[14];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[13] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[13];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[12] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[12];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[11] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[11];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[10] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[10];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[9] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[9];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[8] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[8];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[7] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[7];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[6] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[6];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[5] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[5];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[4] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[4];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[3] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[3];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[2] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[2];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[1] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[1];
        assign o_same_quad_rxpipe1_localtxpresetcoefficients[0] = o_same_quad_rxpipe1_localtxpresetcoefficients_0[0];
        assign o_same_quad_rxpipe1_p2m_bus[7] = o_same_quad_rxpipe1_p2m_bus_0[7];
        assign o_same_quad_rxpipe1_p2m_bus[6] = o_same_quad_rxpipe1_p2m_bus_0[6];
        assign o_same_quad_rxpipe1_p2m_bus[5] = o_same_quad_rxpipe1_p2m_bus_0[5];
        assign o_same_quad_rxpipe1_p2m_bus[4] = o_same_quad_rxpipe1_p2m_bus_0[4];
        assign o_same_quad_rxpipe1_p2m_bus[3] = o_same_quad_rxpipe1_p2m_bus_0[3];
        assign o_same_quad_rxpipe1_p2m_bus[2] = o_same_quad_rxpipe1_p2m_bus_0[2];
        assign o_same_quad_rxpipe1_p2m_bus[1] = o_same_quad_rxpipe1_p2m_bus_0[1];
        assign o_same_quad_rxpipe1_p2m_bus[0] = o_same_quad_rxpipe1_p2m_bus_0[0];
        assign o_same_quad_rxpipe1_pclkchangeok = o_same_quad_rxpipe1_pclkchangeok_0;
        assign o_same_quad_rxpipe1_phystatus = o_same_quad_rxpipe1_phystatus_0;
        assign o_same_quad_rxpipe1_rxdata[39] = o_same_quad_rxpipe1_rxdata_0[39];
        assign o_same_quad_rxpipe1_rxdata[38] = o_same_quad_rxpipe1_rxdata_0[38];
        assign o_same_quad_rxpipe1_rxdata[37] = o_same_quad_rxpipe1_rxdata_0[37];
        assign o_same_quad_rxpipe1_rxdata[36] = o_same_quad_rxpipe1_rxdata_0[36];
        assign o_same_quad_rxpipe1_rxdata[35] = o_same_quad_rxpipe1_rxdata_0[35];
        assign o_same_quad_rxpipe1_rxdata[34] = o_same_quad_rxpipe1_rxdata_0[34];
        assign o_same_quad_rxpipe1_rxdata[33] = o_same_quad_rxpipe1_rxdata_0[33];
        assign o_same_quad_rxpipe1_rxdata[32] = o_same_quad_rxpipe1_rxdata_0[32];
        assign o_same_quad_rxpipe1_rxdata[31] = o_same_quad_rxpipe1_rxdata_0[31];
        assign o_same_quad_rxpipe1_rxdata[30] = o_same_quad_rxpipe1_rxdata_0[30];
        assign o_same_quad_rxpipe1_rxdata[29] = o_same_quad_rxpipe1_rxdata_0[29];
        assign o_same_quad_rxpipe1_rxdata[28] = o_same_quad_rxpipe1_rxdata_0[28];
        assign o_same_quad_rxpipe1_rxdata[27] = o_same_quad_rxpipe1_rxdata_0[27];
        assign o_same_quad_rxpipe1_rxdata[26] = o_same_quad_rxpipe1_rxdata_0[26];
        assign o_same_quad_rxpipe1_rxdata[25] = o_same_quad_rxpipe1_rxdata_0[25];
        assign o_same_quad_rxpipe1_rxdata[24] = o_same_quad_rxpipe1_rxdata_0[24];
        assign o_same_quad_rxpipe1_rxdata[23] = o_same_quad_rxpipe1_rxdata_0[23];
        assign o_same_quad_rxpipe1_rxdata[22] = o_same_quad_rxpipe1_rxdata_0[22];
        assign o_same_quad_rxpipe1_rxdata[21] = o_same_quad_rxpipe1_rxdata_0[21];
        assign o_same_quad_rxpipe1_rxdata[20] = o_same_quad_rxpipe1_rxdata_0[20];
        assign o_same_quad_rxpipe1_rxdata[19] = o_same_quad_rxpipe1_rxdata_0[19];
        assign o_same_quad_rxpipe1_rxdata[18] = o_same_quad_rxpipe1_rxdata_0[18];
        assign o_same_quad_rxpipe1_rxdata[17] = o_same_quad_rxpipe1_rxdata_0[17];
        assign o_same_quad_rxpipe1_rxdata[16] = o_same_quad_rxpipe1_rxdata_0[16];
        assign o_same_quad_rxpipe1_rxdata[15] = o_same_quad_rxpipe1_rxdata_0[15];
        assign o_same_quad_rxpipe1_rxdata[14] = o_same_quad_rxpipe1_rxdata_0[14];
        assign o_same_quad_rxpipe1_rxdata[13] = o_same_quad_rxpipe1_rxdata_0[13];
        assign o_same_quad_rxpipe1_rxdata[12] = o_same_quad_rxpipe1_rxdata_0[12];
        assign o_same_quad_rxpipe1_rxdata[11] = o_same_quad_rxpipe1_rxdata_0[11];
        assign o_same_quad_rxpipe1_rxdata[10] = o_same_quad_rxpipe1_rxdata_0[10];
        assign o_same_quad_rxpipe1_rxdata[9] = o_same_quad_rxpipe1_rxdata_0[9];
        assign o_same_quad_rxpipe1_rxdata[8] = o_same_quad_rxpipe1_rxdata_0[8];
        assign o_same_quad_rxpipe1_rxdata[7] = o_same_quad_rxpipe1_rxdata_0[7];
        assign o_same_quad_rxpipe1_rxdata[6] = o_same_quad_rxpipe1_rxdata_0[6];
        assign o_same_quad_rxpipe1_rxdata[5] = o_same_quad_rxpipe1_rxdata_0[5];
        assign o_same_quad_rxpipe1_rxdata[4] = o_same_quad_rxpipe1_rxdata_0[4];
        assign o_same_quad_rxpipe1_rxdata[3] = o_same_quad_rxpipe1_rxdata_0[3];
        assign o_same_quad_rxpipe1_rxdata[2] = o_same_quad_rxpipe1_rxdata_0[2];
        assign o_same_quad_rxpipe1_rxdata[1] = o_same_quad_rxpipe1_rxdata_0[1];
        assign o_same_quad_rxpipe1_rxdata[0] = o_same_quad_rxpipe1_rxdata_0[0];
        assign o_same_quad_rxpipe1_rxdatak[3] = o_same_quad_rxpipe1_rxdatak_0[3];
        assign o_same_quad_rxpipe1_rxdatak[2] = o_same_quad_rxpipe1_rxdatak_0[2];
        assign o_same_quad_rxpipe1_rxdatak[1] = o_same_quad_rxpipe1_rxdatak_0[1];
        assign o_same_quad_rxpipe1_rxdatak[0] = o_same_quad_rxpipe1_rxdatak_0[0];
        assign o_same_quad_rxpipe1_rxdatavalid = o_same_quad_rxpipe1_rxdatavalid_0;
        assign o_same_quad_rxpipe1_rxelecidlea = o_same_quad_rxpipe1_rxelecidlea_0;
        assign o_same_quad_rxpipe1_rxstandbystatus = o_same_quad_rxpipe1_rxstandbystatus_0;
        assign o_same_quad_rxpipe1_rxstartblock = o_same_quad_rxpipe1_rxstartblock_0;
        assign o_same_quad_rxpipe1_rxstatus[2] = o_same_quad_rxpipe1_rxstatus_0[2];
        assign o_same_quad_rxpipe1_rxstatus[1] = o_same_quad_rxpipe1_rxstatus_0[1];
        assign o_same_quad_rxpipe1_rxstatus[0] = o_same_quad_rxpipe1_rxstatus_0[0];
        assign o_same_quad_rxpipe1_rxsyncheader[3] = o_same_quad_rxpipe1_rxsyncheader_0[3];
        assign o_same_quad_rxpipe1_rxsyncheader[2] = o_same_quad_rxpipe1_rxsyncheader_0[2];
        assign o_same_quad_rxpipe1_rxsyncheader[1] = o_same_quad_rxpipe1_rxsyncheader_0[1];
        assign o_same_quad_rxpipe1_rxsyncheader[0] = o_same_quad_rxpipe1_rxsyncheader_0[0];
        assign o_same_quad_rxpipe1_rxvalid = o_same_quad_rxpipe1_rxvalid_0;
        assign pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[5] = pcie_pcs_lane_u2__o_rxpipe_dirfeedback[5];
        assign pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[4] = pcie_pcs_lane_u2__o_rxpipe_dirfeedback[4];
        assign pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[3] = pcie_pcs_lane_u2__o_rxpipe_dirfeedback[3];
        assign pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[2] = pcie_pcs_lane_u2__o_rxpipe_dirfeedback[2];
        assign pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[1] = pcie_pcs_lane_u2__o_rxpipe_dirfeedback[1];
        assign pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[0] = pcie_pcs_lane_u2__o_rxpipe_dirfeedback[0];
        assign pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[7] = pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit[7];
        assign pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[6] = pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit[6];
        assign pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[5] = pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit[5];
        assign pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[4] = pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit[4];
        assign pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[3] = pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit[3];
        assign pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[2] = pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit[2];
        assign pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[1] = pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit[1];
        assign pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[0] = pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit[0];
        assign pcie_pcs_lane_u2__o_rxpipe_localfs_0[5] = pcie_pcs_lane_u2__o_rxpipe_localfs[5];
        assign pcie_pcs_lane_u2__o_rxpipe_localfs_0[4] = pcie_pcs_lane_u2__o_rxpipe_localfs[4];
        assign pcie_pcs_lane_u2__o_rxpipe_localfs_0[3] = pcie_pcs_lane_u2__o_rxpipe_localfs[3];
        assign pcie_pcs_lane_u2__o_rxpipe_localfs_0[2] = pcie_pcs_lane_u2__o_rxpipe_localfs[2];
        assign pcie_pcs_lane_u2__o_rxpipe_localfs_0[1] = pcie_pcs_lane_u2__o_rxpipe_localfs[1];
        assign pcie_pcs_lane_u2__o_rxpipe_localfs_0[0] = pcie_pcs_lane_u2__o_rxpipe_localfs[0];
        assign pcie_pcs_lane_u2__o_rxpipe_locallf_0[5] = pcie_pcs_lane_u2__o_rxpipe_locallf[5];
        assign pcie_pcs_lane_u2__o_rxpipe_locallf_0[4] = pcie_pcs_lane_u2__o_rxpipe_locallf[4];
        assign pcie_pcs_lane_u2__o_rxpipe_locallf_0[3] = pcie_pcs_lane_u2__o_rxpipe_locallf[3];
        assign pcie_pcs_lane_u2__o_rxpipe_locallf_0[2] = pcie_pcs_lane_u2__o_rxpipe_locallf[2];
        assign pcie_pcs_lane_u2__o_rxpipe_locallf_0[1] = pcie_pcs_lane_u2__o_rxpipe_locallf[1];
        assign pcie_pcs_lane_u2__o_rxpipe_locallf_0[0] = pcie_pcs_lane_u2__o_rxpipe_locallf[0];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxcoefficientsvalid_0 = pcie_pcs_lane_u2__o_rxpipe_localtxcoefficientsvalid;
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[17] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[17];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[16] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[16];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[15] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[15];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[14] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[14];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[13] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[13];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[12] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[12];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[11] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[11];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[10] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[10];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[9] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[9];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[8] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[8];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[7] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[7];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[6] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[6];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[5] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[5];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[4] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[4];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[3] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[3];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[2] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[2];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[1] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[1];
        assign pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[0] = pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients[0];
        assign pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[7] = pcie_pcs_lane_u2__o_rxpipe_p2m_bus[7];
        assign pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[6] = pcie_pcs_lane_u2__o_rxpipe_p2m_bus[6];
        assign pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[5] = pcie_pcs_lane_u2__o_rxpipe_p2m_bus[5];
        assign pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[4] = pcie_pcs_lane_u2__o_rxpipe_p2m_bus[4];
        assign pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[3] = pcie_pcs_lane_u2__o_rxpipe_p2m_bus[3];
        assign pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[2] = pcie_pcs_lane_u2__o_rxpipe_p2m_bus[2];
        assign pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[1] = pcie_pcs_lane_u2__o_rxpipe_p2m_bus[1];
        assign pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[0] = pcie_pcs_lane_u2__o_rxpipe_p2m_bus[0];
        assign pcie_pcs_lane_u2__o_rxpipe_pclkchangeok_0 = pcie_pcs_lane_u2__o_rxpipe_pclkchangeok;
        assign pcie_pcs_lane_u2__o_rxpipe_phystatus_0 = pcie_pcs_lane_u2__o_rxpipe_phystatus;
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[39] = pcie_pcs_lane_u2__o_rxpipe_rxdata[39];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[38] = pcie_pcs_lane_u2__o_rxpipe_rxdata[38];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[37] = pcie_pcs_lane_u2__o_rxpipe_rxdata[37];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[36] = pcie_pcs_lane_u2__o_rxpipe_rxdata[36];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[35] = pcie_pcs_lane_u2__o_rxpipe_rxdata[35];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[34] = pcie_pcs_lane_u2__o_rxpipe_rxdata[34];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[33] = pcie_pcs_lane_u2__o_rxpipe_rxdata[33];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[32] = pcie_pcs_lane_u2__o_rxpipe_rxdata[32];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[31] = pcie_pcs_lane_u2__o_rxpipe_rxdata[31];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[30] = pcie_pcs_lane_u2__o_rxpipe_rxdata[30];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[29] = pcie_pcs_lane_u2__o_rxpipe_rxdata[29];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[28] = pcie_pcs_lane_u2__o_rxpipe_rxdata[28];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[27] = pcie_pcs_lane_u2__o_rxpipe_rxdata[27];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[26] = pcie_pcs_lane_u2__o_rxpipe_rxdata[26];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[25] = pcie_pcs_lane_u2__o_rxpipe_rxdata[25];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[24] = pcie_pcs_lane_u2__o_rxpipe_rxdata[24];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[23] = pcie_pcs_lane_u2__o_rxpipe_rxdata[23];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[22] = pcie_pcs_lane_u2__o_rxpipe_rxdata[22];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[21] = pcie_pcs_lane_u2__o_rxpipe_rxdata[21];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[20] = pcie_pcs_lane_u2__o_rxpipe_rxdata[20];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[19] = pcie_pcs_lane_u2__o_rxpipe_rxdata[19];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[18] = pcie_pcs_lane_u2__o_rxpipe_rxdata[18];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[17] = pcie_pcs_lane_u2__o_rxpipe_rxdata[17];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[16] = pcie_pcs_lane_u2__o_rxpipe_rxdata[16];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[15] = pcie_pcs_lane_u2__o_rxpipe_rxdata[15];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[14] = pcie_pcs_lane_u2__o_rxpipe_rxdata[14];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[13] = pcie_pcs_lane_u2__o_rxpipe_rxdata[13];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[12] = pcie_pcs_lane_u2__o_rxpipe_rxdata[12];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[11] = pcie_pcs_lane_u2__o_rxpipe_rxdata[11];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[10] = pcie_pcs_lane_u2__o_rxpipe_rxdata[10];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[9] = pcie_pcs_lane_u2__o_rxpipe_rxdata[9];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[8] = pcie_pcs_lane_u2__o_rxpipe_rxdata[8];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[7] = pcie_pcs_lane_u2__o_rxpipe_rxdata[7];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[6] = pcie_pcs_lane_u2__o_rxpipe_rxdata[6];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[5] = pcie_pcs_lane_u2__o_rxpipe_rxdata[5];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[4] = pcie_pcs_lane_u2__o_rxpipe_rxdata[4];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[3] = pcie_pcs_lane_u2__o_rxpipe_rxdata[3];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[2] = pcie_pcs_lane_u2__o_rxpipe_rxdata[2];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[1] = pcie_pcs_lane_u2__o_rxpipe_rxdata[1];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdata_0[0] = pcie_pcs_lane_u2__o_rxpipe_rxdata[0];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdatak_0[3] = pcie_pcs_lane_u2__o_rxpipe_rxdatak[3];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdatak_0[2] = pcie_pcs_lane_u2__o_rxpipe_rxdatak[2];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdatak_0[1] = pcie_pcs_lane_u2__o_rxpipe_rxdatak[1];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdatak_0[0] = pcie_pcs_lane_u2__o_rxpipe_rxdatak[0];
        assign pcie_pcs_lane_u2__o_rxpipe_rxdatavalid_0 = pcie_pcs_lane_u2__o_rxpipe_rxdatavalid;
        assign pcie_pcs_lane_u2__o_rxpipe_rxelecidlea_0 = pcie_pcs_lane_u2__o_rxpipe_rxelecidlea;
        assign pcie_pcs_lane_u2__o_rxpipe_rxstandbystatus_0 = pcie_pcs_lane_u2__o_rxpipe_rxstandbystatus;
        assign pcie_pcs_lane_u2__o_rxpipe_rxstartblock_0 = pcie_pcs_lane_u2__o_rxpipe_rxstartblock;
        assign pcie_pcs_lane_u2__o_rxpipe_rxstatus_0[2] = pcie_pcs_lane_u2__o_rxpipe_rxstatus[2];
        assign pcie_pcs_lane_u2__o_rxpipe_rxstatus_0[1] = pcie_pcs_lane_u2__o_rxpipe_rxstatus[1];
        assign pcie_pcs_lane_u2__o_rxpipe_rxstatus_0[0] = pcie_pcs_lane_u2__o_rxpipe_rxstatus[0];
        assign pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0[3] = pcie_pcs_lane_u2__o_rxpipe_rxsyncheader[3];
        assign pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0[2] = pcie_pcs_lane_u2__o_rxpipe_rxsyncheader[2];
        assign pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0[1] = pcie_pcs_lane_u2__o_rxpipe_rxsyncheader[1];
        assign pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0[0] = pcie_pcs_lane_u2__o_rxpipe_rxsyncheader[0];
        assign pcie_pcs_lane_u2__o_rxpipe_rxvalid_0 = pcie_pcs_lane_u2__o_rxpipe_rxvalid;

        assign o_same_quad_rxpipe2_dirfeedback[5] = o_same_quad_rxpipe2_dirfeedback_0[5];
        assign o_same_quad_rxpipe2_dirfeedback[4] = o_same_quad_rxpipe2_dirfeedback_0[4];
        assign o_same_quad_rxpipe2_dirfeedback[3] = o_same_quad_rxpipe2_dirfeedback_0[3];
        assign o_same_quad_rxpipe2_dirfeedback[2] = o_same_quad_rxpipe2_dirfeedback_0[2];
        assign o_same_quad_rxpipe2_dirfeedback[1] = o_same_quad_rxpipe2_dirfeedback_0[1];
        assign o_same_quad_rxpipe2_dirfeedback[0] = o_same_quad_rxpipe2_dirfeedback_0[0];
        assign o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit[7] = o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[7];
        assign o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit[6] = o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[6];
        assign o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit[5] = o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[5];
        assign o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit[4] = o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[4];
        assign o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit[3] = o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[3];
        assign o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit[2] = o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[2];
        assign o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit[1] = o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[1];
        assign o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit[0] = o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[0];
        assign o_same_quad_rxpipe2_localfs[5] = o_same_quad_rxpipe2_localfs_0[5];
        assign o_same_quad_rxpipe2_localfs[4] = o_same_quad_rxpipe2_localfs_0[4];
        assign o_same_quad_rxpipe2_localfs[3] = o_same_quad_rxpipe2_localfs_0[3];
        assign o_same_quad_rxpipe2_localfs[2] = o_same_quad_rxpipe2_localfs_0[2];
        assign o_same_quad_rxpipe2_localfs[1] = o_same_quad_rxpipe2_localfs_0[1];
        assign o_same_quad_rxpipe2_localfs[0] = o_same_quad_rxpipe2_localfs_0[0];
        assign o_same_quad_rxpipe2_locallf[5] = o_same_quad_rxpipe2_locallf_0[5];
        assign o_same_quad_rxpipe2_locallf[4] = o_same_quad_rxpipe2_locallf_0[4];
        assign o_same_quad_rxpipe2_locallf[3] = o_same_quad_rxpipe2_locallf_0[3];
        assign o_same_quad_rxpipe2_locallf[2] = o_same_quad_rxpipe2_locallf_0[2];
        assign o_same_quad_rxpipe2_locallf[1] = o_same_quad_rxpipe2_locallf_0[1];
        assign o_same_quad_rxpipe2_locallf[0] = o_same_quad_rxpipe2_locallf_0[0];
        assign o_same_quad_rxpipe2_localtxcoefficientsvalid = o_same_quad_rxpipe2_localtxcoefficientsvalid_0;
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[17] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[17];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[16] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[16];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[15] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[15];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[14] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[14];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[13] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[13];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[12] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[12];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[11] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[11];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[10] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[10];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[9] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[9];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[8] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[8];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[7] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[7];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[6] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[6];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[5] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[5];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[4] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[4];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[3] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[3];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[2] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[2];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[1] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[1];
        assign o_same_quad_rxpipe2_localtxpresetcoefficients[0] = o_same_quad_rxpipe2_localtxpresetcoefficients_0[0];
        assign o_same_quad_rxpipe2_p2m_bus[7] = o_same_quad_rxpipe2_p2m_bus_0[7];
        assign o_same_quad_rxpipe2_p2m_bus[6] = o_same_quad_rxpipe2_p2m_bus_0[6];
        assign o_same_quad_rxpipe2_p2m_bus[5] = o_same_quad_rxpipe2_p2m_bus_0[5];
        assign o_same_quad_rxpipe2_p2m_bus[4] = o_same_quad_rxpipe2_p2m_bus_0[4];
        assign o_same_quad_rxpipe2_p2m_bus[3] = o_same_quad_rxpipe2_p2m_bus_0[3];
        assign o_same_quad_rxpipe2_p2m_bus[2] = o_same_quad_rxpipe2_p2m_bus_0[2];
        assign o_same_quad_rxpipe2_p2m_bus[1] = o_same_quad_rxpipe2_p2m_bus_0[1];
        assign o_same_quad_rxpipe2_p2m_bus[0] = o_same_quad_rxpipe2_p2m_bus_0[0];
        assign o_same_quad_rxpipe2_pclkchangeok = o_same_quad_rxpipe2_pclkchangeok_0;
        assign o_same_quad_rxpipe2_phystatus = o_same_quad_rxpipe2_phystatus_0;
        assign o_same_quad_rxpipe2_rxdata[39] = o_same_quad_rxpipe2_rxdata_0[39];
        assign o_same_quad_rxpipe2_rxdata[38] = o_same_quad_rxpipe2_rxdata_0[38];
        assign o_same_quad_rxpipe2_rxdata[37] = o_same_quad_rxpipe2_rxdata_0[37];
        assign o_same_quad_rxpipe2_rxdata[36] = o_same_quad_rxpipe2_rxdata_0[36];
        assign o_same_quad_rxpipe2_rxdata[35] = o_same_quad_rxpipe2_rxdata_0[35];
        assign o_same_quad_rxpipe2_rxdata[34] = o_same_quad_rxpipe2_rxdata_0[34];
        assign o_same_quad_rxpipe2_rxdata[33] = o_same_quad_rxpipe2_rxdata_0[33];
        assign o_same_quad_rxpipe2_rxdata[32] = o_same_quad_rxpipe2_rxdata_0[32];
        assign o_same_quad_rxpipe2_rxdata[31] = o_same_quad_rxpipe2_rxdata_0[31];
        assign o_same_quad_rxpipe2_rxdata[30] = o_same_quad_rxpipe2_rxdata_0[30];
        assign o_same_quad_rxpipe2_rxdata[29] = o_same_quad_rxpipe2_rxdata_0[29];
        assign o_same_quad_rxpipe2_rxdata[28] = o_same_quad_rxpipe2_rxdata_0[28];
        assign o_same_quad_rxpipe2_rxdata[27] = o_same_quad_rxpipe2_rxdata_0[27];
        assign o_same_quad_rxpipe2_rxdata[26] = o_same_quad_rxpipe2_rxdata_0[26];
        assign o_same_quad_rxpipe2_rxdata[25] = o_same_quad_rxpipe2_rxdata_0[25];
        assign o_same_quad_rxpipe2_rxdata[24] = o_same_quad_rxpipe2_rxdata_0[24];
        assign o_same_quad_rxpipe2_rxdata[23] = o_same_quad_rxpipe2_rxdata_0[23];
        assign o_same_quad_rxpipe2_rxdata[22] = o_same_quad_rxpipe2_rxdata_0[22];
        assign o_same_quad_rxpipe2_rxdata[21] = o_same_quad_rxpipe2_rxdata_0[21];
        assign o_same_quad_rxpipe2_rxdata[20] = o_same_quad_rxpipe2_rxdata_0[20];
        assign o_same_quad_rxpipe2_rxdata[19] = o_same_quad_rxpipe2_rxdata_0[19];
        assign o_same_quad_rxpipe2_rxdata[18] = o_same_quad_rxpipe2_rxdata_0[18];
        assign o_same_quad_rxpipe2_rxdata[17] = o_same_quad_rxpipe2_rxdata_0[17];
        assign o_same_quad_rxpipe2_rxdata[16] = o_same_quad_rxpipe2_rxdata_0[16];
        assign o_same_quad_rxpipe2_rxdata[15] = o_same_quad_rxpipe2_rxdata_0[15];
        assign o_same_quad_rxpipe2_rxdata[14] = o_same_quad_rxpipe2_rxdata_0[14];
        assign o_same_quad_rxpipe2_rxdata[13] = o_same_quad_rxpipe2_rxdata_0[13];
        assign o_same_quad_rxpipe2_rxdata[12] = o_same_quad_rxpipe2_rxdata_0[12];
        assign o_same_quad_rxpipe2_rxdata[11] = o_same_quad_rxpipe2_rxdata_0[11];
        assign o_same_quad_rxpipe2_rxdata[10] = o_same_quad_rxpipe2_rxdata_0[10];
        assign o_same_quad_rxpipe2_rxdata[9] = o_same_quad_rxpipe2_rxdata_0[9];
        assign o_same_quad_rxpipe2_rxdata[8] = o_same_quad_rxpipe2_rxdata_0[8];
        assign o_same_quad_rxpipe2_rxdata[7] = o_same_quad_rxpipe2_rxdata_0[7];
        assign o_same_quad_rxpipe2_rxdata[6] = o_same_quad_rxpipe2_rxdata_0[6];
        assign o_same_quad_rxpipe2_rxdata[5] = o_same_quad_rxpipe2_rxdata_0[5];
        assign o_same_quad_rxpipe2_rxdata[4] = o_same_quad_rxpipe2_rxdata_0[4];
        assign o_same_quad_rxpipe2_rxdata[3] = o_same_quad_rxpipe2_rxdata_0[3];
        assign o_same_quad_rxpipe2_rxdata[2] = o_same_quad_rxpipe2_rxdata_0[2];
        assign o_same_quad_rxpipe2_rxdata[1] = o_same_quad_rxpipe2_rxdata_0[1];
        assign o_same_quad_rxpipe2_rxdata[0] = o_same_quad_rxpipe2_rxdata_0[0];
        assign o_same_quad_rxpipe2_rxdatak[3] = o_same_quad_rxpipe2_rxdatak_0[3];
        assign o_same_quad_rxpipe2_rxdatak[2] = o_same_quad_rxpipe2_rxdatak_0[2];
        assign o_same_quad_rxpipe2_rxdatak[1] = o_same_quad_rxpipe2_rxdatak_0[1];
        assign o_same_quad_rxpipe2_rxdatak[0] = o_same_quad_rxpipe2_rxdatak_0[0];
        assign o_same_quad_rxpipe2_rxdatavalid = o_same_quad_rxpipe2_rxdatavalid_0;
        assign o_same_quad_rxpipe2_rxelecidlea = o_same_quad_rxpipe2_rxelecidlea_0;
        assign o_same_quad_rxpipe2_rxstandbystatus = o_same_quad_rxpipe2_rxstandbystatus_0;
        assign o_same_quad_rxpipe2_rxstartblock = o_same_quad_rxpipe2_rxstartblock_0;
        assign o_same_quad_rxpipe2_rxstatus[2] = o_same_quad_rxpipe2_rxstatus_0[2];
        assign o_same_quad_rxpipe2_rxstatus[1] = o_same_quad_rxpipe2_rxstatus_0[1];
        assign o_same_quad_rxpipe2_rxstatus[0] = o_same_quad_rxpipe2_rxstatus_0[0];
        assign o_same_quad_rxpipe2_rxsyncheader[3] = o_same_quad_rxpipe2_rxsyncheader_0[3];
        assign o_same_quad_rxpipe2_rxsyncheader[2] = o_same_quad_rxpipe2_rxsyncheader_0[2];
        assign o_same_quad_rxpipe2_rxsyncheader[1] = o_same_quad_rxpipe2_rxsyncheader_0[1];
        assign o_same_quad_rxpipe2_rxsyncheader[0] = o_same_quad_rxpipe2_rxsyncheader_0[0];
        assign o_same_quad_rxpipe2_rxvalid = o_same_quad_rxpipe2_rxvalid_0;
        assign pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[5] = pcie_pcs_lane_u3__o_rxpipe_dirfeedback[5];
        assign pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[4] = pcie_pcs_lane_u3__o_rxpipe_dirfeedback[4];
        assign pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[3] = pcie_pcs_lane_u3__o_rxpipe_dirfeedback[3];
        assign pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[2] = pcie_pcs_lane_u3__o_rxpipe_dirfeedback[2];
        assign pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[1] = pcie_pcs_lane_u3__o_rxpipe_dirfeedback[1];
        assign pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[0] = pcie_pcs_lane_u3__o_rxpipe_dirfeedback[0];
        assign pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[7] = pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit[7];
        assign pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[6] = pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit[6];
        assign pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[5] = pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit[5];
        assign pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[4] = pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit[4];
        assign pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[3] = pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit[3];
        assign pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[2] = pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit[2];
        assign pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[1] = pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit[1];
        assign pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[0] = pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit[0];
        assign pcie_pcs_lane_u3__o_rxpipe_localfs_0[5] = pcie_pcs_lane_u3__o_rxpipe_localfs[5];
        assign pcie_pcs_lane_u3__o_rxpipe_localfs_0[4] = pcie_pcs_lane_u3__o_rxpipe_localfs[4];
        assign pcie_pcs_lane_u3__o_rxpipe_localfs_0[3] = pcie_pcs_lane_u3__o_rxpipe_localfs[3];
        assign pcie_pcs_lane_u3__o_rxpipe_localfs_0[2] = pcie_pcs_lane_u3__o_rxpipe_localfs[2];
        assign pcie_pcs_lane_u3__o_rxpipe_localfs_0[1] = pcie_pcs_lane_u3__o_rxpipe_localfs[1];
        assign pcie_pcs_lane_u3__o_rxpipe_localfs_0[0] = pcie_pcs_lane_u3__o_rxpipe_localfs[0];
        assign pcie_pcs_lane_u3__o_rxpipe_locallf_0[5] = pcie_pcs_lane_u3__o_rxpipe_locallf[5];
        assign pcie_pcs_lane_u3__o_rxpipe_locallf_0[4] = pcie_pcs_lane_u3__o_rxpipe_locallf[4];
        assign pcie_pcs_lane_u3__o_rxpipe_locallf_0[3] = pcie_pcs_lane_u3__o_rxpipe_locallf[3];
        assign pcie_pcs_lane_u3__o_rxpipe_locallf_0[2] = pcie_pcs_lane_u3__o_rxpipe_locallf[2];
        assign pcie_pcs_lane_u3__o_rxpipe_locallf_0[1] = pcie_pcs_lane_u3__o_rxpipe_locallf[1];
        assign pcie_pcs_lane_u3__o_rxpipe_locallf_0[0] = pcie_pcs_lane_u3__o_rxpipe_locallf[0];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxcoefficientsvalid_0 = pcie_pcs_lane_u3__o_rxpipe_localtxcoefficientsvalid;
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[17] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[17];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[16] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[16];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[15] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[15];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[14] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[14];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[13] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[13];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[12] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[12];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[11] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[11];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[10] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[10];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[9] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[9];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[8] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[8];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[7] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[7];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[6] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[6];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[5] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[5];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[4] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[4];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[3] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[3];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[2] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[2];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[1] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[1];
        assign pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[0] = pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients[0];
        assign pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[7] = pcie_pcs_lane_u3__o_rxpipe_p2m_bus[7];
        assign pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[6] = pcie_pcs_lane_u3__o_rxpipe_p2m_bus[6];
        assign pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[5] = pcie_pcs_lane_u3__o_rxpipe_p2m_bus[5];
        assign pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[4] = pcie_pcs_lane_u3__o_rxpipe_p2m_bus[4];
        assign pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[3] = pcie_pcs_lane_u3__o_rxpipe_p2m_bus[3];
        assign pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[2] = pcie_pcs_lane_u3__o_rxpipe_p2m_bus[2];
        assign pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[1] = pcie_pcs_lane_u3__o_rxpipe_p2m_bus[1];
        assign pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[0] = pcie_pcs_lane_u3__o_rxpipe_p2m_bus[0];
        assign pcie_pcs_lane_u3__o_rxpipe_pclkchangeok_0 = pcie_pcs_lane_u3__o_rxpipe_pclkchangeok;
        assign pcie_pcs_lane_u3__o_rxpipe_phystatus_0 = pcie_pcs_lane_u3__o_rxpipe_phystatus;
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[39] = pcie_pcs_lane_u3__o_rxpipe_rxdata[39];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[38] = pcie_pcs_lane_u3__o_rxpipe_rxdata[38];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[37] = pcie_pcs_lane_u3__o_rxpipe_rxdata[37];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[36] = pcie_pcs_lane_u3__o_rxpipe_rxdata[36];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[35] = pcie_pcs_lane_u3__o_rxpipe_rxdata[35];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[34] = pcie_pcs_lane_u3__o_rxpipe_rxdata[34];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[33] = pcie_pcs_lane_u3__o_rxpipe_rxdata[33];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[32] = pcie_pcs_lane_u3__o_rxpipe_rxdata[32];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[31] = pcie_pcs_lane_u3__o_rxpipe_rxdata[31];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[30] = pcie_pcs_lane_u3__o_rxpipe_rxdata[30];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[29] = pcie_pcs_lane_u3__o_rxpipe_rxdata[29];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[28] = pcie_pcs_lane_u3__o_rxpipe_rxdata[28];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[27] = pcie_pcs_lane_u3__o_rxpipe_rxdata[27];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[26] = pcie_pcs_lane_u3__o_rxpipe_rxdata[26];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[25] = pcie_pcs_lane_u3__o_rxpipe_rxdata[25];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[24] = pcie_pcs_lane_u3__o_rxpipe_rxdata[24];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[23] = pcie_pcs_lane_u3__o_rxpipe_rxdata[23];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[22] = pcie_pcs_lane_u3__o_rxpipe_rxdata[22];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[21] = pcie_pcs_lane_u3__o_rxpipe_rxdata[21];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[20] = pcie_pcs_lane_u3__o_rxpipe_rxdata[20];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[19] = pcie_pcs_lane_u3__o_rxpipe_rxdata[19];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[18] = pcie_pcs_lane_u3__o_rxpipe_rxdata[18];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[17] = pcie_pcs_lane_u3__o_rxpipe_rxdata[17];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[16] = pcie_pcs_lane_u3__o_rxpipe_rxdata[16];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[15] = pcie_pcs_lane_u3__o_rxpipe_rxdata[15];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[14] = pcie_pcs_lane_u3__o_rxpipe_rxdata[14];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[13] = pcie_pcs_lane_u3__o_rxpipe_rxdata[13];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[12] = pcie_pcs_lane_u3__o_rxpipe_rxdata[12];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[11] = pcie_pcs_lane_u3__o_rxpipe_rxdata[11];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[10] = pcie_pcs_lane_u3__o_rxpipe_rxdata[10];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[9] = pcie_pcs_lane_u3__o_rxpipe_rxdata[9];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[8] = pcie_pcs_lane_u3__o_rxpipe_rxdata[8];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[7] = pcie_pcs_lane_u3__o_rxpipe_rxdata[7];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[6] = pcie_pcs_lane_u3__o_rxpipe_rxdata[6];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[5] = pcie_pcs_lane_u3__o_rxpipe_rxdata[5];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[4] = pcie_pcs_lane_u3__o_rxpipe_rxdata[4];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[3] = pcie_pcs_lane_u3__o_rxpipe_rxdata[3];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[2] = pcie_pcs_lane_u3__o_rxpipe_rxdata[2];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[1] = pcie_pcs_lane_u3__o_rxpipe_rxdata[1];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdata_0[0] = pcie_pcs_lane_u3__o_rxpipe_rxdata[0];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdatak_0[3] = pcie_pcs_lane_u3__o_rxpipe_rxdatak[3];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdatak_0[2] = pcie_pcs_lane_u3__o_rxpipe_rxdatak[2];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdatak_0[1] = pcie_pcs_lane_u3__o_rxpipe_rxdatak[1];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdatak_0[0] = pcie_pcs_lane_u3__o_rxpipe_rxdatak[0];
        assign pcie_pcs_lane_u3__o_rxpipe_rxdatavalid_0 = pcie_pcs_lane_u3__o_rxpipe_rxdatavalid;
        assign pcie_pcs_lane_u3__o_rxpipe_rxelecidlea_0 = pcie_pcs_lane_u3__o_rxpipe_rxelecidlea;
        assign pcie_pcs_lane_u3__o_rxpipe_rxstandbystatus_0 = pcie_pcs_lane_u3__o_rxpipe_rxstandbystatus;
        assign pcie_pcs_lane_u3__o_rxpipe_rxstartblock_0 = pcie_pcs_lane_u3__o_rxpipe_rxstartblock;
        assign pcie_pcs_lane_u3__o_rxpipe_rxstatus_0[2] = pcie_pcs_lane_u3__o_rxpipe_rxstatus[2];
        assign pcie_pcs_lane_u3__o_rxpipe_rxstatus_0[1] = pcie_pcs_lane_u3__o_rxpipe_rxstatus[1];
        assign pcie_pcs_lane_u3__o_rxpipe_rxstatus_0[0] = pcie_pcs_lane_u3__o_rxpipe_rxstatus[0];
        assign pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0[3] = pcie_pcs_lane_u3__o_rxpipe_rxsyncheader[3];
        assign pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0[2] = pcie_pcs_lane_u3__o_rxpipe_rxsyncheader[2];
        assign pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0[1] = pcie_pcs_lane_u3__o_rxpipe_rxsyncheader[1];
        assign pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0[0] = pcie_pcs_lane_u3__o_rxpipe_rxsyncheader[0];
        assign pcie_pcs_lane_u3__o_rxpipe_rxvalid_0 = pcie_pcs_lane_u3__o_rxpipe_rxvalid;
        assign o_same_quad_rxpipe3_dirfeedback[5] = o_same_quad_rxpipe3_dirfeedback_0[5];
        assign o_same_quad_rxpipe3_dirfeedback[4] = o_same_quad_rxpipe3_dirfeedback_0[4];
        assign o_same_quad_rxpipe3_dirfeedback[3] = o_same_quad_rxpipe3_dirfeedback_0[3];
        assign o_same_quad_rxpipe3_dirfeedback[2] = o_same_quad_rxpipe3_dirfeedback_0[2];
        assign o_same_quad_rxpipe3_dirfeedback[1] = o_same_quad_rxpipe3_dirfeedback_0[1];
        assign o_same_quad_rxpipe3_dirfeedback[0] = o_same_quad_rxpipe3_dirfeedback_0[0];
        assign o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit[7] = o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[7];
        assign o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit[6] = o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[6];
        assign o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit[5] = o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[5];
        assign o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit[4] = o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[4];
        assign o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit[3] = o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[3];
        assign o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit[2] = o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[2];
        assign o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit[1] = o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[1];
        assign o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit[0] = o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[0];
        assign o_same_quad_rxpipe3_localfs[5] = o_same_quad_rxpipe3_localfs_0[5];
        assign o_same_quad_rxpipe3_localfs[4] = o_same_quad_rxpipe3_localfs_0[4];
        assign o_same_quad_rxpipe3_localfs[3] = o_same_quad_rxpipe3_localfs_0[3];
        assign o_same_quad_rxpipe3_localfs[2] = o_same_quad_rxpipe3_localfs_0[2];
        assign o_same_quad_rxpipe3_localfs[1] = o_same_quad_rxpipe3_localfs_0[1];
        assign o_same_quad_rxpipe3_localfs[0] = o_same_quad_rxpipe3_localfs_0[0];
        assign o_same_quad_rxpipe3_locallf[5] = o_same_quad_rxpipe3_locallf_0[5];
        assign o_same_quad_rxpipe3_locallf[4] = o_same_quad_rxpipe3_locallf_0[4];
        assign o_same_quad_rxpipe3_locallf[3] = o_same_quad_rxpipe3_locallf_0[3];
        assign o_same_quad_rxpipe3_locallf[2] = o_same_quad_rxpipe3_locallf_0[2];
        assign o_same_quad_rxpipe3_locallf[1] = o_same_quad_rxpipe3_locallf_0[1];
        assign o_same_quad_rxpipe3_locallf[0] = o_same_quad_rxpipe3_locallf_0[0];
        assign o_same_quad_rxpipe3_localtxcoefficientsvalid = o_same_quad_rxpipe3_localtxcoefficientsvalid_0;
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[17] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[17];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[16] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[16];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[15] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[15];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[14] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[14];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[13] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[13];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[12] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[12];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[11] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[11];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[10] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[10];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[9] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[9];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[8] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[8];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[7] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[7];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[6] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[6];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[5] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[5];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[4] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[4];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[3] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[3];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[2] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[2];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[1] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[1];
        assign o_same_quad_rxpipe3_localtxpresetcoefficients[0] = o_same_quad_rxpipe3_localtxpresetcoefficients_0[0];
        assign o_same_quad_rxpipe3_p2m_bus[7] = o_same_quad_rxpipe3_p2m_bus_0[7];
        assign o_same_quad_rxpipe3_p2m_bus[6] = o_same_quad_rxpipe3_p2m_bus_0[6];
        assign o_same_quad_rxpipe3_p2m_bus[5] = o_same_quad_rxpipe3_p2m_bus_0[5];
        assign o_same_quad_rxpipe3_p2m_bus[4] = o_same_quad_rxpipe3_p2m_bus_0[4];
        assign o_same_quad_rxpipe3_p2m_bus[3] = o_same_quad_rxpipe3_p2m_bus_0[3];
        assign o_same_quad_rxpipe3_p2m_bus[2] = o_same_quad_rxpipe3_p2m_bus_0[2];
        assign o_same_quad_rxpipe3_p2m_bus[1] = o_same_quad_rxpipe3_p2m_bus_0[1];
        assign o_same_quad_rxpipe3_p2m_bus[0] = o_same_quad_rxpipe3_p2m_bus_0[0];
        assign o_same_quad_rxpipe3_pclkchangeok = o_same_quad_rxpipe3_pclkchangeok_0;
        assign o_same_quad_rxpipe3_phystatus = o_same_quad_rxpipe3_phystatus_0;
        assign o_same_quad_rxpipe3_rxdata[39] = o_same_quad_rxpipe3_rxdata_0[39];
        assign o_same_quad_rxpipe3_rxdata[38] = o_same_quad_rxpipe3_rxdata_0[38];
        assign o_same_quad_rxpipe3_rxdata[37] = o_same_quad_rxpipe3_rxdata_0[37];
        assign o_same_quad_rxpipe3_rxdata[36] = o_same_quad_rxpipe3_rxdata_0[36];
        assign o_same_quad_rxpipe3_rxdata[35] = o_same_quad_rxpipe3_rxdata_0[35];
        assign o_same_quad_rxpipe3_rxdata[34] = o_same_quad_rxpipe3_rxdata_0[34];
        assign o_same_quad_rxpipe3_rxdata[33] = o_same_quad_rxpipe3_rxdata_0[33];
        assign o_same_quad_rxpipe3_rxdata[32] = o_same_quad_rxpipe3_rxdata_0[32];
        assign o_same_quad_rxpipe3_rxdata[31] = o_same_quad_rxpipe3_rxdata_0[31];
        assign o_same_quad_rxpipe3_rxdata[30] = o_same_quad_rxpipe3_rxdata_0[30];
        assign o_same_quad_rxpipe3_rxdata[29] = o_same_quad_rxpipe3_rxdata_0[29];
        assign o_same_quad_rxpipe3_rxdata[28] = o_same_quad_rxpipe3_rxdata_0[28];
        assign o_same_quad_rxpipe3_rxdata[27] = o_same_quad_rxpipe3_rxdata_0[27];
        assign o_same_quad_rxpipe3_rxdata[26] = o_same_quad_rxpipe3_rxdata_0[26];
        assign o_same_quad_rxpipe3_rxdata[25] = o_same_quad_rxpipe3_rxdata_0[25];
        assign o_same_quad_rxpipe3_rxdata[24] = o_same_quad_rxpipe3_rxdata_0[24];
        assign o_same_quad_rxpipe3_rxdata[23] = o_same_quad_rxpipe3_rxdata_0[23];
        assign o_same_quad_rxpipe3_rxdata[22] = o_same_quad_rxpipe3_rxdata_0[22];
        assign o_same_quad_rxpipe3_rxdata[21] = o_same_quad_rxpipe3_rxdata_0[21];
        assign o_same_quad_rxpipe3_rxdata[20] = o_same_quad_rxpipe3_rxdata_0[20];
        assign o_same_quad_rxpipe3_rxdata[19] = o_same_quad_rxpipe3_rxdata_0[19];
        assign o_same_quad_rxpipe3_rxdata[18] = o_same_quad_rxpipe3_rxdata_0[18];
        assign o_same_quad_rxpipe3_rxdata[17] = o_same_quad_rxpipe3_rxdata_0[17];
        assign o_same_quad_rxpipe3_rxdata[16] = o_same_quad_rxpipe3_rxdata_0[16];
        assign o_same_quad_rxpipe3_rxdata[15] = o_same_quad_rxpipe3_rxdata_0[15];
        assign o_same_quad_rxpipe3_rxdata[14] = o_same_quad_rxpipe3_rxdata_0[14];
        assign o_same_quad_rxpipe3_rxdata[13] = o_same_quad_rxpipe3_rxdata_0[13];
        assign o_same_quad_rxpipe3_rxdata[12] = o_same_quad_rxpipe3_rxdata_0[12];
        assign o_same_quad_rxpipe3_rxdata[11] = o_same_quad_rxpipe3_rxdata_0[11];
        assign o_same_quad_rxpipe3_rxdata[10] = o_same_quad_rxpipe3_rxdata_0[10];
        assign o_same_quad_rxpipe3_rxdata[9] = o_same_quad_rxpipe3_rxdata_0[9];
        assign o_same_quad_rxpipe3_rxdata[8] = o_same_quad_rxpipe3_rxdata_0[8];
        assign o_same_quad_rxpipe3_rxdata[7] = o_same_quad_rxpipe3_rxdata_0[7];
        assign o_same_quad_rxpipe3_rxdata[6] = o_same_quad_rxpipe3_rxdata_0[6];
        assign o_same_quad_rxpipe3_rxdata[5] = o_same_quad_rxpipe3_rxdata_0[5];
        assign o_same_quad_rxpipe3_rxdata[4] = o_same_quad_rxpipe3_rxdata_0[4];
        assign o_same_quad_rxpipe3_rxdata[3] = o_same_quad_rxpipe3_rxdata_0[3];
        assign o_same_quad_rxpipe3_rxdata[2] = o_same_quad_rxpipe3_rxdata_0[2];
        assign o_same_quad_rxpipe3_rxdata[1] = o_same_quad_rxpipe3_rxdata_0[1];
        assign o_same_quad_rxpipe3_rxdata[0] = o_same_quad_rxpipe3_rxdata_0[0];
        assign o_same_quad_rxpipe3_rxdatak[3] = o_same_quad_rxpipe3_rxdatak_0[3];
        assign o_same_quad_rxpipe3_rxdatak[2] = o_same_quad_rxpipe3_rxdatak_0[2];
        assign o_same_quad_rxpipe3_rxdatak[1] = o_same_quad_rxpipe3_rxdatak_0[1];
        assign o_same_quad_rxpipe3_rxdatak[0] = o_same_quad_rxpipe3_rxdatak_0[0];
        assign o_same_quad_rxpipe3_rxdatavalid = o_same_quad_rxpipe3_rxdatavalid_0;
        assign o_same_quad_rxpipe3_rxelecidlea = o_same_quad_rxpipe3_rxelecidlea_0;
        assign o_same_quad_rxpipe3_rxstandbystatus = o_same_quad_rxpipe3_rxstandbystatus_0;
        assign o_same_quad_rxpipe3_rxstartblock = o_same_quad_rxpipe3_rxstartblock_0;
        assign o_same_quad_rxpipe3_rxstatus[2] = o_same_quad_rxpipe3_rxstatus_0[2];
        assign o_same_quad_rxpipe3_rxstatus[1] = o_same_quad_rxpipe3_rxstatus_0[1];
        assign o_same_quad_rxpipe3_rxstatus[0] = o_same_quad_rxpipe3_rxstatus_0[0];
        assign o_same_quad_rxpipe3_rxsyncheader[3] = o_same_quad_rxpipe3_rxsyncheader_0[3];
        assign o_same_quad_rxpipe3_rxsyncheader[2] = o_same_quad_rxpipe3_rxsyncheader_0[2];
        assign o_same_quad_rxpipe3_rxsyncheader[1] = o_same_quad_rxpipe3_rxsyncheader_0[1];
        assign o_same_quad_rxpipe3_rxsyncheader[0] = o_same_quad_rxpipe3_rxsyncheader_0[0];
        assign o_same_quad_rxpipe3_rxvalid = o_same_quad_rxpipe3_rxvalid_0;

        assign o_txpipe0_asyncpowerchangeack_0 = o_txpipe0_asyncpowerchangeack;
        assign o_txpipe0_blockaligncontrol_0 = o_txpipe0_blockaligncontrol;
        assign o_txpipe0_cfg_hw_auto_sp_dis_0 = o_txpipe0_cfg_hw_auto_sp_dis;
        assign o_txpipe0_dirchange_0 = o_txpipe0_dirchange;
        assign o_txpipe0_ebuf_mode_0 = o_txpipe0_ebuf_mode;
        assign o_txpipe0_encodedecodebypass_0 = o_txpipe0_encodedecodebypass;
        assign o_txpipe0_fs_0[5] = o_txpipe0_fs[5];
        assign o_txpipe0_fs_0[4] = o_txpipe0_fs[4];
        assign o_txpipe0_fs_0[3] = o_txpipe0_fs[3];
        assign o_txpipe0_fs_0[2] = o_txpipe0_fs[2];
        assign o_txpipe0_fs_0[1] = o_txpipe0_fs[1];
        assign o_txpipe0_fs_0[0] = o_txpipe0_fs[0];
        assign o_txpipe0_getlocalpresetcoefficients_0 = o_txpipe0_getlocalpresetcoefficients;
        assign o_txpipe0_invalidrequest_0 = o_txpipe0_invalidrequest;
        assign o_txpipe0_lf_0[5] = o_txpipe0_lf[5];
        assign o_txpipe0_lf_0[4] = o_txpipe0_lf[4];
        assign o_txpipe0_lf_0[3] = o_txpipe0_lf[3];
        assign o_txpipe0_lf_0[2] = o_txpipe0_lf[2];
        assign o_txpipe0_lf_0[1] = o_txpipe0_lf[1];
        assign o_txpipe0_lf_0[0] = o_txpipe0_lf[0];
        assign o_txpipe0_localpresetindex_0[4] = o_txpipe0_localpresetindex[4];
        assign o_txpipe0_localpresetindex_0[3] = o_txpipe0_localpresetindex[3];
        assign o_txpipe0_localpresetindex_0[2] = o_txpipe0_localpresetindex[2];
        assign o_txpipe0_localpresetindex_0[1] = o_txpipe0_localpresetindex[1];
        assign o_txpipe0_localpresetindex_0[0] = o_txpipe0_localpresetindex[0];
        assign o_txpipe0_lowpin_nt_0 = o_txpipe0_lowpin_nt;
        assign o_txpipe0_m2p_bus_0[7] = o_txpipe0_m2p_bus[7];
        assign o_txpipe0_m2p_bus_0[6] = o_txpipe0_m2p_bus[6];
        assign o_txpipe0_m2p_bus_0[5] = o_txpipe0_m2p_bus[5];
        assign o_txpipe0_m2p_bus_0[4] = o_txpipe0_m2p_bus[4];
        assign o_txpipe0_m2p_bus_0[3] = o_txpipe0_m2p_bus[3];
        assign o_txpipe0_m2p_bus_0[2] = o_txpipe0_m2p_bus[2];
        assign o_txpipe0_m2p_bus_0[1] = o_txpipe0_m2p_bus[1];
        assign o_txpipe0_m2p_bus_0[0] = o_txpipe0_m2p_bus[0];
        assign o_txpipe0_pclk_rate_0[2] = o_txpipe0_pclk_rate[2];
        assign o_txpipe0_pclk_rate_0[1] = o_txpipe0_pclk_rate[1];
        assign o_txpipe0_pclk_rate_0[0] = o_txpipe0_pclk_rate[0];
        assign o_txpipe0_pclkchangeack_0 = o_txpipe0_pclkchangeack;
        assign o_txpipe0_phy_mode_nt_0[3] = o_txpipe0_phy_mode_nt[3];
        assign o_txpipe0_phy_mode_nt_0[2] = o_txpipe0_phy_mode_nt[2];
        assign o_txpipe0_phy_mode_nt_0[1] = o_txpipe0_phy_mode_nt[1];
        assign o_txpipe0_phy_mode_nt_0[0] = o_txpipe0_phy_mode_nt[0];
        assign o_txpipe0_powerdown_0[3] = o_txpipe0_powerdown[3];
        assign o_txpipe0_powerdown_0[2] = o_txpipe0_powerdown[2];
        assign o_txpipe0_powerdown_0[1] = o_txpipe0_powerdown[1];
        assign o_txpipe0_powerdown_0[0] = o_txpipe0_powerdown[0];
        assign o_txpipe0_rate_0[2] = o_txpipe0_rate[2];
        assign o_txpipe0_rate_0[1] = o_txpipe0_rate[1];
        assign o_txpipe0_rate_0[0] = o_txpipe0_rate[0];
        assign o_txpipe0_rxelecidle_disable_a_0 = o_txpipe0_rxelecidle_disable_a;
        assign o_txpipe0_rxeqclr_0 = o_txpipe0_rxeqclr;
        assign o_txpipe0_rxeqeval_0 = o_txpipe0_rxeqeval;
        assign o_txpipe0_rxeqinprogress_0 = o_txpipe0_rxeqinprogress;
        assign o_txpipe0_rxeqtraining_0 = o_txpipe0_rxeqtraining;
        assign o_txpipe0_rxpolarity_0 = o_txpipe0_rxpolarity;
        assign o_txpipe0_rxpresethint_0[2] = o_txpipe0_rxpresethint[2];
        assign o_txpipe0_rxpresethint_0[1] = o_txpipe0_rxpresethint[1];
        assign o_txpipe0_rxpresethint_0[0] = o_txpipe0_rxpresethint[0];
        assign o_txpipe0_rxstandby_0 = o_txpipe0_rxstandby;
        assign o_txpipe0_rxtermination_0 = o_txpipe0_rxtermination;
        assign o_txpipe0_srisenable_0 = o_txpipe0_srisenable;
        assign o_txpipe0_txcmnmode_disable_a_0 = o_txpipe0_txcmnmode_disable_a;
        assign o_txpipe0_txcompliance_0 = o_txpipe0_txcompliance;
        assign o_txpipe0_txdata_0[39] = o_txpipe0_txdata[39];
        assign o_txpipe0_txdata_0[38] = o_txpipe0_txdata[38];
        assign o_txpipe0_txdata_0[37] = o_txpipe0_txdata[37];
        assign o_txpipe0_txdata_0[36] = o_txpipe0_txdata[36];
        assign o_txpipe0_txdata_0[35] = o_txpipe0_txdata[35];
        assign o_txpipe0_txdata_0[34] = o_txpipe0_txdata[34];
        assign o_txpipe0_txdata_0[33] = o_txpipe0_txdata[33];
        assign o_txpipe0_txdata_0[32] = o_txpipe0_txdata[32];
        assign o_txpipe0_txdata_0[31] = o_txpipe0_txdata[31];
        assign o_txpipe0_txdata_0[30] = o_txpipe0_txdata[30];
        assign o_txpipe0_txdata_0[29] = o_txpipe0_txdata[29];
        assign o_txpipe0_txdata_0[28] = o_txpipe0_txdata[28];
        assign o_txpipe0_txdata_0[27] = o_txpipe0_txdata[27];
        assign o_txpipe0_txdata_0[26] = o_txpipe0_txdata[26];
        assign o_txpipe0_txdata_0[25] = o_txpipe0_txdata[25];
        assign o_txpipe0_txdata_0[24] = o_txpipe0_txdata[24];
        assign o_txpipe0_txdata_0[23] = o_txpipe0_txdata[23];
        assign o_txpipe0_txdata_0[22] = o_txpipe0_txdata[22];
        assign o_txpipe0_txdata_0[21] = o_txpipe0_txdata[21];
        assign o_txpipe0_txdata_0[20] = o_txpipe0_txdata[20];
        assign o_txpipe0_txdata_0[19] = o_txpipe0_txdata[19];
        assign o_txpipe0_txdata_0[18] = o_txpipe0_txdata[18];
        assign o_txpipe0_txdata_0[17] = o_txpipe0_txdata[17];
        assign o_txpipe0_txdata_0[16] = o_txpipe0_txdata[16];
        assign o_txpipe0_txdata_0[15] = o_txpipe0_txdata[15];
        assign o_txpipe0_txdata_0[14] = o_txpipe0_txdata[14];
        assign o_txpipe0_txdata_0[13] = o_txpipe0_txdata[13];
        assign o_txpipe0_txdata_0[12] = o_txpipe0_txdata[12];
        assign o_txpipe0_txdata_0[11] = o_txpipe0_txdata[11];
        assign o_txpipe0_txdata_0[10] = o_txpipe0_txdata[10];
        assign o_txpipe0_txdata_0[9] = o_txpipe0_txdata[9];
        assign o_txpipe0_txdata_0[8] = o_txpipe0_txdata[8];
        assign o_txpipe0_txdata_0[7] = o_txpipe0_txdata[7];
        assign o_txpipe0_txdata_0[6] = o_txpipe0_txdata[6];
        assign o_txpipe0_txdata_0[5] = o_txpipe0_txdata[5];
        assign o_txpipe0_txdata_0[4] = o_txpipe0_txdata[4];
        assign o_txpipe0_txdata_0[3] = o_txpipe0_txdata[3];
        assign o_txpipe0_txdata_0[2] = o_txpipe0_txdata[2];
        assign o_txpipe0_txdata_0[1] = o_txpipe0_txdata[1];
        assign o_txpipe0_txdata_0[0] = o_txpipe0_txdata[0];
        assign o_txpipe0_txdatak_0[3] = o_txpipe0_txdatak[3];
        assign o_txpipe0_txdatak_0[2] = o_txpipe0_txdatak[2];
        assign o_txpipe0_txdatak_0[1] = o_txpipe0_txdatak[1];
        assign o_txpipe0_txdatak_0[0] = o_txpipe0_txdatak[0];
        assign o_txpipe0_txdatavalid_0 = o_txpipe0_txdatavalid;
        assign o_txpipe0_txdeemph_0[17] = o_txpipe0_txdeemph[17];
        assign o_txpipe0_txdeemph_0[16] = o_txpipe0_txdeemph[16];
        assign o_txpipe0_txdeemph_0[15] = o_txpipe0_txdeemph[15];
        assign o_txpipe0_txdeemph_0[14] = o_txpipe0_txdeemph[14];
        assign o_txpipe0_txdeemph_0[13] = o_txpipe0_txdeemph[13];
        assign o_txpipe0_txdeemph_0[12] = o_txpipe0_txdeemph[12];
        assign o_txpipe0_txdeemph_0[11] = o_txpipe0_txdeemph[11];
        assign o_txpipe0_txdeemph_0[10] = o_txpipe0_txdeemph[10];
        assign o_txpipe0_txdeemph_0[9] = o_txpipe0_txdeemph[9];
        assign o_txpipe0_txdeemph_0[8] = o_txpipe0_txdeemph[8];
        assign o_txpipe0_txdeemph_0[7] = o_txpipe0_txdeemph[7];
        assign o_txpipe0_txdeemph_0[6] = o_txpipe0_txdeemph[6];
        assign o_txpipe0_txdeemph_0[5] = o_txpipe0_txdeemph[5];
        assign o_txpipe0_txdeemph_0[4] = o_txpipe0_txdeemph[4];
        assign o_txpipe0_txdeemph_0[3] = o_txpipe0_txdeemph[3];
        assign o_txpipe0_txdeemph_0[2] = o_txpipe0_txdeemph[2];
        assign o_txpipe0_txdeemph_0[1] = o_txpipe0_txdeemph[1];
        assign o_txpipe0_txdeemph_0[0] = o_txpipe0_txdeemph[0];
        assign o_txpipe0_txdtctrx_lb_0 = o_txpipe0_txdtctrx_lb;
        assign o_txpipe0_txelecidle_0 = o_txpipe0_txelecidle;
        assign o_txpipe0_txmargin_0[2] = o_txpipe0_txmargin[2];
        assign o_txpipe0_txmargin_0[1] = o_txpipe0_txmargin[1];
        assign o_txpipe0_txmargin_0[0] = o_txpipe0_txmargin[0];
        assign o_txpipe0_txoneszeros_0 = o_txpipe0_txoneszeros;
        assign o_txpipe0_txstartblock_0 = o_txpipe0_txstartblock;
        assign o_txpipe0_txswing_0 = o_txpipe0_txswing;
        assign o_txpipe0_txsyncheader_0[3] = o_txpipe0_txsyncheader[3];
        assign o_txpipe0_txsyncheader_0[2] = o_txpipe0_txsyncheader[2];
        assign o_txpipe0_txsyncheader_0[1] = o_txpipe0_txsyncheader[1];
        assign o_txpipe0_txsyncheader_0[0] = o_txpipe0_txsyncheader[0];
        assign o_txpipe0_width_0[2] = o_txpipe0_width[2];
        assign o_txpipe0_width_0[1] = o_txpipe0_width[1];
        assign o_txpipe0_width_0[0] = o_txpipe0_width[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_asyncpowerchangeack = pcie_pcs_tx_mux_u0__o_txpipe_asyncpowerchangeack_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_blockaligncontrol = pcie_pcs_tx_mux_u0__o_txpipe_blockaligncontrol_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_cfg_hw_auto_sp_dis = pcie_pcs_tx_mux_u0__o_txpipe_cfg_hw_auto_sp_dis_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_dirchange = pcie_pcs_tx_mux_u0__o_txpipe_dirchange_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_ebuf_mode = pcie_pcs_tx_mux_u0__o_txpipe_ebuf_mode_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_encodedecodebypass = pcie_pcs_tx_mux_u0__o_txpipe_encodedecodebypass_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_fs[5] = pcie_pcs_tx_mux_u0__o_txpipe_fs_0[5];
        assign pcie_pcs_tx_mux_u0__o_txpipe_fs[4] = pcie_pcs_tx_mux_u0__o_txpipe_fs_0[4];
        assign pcie_pcs_tx_mux_u0__o_txpipe_fs[3] = pcie_pcs_tx_mux_u0__o_txpipe_fs_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_fs[2] = pcie_pcs_tx_mux_u0__o_txpipe_fs_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_fs[1] = pcie_pcs_tx_mux_u0__o_txpipe_fs_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_fs[0] = pcie_pcs_tx_mux_u0__o_txpipe_fs_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_getlocalpresetcoefficients = pcie_pcs_tx_mux_u0__o_txpipe_getlocalpresetcoefficients_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_invalidrequest = pcie_pcs_tx_mux_u0__o_txpipe_invalidrequest_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_lf[5] = pcie_pcs_tx_mux_u0__o_txpipe_lf_0[5];
        assign pcie_pcs_tx_mux_u0__o_txpipe_lf[4] = pcie_pcs_tx_mux_u0__o_txpipe_lf_0[4];
        assign pcie_pcs_tx_mux_u0__o_txpipe_lf[3] = pcie_pcs_tx_mux_u0__o_txpipe_lf_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_lf[2] = pcie_pcs_tx_mux_u0__o_txpipe_lf_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_lf[1] = pcie_pcs_tx_mux_u0__o_txpipe_lf_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_lf[0] = pcie_pcs_tx_mux_u0__o_txpipe_lf_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex[4] = pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[4];
        assign pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex[3] = pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex[2] = pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex[1] = pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex[0] = pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_lowpin_nt = pcie_pcs_tx_mux_u0__o_txpipe_lowpin_nt_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus[7] = pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[7];
        assign pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus[6] = pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[6];
        assign pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus[5] = pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[5];
        assign pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus[4] = pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[4];
        assign pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus[3] = pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus[2] = pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus[1] = pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus[0] = pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate[2] = pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate[1] = pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate[0] = pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_pclkchangeack = pcie_pcs_tx_mux_u0__o_txpipe_pclkchangeack_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt[3] = pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt[2] = pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt[1] = pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt[0] = pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_powerdown[3] = pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_powerdown[2] = pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_powerdown[1] = pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_powerdown[0] = pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_rate[2] = pcie_pcs_tx_mux_u0__o_txpipe_rate_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_rate[1] = pcie_pcs_tx_mux_u0__o_txpipe_rate_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_rate[0] = pcie_pcs_tx_mux_u0__o_txpipe_rate_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxelecidle_disable_a = pcie_pcs_tx_mux_u0__o_txpipe_rxelecidle_disable_a_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxeqclr = pcie_pcs_tx_mux_u0__o_txpipe_rxeqclr_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxeqeval = pcie_pcs_tx_mux_u0__o_txpipe_rxeqeval_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxeqinprogress = pcie_pcs_tx_mux_u0__o_txpipe_rxeqinprogress_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxeqtraining = pcie_pcs_tx_mux_u0__o_txpipe_rxeqtraining_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxpolarity = pcie_pcs_tx_mux_u0__o_txpipe_rxpolarity_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint[2] = pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint[1] = pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint[0] = pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxstandby = pcie_pcs_tx_mux_u0__o_txpipe_rxstandby_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_rxtermination = pcie_pcs_tx_mux_u0__o_txpipe_rxtermination_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_srisenable = pcie_pcs_tx_mux_u0__o_txpipe_srisenable_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txcmnmode_disable_a = pcie_pcs_tx_mux_u0__o_txpipe_txcmnmode_disable_a_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txcompliance = pcie_pcs_tx_mux_u0__o_txpipe_txcompliance_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[39] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[39];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[38] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[38];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[37] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[37];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[36] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[36];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[35] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[35];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[34] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[34];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[33] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[33];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[32] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[32];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[31] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[31];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[30] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[30];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[29] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[29];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[28] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[28];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[27] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[27];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[26] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[26];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[25] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[25];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[24] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[24];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[23] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[23];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[22] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[22];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[21] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[21];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[20] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[20];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[19] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[19];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[18] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[18];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[17] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[17];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[16] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[16];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[15] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[15];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[14] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[14];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[13] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[13];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[12] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[12];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[11] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[11];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[10] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[10];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[9] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[9];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[8] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[8];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[7] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[7];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[6] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[6];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[5] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[5];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[4] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[4];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[3] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[2] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[1] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdata[0] = pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdatak[3] = pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdatak[2] = pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdatak[1] = pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdatak[0] = pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdatavalid = pcie_pcs_tx_mux_u0__o_txpipe_txdatavalid_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[17] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[17];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[16] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[16];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[15] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[15];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[14] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[14];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[13] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[13];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[12] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[12];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[11] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[11];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[10] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[10];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[9] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[9];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[8] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[8];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[7] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[7];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[6] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[6];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[5] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[5];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[4] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[4];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[3] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[2] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[1] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdeemph[0] = pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txdtctrx_lb = pcie_pcs_tx_mux_u0__o_txpipe_txdtctrx_lb_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txelecidle = pcie_pcs_tx_mux_u0__o_txpipe_txelecidle_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txmargin[2] = pcie_pcs_tx_mux_u0__o_txpipe_txmargin_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txmargin[1] = pcie_pcs_tx_mux_u0__o_txpipe_txmargin_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txmargin[0] = pcie_pcs_tx_mux_u0__o_txpipe_txmargin_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txoneszeros = pcie_pcs_tx_mux_u0__o_txpipe_txoneszeros_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txstartblock = pcie_pcs_tx_mux_u0__o_txpipe_txstartblock_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txswing = pcie_pcs_tx_mux_u0__o_txpipe_txswing_0;
        assign pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader[3] = pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0[3];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader[2] = pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader[1] = pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader[0] = pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0[0];
        assign pcie_pcs_tx_mux_u0__o_txpipe_width[2] = pcie_pcs_tx_mux_u0__o_txpipe_width_0[2];
        assign pcie_pcs_tx_mux_u0__o_txpipe_width[1] = pcie_pcs_tx_mux_u0__o_txpipe_width_0[1];
        assign pcie_pcs_tx_mux_u0__o_txpipe_width[0] = pcie_pcs_tx_mux_u0__o_txpipe_width_0[0];

        assign o_txpipe1_asyncpowerchangeack_0 = o_txpipe1_asyncpowerchangeack;
        assign o_txpipe1_blockaligncontrol_0 = o_txpipe1_blockaligncontrol;
        assign o_txpipe1_cfg_hw_auto_sp_dis_0 = o_txpipe1_cfg_hw_auto_sp_dis;
        assign o_txpipe1_dirchange_0 = o_txpipe1_dirchange;
        assign o_txpipe1_ebuf_mode_0 = o_txpipe1_ebuf_mode;
        assign o_txpipe1_encodedecodebypass_0 = o_txpipe1_encodedecodebypass;
        assign o_txpipe1_fs_0[5] = o_txpipe1_fs[5];
        assign o_txpipe1_fs_0[4] = o_txpipe1_fs[4];
        assign o_txpipe1_fs_0[3] = o_txpipe1_fs[3];
        assign o_txpipe1_fs_0[2] = o_txpipe1_fs[2];
        assign o_txpipe1_fs_0[1] = o_txpipe1_fs[1];
        assign o_txpipe1_fs_0[0] = o_txpipe1_fs[0];
        assign o_txpipe1_getlocalpresetcoefficients_0 = o_txpipe1_getlocalpresetcoefficients;
        assign o_txpipe1_invalidrequest_0 = o_txpipe1_invalidrequest;
        assign o_txpipe1_lf_0[5] = o_txpipe1_lf[5];
        assign o_txpipe1_lf_0[4] = o_txpipe1_lf[4];
        assign o_txpipe1_lf_0[3] = o_txpipe1_lf[3];
        assign o_txpipe1_lf_0[2] = o_txpipe1_lf[2];
        assign o_txpipe1_lf_0[1] = o_txpipe1_lf[1];
        assign o_txpipe1_lf_0[0] = o_txpipe1_lf[0];
        assign o_txpipe1_localpresetindex_0[4] = o_txpipe1_localpresetindex[4];
        assign o_txpipe1_localpresetindex_0[3] = o_txpipe1_localpresetindex[3];
        assign o_txpipe1_localpresetindex_0[2] = o_txpipe1_localpresetindex[2];
        assign o_txpipe1_localpresetindex_0[1] = o_txpipe1_localpresetindex[1];
        assign o_txpipe1_localpresetindex_0[0] = o_txpipe1_localpresetindex[0];
        assign o_txpipe1_lowpin_nt_0 = o_txpipe1_lowpin_nt;
        assign o_txpipe1_m2p_bus_0[7] = o_txpipe1_m2p_bus[7];
        assign o_txpipe1_m2p_bus_0[6] = o_txpipe1_m2p_bus[6];
        assign o_txpipe1_m2p_bus_0[5] = o_txpipe1_m2p_bus[5];
        assign o_txpipe1_m2p_bus_0[4] = o_txpipe1_m2p_bus[4];
        assign o_txpipe1_m2p_bus_0[3] = o_txpipe1_m2p_bus[3];
        assign o_txpipe1_m2p_bus_0[2] = o_txpipe1_m2p_bus[2];
        assign o_txpipe1_m2p_bus_0[1] = o_txpipe1_m2p_bus[1];
        assign o_txpipe1_m2p_bus_0[0] = o_txpipe1_m2p_bus[0];
        assign o_txpipe1_pclk_rate_0[2] = o_txpipe1_pclk_rate[2];
        assign o_txpipe1_pclk_rate_0[1] = o_txpipe1_pclk_rate[1];
        assign o_txpipe1_pclk_rate_0[0] = o_txpipe1_pclk_rate[0];
        assign o_txpipe1_pclkchangeack_0 = o_txpipe1_pclkchangeack;
        assign o_txpipe1_phy_mode_nt_0[3] = o_txpipe1_phy_mode_nt[3];
        assign o_txpipe1_phy_mode_nt_0[2] = o_txpipe1_phy_mode_nt[2];
        assign o_txpipe1_phy_mode_nt_0[1] = o_txpipe1_phy_mode_nt[1];
        assign o_txpipe1_phy_mode_nt_0[0] = o_txpipe1_phy_mode_nt[0];
        assign o_txpipe1_powerdown_0[3] = o_txpipe1_powerdown[3];
        assign o_txpipe1_powerdown_0[2] = o_txpipe1_powerdown[2];
        assign o_txpipe1_powerdown_0[1] = o_txpipe1_powerdown[1];
        assign o_txpipe1_powerdown_0[0] = o_txpipe1_powerdown[0];
        assign o_txpipe1_rate_0[2] = o_txpipe1_rate[2];
        assign o_txpipe1_rate_0[1] = o_txpipe1_rate[1];
        assign o_txpipe1_rate_0[0] = o_txpipe1_rate[0];
        assign o_txpipe1_rxelecidle_disable_a_0 = o_txpipe1_rxelecidle_disable_a;
        assign o_txpipe1_rxeqclr_0 = o_txpipe1_rxeqclr;
        assign o_txpipe1_rxeqeval_0 = o_txpipe1_rxeqeval;
        assign o_txpipe1_rxeqinprogress_0 = o_txpipe1_rxeqinprogress;
        assign o_txpipe1_rxeqtraining_0 = o_txpipe1_rxeqtraining;
        assign o_txpipe1_rxpolarity_0 = o_txpipe1_rxpolarity;
        assign o_txpipe1_rxpresethint_0[2] = o_txpipe1_rxpresethint[2];
        assign o_txpipe1_rxpresethint_0[1] = o_txpipe1_rxpresethint[1];
        assign o_txpipe1_rxpresethint_0[0] = o_txpipe1_rxpresethint[0];
        assign o_txpipe1_rxstandby_0 = o_txpipe1_rxstandby;
        assign o_txpipe1_rxtermination_0 = o_txpipe1_rxtermination;
        assign o_txpipe1_srisenable_0 = o_txpipe1_srisenable;
        assign o_txpipe1_txcmnmode_disable_a_0 = o_txpipe1_txcmnmode_disable_a;
        assign o_txpipe1_txcompliance_0 = o_txpipe1_txcompliance;
        assign o_txpipe1_txdata_0[39] = o_txpipe1_txdata[39];
        assign o_txpipe1_txdata_0[38] = o_txpipe1_txdata[38];
        assign o_txpipe1_txdata_0[37] = o_txpipe1_txdata[37];
        assign o_txpipe1_txdata_0[36] = o_txpipe1_txdata[36];
        assign o_txpipe1_txdata_0[35] = o_txpipe1_txdata[35];
        assign o_txpipe1_txdata_0[34] = o_txpipe1_txdata[34];
        assign o_txpipe1_txdata_0[33] = o_txpipe1_txdata[33];
        assign o_txpipe1_txdata_0[32] = o_txpipe1_txdata[32];
        assign o_txpipe1_txdata_0[31] = o_txpipe1_txdata[31];
        assign o_txpipe1_txdata_0[30] = o_txpipe1_txdata[30];
        assign o_txpipe1_txdata_0[29] = o_txpipe1_txdata[29];
        assign o_txpipe1_txdata_0[28] = o_txpipe1_txdata[28];
        assign o_txpipe1_txdata_0[27] = o_txpipe1_txdata[27];
        assign o_txpipe1_txdata_0[26] = o_txpipe1_txdata[26];
        assign o_txpipe1_txdata_0[25] = o_txpipe1_txdata[25];
        assign o_txpipe1_txdata_0[24] = o_txpipe1_txdata[24];
        assign o_txpipe1_txdata_0[23] = o_txpipe1_txdata[23];
        assign o_txpipe1_txdata_0[22] = o_txpipe1_txdata[22];
        assign o_txpipe1_txdata_0[21] = o_txpipe1_txdata[21];
        assign o_txpipe1_txdata_0[20] = o_txpipe1_txdata[20];
        assign o_txpipe1_txdata_0[19] = o_txpipe1_txdata[19];
        assign o_txpipe1_txdata_0[18] = o_txpipe1_txdata[18];
        assign o_txpipe1_txdata_0[17] = o_txpipe1_txdata[17];
        assign o_txpipe1_txdata_0[16] = o_txpipe1_txdata[16];
        assign o_txpipe1_txdata_0[15] = o_txpipe1_txdata[15];
        assign o_txpipe1_txdata_0[14] = o_txpipe1_txdata[14];
        assign o_txpipe1_txdata_0[13] = o_txpipe1_txdata[13];
        assign o_txpipe1_txdata_0[12] = o_txpipe1_txdata[12];
        assign o_txpipe1_txdata_0[11] = o_txpipe1_txdata[11];
        assign o_txpipe1_txdata_0[10] = o_txpipe1_txdata[10];
        assign o_txpipe1_txdata_0[9] = o_txpipe1_txdata[9];
        assign o_txpipe1_txdata_0[8] = o_txpipe1_txdata[8];
        assign o_txpipe1_txdata_0[7] = o_txpipe1_txdata[7];
        assign o_txpipe1_txdata_0[6] = o_txpipe1_txdata[6];
        assign o_txpipe1_txdata_0[5] = o_txpipe1_txdata[5];
        assign o_txpipe1_txdata_0[4] = o_txpipe1_txdata[4];
        assign o_txpipe1_txdata_0[3] = o_txpipe1_txdata[3];
        assign o_txpipe1_txdata_0[2] = o_txpipe1_txdata[2];
        assign o_txpipe1_txdata_0[1] = o_txpipe1_txdata[1];
        assign o_txpipe1_txdata_0[0] = o_txpipe1_txdata[0];
        assign o_txpipe1_txdatak_0[3] = o_txpipe1_txdatak[3];
        assign o_txpipe1_txdatak_0[2] = o_txpipe1_txdatak[2];
        assign o_txpipe1_txdatak_0[1] = o_txpipe1_txdatak[1];
        assign o_txpipe1_txdatak_0[0] = o_txpipe1_txdatak[0];
        assign o_txpipe1_txdatavalid_0 = o_txpipe1_txdatavalid;
        assign o_txpipe1_txdeemph_0[17] = o_txpipe1_txdeemph[17];
        assign o_txpipe1_txdeemph_0[16] = o_txpipe1_txdeemph[16];
        assign o_txpipe1_txdeemph_0[15] = o_txpipe1_txdeemph[15];
        assign o_txpipe1_txdeemph_0[14] = o_txpipe1_txdeemph[14];
        assign o_txpipe1_txdeemph_0[13] = o_txpipe1_txdeemph[13];
        assign o_txpipe1_txdeemph_0[12] = o_txpipe1_txdeemph[12];
        assign o_txpipe1_txdeemph_0[11] = o_txpipe1_txdeemph[11];
        assign o_txpipe1_txdeemph_0[10] = o_txpipe1_txdeemph[10];
        assign o_txpipe1_txdeemph_0[9] = o_txpipe1_txdeemph[9];
        assign o_txpipe1_txdeemph_0[8] = o_txpipe1_txdeemph[8];
        assign o_txpipe1_txdeemph_0[7] = o_txpipe1_txdeemph[7];
        assign o_txpipe1_txdeemph_0[6] = o_txpipe1_txdeemph[6];
        assign o_txpipe1_txdeemph_0[5] = o_txpipe1_txdeemph[5];
        assign o_txpipe1_txdeemph_0[4] = o_txpipe1_txdeemph[4];
        assign o_txpipe1_txdeemph_0[3] = o_txpipe1_txdeemph[3];
        assign o_txpipe1_txdeemph_0[2] = o_txpipe1_txdeemph[2];
        assign o_txpipe1_txdeemph_0[1] = o_txpipe1_txdeemph[1];
        assign o_txpipe1_txdeemph_0[0] = o_txpipe1_txdeemph[0];
        assign o_txpipe1_txdtctrx_lb_0 = o_txpipe1_txdtctrx_lb;
        assign o_txpipe1_txelecidle_0 = o_txpipe1_txelecidle;
        assign o_txpipe1_txmargin_0[2] = o_txpipe1_txmargin[2];
        assign o_txpipe1_txmargin_0[1] = o_txpipe1_txmargin[1];
        assign o_txpipe1_txmargin_0[0] = o_txpipe1_txmargin[0];
        assign o_txpipe1_txoneszeros_0 = o_txpipe1_txoneszeros;
        assign o_txpipe1_txstartblock_0 = o_txpipe1_txstartblock;
        assign o_txpipe1_txswing_0 = o_txpipe1_txswing;
        assign o_txpipe1_txsyncheader_0[3] = o_txpipe1_txsyncheader[3];
        assign o_txpipe1_txsyncheader_0[2] = o_txpipe1_txsyncheader[2];
        assign o_txpipe1_txsyncheader_0[1] = o_txpipe1_txsyncheader[1];
        assign o_txpipe1_txsyncheader_0[0] = o_txpipe1_txsyncheader[0];
        assign o_txpipe1_width_0[2] = o_txpipe1_width[2];
        assign o_txpipe1_width_0[1] = o_txpipe1_width[1];
        assign o_txpipe1_width_0[0] = o_txpipe1_width[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_asyncpowerchangeack = pcie_pcs_tx_mux_u1__o_txpipe_asyncpowerchangeack_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_blockaligncontrol = pcie_pcs_tx_mux_u1__o_txpipe_blockaligncontrol_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_cfg_hw_auto_sp_dis = pcie_pcs_tx_mux_u1__o_txpipe_cfg_hw_auto_sp_dis_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_dirchange = pcie_pcs_tx_mux_u1__o_txpipe_dirchange_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_ebuf_mode = pcie_pcs_tx_mux_u1__o_txpipe_ebuf_mode_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_encodedecodebypass = pcie_pcs_tx_mux_u1__o_txpipe_encodedecodebypass_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_fs[5] = pcie_pcs_tx_mux_u1__o_txpipe_fs_0[5];
        assign pcie_pcs_tx_mux_u1__o_txpipe_fs[4] = pcie_pcs_tx_mux_u1__o_txpipe_fs_0[4];
        assign pcie_pcs_tx_mux_u1__o_txpipe_fs[3] = pcie_pcs_tx_mux_u1__o_txpipe_fs_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_fs[2] = pcie_pcs_tx_mux_u1__o_txpipe_fs_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_fs[1] = pcie_pcs_tx_mux_u1__o_txpipe_fs_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_fs[0] = pcie_pcs_tx_mux_u1__o_txpipe_fs_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_getlocalpresetcoefficients = pcie_pcs_tx_mux_u1__o_txpipe_getlocalpresetcoefficients_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_invalidrequest = pcie_pcs_tx_mux_u1__o_txpipe_invalidrequest_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_lf[5] = pcie_pcs_tx_mux_u1__o_txpipe_lf_0[5];
        assign pcie_pcs_tx_mux_u1__o_txpipe_lf[4] = pcie_pcs_tx_mux_u1__o_txpipe_lf_0[4];
        assign pcie_pcs_tx_mux_u1__o_txpipe_lf[3] = pcie_pcs_tx_mux_u1__o_txpipe_lf_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_lf[2] = pcie_pcs_tx_mux_u1__o_txpipe_lf_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_lf[1] = pcie_pcs_tx_mux_u1__o_txpipe_lf_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_lf[0] = pcie_pcs_tx_mux_u1__o_txpipe_lf_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex[4] = pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[4];
        assign pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex[3] = pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex[2] = pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex[1] = pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex[0] = pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_lowpin_nt = pcie_pcs_tx_mux_u1__o_txpipe_lowpin_nt_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus[7] = pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[7];
        assign pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus[6] = pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[6];
        assign pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus[5] = pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[5];
        assign pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus[4] = pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[4];
        assign pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus[3] = pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus[2] = pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus[1] = pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus[0] = pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate[2] = pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate[1] = pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate[0] = pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_pclkchangeack = pcie_pcs_tx_mux_u1__o_txpipe_pclkchangeack_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt[3] = pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt[2] = pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt[1] = pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt[0] = pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_powerdown[3] = pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_powerdown[2] = pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_powerdown[1] = pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_powerdown[0] = pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_rate[2] = pcie_pcs_tx_mux_u1__o_txpipe_rate_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_rate[1] = pcie_pcs_tx_mux_u1__o_txpipe_rate_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_rate[0] = pcie_pcs_tx_mux_u1__o_txpipe_rate_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxelecidle_disable_a = pcie_pcs_tx_mux_u1__o_txpipe_rxelecidle_disable_a_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxeqclr = pcie_pcs_tx_mux_u1__o_txpipe_rxeqclr_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxeqeval = pcie_pcs_tx_mux_u1__o_txpipe_rxeqeval_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxeqinprogress = pcie_pcs_tx_mux_u1__o_txpipe_rxeqinprogress_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxeqtraining = pcie_pcs_tx_mux_u1__o_txpipe_rxeqtraining_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxpolarity = pcie_pcs_tx_mux_u1__o_txpipe_rxpolarity_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint[2] = pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint[1] = pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint[0] = pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxstandby = pcie_pcs_tx_mux_u1__o_txpipe_rxstandby_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_rxtermination = pcie_pcs_tx_mux_u1__o_txpipe_rxtermination_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_srisenable = pcie_pcs_tx_mux_u1__o_txpipe_srisenable_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txcmnmode_disable_a = pcie_pcs_tx_mux_u1__o_txpipe_txcmnmode_disable_a_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txcompliance = pcie_pcs_tx_mux_u1__o_txpipe_txcompliance_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[39] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[39];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[38] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[38];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[37] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[37];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[36] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[36];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[35] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[35];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[34] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[34];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[33] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[33];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[32] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[32];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[31] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[31];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[30] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[30];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[29] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[29];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[28] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[28];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[27] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[27];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[26] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[26];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[25] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[25];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[24] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[24];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[23] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[23];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[22] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[22];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[21] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[21];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[20] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[20];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[19] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[19];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[18] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[18];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[17] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[17];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[16] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[16];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[15] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[15];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[14] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[14];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[13] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[13];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[12] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[12];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[11] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[11];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[10] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[10];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[9] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[9];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[8] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[8];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[7] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[7];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[6] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[6];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[5] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[5];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[4] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[4];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[3] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[2] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[1] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdata[0] = pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdatak[3] = pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdatak[2] = pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdatak[1] = pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdatak[0] = pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdatavalid = pcie_pcs_tx_mux_u1__o_txpipe_txdatavalid_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[17] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[17];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[16] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[16];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[15] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[15];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[14] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[14];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[13] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[13];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[12] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[12];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[11] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[11];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[10] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[10];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[9] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[9];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[8] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[8];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[7] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[7];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[6] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[6];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[5] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[5];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[4] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[4];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[3] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[2] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[1] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdeemph[0] = pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txdtctrx_lb = pcie_pcs_tx_mux_u1__o_txpipe_txdtctrx_lb_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txelecidle = pcie_pcs_tx_mux_u1__o_txpipe_txelecidle_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txmargin[2] = pcie_pcs_tx_mux_u1__o_txpipe_txmargin_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txmargin[1] = pcie_pcs_tx_mux_u1__o_txpipe_txmargin_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txmargin[0] = pcie_pcs_tx_mux_u1__o_txpipe_txmargin_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txoneszeros = pcie_pcs_tx_mux_u1__o_txpipe_txoneszeros_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txstartblock = pcie_pcs_tx_mux_u1__o_txpipe_txstartblock_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txswing = pcie_pcs_tx_mux_u1__o_txpipe_txswing_0;
        assign pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader[3] = pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0[3];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader[2] = pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader[1] = pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader[0] = pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0[0];
        assign pcie_pcs_tx_mux_u1__o_txpipe_width[2] = pcie_pcs_tx_mux_u1__o_txpipe_width_0[2];
        assign pcie_pcs_tx_mux_u1__o_txpipe_width[1] = pcie_pcs_tx_mux_u1__o_txpipe_width_0[1];
        assign pcie_pcs_tx_mux_u1__o_txpipe_width[0] = pcie_pcs_tx_mux_u1__o_txpipe_width_0[0];

        assign o_txpipe2_asyncpowerchangeack_0 = o_txpipe2_asyncpowerchangeack;
        assign o_txpipe2_blockaligncontrol_0 = o_txpipe2_blockaligncontrol;
        assign o_txpipe2_cfg_hw_auto_sp_dis_0 = o_txpipe2_cfg_hw_auto_sp_dis;
        assign o_txpipe2_dirchange_0 = o_txpipe2_dirchange;
        assign o_txpipe2_ebuf_mode_0 = o_txpipe2_ebuf_mode;
        assign o_txpipe2_encodedecodebypass_0 = o_txpipe2_encodedecodebypass;
        assign o_txpipe2_fs_0[5] = o_txpipe2_fs[5];
        assign o_txpipe2_fs_0[4] = o_txpipe2_fs[4];
        assign o_txpipe2_fs_0[3] = o_txpipe2_fs[3];
        assign o_txpipe2_fs_0[2] = o_txpipe2_fs[2];
        assign o_txpipe2_fs_0[1] = o_txpipe2_fs[1];
        assign o_txpipe2_fs_0[0] = o_txpipe2_fs[0];
        assign o_txpipe2_getlocalpresetcoefficients_0 = o_txpipe2_getlocalpresetcoefficients;
        assign o_txpipe2_invalidrequest_0 = o_txpipe2_invalidrequest;
        assign o_txpipe2_lf_0[5] = o_txpipe2_lf[5];
        assign o_txpipe2_lf_0[4] = o_txpipe2_lf[4];
        assign o_txpipe2_lf_0[3] = o_txpipe2_lf[3];
        assign o_txpipe2_lf_0[2] = o_txpipe2_lf[2];
        assign o_txpipe2_lf_0[1] = o_txpipe2_lf[1];
        assign o_txpipe2_lf_0[0] = o_txpipe2_lf[0];
        assign o_txpipe2_localpresetindex_0[4] = o_txpipe2_localpresetindex[4];
        assign o_txpipe2_localpresetindex_0[3] = o_txpipe2_localpresetindex[3];
        assign o_txpipe2_localpresetindex_0[2] = o_txpipe2_localpresetindex[2];
        assign o_txpipe2_localpresetindex_0[1] = o_txpipe2_localpresetindex[1];
        assign o_txpipe2_localpresetindex_0[0] = o_txpipe2_localpresetindex[0];
        assign o_txpipe2_lowpin_nt_0 = o_txpipe2_lowpin_nt;
        assign o_txpipe2_m2p_bus_0[7] = o_txpipe2_m2p_bus[7];
        assign o_txpipe2_m2p_bus_0[6] = o_txpipe2_m2p_bus[6];
        assign o_txpipe2_m2p_bus_0[5] = o_txpipe2_m2p_bus[5];
        assign o_txpipe2_m2p_bus_0[4] = o_txpipe2_m2p_bus[4];
        assign o_txpipe2_m2p_bus_0[3] = o_txpipe2_m2p_bus[3];
        assign o_txpipe2_m2p_bus_0[2] = o_txpipe2_m2p_bus[2];
        assign o_txpipe2_m2p_bus_0[1] = o_txpipe2_m2p_bus[1];
        assign o_txpipe2_m2p_bus_0[0] = o_txpipe2_m2p_bus[0];
        assign o_txpipe2_pclk_rate_0[2] = o_txpipe2_pclk_rate[2];
        assign o_txpipe2_pclk_rate_0[1] = o_txpipe2_pclk_rate[1];
        assign o_txpipe2_pclk_rate_0[0] = o_txpipe2_pclk_rate[0];
        assign o_txpipe2_pclkchangeack_0 = o_txpipe2_pclkchangeack;
        assign o_txpipe2_phy_mode_nt_0[3] = o_txpipe2_phy_mode_nt[3];
        assign o_txpipe2_phy_mode_nt_0[2] = o_txpipe2_phy_mode_nt[2];
        assign o_txpipe2_phy_mode_nt_0[1] = o_txpipe2_phy_mode_nt[1];
        assign o_txpipe2_phy_mode_nt_0[0] = o_txpipe2_phy_mode_nt[0];
        assign o_txpipe2_powerdown_0[3] = o_txpipe2_powerdown[3];
        assign o_txpipe2_powerdown_0[2] = o_txpipe2_powerdown[2];
        assign o_txpipe2_powerdown_0[1] = o_txpipe2_powerdown[1];
        assign o_txpipe2_powerdown_0[0] = o_txpipe2_powerdown[0];
        assign o_txpipe2_rate_0[2] = o_txpipe2_rate[2];
        assign o_txpipe2_rate_0[1] = o_txpipe2_rate[1];
        assign o_txpipe2_rate_0[0] = o_txpipe2_rate[0];
        assign o_txpipe2_rxelecidle_disable_a_0 = o_txpipe2_rxelecidle_disable_a;
        assign o_txpipe2_rxeqclr_0 = o_txpipe2_rxeqclr;
        assign o_txpipe2_rxeqeval_0 = o_txpipe2_rxeqeval;
        assign o_txpipe2_rxeqinprogress_0 = o_txpipe2_rxeqinprogress;
        assign o_txpipe2_rxeqtraining_0 = o_txpipe2_rxeqtraining;
        assign o_txpipe2_rxpolarity_0 = o_txpipe2_rxpolarity;
        assign o_txpipe2_rxpresethint_0[2] = o_txpipe2_rxpresethint[2];
        assign o_txpipe2_rxpresethint_0[1] = o_txpipe2_rxpresethint[1];
        assign o_txpipe2_rxpresethint_0[0] = o_txpipe2_rxpresethint[0];
        assign o_txpipe2_rxstandby_0 = o_txpipe2_rxstandby;
        assign o_txpipe2_rxtermination_0 = o_txpipe2_rxtermination;
        assign o_txpipe2_srisenable_0 = o_txpipe2_srisenable;
        assign o_txpipe2_txcmnmode_disable_a_0 = o_txpipe2_txcmnmode_disable_a;
        assign o_txpipe2_txcompliance_0 = o_txpipe2_txcompliance;
        assign o_txpipe2_txdata_0[39] = o_txpipe2_txdata[39];
        assign o_txpipe2_txdata_0[38] = o_txpipe2_txdata[38];
        assign o_txpipe2_txdata_0[37] = o_txpipe2_txdata[37];
        assign o_txpipe2_txdata_0[36] = o_txpipe2_txdata[36];
        assign o_txpipe2_txdata_0[35] = o_txpipe2_txdata[35];
        assign o_txpipe2_txdata_0[34] = o_txpipe2_txdata[34];
        assign o_txpipe2_txdata_0[33] = o_txpipe2_txdata[33];
        assign o_txpipe2_txdata_0[32] = o_txpipe2_txdata[32];
        assign o_txpipe2_txdata_0[31] = o_txpipe2_txdata[31];
        assign o_txpipe2_txdata_0[30] = o_txpipe2_txdata[30];
        assign o_txpipe2_txdata_0[29] = o_txpipe2_txdata[29];
        assign o_txpipe2_txdata_0[28] = o_txpipe2_txdata[28];
        assign o_txpipe2_txdata_0[27] = o_txpipe2_txdata[27];
        assign o_txpipe2_txdata_0[26] = o_txpipe2_txdata[26];
        assign o_txpipe2_txdata_0[25] = o_txpipe2_txdata[25];
        assign o_txpipe2_txdata_0[24] = o_txpipe2_txdata[24];
        assign o_txpipe2_txdata_0[23] = o_txpipe2_txdata[23];
        assign o_txpipe2_txdata_0[22] = o_txpipe2_txdata[22];
        assign o_txpipe2_txdata_0[21] = o_txpipe2_txdata[21];
        assign o_txpipe2_txdata_0[20] = o_txpipe2_txdata[20];
        assign o_txpipe2_txdata_0[19] = o_txpipe2_txdata[19];
        assign o_txpipe2_txdata_0[18] = o_txpipe2_txdata[18];
        assign o_txpipe2_txdata_0[17] = o_txpipe2_txdata[17];
        assign o_txpipe2_txdata_0[16] = o_txpipe2_txdata[16];
        assign o_txpipe2_txdata_0[15] = o_txpipe2_txdata[15];
        assign o_txpipe2_txdata_0[14] = o_txpipe2_txdata[14];
        assign o_txpipe2_txdata_0[13] = o_txpipe2_txdata[13];
        assign o_txpipe2_txdata_0[12] = o_txpipe2_txdata[12];
        assign o_txpipe2_txdata_0[11] = o_txpipe2_txdata[11];
        assign o_txpipe2_txdata_0[10] = o_txpipe2_txdata[10];
        assign o_txpipe2_txdata_0[9] = o_txpipe2_txdata[9];
        assign o_txpipe2_txdata_0[8] = o_txpipe2_txdata[8];
        assign o_txpipe2_txdata_0[7] = o_txpipe2_txdata[7];
        assign o_txpipe2_txdata_0[6] = o_txpipe2_txdata[6];
        assign o_txpipe2_txdata_0[5] = o_txpipe2_txdata[5];
        assign o_txpipe2_txdata_0[4] = o_txpipe2_txdata[4];
        assign o_txpipe2_txdata_0[3] = o_txpipe2_txdata[3];
        assign o_txpipe2_txdata_0[2] = o_txpipe2_txdata[2];
        assign o_txpipe2_txdata_0[1] = o_txpipe2_txdata[1];
        assign o_txpipe2_txdata_0[0] = o_txpipe2_txdata[0];
        assign o_txpipe2_txdatak_0[3] = o_txpipe2_txdatak[3];
        assign o_txpipe2_txdatak_0[2] = o_txpipe2_txdatak[2];
        assign o_txpipe2_txdatak_0[1] = o_txpipe2_txdatak[1];
        assign o_txpipe2_txdatak_0[0] = o_txpipe2_txdatak[0];
        assign o_txpipe2_txdatavalid_0 = o_txpipe2_txdatavalid;
        assign o_txpipe2_txdeemph_0[17] = o_txpipe2_txdeemph[17];
        assign o_txpipe2_txdeemph_0[16] = o_txpipe2_txdeemph[16];
        assign o_txpipe2_txdeemph_0[15] = o_txpipe2_txdeemph[15];
        assign o_txpipe2_txdeemph_0[14] = o_txpipe2_txdeemph[14];
        assign o_txpipe2_txdeemph_0[13] = o_txpipe2_txdeemph[13];
        assign o_txpipe2_txdeemph_0[12] = o_txpipe2_txdeemph[12];
        assign o_txpipe2_txdeemph_0[11] = o_txpipe2_txdeemph[11];
        assign o_txpipe2_txdeemph_0[10] = o_txpipe2_txdeemph[10];
        assign o_txpipe2_txdeemph_0[9] = o_txpipe2_txdeemph[9];
        assign o_txpipe2_txdeemph_0[8] = o_txpipe2_txdeemph[8];
        assign o_txpipe2_txdeemph_0[7] = o_txpipe2_txdeemph[7];
        assign o_txpipe2_txdeemph_0[6] = o_txpipe2_txdeemph[6];
        assign o_txpipe2_txdeemph_0[5] = o_txpipe2_txdeemph[5];
        assign o_txpipe2_txdeemph_0[4] = o_txpipe2_txdeemph[4];
        assign o_txpipe2_txdeemph_0[3] = o_txpipe2_txdeemph[3];
        assign o_txpipe2_txdeemph_0[2] = o_txpipe2_txdeemph[2];
        assign o_txpipe2_txdeemph_0[1] = o_txpipe2_txdeemph[1];
        assign o_txpipe2_txdeemph_0[0] = o_txpipe2_txdeemph[0];
        assign o_txpipe2_txdtctrx_lb_0 = o_txpipe2_txdtctrx_lb;
        assign o_txpipe2_txelecidle_0 = o_txpipe2_txelecidle;
        assign o_txpipe2_txmargin_0[2] = o_txpipe2_txmargin[2];
        assign o_txpipe2_txmargin_0[1] = o_txpipe2_txmargin[1];
        assign o_txpipe2_txmargin_0[0] = o_txpipe2_txmargin[0];
        assign o_txpipe2_txoneszeros_0 = o_txpipe2_txoneszeros;
        assign o_txpipe2_txstartblock_0 = o_txpipe2_txstartblock;
        assign o_txpipe2_txswing_0 = o_txpipe2_txswing;
        assign o_txpipe2_txsyncheader_0[3] = o_txpipe2_txsyncheader[3];
        assign o_txpipe2_txsyncheader_0[2] = o_txpipe2_txsyncheader[2];
        assign o_txpipe2_txsyncheader_0[1] = o_txpipe2_txsyncheader[1];
        assign o_txpipe2_txsyncheader_0[0] = o_txpipe2_txsyncheader[0];
        assign o_txpipe2_width_0[2] = o_txpipe2_width[2];
        assign o_txpipe2_width_0[1] = o_txpipe2_width[1];
        assign o_txpipe2_width_0[0] = o_txpipe2_width[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_asyncpowerchangeack = pcie_pcs_tx_mux_u2__o_txpipe_asyncpowerchangeack_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_blockaligncontrol = pcie_pcs_tx_mux_u2__o_txpipe_blockaligncontrol_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_cfg_hw_auto_sp_dis = pcie_pcs_tx_mux_u2__o_txpipe_cfg_hw_auto_sp_dis_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_dirchange = pcie_pcs_tx_mux_u2__o_txpipe_dirchange_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_ebuf_mode = pcie_pcs_tx_mux_u2__o_txpipe_ebuf_mode_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_encodedecodebypass = pcie_pcs_tx_mux_u2__o_txpipe_encodedecodebypass_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_fs[5] = pcie_pcs_tx_mux_u2__o_txpipe_fs_0[5];
        assign pcie_pcs_tx_mux_u2__o_txpipe_fs[4] = pcie_pcs_tx_mux_u2__o_txpipe_fs_0[4];
        assign pcie_pcs_tx_mux_u2__o_txpipe_fs[3] = pcie_pcs_tx_mux_u2__o_txpipe_fs_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_fs[2] = pcie_pcs_tx_mux_u2__o_txpipe_fs_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_fs[1] = pcie_pcs_tx_mux_u2__o_txpipe_fs_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_fs[0] = pcie_pcs_tx_mux_u2__o_txpipe_fs_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_getlocalpresetcoefficients = pcie_pcs_tx_mux_u2__o_txpipe_getlocalpresetcoefficients_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_invalidrequest = pcie_pcs_tx_mux_u2__o_txpipe_invalidrequest_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_lf[5] = pcie_pcs_tx_mux_u2__o_txpipe_lf_0[5];
        assign pcie_pcs_tx_mux_u2__o_txpipe_lf[4] = pcie_pcs_tx_mux_u2__o_txpipe_lf_0[4];
        assign pcie_pcs_tx_mux_u2__o_txpipe_lf[3] = pcie_pcs_tx_mux_u2__o_txpipe_lf_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_lf[2] = pcie_pcs_tx_mux_u2__o_txpipe_lf_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_lf[1] = pcie_pcs_tx_mux_u2__o_txpipe_lf_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_lf[0] = pcie_pcs_tx_mux_u2__o_txpipe_lf_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex[4] = pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[4];
        assign pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex[3] = pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex[2] = pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex[1] = pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex[0] = pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_lowpin_nt = pcie_pcs_tx_mux_u2__o_txpipe_lowpin_nt_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus[7] = pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[7];
        assign pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus[6] = pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[6];
        assign pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus[5] = pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[5];
        assign pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus[4] = pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[4];
        assign pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus[3] = pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus[2] = pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus[1] = pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus[0] = pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate[2] = pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate[1] = pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate[0] = pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_pclkchangeack = pcie_pcs_tx_mux_u2__o_txpipe_pclkchangeack_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt[3] = pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt[2] = pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt[1] = pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt[0] = pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_powerdown[3] = pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_powerdown[2] = pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_powerdown[1] = pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_powerdown[0] = pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_rate[2] = pcie_pcs_tx_mux_u2__o_txpipe_rate_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_rate[1] = pcie_pcs_tx_mux_u2__o_txpipe_rate_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_rate[0] = pcie_pcs_tx_mux_u2__o_txpipe_rate_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxelecidle_disable_a = pcie_pcs_tx_mux_u2__o_txpipe_rxelecidle_disable_a_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxeqclr = pcie_pcs_tx_mux_u2__o_txpipe_rxeqclr_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxeqeval = pcie_pcs_tx_mux_u2__o_txpipe_rxeqeval_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxeqinprogress = pcie_pcs_tx_mux_u2__o_txpipe_rxeqinprogress_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxeqtraining = pcie_pcs_tx_mux_u2__o_txpipe_rxeqtraining_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxpolarity = pcie_pcs_tx_mux_u2__o_txpipe_rxpolarity_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint[2] = pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint[1] = pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint[0] = pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxstandby = pcie_pcs_tx_mux_u2__o_txpipe_rxstandby_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_rxtermination = pcie_pcs_tx_mux_u2__o_txpipe_rxtermination_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_srisenable = pcie_pcs_tx_mux_u2__o_txpipe_srisenable_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txcmnmode_disable_a = pcie_pcs_tx_mux_u2__o_txpipe_txcmnmode_disable_a_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txcompliance = pcie_pcs_tx_mux_u2__o_txpipe_txcompliance_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[39] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[39];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[38] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[38];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[37] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[37];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[36] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[36];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[35] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[35];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[34] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[34];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[33] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[33];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[32] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[32];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[31] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[31];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[30] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[30];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[29] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[29];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[28] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[28];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[27] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[27];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[26] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[26];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[25] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[25];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[24] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[24];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[23] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[23];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[22] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[22];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[21] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[21];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[20] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[20];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[19] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[19];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[18] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[18];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[17] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[17];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[16] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[16];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[15] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[15];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[14] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[14];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[13] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[13];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[12] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[12];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[11] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[11];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[10] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[10];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[9] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[9];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[8] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[8];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[7] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[7];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[6] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[6];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[5] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[5];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[4] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[4];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[3] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[2] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[1] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdata[0] = pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdatak[3] = pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdatak[2] = pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdatak[1] = pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdatak[0] = pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdatavalid = pcie_pcs_tx_mux_u2__o_txpipe_txdatavalid_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[17] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[17];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[16] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[16];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[15] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[15];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[14] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[14];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[13] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[13];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[12] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[12];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[11] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[11];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[10] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[10];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[9] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[9];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[8] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[8];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[7] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[7];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[6] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[6];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[5] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[5];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[4] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[4];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[3] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[2] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[1] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdeemph[0] = pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txdtctrx_lb = pcie_pcs_tx_mux_u2__o_txpipe_txdtctrx_lb_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txelecidle = pcie_pcs_tx_mux_u2__o_txpipe_txelecidle_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txmargin[2] = pcie_pcs_tx_mux_u2__o_txpipe_txmargin_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txmargin[1] = pcie_pcs_tx_mux_u2__o_txpipe_txmargin_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txmargin[0] = pcie_pcs_tx_mux_u2__o_txpipe_txmargin_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txoneszeros = pcie_pcs_tx_mux_u2__o_txpipe_txoneszeros_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txstartblock = pcie_pcs_tx_mux_u2__o_txpipe_txstartblock_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txswing = pcie_pcs_tx_mux_u2__o_txpipe_txswing_0;
        assign pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader[3] = pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0[3];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader[2] = pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader[1] = pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader[0] = pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0[0];
        assign pcie_pcs_tx_mux_u2__o_txpipe_width[2] = pcie_pcs_tx_mux_u2__o_txpipe_width_0[2];
        assign pcie_pcs_tx_mux_u2__o_txpipe_width[1] = pcie_pcs_tx_mux_u2__o_txpipe_width_0[1];
        assign pcie_pcs_tx_mux_u2__o_txpipe_width[0] = pcie_pcs_tx_mux_u2__o_txpipe_width_0[0];

        assign o_txpipe3_asyncpowerchangeack_0 = o_txpipe3_asyncpowerchangeack;
        assign o_txpipe3_blockaligncontrol_0 = o_txpipe3_blockaligncontrol;
        assign o_txpipe3_cfg_hw_auto_sp_dis_0 = o_txpipe3_cfg_hw_auto_sp_dis;
        assign o_txpipe3_dirchange_0 = o_txpipe3_dirchange;
        assign o_txpipe3_ebuf_mode_0 = o_txpipe3_ebuf_mode;
        assign o_txpipe3_encodedecodebypass_0 = o_txpipe3_encodedecodebypass;
        assign o_txpipe3_fs_0[5] = o_txpipe3_fs[5];
        assign o_txpipe3_fs_0[4] = o_txpipe3_fs[4];
        assign o_txpipe3_fs_0[3] = o_txpipe3_fs[3];
        assign o_txpipe3_fs_0[2] = o_txpipe3_fs[2];
        assign o_txpipe3_fs_0[1] = o_txpipe3_fs[1];
        assign o_txpipe3_fs_0[0] = o_txpipe3_fs[0];
        assign o_txpipe3_getlocalpresetcoefficients_0 = o_txpipe3_getlocalpresetcoefficients;
        assign o_txpipe3_invalidrequest_0 = o_txpipe3_invalidrequest;
        assign o_txpipe3_lf_0[5] = o_txpipe3_lf[5];
        assign o_txpipe3_lf_0[4] = o_txpipe3_lf[4];
        assign o_txpipe3_lf_0[3] = o_txpipe3_lf[3];
        assign o_txpipe3_lf_0[2] = o_txpipe3_lf[2];
        assign o_txpipe3_lf_0[1] = o_txpipe3_lf[1];
        assign o_txpipe3_lf_0[0] = o_txpipe3_lf[0];
        assign o_txpipe3_localpresetindex_0[4] = o_txpipe3_localpresetindex[4];
        assign o_txpipe3_localpresetindex_0[3] = o_txpipe3_localpresetindex[3];
        assign o_txpipe3_localpresetindex_0[2] = o_txpipe3_localpresetindex[2];
        assign o_txpipe3_localpresetindex_0[1] = o_txpipe3_localpresetindex[1];
        assign o_txpipe3_localpresetindex_0[0] = o_txpipe3_localpresetindex[0];
        assign o_txpipe3_lowpin_nt_0 = o_txpipe3_lowpin_nt;
        assign o_txpipe3_m2p_bus_0[7] = o_txpipe3_m2p_bus[7];
        assign o_txpipe3_m2p_bus_0[6] = o_txpipe3_m2p_bus[6];
        assign o_txpipe3_m2p_bus_0[5] = o_txpipe3_m2p_bus[5];
        assign o_txpipe3_m2p_bus_0[4] = o_txpipe3_m2p_bus[4];
        assign o_txpipe3_m2p_bus_0[3] = o_txpipe3_m2p_bus[3];
        assign o_txpipe3_m2p_bus_0[2] = o_txpipe3_m2p_bus[2];
        assign o_txpipe3_m2p_bus_0[1] = o_txpipe3_m2p_bus[1];
        assign o_txpipe3_m2p_bus_0[0] = o_txpipe3_m2p_bus[0];
        assign o_txpipe3_pclk_rate_0[2] = o_txpipe3_pclk_rate[2];
        assign o_txpipe3_pclk_rate_0[1] = o_txpipe3_pclk_rate[1];
        assign o_txpipe3_pclk_rate_0[0] = o_txpipe3_pclk_rate[0];
        assign o_txpipe3_pclkchangeack_0 = o_txpipe3_pclkchangeack;
        assign o_txpipe3_phy_mode_nt_0[3] = o_txpipe3_phy_mode_nt[3];
        assign o_txpipe3_phy_mode_nt_0[2] = o_txpipe3_phy_mode_nt[2];
        assign o_txpipe3_phy_mode_nt_0[1] = o_txpipe3_phy_mode_nt[1];
        assign o_txpipe3_phy_mode_nt_0[0] = o_txpipe3_phy_mode_nt[0];
        assign o_txpipe3_powerdown_0[3] = o_txpipe3_powerdown[3];
        assign o_txpipe3_powerdown_0[2] = o_txpipe3_powerdown[2];
        assign o_txpipe3_powerdown_0[1] = o_txpipe3_powerdown[1];
        assign o_txpipe3_powerdown_0[0] = o_txpipe3_powerdown[0];
        assign o_txpipe3_rate_0[2] = o_txpipe3_rate[2];
        assign o_txpipe3_rate_0[1] = o_txpipe3_rate[1];
        assign o_txpipe3_rate_0[0] = o_txpipe3_rate[0];
        assign o_txpipe3_rxelecidle_disable_a_0 = o_txpipe3_rxelecidle_disable_a;
        assign o_txpipe3_rxeqclr_0 = o_txpipe3_rxeqclr;
        assign o_txpipe3_rxeqeval_0 = o_txpipe3_rxeqeval;
        assign o_txpipe3_rxeqinprogress_0 = o_txpipe3_rxeqinprogress;
        assign o_txpipe3_rxeqtraining_0 = o_txpipe3_rxeqtraining;
        assign o_txpipe3_rxpolarity_0 = o_txpipe3_rxpolarity;
        assign o_txpipe3_rxpresethint_0[2] = o_txpipe3_rxpresethint[2];
        assign o_txpipe3_rxpresethint_0[1] = o_txpipe3_rxpresethint[1];
        assign o_txpipe3_rxpresethint_0[0] = o_txpipe3_rxpresethint[0];
        assign o_txpipe3_rxstandby_0 = o_txpipe3_rxstandby;
        assign o_txpipe3_rxtermination_0 = o_txpipe3_rxtermination;
        assign o_txpipe3_srisenable_0 = o_txpipe3_srisenable;
        assign o_txpipe3_txcmnmode_disable_a_0 = o_txpipe3_txcmnmode_disable_a;
        assign o_txpipe3_txcompliance_0 = o_txpipe3_txcompliance;
        assign o_txpipe3_txdata_0[39] = o_txpipe3_txdata[39];
        assign o_txpipe3_txdata_0[38] = o_txpipe3_txdata[38];
        assign o_txpipe3_txdata_0[37] = o_txpipe3_txdata[37];
        assign o_txpipe3_txdata_0[36] = o_txpipe3_txdata[36];
        assign o_txpipe3_txdata_0[35] = o_txpipe3_txdata[35];
        assign o_txpipe3_txdata_0[34] = o_txpipe3_txdata[34];
        assign o_txpipe3_txdata_0[33] = o_txpipe3_txdata[33];
        assign o_txpipe3_txdata_0[32] = o_txpipe3_txdata[32];
        assign o_txpipe3_txdata_0[31] = o_txpipe3_txdata[31];
        assign o_txpipe3_txdata_0[30] = o_txpipe3_txdata[30];
        assign o_txpipe3_txdata_0[29] = o_txpipe3_txdata[29];
        assign o_txpipe3_txdata_0[28] = o_txpipe3_txdata[28];
        assign o_txpipe3_txdata_0[27] = o_txpipe3_txdata[27];
        assign o_txpipe3_txdata_0[26] = o_txpipe3_txdata[26];
        assign o_txpipe3_txdata_0[25] = o_txpipe3_txdata[25];
        assign o_txpipe3_txdata_0[24] = o_txpipe3_txdata[24];
        assign o_txpipe3_txdata_0[23] = o_txpipe3_txdata[23];
        assign o_txpipe3_txdata_0[22] = o_txpipe3_txdata[22];
        assign o_txpipe3_txdata_0[21] = o_txpipe3_txdata[21];
        assign o_txpipe3_txdata_0[20] = o_txpipe3_txdata[20];
        assign o_txpipe3_txdata_0[19] = o_txpipe3_txdata[19];
        assign o_txpipe3_txdata_0[18] = o_txpipe3_txdata[18];
        assign o_txpipe3_txdata_0[17] = o_txpipe3_txdata[17];
        assign o_txpipe3_txdata_0[16] = o_txpipe3_txdata[16];
        assign o_txpipe3_txdata_0[15] = o_txpipe3_txdata[15];
        assign o_txpipe3_txdata_0[14] = o_txpipe3_txdata[14];
        assign o_txpipe3_txdata_0[13] = o_txpipe3_txdata[13];
        assign o_txpipe3_txdata_0[12] = o_txpipe3_txdata[12];
        assign o_txpipe3_txdata_0[11] = o_txpipe3_txdata[11];
        assign o_txpipe3_txdata_0[10] = o_txpipe3_txdata[10];
        assign o_txpipe3_txdata_0[9] = o_txpipe3_txdata[9];
        assign o_txpipe3_txdata_0[8] = o_txpipe3_txdata[8];
        assign o_txpipe3_txdata_0[7] = o_txpipe3_txdata[7];
        assign o_txpipe3_txdata_0[6] = o_txpipe3_txdata[6];
        assign o_txpipe3_txdata_0[5] = o_txpipe3_txdata[5];
        assign o_txpipe3_txdata_0[4] = o_txpipe3_txdata[4];
        assign o_txpipe3_txdata_0[3] = o_txpipe3_txdata[3];
        assign o_txpipe3_txdata_0[2] = o_txpipe3_txdata[2];
        assign o_txpipe3_txdata_0[1] = o_txpipe3_txdata[1];
        assign o_txpipe3_txdata_0[0] = o_txpipe3_txdata[0];
        assign o_txpipe3_txdatak_0[3] = o_txpipe3_txdatak[3];
        assign o_txpipe3_txdatak_0[2] = o_txpipe3_txdatak[2];
        assign o_txpipe3_txdatak_0[1] = o_txpipe3_txdatak[1];
        assign o_txpipe3_txdatak_0[0] = o_txpipe3_txdatak[0];
        assign o_txpipe3_txdatavalid_0 = o_txpipe3_txdatavalid;
        assign o_txpipe3_txdeemph_0[17] = o_txpipe3_txdeemph[17];
        assign o_txpipe3_txdeemph_0[16] = o_txpipe3_txdeemph[16];
        assign o_txpipe3_txdeemph_0[15] = o_txpipe3_txdeemph[15];
        assign o_txpipe3_txdeemph_0[14] = o_txpipe3_txdeemph[14];
        assign o_txpipe3_txdeemph_0[13] = o_txpipe3_txdeemph[13];
        assign o_txpipe3_txdeemph_0[12] = o_txpipe3_txdeemph[12];
        assign o_txpipe3_txdeemph_0[11] = o_txpipe3_txdeemph[11];
        assign o_txpipe3_txdeemph_0[10] = o_txpipe3_txdeemph[10];
        assign o_txpipe3_txdeemph_0[9] = o_txpipe3_txdeemph[9];
        assign o_txpipe3_txdeemph_0[8] = o_txpipe3_txdeemph[8];
        assign o_txpipe3_txdeemph_0[7] = o_txpipe3_txdeemph[7];
        assign o_txpipe3_txdeemph_0[6] = o_txpipe3_txdeemph[6];
        assign o_txpipe3_txdeemph_0[5] = o_txpipe3_txdeemph[5];
        assign o_txpipe3_txdeemph_0[4] = o_txpipe3_txdeemph[4];
        assign o_txpipe3_txdeemph_0[3] = o_txpipe3_txdeemph[3];
        assign o_txpipe3_txdeemph_0[2] = o_txpipe3_txdeemph[2];
        assign o_txpipe3_txdeemph_0[1] = o_txpipe3_txdeemph[1];
        assign o_txpipe3_txdeemph_0[0] = o_txpipe3_txdeemph[0];
        assign o_txpipe3_txdtctrx_lb_0 = o_txpipe3_txdtctrx_lb;
        assign o_txpipe3_txelecidle_0 = o_txpipe3_txelecidle;
        assign o_txpipe3_txmargin_0[2] = o_txpipe3_txmargin[2];
        assign o_txpipe3_txmargin_0[1] = o_txpipe3_txmargin[1];
        assign o_txpipe3_txmargin_0[0] = o_txpipe3_txmargin[0];
        assign o_txpipe3_txoneszeros_0 = o_txpipe3_txoneszeros;
        assign o_txpipe3_txstartblock_0 = o_txpipe3_txstartblock;
        assign o_txpipe3_txswing_0 = o_txpipe3_txswing;
        assign o_txpipe3_txsyncheader_0[3] = o_txpipe3_txsyncheader[3];
        assign o_txpipe3_txsyncheader_0[2] = o_txpipe3_txsyncheader[2];
        assign o_txpipe3_txsyncheader_0[1] = o_txpipe3_txsyncheader[1];
        assign o_txpipe3_txsyncheader_0[0] = o_txpipe3_txsyncheader[0];
        assign o_txpipe3_width_0[2] = o_txpipe3_width[2];
        assign o_txpipe3_width_0[1] = o_txpipe3_width[1];
        assign o_txpipe3_width_0[0] = o_txpipe3_width[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_asyncpowerchangeack = pcie_pcs_tx_mux_u3__o_txpipe_asyncpowerchangeack_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_blockaligncontrol = pcie_pcs_tx_mux_u3__o_txpipe_blockaligncontrol_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_cfg_hw_auto_sp_dis = pcie_pcs_tx_mux_u3__o_txpipe_cfg_hw_auto_sp_dis_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_dirchange = pcie_pcs_tx_mux_u3__o_txpipe_dirchange_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_ebuf_mode = pcie_pcs_tx_mux_u3__o_txpipe_ebuf_mode_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_encodedecodebypass = pcie_pcs_tx_mux_u3__o_txpipe_encodedecodebypass_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_fs[5] = pcie_pcs_tx_mux_u3__o_txpipe_fs_0[5];
        assign pcie_pcs_tx_mux_u3__o_txpipe_fs[4] = pcie_pcs_tx_mux_u3__o_txpipe_fs_0[4];
        assign pcie_pcs_tx_mux_u3__o_txpipe_fs[3] = pcie_pcs_tx_mux_u3__o_txpipe_fs_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_fs[2] = pcie_pcs_tx_mux_u3__o_txpipe_fs_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_fs[1] = pcie_pcs_tx_mux_u3__o_txpipe_fs_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_fs[0] = pcie_pcs_tx_mux_u3__o_txpipe_fs_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_getlocalpresetcoefficients = pcie_pcs_tx_mux_u3__o_txpipe_getlocalpresetcoefficients_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_invalidrequest = pcie_pcs_tx_mux_u3__o_txpipe_invalidrequest_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_lf[5] = pcie_pcs_tx_mux_u3__o_txpipe_lf_0[5];
        assign pcie_pcs_tx_mux_u3__o_txpipe_lf[4] = pcie_pcs_tx_mux_u3__o_txpipe_lf_0[4];
        assign pcie_pcs_tx_mux_u3__o_txpipe_lf[3] = pcie_pcs_tx_mux_u3__o_txpipe_lf_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_lf[2] = pcie_pcs_tx_mux_u3__o_txpipe_lf_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_lf[1] = pcie_pcs_tx_mux_u3__o_txpipe_lf_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_lf[0] = pcie_pcs_tx_mux_u3__o_txpipe_lf_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex[4] = pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[4];
        assign pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex[3] = pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex[2] = pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex[1] = pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex[0] = pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_lowpin_nt = pcie_pcs_tx_mux_u3__o_txpipe_lowpin_nt_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus[7] = pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[7];
        assign pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus[6] = pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[6];
        assign pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus[5] = pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[5];
        assign pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus[4] = pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[4];
        assign pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus[3] = pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus[2] = pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus[1] = pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus[0] = pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate[2] = pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate[1] = pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate[0] = pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_pclkchangeack = pcie_pcs_tx_mux_u3__o_txpipe_pclkchangeack_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt[3] = pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt[2] = pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt[1] = pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt[0] = pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_powerdown[3] = pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_powerdown[2] = pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_powerdown[1] = pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_powerdown[0] = pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_rate[2] = pcie_pcs_tx_mux_u3__o_txpipe_rate_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_rate[1] = pcie_pcs_tx_mux_u3__o_txpipe_rate_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_rate[0] = pcie_pcs_tx_mux_u3__o_txpipe_rate_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxelecidle_disable_a = pcie_pcs_tx_mux_u3__o_txpipe_rxelecidle_disable_a_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxeqclr = pcie_pcs_tx_mux_u3__o_txpipe_rxeqclr_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxeqeval = pcie_pcs_tx_mux_u3__o_txpipe_rxeqeval_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxeqinprogress = pcie_pcs_tx_mux_u3__o_txpipe_rxeqinprogress_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxeqtraining = pcie_pcs_tx_mux_u3__o_txpipe_rxeqtraining_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxpolarity = pcie_pcs_tx_mux_u3__o_txpipe_rxpolarity_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint[2] = pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint[1] = pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint[0] = pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxstandby = pcie_pcs_tx_mux_u3__o_txpipe_rxstandby_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_rxtermination = pcie_pcs_tx_mux_u3__o_txpipe_rxtermination_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_srisenable = pcie_pcs_tx_mux_u3__o_txpipe_srisenable_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txcmnmode_disable_a = pcie_pcs_tx_mux_u3__o_txpipe_txcmnmode_disable_a_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txcompliance = pcie_pcs_tx_mux_u3__o_txpipe_txcompliance_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[39] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[39];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[38] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[38];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[37] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[37];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[36] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[36];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[35] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[35];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[34] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[34];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[33] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[33];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[32] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[32];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[31] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[31];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[30] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[30];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[29] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[29];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[28] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[28];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[27] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[27];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[26] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[26];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[25] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[25];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[24] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[24];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[23] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[23];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[22] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[22];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[21] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[21];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[20] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[20];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[19] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[19];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[18] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[18];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[17] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[17];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[16] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[16];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[15] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[15];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[14] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[14];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[13] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[13];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[12] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[12];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[11] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[11];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[10] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[10];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[9] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[9];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[8] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[8];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[7] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[7];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[6] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[6];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[5] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[5];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[4] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[4];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[3] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[2] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[1] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdata[0] = pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdatak[3] = pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdatak[2] = pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdatak[1] = pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdatak[0] = pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdatavalid = pcie_pcs_tx_mux_u3__o_txpipe_txdatavalid_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[17] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[17];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[16] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[16];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[15] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[15];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[14] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[14];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[13] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[13];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[12] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[12];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[11] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[11];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[10] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[10];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[9] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[9];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[8] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[8];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[7] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[7];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[6] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[6];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[5] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[5];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[4] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[4];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[3] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[2] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[1] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdeemph[0] = pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txdtctrx_lb = pcie_pcs_tx_mux_u3__o_txpipe_txdtctrx_lb_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txelecidle = pcie_pcs_tx_mux_u3__o_txpipe_txelecidle_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txmargin[2] = pcie_pcs_tx_mux_u3__o_txpipe_txmargin_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txmargin[1] = pcie_pcs_tx_mux_u3__o_txpipe_txmargin_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txmargin[0] = pcie_pcs_tx_mux_u3__o_txpipe_txmargin_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txoneszeros = pcie_pcs_tx_mux_u3__o_txpipe_txoneszeros_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txstartblock = pcie_pcs_tx_mux_u3__o_txpipe_txstartblock_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txswing = pcie_pcs_tx_mux_u3__o_txpipe_txswing_0;
        assign pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader[3] = pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0[3];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader[2] = pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader[1] = pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader[0] = pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0[0];
        assign pcie_pcs_tx_mux_u3__o_txpipe_width[2] = pcie_pcs_tx_mux_u3__o_txpipe_width_0[2];
        assign pcie_pcs_tx_mux_u3__o_txpipe_width[1] = pcie_pcs_tx_mux_u3__o_txpipe_width_0[1];
        assign pcie_pcs_tx_mux_u3__o_txpipe_width[0] = pcie_pcs_tx_mux_u3__o_txpipe_width_0[0];
	assign n1_5 = 1'b0;

        tennm_sm_hssi_pcie_pcs_clk_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_clk_mux_0__sel)
        ) x_mux_sm_hssi_pcie_pcs_clk_mux_0 (
                .i_same_quad_pclk0_clk(o_pcs_lane0_pclk_0),
                .i_unused_pclk0_clk(n1_5),
                .i_upper_quad_pclk0_clk(n1_5),
                .i_usb_pclk_clk(n1_5),
                .o_clk(pcie_pcs_clk_mux_u0__o_clk_0)
        );

        tennm_sm_hssi_pcie_pcs_clk_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_clk_mux_1__sel)
        ) x_mux_sm_hssi_pcie_pcs_clk_mux_1 (
                .i_same_quad_pclk0_clk(o_pcs_lane0_pclk_0),
                .i_unused_pclk0_clk(n1_5),
                .i_upper_quad_pclk0_clk(n1_5),
                .i_usb_pclk_clk(o_pcs_lane1_pclk_0),
                .o_clk(pcie_pcs_clk_mux_u1__o_clk_0)
        );

        tennm_sm_hssi_pcie_pcs_clk_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_clk_mux_2__sel)
        ) x_mux_sm_hssi_pcie_pcs_clk_mux_2 (
                .i_same_quad_pclk0_clk(o_pcs_lane0_pclk_0),
                .i_unused_pclk0_clk(n1_5),
                .i_upper_quad_pclk0_clk(n1_5),
                .i_usb_pclk_clk(o_pcs_lane2_pclk_0),
                .o_clk(pcie_pcs_clk_mux_u2__o_clk_0)
        );

        tennm_sm_hssi_pcie_pcs_clk_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_clk_mux_3__sel)
        ) x_mux_sm_hssi_pcie_pcs_clk_mux_3 (
                .i_same_quad_pclk0_clk(o_pcs_lane0_pclk_0),
                .i_unused_pclk0_clk(n1_5),
                .i_upper_quad_pclk0_clk(n1_5),
                .i_usb_pclk_clk(n1_5),
                .o_clk(pcie_pcs_clk_mux_u3__o_clk_0)
        );

        tennm_sm_hssi_pcie_pcs_hps_clkmux #(
                .sel(x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__sel)
        ) x_mux_sm_hssi_pcie_pcs_hps_clkmux_0 (
                .i_hps_pcs1_enabled_hps_clk(o_pcs_lane1_pclk_0),
                .i_hps_pcs2_enabled_hps_clk(o_pcs_lane2_pclk_0),
                .o_hps_clk(x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__o_hps_clk_1)
        );

        tennm_sm_hssi_pcie_pcs_hps_demux #(
                .sel(x_decoder_sm_hssi_pcie_pcs_hps_demux_0__sel)
        ) x_decoder_sm_hssi_pcie_pcs_hps_demux_0 (
                .i_txpipe_ebuf_mode(x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_ebuf_mode_1),
                .i_txpipe_powerdown({ x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0[3], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0[2], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0[1], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown_0[0] }),
                .i_txpipe_rate({ x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate_0[1], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate_0[0] }),
                .i_txpipe_rxeqtraining(x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxeqtraining_1),
                .i_txpipe_rxpolarity(x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxpolarity_1),
                .i_txpipe_rxtermination(x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxtermination_1),
                .i_txpipe_txdata({ x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[15], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[14], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[13], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[12], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[11], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[10], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[9], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[8], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[7], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[6], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[5], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[4], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[3], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[2], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[1], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata_0[0] }),
                .i_txpipe_txdatak({ x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak_0[1], x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak_0[0] }),
                .i_txpipe_txdtctrx_lb(x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdtctrx_lb_1),
                .i_txpipe_txelecidle(x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txelecidle_1),
                .i_txpipe_txoneszeros(x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txoneszeros_1),
                .o_hps_pcs1_enabled_txpipe_asyncpowerchangeack(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_asyncpowerchangeack_0),
                .o_hps_pcs1_enabled_txpipe_blockaligncontrol(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_blockaligncontrol_0),
                .o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis_0),
                .o_hps_pcs1_enabled_txpipe_dirchange(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_dirchange_0),
                .o_hps_pcs1_enabled_txpipe_ebuf_mode(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_ebuf_mode_0),
                .o_hps_pcs1_enabled_txpipe_encodedecodebypass(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_encodedecodebypass_0),
                .o_hps_pcs1_enabled_txpipe_fs({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[0] }),
                .o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients_0),
                .o_hps_pcs1_enabled_txpipe_invalidrequest(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_invalidrequest_0),
                .o_hps_pcs1_enabled_txpipe_lf({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[0] }),
                .o_hps_pcs1_enabled_txpipe_localpresetindex({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[0] }),
                .o_hps_pcs1_enabled_txpipe_lowpin_nt(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lowpin_nt_0),
                .o_hps_pcs1_enabled_txpipe_m2p_bus({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[0] }),
                .o_hps_pcs1_enabled_txpipe_pclk_rate({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclk_rate_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclk_rate_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclk_rate_0[0] }),
                .o_hps_pcs1_enabled_txpipe_pclkchangeack(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclkchangeack_0),
                .o_hps_pcs1_enabled_txpipe_phy_mode_nt({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0[0] }),
                .o_hps_pcs1_enabled_txpipe_powerdown({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0[0] }),
                .o_hps_pcs1_enabled_txpipe_rate({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rate_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rate_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rate_0[0] }),
                .o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a_0),
                .o_hps_pcs1_enabled_txpipe_rxeqclr(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqclr_0),
                .o_hps_pcs1_enabled_txpipe_rxeqeval(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqeval_0),
                .o_hps_pcs1_enabled_txpipe_rxeqinprogress(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqinprogress_0),
                .o_hps_pcs1_enabled_txpipe_rxeqtraining(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqtraining_0),
                .o_hps_pcs1_enabled_txpipe_rxpolarity(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpolarity_0),
                .o_hps_pcs1_enabled_txpipe_rxpresethint({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpresethint_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpresethint_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpresethint_0[0] }),
                .o_hps_pcs1_enabled_txpipe_rxstandby(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxstandby_0),
                .o_hps_pcs1_enabled_txpipe_rxtermination(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxtermination_0),
                .o_hps_pcs1_enabled_txpipe_srisenable(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_srisenable_0),
                .o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a_0),
                .o_hps_pcs1_enabled_txpipe_txcompliance(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txcompliance_0),
                .o_hps_pcs1_enabled_txpipe_txdata({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[39], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[38], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[37], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[36], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[35], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[34], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[33], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[32], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[31], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[30], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[29], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[28], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[27], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[26], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[25], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[24], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[23], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[22], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[21], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[20], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[19], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[18], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[17], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[16], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[15], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[14], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[13], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[12], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[11], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[10], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[9], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[8], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[0] }),
                .o_hps_pcs1_enabled_txpipe_txdatak({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0[0] }),
                .o_hps_pcs1_enabled_txpipe_txdatavalid(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatavalid_0),
                .o_hps_pcs1_enabled_txpipe_txdeemph({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[17], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[16], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[15], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[14], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[13], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[12], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[11], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[10], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[9], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[8], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[0] }),
                .o_hps_pcs1_enabled_txpipe_txdtctrx_lb(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdtctrx_lb_0),
                .o_hps_pcs1_enabled_txpipe_txelecidle(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txelecidle_0),
                .o_hps_pcs1_enabled_txpipe_txmargin({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txmargin_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txmargin_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txmargin_0[0] }),
                .o_hps_pcs1_enabled_txpipe_txoneszeros(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txoneszeros_0),
                .o_hps_pcs1_enabled_txpipe_txstartblock(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txstartblock_0),
                .o_hps_pcs1_enabled_txpipe_txswing(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txswing_0),
                .o_hps_pcs1_enabled_txpipe_txsyncheader({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0[0] }),
                .o_hps_pcs1_enabled_txpipe_width({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_width_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_width_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_width_0[0] }),
                .o_hps_pcs2_enabled_txpipe_asyncpowerchangeack(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_asyncpowerchangeack_0),
                .o_hps_pcs2_enabled_txpipe_blockaligncontrol(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_blockaligncontrol_0),
                .o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis_0),
                .o_hps_pcs2_enabled_txpipe_dirchange(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_dirchange_0),
                .o_hps_pcs2_enabled_txpipe_ebuf_mode(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_ebuf_mode_0),
                .o_hps_pcs2_enabled_txpipe_encodedecodebypass(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_encodedecodebypass_0),
                .o_hps_pcs2_enabled_txpipe_fs({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[0] }),
                .o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients_0),
                .o_hps_pcs2_enabled_txpipe_invalidrequest(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_invalidrequest_0),
                .o_hps_pcs2_enabled_txpipe_lf({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[0] }),
                .o_hps_pcs2_enabled_txpipe_localpresetindex({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[0] }),
                .o_hps_pcs2_enabled_txpipe_lowpin_nt(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lowpin_nt_0),
                .o_hps_pcs2_enabled_txpipe_m2p_bus({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[0] }),
                .o_hps_pcs2_enabled_txpipe_pclk_rate({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclk_rate_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclk_rate_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclk_rate_0[0] }),
                .o_hps_pcs2_enabled_txpipe_pclkchangeack(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclkchangeack_0),
                .o_hps_pcs2_enabled_txpipe_phy_mode_nt({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0[0] }),
                .o_hps_pcs2_enabled_txpipe_powerdown({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0[0] }),
                .o_hps_pcs2_enabled_txpipe_rate({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rate_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rate_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rate_0[0] }),
                .o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a_0),
                .o_hps_pcs2_enabled_txpipe_rxeqclr(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqclr_0),
                .o_hps_pcs2_enabled_txpipe_rxeqeval(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqeval_0),
                .o_hps_pcs2_enabled_txpipe_rxeqinprogress(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqinprogress_0),
                .o_hps_pcs2_enabled_txpipe_rxeqtraining(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqtraining_0),
                .o_hps_pcs2_enabled_txpipe_rxpolarity(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpolarity_0),
                .o_hps_pcs2_enabled_txpipe_rxpresethint({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpresethint_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpresethint_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpresethint_0[0] }),
                .o_hps_pcs2_enabled_txpipe_rxstandby(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxstandby_0),
                .o_hps_pcs2_enabled_txpipe_rxtermination(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxtermination_0),
                .o_hps_pcs2_enabled_txpipe_srisenable(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_srisenable_0),
                .o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a_0),
                .o_hps_pcs2_enabled_txpipe_txcompliance(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txcompliance_0),
                .o_hps_pcs2_enabled_txpipe_txdata({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[39], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[38], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[37], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[36], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[35], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[34], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[33], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[32], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[31], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[30], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[29], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[28], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[27], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[26], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[25], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[24], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[23], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[22], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[21], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[20], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[19], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[18], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[17], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[16], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[15], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[14], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[13], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[12], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[11], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[10], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[9], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[8], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[0] }),
                .o_hps_pcs2_enabled_txpipe_txdatak({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0[0] }),
                .o_hps_pcs2_enabled_txpipe_txdatavalid(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatavalid_0),
                .o_hps_pcs2_enabled_txpipe_txdeemph({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[17], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[16], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[15], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[14], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[13], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[12], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[11], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[10], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[9], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[8], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[0] }),
                .o_hps_pcs2_enabled_txpipe_txdtctrx_lb(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdtctrx_lb_0),
                .o_hps_pcs2_enabled_txpipe_txelecidle(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txelecidle_0),
                .o_hps_pcs2_enabled_txpipe_txmargin({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txmargin_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txmargin_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txmargin_0[0] }),
                .o_hps_pcs2_enabled_txpipe_txoneszeros(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txoneszeros_0),
                .o_hps_pcs2_enabled_txpipe_txstartblock(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txstartblock_0),
                .o_hps_pcs2_enabled_txpipe_txswing(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txswing_0),
                .o_hps_pcs2_enabled_txpipe_txsyncheader({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0[0] }),
                .o_hps_pcs2_enabled_txpipe_width({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_width_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_width_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_width_0[0] })
        );

        tennm_sm_hssi_pcie_pcs_hps_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_hps_mux_0__sel)
        ) x_mux_sm_hssi_pcie_pcs_hps_mux_0 (
                .i_hps_pcs1_enabled_rxpipe_dirfeedback({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_linkevaluationfeedbackfiguremerit({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[7], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[6], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_localfs({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_locallf({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_localtxcoefficientsvalid(pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxcoefficientsvalid_0),
                .i_hps_pcs1_enabled_rxpipe_localtxpresetcoefficients({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[17], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[16], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[15], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[14], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[13], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[12], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[11], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[10], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[9], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[8], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[7], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[6], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_p2m_bus({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[7], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[6], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_pclkchangeok(pcie_pcs_rx_demux_u1__o_hps_rxpipe_pclkchangeok_0),
                .i_hps_pcs1_enabled_rxpipe_phystatus(pcie_pcs_rx_demux_u1__o_hps_rxpipe_phystatus_0),
                .i_hps_pcs1_enabled_rxpipe_rxdata({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[39], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[38], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[37], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[36], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[35], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[34], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[33], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[32], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[31], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[30], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[29], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[28], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[27], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[26], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[25], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[24], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[23], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[22], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[21], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[20], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[19], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[18], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[17], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[16], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[15], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[14], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[13], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[12], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[11], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[10], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[9], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[8], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[7], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[6], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_rxdatak({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_rxdatavalid(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatavalid_0),
                .i_hps_pcs1_enabled_rxpipe_rxelecidlea(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxelecidlea_0),
                .i_hps_pcs1_enabled_rxpipe_rxstandbystatus(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstandbystatus_0),
                .i_hps_pcs1_enabled_rxpipe_rxstartblock(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstartblock_0),
                .i_hps_pcs1_enabled_rxpipe_rxstatus({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstatus_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstatus_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstatus_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_rxsyncheader({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0[0] }),
                .i_hps_pcs1_enabled_rxpipe_rxvalid(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxvalid_0),
                .i_hps_pcs2_enabled_rxpipe_dirfeedback({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_linkevaluationfeedbackfiguremerit({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[7], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[6], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_localfs({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_locallf({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_localtxcoefficientsvalid(pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxcoefficientsvalid_0),
                .i_hps_pcs2_enabled_rxpipe_localtxpresetcoefficients({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[17], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[16], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[15], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[14], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[13], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[12], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[11], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[10], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[9], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[8], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[7], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[6], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_p2m_bus({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[7], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[6], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_pclkchangeok(pcie_pcs_rx_demux_u2__o_hps_rxpipe_pclkchangeok_0),
                .i_hps_pcs2_enabled_rxpipe_phystatus(pcie_pcs_rx_demux_u2__o_hps_rxpipe_phystatus_0),
                .i_hps_pcs2_enabled_rxpipe_rxdata({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[39], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[38], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[37], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[36], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[35], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[34], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[33], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[32], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[31], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[30], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[29], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[28], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[27], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[26], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[25], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[24], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[23], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[22], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[21], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[20], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[19], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[18], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[17], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[16], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[15], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[14], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[13], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[12], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[11], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[10], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[9], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[8], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[7], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[6], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_rxdatak({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_rxdatavalid(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatavalid_0),
                .i_hps_pcs2_enabled_rxpipe_rxelecidlea(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxelecidlea_0),
                .i_hps_pcs2_enabled_rxpipe_rxstandbystatus(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstandbystatus_0),
                .i_hps_pcs2_enabled_rxpipe_rxstartblock(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstartblock_0),
                .i_hps_pcs2_enabled_rxpipe_rxstatus({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstatus_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstatus_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstatus_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_rxsyncheader({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0[0] }),
                .i_hps_pcs2_enabled_rxpipe_rxvalid(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxvalid_0),
                .o_rxpipe_phystatus(x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_phystatus_1),
                .o_rxpipe_rxdata({ x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[15], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[14], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[13], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[12], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[11], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[10], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[9], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[8], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[7], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[6], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[5], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[4], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[3], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[2], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[1], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata_0[0] }),
                .o_rxpipe_rxdatak({ x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak_0[1], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak_0[0] }),
                .o_rxpipe_rxelecidle_a(x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxelecidle_a_1),
                .o_rxpipe_rxstatus({ x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus_0[2], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus_0[1], x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus_0[0] }),
                .o_rxpipe_rxvalid(x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxvalid_1)
        );

        tennm_sm_hssi_pcie_pcs_rst_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_rst_mux_0__sel)
        ) x_mux_sm_hssi_pcie_pcs_rst_mux_0 (
                .i_hps_rst_rstn(n1_5),
                .i_same_quad_pcs_rst_rstn(o_pcs0_pipe_rst_n_0),
                .i_unused_rstn(n1_5),
                .i_upper_quad_pcs_rst_rstn(n1_5),
                .o_rstn(pcie_pcs_rst_mux_u0__o_rstn_0)
        );

        tennm_sm_hssi_pcie_pcs_rst_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_rst_mux_1__sel)
        ) x_mux_sm_hssi_pcie_pcs_rst_mux_1 (
                .i_hps_rst_rstn(x_mux_sm_hssi_pcie_pcs_rst_mux_1__i_hps_rst_rstn_1),
                .i_same_quad_pcs_rst_rstn(o_pcs1_pipe_rst_n_0),
                .i_unused_rstn(n1_5),
                .i_upper_quad_pcs_rst_rstn(n1_5),
                .o_rstn(pcie_pcs_rst_mux_u1__o_rstn_0)
        );

        tennm_sm_hssi_pcie_pcs_rst_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_rst_mux_2__sel)
        ) x_mux_sm_hssi_pcie_pcs_rst_mux_2 (
                .i_hps_rst_rstn(x_mux_sm_hssi_pcie_pcs_rst_mux_2__i_hps_rst_rstn_1),
                .i_same_quad_pcs_rst_rstn(o_pcs2_pipe_rst_n_0),
                .i_unused_rstn(n1_5),
                .i_upper_quad_pcs_rst_rstn(n1_5),
                .o_rstn(pcie_pcs_rst_mux_u2__o_rstn_0)
        );

        tennm_sm_hssi_pcie_pcs_rst_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_rst_mux_3__sel)
        ) x_mux_sm_hssi_pcie_pcs_rst_mux_3 (
                .i_hps_rst_rstn(n1_5),
                .i_same_quad_pcs_rst_rstn(o_pcs3_pipe_rst_n_0),
                .i_unused_rstn(n1_5),
                .i_upper_quad_pcs_rst_rstn(n1_5),
                .o_rstn(pcie_pcs_rst_mux_u3__o_rstn_0)
        );

        tennm_sm_hssi_pcie_pcs_rx_demux #(
                .sel(x_mux_sm_hssi_pcie_pcs_rx_demux_0__sel)
        ) x_mux_sm_hssi_pcie_pcs_rx_demux_0 (
                .i_rxpipe_dirfeedback({ pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[5], pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[4], pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[3], pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[2], pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[1], pcie_pcs_lane_u0__o_rxpipe_dirfeedback_0[0] }),
                .i_rxpipe_linkevaluationfeedbackfiguremerit({ pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[7], pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[6], pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[5], pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[4], pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[3], pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[2], pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[1], pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit_0[0] }),
                .i_rxpipe_localfs({ pcie_pcs_lane_u0__o_rxpipe_localfs_0[5], pcie_pcs_lane_u0__o_rxpipe_localfs_0[4], pcie_pcs_lane_u0__o_rxpipe_localfs_0[3], pcie_pcs_lane_u0__o_rxpipe_localfs_0[2], pcie_pcs_lane_u0__o_rxpipe_localfs_0[1], pcie_pcs_lane_u0__o_rxpipe_localfs_0[0] }),
                .i_rxpipe_locallf({ pcie_pcs_lane_u0__o_rxpipe_locallf_0[5], pcie_pcs_lane_u0__o_rxpipe_locallf_0[4], pcie_pcs_lane_u0__o_rxpipe_locallf_0[3], pcie_pcs_lane_u0__o_rxpipe_locallf_0[2], pcie_pcs_lane_u0__o_rxpipe_locallf_0[1], pcie_pcs_lane_u0__o_rxpipe_locallf_0[0] }),
                .i_rxpipe_localtxcoefficientsvalid(pcie_pcs_lane_u0__o_rxpipe_localtxcoefficientsvalid_0),
                .i_rxpipe_localtxpresetcoefficients({ pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[17], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[16], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[15], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[14], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[13], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[12], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[11], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[10], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[9], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[8], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[7], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[6], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[5], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[4], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[3], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[2], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[1], pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients_0[0] }),
                .i_rxpipe_p2m_bus({ pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[7], pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[6], pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[5], pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[4], pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[3], pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[2], pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[1], pcie_pcs_lane_u0__o_rxpipe_p2m_bus_0[0] }),
                .i_rxpipe_pclkchangeok(pcie_pcs_lane_u0__o_rxpipe_pclkchangeok_0),
                .i_rxpipe_phystatus(pcie_pcs_lane_u0__o_rxpipe_phystatus_0),
                .i_rxpipe_rxdata({ pcie_pcs_lane_u0__o_rxpipe_rxdata_0[39], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[38], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[37], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[36], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[35], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[34], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[33], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[32], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[31], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[30], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[29], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[28], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[27], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[26], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[25], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[24], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[23], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[22], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[21], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[20], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[19], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[18], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[17], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[16], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[15], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[14], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[13], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[12], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[11], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[10], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[9], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[8], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[7], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[6], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[5], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[4], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[3], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[2], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[1], pcie_pcs_lane_u0__o_rxpipe_rxdata_0[0] }),
                .i_rxpipe_rxdatak({ pcie_pcs_lane_u0__o_rxpipe_rxdatak_0[3], pcie_pcs_lane_u0__o_rxpipe_rxdatak_0[2], pcie_pcs_lane_u0__o_rxpipe_rxdatak_0[1], pcie_pcs_lane_u0__o_rxpipe_rxdatak_0[0] }),
                .i_rxpipe_rxdatavalid(pcie_pcs_lane_u0__o_rxpipe_rxdatavalid_0),
                .i_rxpipe_rxelecidlea(pcie_pcs_lane_u0__o_rxpipe_rxelecidlea_0),
                .i_rxpipe_rxstandbystatus(pcie_pcs_lane_u0__o_rxpipe_rxstandbystatus_0),
                .i_rxpipe_rxstartblock(pcie_pcs_lane_u0__o_rxpipe_rxstartblock_0),
                .i_rxpipe_rxstatus({ pcie_pcs_lane_u0__o_rxpipe_rxstatus_0[2], pcie_pcs_lane_u0__o_rxpipe_rxstatus_0[1], pcie_pcs_lane_u0__o_rxpipe_rxstatus_0[0] }),
                .i_rxpipe_rxsyncheader({ pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0[3], pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0[2], pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0[1], pcie_pcs_lane_u0__o_rxpipe_rxsyncheader_0[0] }),
                .i_rxpipe_rxvalid(pcie_pcs_lane_u0__o_rxpipe_rxvalid_0),
                .o_hps_rxpipe_dirfeedback({ tmp_6226, tmp_6227, tmp_6228, tmp_6229, tmp_6230, tmp_6231 }),
                .o_hps_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_6232, tmp_6233, tmp_6234, tmp_6235, tmp_6236, tmp_6237, tmp_6238, tmp_6239 }),
                .o_hps_rxpipe_localfs({ tmp_6240, tmp_6241, tmp_6242, tmp_6243, tmp_6244, tmp_6245 }),
                .o_hps_rxpipe_locallf({ tmp_6246, tmp_6247, tmp_6248, tmp_6249, tmp_6250, tmp_6251 }),
                .o_hps_rxpipe_localtxcoefficientsvalid(tmp_6252),
                .o_hps_rxpipe_localtxpresetcoefficients({ tmp_6253, tmp_6254, tmp_6255, tmp_6256, tmp_6257, tmp_6258, tmp_6259, tmp_6260, tmp_6261, tmp_6262, tmp_6263, tmp_6264, tmp_6265, tmp_6266, tmp_6267, tmp_6268, tmp_6269, tmp_6270 }),
                .o_hps_rxpipe_p2m_bus({ tmp_6271, tmp_6272, tmp_6273, tmp_6274, tmp_6275, tmp_6276, tmp_6277, tmp_6278 }),
                .o_hps_rxpipe_pclkchangeok(tmp_6279),
                .o_hps_rxpipe_phystatus(tmp_6280),
                .o_hps_rxpipe_rxdata({ tmp_6281, tmp_6282, tmp_6283, tmp_6284, tmp_6285, tmp_6286, tmp_6287, tmp_6288, tmp_6289, tmp_6290, tmp_6291, tmp_6292, tmp_6293, tmp_6294, tmp_6295, tmp_6296, tmp_6297, tmp_6298, tmp_6299, tmp_6300, tmp_6301, tmp_6302, tmp_6303, tmp_6304, tmp_6305, tmp_6306, tmp_6307, tmp_6308, tmp_6309, tmp_6310, tmp_6311, tmp_6312, tmp_6313, tmp_6314, tmp_6315, tmp_6316, tmp_6317, tmp_6318, tmp_6319, tmp_6320 }),
                .o_hps_rxpipe_rxdatak({ tmp_6321, tmp_6322, tmp_6323, tmp_6324 }),
                .o_hps_rxpipe_rxdatavalid(tmp_6325),
                .o_hps_rxpipe_rxelecidlea(tmp_6326),
                .o_hps_rxpipe_rxstandbystatus(tmp_6327),
                .o_hps_rxpipe_rxstartblock(tmp_6328),
                .o_hps_rxpipe_rxstatus({ tmp_6329, tmp_6330, tmp_6331 }),
                .o_hps_rxpipe_rxsyncheader({ tmp_6332, tmp_6333, tmp_6334, tmp_6335 }),
                .o_hps_rxpipe_rxvalid(tmp_6336),
                .o_same_quad_pcie_ctrl_rxpipe_dirfeedback({ o_same_quad_rxpipe0_dirfeedback_0[5], o_same_quad_rxpipe0_dirfeedback_0[4], o_same_quad_rxpipe0_dirfeedback_0[3], o_same_quad_rxpipe0_dirfeedback_0[2], o_same_quad_rxpipe0_dirfeedback_0[1], o_same_quad_rxpipe0_dirfeedback_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit({ o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[7], o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[6], o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[5], o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[4], o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[3], o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[2], o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[1], o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_localfs({ o_same_quad_rxpipe0_localfs_0[5], o_same_quad_rxpipe0_localfs_0[4], o_same_quad_rxpipe0_localfs_0[3], o_same_quad_rxpipe0_localfs_0[2], o_same_quad_rxpipe0_localfs_0[1], o_same_quad_rxpipe0_localfs_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_locallf({ o_same_quad_rxpipe0_locallf_0[5], o_same_quad_rxpipe0_locallf_0[4], o_same_quad_rxpipe0_locallf_0[3], o_same_quad_rxpipe0_locallf_0[2], o_same_quad_rxpipe0_locallf_0[1], o_same_quad_rxpipe0_locallf_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(o_same_quad_rxpipe0_localtxcoefficientsvalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients({ o_same_quad_rxpipe0_localtxpresetcoefficients_0[17], o_same_quad_rxpipe0_localtxpresetcoefficients_0[16], o_same_quad_rxpipe0_localtxpresetcoefficients_0[15], o_same_quad_rxpipe0_localtxpresetcoefficients_0[14], o_same_quad_rxpipe0_localtxpresetcoefficients_0[13], o_same_quad_rxpipe0_localtxpresetcoefficients_0[12], o_same_quad_rxpipe0_localtxpresetcoefficients_0[11], o_same_quad_rxpipe0_localtxpresetcoefficients_0[10], o_same_quad_rxpipe0_localtxpresetcoefficients_0[9], o_same_quad_rxpipe0_localtxpresetcoefficients_0[8], o_same_quad_rxpipe0_localtxpresetcoefficients_0[7], o_same_quad_rxpipe0_localtxpresetcoefficients_0[6], o_same_quad_rxpipe0_localtxpresetcoefficients_0[5], o_same_quad_rxpipe0_localtxpresetcoefficients_0[4], o_same_quad_rxpipe0_localtxpresetcoefficients_0[3], o_same_quad_rxpipe0_localtxpresetcoefficients_0[2], o_same_quad_rxpipe0_localtxpresetcoefficients_0[1], o_same_quad_rxpipe0_localtxpresetcoefficients_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_p2m_bus({ o_same_quad_rxpipe0_p2m_bus_0[7], o_same_quad_rxpipe0_p2m_bus_0[6], o_same_quad_rxpipe0_p2m_bus_0[5], o_same_quad_rxpipe0_p2m_bus_0[4], o_same_quad_rxpipe0_p2m_bus_0[3], o_same_quad_rxpipe0_p2m_bus_0[2], o_same_quad_rxpipe0_p2m_bus_0[1], o_same_quad_rxpipe0_p2m_bus_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_pclkchangeok(o_same_quad_rxpipe0_pclkchangeok_0),
                .o_same_quad_pcie_ctrl_rxpipe_phystatus(o_same_quad_rxpipe0_phystatus_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxdata({ o_same_quad_rxpipe0_rxdata_0[39], o_same_quad_rxpipe0_rxdata_0[38], o_same_quad_rxpipe0_rxdata_0[37], o_same_quad_rxpipe0_rxdata_0[36], o_same_quad_rxpipe0_rxdata_0[35], o_same_quad_rxpipe0_rxdata_0[34], o_same_quad_rxpipe0_rxdata_0[33], o_same_quad_rxpipe0_rxdata_0[32], o_same_quad_rxpipe0_rxdata_0[31], o_same_quad_rxpipe0_rxdata_0[30], o_same_quad_rxpipe0_rxdata_0[29], o_same_quad_rxpipe0_rxdata_0[28], o_same_quad_rxpipe0_rxdata_0[27], o_same_quad_rxpipe0_rxdata_0[26], o_same_quad_rxpipe0_rxdata_0[25], o_same_quad_rxpipe0_rxdata_0[24], o_same_quad_rxpipe0_rxdata_0[23], o_same_quad_rxpipe0_rxdata_0[22], o_same_quad_rxpipe0_rxdata_0[21], o_same_quad_rxpipe0_rxdata_0[20], o_same_quad_rxpipe0_rxdata_0[19], o_same_quad_rxpipe0_rxdata_0[18], o_same_quad_rxpipe0_rxdata_0[17], o_same_quad_rxpipe0_rxdata_0[16], o_same_quad_rxpipe0_rxdata_0[15], o_same_quad_rxpipe0_rxdata_0[14], o_same_quad_rxpipe0_rxdata_0[13], o_same_quad_rxpipe0_rxdata_0[12], o_same_quad_rxpipe0_rxdata_0[11], o_same_quad_rxpipe0_rxdata_0[10], o_same_quad_rxpipe0_rxdata_0[9], o_same_quad_rxpipe0_rxdata_0[8], o_same_quad_rxpipe0_rxdata_0[7], o_same_quad_rxpipe0_rxdata_0[6], o_same_quad_rxpipe0_rxdata_0[5], o_same_quad_rxpipe0_rxdata_0[4], o_same_quad_rxpipe0_rxdata_0[3], o_same_quad_rxpipe0_rxdata_0[2], o_same_quad_rxpipe0_rxdata_0[1], o_same_quad_rxpipe0_rxdata_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxdatak({ o_same_quad_rxpipe0_rxdatak_0[3], o_same_quad_rxpipe0_rxdatak_0[2], o_same_quad_rxpipe0_rxdatak_0[1], o_same_quad_rxpipe0_rxdatak_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxdatavalid(o_same_quad_rxpipe0_rxdatavalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxelecidlea(o_same_quad_rxpipe0_rxelecidlea_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstandbystatus(o_same_quad_rxpipe0_rxstandbystatus_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstartblock(o_same_quad_rxpipe0_rxstartblock_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstatus({ o_same_quad_rxpipe0_rxstatus_0[2], o_same_quad_rxpipe0_rxstatus_0[1], o_same_quad_rxpipe0_rxstatus_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxsyncheader({ o_same_quad_rxpipe0_rxsyncheader_0[3], o_same_quad_rxpipe0_rxsyncheader_0[2], o_same_quad_rxpipe0_rxsyncheader_0[1], o_same_quad_rxpipe0_rxsyncheader_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxvalid(o_same_quad_rxpipe0_rxvalid_0),
                .o_unused_rxpipe_dirfeedback({ tmp_6337, tmp_6338, tmp_6339, tmp_6340, tmp_6341, tmp_6342 }),
                .o_unused_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_6343, tmp_6344, tmp_6345, tmp_6346, tmp_6347, tmp_6348, tmp_6349, tmp_6350 }),
                .o_unused_rxpipe_localfs({ tmp_6351, tmp_6352, tmp_6353, tmp_6354, tmp_6355, tmp_6356 }),
                .o_unused_rxpipe_locallf({ tmp_6357, tmp_6358, tmp_6359, tmp_6360, tmp_6361, tmp_6362 }),
                .o_unused_rxpipe_localtxcoefficientsvalid(tmp_6363),
                .o_unused_rxpipe_localtxpresetcoefficients({ tmp_6364, tmp_6365, tmp_6366, tmp_6367, tmp_6368, tmp_6369, tmp_6370, tmp_6371, tmp_6372, tmp_6373, tmp_6374, tmp_6375, tmp_6376, tmp_6377, tmp_6378, tmp_6379, tmp_6380, tmp_6381 }),
                .o_unused_rxpipe_p2m_bus({ tmp_6382, tmp_6383, tmp_6384, tmp_6385, tmp_6386, tmp_6387, tmp_6388, tmp_6389 }),
                .o_unused_rxpipe_pclkchangeok(tmp_6390),
                .o_unused_rxpipe_phystatus(tmp_6391),
                .o_unused_rxpipe_rxdata({ tmp_6392, tmp_6393, tmp_6394, tmp_6395, tmp_6396, tmp_6397, tmp_6398, tmp_6399, tmp_6400, tmp_6401, tmp_6402, tmp_6403, tmp_6404, tmp_6405, tmp_6406, tmp_6407, tmp_6408, tmp_6409, tmp_6410, tmp_6411, tmp_6412, tmp_6413, tmp_6414, tmp_6415, tmp_6416, tmp_6417, tmp_6418, tmp_6419, tmp_6420, tmp_6421, tmp_6422, tmp_6423, tmp_6424, tmp_6425, tmp_6426, tmp_6427, tmp_6428, tmp_6429, tmp_6430, tmp_6431 }),
                .o_unused_rxpipe_rxdatak({ tmp_6432, tmp_6433, tmp_6434, tmp_6435 }),
                .o_unused_rxpipe_rxdatavalid(tmp_6436),
                .o_unused_rxpipe_rxelecidlea(tmp_6437),
                .o_unused_rxpipe_rxstandbystatus(tmp_6438),
                .o_unused_rxpipe_rxstartblock(tmp_6439),
                .o_unused_rxpipe_rxstatus({ tmp_6440, tmp_6441, tmp_6442 }),
                .o_unused_rxpipe_rxsyncheader({ tmp_6443, tmp_6444, tmp_6445, tmp_6446 }),
                .o_unused_rxpipe_rxvalid(tmp_6447),
                .o_upper_quad_pcie_ctrl_rxpipe_dirfeedback({ tmp_6448, tmp_6449, tmp_6450, tmp_6451, tmp_6452, tmp_6453 }),
                .o_upper_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_6454, tmp_6455, tmp_6456, tmp_6457, tmp_6458, tmp_6459, tmp_6460, tmp_6461 }),
                .o_upper_quad_pcie_ctrl_rxpipe_localfs({ tmp_6462, tmp_6463, tmp_6464, tmp_6465, tmp_6466, tmp_6467 }),
                .o_upper_quad_pcie_ctrl_rxpipe_locallf({ tmp_6468, tmp_6469, tmp_6470, tmp_6471, tmp_6472, tmp_6473 }),
                .o_upper_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(tmp_6474),
                .o_upper_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients({ tmp_6475, tmp_6476, tmp_6477, tmp_6478, tmp_6479, tmp_6480, tmp_6481, tmp_6482, tmp_6483, tmp_6484, tmp_6485, tmp_6486, tmp_6487, tmp_6488, tmp_6489, tmp_6490, tmp_6491, tmp_6492 }),
                .o_upper_quad_pcie_ctrl_rxpipe_p2m_bus({ tmp_6493, tmp_6494, tmp_6495, tmp_6496, tmp_6497, tmp_6498, tmp_6499, tmp_6500 }),
                .o_upper_quad_pcie_ctrl_rxpipe_pclkchangeok(tmp_6501),
                .o_upper_quad_pcie_ctrl_rxpipe_phystatus(tmp_6502),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdata({ tmp_6503, tmp_6504, tmp_6505, tmp_6506, tmp_6507, tmp_6508, tmp_6509, tmp_6510, tmp_6511, tmp_6512, tmp_6513, tmp_6514, tmp_6515, tmp_6516, tmp_6517, tmp_6518, tmp_6519, tmp_6520, tmp_6521, tmp_6522, tmp_6523, tmp_6524, tmp_6525, tmp_6526, tmp_6527, tmp_6528, tmp_6529, tmp_6530, tmp_6531, tmp_6532, tmp_6533, tmp_6534, tmp_6535, tmp_6536, tmp_6537, tmp_6538, tmp_6539, tmp_6540, tmp_6541, tmp_6542 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdatak({ tmp_6543, tmp_6544, tmp_6545, tmp_6546 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdatavalid(tmp_6547),
                .o_upper_quad_pcie_ctrl_rxpipe_rxelecidlea(tmp_6548),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstandbystatus(tmp_6549),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstartblock(tmp_6550),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstatus({ tmp_6551, tmp_6552, tmp_6553 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxsyncheader({ tmp_6554, tmp_6555, tmp_6556, tmp_6557 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxvalid(tmp_6558)
        );

        tennm_sm_hssi_pcie_pcs_rx_demux #(
                .sel(x_mux_sm_hssi_pcie_pcs_rx_demux_1__sel)
        ) x_mux_sm_hssi_pcie_pcs_rx_demux_1 (
                .i_rxpipe_dirfeedback({ pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[5], pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[4], pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[3], pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[2], pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[1], pcie_pcs_lane_u1__o_rxpipe_dirfeedback_0[0] }),
                .i_rxpipe_linkevaluationfeedbackfiguremerit({ pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[7], pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[6], pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[5], pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[4], pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[3], pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[2], pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[1], pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit_0[0] }),
                .i_rxpipe_localfs({ pcie_pcs_lane_u1__o_rxpipe_localfs_0[5], pcie_pcs_lane_u1__o_rxpipe_localfs_0[4], pcie_pcs_lane_u1__o_rxpipe_localfs_0[3], pcie_pcs_lane_u1__o_rxpipe_localfs_0[2], pcie_pcs_lane_u1__o_rxpipe_localfs_0[1], pcie_pcs_lane_u1__o_rxpipe_localfs_0[0] }),
                .i_rxpipe_locallf({ pcie_pcs_lane_u1__o_rxpipe_locallf_0[5], pcie_pcs_lane_u1__o_rxpipe_locallf_0[4], pcie_pcs_lane_u1__o_rxpipe_locallf_0[3], pcie_pcs_lane_u1__o_rxpipe_locallf_0[2], pcie_pcs_lane_u1__o_rxpipe_locallf_0[1], pcie_pcs_lane_u1__o_rxpipe_locallf_0[0] }),
                .i_rxpipe_localtxcoefficientsvalid(pcie_pcs_lane_u1__o_rxpipe_localtxcoefficientsvalid_0),
                .i_rxpipe_localtxpresetcoefficients({ pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[17], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[16], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[15], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[14], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[13], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[12], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[11], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[10], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[9], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[8], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[7], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[6], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[5], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[4], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[3], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[2], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[1], pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients_0[0] }),
                .i_rxpipe_p2m_bus({ pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[7], pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[6], pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[5], pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[4], pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[3], pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[2], pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[1], pcie_pcs_lane_u1__o_rxpipe_p2m_bus_0[0] }),
                .i_rxpipe_pclkchangeok(pcie_pcs_lane_u1__o_rxpipe_pclkchangeok_0),
                .i_rxpipe_phystatus(pcie_pcs_lane_u1__o_rxpipe_phystatus_0),
                .i_rxpipe_rxdata({ pcie_pcs_lane_u1__o_rxpipe_rxdata_0[39], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[38], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[37], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[36], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[35], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[34], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[33], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[32], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[31], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[30], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[29], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[28], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[27], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[26], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[25], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[24], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[23], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[22], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[21], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[20], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[19], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[18], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[17], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[16], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[15], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[14], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[13], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[12], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[11], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[10], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[9], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[8], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[7], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[6], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[5], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[4], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[3], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[2], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[1], pcie_pcs_lane_u1__o_rxpipe_rxdata_0[0] }),
                .i_rxpipe_rxdatak({ pcie_pcs_lane_u1__o_rxpipe_rxdatak_0[3], pcie_pcs_lane_u1__o_rxpipe_rxdatak_0[2], pcie_pcs_lane_u1__o_rxpipe_rxdatak_0[1], pcie_pcs_lane_u1__o_rxpipe_rxdatak_0[0] }),
                .i_rxpipe_rxdatavalid(pcie_pcs_lane_u1__o_rxpipe_rxdatavalid_0),
                .i_rxpipe_rxelecidlea(pcie_pcs_lane_u1__o_rxpipe_rxelecidlea_0),
                .i_rxpipe_rxstandbystatus(pcie_pcs_lane_u1__o_rxpipe_rxstandbystatus_0),
                .i_rxpipe_rxstartblock(pcie_pcs_lane_u1__o_rxpipe_rxstartblock_0),
                .i_rxpipe_rxstatus({ pcie_pcs_lane_u1__o_rxpipe_rxstatus_0[2], pcie_pcs_lane_u1__o_rxpipe_rxstatus_0[1], pcie_pcs_lane_u1__o_rxpipe_rxstatus_0[0] }),
                .i_rxpipe_rxsyncheader({ pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0[3], pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0[2], pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0[1], pcie_pcs_lane_u1__o_rxpipe_rxsyncheader_0[0] }),
                .i_rxpipe_rxvalid(pcie_pcs_lane_u1__o_rxpipe_rxvalid_0),
                .o_hps_rxpipe_dirfeedback({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_dirfeedback_0[0] }),
                .o_hps_rxpipe_linkevaluationfeedbackfiguremerit({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[7], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[6], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[0] }),
                .o_hps_rxpipe_localfs({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localfs_0[0] }),
                .o_hps_rxpipe_locallf({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_locallf_0[0] }),
                .o_hps_rxpipe_localtxcoefficientsvalid(pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxcoefficientsvalid_0),
                .o_hps_rxpipe_localtxpresetcoefficients({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[17], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[16], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[15], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[14], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[13], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[12], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[11], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[10], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[9], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[8], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[7], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[6], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_localtxpresetcoefficients_0[0] }),
                .o_hps_rxpipe_p2m_bus({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[7], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[6], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_p2m_bus_0[0] }),
                .o_hps_rxpipe_pclkchangeok(pcie_pcs_rx_demux_u1__o_hps_rxpipe_pclkchangeok_0),
                .o_hps_rxpipe_phystatus(pcie_pcs_rx_demux_u1__o_hps_rxpipe_phystatus_0),
                .o_hps_rxpipe_rxdata({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[39], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[38], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[37], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[36], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[35], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[34], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[33], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[32], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[31], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[30], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[29], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[28], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[27], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[26], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[25], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[24], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[23], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[22], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[21], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[20], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[19], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[18], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[17], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[16], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[15], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[14], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[13], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[12], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[11], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[10], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[9], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[8], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[7], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[6], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[5], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[4], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdata_0[0] }),
                .o_hps_rxpipe_rxdatak({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatak_0[0] }),
                .o_hps_rxpipe_rxdatavalid(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxdatavalid_0),
                .o_hps_rxpipe_rxelecidlea(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxelecidlea_0),
                .o_hps_rxpipe_rxstandbystatus(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstandbystatus_0),
                .o_hps_rxpipe_rxstartblock(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstartblock_0),
                .o_hps_rxpipe_rxstatus({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstatus_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstatus_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxstatus_0[0] }),
                .o_hps_rxpipe_rxsyncheader({ pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0[3], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0[2], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0[1], pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxsyncheader_0[0] }),
                .o_hps_rxpipe_rxvalid(pcie_pcs_rx_demux_u1__o_hps_rxpipe_rxvalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_dirfeedback({ o_same_quad_rxpipe1_dirfeedback_0[5], o_same_quad_rxpipe1_dirfeedback_0[4], o_same_quad_rxpipe1_dirfeedback_0[3], o_same_quad_rxpipe1_dirfeedback_0[2], o_same_quad_rxpipe1_dirfeedback_0[1], o_same_quad_rxpipe1_dirfeedback_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit({ o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[7], o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[6], o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[5], o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[4], o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[3], o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[2], o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[1], o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_localfs({ o_same_quad_rxpipe1_localfs_0[5], o_same_quad_rxpipe1_localfs_0[4], o_same_quad_rxpipe1_localfs_0[3], o_same_quad_rxpipe1_localfs_0[2], o_same_quad_rxpipe1_localfs_0[1], o_same_quad_rxpipe1_localfs_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_locallf({ o_same_quad_rxpipe1_locallf_0[5], o_same_quad_rxpipe1_locallf_0[4], o_same_quad_rxpipe1_locallf_0[3], o_same_quad_rxpipe1_locallf_0[2], o_same_quad_rxpipe1_locallf_0[1], o_same_quad_rxpipe1_locallf_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(o_same_quad_rxpipe1_localtxcoefficientsvalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients({ o_same_quad_rxpipe1_localtxpresetcoefficients_0[17], o_same_quad_rxpipe1_localtxpresetcoefficients_0[16], o_same_quad_rxpipe1_localtxpresetcoefficients_0[15], o_same_quad_rxpipe1_localtxpresetcoefficients_0[14], o_same_quad_rxpipe1_localtxpresetcoefficients_0[13], o_same_quad_rxpipe1_localtxpresetcoefficients_0[12], o_same_quad_rxpipe1_localtxpresetcoefficients_0[11], o_same_quad_rxpipe1_localtxpresetcoefficients_0[10], o_same_quad_rxpipe1_localtxpresetcoefficients_0[9], o_same_quad_rxpipe1_localtxpresetcoefficients_0[8], o_same_quad_rxpipe1_localtxpresetcoefficients_0[7], o_same_quad_rxpipe1_localtxpresetcoefficients_0[6], o_same_quad_rxpipe1_localtxpresetcoefficients_0[5], o_same_quad_rxpipe1_localtxpresetcoefficients_0[4], o_same_quad_rxpipe1_localtxpresetcoefficients_0[3], o_same_quad_rxpipe1_localtxpresetcoefficients_0[2], o_same_quad_rxpipe1_localtxpresetcoefficients_0[1], o_same_quad_rxpipe1_localtxpresetcoefficients_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_p2m_bus({ o_same_quad_rxpipe1_p2m_bus_0[7], o_same_quad_rxpipe1_p2m_bus_0[6], o_same_quad_rxpipe1_p2m_bus_0[5], o_same_quad_rxpipe1_p2m_bus_0[4], o_same_quad_rxpipe1_p2m_bus_0[3], o_same_quad_rxpipe1_p2m_bus_0[2], o_same_quad_rxpipe1_p2m_bus_0[1], o_same_quad_rxpipe1_p2m_bus_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_pclkchangeok(o_same_quad_rxpipe1_pclkchangeok_0),
                .o_same_quad_pcie_ctrl_rxpipe_phystatus(o_same_quad_rxpipe1_phystatus_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxdata({ o_same_quad_rxpipe1_rxdata_0[39], o_same_quad_rxpipe1_rxdata_0[38], o_same_quad_rxpipe1_rxdata_0[37], o_same_quad_rxpipe1_rxdata_0[36], o_same_quad_rxpipe1_rxdata_0[35], o_same_quad_rxpipe1_rxdata_0[34], o_same_quad_rxpipe1_rxdata_0[33], o_same_quad_rxpipe1_rxdata_0[32], o_same_quad_rxpipe1_rxdata_0[31], o_same_quad_rxpipe1_rxdata_0[30], o_same_quad_rxpipe1_rxdata_0[29], o_same_quad_rxpipe1_rxdata_0[28], o_same_quad_rxpipe1_rxdata_0[27], o_same_quad_rxpipe1_rxdata_0[26], o_same_quad_rxpipe1_rxdata_0[25], o_same_quad_rxpipe1_rxdata_0[24], o_same_quad_rxpipe1_rxdata_0[23], o_same_quad_rxpipe1_rxdata_0[22], o_same_quad_rxpipe1_rxdata_0[21], o_same_quad_rxpipe1_rxdata_0[20], o_same_quad_rxpipe1_rxdata_0[19], o_same_quad_rxpipe1_rxdata_0[18], o_same_quad_rxpipe1_rxdata_0[17], o_same_quad_rxpipe1_rxdata_0[16], o_same_quad_rxpipe1_rxdata_0[15], o_same_quad_rxpipe1_rxdata_0[14], o_same_quad_rxpipe1_rxdata_0[13], o_same_quad_rxpipe1_rxdata_0[12], o_same_quad_rxpipe1_rxdata_0[11], o_same_quad_rxpipe1_rxdata_0[10], o_same_quad_rxpipe1_rxdata_0[9], o_same_quad_rxpipe1_rxdata_0[8], o_same_quad_rxpipe1_rxdata_0[7], o_same_quad_rxpipe1_rxdata_0[6], o_same_quad_rxpipe1_rxdata_0[5], o_same_quad_rxpipe1_rxdata_0[4], o_same_quad_rxpipe1_rxdata_0[3], o_same_quad_rxpipe1_rxdata_0[2], o_same_quad_rxpipe1_rxdata_0[1], o_same_quad_rxpipe1_rxdata_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxdatak({ o_same_quad_rxpipe1_rxdatak_0[3], o_same_quad_rxpipe1_rxdatak_0[2], o_same_quad_rxpipe1_rxdatak_0[1], o_same_quad_rxpipe1_rxdatak_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxdatavalid(o_same_quad_rxpipe1_rxdatavalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxelecidlea(o_same_quad_rxpipe1_rxelecidlea_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstandbystatus(o_same_quad_rxpipe1_rxstandbystatus_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstartblock(o_same_quad_rxpipe1_rxstartblock_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstatus({ o_same_quad_rxpipe1_rxstatus_0[2], o_same_quad_rxpipe1_rxstatus_0[1], o_same_quad_rxpipe1_rxstatus_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxsyncheader({ o_same_quad_rxpipe1_rxsyncheader_0[3], o_same_quad_rxpipe1_rxsyncheader_0[2], o_same_quad_rxpipe1_rxsyncheader_0[1], o_same_quad_rxpipe1_rxsyncheader_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxvalid(o_same_quad_rxpipe1_rxvalid_0),
                .o_unused_rxpipe_dirfeedback({ tmp_6559, tmp_6560, tmp_6561, tmp_6562, tmp_6563, tmp_6564 }),
                .o_unused_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_6565, tmp_6566, tmp_6567, tmp_6568, tmp_6569, tmp_6570, tmp_6571, tmp_6572 }),
                .o_unused_rxpipe_localfs({ tmp_6573, tmp_6574, tmp_6575, tmp_6576, tmp_6577, tmp_6578 }),
                .o_unused_rxpipe_locallf({ tmp_6579, tmp_6580, tmp_6581, tmp_6582, tmp_6583, tmp_6584 }),
                .o_unused_rxpipe_localtxcoefficientsvalid(tmp_6585),
                .o_unused_rxpipe_localtxpresetcoefficients({ tmp_6586, tmp_6587, tmp_6588, tmp_6589, tmp_6590, tmp_6591, tmp_6592, tmp_6593, tmp_6594, tmp_6595, tmp_6596, tmp_6597, tmp_6598, tmp_6599, tmp_6600, tmp_6601, tmp_6602, tmp_6603 }),
                .o_unused_rxpipe_p2m_bus({ tmp_6604, tmp_6605, tmp_6606, tmp_6607, tmp_6608, tmp_6609, tmp_6610, tmp_6611 }),
                .o_unused_rxpipe_pclkchangeok(tmp_6612),
                .o_unused_rxpipe_phystatus(tmp_6613),
                .o_unused_rxpipe_rxdata({ tmp_6614, tmp_6615, tmp_6616, tmp_6617, tmp_6618, tmp_6619, tmp_6620, tmp_6621, tmp_6622, tmp_6623, tmp_6624, tmp_6625, tmp_6626, tmp_6627, tmp_6628, tmp_6629, tmp_6630, tmp_6631, tmp_6632, tmp_6633, tmp_6634, tmp_6635, tmp_6636, tmp_6637, tmp_6638, tmp_6639, tmp_6640, tmp_6641, tmp_6642, tmp_6643, tmp_6644, tmp_6645, tmp_6646, tmp_6647, tmp_6648, tmp_6649, tmp_6650, tmp_6651, tmp_6652, tmp_6653 }),
                .o_unused_rxpipe_rxdatak({ tmp_6654, tmp_6655, tmp_6656, tmp_6657 }),
                .o_unused_rxpipe_rxdatavalid(tmp_6658),
                .o_unused_rxpipe_rxelecidlea(tmp_6659),
                .o_unused_rxpipe_rxstandbystatus(tmp_6660),
                .o_unused_rxpipe_rxstartblock(tmp_6661),
                .o_unused_rxpipe_rxstatus({ tmp_6662, tmp_6663, tmp_6664 }),
                .o_unused_rxpipe_rxsyncheader({ tmp_6665, tmp_6666, tmp_6667, tmp_6668 }),
                .o_unused_rxpipe_rxvalid(tmp_6669),
                .o_upper_quad_pcie_ctrl_rxpipe_dirfeedback({ tmp_6670, tmp_6671, tmp_6672, tmp_6673, tmp_6674, tmp_6675 }),
                .o_upper_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_6676, tmp_6677, tmp_6678, tmp_6679, tmp_6680, tmp_6681, tmp_6682, tmp_6683 }),
                .o_upper_quad_pcie_ctrl_rxpipe_localfs({ tmp_6684, tmp_6685, tmp_6686, tmp_6687, tmp_6688, tmp_6689 }),
                .o_upper_quad_pcie_ctrl_rxpipe_locallf({ tmp_6690, tmp_6691, tmp_6692, tmp_6693, tmp_6694, tmp_6695 }),
                .o_upper_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(tmp_6696),
                .o_upper_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients({ tmp_6697, tmp_6698, tmp_6699, tmp_6700, tmp_6701, tmp_6702, tmp_6703, tmp_6704, tmp_6705, tmp_6706, tmp_6707, tmp_6708, tmp_6709, tmp_6710, tmp_6711, tmp_6712, tmp_6713, tmp_6714 }),
                .o_upper_quad_pcie_ctrl_rxpipe_p2m_bus({ tmp_6715, tmp_6716, tmp_6717, tmp_6718, tmp_6719, tmp_6720, tmp_6721, tmp_6722 }),
                .o_upper_quad_pcie_ctrl_rxpipe_pclkchangeok(tmp_6723),
                .o_upper_quad_pcie_ctrl_rxpipe_phystatus(tmp_6724),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdata({ tmp_6725, tmp_6726, tmp_6727, tmp_6728, tmp_6729, tmp_6730, tmp_6731, tmp_6732, tmp_6733, tmp_6734, tmp_6735, tmp_6736, tmp_6737, tmp_6738, tmp_6739, tmp_6740, tmp_6741, tmp_6742, tmp_6743, tmp_6744, tmp_6745, tmp_6746, tmp_6747, tmp_6748, tmp_6749, tmp_6750, tmp_6751, tmp_6752, tmp_6753, tmp_6754, tmp_6755, tmp_6756, tmp_6757, tmp_6758, tmp_6759, tmp_6760, tmp_6761, tmp_6762, tmp_6763, tmp_6764 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdatak({ tmp_6765, tmp_6766, tmp_6767, tmp_6768 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdatavalid(tmp_6769),
                .o_upper_quad_pcie_ctrl_rxpipe_rxelecidlea(tmp_6770),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstandbystatus(tmp_6771),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstartblock(tmp_6772),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstatus({ tmp_6773, tmp_6774, tmp_6775 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxsyncheader({ tmp_6776, tmp_6777, tmp_6778, tmp_6779 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxvalid(tmp_6780)
        );

        tennm_sm_hssi_pcie_pcs_rx_demux #(
                .sel(x_mux_sm_hssi_pcie_pcs_rx_demux_2__sel)
        ) x_mux_sm_hssi_pcie_pcs_rx_demux_2 (
                .i_rxpipe_dirfeedback({ pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[5], pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[4], pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[3], pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[2], pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[1], pcie_pcs_lane_u2__o_rxpipe_dirfeedback_0[0] }),
                .i_rxpipe_linkevaluationfeedbackfiguremerit({ pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[7], pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[6], pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[5], pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[4], pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[3], pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[2], pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[1], pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit_0[0] }),
                .i_rxpipe_localfs({ pcie_pcs_lane_u2__o_rxpipe_localfs_0[5], pcie_pcs_lane_u2__o_rxpipe_localfs_0[4], pcie_pcs_lane_u2__o_rxpipe_localfs_0[3], pcie_pcs_lane_u2__o_rxpipe_localfs_0[2], pcie_pcs_lane_u2__o_rxpipe_localfs_0[1], pcie_pcs_lane_u2__o_rxpipe_localfs_0[0] }),
                .i_rxpipe_locallf({ pcie_pcs_lane_u2__o_rxpipe_locallf_0[5], pcie_pcs_lane_u2__o_rxpipe_locallf_0[4], pcie_pcs_lane_u2__o_rxpipe_locallf_0[3], pcie_pcs_lane_u2__o_rxpipe_locallf_0[2], pcie_pcs_lane_u2__o_rxpipe_locallf_0[1], pcie_pcs_lane_u2__o_rxpipe_locallf_0[0] }),
                .i_rxpipe_localtxcoefficientsvalid(pcie_pcs_lane_u2__o_rxpipe_localtxcoefficientsvalid_0),
                .i_rxpipe_localtxpresetcoefficients({ pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[17], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[16], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[15], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[14], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[13], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[12], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[11], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[10], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[9], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[8], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[7], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[6], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[5], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[4], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[3], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[2], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[1], pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients_0[0] }),
                .i_rxpipe_p2m_bus({ pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[7], pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[6], pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[5], pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[4], pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[3], pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[2], pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[1], pcie_pcs_lane_u2__o_rxpipe_p2m_bus_0[0] }),
                .i_rxpipe_pclkchangeok(pcie_pcs_lane_u2__o_rxpipe_pclkchangeok_0),
                .i_rxpipe_phystatus(pcie_pcs_lane_u2__o_rxpipe_phystatus_0),
                .i_rxpipe_rxdata({ pcie_pcs_lane_u2__o_rxpipe_rxdata_0[39], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[38], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[37], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[36], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[35], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[34], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[33], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[32], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[31], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[30], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[29], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[28], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[27], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[26], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[25], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[24], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[23], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[22], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[21], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[20], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[19], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[18], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[17], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[16], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[15], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[14], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[13], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[12], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[11], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[10], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[9], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[8], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[7], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[6], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[5], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[4], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[3], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[2], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[1], pcie_pcs_lane_u2__o_rxpipe_rxdata_0[0] }),
                .i_rxpipe_rxdatak({ pcie_pcs_lane_u2__o_rxpipe_rxdatak_0[3], pcie_pcs_lane_u2__o_rxpipe_rxdatak_0[2], pcie_pcs_lane_u2__o_rxpipe_rxdatak_0[1], pcie_pcs_lane_u2__o_rxpipe_rxdatak_0[0] }),
                .i_rxpipe_rxdatavalid(pcie_pcs_lane_u2__o_rxpipe_rxdatavalid_0),
                .i_rxpipe_rxelecidlea(pcie_pcs_lane_u2__o_rxpipe_rxelecidlea_0),
                .i_rxpipe_rxstandbystatus(pcie_pcs_lane_u2__o_rxpipe_rxstandbystatus_0),
                .i_rxpipe_rxstartblock(pcie_pcs_lane_u2__o_rxpipe_rxstartblock_0),
                .i_rxpipe_rxstatus({ pcie_pcs_lane_u2__o_rxpipe_rxstatus_0[2], pcie_pcs_lane_u2__o_rxpipe_rxstatus_0[1], pcie_pcs_lane_u2__o_rxpipe_rxstatus_0[0] }),
                .i_rxpipe_rxsyncheader({ pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0[3], pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0[2], pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0[1], pcie_pcs_lane_u2__o_rxpipe_rxsyncheader_0[0] }),
                .i_rxpipe_rxvalid(pcie_pcs_lane_u2__o_rxpipe_rxvalid_0),
                .o_hps_rxpipe_dirfeedback({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_dirfeedback_0[0] }),
                .o_hps_rxpipe_linkevaluationfeedbackfiguremerit({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[7], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[6], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_linkevaluationfeedbackfiguremerit_0[0] }),
                .o_hps_rxpipe_localfs({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localfs_0[0] }),
                .o_hps_rxpipe_locallf({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_locallf_0[0] }),
                .o_hps_rxpipe_localtxcoefficientsvalid(pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxcoefficientsvalid_0),
                .o_hps_rxpipe_localtxpresetcoefficients({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[17], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[16], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[15], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[14], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[13], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[12], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[11], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[10], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[9], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[8], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[7], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[6], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_localtxpresetcoefficients_0[0] }),
                .o_hps_rxpipe_p2m_bus({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[7], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[6], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_p2m_bus_0[0] }),
                .o_hps_rxpipe_pclkchangeok(pcie_pcs_rx_demux_u2__o_hps_rxpipe_pclkchangeok_0),
                .o_hps_rxpipe_phystatus(pcie_pcs_rx_demux_u2__o_hps_rxpipe_phystatus_0),
                .o_hps_rxpipe_rxdata({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[39], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[38], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[37], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[36], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[35], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[34], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[33], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[32], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[31], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[30], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[29], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[28], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[27], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[26], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[25], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[24], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[23], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[22], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[21], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[20], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[19], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[18], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[17], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[16], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[15], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[14], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[13], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[12], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[11], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[10], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[9], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[8], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[7], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[6], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[5], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[4], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdata_0[0] }),
                .o_hps_rxpipe_rxdatak({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatak_0[0] }),
                .o_hps_rxpipe_rxdatavalid(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxdatavalid_0),
                .o_hps_rxpipe_rxelecidlea(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxelecidlea_0),
                .o_hps_rxpipe_rxstandbystatus(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstandbystatus_0),
                .o_hps_rxpipe_rxstartblock(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstartblock_0),
                .o_hps_rxpipe_rxstatus({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstatus_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstatus_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxstatus_0[0] }),
                .o_hps_rxpipe_rxsyncheader({ pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0[3], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0[2], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0[1], pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxsyncheader_0[0] }),
                .o_hps_rxpipe_rxvalid(pcie_pcs_rx_demux_u2__o_hps_rxpipe_rxvalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_dirfeedback({ o_same_quad_rxpipe2_dirfeedback_0[5], o_same_quad_rxpipe2_dirfeedback_0[4], o_same_quad_rxpipe2_dirfeedback_0[3], o_same_quad_rxpipe2_dirfeedback_0[2], o_same_quad_rxpipe2_dirfeedback_0[1], o_same_quad_rxpipe2_dirfeedback_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit({ o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[7], o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[6], o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[5], o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[4], o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[3], o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[2], o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[1], o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_localfs({ o_same_quad_rxpipe2_localfs_0[5], o_same_quad_rxpipe2_localfs_0[4], o_same_quad_rxpipe2_localfs_0[3], o_same_quad_rxpipe2_localfs_0[2], o_same_quad_rxpipe2_localfs_0[1], o_same_quad_rxpipe2_localfs_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_locallf({ o_same_quad_rxpipe2_locallf_0[5], o_same_quad_rxpipe2_locallf_0[4], o_same_quad_rxpipe2_locallf_0[3], o_same_quad_rxpipe2_locallf_0[2], o_same_quad_rxpipe2_locallf_0[1], o_same_quad_rxpipe2_locallf_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(o_same_quad_rxpipe2_localtxcoefficientsvalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients({ o_same_quad_rxpipe2_localtxpresetcoefficients_0[17], o_same_quad_rxpipe2_localtxpresetcoefficients_0[16], o_same_quad_rxpipe2_localtxpresetcoefficients_0[15], o_same_quad_rxpipe2_localtxpresetcoefficients_0[14], o_same_quad_rxpipe2_localtxpresetcoefficients_0[13], o_same_quad_rxpipe2_localtxpresetcoefficients_0[12], o_same_quad_rxpipe2_localtxpresetcoefficients_0[11], o_same_quad_rxpipe2_localtxpresetcoefficients_0[10], o_same_quad_rxpipe2_localtxpresetcoefficients_0[9], o_same_quad_rxpipe2_localtxpresetcoefficients_0[8], o_same_quad_rxpipe2_localtxpresetcoefficients_0[7], o_same_quad_rxpipe2_localtxpresetcoefficients_0[6], o_same_quad_rxpipe2_localtxpresetcoefficients_0[5], o_same_quad_rxpipe2_localtxpresetcoefficients_0[4], o_same_quad_rxpipe2_localtxpresetcoefficients_0[3], o_same_quad_rxpipe2_localtxpresetcoefficients_0[2], o_same_quad_rxpipe2_localtxpresetcoefficients_0[1], o_same_quad_rxpipe2_localtxpresetcoefficients_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_p2m_bus({ o_same_quad_rxpipe2_p2m_bus_0[7], o_same_quad_rxpipe2_p2m_bus_0[6], o_same_quad_rxpipe2_p2m_bus_0[5], o_same_quad_rxpipe2_p2m_bus_0[4], o_same_quad_rxpipe2_p2m_bus_0[3], o_same_quad_rxpipe2_p2m_bus_0[2], o_same_quad_rxpipe2_p2m_bus_0[1], o_same_quad_rxpipe2_p2m_bus_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_pclkchangeok(o_same_quad_rxpipe2_pclkchangeok_0),
                .o_same_quad_pcie_ctrl_rxpipe_phystatus(o_same_quad_rxpipe2_phystatus_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxdata({ o_same_quad_rxpipe2_rxdata_0[39], o_same_quad_rxpipe2_rxdata_0[38], o_same_quad_rxpipe2_rxdata_0[37], o_same_quad_rxpipe2_rxdata_0[36], o_same_quad_rxpipe2_rxdata_0[35], o_same_quad_rxpipe2_rxdata_0[34], o_same_quad_rxpipe2_rxdata_0[33], o_same_quad_rxpipe2_rxdata_0[32], o_same_quad_rxpipe2_rxdata_0[31], o_same_quad_rxpipe2_rxdata_0[30], o_same_quad_rxpipe2_rxdata_0[29], o_same_quad_rxpipe2_rxdata_0[28], o_same_quad_rxpipe2_rxdata_0[27], o_same_quad_rxpipe2_rxdata_0[26], o_same_quad_rxpipe2_rxdata_0[25], o_same_quad_rxpipe2_rxdata_0[24], o_same_quad_rxpipe2_rxdata_0[23], o_same_quad_rxpipe2_rxdata_0[22], o_same_quad_rxpipe2_rxdata_0[21], o_same_quad_rxpipe2_rxdata_0[20], o_same_quad_rxpipe2_rxdata_0[19], o_same_quad_rxpipe2_rxdata_0[18], o_same_quad_rxpipe2_rxdata_0[17], o_same_quad_rxpipe2_rxdata_0[16], o_same_quad_rxpipe2_rxdata_0[15], o_same_quad_rxpipe2_rxdata_0[14], o_same_quad_rxpipe2_rxdata_0[13], o_same_quad_rxpipe2_rxdata_0[12], o_same_quad_rxpipe2_rxdata_0[11], o_same_quad_rxpipe2_rxdata_0[10], o_same_quad_rxpipe2_rxdata_0[9], o_same_quad_rxpipe2_rxdata_0[8], o_same_quad_rxpipe2_rxdata_0[7], o_same_quad_rxpipe2_rxdata_0[6], o_same_quad_rxpipe2_rxdata_0[5], o_same_quad_rxpipe2_rxdata_0[4], o_same_quad_rxpipe2_rxdata_0[3], o_same_quad_rxpipe2_rxdata_0[2], o_same_quad_rxpipe2_rxdata_0[1], o_same_quad_rxpipe2_rxdata_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxdatak({ o_same_quad_rxpipe2_rxdatak_0[3], o_same_quad_rxpipe2_rxdatak_0[2], o_same_quad_rxpipe2_rxdatak_0[1], o_same_quad_rxpipe2_rxdatak_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxdatavalid(o_same_quad_rxpipe2_rxdatavalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxelecidlea(o_same_quad_rxpipe2_rxelecidlea_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstandbystatus(o_same_quad_rxpipe2_rxstandbystatus_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstartblock(o_same_quad_rxpipe2_rxstartblock_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstatus({ o_same_quad_rxpipe2_rxstatus_0[2], o_same_quad_rxpipe2_rxstatus_0[1], o_same_quad_rxpipe2_rxstatus_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxsyncheader({ o_same_quad_rxpipe2_rxsyncheader_0[3], o_same_quad_rxpipe2_rxsyncheader_0[2], o_same_quad_rxpipe2_rxsyncheader_0[1], o_same_quad_rxpipe2_rxsyncheader_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxvalid(o_same_quad_rxpipe2_rxvalid_0),
                .o_unused_rxpipe_dirfeedback({ tmp_6781, tmp_6782, tmp_6783, tmp_6784, tmp_6785, tmp_6786 }),
                .o_unused_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_6787, tmp_6788, tmp_6789, tmp_6790, tmp_6791, tmp_6792, tmp_6793, tmp_6794 }),
                .o_unused_rxpipe_localfs({ tmp_6795, tmp_6796, tmp_6797, tmp_6798, tmp_6799, tmp_6800 }),
                .o_unused_rxpipe_locallf({ tmp_6801, tmp_6802, tmp_6803, tmp_6804, tmp_6805, tmp_6806 }),
                .o_unused_rxpipe_localtxcoefficientsvalid(tmp_6807),
                .o_unused_rxpipe_localtxpresetcoefficients({ tmp_6808, tmp_6809, tmp_6810, tmp_6811, tmp_6812, tmp_6813, tmp_6814, tmp_6815, tmp_6816, tmp_6817, tmp_6818, tmp_6819, tmp_6820, tmp_6821, tmp_6822, tmp_6823, tmp_6824, tmp_6825 }),
                .o_unused_rxpipe_p2m_bus({ tmp_6826, tmp_6827, tmp_6828, tmp_6829, tmp_6830, tmp_6831, tmp_6832, tmp_6833 }),
                .o_unused_rxpipe_pclkchangeok(tmp_6834),
                .o_unused_rxpipe_phystatus(tmp_6835),
                .o_unused_rxpipe_rxdata({ tmp_6836, tmp_6837, tmp_6838, tmp_6839, tmp_6840, tmp_6841, tmp_6842, tmp_6843, tmp_6844, tmp_6845, tmp_6846, tmp_6847, tmp_6848, tmp_6849, tmp_6850, tmp_6851, tmp_6852, tmp_6853, tmp_6854, tmp_6855, tmp_6856, tmp_6857, tmp_6858, tmp_6859, tmp_6860, tmp_6861, tmp_6862, tmp_6863, tmp_6864, tmp_6865, tmp_6866, tmp_6867, tmp_6868, tmp_6869, tmp_6870, tmp_6871, tmp_6872, tmp_6873, tmp_6874, tmp_6875 }),
                .o_unused_rxpipe_rxdatak({ tmp_6876, tmp_6877, tmp_6878, tmp_6879 }),
                .o_unused_rxpipe_rxdatavalid(tmp_6880),
                .o_unused_rxpipe_rxelecidlea(tmp_6881),
                .o_unused_rxpipe_rxstandbystatus(tmp_6882),
                .o_unused_rxpipe_rxstartblock(tmp_6883),
                .o_unused_rxpipe_rxstatus({ tmp_6884, tmp_6885, tmp_6886 }),
                .o_unused_rxpipe_rxsyncheader({ tmp_6887, tmp_6888, tmp_6889, tmp_6890 }),
                .o_unused_rxpipe_rxvalid(tmp_6891),
                .o_upper_quad_pcie_ctrl_rxpipe_dirfeedback({ tmp_6892, tmp_6893, tmp_6894, tmp_6895, tmp_6896, tmp_6897 }),
                .o_upper_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_6898, tmp_6899, tmp_6900, tmp_6901, tmp_6902, tmp_6903, tmp_6904, tmp_6905 }),
                .o_upper_quad_pcie_ctrl_rxpipe_localfs({ tmp_6906, tmp_6907, tmp_6908, tmp_6909, tmp_6910, tmp_6911 }),
                .o_upper_quad_pcie_ctrl_rxpipe_locallf({ tmp_6912, tmp_6913, tmp_6914, tmp_6915, tmp_6916, tmp_6917 }),
                .o_upper_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(tmp_6918),
                .o_upper_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients({ tmp_6919, tmp_6920, tmp_6921, tmp_6922, tmp_6923, tmp_6924, tmp_6925, tmp_6926, tmp_6927, tmp_6928, tmp_6929, tmp_6930, tmp_6931, tmp_6932, tmp_6933, tmp_6934, tmp_6935, tmp_6936 }),
                .o_upper_quad_pcie_ctrl_rxpipe_p2m_bus({ tmp_6937, tmp_6938, tmp_6939, tmp_6940, tmp_6941, tmp_6942, tmp_6943, tmp_6944 }),
                .o_upper_quad_pcie_ctrl_rxpipe_pclkchangeok(tmp_6945),
                .o_upper_quad_pcie_ctrl_rxpipe_phystatus(tmp_6946),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdata({ tmp_6947, tmp_6948, tmp_6949, tmp_6950, tmp_6951, tmp_6952, tmp_6953, tmp_6954, tmp_6955, tmp_6956, tmp_6957, tmp_6958, tmp_6959, tmp_6960, tmp_6961, tmp_6962, tmp_6963, tmp_6964, tmp_6965, tmp_6966, tmp_6967, tmp_6968, tmp_6969, tmp_6970, tmp_6971, tmp_6972, tmp_6973, tmp_6974, tmp_6975, tmp_6976, tmp_6977, tmp_6978, tmp_6979, tmp_6980, tmp_6981, tmp_6982, tmp_6983, tmp_6984, tmp_6985, tmp_6986 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdatak({ tmp_6987, tmp_6988, tmp_6989, tmp_6990 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdatavalid(tmp_6991),
                .o_upper_quad_pcie_ctrl_rxpipe_rxelecidlea(tmp_6992),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstandbystatus(tmp_6993),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstartblock(tmp_6994),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstatus({ tmp_6995, tmp_6996, tmp_6997 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxsyncheader({ tmp_6998, tmp_6999, tmp_7000, tmp_7001 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxvalid(tmp_7002)
        );

        tennm_sm_hssi_pcie_pcs_rx_demux #(
                .sel(x_mux_sm_hssi_pcie_pcs_rx_demux_3__sel)
        ) x_mux_sm_hssi_pcie_pcs_rx_demux_3 (
                .i_rxpipe_dirfeedback({ pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[5], pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[4], pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[3], pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[2], pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[1], pcie_pcs_lane_u3__o_rxpipe_dirfeedback_0[0] }),
                .i_rxpipe_linkevaluationfeedbackfiguremerit({ pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[7], pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[6], pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[5], pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[4], pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[3], pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[2], pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[1], pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit_0[0] }),
                .i_rxpipe_localfs({ pcie_pcs_lane_u3__o_rxpipe_localfs_0[5], pcie_pcs_lane_u3__o_rxpipe_localfs_0[4], pcie_pcs_lane_u3__o_rxpipe_localfs_0[3], pcie_pcs_lane_u3__o_rxpipe_localfs_0[2], pcie_pcs_lane_u3__o_rxpipe_localfs_0[1], pcie_pcs_lane_u3__o_rxpipe_localfs_0[0] }),
                .i_rxpipe_locallf({ pcie_pcs_lane_u3__o_rxpipe_locallf_0[5], pcie_pcs_lane_u3__o_rxpipe_locallf_0[4], pcie_pcs_lane_u3__o_rxpipe_locallf_0[3], pcie_pcs_lane_u3__o_rxpipe_locallf_0[2], pcie_pcs_lane_u3__o_rxpipe_locallf_0[1], pcie_pcs_lane_u3__o_rxpipe_locallf_0[0] }),
                .i_rxpipe_localtxcoefficientsvalid(pcie_pcs_lane_u3__o_rxpipe_localtxcoefficientsvalid_0),
                .i_rxpipe_localtxpresetcoefficients({ pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[17], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[16], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[15], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[14], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[13], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[12], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[11], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[10], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[9], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[8], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[7], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[6], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[5], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[4], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[3], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[2], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[1], pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients_0[0] }),
                .i_rxpipe_p2m_bus({ pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[7], pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[6], pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[5], pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[4], pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[3], pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[2], pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[1], pcie_pcs_lane_u3__o_rxpipe_p2m_bus_0[0] }),
                .i_rxpipe_pclkchangeok(pcie_pcs_lane_u3__o_rxpipe_pclkchangeok_0),
                .i_rxpipe_phystatus(pcie_pcs_lane_u3__o_rxpipe_phystatus_0),
                .i_rxpipe_rxdata({ pcie_pcs_lane_u3__o_rxpipe_rxdata_0[39], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[38], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[37], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[36], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[35], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[34], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[33], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[32], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[31], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[30], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[29], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[28], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[27], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[26], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[25], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[24], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[23], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[22], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[21], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[20], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[19], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[18], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[17], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[16], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[15], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[14], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[13], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[12], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[11], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[10], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[9], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[8], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[7], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[6], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[5], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[4], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[3], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[2], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[1], pcie_pcs_lane_u3__o_rxpipe_rxdata_0[0] }),
                .i_rxpipe_rxdatak({ pcie_pcs_lane_u3__o_rxpipe_rxdatak_0[3], pcie_pcs_lane_u3__o_rxpipe_rxdatak_0[2], pcie_pcs_lane_u3__o_rxpipe_rxdatak_0[1], pcie_pcs_lane_u3__o_rxpipe_rxdatak_0[0] }),
                .i_rxpipe_rxdatavalid(pcie_pcs_lane_u3__o_rxpipe_rxdatavalid_0),
                .i_rxpipe_rxelecidlea(pcie_pcs_lane_u3__o_rxpipe_rxelecidlea_0),
                .i_rxpipe_rxstandbystatus(pcie_pcs_lane_u3__o_rxpipe_rxstandbystatus_0),
                .i_rxpipe_rxstartblock(pcie_pcs_lane_u3__o_rxpipe_rxstartblock_0),
                .i_rxpipe_rxstatus({ pcie_pcs_lane_u3__o_rxpipe_rxstatus_0[2], pcie_pcs_lane_u3__o_rxpipe_rxstatus_0[1], pcie_pcs_lane_u3__o_rxpipe_rxstatus_0[0] }),
                .i_rxpipe_rxsyncheader({ pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0[3], pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0[2], pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0[1], pcie_pcs_lane_u3__o_rxpipe_rxsyncheader_0[0] }),
                .i_rxpipe_rxvalid(pcie_pcs_lane_u3__o_rxpipe_rxvalid_0),
                .o_hps_rxpipe_dirfeedback({ tmp_7003, tmp_7004, tmp_7005, tmp_7006, tmp_7007, tmp_7008 }),
                .o_hps_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_7009, tmp_7010, tmp_7011, tmp_7012, tmp_7013, tmp_7014, tmp_7015, tmp_7016 }),
                .o_hps_rxpipe_localfs({ tmp_7017, tmp_7018, tmp_7019, tmp_7020, tmp_7021, tmp_7022 }),
                .o_hps_rxpipe_locallf({ tmp_7023, tmp_7024, tmp_7025, tmp_7026, tmp_7027, tmp_7028 }),
                .o_hps_rxpipe_localtxcoefficientsvalid(tmp_7029),
                .o_hps_rxpipe_localtxpresetcoefficients({ tmp_7030, tmp_7031, tmp_7032, tmp_7033, tmp_7034, tmp_7035, tmp_7036, tmp_7037, tmp_7038, tmp_7039, tmp_7040, tmp_7041, tmp_7042, tmp_7043, tmp_7044, tmp_7045, tmp_7046, tmp_7047 }),
                .o_hps_rxpipe_p2m_bus({ tmp_7048, tmp_7049, tmp_7050, tmp_7051, tmp_7052, tmp_7053, tmp_7054, tmp_7055 }),
                .o_hps_rxpipe_pclkchangeok(tmp_7056),
                .o_hps_rxpipe_phystatus(tmp_7057),
                .o_hps_rxpipe_rxdata({ tmp_7058, tmp_7059, tmp_7060, tmp_7061, tmp_7062, tmp_7063, tmp_7064, tmp_7065, tmp_7066, tmp_7067, tmp_7068, tmp_7069, tmp_7070, tmp_7071, tmp_7072, tmp_7073, tmp_7074, tmp_7075, tmp_7076, tmp_7077, tmp_7078, tmp_7079, tmp_7080, tmp_7081, tmp_7082, tmp_7083, tmp_7084, tmp_7085, tmp_7086, tmp_7087, tmp_7088, tmp_7089, tmp_7090, tmp_7091, tmp_7092, tmp_7093, tmp_7094, tmp_7095, tmp_7096, tmp_7097 }),
                .o_hps_rxpipe_rxdatak({ tmp_7098, tmp_7099, tmp_7100, tmp_7101 }),
                .o_hps_rxpipe_rxdatavalid(tmp_7102),
                .o_hps_rxpipe_rxelecidlea(tmp_7103),
                .o_hps_rxpipe_rxstandbystatus(tmp_7104),
                .o_hps_rxpipe_rxstartblock(tmp_7105),
                .o_hps_rxpipe_rxstatus({ tmp_7106, tmp_7107, tmp_7108 }),
                .o_hps_rxpipe_rxsyncheader({ tmp_7109, tmp_7110, tmp_7111, tmp_7112 }),
                .o_hps_rxpipe_rxvalid(tmp_7113),
                .o_same_quad_pcie_ctrl_rxpipe_dirfeedback({ o_same_quad_rxpipe3_dirfeedback_0[5], o_same_quad_rxpipe3_dirfeedback_0[4], o_same_quad_rxpipe3_dirfeedback_0[3], o_same_quad_rxpipe3_dirfeedback_0[2], o_same_quad_rxpipe3_dirfeedback_0[1], o_same_quad_rxpipe3_dirfeedback_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit({ o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[7], o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[6], o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[5], o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[4], o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[3], o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[2], o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[1], o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_localfs({ o_same_quad_rxpipe3_localfs_0[5], o_same_quad_rxpipe3_localfs_0[4], o_same_quad_rxpipe3_localfs_0[3], o_same_quad_rxpipe3_localfs_0[2], o_same_quad_rxpipe3_localfs_0[1], o_same_quad_rxpipe3_localfs_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_locallf({ o_same_quad_rxpipe3_locallf_0[5], o_same_quad_rxpipe3_locallf_0[4], o_same_quad_rxpipe3_locallf_0[3], o_same_quad_rxpipe3_locallf_0[2], o_same_quad_rxpipe3_locallf_0[1], o_same_quad_rxpipe3_locallf_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(o_same_quad_rxpipe3_localtxcoefficientsvalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients({ o_same_quad_rxpipe3_localtxpresetcoefficients_0[17], o_same_quad_rxpipe3_localtxpresetcoefficients_0[16], o_same_quad_rxpipe3_localtxpresetcoefficients_0[15], o_same_quad_rxpipe3_localtxpresetcoefficients_0[14], o_same_quad_rxpipe3_localtxpresetcoefficients_0[13], o_same_quad_rxpipe3_localtxpresetcoefficients_0[12], o_same_quad_rxpipe3_localtxpresetcoefficients_0[11], o_same_quad_rxpipe3_localtxpresetcoefficients_0[10], o_same_quad_rxpipe3_localtxpresetcoefficients_0[9], o_same_quad_rxpipe3_localtxpresetcoefficients_0[8], o_same_quad_rxpipe3_localtxpresetcoefficients_0[7], o_same_quad_rxpipe3_localtxpresetcoefficients_0[6], o_same_quad_rxpipe3_localtxpresetcoefficients_0[5], o_same_quad_rxpipe3_localtxpresetcoefficients_0[4], o_same_quad_rxpipe3_localtxpresetcoefficients_0[3], o_same_quad_rxpipe3_localtxpresetcoefficients_0[2], o_same_quad_rxpipe3_localtxpresetcoefficients_0[1], o_same_quad_rxpipe3_localtxpresetcoefficients_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_p2m_bus({ o_same_quad_rxpipe3_p2m_bus_0[7], o_same_quad_rxpipe3_p2m_bus_0[6], o_same_quad_rxpipe3_p2m_bus_0[5], o_same_quad_rxpipe3_p2m_bus_0[4], o_same_quad_rxpipe3_p2m_bus_0[3], o_same_quad_rxpipe3_p2m_bus_0[2], o_same_quad_rxpipe3_p2m_bus_0[1], o_same_quad_rxpipe3_p2m_bus_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_pclkchangeok(o_same_quad_rxpipe3_pclkchangeok_0),
                .o_same_quad_pcie_ctrl_rxpipe_phystatus(o_same_quad_rxpipe3_phystatus_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxdata({ o_same_quad_rxpipe3_rxdata_0[39], o_same_quad_rxpipe3_rxdata_0[38], o_same_quad_rxpipe3_rxdata_0[37], o_same_quad_rxpipe3_rxdata_0[36], o_same_quad_rxpipe3_rxdata_0[35], o_same_quad_rxpipe3_rxdata_0[34], o_same_quad_rxpipe3_rxdata_0[33], o_same_quad_rxpipe3_rxdata_0[32], o_same_quad_rxpipe3_rxdata_0[31], o_same_quad_rxpipe3_rxdata_0[30], o_same_quad_rxpipe3_rxdata_0[29], o_same_quad_rxpipe3_rxdata_0[28], o_same_quad_rxpipe3_rxdata_0[27], o_same_quad_rxpipe3_rxdata_0[26], o_same_quad_rxpipe3_rxdata_0[25], o_same_quad_rxpipe3_rxdata_0[24], o_same_quad_rxpipe3_rxdata_0[23], o_same_quad_rxpipe3_rxdata_0[22], o_same_quad_rxpipe3_rxdata_0[21], o_same_quad_rxpipe3_rxdata_0[20], o_same_quad_rxpipe3_rxdata_0[19], o_same_quad_rxpipe3_rxdata_0[18], o_same_quad_rxpipe3_rxdata_0[17], o_same_quad_rxpipe3_rxdata_0[16], o_same_quad_rxpipe3_rxdata_0[15], o_same_quad_rxpipe3_rxdata_0[14], o_same_quad_rxpipe3_rxdata_0[13], o_same_quad_rxpipe3_rxdata_0[12], o_same_quad_rxpipe3_rxdata_0[11], o_same_quad_rxpipe3_rxdata_0[10], o_same_quad_rxpipe3_rxdata_0[9], o_same_quad_rxpipe3_rxdata_0[8], o_same_quad_rxpipe3_rxdata_0[7], o_same_quad_rxpipe3_rxdata_0[6], o_same_quad_rxpipe3_rxdata_0[5], o_same_quad_rxpipe3_rxdata_0[4], o_same_quad_rxpipe3_rxdata_0[3], o_same_quad_rxpipe3_rxdata_0[2], o_same_quad_rxpipe3_rxdata_0[1], o_same_quad_rxpipe3_rxdata_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxdatak({ o_same_quad_rxpipe3_rxdatak_0[3], o_same_quad_rxpipe3_rxdatak_0[2], o_same_quad_rxpipe3_rxdatak_0[1], o_same_quad_rxpipe3_rxdatak_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxdatavalid(o_same_quad_rxpipe3_rxdatavalid_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxelecidlea(o_same_quad_rxpipe3_rxelecidlea_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstandbystatus(o_same_quad_rxpipe3_rxstandbystatus_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstartblock(o_same_quad_rxpipe3_rxstartblock_0),
                .o_same_quad_pcie_ctrl_rxpipe_rxstatus({ o_same_quad_rxpipe3_rxstatus_0[2], o_same_quad_rxpipe3_rxstatus_0[1], o_same_quad_rxpipe3_rxstatus_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxsyncheader({ o_same_quad_rxpipe3_rxsyncheader_0[3], o_same_quad_rxpipe3_rxsyncheader_0[2], o_same_quad_rxpipe3_rxsyncheader_0[1], o_same_quad_rxpipe3_rxsyncheader_0[0] }),
                .o_same_quad_pcie_ctrl_rxpipe_rxvalid(o_same_quad_rxpipe3_rxvalid_0),
                .o_unused_rxpipe_dirfeedback({ tmp_7114, tmp_7115, tmp_7116, tmp_7117, tmp_7118, tmp_7119 }),
                .o_unused_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_7120, tmp_7121, tmp_7122, tmp_7123, tmp_7124, tmp_7125, tmp_7126, tmp_7127 }),
                .o_unused_rxpipe_localfs({ tmp_7128, tmp_7129, tmp_7130, tmp_7131, tmp_7132, tmp_7133 }),
                .o_unused_rxpipe_locallf({ tmp_7134, tmp_7135, tmp_7136, tmp_7137, tmp_7138, tmp_7139 }),
                .o_unused_rxpipe_localtxcoefficientsvalid(tmp_7140),
                .o_unused_rxpipe_localtxpresetcoefficients({ tmp_7141, tmp_7142, tmp_7143, tmp_7144, tmp_7145, tmp_7146, tmp_7147, tmp_7148, tmp_7149, tmp_7150, tmp_7151, tmp_7152, tmp_7153, tmp_7154, tmp_7155, tmp_7156, tmp_7157, tmp_7158 }),
                .o_unused_rxpipe_p2m_bus({ tmp_7159, tmp_7160, tmp_7161, tmp_7162, tmp_7163, tmp_7164, tmp_7165, tmp_7166 }),
                .o_unused_rxpipe_pclkchangeok(tmp_7167),
                .o_unused_rxpipe_phystatus(tmp_7168),
                .o_unused_rxpipe_rxdata({ tmp_7169, tmp_7170, tmp_7171, tmp_7172, tmp_7173, tmp_7174, tmp_7175, tmp_7176, tmp_7177, tmp_7178, tmp_7179, tmp_7180, tmp_7181, tmp_7182, tmp_7183, tmp_7184, tmp_7185, tmp_7186, tmp_7187, tmp_7188, tmp_7189, tmp_7190, tmp_7191, tmp_7192, tmp_7193, tmp_7194, tmp_7195, tmp_7196, tmp_7197, tmp_7198, tmp_7199, tmp_7200, tmp_7201, tmp_7202, tmp_7203, tmp_7204, tmp_7205, tmp_7206, tmp_7207, tmp_7208 }),
                .o_unused_rxpipe_rxdatak({ tmp_7209, tmp_7210, tmp_7211, tmp_7212 }),
                .o_unused_rxpipe_rxdatavalid(tmp_7213),
                .o_unused_rxpipe_rxelecidlea(tmp_7214),
                .o_unused_rxpipe_rxstandbystatus(tmp_7215),
                .o_unused_rxpipe_rxstartblock(tmp_7216),
                .o_unused_rxpipe_rxstatus({ tmp_7217, tmp_7218, tmp_7219 }),
                .o_unused_rxpipe_rxsyncheader({ tmp_7220, tmp_7221, tmp_7222, tmp_7223 }),
                .o_unused_rxpipe_rxvalid(tmp_7224),
                .o_upper_quad_pcie_ctrl_rxpipe_dirfeedback({ tmp_7225, tmp_7226, tmp_7227, tmp_7228, tmp_7229, tmp_7230 }),
                .o_upper_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit({ tmp_7231, tmp_7232, tmp_7233, tmp_7234, tmp_7235, tmp_7236, tmp_7237, tmp_7238 }),
                .o_upper_quad_pcie_ctrl_rxpipe_localfs({ tmp_7239, tmp_7240, tmp_7241, tmp_7242, tmp_7243, tmp_7244 }),
                .o_upper_quad_pcie_ctrl_rxpipe_locallf({ tmp_7245, tmp_7246, tmp_7247, tmp_7248, tmp_7249, tmp_7250 }),
                .o_upper_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(tmp_7251),
                .o_upper_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients({ tmp_7252, tmp_7253, tmp_7254, tmp_7255, tmp_7256, tmp_7257, tmp_7258, tmp_7259, tmp_7260, tmp_7261, tmp_7262, tmp_7263, tmp_7264, tmp_7265, tmp_7266, tmp_7267, tmp_7268, tmp_7269 }),
                .o_upper_quad_pcie_ctrl_rxpipe_p2m_bus({ tmp_7270, tmp_7271, tmp_7272, tmp_7273, tmp_7274, tmp_7275, tmp_7276, tmp_7277 }),
                .o_upper_quad_pcie_ctrl_rxpipe_pclkchangeok(tmp_7278),
                .o_upper_quad_pcie_ctrl_rxpipe_phystatus(tmp_7279),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdata({ tmp_7280, tmp_7281, tmp_7282, tmp_7283, tmp_7284, tmp_7285, tmp_7286, tmp_7287, tmp_7288, tmp_7289, tmp_7290, tmp_7291, tmp_7292, tmp_7293, tmp_7294, tmp_7295, tmp_7296, tmp_7297, tmp_7298, tmp_7299, tmp_7300, tmp_7301, tmp_7302, tmp_7303, tmp_7304, tmp_7305, tmp_7306, tmp_7307, tmp_7308, tmp_7309, tmp_7310, tmp_7311, tmp_7312, tmp_7313, tmp_7314, tmp_7315, tmp_7316, tmp_7317, tmp_7318, tmp_7319 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdatak({ tmp_7320, tmp_7321, tmp_7322, tmp_7323 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxdatavalid(tmp_7324),
                .o_upper_quad_pcie_ctrl_rxpipe_rxelecidlea(tmp_7325),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstandbystatus(tmp_7326),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstartblock(tmp_7327),
                .o_upper_quad_pcie_ctrl_rxpipe_rxstatus({ tmp_7328, tmp_7329, tmp_7330 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxsyncheader({ tmp_7331, tmp_7332, tmp_7333, tmp_7334 }),
                .o_upper_quad_pcie_ctrl_rxpipe_rxvalid(tmp_7335)
        );

        tennm_sm_hssi_pcie_pcs_tx_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_tx_mux_0__sel)
        ) x_mux_sm_hssi_pcie_pcs_tx_mux_0 (
                .i_hps_txpipe_asyncpowerchangeack(n1_5),
                .i_hps_txpipe_blockaligncontrol(n1_5),
                .i_hps_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_hps_txpipe_dirchange(n1_5),
                .i_hps_txpipe_ebuf_mode(n1_5),
                .i_hps_txpipe_encodedecodebypass(n1_5),
                .i_hps_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_getlocalpresetcoefficients(n1_5),
                .i_hps_txpipe_invalidrequest(n1_5),
                .i_hps_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_lowpin_nt(n1_5),
                .i_hps_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_pclkchangeack(n1_5),
                .i_hps_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_rxelecidle_disable_a(n1_5),
                .i_hps_txpipe_rxeqclr(n1_5),
                .i_hps_txpipe_rxeqeval(n1_5),
                .i_hps_txpipe_rxeqinprogress(n1_5),
                .i_hps_txpipe_rxeqtraining(n1_5),
                .i_hps_txpipe_rxpolarity(n1_5),
                .i_hps_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_rxstandby(n1_5),
                .i_hps_txpipe_rxtermination(n1_5),
                .i_hps_txpipe_srisenable(n1_5),
                .i_hps_txpipe_txcmnmode_disable_a(n1_5),
                .i_hps_txpipe_txcompliance(n1_5),
                .i_hps_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_txdatavalid(n1_5),
                .i_hps_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_txdtctrx_lb(n1_5),
                .i_hps_txpipe_txelecidle(n1_5),
                .i_hps_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_txoneszeros(n1_5),
                .i_hps_txpipe_txstartblock(n1_5),
                .i_hps_txpipe_txswing(n1_5),
                .i_hps_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_width({ n1_5, n1_5, n1_5 }),
                .i_same_quad_pcie_ctrl_txpipe_asyncpowerchangeack(o_txpipe0_asyncpowerchangeack_0),
                .i_same_quad_pcie_ctrl_txpipe_blockaligncontrol(o_txpipe0_blockaligncontrol_0),
                .i_same_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(o_txpipe0_cfg_hw_auto_sp_dis_0),
                .i_same_quad_pcie_ctrl_txpipe_dirchange(o_txpipe0_dirchange_0),
                .i_same_quad_pcie_ctrl_txpipe_ebuf_mode(o_txpipe0_ebuf_mode_0),
                .i_same_quad_pcie_ctrl_txpipe_encodedecodebypass(o_txpipe0_encodedecodebypass_0),
                .i_same_quad_pcie_ctrl_txpipe_fs({ o_txpipe0_fs_0[5], o_txpipe0_fs_0[4], o_txpipe0_fs_0[3], o_txpipe0_fs_0[2], o_txpipe0_fs_0[1], o_txpipe0_fs_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(o_txpipe0_getlocalpresetcoefficients_0),
                .i_same_quad_pcie_ctrl_txpipe_invalidrequest(o_txpipe0_invalidrequest_0),
                .i_same_quad_pcie_ctrl_txpipe_lf({ o_txpipe0_lf_0[5], o_txpipe0_lf_0[4], o_txpipe0_lf_0[3], o_txpipe0_lf_0[2], o_txpipe0_lf_0[1], o_txpipe0_lf_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_localpresetindex({ o_txpipe0_localpresetindex_0[4], o_txpipe0_localpresetindex_0[3], o_txpipe0_localpresetindex_0[2], o_txpipe0_localpresetindex_0[1], o_txpipe0_localpresetindex_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_lowpin_nt(o_txpipe0_lowpin_nt_0),
                .i_same_quad_pcie_ctrl_txpipe_m2p_bus({ o_txpipe0_m2p_bus_0[7], o_txpipe0_m2p_bus_0[6], o_txpipe0_m2p_bus_0[5], o_txpipe0_m2p_bus_0[4], o_txpipe0_m2p_bus_0[3], o_txpipe0_m2p_bus_0[2], o_txpipe0_m2p_bus_0[1], o_txpipe0_m2p_bus_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_pclk_rate({ o_txpipe0_pclk_rate_0[2], o_txpipe0_pclk_rate_0[1], o_txpipe0_pclk_rate_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_pclkchangeack(o_txpipe0_pclkchangeack_0),
                .i_same_quad_pcie_ctrl_txpipe_phy_mode_nt({ o_txpipe0_phy_mode_nt_0[3], o_txpipe0_phy_mode_nt_0[2], o_txpipe0_phy_mode_nt_0[1], o_txpipe0_phy_mode_nt_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_powerdown({ o_txpipe0_powerdown_0[3], o_txpipe0_powerdown_0[2], o_txpipe0_powerdown_0[1], o_txpipe0_powerdown_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rate({ o_txpipe0_rate_0[2], o_txpipe0_rate_0[1], o_txpipe0_rate_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(o_txpipe0_rxelecidle_disable_a_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqclr(o_txpipe0_rxeqclr_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqeval(o_txpipe0_rxeqeval_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqinprogress(o_txpipe0_rxeqinprogress_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqtraining(o_txpipe0_rxeqtraining_0),
                .i_same_quad_pcie_ctrl_txpipe_rxpolarity(o_txpipe0_rxpolarity_0),
                .i_same_quad_pcie_ctrl_txpipe_rxpresethint({ o_txpipe0_rxpresethint_0[2], o_txpipe0_rxpresethint_0[1], o_txpipe0_rxpresethint_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rxstandby(o_txpipe0_rxstandby_0),
                .i_same_quad_pcie_ctrl_txpipe_rxtermination(o_txpipe0_rxtermination_0),
                .i_same_quad_pcie_ctrl_txpipe_srisenable(o_txpipe0_srisenable_0),
                .i_same_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(o_txpipe0_txcmnmode_disable_a_0),
                .i_same_quad_pcie_ctrl_txpipe_txcompliance(o_txpipe0_txcompliance_0),
                .i_same_quad_pcie_ctrl_txpipe_txdata({ o_txpipe0_txdata_0[39], o_txpipe0_txdata_0[38], o_txpipe0_txdata_0[37], o_txpipe0_txdata_0[36], o_txpipe0_txdata_0[35], o_txpipe0_txdata_0[34], o_txpipe0_txdata_0[33], o_txpipe0_txdata_0[32], o_txpipe0_txdata_0[31], o_txpipe0_txdata_0[30], o_txpipe0_txdata_0[29], o_txpipe0_txdata_0[28], o_txpipe0_txdata_0[27], o_txpipe0_txdata_0[26], o_txpipe0_txdata_0[25], o_txpipe0_txdata_0[24], o_txpipe0_txdata_0[23], o_txpipe0_txdata_0[22], o_txpipe0_txdata_0[21], o_txpipe0_txdata_0[20], o_txpipe0_txdata_0[19], o_txpipe0_txdata_0[18], o_txpipe0_txdata_0[17], o_txpipe0_txdata_0[16], o_txpipe0_txdata_0[15], o_txpipe0_txdata_0[14], o_txpipe0_txdata_0[13], o_txpipe0_txdata_0[12], o_txpipe0_txdata_0[11], o_txpipe0_txdata_0[10], o_txpipe0_txdata_0[9], o_txpipe0_txdata_0[8], o_txpipe0_txdata_0[7], o_txpipe0_txdata_0[6], o_txpipe0_txdata_0[5], o_txpipe0_txdata_0[4], o_txpipe0_txdata_0[3], o_txpipe0_txdata_0[2], o_txpipe0_txdata_0[1], o_txpipe0_txdata_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdatak({ o_txpipe0_txdatak_0[3], o_txpipe0_txdatak_0[2], o_txpipe0_txdatak_0[1], o_txpipe0_txdatak_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdatavalid(o_txpipe0_txdatavalid_0),
                .i_same_quad_pcie_ctrl_txpipe_txdeemph({ o_txpipe0_txdeemph_0[17], o_txpipe0_txdeemph_0[16], o_txpipe0_txdeemph_0[15], o_txpipe0_txdeemph_0[14], o_txpipe0_txdeemph_0[13], o_txpipe0_txdeemph_0[12], o_txpipe0_txdeemph_0[11], o_txpipe0_txdeemph_0[10], o_txpipe0_txdeemph_0[9], o_txpipe0_txdeemph_0[8], o_txpipe0_txdeemph_0[7], o_txpipe0_txdeemph_0[6], o_txpipe0_txdeemph_0[5], o_txpipe0_txdeemph_0[4], o_txpipe0_txdeemph_0[3], o_txpipe0_txdeemph_0[2], o_txpipe0_txdeemph_0[1], o_txpipe0_txdeemph_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdtctrx_lb(o_txpipe0_txdtctrx_lb_0),
                .i_same_quad_pcie_ctrl_txpipe_txelecidle(o_txpipe0_txelecidle_0),
                .i_same_quad_pcie_ctrl_txpipe_txmargin({ o_txpipe0_txmargin_0[2], o_txpipe0_txmargin_0[1], o_txpipe0_txmargin_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txoneszeros(o_txpipe0_txoneszeros_0),
                .i_same_quad_pcie_ctrl_txpipe_txstartblock(o_txpipe0_txstartblock_0),
                .i_same_quad_pcie_ctrl_txpipe_txswing(o_txpipe0_txswing_0),
                .i_same_quad_pcie_ctrl_txpipe_txsyncheader({ o_txpipe0_txsyncheader_0[3], o_txpipe0_txsyncheader_0[2], o_txpipe0_txsyncheader_0[1], o_txpipe0_txsyncheader_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_width({ o_txpipe0_width_0[2], o_txpipe0_width_0[1], o_txpipe0_width_0[0] }),
                .i_unused_txpipe_asyncpowerchangeack(n1_5),
                .i_unused_txpipe_blockaligncontrol(n1_5),
                .i_unused_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_unused_txpipe_dirchange(n1_5),
                .i_unused_txpipe_ebuf_mode(n1_5),
                .i_unused_txpipe_encodedecodebypass(n1_5),
                .i_unused_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_getlocalpresetcoefficients(n1_5),
                .i_unused_txpipe_invalidrequest(n1_5),
                .i_unused_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_lowpin_nt(n1_5),
                .i_unused_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_pclkchangeack(n1_5),
                .i_unused_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rxelecidle_disable_a(n1_5),
                .i_unused_txpipe_rxeqclr(n1_5),
                .i_unused_txpipe_rxeqeval(n1_5),
                .i_unused_txpipe_rxeqinprogress(n1_5),
                .i_unused_txpipe_rxeqtraining(n1_5),
                .i_unused_txpipe_rxpolarity(n1_5),
                .i_unused_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rxstandby(n1_5),
                .i_unused_txpipe_rxtermination(n1_5),
                .i_unused_txpipe_srisenable(n1_5),
                .i_unused_txpipe_txcmnmode_disable_a(n1_5),
                .i_unused_txpipe_txcompliance(n1_5),
                .i_unused_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdatavalid(n1_5),
                .i_unused_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdtctrx_lb(n1_5),
                .i_unused_txpipe_txelecidle(n1_5),
                .i_unused_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txoneszeros(n1_5),
                .i_unused_txpipe_txstartblock(n1_5),
                .i_unused_txpipe_txswing(n1_5),
                .i_unused_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_width({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_asyncpowerchangeack(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_blockaligncontrol(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_dirchange(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_ebuf_mode(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_encodedecodebypass(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_invalidrequest(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_lowpin_nt(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_pclkchangeack(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqclr(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqeval(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqinprogress(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqtraining(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxpolarity(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rxstandby(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxtermination(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_srisenable(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txcompliance(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdatavalid(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdtctrx_lb(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txelecidle(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txoneszeros(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txstartblock(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txswing(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_width({ n1_5, n1_5, n1_5 }),
                .o_txpipe_asyncpowerchangeack(pcie_pcs_tx_mux_u0__o_txpipe_asyncpowerchangeack_0),
                .o_txpipe_blockaligncontrol(pcie_pcs_tx_mux_u0__o_txpipe_blockaligncontrol_0),
                .o_txpipe_cfg_hw_auto_sp_dis(pcie_pcs_tx_mux_u0__o_txpipe_cfg_hw_auto_sp_dis_0),
                .o_txpipe_dirchange(pcie_pcs_tx_mux_u0__o_txpipe_dirchange_0),
                .o_txpipe_ebuf_mode(pcie_pcs_tx_mux_u0__o_txpipe_ebuf_mode_0),
                .o_txpipe_encodedecodebypass(pcie_pcs_tx_mux_u0__o_txpipe_encodedecodebypass_0),
                .o_txpipe_fs({ pcie_pcs_tx_mux_u0__o_txpipe_fs_0[5], pcie_pcs_tx_mux_u0__o_txpipe_fs_0[4], pcie_pcs_tx_mux_u0__o_txpipe_fs_0[3], pcie_pcs_tx_mux_u0__o_txpipe_fs_0[2], pcie_pcs_tx_mux_u0__o_txpipe_fs_0[1], pcie_pcs_tx_mux_u0__o_txpipe_fs_0[0] }),
                .o_txpipe_getlocalpresetcoefficients(pcie_pcs_tx_mux_u0__o_txpipe_getlocalpresetcoefficients_0),
                .o_txpipe_invalidrequest(pcie_pcs_tx_mux_u0__o_txpipe_invalidrequest_0),
                .o_txpipe_lf({ pcie_pcs_tx_mux_u0__o_txpipe_lf_0[5], pcie_pcs_tx_mux_u0__o_txpipe_lf_0[4], pcie_pcs_tx_mux_u0__o_txpipe_lf_0[3], pcie_pcs_tx_mux_u0__o_txpipe_lf_0[2], pcie_pcs_tx_mux_u0__o_txpipe_lf_0[1], pcie_pcs_tx_mux_u0__o_txpipe_lf_0[0] }),
                .o_txpipe_localpresetindex({ pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[4], pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[3], pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[2], pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[1], pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex_0[0] }),
                .o_txpipe_lowpin_nt(pcie_pcs_tx_mux_u0__o_txpipe_lowpin_nt_0),
                .o_txpipe_m2p_bus({ pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[7], pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[6], pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[5], pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[4], pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[3], pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[2], pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[1], pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus_0[0] }),
                .o_txpipe_pclk_rate({ pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate_0[2], pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate_0[1], pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate_0[0] }),
                .o_txpipe_pclkchangeack(pcie_pcs_tx_mux_u0__o_txpipe_pclkchangeack_0),
                .o_txpipe_phy_mode_nt({ pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0[3], pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0[2], pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0[1], pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt_0[0] }),
                .o_txpipe_powerdown({ pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0[3], pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0[2], pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0[1], pcie_pcs_tx_mux_u0__o_txpipe_powerdown_0[0] }),
                .o_txpipe_rate({ pcie_pcs_tx_mux_u0__o_txpipe_rate_0[2], pcie_pcs_tx_mux_u0__o_txpipe_rate_0[1], pcie_pcs_tx_mux_u0__o_txpipe_rate_0[0] }),
                .o_txpipe_rxelecidle_disable_a(pcie_pcs_tx_mux_u0__o_txpipe_rxelecidle_disable_a_0),
                .o_txpipe_rxeqclr(pcie_pcs_tx_mux_u0__o_txpipe_rxeqclr_0),
                .o_txpipe_rxeqeval(pcie_pcs_tx_mux_u0__o_txpipe_rxeqeval_0),
                .o_txpipe_rxeqinprogress(pcie_pcs_tx_mux_u0__o_txpipe_rxeqinprogress_0),
                .o_txpipe_rxeqtraining(pcie_pcs_tx_mux_u0__o_txpipe_rxeqtraining_0),
                .o_txpipe_rxpolarity(pcie_pcs_tx_mux_u0__o_txpipe_rxpolarity_0),
                .o_txpipe_rxpresethint({ pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint_0[2], pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint_0[1], pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint_0[0] }),
                .o_txpipe_rxstandby(pcie_pcs_tx_mux_u0__o_txpipe_rxstandby_0),
                .o_txpipe_rxtermination(pcie_pcs_tx_mux_u0__o_txpipe_rxtermination_0),
                .o_txpipe_srisenable(pcie_pcs_tx_mux_u0__o_txpipe_srisenable_0),
                .o_txpipe_txcmnmode_disable_a(pcie_pcs_tx_mux_u0__o_txpipe_txcmnmode_disable_a_0),
                .o_txpipe_txcompliance(pcie_pcs_tx_mux_u0__o_txpipe_txcompliance_0),
                .o_txpipe_txdata({ pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[39], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[38], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[37], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[36], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[35], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[34], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[33], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[32], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[31], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[30], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[29], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[28], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[27], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[26], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[25], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[24], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[23], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[22], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[21], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[20], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[19], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[18], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[17], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[16], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[15], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[14], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[13], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[12], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[11], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[10], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[9], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[8], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[7], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[6], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[5], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[4], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[3], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[2], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[1], pcie_pcs_tx_mux_u0__o_txpipe_txdata_0[0] }),
                .o_txpipe_txdatak({ pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0[3], pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0[2], pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0[1], pcie_pcs_tx_mux_u0__o_txpipe_txdatak_0[0] }),
                .o_txpipe_txdatavalid(pcie_pcs_tx_mux_u0__o_txpipe_txdatavalid_0),
                .o_txpipe_txdeemph({ pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[17], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[16], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[15], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[14], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[13], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[12], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[11], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[10], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[9], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[8], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[7], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[6], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[5], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[4], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[3], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[2], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[1], pcie_pcs_tx_mux_u0__o_txpipe_txdeemph_0[0] }),
                .o_txpipe_txdtctrx_lb(pcie_pcs_tx_mux_u0__o_txpipe_txdtctrx_lb_0),
                .o_txpipe_txelecidle(pcie_pcs_tx_mux_u0__o_txpipe_txelecidle_0),
                .o_txpipe_txmargin({ pcie_pcs_tx_mux_u0__o_txpipe_txmargin_0[2], pcie_pcs_tx_mux_u0__o_txpipe_txmargin_0[1], pcie_pcs_tx_mux_u0__o_txpipe_txmargin_0[0] }),
                .o_txpipe_txoneszeros(pcie_pcs_tx_mux_u0__o_txpipe_txoneszeros_0),
                .o_txpipe_txstartblock(pcie_pcs_tx_mux_u0__o_txpipe_txstartblock_0),
                .o_txpipe_txswing(pcie_pcs_tx_mux_u0__o_txpipe_txswing_0),
                .o_txpipe_txsyncheader({ pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0[3], pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0[2], pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0[1], pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader_0[0] }),
                .o_txpipe_width({ pcie_pcs_tx_mux_u0__o_txpipe_width_0[2], pcie_pcs_tx_mux_u0__o_txpipe_width_0[1], pcie_pcs_tx_mux_u0__o_txpipe_width_0[0] })
        );

        tennm_sm_hssi_pcie_pcs_tx_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_tx_mux_1__sel)
        ) x_mux_sm_hssi_pcie_pcs_tx_mux_1 (
                .i_hps_txpipe_asyncpowerchangeack(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_asyncpowerchangeack_0),
                .i_hps_txpipe_blockaligncontrol(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_blockaligncontrol_0),
                .i_hps_txpipe_cfg_hw_auto_sp_dis(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis_0),
                .i_hps_txpipe_dirchange(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_dirchange_0),
                .i_hps_txpipe_ebuf_mode(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_ebuf_mode_0),
                .i_hps_txpipe_encodedecodebypass(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_encodedecodebypass_0),
                .i_hps_txpipe_fs({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_fs_0[0] }),
                .i_hps_txpipe_getlocalpresetcoefficients(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients_0),
                .i_hps_txpipe_invalidrequest(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_invalidrequest_0),
                .i_hps_txpipe_lf({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lf_0[0] }),
                .i_hps_txpipe_localpresetindex({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_localpresetindex_0[0] }),
                .i_hps_txpipe_lowpin_nt(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_lowpin_nt_0),
                .i_hps_txpipe_m2p_bus({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_m2p_bus_0[0] }),
                .i_hps_txpipe_pclk_rate({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclk_rate_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclk_rate_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclk_rate_0[0] }),
                .i_hps_txpipe_pclkchangeack(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_pclkchangeack_0),
                .i_hps_txpipe_phy_mode_nt({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_phy_mode_nt_0[0] }),
                .i_hps_txpipe_powerdown({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_powerdown_0[0] }),
                .i_hps_txpipe_rate({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rate_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rate_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rate_0[0] }),
                .i_hps_txpipe_rxelecidle_disable_a(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a_0),
                .i_hps_txpipe_rxeqclr(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqclr_0),
                .i_hps_txpipe_rxeqeval(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqeval_0),
                .i_hps_txpipe_rxeqinprogress(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqinprogress_0),
                .i_hps_txpipe_rxeqtraining(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxeqtraining_0),
                .i_hps_txpipe_rxpolarity(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpolarity_0),
                .i_hps_txpipe_rxpresethint({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpresethint_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpresethint_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxpresethint_0[0] }),
                .i_hps_txpipe_rxstandby(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxstandby_0),
                .i_hps_txpipe_rxtermination(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_rxtermination_0),
                .i_hps_txpipe_srisenable(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_srisenable_0),
                .i_hps_txpipe_txcmnmode_disable_a(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a_0),
                .i_hps_txpipe_txcompliance(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txcompliance_0),
                .i_hps_txpipe_txdata({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[39], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[38], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[37], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[36], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[35], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[34], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[33], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[32], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[31], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[30], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[29], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[28], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[27], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[26], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[25], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[24], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[23], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[22], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[21], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[20], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[19], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[18], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[17], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[16], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[15], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[14], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[13], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[12], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[11], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[10], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[9], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[8], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdata_0[0] }),
                .i_hps_txpipe_txdatak({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatak_0[0] }),
                .i_hps_txpipe_txdatavalid(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdatavalid_0),
                .i_hps_txpipe_txdeemph({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[17], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[16], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[15], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[14], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[13], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[12], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[11], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[10], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[9], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[8], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdeemph_0[0] }),
                .i_hps_txpipe_txdtctrx_lb(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txdtctrx_lb_0),
                .i_hps_txpipe_txelecidle(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txelecidle_0),
                .i_hps_txpipe_txmargin({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txmargin_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txmargin_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txmargin_0[0] }),
                .i_hps_txpipe_txoneszeros(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txoneszeros_0),
                .i_hps_txpipe_txstartblock(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txstartblock_0),
                .i_hps_txpipe_txswing(pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txswing_0),
                .i_hps_txpipe_txsyncheader({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_txsyncheader_0[0] }),
                .i_hps_txpipe_width({ pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_width_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_width_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs1_enabled_txpipe_width_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_asyncpowerchangeack(o_txpipe1_asyncpowerchangeack_0),
                .i_same_quad_pcie_ctrl_txpipe_blockaligncontrol(o_txpipe1_blockaligncontrol_0),
                .i_same_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(o_txpipe1_cfg_hw_auto_sp_dis_0),
                .i_same_quad_pcie_ctrl_txpipe_dirchange(o_txpipe1_dirchange_0),
                .i_same_quad_pcie_ctrl_txpipe_ebuf_mode(o_txpipe1_ebuf_mode_0),
                .i_same_quad_pcie_ctrl_txpipe_encodedecodebypass(o_txpipe1_encodedecodebypass_0),
                .i_same_quad_pcie_ctrl_txpipe_fs({ o_txpipe1_fs_0[5], o_txpipe1_fs_0[4], o_txpipe1_fs_0[3], o_txpipe1_fs_0[2], o_txpipe1_fs_0[1], o_txpipe1_fs_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(o_txpipe1_getlocalpresetcoefficients_0),
                .i_same_quad_pcie_ctrl_txpipe_invalidrequest(o_txpipe1_invalidrequest_0),
                .i_same_quad_pcie_ctrl_txpipe_lf({ o_txpipe1_lf_0[5], o_txpipe1_lf_0[4], o_txpipe1_lf_0[3], o_txpipe1_lf_0[2], o_txpipe1_lf_0[1], o_txpipe1_lf_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_localpresetindex({ o_txpipe1_localpresetindex_0[4], o_txpipe1_localpresetindex_0[3], o_txpipe1_localpresetindex_0[2], o_txpipe1_localpresetindex_0[1], o_txpipe1_localpresetindex_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_lowpin_nt(o_txpipe1_lowpin_nt_0),
                .i_same_quad_pcie_ctrl_txpipe_m2p_bus({ o_txpipe1_m2p_bus_0[7], o_txpipe1_m2p_bus_0[6], o_txpipe1_m2p_bus_0[5], o_txpipe1_m2p_bus_0[4], o_txpipe1_m2p_bus_0[3], o_txpipe1_m2p_bus_0[2], o_txpipe1_m2p_bus_0[1], o_txpipe1_m2p_bus_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_pclk_rate({ o_txpipe1_pclk_rate_0[2], o_txpipe1_pclk_rate_0[1], o_txpipe1_pclk_rate_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_pclkchangeack(o_txpipe1_pclkchangeack_0),
                .i_same_quad_pcie_ctrl_txpipe_phy_mode_nt({ o_txpipe1_phy_mode_nt_0[3], o_txpipe1_phy_mode_nt_0[2], o_txpipe1_phy_mode_nt_0[1], o_txpipe1_phy_mode_nt_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_powerdown({ o_txpipe1_powerdown_0[3], o_txpipe1_powerdown_0[2], o_txpipe1_powerdown_0[1], o_txpipe1_powerdown_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rate({ o_txpipe1_rate_0[2], o_txpipe1_rate_0[1], o_txpipe1_rate_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(o_txpipe1_rxelecidle_disable_a_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqclr(o_txpipe1_rxeqclr_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqeval(o_txpipe1_rxeqeval_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqinprogress(o_txpipe1_rxeqinprogress_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqtraining(o_txpipe1_rxeqtraining_0),
                .i_same_quad_pcie_ctrl_txpipe_rxpolarity(o_txpipe1_rxpolarity_0),
                .i_same_quad_pcie_ctrl_txpipe_rxpresethint({ o_txpipe1_rxpresethint_0[2], o_txpipe1_rxpresethint_0[1], o_txpipe1_rxpresethint_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rxstandby(o_txpipe1_rxstandby_0),
                .i_same_quad_pcie_ctrl_txpipe_rxtermination(o_txpipe1_rxtermination_0),
                .i_same_quad_pcie_ctrl_txpipe_srisenable(o_txpipe1_srisenable_0),
                .i_same_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(o_txpipe1_txcmnmode_disable_a_0),
                .i_same_quad_pcie_ctrl_txpipe_txcompliance(o_txpipe1_txcompliance_0),
                .i_same_quad_pcie_ctrl_txpipe_txdata({ o_txpipe1_txdata_0[39], o_txpipe1_txdata_0[38], o_txpipe1_txdata_0[37], o_txpipe1_txdata_0[36], o_txpipe1_txdata_0[35], o_txpipe1_txdata_0[34], o_txpipe1_txdata_0[33], o_txpipe1_txdata_0[32], o_txpipe1_txdata_0[31], o_txpipe1_txdata_0[30], o_txpipe1_txdata_0[29], o_txpipe1_txdata_0[28], o_txpipe1_txdata_0[27], o_txpipe1_txdata_0[26], o_txpipe1_txdata_0[25], o_txpipe1_txdata_0[24], o_txpipe1_txdata_0[23], o_txpipe1_txdata_0[22], o_txpipe1_txdata_0[21], o_txpipe1_txdata_0[20], o_txpipe1_txdata_0[19], o_txpipe1_txdata_0[18], o_txpipe1_txdata_0[17], o_txpipe1_txdata_0[16], o_txpipe1_txdata_0[15], o_txpipe1_txdata_0[14], o_txpipe1_txdata_0[13], o_txpipe1_txdata_0[12], o_txpipe1_txdata_0[11], o_txpipe1_txdata_0[10], o_txpipe1_txdata_0[9], o_txpipe1_txdata_0[8], o_txpipe1_txdata_0[7], o_txpipe1_txdata_0[6], o_txpipe1_txdata_0[5], o_txpipe1_txdata_0[4], o_txpipe1_txdata_0[3], o_txpipe1_txdata_0[2], o_txpipe1_txdata_0[1], o_txpipe1_txdata_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdatak({ o_txpipe1_txdatak_0[3], o_txpipe1_txdatak_0[2], o_txpipe1_txdatak_0[1], o_txpipe1_txdatak_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdatavalid(o_txpipe1_txdatavalid_0),
                .i_same_quad_pcie_ctrl_txpipe_txdeemph({ o_txpipe1_txdeemph_0[17], o_txpipe1_txdeemph_0[16], o_txpipe1_txdeemph_0[15], o_txpipe1_txdeemph_0[14], o_txpipe1_txdeemph_0[13], o_txpipe1_txdeemph_0[12], o_txpipe1_txdeemph_0[11], o_txpipe1_txdeemph_0[10], o_txpipe1_txdeemph_0[9], o_txpipe1_txdeemph_0[8], o_txpipe1_txdeemph_0[7], o_txpipe1_txdeemph_0[6], o_txpipe1_txdeemph_0[5], o_txpipe1_txdeemph_0[4], o_txpipe1_txdeemph_0[3], o_txpipe1_txdeemph_0[2], o_txpipe1_txdeemph_0[1], o_txpipe1_txdeemph_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdtctrx_lb(o_txpipe1_txdtctrx_lb_0),
                .i_same_quad_pcie_ctrl_txpipe_txelecidle(o_txpipe1_txelecidle_0),
                .i_same_quad_pcie_ctrl_txpipe_txmargin({ o_txpipe1_txmargin_0[2], o_txpipe1_txmargin_0[1], o_txpipe1_txmargin_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txoneszeros(o_txpipe1_txoneszeros_0),
                .i_same_quad_pcie_ctrl_txpipe_txstartblock(o_txpipe1_txstartblock_0),
                .i_same_quad_pcie_ctrl_txpipe_txswing(o_txpipe1_txswing_0),
                .i_same_quad_pcie_ctrl_txpipe_txsyncheader({ o_txpipe1_txsyncheader_0[3], o_txpipe1_txsyncheader_0[2], o_txpipe1_txsyncheader_0[1], o_txpipe1_txsyncheader_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_width({ o_txpipe1_width_0[2], o_txpipe1_width_0[1], o_txpipe1_width_0[0] }),
                .i_unused_txpipe_asyncpowerchangeack(n1_5),
                .i_unused_txpipe_blockaligncontrol(n1_5),
                .i_unused_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_unused_txpipe_dirchange(n1_5),
                .i_unused_txpipe_ebuf_mode(n1_5),
                .i_unused_txpipe_encodedecodebypass(n1_5),
                .i_unused_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_getlocalpresetcoefficients(n1_5),
                .i_unused_txpipe_invalidrequest(n1_5),
                .i_unused_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_lowpin_nt(n1_5),
                .i_unused_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_pclkchangeack(n1_5),
                .i_unused_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rxelecidle_disable_a(n1_5),
                .i_unused_txpipe_rxeqclr(n1_5),
                .i_unused_txpipe_rxeqeval(n1_5),
                .i_unused_txpipe_rxeqinprogress(n1_5),
                .i_unused_txpipe_rxeqtraining(n1_5),
                .i_unused_txpipe_rxpolarity(n1_5),
                .i_unused_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rxstandby(n1_5),
                .i_unused_txpipe_rxtermination(n1_5),
                .i_unused_txpipe_srisenable(n1_5),
                .i_unused_txpipe_txcmnmode_disable_a(n1_5),
                .i_unused_txpipe_txcompliance(n1_5),
                .i_unused_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdatavalid(n1_5),
                .i_unused_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdtctrx_lb(n1_5),
                .i_unused_txpipe_txelecidle(n1_5),
                .i_unused_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txoneszeros(n1_5),
                .i_unused_txpipe_txstartblock(n1_5),
                .i_unused_txpipe_txswing(n1_5),
                .i_unused_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_width({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_asyncpowerchangeack(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_blockaligncontrol(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_dirchange(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_ebuf_mode(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_encodedecodebypass(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_invalidrequest(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_lowpin_nt(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_pclkchangeack(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqclr(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqeval(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqinprogress(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqtraining(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxpolarity(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rxstandby(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxtermination(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_srisenable(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txcompliance(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdatavalid(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdtctrx_lb(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txelecidle(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txoneszeros(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txstartblock(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txswing(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_width({ n1_5, n1_5, n1_5 }),
                .o_txpipe_asyncpowerchangeack(pcie_pcs_tx_mux_u1__o_txpipe_asyncpowerchangeack_0),
                .o_txpipe_blockaligncontrol(pcie_pcs_tx_mux_u1__o_txpipe_blockaligncontrol_0),
                .o_txpipe_cfg_hw_auto_sp_dis(pcie_pcs_tx_mux_u1__o_txpipe_cfg_hw_auto_sp_dis_0),
                .o_txpipe_dirchange(pcie_pcs_tx_mux_u1__o_txpipe_dirchange_0),
                .o_txpipe_ebuf_mode(pcie_pcs_tx_mux_u1__o_txpipe_ebuf_mode_0),
                .o_txpipe_encodedecodebypass(pcie_pcs_tx_mux_u1__o_txpipe_encodedecodebypass_0),
                .o_txpipe_fs({ pcie_pcs_tx_mux_u1__o_txpipe_fs_0[5], pcie_pcs_tx_mux_u1__o_txpipe_fs_0[4], pcie_pcs_tx_mux_u1__o_txpipe_fs_0[3], pcie_pcs_tx_mux_u1__o_txpipe_fs_0[2], pcie_pcs_tx_mux_u1__o_txpipe_fs_0[1], pcie_pcs_tx_mux_u1__o_txpipe_fs_0[0] }),
                .o_txpipe_getlocalpresetcoefficients(pcie_pcs_tx_mux_u1__o_txpipe_getlocalpresetcoefficients_0),
                .o_txpipe_invalidrequest(pcie_pcs_tx_mux_u1__o_txpipe_invalidrequest_0),
                .o_txpipe_lf({ pcie_pcs_tx_mux_u1__o_txpipe_lf_0[5], pcie_pcs_tx_mux_u1__o_txpipe_lf_0[4], pcie_pcs_tx_mux_u1__o_txpipe_lf_0[3], pcie_pcs_tx_mux_u1__o_txpipe_lf_0[2], pcie_pcs_tx_mux_u1__o_txpipe_lf_0[1], pcie_pcs_tx_mux_u1__o_txpipe_lf_0[0] }),
                .o_txpipe_localpresetindex({ pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[4], pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[3], pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[2], pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[1], pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex_0[0] }),
                .o_txpipe_lowpin_nt(pcie_pcs_tx_mux_u1__o_txpipe_lowpin_nt_0),
                .o_txpipe_m2p_bus({ pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[7], pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[6], pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[5], pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[4], pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[3], pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[2], pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[1], pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus_0[0] }),
                .o_txpipe_pclk_rate({ pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate_0[2], pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate_0[1], pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate_0[0] }),
                .o_txpipe_pclkchangeack(pcie_pcs_tx_mux_u1__o_txpipe_pclkchangeack_0),
                .o_txpipe_phy_mode_nt({ pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0[3], pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0[2], pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0[1], pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt_0[0] }),
                .o_txpipe_powerdown({ pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0[3], pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0[2], pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0[1], pcie_pcs_tx_mux_u1__o_txpipe_powerdown_0[0] }),
                .o_txpipe_rate({ pcie_pcs_tx_mux_u1__o_txpipe_rate_0[2], pcie_pcs_tx_mux_u1__o_txpipe_rate_0[1], pcie_pcs_tx_mux_u1__o_txpipe_rate_0[0] }),
                .o_txpipe_rxelecidle_disable_a(pcie_pcs_tx_mux_u1__o_txpipe_rxelecidle_disable_a_0),
                .o_txpipe_rxeqclr(pcie_pcs_tx_mux_u1__o_txpipe_rxeqclr_0),
                .o_txpipe_rxeqeval(pcie_pcs_tx_mux_u1__o_txpipe_rxeqeval_0),
                .o_txpipe_rxeqinprogress(pcie_pcs_tx_mux_u1__o_txpipe_rxeqinprogress_0),
                .o_txpipe_rxeqtraining(pcie_pcs_tx_mux_u1__o_txpipe_rxeqtraining_0),
                .o_txpipe_rxpolarity(pcie_pcs_tx_mux_u1__o_txpipe_rxpolarity_0),
                .o_txpipe_rxpresethint({ pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint_0[2], pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint_0[1], pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint_0[0] }),
                .o_txpipe_rxstandby(pcie_pcs_tx_mux_u1__o_txpipe_rxstandby_0),
                .o_txpipe_rxtermination(pcie_pcs_tx_mux_u1__o_txpipe_rxtermination_0),
                .o_txpipe_srisenable(pcie_pcs_tx_mux_u1__o_txpipe_srisenable_0),
                .o_txpipe_txcmnmode_disable_a(pcie_pcs_tx_mux_u1__o_txpipe_txcmnmode_disable_a_0),
                .o_txpipe_txcompliance(pcie_pcs_tx_mux_u1__o_txpipe_txcompliance_0),
                .o_txpipe_txdata({ pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[39], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[38], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[37], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[36], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[35], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[34], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[33], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[32], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[31], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[30], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[29], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[28], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[27], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[26], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[25], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[24], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[23], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[22], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[21], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[20], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[19], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[18], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[17], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[16], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[15], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[14], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[13], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[12], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[11], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[10], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[9], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[8], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[7], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[6], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[5], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[4], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[3], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[2], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[1], pcie_pcs_tx_mux_u1__o_txpipe_txdata_0[0] }),
                .o_txpipe_txdatak({ pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0[3], pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0[2], pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0[1], pcie_pcs_tx_mux_u1__o_txpipe_txdatak_0[0] }),
                .o_txpipe_txdatavalid(pcie_pcs_tx_mux_u1__o_txpipe_txdatavalid_0),
                .o_txpipe_txdeemph({ pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[17], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[16], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[15], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[14], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[13], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[12], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[11], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[10], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[9], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[8], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[7], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[6], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[5], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[4], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[3], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[2], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[1], pcie_pcs_tx_mux_u1__o_txpipe_txdeemph_0[0] }),
                .o_txpipe_txdtctrx_lb(pcie_pcs_tx_mux_u1__o_txpipe_txdtctrx_lb_0),
                .o_txpipe_txelecidle(pcie_pcs_tx_mux_u1__o_txpipe_txelecidle_0),
                .o_txpipe_txmargin({ pcie_pcs_tx_mux_u1__o_txpipe_txmargin_0[2], pcie_pcs_tx_mux_u1__o_txpipe_txmargin_0[1], pcie_pcs_tx_mux_u1__o_txpipe_txmargin_0[0] }),
                .o_txpipe_txoneszeros(pcie_pcs_tx_mux_u1__o_txpipe_txoneszeros_0),
                .o_txpipe_txstartblock(pcie_pcs_tx_mux_u1__o_txpipe_txstartblock_0),
                .o_txpipe_txswing(pcie_pcs_tx_mux_u1__o_txpipe_txswing_0),
                .o_txpipe_txsyncheader({ pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0[3], pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0[2], pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0[1], pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader_0[0] }),
                .o_txpipe_width({ pcie_pcs_tx_mux_u1__o_txpipe_width_0[2], pcie_pcs_tx_mux_u1__o_txpipe_width_0[1], pcie_pcs_tx_mux_u1__o_txpipe_width_0[0] })
        );

        tennm_sm_hssi_pcie_pcs_tx_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_tx_mux_2__sel)
        ) x_mux_sm_hssi_pcie_pcs_tx_mux_2 (
                .i_hps_txpipe_asyncpowerchangeack(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_asyncpowerchangeack_0),
                .i_hps_txpipe_blockaligncontrol(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_blockaligncontrol_0),
                .i_hps_txpipe_cfg_hw_auto_sp_dis(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis_0),
                .i_hps_txpipe_dirchange(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_dirchange_0),
                .i_hps_txpipe_ebuf_mode(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_ebuf_mode_0),
                .i_hps_txpipe_encodedecodebypass(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_encodedecodebypass_0),
                .i_hps_txpipe_fs({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_fs_0[0] }),
                .i_hps_txpipe_getlocalpresetcoefficients(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients_0),
                .i_hps_txpipe_invalidrequest(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_invalidrequest_0),
                .i_hps_txpipe_lf({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lf_0[0] }),
                .i_hps_txpipe_localpresetindex({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_localpresetindex_0[0] }),
                .i_hps_txpipe_lowpin_nt(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_lowpin_nt_0),
                .i_hps_txpipe_m2p_bus({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_m2p_bus_0[0] }),
                .i_hps_txpipe_pclk_rate({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclk_rate_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclk_rate_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclk_rate_0[0] }),
                .i_hps_txpipe_pclkchangeack(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_pclkchangeack_0),
                .i_hps_txpipe_phy_mode_nt({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_phy_mode_nt_0[0] }),
                .i_hps_txpipe_powerdown({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_powerdown_0[0] }),
                .i_hps_txpipe_rate({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rate_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rate_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rate_0[0] }),
                .i_hps_txpipe_rxelecidle_disable_a(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a_0),
                .i_hps_txpipe_rxeqclr(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqclr_0),
                .i_hps_txpipe_rxeqeval(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqeval_0),
                .i_hps_txpipe_rxeqinprogress(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqinprogress_0),
                .i_hps_txpipe_rxeqtraining(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxeqtraining_0),
                .i_hps_txpipe_rxpolarity(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpolarity_0),
                .i_hps_txpipe_rxpresethint({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpresethint_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpresethint_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxpresethint_0[0] }),
                .i_hps_txpipe_rxstandby(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxstandby_0),
                .i_hps_txpipe_rxtermination(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_rxtermination_0),
                .i_hps_txpipe_srisenable(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_srisenable_0),
                .i_hps_txpipe_txcmnmode_disable_a(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a_0),
                .i_hps_txpipe_txcompliance(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txcompliance_0),
                .i_hps_txpipe_txdata({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[39], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[38], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[37], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[36], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[35], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[34], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[33], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[32], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[31], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[30], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[29], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[28], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[27], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[26], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[25], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[24], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[23], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[22], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[21], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[20], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[19], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[18], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[17], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[16], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[15], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[14], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[13], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[12], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[11], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[10], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[9], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[8], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdata_0[0] }),
                .i_hps_txpipe_txdatak({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatak_0[0] }),
                .i_hps_txpipe_txdatavalid(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdatavalid_0),
                .i_hps_txpipe_txdeemph({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[17], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[16], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[15], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[14], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[13], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[12], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[11], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[10], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[9], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[8], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[7], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[6], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[5], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[4], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdeemph_0[0] }),
                .i_hps_txpipe_txdtctrx_lb(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txdtctrx_lb_0),
                .i_hps_txpipe_txelecidle(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txelecidle_0),
                .i_hps_txpipe_txmargin({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txmargin_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txmargin_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txmargin_0[0] }),
                .i_hps_txpipe_txoneszeros(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txoneszeros_0),
                .i_hps_txpipe_txstartblock(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txstartblock_0),
                .i_hps_txpipe_txswing(pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txswing_0),
                .i_hps_txpipe_txsyncheader({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0[3], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_txsyncheader_0[0] }),
                .i_hps_txpipe_width({ pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_width_0[2], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_width_0[1], pcie_pcs_hpstx_demux_u0__o_hps_pcs2_enabled_txpipe_width_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_asyncpowerchangeack(o_txpipe2_asyncpowerchangeack_0),
                .i_same_quad_pcie_ctrl_txpipe_blockaligncontrol(o_txpipe2_blockaligncontrol_0),
                .i_same_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(o_txpipe2_cfg_hw_auto_sp_dis_0),
                .i_same_quad_pcie_ctrl_txpipe_dirchange(o_txpipe2_dirchange_0),
                .i_same_quad_pcie_ctrl_txpipe_ebuf_mode(o_txpipe2_ebuf_mode_0),
                .i_same_quad_pcie_ctrl_txpipe_encodedecodebypass(o_txpipe2_encodedecodebypass_0),
                .i_same_quad_pcie_ctrl_txpipe_fs({ o_txpipe2_fs_0[5], o_txpipe2_fs_0[4], o_txpipe2_fs_0[3], o_txpipe2_fs_0[2], o_txpipe2_fs_0[1], o_txpipe2_fs_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(o_txpipe2_getlocalpresetcoefficients_0),
                .i_same_quad_pcie_ctrl_txpipe_invalidrequest(o_txpipe2_invalidrequest_0),
                .i_same_quad_pcie_ctrl_txpipe_lf({ o_txpipe2_lf_0[5], o_txpipe2_lf_0[4], o_txpipe2_lf_0[3], o_txpipe2_lf_0[2], o_txpipe2_lf_0[1], o_txpipe2_lf_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_localpresetindex({ o_txpipe2_localpresetindex_0[4], o_txpipe2_localpresetindex_0[3], o_txpipe2_localpresetindex_0[2], o_txpipe2_localpresetindex_0[1], o_txpipe2_localpresetindex_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_lowpin_nt(o_txpipe2_lowpin_nt_0),
                .i_same_quad_pcie_ctrl_txpipe_m2p_bus({ o_txpipe2_m2p_bus_0[7], o_txpipe2_m2p_bus_0[6], o_txpipe2_m2p_bus_0[5], o_txpipe2_m2p_bus_0[4], o_txpipe2_m2p_bus_0[3], o_txpipe2_m2p_bus_0[2], o_txpipe2_m2p_bus_0[1], o_txpipe2_m2p_bus_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_pclk_rate({ o_txpipe2_pclk_rate_0[2], o_txpipe2_pclk_rate_0[1], o_txpipe2_pclk_rate_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_pclkchangeack(o_txpipe2_pclkchangeack_0),
                .i_same_quad_pcie_ctrl_txpipe_phy_mode_nt({ o_txpipe2_phy_mode_nt_0[3], o_txpipe2_phy_mode_nt_0[2], o_txpipe2_phy_mode_nt_0[1], o_txpipe2_phy_mode_nt_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_powerdown({ o_txpipe2_powerdown_0[3], o_txpipe2_powerdown_0[2], o_txpipe2_powerdown_0[1], o_txpipe2_powerdown_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rate({ o_txpipe2_rate_0[2], o_txpipe2_rate_0[1], o_txpipe2_rate_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(o_txpipe2_rxelecidle_disable_a_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqclr(o_txpipe2_rxeqclr_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqeval(o_txpipe2_rxeqeval_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqinprogress(o_txpipe2_rxeqinprogress_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqtraining(o_txpipe2_rxeqtraining_0),
                .i_same_quad_pcie_ctrl_txpipe_rxpolarity(o_txpipe2_rxpolarity_0),
                .i_same_quad_pcie_ctrl_txpipe_rxpresethint({ o_txpipe2_rxpresethint_0[2], o_txpipe2_rxpresethint_0[1], o_txpipe2_rxpresethint_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rxstandby(o_txpipe2_rxstandby_0),
                .i_same_quad_pcie_ctrl_txpipe_rxtermination(o_txpipe2_rxtermination_0),
                .i_same_quad_pcie_ctrl_txpipe_srisenable(o_txpipe2_srisenable_0),
                .i_same_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(o_txpipe2_txcmnmode_disable_a_0),
                .i_same_quad_pcie_ctrl_txpipe_txcompliance(o_txpipe2_txcompliance_0),
                .i_same_quad_pcie_ctrl_txpipe_txdata({ o_txpipe2_txdata_0[39], o_txpipe2_txdata_0[38], o_txpipe2_txdata_0[37], o_txpipe2_txdata_0[36], o_txpipe2_txdata_0[35], o_txpipe2_txdata_0[34], o_txpipe2_txdata_0[33], o_txpipe2_txdata_0[32], o_txpipe2_txdata_0[31], o_txpipe2_txdata_0[30], o_txpipe2_txdata_0[29], o_txpipe2_txdata_0[28], o_txpipe2_txdata_0[27], o_txpipe2_txdata_0[26], o_txpipe2_txdata_0[25], o_txpipe2_txdata_0[24], o_txpipe2_txdata_0[23], o_txpipe2_txdata_0[22], o_txpipe2_txdata_0[21], o_txpipe2_txdata_0[20], o_txpipe2_txdata_0[19], o_txpipe2_txdata_0[18], o_txpipe2_txdata_0[17], o_txpipe2_txdata_0[16], o_txpipe2_txdata_0[15], o_txpipe2_txdata_0[14], o_txpipe2_txdata_0[13], o_txpipe2_txdata_0[12], o_txpipe2_txdata_0[11], o_txpipe2_txdata_0[10], o_txpipe2_txdata_0[9], o_txpipe2_txdata_0[8], o_txpipe2_txdata_0[7], o_txpipe2_txdata_0[6], o_txpipe2_txdata_0[5], o_txpipe2_txdata_0[4], o_txpipe2_txdata_0[3], o_txpipe2_txdata_0[2], o_txpipe2_txdata_0[1], o_txpipe2_txdata_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdatak({ o_txpipe2_txdatak_0[3], o_txpipe2_txdatak_0[2], o_txpipe2_txdatak_0[1], o_txpipe2_txdatak_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdatavalid(o_txpipe2_txdatavalid_0),
                .i_same_quad_pcie_ctrl_txpipe_txdeemph({ o_txpipe2_txdeemph_0[17], o_txpipe2_txdeemph_0[16], o_txpipe2_txdeemph_0[15], o_txpipe2_txdeemph_0[14], o_txpipe2_txdeemph_0[13], o_txpipe2_txdeemph_0[12], o_txpipe2_txdeemph_0[11], o_txpipe2_txdeemph_0[10], o_txpipe2_txdeemph_0[9], o_txpipe2_txdeemph_0[8], o_txpipe2_txdeemph_0[7], o_txpipe2_txdeemph_0[6], o_txpipe2_txdeemph_0[5], o_txpipe2_txdeemph_0[4], o_txpipe2_txdeemph_0[3], o_txpipe2_txdeemph_0[2], o_txpipe2_txdeemph_0[1], o_txpipe2_txdeemph_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdtctrx_lb(o_txpipe2_txdtctrx_lb_0),
                .i_same_quad_pcie_ctrl_txpipe_txelecidle(o_txpipe2_txelecidle_0),
                .i_same_quad_pcie_ctrl_txpipe_txmargin({ o_txpipe2_txmargin_0[2], o_txpipe2_txmargin_0[1], o_txpipe2_txmargin_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txoneszeros(o_txpipe2_txoneszeros_0),
                .i_same_quad_pcie_ctrl_txpipe_txstartblock(o_txpipe2_txstartblock_0),
                .i_same_quad_pcie_ctrl_txpipe_txswing(o_txpipe2_txswing_0),
                .i_same_quad_pcie_ctrl_txpipe_txsyncheader({ o_txpipe2_txsyncheader_0[3], o_txpipe2_txsyncheader_0[2], o_txpipe2_txsyncheader_0[1], o_txpipe2_txsyncheader_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_width({ o_txpipe2_width_0[2], o_txpipe2_width_0[1], o_txpipe2_width_0[0] }),
                .i_unused_txpipe_asyncpowerchangeack(n1_5),
                .i_unused_txpipe_blockaligncontrol(n1_5),
                .i_unused_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_unused_txpipe_dirchange(n1_5),
                .i_unused_txpipe_ebuf_mode(n1_5),
                .i_unused_txpipe_encodedecodebypass(n1_5),
                .i_unused_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_getlocalpresetcoefficients(n1_5),
                .i_unused_txpipe_invalidrequest(n1_5),
                .i_unused_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_lowpin_nt(n1_5),
                .i_unused_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_pclkchangeack(n1_5),
                .i_unused_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rxelecidle_disable_a(n1_5),
                .i_unused_txpipe_rxeqclr(n1_5),
                .i_unused_txpipe_rxeqeval(n1_5),
                .i_unused_txpipe_rxeqinprogress(n1_5),
                .i_unused_txpipe_rxeqtraining(n1_5),
                .i_unused_txpipe_rxpolarity(n1_5),
                .i_unused_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rxstandby(n1_5),
                .i_unused_txpipe_rxtermination(n1_5),
                .i_unused_txpipe_srisenable(n1_5),
                .i_unused_txpipe_txcmnmode_disable_a(n1_5),
                .i_unused_txpipe_txcompliance(n1_5),
                .i_unused_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdatavalid(n1_5),
                .i_unused_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdtctrx_lb(n1_5),
                .i_unused_txpipe_txelecidle(n1_5),
                .i_unused_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txoneszeros(n1_5),
                .i_unused_txpipe_txstartblock(n1_5),
                .i_unused_txpipe_txswing(n1_5),
                .i_unused_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_width({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_asyncpowerchangeack(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_blockaligncontrol(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_dirchange(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_ebuf_mode(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_encodedecodebypass(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_invalidrequest(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_lowpin_nt(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_pclkchangeack(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqclr(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqeval(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqinprogress(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqtraining(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxpolarity(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rxstandby(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxtermination(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_srisenable(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txcompliance(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdatavalid(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdtctrx_lb(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txelecidle(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txoneszeros(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txstartblock(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txswing(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_width({ n1_5, n1_5, n1_5 }),
                .o_txpipe_asyncpowerchangeack(pcie_pcs_tx_mux_u2__o_txpipe_asyncpowerchangeack_0),
                .o_txpipe_blockaligncontrol(pcie_pcs_tx_mux_u2__o_txpipe_blockaligncontrol_0),
                .o_txpipe_cfg_hw_auto_sp_dis(pcie_pcs_tx_mux_u2__o_txpipe_cfg_hw_auto_sp_dis_0),
                .o_txpipe_dirchange(pcie_pcs_tx_mux_u2__o_txpipe_dirchange_0),
                .o_txpipe_ebuf_mode(pcie_pcs_tx_mux_u2__o_txpipe_ebuf_mode_0),
                .o_txpipe_encodedecodebypass(pcie_pcs_tx_mux_u2__o_txpipe_encodedecodebypass_0),
                .o_txpipe_fs({ pcie_pcs_tx_mux_u2__o_txpipe_fs_0[5], pcie_pcs_tx_mux_u2__o_txpipe_fs_0[4], pcie_pcs_tx_mux_u2__o_txpipe_fs_0[3], pcie_pcs_tx_mux_u2__o_txpipe_fs_0[2], pcie_pcs_tx_mux_u2__o_txpipe_fs_0[1], pcie_pcs_tx_mux_u2__o_txpipe_fs_0[0] }),
                .o_txpipe_getlocalpresetcoefficients(pcie_pcs_tx_mux_u2__o_txpipe_getlocalpresetcoefficients_0),
                .o_txpipe_invalidrequest(pcie_pcs_tx_mux_u2__o_txpipe_invalidrequest_0),
                .o_txpipe_lf({ pcie_pcs_tx_mux_u2__o_txpipe_lf_0[5], pcie_pcs_tx_mux_u2__o_txpipe_lf_0[4], pcie_pcs_tx_mux_u2__o_txpipe_lf_0[3], pcie_pcs_tx_mux_u2__o_txpipe_lf_0[2], pcie_pcs_tx_mux_u2__o_txpipe_lf_0[1], pcie_pcs_tx_mux_u2__o_txpipe_lf_0[0] }),
                .o_txpipe_localpresetindex({ pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[4], pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[3], pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[2], pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[1], pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex_0[0] }),
                .o_txpipe_lowpin_nt(pcie_pcs_tx_mux_u2__o_txpipe_lowpin_nt_0),
                .o_txpipe_m2p_bus({ pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[7], pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[6], pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[5], pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[4], pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[3], pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[2], pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[1], pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus_0[0] }),
                .o_txpipe_pclk_rate({ pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate_0[2], pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate_0[1], pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate_0[0] }),
                .o_txpipe_pclkchangeack(pcie_pcs_tx_mux_u2__o_txpipe_pclkchangeack_0),
                .o_txpipe_phy_mode_nt({ pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0[3], pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0[2], pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0[1], pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt_0[0] }),
                .o_txpipe_powerdown({ pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0[3], pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0[2], pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0[1], pcie_pcs_tx_mux_u2__o_txpipe_powerdown_0[0] }),
                .o_txpipe_rate({ pcie_pcs_tx_mux_u2__o_txpipe_rate_0[2], pcie_pcs_tx_mux_u2__o_txpipe_rate_0[1], pcie_pcs_tx_mux_u2__o_txpipe_rate_0[0] }),
                .o_txpipe_rxelecidle_disable_a(pcie_pcs_tx_mux_u2__o_txpipe_rxelecidle_disable_a_0),
                .o_txpipe_rxeqclr(pcie_pcs_tx_mux_u2__o_txpipe_rxeqclr_0),
                .o_txpipe_rxeqeval(pcie_pcs_tx_mux_u2__o_txpipe_rxeqeval_0),
                .o_txpipe_rxeqinprogress(pcie_pcs_tx_mux_u2__o_txpipe_rxeqinprogress_0),
                .o_txpipe_rxeqtraining(pcie_pcs_tx_mux_u2__o_txpipe_rxeqtraining_0),
                .o_txpipe_rxpolarity(pcie_pcs_tx_mux_u2__o_txpipe_rxpolarity_0),
                .o_txpipe_rxpresethint({ pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint_0[2], pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint_0[1], pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint_0[0] }),
                .o_txpipe_rxstandby(pcie_pcs_tx_mux_u2__o_txpipe_rxstandby_0),
                .o_txpipe_rxtermination(pcie_pcs_tx_mux_u2__o_txpipe_rxtermination_0),
                .o_txpipe_srisenable(pcie_pcs_tx_mux_u2__o_txpipe_srisenable_0),
                .o_txpipe_txcmnmode_disable_a(pcie_pcs_tx_mux_u2__o_txpipe_txcmnmode_disable_a_0),
                .o_txpipe_txcompliance(pcie_pcs_tx_mux_u2__o_txpipe_txcompliance_0),
                .o_txpipe_txdata({ pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[39], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[38], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[37], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[36], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[35], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[34], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[33], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[32], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[31], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[30], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[29], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[28], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[27], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[26], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[25], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[24], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[23], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[22], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[21], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[20], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[19], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[18], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[17], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[16], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[15], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[14], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[13], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[12], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[11], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[10], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[9], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[8], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[7], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[6], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[5], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[4], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[3], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[2], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[1], pcie_pcs_tx_mux_u2__o_txpipe_txdata_0[0] }),
                .o_txpipe_txdatak({ pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0[3], pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0[2], pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0[1], pcie_pcs_tx_mux_u2__o_txpipe_txdatak_0[0] }),
                .o_txpipe_txdatavalid(pcie_pcs_tx_mux_u2__o_txpipe_txdatavalid_0),
                .o_txpipe_txdeemph({ pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[17], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[16], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[15], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[14], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[13], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[12], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[11], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[10], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[9], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[8], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[7], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[6], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[5], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[4], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[3], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[2], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[1], pcie_pcs_tx_mux_u2__o_txpipe_txdeemph_0[0] }),
                .o_txpipe_txdtctrx_lb(pcie_pcs_tx_mux_u2__o_txpipe_txdtctrx_lb_0),
                .o_txpipe_txelecidle(pcie_pcs_tx_mux_u2__o_txpipe_txelecidle_0),
                .o_txpipe_txmargin({ pcie_pcs_tx_mux_u2__o_txpipe_txmargin_0[2], pcie_pcs_tx_mux_u2__o_txpipe_txmargin_0[1], pcie_pcs_tx_mux_u2__o_txpipe_txmargin_0[0] }),
                .o_txpipe_txoneszeros(pcie_pcs_tx_mux_u2__o_txpipe_txoneszeros_0),
                .o_txpipe_txstartblock(pcie_pcs_tx_mux_u2__o_txpipe_txstartblock_0),
                .o_txpipe_txswing(pcie_pcs_tx_mux_u2__o_txpipe_txswing_0),
                .o_txpipe_txsyncheader({ pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0[3], pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0[2], pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0[1], pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader_0[0] }),
                .o_txpipe_width({ pcie_pcs_tx_mux_u2__o_txpipe_width_0[2], pcie_pcs_tx_mux_u2__o_txpipe_width_0[1], pcie_pcs_tx_mux_u2__o_txpipe_width_0[0] })
        );

        tennm_sm_hssi_pcie_pcs_tx_mux #(
                .sel(x_mux_sm_hssi_pcie_pcs_tx_mux_3__sel)
        ) x_mux_sm_hssi_pcie_pcs_tx_mux_3 (
                .i_hps_txpipe_asyncpowerchangeack(n1_5),
                .i_hps_txpipe_blockaligncontrol(n1_5),
                .i_hps_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_hps_txpipe_dirchange(n1_5),
                .i_hps_txpipe_ebuf_mode(n1_5),
                .i_hps_txpipe_encodedecodebypass(n1_5),
                .i_hps_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_getlocalpresetcoefficients(n1_5),
                .i_hps_txpipe_invalidrequest(n1_5),
                .i_hps_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_lowpin_nt(n1_5),
                .i_hps_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_pclkchangeack(n1_5),
                .i_hps_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_rxelecidle_disable_a(n1_5),
                .i_hps_txpipe_rxeqclr(n1_5),
                .i_hps_txpipe_rxeqeval(n1_5),
                .i_hps_txpipe_rxeqinprogress(n1_5),
                .i_hps_txpipe_rxeqtraining(n1_5),
                .i_hps_txpipe_rxpolarity(n1_5),
                .i_hps_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_rxstandby(n1_5),
                .i_hps_txpipe_rxtermination(n1_5),
                .i_hps_txpipe_srisenable(n1_5),
                .i_hps_txpipe_txcmnmode_disable_a(n1_5),
                .i_hps_txpipe_txcompliance(n1_5),
                .i_hps_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_txdatavalid(n1_5),
                .i_hps_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_txdtctrx_lb(n1_5),
                .i_hps_txpipe_txelecidle(n1_5),
                .i_hps_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_txoneszeros(n1_5),
                .i_hps_txpipe_txstartblock(n1_5),
                .i_hps_txpipe_txswing(n1_5),
                .i_hps_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_hps_txpipe_width({ n1_5, n1_5, n1_5 }),
                .i_same_quad_pcie_ctrl_txpipe_asyncpowerchangeack(o_txpipe3_asyncpowerchangeack_0),
                .i_same_quad_pcie_ctrl_txpipe_blockaligncontrol(o_txpipe3_blockaligncontrol_0),
                .i_same_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(o_txpipe3_cfg_hw_auto_sp_dis_0),
                .i_same_quad_pcie_ctrl_txpipe_dirchange(o_txpipe3_dirchange_0),
                .i_same_quad_pcie_ctrl_txpipe_ebuf_mode(o_txpipe3_ebuf_mode_0),
                .i_same_quad_pcie_ctrl_txpipe_encodedecodebypass(o_txpipe3_encodedecodebypass_0),
                .i_same_quad_pcie_ctrl_txpipe_fs({ o_txpipe3_fs_0[5], o_txpipe3_fs_0[4], o_txpipe3_fs_0[3], o_txpipe3_fs_0[2], o_txpipe3_fs_0[1], o_txpipe3_fs_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(o_txpipe3_getlocalpresetcoefficients_0),
                .i_same_quad_pcie_ctrl_txpipe_invalidrequest(o_txpipe3_invalidrequest_0),
                .i_same_quad_pcie_ctrl_txpipe_lf({ o_txpipe3_lf_0[5], o_txpipe3_lf_0[4], o_txpipe3_lf_0[3], o_txpipe3_lf_0[2], o_txpipe3_lf_0[1], o_txpipe3_lf_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_localpresetindex({ o_txpipe3_localpresetindex_0[4], o_txpipe3_localpresetindex_0[3], o_txpipe3_localpresetindex_0[2], o_txpipe3_localpresetindex_0[1], o_txpipe3_localpresetindex_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_lowpin_nt(o_txpipe3_lowpin_nt_0),
                .i_same_quad_pcie_ctrl_txpipe_m2p_bus({ o_txpipe3_m2p_bus_0[7], o_txpipe3_m2p_bus_0[6], o_txpipe3_m2p_bus_0[5], o_txpipe3_m2p_bus_0[4], o_txpipe3_m2p_bus_0[3], o_txpipe3_m2p_bus_0[2], o_txpipe3_m2p_bus_0[1], o_txpipe3_m2p_bus_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_pclk_rate({ o_txpipe3_pclk_rate_0[2], o_txpipe3_pclk_rate_0[1], o_txpipe3_pclk_rate_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_pclkchangeack(o_txpipe3_pclkchangeack_0),
                .i_same_quad_pcie_ctrl_txpipe_phy_mode_nt({ o_txpipe3_phy_mode_nt_0[3], o_txpipe3_phy_mode_nt_0[2], o_txpipe3_phy_mode_nt_0[1], o_txpipe3_phy_mode_nt_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_powerdown({ o_txpipe3_powerdown_0[3], o_txpipe3_powerdown_0[2], o_txpipe3_powerdown_0[1], o_txpipe3_powerdown_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rate({ o_txpipe3_rate_0[2], o_txpipe3_rate_0[1], o_txpipe3_rate_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(o_txpipe3_rxelecidle_disable_a_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqclr(o_txpipe3_rxeqclr_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqeval(o_txpipe3_rxeqeval_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqinprogress(o_txpipe3_rxeqinprogress_0),
                .i_same_quad_pcie_ctrl_txpipe_rxeqtraining(o_txpipe3_rxeqtraining_0),
                .i_same_quad_pcie_ctrl_txpipe_rxpolarity(o_txpipe3_rxpolarity_0),
                .i_same_quad_pcie_ctrl_txpipe_rxpresethint({ o_txpipe3_rxpresethint_0[2], o_txpipe3_rxpresethint_0[1], o_txpipe3_rxpresethint_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_rxstandby(o_txpipe3_rxstandby_0),
                .i_same_quad_pcie_ctrl_txpipe_rxtermination(o_txpipe3_rxtermination_0),
                .i_same_quad_pcie_ctrl_txpipe_srisenable(o_txpipe3_srisenable_0),
                .i_same_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(o_txpipe3_txcmnmode_disable_a_0),
                .i_same_quad_pcie_ctrl_txpipe_txcompliance(o_txpipe3_txcompliance_0),
                .i_same_quad_pcie_ctrl_txpipe_txdata({ o_txpipe3_txdata_0[39], o_txpipe3_txdata_0[38], o_txpipe3_txdata_0[37], o_txpipe3_txdata_0[36], o_txpipe3_txdata_0[35], o_txpipe3_txdata_0[34], o_txpipe3_txdata_0[33], o_txpipe3_txdata_0[32], o_txpipe3_txdata_0[31], o_txpipe3_txdata_0[30], o_txpipe3_txdata_0[29], o_txpipe3_txdata_0[28], o_txpipe3_txdata_0[27], o_txpipe3_txdata_0[26], o_txpipe3_txdata_0[25], o_txpipe3_txdata_0[24], o_txpipe3_txdata_0[23], o_txpipe3_txdata_0[22], o_txpipe3_txdata_0[21], o_txpipe3_txdata_0[20], o_txpipe3_txdata_0[19], o_txpipe3_txdata_0[18], o_txpipe3_txdata_0[17], o_txpipe3_txdata_0[16], o_txpipe3_txdata_0[15], o_txpipe3_txdata_0[14], o_txpipe3_txdata_0[13], o_txpipe3_txdata_0[12], o_txpipe3_txdata_0[11], o_txpipe3_txdata_0[10], o_txpipe3_txdata_0[9], o_txpipe3_txdata_0[8], o_txpipe3_txdata_0[7], o_txpipe3_txdata_0[6], o_txpipe3_txdata_0[5], o_txpipe3_txdata_0[4], o_txpipe3_txdata_0[3], o_txpipe3_txdata_0[2], o_txpipe3_txdata_0[1], o_txpipe3_txdata_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdatak({ o_txpipe3_txdatak_0[3], o_txpipe3_txdatak_0[2], o_txpipe3_txdatak_0[1], o_txpipe3_txdatak_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdatavalid(o_txpipe3_txdatavalid_0),
                .i_same_quad_pcie_ctrl_txpipe_txdeemph({ o_txpipe3_txdeemph_0[17], o_txpipe3_txdeemph_0[16], o_txpipe3_txdeemph_0[15], o_txpipe3_txdeemph_0[14], o_txpipe3_txdeemph_0[13], o_txpipe3_txdeemph_0[12], o_txpipe3_txdeemph_0[11], o_txpipe3_txdeemph_0[10], o_txpipe3_txdeemph_0[9], o_txpipe3_txdeemph_0[8], o_txpipe3_txdeemph_0[7], o_txpipe3_txdeemph_0[6], o_txpipe3_txdeemph_0[5], o_txpipe3_txdeemph_0[4], o_txpipe3_txdeemph_0[3], o_txpipe3_txdeemph_0[2], o_txpipe3_txdeemph_0[1], o_txpipe3_txdeemph_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txdtctrx_lb(o_txpipe3_txdtctrx_lb_0),
                .i_same_quad_pcie_ctrl_txpipe_txelecidle(o_txpipe3_txelecidle_0),
                .i_same_quad_pcie_ctrl_txpipe_txmargin({ o_txpipe3_txmargin_0[2], o_txpipe3_txmargin_0[1], o_txpipe3_txmargin_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_txoneszeros(o_txpipe3_txoneszeros_0),
                .i_same_quad_pcie_ctrl_txpipe_txstartblock(o_txpipe3_txstartblock_0),
                .i_same_quad_pcie_ctrl_txpipe_txswing(o_txpipe3_txswing_0),
                .i_same_quad_pcie_ctrl_txpipe_txsyncheader({ o_txpipe3_txsyncheader_0[3], o_txpipe3_txsyncheader_0[2], o_txpipe3_txsyncheader_0[1], o_txpipe3_txsyncheader_0[0] }),
                .i_same_quad_pcie_ctrl_txpipe_width({ o_txpipe3_width_0[2], o_txpipe3_width_0[1], o_txpipe3_width_0[0] }),
                .i_unused_txpipe_asyncpowerchangeack(n1_5),
                .i_unused_txpipe_blockaligncontrol(n1_5),
                .i_unused_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_unused_txpipe_dirchange(n1_5),
                .i_unused_txpipe_ebuf_mode(n1_5),
                .i_unused_txpipe_encodedecodebypass(n1_5),
                .i_unused_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_getlocalpresetcoefficients(n1_5),
                .i_unused_txpipe_invalidrequest(n1_5),
                .i_unused_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_localpresetindex({ n1_5, n1_5, n1_5, n1_5, n1_5 }),
               .i_unused_txpipe_lowpin_nt(n1_5),
                .i_unused_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_pclkchangeack(n1_5),
                .i_unused_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rxelecidle_disable_a(n1_5),
                .i_unused_txpipe_rxeqclr(n1_5),
                .i_unused_txpipe_rxeqeval(n1_5),
                .i_unused_txpipe_rxeqinprogress(n1_5),
                .i_unused_txpipe_rxeqtraining(n1_5),
                .i_unused_txpipe_rxpolarity(n1_5),
                .i_unused_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_rxstandby(n1_5),
                .i_unused_txpipe_rxtermination(n1_5),
                .i_unused_txpipe_srisenable(n1_5),
                .i_unused_txpipe_txcmnmode_disable_a(n1_5),
                .i_unused_txpipe_txcompliance(n1_5),
                .i_unused_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdatavalid(n1_5),
                .i_unused_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txdtctrx_lb(n1_5),
                .i_unused_txpipe_txelecidle(n1_5),
                .i_unused_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_txoneszeros(n1_5),
                .i_unused_txpipe_txstartblock(n1_5),
                .i_unused_txpipe_txswing(n1_5),
                .i_unused_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_unused_txpipe_width({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_asyncpowerchangeack(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_blockaligncontrol(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_dirchange(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_ebuf_mode(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_encodedecodebypass(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_fs({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_invalidrequest(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_lf({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_m2p_bus({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_pclk_rate({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_pclkchangeack(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_phy_mode_nt({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_powerdown({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rate({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqclr(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqeval(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqinprogress(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxeqtraining(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxpolarity(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxpresethint({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_rxstandby(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_rxtermination(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_srisenable(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txcompliance(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txdata({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdatak({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdatavalid(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txdeemph({ n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txdtctrx_lb(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txelecidle(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txmargin({ n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_txoneszeros(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txstartblock(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txswing(n1_5),
                .i_upper_quad_pcie_ctrl_txpipe_txsyncheader({ n1_5, n1_5, n1_5, n1_5 }),
                .i_upper_quad_pcie_ctrl_txpipe_width({ n1_5, n1_5, n1_5 }),
                .o_txpipe_asyncpowerchangeack(pcie_pcs_tx_mux_u3__o_txpipe_asyncpowerchangeack_0),
                .o_txpipe_blockaligncontrol(pcie_pcs_tx_mux_u3__o_txpipe_blockaligncontrol_0),
                .o_txpipe_cfg_hw_auto_sp_dis(pcie_pcs_tx_mux_u3__o_txpipe_cfg_hw_auto_sp_dis_0),
                .o_txpipe_dirchange(pcie_pcs_tx_mux_u3__o_txpipe_dirchange_0),
                .o_txpipe_ebuf_mode(pcie_pcs_tx_mux_u3__o_txpipe_ebuf_mode_0),
                .o_txpipe_encodedecodebypass(pcie_pcs_tx_mux_u3__o_txpipe_encodedecodebypass_0),
                .o_txpipe_fs({ pcie_pcs_tx_mux_u3__o_txpipe_fs_0[5], pcie_pcs_tx_mux_u3__o_txpipe_fs_0[4], pcie_pcs_tx_mux_u3__o_txpipe_fs_0[3], pcie_pcs_tx_mux_u3__o_txpipe_fs_0[2], pcie_pcs_tx_mux_u3__o_txpipe_fs_0[1], pcie_pcs_tx_mux_u3__o_txpipe_fs_0[0] }),
                .o_txpipe_getlocalpresetcoefficients(pcie_pcs_tx_mux_u3__o_txpipe_getlocalpresetcoefficients_0),
                .o_txpipe_invalidrequest(pcie_pcs_tx_mux_u3__o_txpipe_invalidrequest_0),
                .o_txpipe_lf({ pcie_pcs_tx_mux_u3__o_txpipe_lf_0[5], pcie_pcs_tx_mux_u3__o_txpipe_lf_0[4], pcie_pcs_tx_mux_u3__o_txpipe_lf_0[3], pcie_pcs_tx_mux_u3__o_txpipe_lf_0[2], pcie_pcs_tx_mux_u3__o_txpipe_lf_0[1], pcie_pcs_tx_mux_u3__o_txpipe_lf_0[0] }),
                .o_txpipe_localpresetindex({ pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[4], pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[3], pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[2], pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[1], pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex_0[0] }),
                .o_txpipe_lowpin_nt(pcie_pcs_tx_mux_u3__o_txpipe_lowpin_nt_0),
                .o_txpipe_m2p_bus({ pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[7], pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[6], pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[5], pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[4], pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[3], pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[2], pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[1], pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus_0[0] }),
                .o_txpipe_pclk_rate({ pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate_0[2], pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate_0[1], pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate_0[0] }),
                .o_txpipe_pclkchangeack(pcie_pcs_tx_mux_u3__o_txpipe_pclkchangeack_0),
                .o_txpipe_phy_mode_nt({ pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0[3], pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0[2], pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0[1], pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt_0[0] }),
                .o_txpipe_powerdown({ pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0[3], pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0[2], pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0[1], pcie_pcs_tx_mux_u3__o_txpipe_powerdown_0[0] }),
                .o_txpipe_rate({ pcie_pcs_tx_mux_u3__o_txpipe_rate_0[2], pcie_pcs_tx_mux_u3__o_txpipe_rate_0[1], pcie_pcs_tx_mux_u3__o_txpipe_rate_0[0] }),
                .o_txpipe_rxelecidle_disable_a(pcie_pcs_tx_mux_u3__o_txpipe_rxelecidle_disable_a_0),
                .o_txpipe_rxeqclr(pcie_pcs_tx_mux_u3__o_txpipe_rxeqclr_0),
                .o_txpipe_rxeqeval(pcie_pcs_tx_mux_u3__o_txpipe_rxeqeval_0),
                .o_txpipe_rxeqinprogress(pcie_pcs_tx_mux_u3__o_txpipe_rxeqinprogress_0),
                .o_txpipe_rxeqtraining(pcie_pcs_tx_mux_u3__o_txpipe_rxeqtraining_0),
                .o_txpipe_rxpolarity(pcie_pcs_tx_mux_u3__o_txpipe_rxpolarity_0),
                .o_txpipe_rxpresethint({ pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint_0[2], pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint_0[1], pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint_0[0] }),
                .o_txpipe_rxstandby(pcie_pcs_tx_mux_u3__o_txpipe_rxstandby_0),
                .o_txpipe_rxtermination(pcie_pcs_tx_mux_u3__o_txpipe_rxtermination_0),
                .o_txpipe_srisenable(pcie_pcs_tx_mux_u3__o_txpipe_srisenable_0),
                .o_txpipe_txcmnmode_disable_a(pcie_pcs_tx_mux_u3__o_txpipe_txcmnmode_disable_a_0),
                .o_txpipe_txcompliance(pcie_pcs_tx_mux_u3__o_txpipe_txcompliance_0),
                .o_txpipe_txdata({ pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[39], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[38], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[37], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[36], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[35], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[34], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[33], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[32], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[31], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[30], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[29], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[28], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[27], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[26], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[25], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[24], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[23], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[22], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[21], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[20], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[19], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[18], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[17], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[16], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[15], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[14], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[13], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[12], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[11], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[10], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[9], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[8], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[7], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[6], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[5], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[4], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[3], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[2], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[1], pcie_pcs_tx_mux_u3__o_txpipe_txdata_0[0] }),
                .o_txpipe_txdatak({ pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0[3], pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0[2], pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0[1], pcie_pcs_tx_mux_u3__o_txpipe_txdatak_0[0] }),
                .o_txpipe_txdatavalid(pcie_pcs_tx_mux_u3__o_txpipe_txdatavalid_0),
                .o_txpipe_txdeemph({ pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[17], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[16], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[15], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[14], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[13], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[12], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[11], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[10], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[9], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[8], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[7], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[6], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[5], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[4], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[3], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[2], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[1], pcie_pcs_tx_mux_u3__o_txpipe_txdeemph_0[0] }),
                .o_txpipe_txdtctrx_lb(pcie_pcs_tx_mux_u3__o_txpipe_txdtctrx_lb_0),
                .o_txpipe_txelecidle(pcie_pcs_tx_mux_u3__o_txpipe_txelecidle_0),
                .o_txpipe_txmargin({ pcie_pcs_tx_mux_u3__o_txpipe_txmargin_0[2], pcie_pcs_tx_mux_u3__o_txpipe_txmargin_0[1], pcie_pcs_tx_mux_u3__o_txpipe_txmargin_0[0] }),
                .o_txpipe_txoneszeros(pcie_pcs_tx_mux_u3__o_txpipe_txoneszeros_0),
                .o_txpipe_txstartblock(pcie_pcs_tx_mux_u3__o_txpipe_txstartblock_0),
                .o_txpipe_txswing(pcie_pcs_tx_mux_u3__o_txpipe_txswing_0),
                .o_txpipe_txsyncheader({ pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0[3], pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0[2], pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0[1], pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader_0[0] }),
                .o_txpipe_width({ pcie_pcs_tx_mux_u3__o_txpipe_width_0[2], pcie_pcs_tx_mux_u3__o_txpipe_width_0[1], pcie_pcs_tx_mux_u3__o_txpipe_width_0[0] })
        );

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iWZfLCRQjuc87I83kTmQGfuF5C2xFgFuJarJIIXh4hvsOQmRxzJu/cjdVoL9x9CBeSLwWsUW8T2d9Yj+7TYBUY4i2leN9Q/DWolDZysrX4+2w087ip224L9sDKMP/qgTf2G+iebtIRvHFLjfxEf+ULR6k1dQvgfd+VEmpe/fRKtGwEm5ksA1r4BBGI+5wPuHCOTjlPHcqtIp6BQwnPAV1XVsT1O+piBA+MGd4D5t1IV/COXpoQUXfNwy9Y7fneqGQCwFpvP2HksPWx0j8nJ3MKK0wgKz1TLpgs9BCCIo8sFaO5qzcnJLLt1xjERwVaITLtqHIJ3I/WF0B5bf55R6Ag0eW3qXjj+1U3YM2pg24+VbYYXS57EhSu/ucHtGzufLr7hXqWfvkuR7jF8krNVysTr+UhNNEJpKOhVleeZxRAnIGiQ9v0Db+M2MkHRVMVwUM4KtTvk/hCx5Jj01GqCsBowITGBhnoEK6nI/WgFRYIAvIrSOrEqYYOem7W6Idb49Wt8aZAWGUQHQDsHr3S8CYFoyz7v7wGfOeSTsobmUmY82pukqQEjsUVsEEdYB5c0kvS20y2rFr3R7ZGi8LZSo/sUlU2+Ejtk5FPXDQOAjDH4UxwjlAVAbkxYPkL1Co/L9fnAqIXs7tqIx/8tUBJFZWq6fB9Kz2yggssrrQ4xjVsJgEhZ8OLvZU6qzTrb0tPDeHQt+11TSvMVFKZinKO2wKwfrOqTph+ExYTfVTr4kRs7dFW8OytYBYGbjmMG9l+GhZPa8iDpsuBmGEWhx05l8EeVnDck5nzY4Dv7oUfhryCXz5nWSr7UcMnaeFlp1DmsabyPUaqYB0HwtHVLwDv5hCb+1y+5/nOui/D9ETul+x6bMqlO3W7+bmBAEbCuhW2yZaJlGNFZJMCgp8i89OHlNo7QsM4edGtFlJrKP3llbdPp4PEGZi8RRrdW0GLzs0W4IGmF/1F1jdzRlPvp5662p+tYE6OwDS9QhMBIYzyUUbE/6ZuGxHdkyUs2YCfRR0ViA"
`endif