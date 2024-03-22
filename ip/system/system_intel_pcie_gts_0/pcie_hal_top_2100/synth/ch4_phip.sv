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


module ch4_phip # (
        parameter x_mux_sm_hssi_pcie_clk_mux_0__sel = "SEL_MIDDLE",
        parameter x_mux_sm_hssi_pcie_data_mux_0__sel = "SEL_MIDDLE",
        parameter x_std_sm_hssi_pld_chnl_dp_0__dr_enabled       = "DR_ENABLED_DR_DISABLED",
        parameter x_std_sm_hssi_pld_chnl_dp_0__duplex_mode      = "DUPLEX_MODE_DUPLEX",
        parameter x_std_sm_hssi_pld_chnl_dp_0__pld_channel_identifier   = "PLD_CHANNEL_IDENTIFIER_PHIP",
        parameter x_std_sm_hssi_pld_chnl_dp_0__rx_clkout1_divider       = "RX_CLKOUT1_DIVIDER_DIV1",
        parameter x_std_sm_hssi_pld_chnl_dp_0__rx_clkout2_divider       = "RX_CLKOUT2_DIVIDER_DIV1",
        parameter x_std_sm_hssi_pld_chnl_dp_0__rx_en    = "TRUE",
        parameter x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_mode     = "RX_FIFO_MODE_PHASE_COMP",
        parameter x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_width    = "RX_FIFO_WIDTH_DOUBLE_DOUBLE_WIDTH",
        parameter x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_wr_clk_hz        = 36'b110111010011010101011010101110001100,
        parameter x_std_sm_hssi_pld_chnl_dp_0__rx_user1_clk_dynamic_mux = "RX_USER1_CLK_DYNAMIC_MUX_C2",
        parameter x_std_sm_hssi_pld_chnl_dp_0__rx_user2_clk_dynamic_mux = "RX_USER2_CLK_DYNAMIC_MUX_UX",
        parameter x_std_sm_hssi_pld_chnl_dp_0__sup_mode = "SUP_MODE_USER_MODE",
        parameter x_std_sm_hssi_pld_chnl_dp_0__tx_clkout1_divider       = "TX_CLKOUT1_DIVIDER_DIV1",
        parameter x_std_sm_hssi_pld_chnl_dp_0__tx_clkout2_divider       = "TX_CLKOUT2_DIVIDER_DIV1",
        parameter x_std_sm_hssi_pld_chnl_dp_0__tx_en    = "TRUE",
        parameter x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_mode     = "TX_FIFO_MODE_PHASE_COMP",
        parameter x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_rd_clk_hz        = 36'b1110011000101010001000001011001,
        parameter x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_width    = "TX_FIFO_WIDTH_DOUBLE_DOUBLE_WIDTH",
        parameter x_std_sm_hssi_pld_chnl_dp_0__tx_user1_clk_dynamic_mux = "TX_USER1_CLK_DYNAMIC_MUX_C1",
        parameter x_std_sm_hssi_pld_chnl_dp_0__tx_user2_clk_dynamic_mux = "TX_USER2_CLK_DYNAMIC_MUX_UNUSED",
        parameter x_std_sm_hssi_pld_chnl_dp_0__vc_rx_pldif_wm_en = "VC_RX_PLDIF_WM_EN_ENABLE",
        parameter x_mux_sm_pld_rx_mux_0__sel = "SEL_PCIE",
        parameter x_decoder_sm_pld_tx_demux_0__sel = "SEL_PCIE",
        parameter x_mux_sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0__sel = "SEL_PCIE",
        parameter x_mux_sm_hssi_pld_chnl_tx_fifo_rd_clk_mux_0__sel = "SEL_PCIE"

)
 (
        input  x_mux_sm_hssi_pcie_clk_mux_0__i_bot_clk,
        input  o_local_syspll_c0,
        input  x_mux_sm_hssi_pcie_clk_mux_0__i_top_clk,
        output o_pld_pcie_clk,
        input  ss_ctrl_u0__o_pcie_gbl_downward_syspll_locked,
        input  pld_pwr_level_shifter_u0__o_ss_vccl_syspll_locked,
        output pcie_data_mux_u0__o_data,
        input [20:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr,
        input [31:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata,
        input [31:0] x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata,
        input [31:0] x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata,
        input [3:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be,
        input [79:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata,
        input [79:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async,
        input [79:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux,
        input [99:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async,
        input [9:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct,
        input [9:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_dl_clk,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_mux_select,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_flop,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_gen_clk,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_trig_flop,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_sampling_clk,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_dl_clk,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_mux_select,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_flop,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_gen_clk,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_trig_flop,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_clk,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_read,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_rstn,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_write,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_reset_clk_row,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_rx_clk_in_row_clk,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_tx_clk_in_row_clk,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_rx_pld_rst_n,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_tx_pld_rst_n,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrhip,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrpcs,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_perstn,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_ready,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_rxdata_fifo_rd_en,
        input x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_fifo_wr_en,
        input x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_valid,
        input x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_waitreq,
        input x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_valid,
        input x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_waitreq,
        output [16:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr,
        output [19:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr,
        output [31:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata,
        output [31:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata,
        output [31:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata,
        output [3:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be,
        output [3:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be,
        output [49:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async,
        output [79:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata,
        output [99:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async,
        output [9:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct,
        output [9:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_dl_sync,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_pulse,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_sample_sync,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_sclk_sample_sync,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_trig_sample_sync,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_dl_sync,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_pulse,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_sample_sync,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_sclk_sample_sync,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_trig_sample_sync,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_valid,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_waitreq,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_empty,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_full,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pempty,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pfull,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_empty,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_full,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pempty,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pfull,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk1_clk,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk2_clk,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk1_clk,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk2_clk,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_chnl_refclk_mux,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_tx_ch_ptr_smpl,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_rx_latency_pulse,
        output x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_tx_latency_pulse,
        output x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_clk,
        output x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_read,
        output x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_rstn,
        output x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_write,
        output x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_clk,
        output x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_read,
        output x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_rstn,
        output x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_write,
        output [87:0] o_ss_ch0_pcie_ctrl_tx_async,
        output [7:0] o_ss_ch0_pcie_ctrl_tx_direct,
        output [79:0] o_ss_ch0_pcie_tx_data,
        output o_ss_pcie_ch0_rst_pld_clrhip,
        output o_ss_pcie_ch0_rst_pld_clrpcs,
        output o_ss_pcie_ch0_rst_pld_perstn,
        input x_mux_sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0__i_pcie_top,
        input [87:0] o_ch0_pcie_ctrl_rx_async,
        input [7:0]  o_ch0_pcie_ctrl_rx_direct,
        output [2:0] k_user_rx_clk1_c0c1c2_sel,
        output [2:0] k_user_rx_clk2_c0c1c2_sel,
        output [2:0] k_user_tx_clk1_c0c1c2_sel,
        output [2:0] k_user_tx_clk2_c0c1c2_sel,
        output o_pld_pcie_clk_4,
        input  [79:0] o_ch0_rx_data,
        input o_user_rx_clk1_clk,
        input o_user_rx_clk2_clk,
        input o_user_tx_clk1_clk,
        input o_user_tx_clk2_clk

);

        wire x_mux_sm_hssi_pcie_clk_mux_0__i_bot_clk_1;
        wire o_local_syspll_c0_0;
        wire x_mux_sm_hssi_pcie_clk_mux_0__i_top_clk_1;
//        wire o_pld_pcie_clk_4;
        wire ss_ctrl_u0__o_pcie_gbl_downward_syspll_locked_0;
        wire pld_pwr_level_shifter_u0__o_ss_vccl_syspll_locked_0;
        wire pcie_data_mux_u0__o_data_0;
        wire [20:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0;
        wire [31:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0;
        wire [31:0] x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0;
        wire [31:0] x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0;
        wire [3:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0;
        wire [79:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0;
        wire [79:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0;
        wire [79:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0;
        wire [99:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0;
        wire [9:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0;
        wire [9:0] x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_dl_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_mux_select_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_flop_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_gen_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_trig_flop_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_sampling_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_dl_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_mux_select_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_flop_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_gen_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_trig_flop_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_read_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_rstn_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_write_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_reset_clk_row_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_rx_clk_in_row_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_tx_clk_in_row_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_rx_pld_rst_n_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_tx_pld_rst_n_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrhip_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrpcs_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_perstn_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_ready_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_rxdata_fifo_rd_en_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_fifo_wr_en_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_valid_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_waitreq_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_valid_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_waitreq_1;
        wire [16:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0;
        wire [19:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0;
        wire [31:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0;
        wire [31:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0;
        wire [31:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0;
        wire [3:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0;
        wire [3:0] x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0;
        wire [49:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0;
        wire [79:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0;
        wire [99:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0;
        wire [9:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0;
        wire [9:0] x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0;
        wire [1:0] pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_dl_sync_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_pulse_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_sample_sync_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_sclk_sample_sync_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_trig_sample_sync_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_dl_sync_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_pulse_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_sample_sync_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_sclk_sample_sync_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_trig_sample_sync_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_valid_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_waitreq_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_empty_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_full_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pempty_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pfull_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_empty_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_full_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pempty_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pfull_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk1_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk2_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk1_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk2_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_chnl_refclk_mux_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_tx_ch_ptr_smpl_1; 
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_rx_latency_pulse_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_tx_latency_pulse_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_read_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_rstn_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_write_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_clk_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_read_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_rstn_1;
        wire x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_write_1;
        wire [87:0] o_ch0_pcie_ctrl_rx_async_1;
        wire [7:0] o_ch0_pcie_ctrl_rx_direct_1;
        wire [2:0] k_user_rx_clk1_c0c1c2_sel_0;
        wire [2:0] k_user_rx_clk2_c0c1c2_sel_0;
        wire [2:0] k_user_tx_clk1_c0c1c2_sel_0;
        wire [2:0] k_user_tx_clk2_c0c1c2_sel_0;
        wire [87:0] o_ss_ch0_pcie_ctrl_tx_async_0;
        wire [7:0] o_ss_ch0_pcie_ctrl_tx_direct_0;
        wire [79:0] o_ch0_rx_data_1;
        wire [79:0] o_ss_ch0_pcie_tx_data_0;
        wire o_user_rx_clk1_clk_0;
        wire o_user_rx_clk2_clk_0;
        wire o_user_tx_clk1_clk_0;
        wire o_user_tx_clk2_clk_0;
        wire o_ss_pcie_ch0_rst_pld_clrhip_0;
        wire o_ss_pcie_ch0_rst_pld_clrpcs_0;
        wire o_ss_pcie_ch0_rst_pld_perstn_0;
        wire s441_51_1__hssi_clk__clk;


        wire [79:0] pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0;
        wire [79:0] o_ss_tx_fifo_data_0;
        wire o_rxfifo_ss_write_clk_0;
        wire o_txfifo_ss_read_clk_0;

        wire tmp_121;
        wire tmp_122;
        wire tmp_123;
        wire tmp_124;
        wire tmp_125;
        wire tmp_126;
        wire tmp_127;
        wire tmp_128;
        wire tmp_129;
        wire tmp_130;
        wire tmp_131;
        wire tmp_132;
        wire tmp_133;
        wire tmp_134;
        wire tmp_135;
        wire tmp_136;
        wire tmp_137;
        wire tmp_138;
        wire tmp_139;
        wire tmp_140;
        wire tmp_141;
        wire tmp_142;
        wire tmp_143;
        wire tmp_144;
        wire tmp_145;
        wire tmp_146;
        wire tmp_147;
        wire tmp_148;
        wire tmp_149;
        wire tmp_150;
        wire tmp_151;
        wire tmp_152;
        wire tmp_153;
        wire tmp_154;
        wire tmp_155;
        wire tmp_156;
        wire tmp_157;
        wire tmp_158;
        wire tmp_159;
        wire tmp_160;
        wire tmp_161;
        wire tmp_162;
        wire tmp_163;
        wire tmp_164;
        wire tmp_165;
        wire tmp_166;
        wire tmp_167;
        wire tmp_168;
        wire tmp_169;
        wire tmp_170;
        wire tmp_171;
        wire tmp_172;
        wire tmp_173;
        wire tmp_174;
        wire tmp_175;
        wire tmp_176;
        wire tmp_177;
        wire tmp_178;
        wire tmp_179;
        wire tmp_180;
        wire tmp_181;
        wire tmp_182;
        wire tmp_183;
        wire tmp_184;
        wire tmp_185;
        wire tmp_186;
        wire tmp_187;
        wire tmp_188;
        wire tmp_189;
        wire tmp_190;
        wire tmp_191;
        wire tmp_192;
        wire tmp_193;
        wire tmp_194;
        wire tmp_195;
        wire tmp_196;
        wire tmp_197;
        wire tmp_198;
        wire tmp_199;
        wire tmp_200;
        wire tmp_201;
        wire tmp_202;
        wire tmp_203;
        wire tmp_204;
        wire tmp_205;
        wire tmp_206;
        wire tmp_207;
        wire tmp_208;
        wire tmp_209;
        wire tmp_210;
        wire tmp_211;
        wire tmp_212;
        wire tmp_213;
        wire tmp_214;
        wire tmp_215;
        wire tmp_216;
        wire tmp_217;
        wire tmp_218;
        wire tmp_219;
        wire tmp_220;
        wire tmp_221;
        wire tmp_222;
        wire tmp_223;
        wire tmp_224;
        wire tmp_225;
        wire tmp_226;
        wire tmp_227;
        wire tmp_228;
        wire tmp_229;
        wire tmp_230;
        wire tmp_231;
        wire tmp_232;
        wire tmp_233;
        wire tmp_234;
        wire tmp_235;
        wire tmp_236;
        wire tmp_237;
        wire tmp_238;
        wire tmp_239;
        wire tmp_240;
        wire tmp_241;
        wire tmp_242;
        wire tmp_243;
        wire tmp_244;
        wire tmp_245;
        wire tmp_246;
        wire tmp_247;
        wire tmp_248;
        wire tmp_249;
        wire tmp_250;
        wire tmp_251;
        wire tmp_252;
        wire tmp_253;
        wire tmp_254;
        wire tmp_255;
        wire tmp_256;
        wire tmp_257;
        wire tmp_258;
        wire tmp_259;
        wire tmp_260;
        wire tmp_261;
        wire tmp_262;
        wire tmp_263;
        wire tmp_264;
        wire tmp_265;
        wire tmp_266;
        wire tmp_267;
        wire tmp_268;
        wire tmp_269;
        wire tmp_270;
        wire tmp_271;
        wire tmp_272;
        wire tmp_273;
        wire tmp_274;
        wire tmp_275;
        wire tmp_276;
        wire tmp_277;
        wire tmp_278;
        wire tmp_279;
        wire tmp_280;
        wire tmp_281;
        wire tmp_282;
        wire tmp_283;
        wire tmp_284;
        wire tmp_285;
        wire tmp_286;
        wire tmp_287;
        wire tmp_288;
        wire tmp_289;
        wire tmp_290;
        wire tmp_291;
        wire tmp_292;
        wire tmp_293;
        wire tmp_294;
        wire tmp_295;
        wire tmp_296;
        wire tmp_297;
        wire tmp_298;
        wire tmp_299;
        wire tmp_300;
        wire tmp_301;
        wire tmp_302;
        wire tmp_303;
        wire tmp_304;
        wire tmp_305;
        wire tmp_306;
        wire tmp_307;
        wire tmp_308;
        wire tmp_309;
        wire tmp_310;
        wire tmp_311;
        wire tmp_312;
        wire tmp_313;
        wire tmp_314;
        wire tmp_315;
        wire tmp_316;
        wire tmp_317;
        wire tmp_318;
        wire tmp_319;
        wire tmp_320;
        wire tmp_321;
        wire tmp_322;
        wire tmp_323;
        wire tmp_324;
        wire tmp_325;
        wire tmp_326;
        wire tmp_327;
        wire tmp_328;
        wire tmp_329;
        wire tmp_330;
        wire tmp_331;
        wire tmp_332;
        wire tmp_333;
        wire tmp_334;
        wire tmp_335;
        wire tmp_336;
        wire tmp_337;
        wire tmp_338;
        wire tmp_339;
        wire tmp_340;
        wire tmp_341;
        wire tmp_342;
        wire tmp_343;
        wire tmp_344;
        wire tmp_345;
        wire tmp_346;
        wire tmp_347;
        wire tmp_348;
        wire tmp_349;
        wire tmp_350;
        wire tmp_351;
        wire tmp_352;
        wire tmp_353;
        wire tmp_354;
        wire tmp_355;
        wire tmp_356;
        wire tmp_357;
        wire tmp_358;
        wire tmp_359;
        wire tmp_360;
        wire tmp_361;

        assign x_mux_sm_hssi_pcie_clk_mux_0__i_bot_clk_1 = x_mux_sm_hssi_pcie_clk_mux_0__i_bot_clk;
        assign o_local_syspll_c0_0 = o_local_syspll_c0;
        assign x_mux_sm_hssi_pcie_clk_mux_0__i_top_clk_1 = x_mux_sm_hssi_pcie_clk_mux_0__i_top_clk;
        assign o_pld_pcie_clk = o_pld_pcie_clk_4;
        assign n1_4 = 1'b0;
        assign ss_ctrl_u0__o_pcie_gbl_downward_syspll_locked_0 = ss_ctrl_u0__o_pcie_gbl_downward_syspll_locked;
        assign pld_pwr_level_shifter_u0__o_ss_vccl_syspll_locked_0 = pld_pwr_level_shifter_u0__o_ss_vccl_syspll_locked;
        assign pcie_data_mux_u0__o_data = pcie_data_mux_u0__o_data_0;
        assign quartus_i_dft_hssi_scan_mode_0  = 1'b0;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_dl_clk_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_dl_clk;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_mux_select_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_mux_select;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_flop_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_flop;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_gen_clk_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_gen_clk;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_trig_flop_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_trig_flop;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_sampling_clk_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_sampling_clk;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_dl_clk_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_dl_clk;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_mux_select_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_mux_select;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_flop_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_flop;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_gen_clk_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_gen_clk;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_trig_flop_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_trig_flop;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[10] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[11] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[12] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[13] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[14] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[15] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[16] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[17] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[18] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[19] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[20] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_clk_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_clk;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_read_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_read;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_rstn_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_rstn;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[10] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[11] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[12] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[13] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[14] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[15] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[16] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[17] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[18] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[19] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[20] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[21] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[22] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[23] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[24] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[25] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[26] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[27] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[28] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[29] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[30] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[31] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_write_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_write;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_reset_clk_row_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_reset_clk_row;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_rx_clk_in_row_clk_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_rx_clk_in_row_clk;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_tx_clk_in_row_clk_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_tx_clk_in_row_clk;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_rx_pld_rst_n_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_rx_pld_rst_n;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_tx_pld_rst_n_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_tx_pld_rst_n;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrhip_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrhip;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrpcs_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrpcs;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_perstn_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_perstn;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_ready_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_ready;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_rxdata_fifo_rd_en_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_rxdata_fifo_rd_en;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[10] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[11] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[12] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[13] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[14] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[15] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[16] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[17] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[18] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[19] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[20] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[21] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[22] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[23] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[24] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[25] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[26] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[27] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[28] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[29] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[30] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[31] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[32] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[32];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[33] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[33];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[34] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[34];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[35] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[35];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[36] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[36];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[37] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[37];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[38] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[38];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[39] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[39];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[40] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[40];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[41] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[41];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[42] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[42];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[43] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[43];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[44] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[44];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[45] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[45];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[46] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[46];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[47] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[47];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[48] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[48];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[49] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[49];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[50] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[50];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[51] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[51];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[52] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[52];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[53] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[53];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[54] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[54];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[55] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[55];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[56] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[56];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[57] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[57];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[58] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[58];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[59] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[59];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[60] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[60];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[61] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[61];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[62] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[62];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[63] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[63];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[64] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[64];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[65] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[65];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[66] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[66];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[67] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[67];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[68] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[68];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[69] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[69];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[70] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[70];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[71] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[71];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[72] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[72];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[73] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[73];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[74] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[74];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[75] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[75];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[76] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[76];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[77] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[77];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[78] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[78];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[79] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[79];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[10] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[11] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[12] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[13] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[14] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[15] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[16] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[17] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[18] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[19] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[20] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[21] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[22] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[23] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[24] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[25] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[26] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[27] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[28] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[29] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[30] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[31] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[32] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[32];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[33] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[33];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[34] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[34];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[35] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[35];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[36] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[36];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[37] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[37];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[38] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[38];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[39] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[39];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[40] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[40];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[41] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[41];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[42] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[42];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[43] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[43];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[44] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[44];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[45] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[45];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[46] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[46];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[47] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[47];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[48] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[48];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[49] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[49];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[50] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[50];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[51] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[51];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[52] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[52];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[53] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[53];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[54] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[54];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[55] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[55];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[56] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[56];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[57] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[57];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[58] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[58];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[59] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[59];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[60] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[60];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[61] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[61];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[62] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[62];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[63] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[63];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[64] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[64];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[65] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[65];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[66] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[66];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[67] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[67];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[68] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[68];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[69] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[69];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[70] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[70];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[71] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[71];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[72] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[72];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[73] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[73];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[74] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[74];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[75] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[75];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[76] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[76];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[77] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[77];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[78] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[78];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[79] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[79];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[80] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[80];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[81] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[81];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[82] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[82];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[83] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[83];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[84] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[84];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[85] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[85];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[86] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[86];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[87] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[87];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[88] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[88];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[89] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[89];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[90] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[90];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[91] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[91];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[92] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[92];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[93] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[93];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[94] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[94];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[95] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[95];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[96] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[96];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[97] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[97];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[98] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[98];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[99] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[99];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_fifo_wr_en_1 = x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_fifo_wr_en;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[10] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[11] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[12] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[13] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[14] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[15] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[16] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[17] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[18] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[19] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[20] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[21] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[22] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[23] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[24] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[25] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[26] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[27] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[28] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[29] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[30] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[31] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[32] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[32];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[33] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[33];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[34] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[34];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[35] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[35];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[36] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[36];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[37] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[37];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[38] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[38];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[39] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[39];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[40] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[40];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[41] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[41];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[42] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[42];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[43] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[43];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[44] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[44];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[45] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[45];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[46] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[46];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[47] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[47];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[48] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[48];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[49] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[49];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[50] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[50];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[51] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[51];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[52] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[52];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[53] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[53];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[54] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[54];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[55] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[55];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[56] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[56];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[57] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[57];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[58] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[58];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[59] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[59];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[60] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[60];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[61] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[61];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[62] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[62];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[63] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[63];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[64] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[64];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[65] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[65];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[66] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[66];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[67] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[67];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[68] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[68];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[69] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[69];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[70] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[70];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[71] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[71];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[72] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[72];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[73] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[73];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[74] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[74];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[75] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[75];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[76] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[76];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[77] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[77];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[78] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[78];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[79] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[79];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[10] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[11] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[12] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[13] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[14] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[15] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[16] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[17] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[18] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[19] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[20] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[21] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[22] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[23] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[24] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[25] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[26] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[27] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[28] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[29] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[30] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[31] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[32] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[32];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[33] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[33];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[34] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[34];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[35] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[35];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[36] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[36];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[37] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[37];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[38] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[38];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[39] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[39];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[40] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[40];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[41] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[41];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[42] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[42];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[43] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[43];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[44] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[44];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[45] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[45];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[46] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[46];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[47] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[47];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[48] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[48];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[49] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[49];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[50] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[50];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[51] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[51];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[52] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[52];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[53] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[53];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[54] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[54];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[55] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[55];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[56] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[56];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[57] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[57];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[58] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[58];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[59] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[59];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[60] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[60];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[61] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[61];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[62] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[62];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[63] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[63];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[64] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[64];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[65] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[65];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[66] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[66];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[67] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[67];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[68] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[68];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[69] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[69];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[70] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[70];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[71] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[71];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[72] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[72];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[73] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[73];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[74] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[74];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[75] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[75];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[76] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[76];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[77] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[77];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[78] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[78];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[79] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[79];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[10] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[11] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[12] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[13] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[14] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[15] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[16] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[17] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[18] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[19] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[20] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[21] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[22] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[23] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[24] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[25] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[26] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[27] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[28] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[29] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[30] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[31] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_valid_1 = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_valid;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_waitreq_1 = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_waitreq;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[0] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[10] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[11] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[12] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[13] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[14] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[15] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[16] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[17] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[18] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[19] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[1] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[20] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[21] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[22] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[23] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[24] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[25] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[26] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[27] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[28] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[29] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[2] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[30] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[31] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[3] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[4] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[5] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[6] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[7] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[8] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[9] = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_valid_1 = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_valid;
        assign x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_waitreq_1 = x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_waitreq;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_dl_sync = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_dl_sync_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_pulse = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_pulse_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_sample_sync = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_sample_sync_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_sclk_sample_sync = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_sclk_sample_sync_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_trig_sample_sync = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_trig_sample_sync_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_dl_sync = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_dl_sync_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_pulse = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_pulse_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_sample_sync = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_sample_sync_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_sclk_sample_sync = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_sclk_sample_sync_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_trig_sample_sync = x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_trig_sample_sync_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[0] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[10] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[11] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[12] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[13] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[14] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[15] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[16] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[17] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[18] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[19] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[1] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[20] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[21] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[22] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[23] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[24] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[25] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[26] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[27] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[28] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[29] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[2] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[30] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[31] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[3] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[4] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[5] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[6] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[7] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[8] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata[9] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_valid = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_valid_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_waitreq = x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_waitreq_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[0] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[10] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[11] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[12] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[13] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[14] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[15] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[16] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[17] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[18] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[19] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[1] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[20] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[21] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[22] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[23] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[24] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[25] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[26] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[27] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[28] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[29] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[2] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[30] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[31] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[32] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[32];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[33] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[33];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[34] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[34];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[35] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[35];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[36] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[36];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[37] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[37];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[38] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[38];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[39] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[39];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[3] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[40] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[40];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[41] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[41];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[42] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[42];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[43] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[43];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[44] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[44];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[45] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[45];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[46] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[46];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[47] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[47];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[48] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[48];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[49] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[49];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[4] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[50] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[50];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[51] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[51];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[52] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[52];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[53] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[53];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[54] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[54];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[55] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[55];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[56] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[56];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[57] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[57];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[58] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[58];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[59] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[59];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[5] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[60] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[60];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[61] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[61];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[62] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[62];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[63] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[63];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[64] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[64];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[65] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[65];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[66] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[66];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[67] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[67];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[68] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[68];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[69] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[69];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[6] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[70] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[70];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[71] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[71];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[72] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[72];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[73] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[73];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[74] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[74];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[75] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[75];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[76] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[76];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[77] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[77];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[78] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[78];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[79] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[79];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[7] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[8] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata[9] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[0] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[10] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[11] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[12] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[13] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[14] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[15] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[16] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[17] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[18] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[19] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[1] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[20] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[21] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[22] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[23] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[24] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[25] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[26] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[27] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[28] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[29] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[2] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[30] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[31] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[32] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[32];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[33] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[33];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[34] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[34];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[35] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[35];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[36] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[36];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[37] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[37];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[38] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[38];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[39] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[39];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[3] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[40] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[40];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[41] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[41];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[42] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[42];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[43] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[43];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[44] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[44];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[45] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[45];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[46] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[46];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[47] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[47];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[48] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[48];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[49] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[49];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[4] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[50] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[50];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[51] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[51];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[52] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[52];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[53] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[53];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[54] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[54];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[55] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[55];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[56] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[56];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[57] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[57];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[58] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[58];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[59] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[59];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[5] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[60] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[60];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[61] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[61];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[62] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[62];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[63] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[63];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[64] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[64];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[65] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[65];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[66] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[66];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[67] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[67];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[68] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[68];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[69] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[69];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[6] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[70] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[70];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[71] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[71];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[72] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[72];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[73] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[73];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[74] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[74];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[75] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[75];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[76] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[76];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[77] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[77];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[78] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[78];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[79] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[79];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[7] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[80] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[80];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[81] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[81];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[82] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[82];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[83] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[83];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[84] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[84];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[85] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[85];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[86] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[86];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[87] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[87];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[88] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[88];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[89] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[89];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[8] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[90] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[90];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[91] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[91];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[92] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[92];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[93] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[93];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[94] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[94];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[95] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[95];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[96] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[96];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[97] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[97];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[98] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[98];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[99] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[99];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async[9] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[0] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[1] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[2] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[3] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[4] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[5] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[6] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[7] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[8] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct[9] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[0] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[1] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[2] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[3] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[4] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[5] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[6] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[7] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[8] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra[9] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_empty = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_empty_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_full = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_full_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pempty = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pempty_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pfull = x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pfull_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_empty = x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_empty_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_full = x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_full_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pempty = x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pempty_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pfull = x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pfull_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk1_clk = x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk1_clk_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk2_clk = x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk2_clk_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk1_clk = x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk1_clk_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk2_clk = x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk2_clk_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_chnl_refclk_mux = x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_chnl_refclk_mux_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_tx_ch_ptr_smpl = x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_tx_ch_ptr_smpl_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[0] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[10] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[11] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[12] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[13] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[14] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[15] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[16] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[17] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[18] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[19] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[1] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[20] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[21] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[22] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[23] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[24] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[25] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[26] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[27] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[28] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[29] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[2] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[30] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[31] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[32] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[32];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[33] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[33];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[34] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[34];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[35] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[35];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[36] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[36];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[37] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[37];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[38] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[38];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[39] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[39];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[3] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[40] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[40];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[41] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[41];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[42] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[42];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[43] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[43];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[44] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[44];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[45] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[45];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[46] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[46];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[47] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[47];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[48] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[48];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[49] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[49];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[4] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[5] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[6] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[7] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[8] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async[9] = x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_rx_latency_pulse = x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_rx_latency_pulse_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_tx_latency_pulse = x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_tx_latency_pulse_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[0] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[10] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[11] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[12] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[13] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[14] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[15] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[16] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[17] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[18] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[19] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[1] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[2] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[3] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[4] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[5] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[6] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[7] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[8] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr[9] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be[0] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be[1] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be[2] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be[3] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_clk = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_clk_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_read = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_read_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_rstn = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_rstn_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[0] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[10] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[11] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[12] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[13] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[14] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[15] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[16] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[17] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[18] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[19] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[1] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[20] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[21] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[22] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[23] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[24] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[25] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[26] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[27] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[28] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[29] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[2] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[30] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[31] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[3] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[4] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[5] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[6] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[7] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[8] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata[9] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_write = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_write_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[0] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[10] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[11] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[12] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[13] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[14] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[15] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[16] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[1] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[2] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[3] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[4] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[5] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[6] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[7] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[8] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr[9] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be[0] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be[1] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be[2] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be[3] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_clk = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_clk_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_read = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_read_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_rstn = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_rstn_1;
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[0] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[0];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[10] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[10];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[11] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[11];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[12] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[12];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[13] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[13];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[14] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[14];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[15] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[15];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[16] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[16];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[17] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[17];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[18] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[18];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[19] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[19];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[1] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[1];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[20] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[20];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[21] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[21];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[22] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[22];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[23] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[23];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[24] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[24];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[25] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[25];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[26] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[26];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[27] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[27];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[28] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[28];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[29] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[29];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[2] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[2];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[30] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[30];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[31] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[31];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[3] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[3];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[4] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[4];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[5] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[5];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[6] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[6];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[7] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[7];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[8] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[8];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata[9] = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[9];
        assign x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_write = x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_write_1;
        assign pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1] = 1'b0;
        assign o_ch0_pcie_ctrl_rx_async_1[0] = o_ch0_pcie_ctrl_rx_async[0];
        assign o_ch0_pcie_ctrl_rx_async_1[1] = o_ch0_pcie_ctrl_rx_async[1];
        assign o_ch0_pcie_ctrl_rx_async_1[2] = o_ch0_pcie_ctrl_rx_async[2];
        assign o_ch0_pcie_ctrl_rx_async_1[3] = o_ch0_pcie_ctrl_rx_async[3];
        assign o_ch0_pcie_ctrl_rx_async_1[4] = o_ch0_pcie_ctrl_rx_async[4];
        assign o_ch0_pcie_ctrl_rx_async_1[5] = o_ch0_pcie_ctrl_rx_async[5];
        assign o_ch0_pcie_ctrl_rx_async_1[6] = o_ch0_pcie_ctrl_rx_async[6];
        assign o_ch0_pcie_ctrl_rx_async_1[7] = o_ch0_pcie_ctrl_rx_async[7];
        assign o_ch0_pcie_ctrl_rx_async_1[8] = o_ch0_pcie_ctrl_rx_async[8];
        assign o_ch0_pcie_ctrl_rx_async_1[9] = o_ch0_pcie_ctrl_rx_async[9];
        assign o_ch0_pcie_ctrl_rx_async_1[10] = o_ch0_pcie_ctrl_rx_async[10];
        assign o_ch0_pcie_ctrl_rx_async_1[11] = o_ch0_pcie_ctrl_rx_async[11];
        assign o_ch0_pcie_ctrl_rx_async_1[12] = o_ch0_pcie_ctrl_rx_async[12];
        assign o_ch0_pcie_ctrl_rx_async_1[13] = o_ch0_pcie_ctrl_rx_async[13];
        assign o_ch0_pcie_ctrl_rx_async_1[14] = o_ch0_pcie_ctrl_rx_async[14];
        assign o_ch0_pcie_ctrl_rx_async_1[15] = o_ch0_pcie_ctrl_rx_async[15];
        assign o_ch0_pcie_ctrl_rx_async_1[16] = o_ch0_pcie_ctrl_rx_async[16];
        assign o_ch0_pcie_ctrl_rx_async_1[17] = o_ch0_pcie_ctrl_rx_async[17];
        assign o_ch0_pcie_ctrl_rx_async_1[18] = o_ch0_pcie_ctrl_rx_async[18];
        assign o_ch0_pcie_ctrl_rx_async_1[19] = o_ch0_pcie_ctrl_rx_async[19];
        assign o_ch0_pcie_ctrl_rx_async_1[20] = o_ch0_pcie_ctrl_rx_async[20];
        assign o_ch0_pcie_ctrl_rx_async_1[21] = o_ch0_pcie_ctrl_rx_async[21];
        assign o_ch0_pcie_ctrl_rx_async_1[22] = o_ch0_pcie_ctrl_rx_async[22];
        assign o_ch0_pcie_ctrl_rx_async_1[23] = o_ch0_pcie_ctrl_rx_async[23];
        assign o_ch0_pcie_ctrl_rx_async_1[24] = o_ch0_pcie_ctrl_rx_async[24];
        assign o_ch0_pcie_ctrl_rx_async_1[25] = o_ch0_pcie_ctrl_rx_async[25];
        assign o_ch0_pcie_ctrl_rx_async_1[26] = o_ch0_pcie_ctrl_rx_async[26];
        assign o_ch0_pcie_ctrl_rx_async_1[27] = o_ch0_pcie_ctrl_rx_async[27];
        assign o_ch0_pcie_ctrl_rx_async_1[28] = o_ch0_pcie_ctrl_rx_async[28];
        assign o_ch0_pcie_ctrl_rx_async_1[29] = o_ch0_pcie_ctrl_rx_async[29];
        assign o_ch0_pcie_ctrl_rx_async_1[30] = o_ch0_pcie_ctrl_rx_async[30];
        assign o_ch0_pcie_ctrl_rx_async_1[31] = o_ch0_pcie_ctrl_rx_async[31];
        assign o_ch0_pcie_ctrl_rx_async_1[32] = o_ch0_pcie_ctrl_rx_async[32];
        assign o_ch0_pcie_ctrl_rx_async_1[33] = o_ch0_pcie_ctrl_rx_async[33];
        assign o_ch0_pcie_ctrl_rx_async_1[34] = o_ch0_pcie_ctrl_rx_async[34];
        assign o_ch0_pcie_ctrl_rx_async_1[35] = o_ch0_pcie_ctrl_rx_async[35];
        assign o_ch0_pcie_ctrl_rx_async_1[36] = o_ch0_pcie_ctrl_rx_async[36];
        assign o_ch0_pcie_ctrl_rx_async_1[37] = o_ch0_pcie_ctrl_rx_async[37];
        assign o_ch0_pcie_ctrl_rx_async_1[38] = o_ch0_pcie_ctrl_rx_async[38];
        assign o_ch0_pcie_ctrl_rx_async_1[39] = o_ch0_pcie_ctrl_rx_async[39];
        assign o_ch0_pcie_ctrl_rx_async_1[40] = o_ch0_pcie_ctrl_rx_async[40];
        assign o_ch0_pcie_ctrl_rx_async_1[41] = o_ch0_pcie_ctrl_rx_async[41];
        assign o_ch0_pcie_ctrl_rx_async_1[42] = o_ch0_pcie_ctrl_rx_async[42];
        assign o_ch0_pcie_ctrl_rx_async_1[43] = o_ch0_pcie_ctrl_rx_async[43];
        assign o_ch0_pcie_ctrl_rx_async_1[44] = o_ch0_pcie_ctrl_rx_async[44];
        assign o_ch0_pcie_ctrl_rx_async_1[45] = o_ch0_pcie_ctrl_rx_async[45];
        assign o_ch0_pcie_ctrl_rx_async_1[46] = o_ch0_pcie_ctrl_rx_async[46];
        assign o_ch0_pcie_ctrl_rx_async_1[47] = o_ch0_pcie_ctrl_rx_async[47];
        assign o_ch0_pcie_ctrl_rx_async_1[48] = o_ch0_pcie_ctrl_rx_async[48];
        assign o_ch0_pcie_ctrl_rx_async_1[49] = o_ch0_pcie_ctrl_rx_async[49];
        assign o_ch0_pcie_ctrl_rx_async_1[50] = o_ch0_pcie_ctrl_rx_async[50];
        assign o_ch0_pcie_ctrl_rx_async_1[51] = o_ch0_pcie_ctrl_rx_async[51];
        assign o_ch0_pcie_ctrl_rx_async_1[52] = o_ch0_pcie_ctrl_rx_async[52];
        assign o_ch0_pcie_ctrl_rx_async_1[53] = o_ch0_pcie_ctrl_rx_async[53];
        assign o_ch0_pcie_ctrl_rx_async_1[54] = o_ch0_pcie_ctrl_rx_async[54];
        assign o_ch0_pcie_ctrl_rx_async_1[55] = o_ch0_pcie_ctrl_rx_async[55];
        assign o_ch0_pcie_ctrl_rx_async_1[56] = o_ch0_pcie_ctrl_rx_async[56];
        assign o_ch0_pcie_ctrl_rx_async_1[57] = o_ch0_pcie_ctrl_rx_async[57];
        assign o_ch0_pcie_ctrl_rx_async_1[58] = o_ch0_pcie_ctrl_rx_async[58];
        assign o_ch0_pcie_ctrl_rx_async_1[59] = o_ch0_pcie_ctrl_rx_async[59];
        assign o_ch0_pcie_ctrl_rx_async_1[60] = o_ch0_pcie_ctrl_rx_async[60];
        assign o_ch0_pcie_ctrl_rx_async_1[61] = o_ch0_pcie_ctrl_rx_async[61];
        assign o_ch0_pcie_ctrl_rx_async_1[62] = o_ch0_pcie_ctrl_rx_async[62];
        assign o_ch0_pcie_ctrl_rx_async_1[63] = o_ch0_pcie_ctrl_rx_async[63];
        assign o_ch0_pcie_ctrl_rx_async_1[64] = o_ch0_pcie_ctrl_rx_async[64];
        assign o_ch0_pcie_ctrl_rx_async_1[65] = o_ch0_pcie_ctrl_rx_async[65];
        assign o_ch0_pcie_ctrl_rx_async_1[66] = o_ch0_pcie_ctrl_rx_async[66];
        assign o_ch0_pcie_ctrl_rx_async_1[67] = o_ch0_pcie_ctrl_rx_async[67];
        assign o_ch0_pcie_ctrl_rx_async_1[68] = o_ch0_pcie_ctrl_rx_async[68];
        assign o_ch0_pcie_ctrl_rx_async_1[69] = o_ch0_pcie_ctrl_rx_async[69];
        assign o_ch0_pcie_ctrl_rx_async_1[70] = o_ch0_pcie_ctrl_rx_async[70];
        assign o_ch0_pcie_ctrl_rx_async_1[71] = o_ch0_pcie_ctrl_rx_async[71];
        assign o_ch0_pcie_ctrl_rx_async_1[72] = o_ch0_pcie_ctrl_rx_async[72];
        assign o_ch0_pcie_ctrl_rx_async_1[73] = o_ch0_pcie_ctrl_rx_async[73];
        assign o_ch0_pcie_ctrl_rx_async_1[74] = o_ch0_pcie_ctrl_rx_async[74];
        assign o_ch0_pcie_ctrl_rx_async_1[75] = o_ch0_pcie_ctrl_rx_async[75];
        assign o_ch0_pcie_ctrl_rx_async_1[76] = o_ch0_pcie_ctrl_rx_async[76];
        assign o_ch0_pcie_ctrl_rx_async_1[77] = o_ch0_pcie_ctrl_rx_async[77];
        assign o_ch0_pcie_ctrl_rx_async_1[78] = o_ch0_pcie_ctrl_rx_async[78];
        assign o_ch0_pcie_ctrl_rx_async_1[79] = o_ch0_pcie_ctrl_rx_async[79];
        assign o_ch0_pcie_ctrl_rx_async_1[80] = o_ch0_pcie_ctrl_rx_async[80];
        assign o_ch0_pcie_ctrl_rx_async_1[81] = o_ch0_pcie_ctrl_rx_async[81];
        assign o_ch0_pcie_ctrl_rx_async_1[82] = o_ch0_pcie_ctrl_rx_async[82];
        assign o_ch0_pcie_ctrl_rx_async_1[83] = o_ch0_pcie_ctrl_rx_async[83];
        assign o_ch0_pcie_ctrl_rx_async_1[84] = o_ch0_pcie_ctrl_rx_async[84];
        assign o_ch0_pcie_ctrl_rx_async_1[85] = o_ch0_pcie_ctrl_rx_async[85];
        assign o_ch0_pcie_ctrl_rx_async_1[86] = o_ch0_pcie_ctrl_rx_async[86];
        assign o_ch0_pcie_ctrl_rx_async_1[87] = o_ch0_pcie_ctrl_rx_async[87];
        assign o_ch0_pcie_ctrl_rx_direct_1[0] = o_ch0_pcie_ctrl_rx_direct[0];
        assign o_ch0_pcie_ctrl_rx_direct_1[1] = o_ch0_pcie_ctrl_rx_direct[1];
        assign o_ch0_pcie_ctrl_rx_direct_1[2] = o_ch0_pcie_ctrl_rx_direct[2];
        assign o_ch0_pcie_ctrl_rx_direct_1[3] = o_ch0_pcie_ctrl_rx_direct[3];
        assign o_ch0_pcie_ctrl_rx_direct_1[4] = o_ch0_pcie_ctrl_rx_direct[4];
        assign o_ch0_pcie_ctrl_rx_direct_1[5] = o_ch0_pcie_ctrl_rx_direct[5];
        assign o_ch0_pcie_ctrl_rx_direct_1[6] = o_ch0_pcie_ctrl_rx_direct[6];
        assign o_ch0_pcie_ctrl_rx_direct_1[7] = o_ch0_pcie_ctrl_rx_direct[7];
        assign k_user_rx_clk1_c0c1c2_sel[0] = k_user_rx_clk1_c0c1c2_sel_0[0];
        assign k_user_rx_clk1_c0c1c2_sel[1] = k_user_rx_clk1_c0c1c2_sel_0[1];
        assign k_user_rx_clk1_c0c1c2_sel[2] = k_user_rx_clk1_c0c1c2_sel_0[2];
        assign k_user_rx_clk2_c0c1c2_sel[0] = k_user_rx_clk2_c0c1c2_sel_0[0];
        assign k_user_rx_clk2_c0c1c2_sel[1] = k_user_rx_clk2_c0c1c2_sel_0[1];
        assign k_user_rx_clk2_c0c1c2_sel[2] = k_user_rx_clk2_c0c1c2_sel_0[2];
        assign k_user_tx_clk1_c0c1c2_sel[0] = k_user_tx_clk1_c0c1c2_sel_0[0];
        assign k_user_tx_clk1_c0c1c2_sel[1] = k_user_tx_clk1_c0c1c2_sel_0[1];
        assign k_user_tx_clk1_c0c1c2_sel[2] = k_user_tx_clk1_c0c1c2_sel_0[2];
        assign k_user_tx_clk2_c0c1c2_sel[0] = k_user_tx_clk2_c0c1c2_sel_0[0];
        assign k_user_tx_clk2_c0c1c2_sel[1] = k_user_tx_clk2_c0c1c2_sel_0[1];
        assign k_user_tx_clk2_c0c1c2_sel[2] = k_user_tx_clk2_c0c1c2_sel_0[2];
        assign o_ss_ch0_pcie_ctrl_tx_async[0] = o_ss_ch0_pcie_ctrl_tx_async_0[0];
        assign o_ss_ch0_pcie_ctrl_tx_async[1] = o_ss_ch0_pcie_ctrl_tx_async_0[1];
        assign o_ss_ch0_pcie_ctrl_tx_async[2] = o_ss_ch0_pcie_ctrl_tx_async_0[2];
        assign o_ss_ch0_pcie_ctrl_tx_async[3] = o_ss_ch0_pcie_ctrl_tx_async_0[3];
        assign o_ss_ch0_pcie_ctrl_tx_async[4] = o_ss_ch0_pcie_ctrl_tx_async_0[4];
        assign o_ss_ch0_pcie_ctrl_tx_async[5] = o_ss_ch0_pcie_ctrl_tx_async_0[5];
        assign o_ss_ch0_pcie_ctrl_tx_async[6] = o_ss_ch0_pcie_ctrl_tx_async_0[6];
        assign o_ss_ch0_pcie_ctrl_tx_async[7] = o_ss_ch0_pcie_ctrl_tx_async_0[7];
        assign o_ss_ch0_pcie_ctrl_tx_async[8] = o_ss_ch0_pcie_ctrl_tx_async_0[8];
        assign o_ss_ch0_pcie_ctrl_tx_async[9] = o_ss_ch0_pcie_ctrl_tx_async_0[9];
        assign o_ss_ch0_pcie_ctrl_tx_async[10] = o_ss_ch0_pcie_ctrl_tx_async_0[10];
        assign o_ss_ch0_pcie_ctrl_tx_async[11] = o_ss_ch0_pcie_ctrl_tx_async_0[11];
        assign o_ss_ch0_pcie_ctrl_tx_async[12] = o_ss_ch0_pcie_ctrl_tx_async_0[12];
        assign o_ss_ch0_pcie_ctrl_tx_async[13] = o_ss_ch0_pcie_ctrl_tx_async_0[13];
        assign o_ss_ch0_pcie_ctrl_tx_async[14] = o_ss_ch0_pcie_ctrl_tx_async_0[14];
        assign o_ss_ch0_pcie_ctrl_tx_async[15] = o_ss_ch0_pcie_ctrl_tx_async_0[15];
        assign o_ss_ch0_pcie_ctrl_tx_async[16] = o_ss_ch0_pcie_ctrl_tx_async_0[16];
        assign o_ss_ch0_pcie_ctrl_tx_async[17] = o_ss_ch0_pcie_ctrl_tx_async_0[17];
        assign o_ss_ch0_pcie_ctrl_tx_async[18] = o_ss_ch0_pcie_ctrl_tx_async_0[18];
        assign o_ss_ch0_pcie_ctrl_tx_async[19] = o_ss_ch0_pcie_ctrl_tx_async_0[19];
        assign o_ss_ch0_pcie_ctrl_tx_async[20] = o_ss_ch0_pcie_ctrl_tx_async_0[20];
        assign o_ss_ch0_pcie_ctrl_tx_async[21] = o_ss_ch0_pcie_ctrl_tx_async_0[21];
        assign o_ss_ch0_pcie_ctrl_tx_async[22] = o_ss_ch0_pcie_ctrl_tx_async_0[22];
        assign o_ss_ch0_pcie_ctrl_tx_async[23] = o_ss_ch0_pcie_ctrl_tx_async_0[23];
        assign o_ss_ch0_pcie_ctrl_tx_async[24] = o_ss_ch0_pcie_ctrl_tx_async_0[24];
        assign o_ss_ch0_pcie_ctrl_tx_async[25] = o_ss_ch0_pcie_ctrl_tx_async_0[25];
        assign o_ss_ch0_pcie_ctrl_tx_async[26] = o_ss_ch0_pcie_ctrl_tx_async_0[26];
        assign o_ss_ch0_pcie_ctrl_tx_async[27] = o_ss_ch0_pcie_ctrl_tx_async_0[27];
        assign o_ss_ch0_pcie_ctrl_tx_async[28] = o_ss_ch0_pcie_ctrl_tx_async_0[28];
        assign o_ss_ch0_pcie_ctrl_tx_async[29] = o_ss_ch0_pcie_ctrl_tx_async_0[29];
        assign o_ss_ch0_pcie_ctrl_tx_async[30] = o_ss_ch0_pcie_ctrl_tx_async_0[30];
        assign o_ss_ch0_pcie_ctrl_tx_async[31] = o_ss_ch0_pcie_ctrl_tx_async_0[31];
        assign o_ss_ch0_pcie_ctrl_tx_async[32] = o_ss_ch0_pcie_ctrl_tx_async_0[32];
        assign o_ss_ch0_pcie_ctrl_tx_async[33] = o_ss_ch0_pcie_ctrl_tx_async_0[33];
        assign o_ss_ch0_pcie_ctrl_tx_async[34] = o_ss_ch0_pcie_ctrl_tx_async_0[34];
        assign o_ss_ch0_pcie_ctrl_tx_async[35] = o_ss_ch0_pcie_ctrl_tx_async_0[35];
        assign o_ss_ch0_pcie_ctrl_tx_async[36] = o_ss_ch0_pcie_ctrl_tx_async_0[36];
        assign o_ss_ch0_pcie_ctrl_tx_async[37] = o_ss_ch0_pcie_ctrl_tx_async_0[37];
        assign o_ss_ch0_pcie_ctrl_tx_async[38] = o_ss_ch0_pcie_ctrl_tx_async_0[38];
        assign o_ss_ch0_pcie_ctrl_tx_async[39] = o_ss_ch0_pcie_ctrl_tx_async_0[39];
        assign o_ss_ch0_pcie_ctrl_tx_async[40] = o_ss_ch0_pcie_ctrl_tx_async_0[40];
        assign o_ss_ch0_pcie_ctrl_tx_async[41] = o_ss_ch0_pcie_ctrl_tx_async_0[41];
        assign o_ss_ch0_pcie_ctrl_tx_async[42] = o_ss_ch0_pcie_ctrl_tx_async_0[42];
        assign o_ss_ch0_pcie_ctrl_tx_async[43] = o_ss_ch0_pcie_ctrl_tx_async_0[43];
        assign o_ss_ch0_pcie_ctrl_tx_async[44] = o_ss_ch0_pcie_ctrl_tx_async_0[44];
        assign o_ss_ch0_pcie_ctrl_tx_async[45] = o_ss_ch0_pcie_ctrl_tx_async_0[45];
        assign o_ss_ch0_pcie_ctrl_tx_async[46] = o_ss_ch0_pcie_ctrl_tx_async_0[46];
        assign o_ss_ch0_pcie_ctrl_tx_async[47] = o_ss_ch0_pcie_ctrl_tx_async_0[47];
        assign o_ss_ch0_pcie_ctrl_tx_async[48] = o_ss_ch0_pcie_ctrl_tx_async_0[48];
        assign o_ss_ch0_pcie_ctrl_tx_async[49] = o_ss_ch0_pcie_ctrl_tx_async_0[49];
        assign o_ss_ch0_pcie_ctrl_tx_async[50] = o_ss_ch0_pcie_ctrl_tx_async_0[50];
        assign o_ss_ch0_pcie_ctrl_tx_async[51] = o_ss_ch0_pcie_ctrl_tx_async_0[51];
        assign o_ss_ch0_pcie_ctrl_tx_async[52] = o_ss_ch0_pcie_ctrl_tx_async_0[52];
        assign o_ss_ch0_pcie_ctrl_tx_async[53] = o_ss_ch0_pcie_ctrl_tx_async_0[53];
        assign o_ss_ch0_pcie_ctrl_tx_async[54] = o_ss_ch0_pcie_ctrl_tx_async_0[54];
        assign o_ss_ch0_pcie_ctrl_tx_async[55] = o_ss_ch0_pcie_ctrl_tx_async_0[55];
        assign o_ss_ch0_pcie_ctrl_tx_async[56] = o_ss_ch0_pcie_ctrl_tx_async_0[56];
        assign o_ss_ch0_pcie_ctrl_tx_async[57] = o_ss_ch0_pcie_ctrl_tx_async_0[57];
        assign o_ss_ch0_pcie_ctrl_tx_async[58] = o_ss_ch0_pcie_ctrl_tx_async_0[58];
        assign o_ss_ch0_pcie_ctrl_tx_async[59] = o_ss_ch0_pcie_ctrl_tx_async_0[59];
        assign o_ss_ch0_pcie_ctrl_tx_async[60] = o_ss_ch0_pcie_ctrl_tx_async_0[60];
        assign o_ss_ch0_pcie_ctrl_tx_async[61] = o_ss_ch0_pcie_ctrl_tx_async_0[61];
        assign o_ss_ch0_pcie_ctrl_tx_async[62] = o_ss_ch0_pcie_ctrl_tx_async_0[62];
        assign o_ss_ch0_pcie_ctrl_tx_async[63] = o_ss_ch0_pcie_ctrl_tx_async_0[63];
        assign o_ss_ch0_pcie_ctrl_tx_async[64] = o_ss_ch0_pcie_ctrl_tx_async_0[64];
        assign o_ss_ch0_pcie_ctrl_tx_async[65] = o_ss_ch0_pcie_ctrl_tx_async_0[65];
        assign o_ss_ch0_pcie_ctrl_tx_async[66] = o_ss_ch0_pcie_ctrl_tx_async_0[66];
        assign o_ss_ch0_pcie_ctrl_tx_async[67] = o_ss_ch0_pcie_ctrl_tx_async_0[67];
        assign o_ss_ch0_pcie_ctrl_tx_async[68] = o_ss_ch0_pcie_ctrl_tx_async_0[68];
        assign o_ss_ch0_pcie_ctrl_tx_async[69] = o_ss_ch0_pcie_ctrl_tx_async_0[69];
        assign o_ss_ch0_pcie_ctrl_tx_async[70] = o_ss_ch0_pcie_ctrl_tx_async_0[70];
        assign o_ss_ch0_pcie_ctrl_tx_async[71] = o_ss_ch0_pcie_ctrl_tx_async_0[71];
        assign o_ss_ch0_pcie_ctrl_tx_async[72] = o_ss_ch0_pcie_ctrl_tx_async_0[72];
        assign o_ss_ch0_pcie_ctrl_tx_async[73] = o_ss_ch0_pcie_ctrl_tx_async_0[73];
        assign o_ss_ch0_pcie_ctrl_tx_async[74] = o_ss_ch0_pcie_ctrl_tx_async_0[74];
        assign o_ss_ch0_pcie_ctrl_tx_async[75] = o_ss_ch0_pcie_ctrl_tx_async_0[75];
        assign o_ss_ch0_pcie_ctrl_tx_async[76] = o_ss_ch0_pcie_ctrl_tx_async_0[76];
        assign o_ss_ch0_pcie_ctrl_tx_async[77] = o_ss_ch0_pcie_ctrl_tx_async_0[77];
        assign o_ss_ch0_pcie_ctrl_tx_async[78] = o_ss_ch0_pcie_ctrl_tx_async_0[78];
        assign o_ss_ch0_pcie_ctrl_tx_async[79] = o_ss_ch0_pcie_ctrl_tx_async_0[79];
        assign o_ss_ch0_pcie_ctrl_tx_async[80] = o_ss_ch0_pcie_ctrl_tx_async_0[80];
        assign o_ss_ch0_pcie_ctrl_tx_async[81] = o_ss_ch0_pcie_ctrl_tx_async_0[81];
        assign o_ss_ch0_pcie_ctrl_tx_async[82] = o_ss_ch0_pcie_ctrl_tx_async_0[82];
        assign o_ss_ch0_pcie_ctrl_tx_async[83] = o_ss_ch0_pcie_ctrl_tx_async_0[83];
        assign o_ss_ch0_pcie_ctrl_tx_async[84] = o_ss_ch0_pcie_ctrl_tx_async_0[84];
        assign o_ss_ch0_pcie_ctrl_tx_async[85] = o_ss_ch0_pcie_ctrl_tx_async_0[85];
        assign o_ss_ch0_pcie_ctrl_tx_async[86] = o_ss_ch0_pcie_ctrl_tx_async_0[86];
        assign o_ss_ch0_pcie_ctrl_tx_async[87] = o_ss_ch0_pcie_ctrl_tx_async_0[87];
        assign o_ss_ch0_pcie_ctrl_tx_direct[0] = o_ss_ch0_pcie_ctrl_tx_direct_0[0];
        assign o_ss_ch0_pcie_ctrl_tx_direct[1] = o_ss_ch0_pcie_ctrl_tx_direct_0[1];
        assign o_ss_ch0_pcie_ctrl_tx_direct[2] = o_ss_ch0_pcie_ctrl_tx_direct_0[2];
        assign o_ss_ch0_pcie_ctrl_tx_direct[3] = o_ss_ch0_pcie_ctrl_tx_direct_0[3];
        assign o_ss_ch0_pcie_ctrl_tx_direct[4] = o_ss_ch0_pcie_ctrl_tx_direct_0[4];
        assign o_ss_ch0_pcie_ctrl_tx_direct[5] = o_ss_ch0_pcie_ctrl_tx_direct_0[5];
        assign o_ss_ch0_pcie_ctrl_tx_direct[6] = o_ss_ch0_pcie_ctrl_tx_direct_0[6];
        assign o_ss_ch0_pcie_ctrl_tx_direct[7] = o_ss_ch0_pcie_ctrl_tx_direct_0[7];
        assign o_ch0_rx_data_1[0] = o_ch0_rx_data[0];
        assign o_ch0_rx_data_1[1] = o_ch0_rx_data[1];
        assign o_ch0_rx_data_1[2] = o_ch0_rx_data[2];
        assign o_ch0_rx_data_1[3] = o_ch0_rx_data[3];
        assign o_ch0_rx_data_1[4] = o_ch0_rx_data[4];
        assign o_ch0_rx_data_1[5] = o_ch0_rx_data[5];
        assign o_ch0_rx_data_1[6] = o_ch0_rx_data[6];
        assign o_ch0_rx_data_1[7] = o_ch0_rx_data[7];
        assign o_ch0_rx_data_1[8] = o_ch0_rx_data[8];
        assign o_ch0_rx_data_1[9] = o_ch0_rx_data[9];
        assign o_ch0_rx_data_1[10] = o_ch0_rx_data[10];
        assign o_ch0_rx_data_1[11] = o_ch0_rx_data[11];
        assign o_ch0_rx_data_1[12] = o_ch0_rx_data[12];
        assign o_ch0_rx_data_1[13] = o_ch0_rx_data[13];
        assign o_ch0_rx_data_1[14] = o_ch0_rx_data[14];
        assign o_ch0_rx_data_1[15] = o_ch0_rx_data[15];
        assign o_ch0_rx_data_1[16] = o_ch0_rx_data[16];
        assign o_ch0_rx_data_1[17] = o_ch0_rx_data[17];
        assign o_ch0_rx_data_1[18] = o_ch0_rx_data[18];
        assign o_ch0_rx_data_1[19] = o_ch0_rx_data[19];
        assign o_ch0_rx_data_1[20] = o_ch0_rx_data[20];
        assign o_ch0_rx_data_1[21] = o_ch0_rx_data[21];
        assign o_ch0_rx_data_1[22] = o_ch0_rx_data[22];
        assign o_ch0_rx_data_1[23] = o_ch0_rx_data[23];
        assign o_ch0_rx_data_1[24] = o_ch0_rx_data[24];
        assign o_ch0_rx_data_1[25] = o_ch0_rx_data[25];
        assign o_ch0_rx_data_1[26] = o_ch0_rx_data[26];
        assign o_ch0_rx_data_1[27] = o_ch0_rx_data[27];
        assign o_ch0_rx_data_1[28] = o_ch0_rx_data[28];
        assign o_ch0_rx_data_1[29] = o_ch0_rx_data[29];
        assign o_ch0_rx_data_1[30] = o_ch0_rx_data[30];
        assign o_ch0_rx_data_1[31] = o_ch0_rx_data[31];
        assign o_ch0_rx_data_1[32] = o_ch0_rx_data[32];
        assign o_ch0_rx_data_1[33] = o_ch0_rx_data[33];
        assign o_ch0_rx_data_1[34] = o_ch0_rx_data[34];
        assign o_ch0_rx_data_1[35] = o_ch0_rx_data[35];
        assign o_ch0_rx_data_1[36] = o_ch0_rx_data[36];
        assign o_ch0_rx_data_1[37] = o_ch0_rx_data[37];
        assign o_ch0_rx_data_1[38] = o_ch0_rx_data[38];
        assign o_ch0_rx_data_1[39] = o_ch0_rx_data[39];
        assign o_ch0_rx_data_1[40] = o_ch0_rx_data[40];
        assign o_ch0_rx_data_1[41] = o_ch0_rx_data[41];
        assign o_ch0_rx_data_1[42] = o_ch0_rx_data[42];
        assign o_ch0_rx_data_1[43] = o_ch0_rx_data[43];
        assign o_ch0_rx_data_1[44] = o_ch0_rx_data[44];
        assign o_ch0_rx_data_1[45] = o_ch0_rx_data[45];
        assign o_ch0_rx_data_1[46] = o_ch0_rx_data[46];
        assign o_ch0_rx_data_1[47] = o_ch0_rx_data[47];
        assign o_ch0_rx_data_1[48] = o_ch0_rx_data[48];
        assign o_ch0_rx_data_1[49] = o_ch0_rx_data[49];
        assign o_ch0_rx_data_1[50] = o_ch0_rx_data[50];
        assign o_ch0_rx_data_1[51] = o_ch0_rx_data[51];
        assign o_ch0_rx_data_1[52] = o_ch0_rx_data[52];
        assign o_ch0_rx_data_1[53] = o_ch0_rx_data[53];
        assign o_ch0_rx_data_1[54] = o_ch0_rx_data[54];
        assign o_ch0_rx_data_1[55] = o_ch0_rx_data[55];
        assign o_ch0_rx_data_1[56] = o_ch0_rx_data[56];
        assign o_ch0_rx_data_1[57] = o_ch0_rx_data[57];
        assign o_ch0_rx_data_1[58] = o_ch0_rx_data[58];
        assign o_ch0_rx_data_1[59] = o_ch0_rx_data[59];
        assign o_ch0_rx_data_1[60] = o_ch0_rx_data[60];
        assign o_ch0_rx_data_1[61] = o_ch0_rx_data[61];
        assign o_ch0_rx_data_1[62] = o_ch0_rx_data[62];
        assign o_ch0_rx_data_1[63] = o_ch0_rx_data[63];
        assign o_ch0_rx_data_1[64] = o_ch0_rx_data[64];
        assign o_ch0_rx_data_1[65] = o_ch0_rx_data[65];
        assign o_ch0_rx_data_1[66] = o_ch0_rx_data[66];
        assign o_ch0_rx_data_1[67] = o_ch0_rx_data[67];
        assign o_ch0_rx_data_1[68] = o_ch0_rx_data[68];
        assign o_ch0_rx_data_1[69] = o_ch0_rx_data[69];
        assign o_ch0_rx_data_1[70] = o_ch0_rx_data[70];
        assign o_ch0_rx_data_1[71] = o_ch0_rx_data[71];
        assign o_ch0_rx_data_1[72] = o_ch0_rx_data[72];
        assign o_ch0_rx_data_1[73] = o_ch0_rx_data[73];
        assign o_ch0_rx_data_1[74] = o_ch0_rx_data[74];
        assign o_ch0_rx_data_1[75] = o_ch0_rx_data[75];
        assign o_ch0_rx_data_1[76] = o_ch0_rx_data[76];
        assign o_ch0_rx_data_1[77] = o_ch0_rx_data[77];
        assign o_ch0_rx_data_1[78] = o_ch0_rx_data[78];
        assign o_ch0_rx_data_1[79] = o_ch0_rx_data[79];
        assign o_ss_ch0_pcie_tx_data[0] = o_ss_ch0_pcie_tx_data_0[0];
        assign o_ss_ch0_pcie_tx_data[1] = o_ss_ch0_pcie_tx_data_0[1];
        assign o_ss_ch0_pcie_tx_data[2] = o_ss_ch0_pcie_tx_data_0[2];
        assign o_ss_ch0_pcie_tx_data[3] = o_ss_ch0_pcie_tx_data_0[3];
        assign o_ss_ch0_pcie_tx_data[4] = o_ss_ch0_pcie_tx_data_0[4];
        assign o_ss_ch0_pcie_tx_data[5] = o_ss_ch0_pcie_tx_data_0[5];
        assign o_ss_ch0_pcie_tx_data[6] = o_ss_ch0_pcie_tx_data_0[6];
        assign o_ss_ch0_pcie_tx_data[7] = o_ss_ch0_pcie_tx_data_0[7];
        assign o_ss_ch0_pcie_tx_data[8] = o_ss_ch0_pcie_tx_data_0[8];
        assign o_ss_ch0_pcie_tx_data[9] = o_ss_ch0_pcie_tx_data_0[9];
        assign o_ss_ch0_pcie_tx_data[10] = o_ss_ch0_pcie_tx_data_0[10];
        assign o_ss_ch0_pcie_tx_data[11] = o_ss_ch0_pcie_tx_data_0[11];
        assign o_ss_ch0_pcie_tx_data[12] = o_ss_ch0_pcie_tx_data_0[12];
        assign o_ss_ch0_pcie_tx_data[13] = o_ss_ch0_pcie_tx_data_0[13];
        assign o_ss_ch0_pcie_tx_data[14] = o_ss_ch0_pcie_tx_data_0[14];
        assign o_ss_ch0_pcie_tx_data[15] = o_ss_ch0_pcie_tx_data_0[15];
        assign o_ss_ch0_pcie_tx_data[16] = o_ss_ch0_pcie_tx_data_0[16];
        assign o_ss_ch0_pcie_tx_data[17] = o_ss_ch0_pcie_tx_data_0[17];
        assign o_ss_ch0_pcie_tx_data[18] = o_ss_ch0_pcie_tx_data_0[18];
        assign o_ss_ch0_pcie_tx_data[19] = o_ss_ch0_pcie_tx_data_0[19];
        assign o_ss_ch0_pcie_tx_data[20] = o_ss_ch0_pcie_tx_data_0[20];
        assign o_ss_ch0_pcie_tx_data[21] = o_ss_ch0_pcie_tx_data_0[21];
        assign o_ss_ch0_pcie_tx_data[22] = o_ss_ch0_pcie_tx_data_0[22];
        assign o_ss_ch0_pcie_tx_data[23] = o_ss_ch0_pcie_tx_data_0[23];
        assign o_ss_ch0_pcie_tx_data[24] = o_ss_ch0_pcie_tx_data_0[24];
        assign o_ss_ch0_pcie_tx_data[25] = o_ss_ch0_pcie_tx_data_0[25];
        assign o_ss_ch0_pcie_tx_data[26] = o_ss_ch0_pcie_tx_data_0[26];
        assign o_ss_ch0_pcie_tx_data[27] = o_ss_ch0_pcie_tx_data_0[27];
        assign o_ss_ch0_pcie_tx_data[28] = o_ss_ch0_pcie_tx_data_0[28];
        assign o_ss_ch0_pcie_tx_data[29] = o_ss_ch0_pcie_tx_data_0[29];
        assign o_ss_ch0_pcie_tx_data[30] = o_ss_ch0_pcie_tx_data_0[30];
        assign o_ss_ch0_pcie_tx_data[31] = o_ss_ch0_pcie_tx_data_0[31];
        assign o_ss_ch0_pcie_tx_data[32] = o_ss_ch0_pcie_tx_data_0[32];
        assign o_ss_ch0_pcie_tx_data[33] = o_ss_ch0_pcie_tx_data_0[33];
        assign o_ss_ch0_pcie_tx_data[34] = o_ss_ch0_pcie_tx_data_0[34];
        assign o_ss_ch0_pcie_tx_data[35] = o_ss_ch0_pcie_tx_data_0[35];
        assign o_ss_ch0_pcie_tx_data[36] = o_ss_ch0_pcie_tx_data_0[36];
        assign o_ss_ch0_pcie_tx_data[37] = o_ss_ch0_pcie_tx_data_0[37];
        assign o_ss_ch0_pcie_tx_data[38] = o_ss_ch0_pcie_tx_data_0[38];
        assign o_ss_ch0_pcie_tx_data[39] = o_ss_ch0_pcie_tx_data_0[39];
        assign o_ss_ch0_pcie_tx_data[40] = o_ss_ch0_pcie_tx_data_0[40];
        assign o_ss_ch0_pcie_tx_data[41] = o_ss_ch0_pcie_tx_data_0[41];
        assign o_ss_ch0_pcie_tx_data[42] = o_ss_ch0_pcie_tx_data_0[42];
        assign o_ss_ch0_pcie_tx_data[43] = o_ss_ch0_pcie_tx_data_0[43];
        assign o_ss_ch0_pcie_tx_data[44] = o_ss_ch0_pcie_tx_data_0[44];
        assign o_ss_ch0_pcie_tx_data[45] = o_ss_ch0_pcie_tx_data_0[45];
        assign o_ss_ch0_pcie_tx_data[46] = o_ss_ch0_pcie_tx_data_0[46];
        assign o_ss_ch0_pcie_tx_data[47] = o_ss_ch0_pcie_tx_data_0[47];
        assign o_ss_ch0_pcie_tx_data[48] = o_ss_ch0_pcie_tx_data_0[48];
        assign o_ss_ch0_pcie_tx_data[49] = o_ss_ch0_pcie_tx_data_0[49];
        assign o_ss_ch0_pcie_tx_data[50] = o_ss_ch0_pcie_tx_data_0[50];
        assign o_ss_ch0_pcie_tx_data[51] = o_ss_ch0_pcie_tx_data_0[51];
        assign o_ss_ch0_pcie_tx_data[52] = o_ss_ch0_pcie_tx_data_0[52];
        assign o_ss_ch0_pcie_tx_data[53] = o_ss_ch0_pcie_tx_data_0[53];
        assign o_ss_ch0_pcie_tx_data[54] = o_ss_ch0_pcie_tx_data_0[54];
        assign o_ss_ch0_pcie_tx_data[55] = o_ss_ch0_pcie_tx_data_0[55];
        assign o_ss_ch0_pcie_tx_data[56] = o_ss_ch0_pcie_tx_data_0[56];
        assign o_ss_ch0_pcie_tx_data[57] = o_ss_ch0_pcie_tx_data_0[57];
        assign o_ss_ch0_pcie_tx_data[58] = o_ss_ch0_pcie_tx_data_0[58];
        assign o_ss_ch0_pcie_tx_data[59] = o_ss_ch0_pcie_tx_data_0[59];
        assign o_ss_ch0_pcie_tx_data[60] = o_ss_ch0_pcie_tx_data_0[60];
        assign o_ss_ch0_pcie_tx_data[61] = o_ss_ch0_pcie_tx_data_0[61];
        assign o_ss_ch0_pcie_tx_data[62] = o_ss_ch0_pcie_tx_data_0[62];
        assign o_ss_ch0_pcie_tx_data[63] = o_ss_ch0_pcie_tx_data_0[63];
        assign o_ss_ch0_pcie_tx_data[64] = o_ss_ch0_pcie_tx_data_0[64];
        assign o_ss_ch0_pcie_tx_data[65] = o_ss_ch0_pcie_tx_data_0[65];
        assign o_ss_ch0_pcie_tx_data[66] = o_ss_ch0_pcie_tx_data_0[66];
        assign o_ss_ch0_pcie_tx_data[67] = o_ss_ch0_pcie_tx_data_0[67];
        assign o_ss_ch0_pcie_tx_data[68] = o_ss_ch0_pcie_tx_data_0[68];
        assign o_ss_ch0_pcie_tx_data[69] = o_ss_ch0_pcie_tx_data_0[69];
        assign o_ss_ch0_pcie_tx_data[70] = o_ss_ch0_pcie_tx_data_0[70];
        assign o_ss_ch0_pcie_tx_data[71] = o_ss_ch0_pcie_tx_data_0[71];
        assign o_ss_ch0_pcie_tx_data[72] = o_ss_ch0_pcie_tx_data_0[72];
        assign o_ss_ch0_pcie_tx_data[73] = o_ss_ch0_pcie_tx_data_0[73];
        assign o_ss_ch0_pcie_tx_data[74] = o_ss_ch0_pcie_tx_data_0[74];
        assign o_ss_ch0_pcie_tx_data[75] = o_ss_ch0_pcie_tx_data_0[75];
        assign o_ss_ch0_pcie_tx_data[76] = o_ss_ch0_pcie_tx_data_0[76];
        assign o_ss_ch0_pcie_tx_data[77] = o_ss_ch0_pcie_tx_data_0[77];
        assign o_ss_ch0_pcie_tx_data[78] = o_ss_ch0_pcie_tx_data_0[78];
        assign o_ss_ch0_pcie_tx_data[79] = o_ss_ch0_pcie_tx_data_0[79];
        assign o_user_rx_clk1_clk_0 = o_user_rx_clk1_clk;
        assign o_user_rx_clk2_clk_0 = o_user_rx_clk2_clk;
        assign o_user_tx_clk1_clk_0 = o_user_tx_clk1_clk;
        assign o_user_tx_clk2_clk_0 = o_user_tx_clk2_clk;
        assign o_ss_pcie_ch0_rst_pld_clrhip = o_ss_pcie_ch0_rst_pld_clrhip_0;
        assign o_ss_pcie_ch0_rst_pld_clrpcs = o_ss_pcie_ch0_rst_pld_clrpcs_0;
        assign o_ss_pcie_ch0_rst_pld_perstn = o_ss_pcie_ch0_rst_pld_perstn_0;
        assign s441_51_1__hssi_clk__clk = x_mux_sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0__i_pcie_top;


        tennm_sm_hssi_pcie_clk_mux #(
                .sel(x_mux_sm_hssi_pcie_clk_mux_0__sel)
        ) x_mux_sm_hssi_pcie_clk_mux_0 (
                .i_bot_clk(x_mux_sm_hssi_pcie_clk_mux_0__i_bot_clk_1),
                .i_middle_clk(o_local_syspll_c0_0),
                .i_top_clk(x_mux_sm_hssi_pcie_clk_mux_0__i_top_clk_1),
                .i_unused_clk(n1_4),
                .o_clk(o_pld_pcie_clk_4)
        );

        tennm_sm_hssi_pcie_data_mux #(
                .sel(x_mux_sm_hssi_pcie_data_mux_0__sel)
        ) x_mux_sm_hssi_pcie_data_mux_0 (
                .i_bot_data(ss_ctrl_u0__o_pcie_gbl_downward_syspll_locked_0),
                .i_middle_data(pld_pwr_level_shifter_u0__o_ss_vccl_syspll_locked_0),
                .i_top_data(),
                .i_unused_data(n1_4),
                .o_data(pcie_data_mux_u0__o_data_0)
        );

        tennm_sm_hssi_pld_chnl_dp #(
                .dr_enabled(x_std_sm_hssi_pld_chnl_dp_0__dr_enabled),
                .duplex_mode(x_std_sm_hssi_pld_chnl_dp_0__duplex_mode),
                .pld_channel_identifier(x_std_sm_hssi_pld_chnl_dp_0__pld_channel_identifier),
                .rx_clkout1_divider(x_std_sm_hssi_pld_chnl_dp_0__rx_clkout1_divider),
                .rx_clkout2_divider(x_std_sm_hssi_pld_chnl_dp_0__rx_clkout2_divider),
                .rx_en(x_std_sm_hssi_pld_chnl_dp_0__rx_en),
                .rx_fifo_mode(x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_mode),
                .rx_fifo_width(x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_width),
                .rx_fifo_wr_clk_hz(x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_wr_clk_hz),
                .rx_user1_clk_dynamic_mux(x_std_sm_hssi_pld_chnl_dp_0__rx_user1_clk_dynamic_mux),
                .rx_user2_clk_dynamic_mux(x_std_sm_hssi_pld_chnl_dp_0__rx_user2_clk_dynamic_mux),
                .sup_mode(x_std_sm_hssi_pld_chnl_dp_0__sup_mode),
                .tx_clkout1_divider(x_std_sm_hssi_pld_chnl_dp_0__tx_clkout1_divider),
                .tx_clkout2_divider(x_std_sm_hssi_pld_chnl_dp_0__tx_clkout2_divider),
                .tx_en(x_std_sm_hssi_pld_chnl_dp_0__tx_en),
                .tx_fifo_mode(x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_mode),
                .tx_fifo_rd_clk_hz(x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_rd_clk_hz),
                .tx_fifo_width(x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_width),
                .tx_user1_clk_dynamic_mux(x_std_sm_hssi_pld_chnl_dp_0__tx_user1_clk_dynamic_mux),
                .tx_user2_clk_dynamic_mux(x_std_sm_hssi_pld_chnl_dp_0__tx_user2_clk_dynamic_mux),
                .vc_rx_pldif_wm_en(x_std_sm_hssi_pld_chnl_dp_0__vc_rx_pldif_wm_en)
        ) x_std_sm_hssi_pld_chnl_dp_0 (
                .i_hio_det_lat_rx_dl_clk(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_dl_clk_1),
                .i_hio_det_lat_rx_mux_select(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_mux_select_1),
                .i_hio_det_lat_rx_sclk_flop(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_flop_1),
                .i_hio_det_lat_rx_sclk_gen_clk(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_gen_clk_1),
                .i_hio_det_lat_rx_trig_flop(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_trig_flop_1),
                .i_hio_det_lat_sampling_clk(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_sampling_clk_1),
                .i_hio_det_lat_tx_dl_clk(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_dl_clk_1),
                .i_hio_det_lat_tx_mux_select(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_mux_select_1),
                .i_hio_det_lat_tx_sclk_flop(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_flop_1),
                .i_hio_det_lat_tx_sclk_gen_clk(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_gen_clk_1),
                .i_hio_det_lat_tx_trig_flop(x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_trig_flop_1),
                .i_hio_ehip_rx_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_ehip_signal_ok(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_ehip_tx_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_lavmm_addr({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[20], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[19], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[18], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[17], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[16], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[15], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[14], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[13], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[12], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[11], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[10], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr_0[0] }),
                .i_hio_lavmm_be({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be_0[0] }),
                .i_hio_lavmm_clk(x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_clk_1),
                .i_hio_lavmm_read(x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_read_1),
                .i_hio_lavmm_rstn(x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_rstn_1),
                .i_hio_lavmm_wdata({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[31], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[30], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[29], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[28], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[27], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[26], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[25], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[24], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[23], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[22], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[21], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[20], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[19], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[18], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[17], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[16], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[15], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[14], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[13], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[12], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[11], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[10], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata_0[0] }),
                .i_hio_lavmm_write(x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_write_1),
                .i_hio_pld_reset_clk_row(x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_reset_clk_row_1),
                .i_hio_pld_rx_clk_in_row_clk(x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_rx_clk_in_row_clk_1),
                .i_hio_pld_tx_clk_in_row_clk(x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_tx_clk_in_row_clk_1),
                .i_hio_ptp_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rst_pld_adapter_rx_pld_rst_n(x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_rx_pld_rst_n_1),
                .i_hio_rst_pld_adapter_tx_pld_rst_n(x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_tx_pld_rst_n_1),
                .i_hio_rst_pld_clrhip(x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrhip_1),
                .i_hio_rst_pld_clrpcs(x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrpcs_1),
                .i_hio_rst_pld_perstn(x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_perstn_1),
                .i_hio_rst_pld_ready(x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_ready_1),
                .i_hio_rst_ux_rx_pma_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rst_ux_rx_sfrz(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rst_ux_tx_pma_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstfec_fec_csr_ret(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstfec_fec_rx_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstfec_fec_tx_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstfec_rx_fec_sfrz_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstfec_tx_fec_sfrz_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstxcvrif_rx_xcvrif_sfrz_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstxcvrif_tx_xcvrif_sfrz_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstxcvrif_xcvrif_rx_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstxcvrif_xcvrif_signal_ok(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rstxcvrif_xcvrif_tx_rst_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_rxdata_fifo_rd_en(x_std_sm_hssi_pld_chnl_dp_0__i_hio_rxdata_fifo_rd_en_1),
                .i_hio_sfreeze_2_r03f_rx_mac_srfz_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_hio_txdata({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[79], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[78], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[77], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[76], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[75], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[74], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[73], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[72], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[71], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[70], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[69], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[68], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[67], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[66], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[65], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[64], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[63], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[62], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[61], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[60], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[59], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[58], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[57], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[56], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[55], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[54], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[53], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[52], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[51], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[50], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[49], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[48], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[47], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[46], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[45], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[44], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[43], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[42], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[41], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[40], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[39], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[38], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[37], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[36], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[35], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[34], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[33], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[32], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[31], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[30], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[29], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[28], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[27], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[26], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[25], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[24], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[23], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[22], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[21], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[20], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[19], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[18], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[17], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[16], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[15], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[14], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[13], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[12], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[11], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[10], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_0[0] }),
                .i_hio_txdata_async({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[99], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[98], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[97], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[96], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[95], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[94], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[93], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[92], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[91], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[90], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[89], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[88], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[87], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[86], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[85], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[84], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[83], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[82], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[81], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[80], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[79], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[78], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[77], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[76], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[75], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[74], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[73], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[72], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[71], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[70], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[69], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[68], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[67], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[66], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[65], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[64], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[63], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[62], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[61], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[60], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[59], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[58], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[57], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[56], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[55], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[54], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[53], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[52], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[51], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[50], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[49], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[48], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[47], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[46], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[45], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[44], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[43], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[42], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[41], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[40], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[39], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[38], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[37], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[36], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[35], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[34], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[33], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[32], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[31], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[30], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[29], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[28], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[27], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[26], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[25], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[24], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[23], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[22], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[21], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[20], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[19], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[18], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[17], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[16], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[15], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[14], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[13], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[12], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[11], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[10], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async_0[0] }),
                .i_hio_txdata_direct({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct_0[0] }),
                .i_hio_txdata_extra({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra_0[0] }),
                .i_hio_txdata_fifo_wr_en(x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_fifo_wr_en_1),
                .i_hio_uxquad_async({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[79], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[78], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[77], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[76], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[75], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[74], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[73], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[72], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[71], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[70], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[69], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[68], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[67], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[66], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[65], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[64], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[63], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[62], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[61], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[60], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[59], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[58], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[57], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[56], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[55], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[54], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[53], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[52], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[51], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[50], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[49], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[48], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[47], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[46], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[45], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[44], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[43], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[42], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[41], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[40], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[39], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[38], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[37], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[36], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[35], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[34], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[33], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[32], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[31], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[30], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[29], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[28], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[27], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[26], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[25], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[24], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[23], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[22], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[21], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[20], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[19], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[18], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[17], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[16], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[15], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[14], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[13], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[12], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[11], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[10], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_0[0] }),
                .i_hio_uxquad_async_pcie_mux({ x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[79], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[78], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[77], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[76], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[75], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[74], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[73], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[72], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[71], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[70], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[69], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[68], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[67], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[66], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[65], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[64], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[63], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[62], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[61], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[60], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[59], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[58], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[57], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[56], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[55], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[54], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[53], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[52], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[51], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[50], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[49], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[48], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[47], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[46], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[45], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[44], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[43], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[42], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[41], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[40], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[39], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[38], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[37], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[36], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[35], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[34], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[33], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[32], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[31], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[30], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[29], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[28], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[27], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[26], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[25], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[24], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[23], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[22], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[21], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[20], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[19], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[18], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[17], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[16], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[15], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[14], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[13], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[12], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[11], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[10], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux_0[0] }),
                .i_ss_det_lat_rx_async_pulse(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_det_lat_tx_async_pulse(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_eth_dkw_rx_async({ pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1] }),
                .i_ss_eth_dkw_rx_direct(pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1]),
                .i_ss_eth_fec_rx_async({ quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0  }),
                .i_ss_eth_fec_rx_direct(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_eth_mac_rx_async({ quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0  }),
                .i_ss_eth_mac_rx_direct(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_eth_pcs_rx_async({ quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0  }),
                .i_ss_eth_pcs_rx_direct(quartus_i_dft_hssi_scan_mode_0),
                .i_ss_eth_xcvrif_rx_async({ quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0, quartus_i_dft_hssi_scan_mode_0 }),
                .i_ss_eth_xcvrif_rx_direct(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_lavmm_ethe_rdata({ x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[31], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[30], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[29], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[28], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[27], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[26], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[25], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[24], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[23], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[22], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[21], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[20], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[19], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[18], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[17], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[16], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[15], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[14], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[13], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[12], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[11], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[10], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_0[0] }),
                .i_ss_lavmm_ethe_rdata_valid(x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_valid_1),
                .i_ss_lavmm_ethe_waitreq(x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_waitreq_1),
                .i_ss_lavmm_pcie_rdata({ x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[31], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[30], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[29], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[28], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[27], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[26], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[25], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[24], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[23], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[22], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[21], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[20], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[19], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[18], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[17], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[16], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[15], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[14], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[13], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[12], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[11], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[10], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[9], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[8], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[7], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[6], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[5], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[4], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[3], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[2], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[1], x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_0[0] }),
                .i_ss_lavmm_pcie_rdata_valid(x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_valid_1),
                .i_ss_lavmm_pcie_waitreq(x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_waitreq_1),
                .i_ss_pcie_ctrl_rx_async({ o_ch0_pcie_ctrl_rx_async_1[87], o_ch0_pcie_ctrl_rx_async_1[86], o_ch0_pcie_ctrl_rx_async_1[85], o_ch0_pcie_ctrl_rx_async_1[84], o_ch0_pcie_ctrl_rx_async_1[83], o_ch0_pcie_ctrl_rx_async_1[82], o_ch0_pcie_ctrl_rx_async_1[81], o_ch0_pcie_ctrl_rx_async_1[80], o_ch0_pcie_ctrl_rx_async_1[79], o_ch0_pcie_ctrl_rx_async_1[78], o_ch0_pcie_ctrl_rx_async_1[77], o_ch0_pcie_ctrl_rx_async_1[76], o_ch0_pcie_ctrl_rx_async_1[75], o_ch0_pcie_ctrl_rx_async_1[74], o_ch0_pcie_ctrl_rx_async_1[73], o_ch0_pcie_ctrl_rx_async_1[72], o_ch0_pcie_ctrl_rx_async_1[71], o_ch0_pcie_ctrl_rx_async_1[70], o_ch0_pcie_ctrl_rx_async_1[69], o_ch0_pcie_ctrl_rx_async_1[68], o_ch0_pcie_ctrl_rx_async_1[67], o_ch0_pcie_ctrl_rx_async_1[66], o_ch0_pcie_ctrl_rx_async_1[65], o_ch0_pcie_ctrl_rx_async_1[64], o_ch0_pcie_ctrl_rx_async_1[63], o_ch0_pcie_ctrl_rx_async_1[62], o_ch0_pcie_ctrl_rx_async_1[61], o_ch0_pcie_ctrl_rx_async_1[60], o_ch0_pcie_ctrl_rx_async_1[59], o_ch0_pcie_ctrl_rx_async_1[58], o_ch0_pcie_ctrl_rx_async_1[57], o_ch0_pcie_ctrl_rx_async_1[56], o_ch0_pcie_ctrl_rx_async_1[55], o_ch0_pcie_ctrl_rx_async_1[54], o_ch0_pcie_ctrl_rx_async_1[53], o_ch0_pcie_ctrl_rx_async_1[52], o_ch0_pcie_ctrl_rx_async_1[51], o_ch0_pcie_ctrl_rx_async_1[50], o_ch0_pcie_ctrl_rx_async_1[49], o_ch0_pcie_ctrl_rx_async_1[48], o_ch0_pcie_ctrl_rx_async_1[47], o_ch0_pcie_ctrl_rx_async_1[46], o_ch0_pcie_ctrl_rx_async_1[45], o_ch0_pcie_ctrl_rx_async_1[44], o_ch0_pcie_ctrl_rx_async_1[43], o_ch0_pcie_ctrl_rx_async_1[42], o_ch0_pcie_ctrl_rx_async_1[41], o_ch0_pcie_ctrl_rx_async_1[40], o_ch0_pcie_ctrl_rx_async_1[39], o_ch0_pcie_ctrl_rx_async_1[38], o_ch0_pcie_ctrl_rx_async_1[37], o_ch0_pcie_ctrl_rx_async_1[36], o_ch0_pcie_ctrl_rx_async_1[35], o_ch0_pcie_ctrl_rx_async_1[34], o_ch0_pcie_ctrl_rx_async_1[33], o_ch0_pcie_ctrl_rx_async_1[32], o_ch0_pcie_ctrl_rx_async_1[31], o_ch0_pcie_ctrl_rx_async_1[30], o_ch0_pcie_ctrl_rx_async_1[29], o_ch0_pcie_ctrl_rx_async_1[28], o_ch0_pcie_ctrl_rx_async_1[27], o_ch0_pcie_ctrl_rx_async_1[26], o_ch0_pcie_ctrl_rx_async_1[25], o_ch0_pcie_ctrl_rx_async_1[24], o_ch0_pcie_ctrl_rx_async_1[23], o_ch0_pcie_ctrl_rx_async_1[22], o_ch0_pcie_ctrl_rx_async_1[21], o_ch0_pcie_ctrl_rx_async_1[20], o_ch0_pcie_ctrl_rx_async_1[19], o_ch0_pcie_ctrl_rx_async_1[18], o_ch0_pcie_ctrl_rx_async_1[17], o_ch0_pcie_ctrl_rx_async_1[16], o_ch0_pcie_ctrl_rx_async_1[15], o_ch0_pcie_ctrl_rx_async_1[14], o_ch0_pcie_ctrl_rx_async_1[13], o_ch0_pcie_ctrl_rx_async_1[12], o_ch0_pcie_ctrl_rx_async_1[11], o_ch0_pcie_ctrl_rx_async_1[10], o_ch0_pcie_ctrl_rx_async_1[9], o_ch0_pcie_ctrl_rx_async_1[8], o_ch0_pcie_ctrl_rx_async_1[7], o_ch0_pcie_ctrl_rx_async_1[6], o_ch0_pcie_ctrl_rx_async_1[5], o_ch0_pcie_ctrl_rx_async_1[4], o_ch0_pcie_ctrl_rx_async_1[3], o_ch0_pcie_ctrl_rx_async_1[2], o_ch0_pcie_ctrl_rx_async_1[1], o_ch0_pcie_ctrl_rx_async_1[0] }),
                .i_ss_pcie_ctrl_rx_direct({ o_ch0_pcie_ctrl_rx_direct_1[7], o_ch0_pcie_ctrl_rx_direct_1[6], o_ch0_pcie_ctrl_rx_direct_1[5], o_ch0_pcie_ctrl_rx_direct_1[4], o_ch0_pcie_ctrl_rx_direct_1[3], o_ch0_pcie_ctrl_rx_direct_1[2], o_ch0_pcie_ctrl_rx_direct_1[1], o_ch0_pcie_ctrl_rx_direct_1[0] }),
                .i_ss_rst_flux0_cpi_cmn_busy(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rst_oflux_rx_srds_rdy(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rst_ux_all_synthlockstatus(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rst_ux_octl_pcs_rxstatus(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rst_ux_octl_pcs_txstatus(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rst_ux_rxcdrlock2data(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rst_ux_rxcdrlockstatus(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rstepcs_rx_pcs_fully_aligned(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rstfec_fec_rx_rdy_n(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_rx_fifo_clk(o_rxfifo_ss_write_clk_0),
                .i_ss_rx_fifo_data({ pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[79], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[78], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[77], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[76], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[75], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[74], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[73], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[72], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[71], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[70], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[69], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[68], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[67], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[66], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[65], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[64], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[63], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[62], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[61], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[60], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[59], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[58], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[57], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[56], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[55], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[54], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[53], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[52], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[51], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[50], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[49], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[48], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[47], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[46], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[45], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[44], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[43], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[42], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[41], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[40], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[39], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[38], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[37], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[36], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[35], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[34], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[33], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[32], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[31], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[30], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[29], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[28], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[27], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[26], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[25], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[24], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[23], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[22], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[21], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[20], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[19], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[18], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[17], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[16], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[15], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[14], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[13], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[12], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[11], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[10], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[9], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[8], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[7], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[6], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[5], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[4], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[3], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[2], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[1], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[0] }),
                .i_ss_tx_fifo_clk(o_txfifo_ss_read_clk_0),
                .i_ss_user_rx_clk1_clk(o_user_rx_clk1_clk_0),
                .i_ss_user_rx_clk2_clk(o_user_rx_clk2_clk_0),
                .i_ss_user_tx_clk1_clk(o_user_tx_clk1_clk_0),
                .i_ss_user_tx_clk2_clk(o_user_tx_clk2_clk_0),
                .i_ss_uxquad_async({ quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0  }),
                .i_ss_xcvrif_rx_latency_pulse(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ss_xcvrif_tx_latency_pulse(quartus_i_dft_hssi_scan_mode_0 ),
                .i_ux_chnl_refclk_mux(1'b0),
                .i_ux_tx_ch_ptr_smpl(quartus_i_dft_hssi_scan_mode_0 ),
                .k_user_rx_clk1_c0c1c2_sel({ k_user_rx_clk1_c0c1c2_sel_0[2], k_user_rx_clk1_c0c1c2_sel_0[1], k_user_rx_clk1_c0c1c2_sel_0[0] }),
                .k_user_rx_clk2_c0c1c2_sel({ k_user_rx_clk2_c0c1c2_sel_0[2], k_user_rx_clk2_c0c1c2_sel_0[1], k_user_rx_clk2_c0c1c2_sel_0[0] }),
                .k_user_tx_clk1_c0c1c2_sel({ k_user_tx_clk1_c0c1c2_sel_0[2], k_user_tx_clk1_c0c1c2_sel_0[1], k_user_tx_clk1_c0c1c2_sel_0[0] }),
                .k_user_tx_clk2_c0c1c2_sel({ k_user_tx_clk2_c0c1c2_sel_0[2], k_user_tx_clk2_c0c1c2_sel_0[1], k_user_tx_clk2_c0c1c2_sel_0[0] }),
                .o_hio_det_lat_rx_async_dl_sync(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_dl_sync_1),
                .o_hio_det_lat_rx_async_pulse(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_pulse_1),
                .o_hio_det_lat_rx_async_sample_sync(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_sample_sync_1),
                .o_hio_det_lat_rx_sclk_sample_sync(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_sclk_sample_sync_1),
                .o_hio_det_lat_rx_trig_sample_sync(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_trig_sample_sync_1),
                .o_hio_det_lat_tx_async_dl_sync(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_dl_sync_1),
                .o_hio_det_lat_tx_async_pulse(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_pulse_1),
                .o_hio_det_lat_tx_async_sample_sync(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_sample_sync_1),
                .o_hio_det_lat_tx_sclk_sample_sync(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_sclk_sample_sync_1),
                .o_hio_det_lat_tx_trig_sample_sync(x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_trig_sample_sync_1),
                .o_hio_lavmm_rdata({ x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[31], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[30], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[29], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[28], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[27], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[26], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[25], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[24], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[23], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[22], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[21], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[20], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[19], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[18], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[17], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[16], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[15], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[14], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[13], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[12], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[11], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[10], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_0[0] }),
                .o_hio_lavmm_rdata_valid(x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_valid_1),
                .o_hio_lavmm_waitreq(x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_waitreq_1),
                .o_hio_rst_flux0_cpi_cmn_busy(tmp_121),
                .o_hio_rst_oflux_rx_srds_rdy(tmp_122),
                .o_hio_rst_ux_all_synthlockstatus(tmp_123),
                .o_hio_rst_ux_octl_pcs_rxstatus(tmp_124),
                .o_hio_rst_ux_octl_pcs_txstatus(tmp_125),
                .o_hio_rst_ux_rxcdrlock2data(tmp_126),
                .o_hio_rst_ux_rxcdrlockstatus(tmp_127),
                .o_hio_rstepcs_rx_pcs_fully_aligned(tmp_128),
                .o_hio_rstfec_fec_rx_rdy_n(tmp_129),
                .o_hio_rxdata({ x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[79], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[78], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[77], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[76], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[75], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[74], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[73], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[72], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[71], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[70], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[69], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[68], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[67], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[66], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[65], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[64], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[63], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[62], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[61], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[60], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[59], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[58], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[57], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[56], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[55], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[54], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[53], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[52], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[51], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[50], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[49], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[48], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[47], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[46], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[45], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[44], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[43], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[42], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[41], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[40], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[39], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[38], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[37], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[36], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[35], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[34], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[33], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[32], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[31], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[30], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[29], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[28], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[27], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[26], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[25], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[24], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[23], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[22], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[21], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[20], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[19], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[18], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[17], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[16], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[15], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[14], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[13], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[12], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[11], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[10], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_0[0] }),
                .o_hio_rxdata_async({ x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[99], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[98], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[97], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[96], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[95], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[94], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[93], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[92], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[91], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[90], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[89], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[88], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[87], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[86], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[85], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[84], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[83], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[82], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[81], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[80], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[79], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[78], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[77], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[76], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[75], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[74], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[73], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[72], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[71], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[70], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[69], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[68], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[67], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[66], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[65], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[64], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[63], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[62], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[61], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[60], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[59], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[58], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[57], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[56], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[55], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[54], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[53], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[52], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[51], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[50], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[49], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[48], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[47], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[46], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[45], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[44], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[43], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[42], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[41], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[40], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[39], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[38], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[37], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[36], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[35], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[34], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[33], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[32], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[31], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[30], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[29], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[28], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[27], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[26], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[25], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[24], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[23], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[22], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[21], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[20], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[19], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[18], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[17], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[16], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[15], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[14], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[13], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[12], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[11], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[10], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async_0[0] }),
                .o_hio_rxdata_direct({ x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct_0[0] }),
                .o_hio_rxdata_extra({ x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra_0[0] }),
                .o_hio_rxdata_fifo_rd_empty(x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_empty_1),
                .o_hio_rxdata_fifo_rd_full(x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_full_1),
                .o_hio_rxdata_fifo_rd_pempty(x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pempty_1),
                .o_hio_rxdata_fifo_rd_pfull(x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pfull_1),
                .o_hio_txdata_fifo_wr_empty(x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_empty_1),
                .o_hio_txdata_fifo_wr_full(x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_full_1),
                .o_hio_txdata_fifo_wr_pempty(x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pempty_1),
                .o_hio_txdata_fifo_wr_pfull(x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pfull_1),
                .o_hio_user_rx_clk1_clk(x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk1_clk_1),
                .o_hio_user_rx_clk2_clk(x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk2_clk_1),
                .o_hio_user_tx_clk1_clk(x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk1_clk_1),
                .o_hio_user_tx_clk2_clk(x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk2_clk_1),
                .o_hio_ux_chnl_refclk_mux(x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_chnl_refclk_mux_1),
                .o_hio_ux_tx_ch_ptr_smpl(x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_tx_ch_ptr_smpl_1),
                .o_hio_uxquad_async({ x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[49], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[48], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[47], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[46], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[45], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[44], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[43], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[42], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[41], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[40], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[39], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[38], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[37], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[36], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[35], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[34], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[33], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[32], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[31], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[30], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[29], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[28], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[27], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[26], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[25], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[24], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[23], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[22], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[21], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[20], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[19], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[18], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[17], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[16], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[15], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[14], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[13], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[12], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[11], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[10], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async_0[0] }),
                .o_hio_xcvrif_rx_latency_pulse(x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_rx_latency_pulse_1),
                .o_hio_xcvrif_tx_latency_pulse(x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_tx_latency_pulse_1),
                .o_ss_det_lat_rx_sclk_clk(tmp_130),
                .o_ss_det_lat_rx_sclk_sync(tmp_131),
                .o_ss_det_lat_tx_sclk_clk(tmp_132),
                .o_ss_det_lat_tx_sclk_sync(tmp_133),
                .o_ss_ehip_rx_rst_n(tmp_134),
                .o_ss_ehip_signal_ok(tmp_135),
                .o_ss_ehip_tx_rst_n(tmp_136),
                .o_ss_eth_dkw_tx_async({ tmp_137, tmp_138, tmp_139, tmp_140 }),
                .o_ss_eth_dkw_tx_direct(tmp_141),
                .o_ss_eth_fec_tx_async({ tmp_142, tmp_143, tmp_144, tmp_145, tmp_146, tmp_147, tmp_148 }),
                .o_ss_eth_fec_tx_direct(tmp_149),
                .o_ss_eth_mac_tx_async({ tmp_150, tmp_151, tmp_152, tmp_153, tmp_154, tmp_155, tmp_156, tmp_157, tmp_158, tmp_159, tmp_160, tmp_161, tmp_162, tmp_163 }),
                .o_ss_eth_mac_tx_direct(tmp_164),
                .o_ss_eth_pcs_tx_async({ tmp_165, tmp_166, tmp_167, tmp_168, tmp_169, tmp_170, tmp_171, tmp_172 }),
                .o_ss_eth_pcs_tx_direct(tmp_173),
                .o_ss_eth_xcvrif_tx_async({ tmp_174, tmp_175, tmp_176, tmp_177, tmp_178, tmp_179, tmp_180 }),
                .o_ss_eth_xcvrif_tx_direct(tmp_181),
                .o_ss_lavmm_ethe_addr({ x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[19], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[18], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[17], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[16], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[15], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[14], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[13], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[12], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[11], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[10], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr_0[0] }),
                .o_ss_lavmm_ethe_be({ x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be_0[0] }),
                .o_ss_lavmm_ethe_clk(x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_clk_1),
                .o_ss_lavmm_ethe_read(x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_read_1),
                .o_ss_lavmm_ethe_rstn(x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_rstn_1),
                .o_ss_lavmm_ethe_wdata({ x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[31], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[30], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[29], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[28], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[27], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[26], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[25], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[24], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[23], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[22], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[21], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[20], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[19], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[18], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[17], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[16], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[15], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[14], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[13], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[12], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[11], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[10], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata_0[0] }),
                .o_ss_lavmm_ethe_write(x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_write_1),
                .o_ss_lavmm_pcie_addr({ x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[16], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[15], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[14], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[13], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[12], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[11], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[10], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr_0[0] }),
                .o_ss_lavmm_pcie_be({ x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be_0[0] }),
                .o_ss_lavmm_pcie_clk(x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_clk_1),
                .o_ss_lavmm_pcie_read(x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_read_1),
                .o_ss_lavmm_pcie_rstn(x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_rstn_1),
                .o_ss_lavmm_pcie_wdata({ x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[31], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[30], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[29], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[28], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[27], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[26], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[25], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[24], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[23], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[22], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[21], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[20], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[19], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[18], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[17], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[16], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[15], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[14], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[13], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[12], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[11], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[10], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[9], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[8], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[7], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[6], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[5], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[4], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[3], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[2], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[1], x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata_0[0] }),
                .o_ss_lavmm_pcie_write(x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_write_1),
                .o_ss_pcie_ctrl_tx_async({ o_ss_ch0_pcie_ctrl_tx_async_0[87], o_ss_ch0_pcie_ctrl_tx_async_0[86], o_ss_ch0_pcie_ctrl_tx_async_0[85], o_ss_ch0_pcie_ctrl_tx_async_0[84], o_ss_ch0_pcie_ctrl_tx_async_0[83], o_ss_ch0_pcie_ctrl_tx_async_0[82], o_ss_ch0_pcie_ctrl_tx_async_0[81], o_ss_ch0_pcie_ctrl_tx_async_0[80], o_ss_ch0_pcie_ctrl_tx_async_0[79], o_ss_ch0_pcie_ctrl_tx_async_0[78], o_ss_ch0_pcie_ctrl_tx_async_0[77], o_ss_ch0_pcie_ctrl_tx_async_0[76], o_ss_ch0_pcie_ctrl_tx_async_0[75], o_ss_ch0_pcie_ctrl_tx_async_0[74], o_ss_ch0_pcie_ctrl_tx_async_0[73], o_ss_ch0_pcie_ctrl_tx_async_0[72], o_ss_ch0_pcie_ctrl_tx_async_0[71], o_ss_ch0_pcie_ctrl_tx_async_0[70], o_ss_ch0_pcie_ctrl_tx_async_0[69], o_ss_ch0_pcie_ctrl_tx_async_0[68], o_ss_ch0_pcie_ctrl_tx_async_0[67], o_ss_ch0_pcie_ctrl_tx_async_0[66], o_ss_ch0_pcie_ctrl_tx_async_0[65], o_ss_ch0_pcie_ctrl_tx_async_0[64], o_ss_ch0_pcie_ctrl_tx_async_0[63], o_ss_ch0_pcie_ctrl_tx_async_0[62], o_ss_ch0_pcie_ctrl_tx_async_0[61], o_ss_ch0_pcie_ctrl_tx_async_0[60], o_ss_ch0_pcie_ctrl_tx_async_0[59], o_ss_ch0_pcie_ctrl_tx_async_0[58], o_ss_ch0_pcie_ctrl_tx_async_0[57], o_ss_ch0_pcie_ctrl_tx_async_0[56], o_ss_ch0_pcie_ctrl_tx_async_0[55], o_ss_ch0_pcie_ctrl_tx_async_0[54], o_ss_ch0_pcie_ctrl_tx_async_0[53], o_ss_ch0_pcie_ctrl_tx_async_0[52], o_ss_ch0_pcie_ctrl_tx_async_0[51], o_ss_ch0_pcie_ctrl_tx_async_0[50], o_ss_ch0_pcie_ctrl_tx_async_0[49], o_ss_ch0_pcie_ctrl_tx_async_0[48], o_ss_ch0_pcie_ctrl_tx_async_0[47], o_ss_ch0_pcie_ctrl_tx_async_0[46], o_ss_ch0_pcie_ctrl_tx_async_0[45], o_ss_ch0_pcie_ctrl_tx_async_0[44], o_ss_ch0_pcie_ctrl_tx_async_0[43], o_ss_ch0_pcie_ctrl_tx_async_0[42], o_ss_ch0_pcie_ctrl_tx_async_0[41], o_ss_ch0_pcie_ctrl_tx_async_0[40], o_ss_ch0_pcie_ctrl_tx_async_0[39], o_ss_ch0_pcie_ctrl_tx_async_0[38], o_ss_ch0_pcie_ctrl_tx_async_0[37], o_ss_ch0_pcie_ctrl_tx_async_0[36], o_ss_ch0_pcie_ctrl_tx_async_0[35], o_ss_ch0_pcie_ctrl_tx_async_0[34], o_ss_ch0_pcie_ctrl_tx_async_0[33], o_ss_ch0_pcie_ctrl_tx_async_0[32], o_ss_ch0_pcie_ctrl_tx_async_0[31], o_ss_ch0_pcie_ctrl_tx_async_0[30], o_ss_ch0_pcie_ctrl_tx_async_0[29], o_ss_ch0_pcie_ctrl_tx_async_0[28], o_ss_ch0_pcie_ctrl_tx_async_0[27], o_ss_ch0_pcie_ctrl_tx_async_0[26], o_ss_ch0_pcie_ctrl_tx_async_0[25], o_ss_ch0_pcie_ctrl_tx_async_0[24], o_ss_ch0_pcie_ctrl_tx_async_0[23], o_ss_ch0_pcie_ctrl_tx_async_0[22], o_ss_ch0_pcie_ctrl_tx_async_0[21], o_ss_ch0_pcie_ctrl_tx_async_0[20], o_ss_ch0_pcie_ctrl_tx_async_0[19], o_ss_ch0_pcie_ctrl_tx_async_0[18], o_ss_ch0_pcie_ctrl_tx_async_0[17], o_ss_ch0_pcie_ctrl_tx_async_0[16], o_ss_ch0_pcie_ctrl_tx_async_0[15], o_ss_ch0_pcie_ctrl_tx_async_0[14], o_ss_ch0_pcie_ctrl_tx_async_0[13], o_ss_ch0_pcie_ctrl_tx_async_0[12], o_ss_ch0_pcie_ctrl_tx_async_0[11], o_ss_ch0_pcie_ctrl_tx_async_0[10], o_ss_ch0_pcie_ctrl_tx_async_0[9], o_ss_ch0_pcie_ctrl_tx_async_0[8], o_ss_ch0_pcie_ctrl_tx_async_0[7], o_ss_ch0_pcie_ctrl_tx_async_0[6], o_ss_ch0_pcie_ctrl_tx_async_0[5], o_ss_ch0_pcie_ctrl_tx_async_0[4], o_ss_ch0_pcie_ctrl_tx_async_0[3], o_ss_ch0_pcie_ctrl_tx_async_0[2], o_ss_ch0_pcie_ctrl_tx_async_0[1], o_ss_ch0_pcie_ctrl_tx_async_0[0] }),
                .o_ss_pcie_ctrl_tx_direct({ o_ss_ch0_pcie_ctrl_tx_direct_0[7], o_ss_ch0_pcie_ctrl_tx_direct_0[6], o_ss_ch0_pcie_ctrl_tx_direct_0[5], o_ss_ch0_pcie_ctrl_tx_direct_0[4], o_ss_ch0_pcie_ctrl_tx_direct_0[3], o_ss_ch0_pcie_ctrl_tx_direct_0[2], o_ss_ch0_pcie_ctrl_tx_direct_0[1], o_ss_ch0_pcie_ctrl_tx_direct_0[0] }),
                .o_ss_pcie_rst_pld_clrhip(o_ss_pcie_ch0_rst_pld_clrhip_0),
                .o_ss_pcie_rst_pld_clrpcs(o_ss_pcie_ch0_rst_pld_clrpcs_0),
                .o_ss_pcie_rst_pld_perstn(o_ss_pcie_ch0_rst_pld_perstn_0),
                .o_ss_ptp_rst_n(tmp_182),
                .o_ss_rst_pld_adapter_deskew_rx_pld_rst_n(tmp_183),
                .o_ss_rst_pld_adapter_deskew_tx_pld_rst_n(tmp_184),
                .o_ss_rst_pld_ready(tmp_185),
                .o_ss_rst_ux_rx_pma_rst_n(tmp_186),
                .o_ss_rst_ux_rx_sfrz(tmp_187),
                .o_ss_rst_ux_tx_pma_rst_n(tmp_188),
                .o_ss_rstfec_fec_csr_ret(tmp_189),
                .o_ss_rstfec_fec_rx_rst_n(tmp_190),
                .o_ss_rstfec_fec_tx_rst_n(tmp_191),
                .o_ss_rstfec_rx_fec_sfrz_n(tmp_192),
                .o_ss_rstfec_tx_fec_sfrz_n(tmp_193),
                .o_ss_rstxcvrif_rx_xcvrif_sfrz_n(tmp_194),
                .o_ss_rstxcvrif_tx_xcvrif_sfrz_n(tmp_195),
                .o_ss_rstxcvrif_xcvrif_rx_rst_n(tmp_196),
                .o_ss_rstxcvrif_xcvrif_signal_ok(tmp_197),
                .o_ss_rstxcvrif_xcvrif_tx_rst_n(tmp_198),
                .o_ss_sfreeze_2_r03f_rx_mac_srfz_n(tmp_199),
                .o_ss_sfreeze_3_c2f_tx_deskew_srfz_n(tmp_200),
                .o_ss_t03f_sfreeze_1_tx_pcs_sfrz_n(tmp_201),
                .o_ss_tx_fifo_data({ o_ss_tx_fifo_data_0[79], o_ss_tx_fifo_data_0[78], o_ss_tx_fifo_data_0[77], o_ss_tx_fifo_data_0[76], o_ss_tx_fifo_data_0[75], o_ss_tx_fifo_data_0[74], o_ss_tx_fifo_data_0[73], o_ss_tx_fifo_data_0[72], o_ss_tx_fifo_data_0[71], o_ss_tx_fifo_data_0[70], o_ss_tx_fifo_data_0[69], o_ss_tx_fifo_data_0[68], o_ss_tx_fifo_data_0[67], o_ss_tx_fifo_data_0[66], o_ss_tx_fifo_data_0[65], o_ss_tx_fifo_data_0[64], o_ss_tx_fifo_data_0[63], o_ss_tx_fifo_data_0[62], o_ss_tx_fifo_data_0[61], o_ss_tx_fifo_data_0[60], o_ss_tx_fifo_data_0[59], o_ss_tx_fifo_data_0[58], o_ss_tx_fifo_data_0[57], o_ss_tx_fifo_data_0[56], o_ss_tx_fifo_data_0[55], o_ss_tx_fifo_data_0[54], o_ss_tx_fifo_data_0[53], o_ss_tx_fifo_data_0[52], o_ss_tx_fifo_data_0[51], o_ss_tx_fifo_data_0[50], o_ss_tx_fifo_data_0[49], o_ss_tx_fifo_data_0[48], o_ss_tx_fifo_data_0[47], o_ss_tx_fifo_data_0[46], o_ss_tx_fifo_data_0[45], o_ss_tx_fifo_data_0[44], o_ss_tx_fifo_data_0[43], o_ss_tx_fifo_data_0[42], o_ss_tx_fifo_data_0[41], o_ss_tx_fifo_data_0[40], o_ss_tx_fifo_data_0[39], o_ss_tx_fifo_data_0[38], o_ss_tx_fifo_data_0[37], o_ss_tx_fifo_data_0[36], o_ss_tx_fifo_data_0[35], o_ss_tx_fifo_data_0[34], o_ss_tx_fifo_data_0[33], o_ss_tx_fifo_data_0[32], o_ss_tx_fifo_data_0[31], o_ss_tx_fifo_data_0[30], o_ss_tx_fifo_data_0[29], o_ss_tx_fifo_data_0[28], o_ss_tx_fifo_data_0[27], o_ss_tx_fifo_data_0[26], o_ss_tx_fifo_data_0[25], o_ss_tx_fifo_data_0[24], o_ss_tx_fifo_data_0[23], o_ss_tx_fifo_data_0[22], o_ss_tx_fifo_data_0[21], o_ss_tx_fifo_data_0[20], o_ss_tx_fifo_data_0[19], o_ss_tx_fifo_data_0[18], o_ss_tx_fifo_data_0[17], o_ss_tx_fifo_data_0[16], o_ss_tx_fifo_data_0[15], o_ss_tx_fifo_data_0[14], o_ss_tx_fifo_data_0[13], o_ss_tx_fifo_data_0[12], o_ss_tx_fifo_data_0[11], o_ss_tx_fifo_data_0[10], o_ss_tx_fifo_data_0[9], o_ss_tx_fifo_data_0[8], o_ss_tx_fifo_data_0[7], o_ss_tx_fifo_data_0[6], o_ss_tx_fifo_data_0[5], o_ss_tx_fifo_data_0[4], o_ss_tx_fifo_data_0[3], o_ss_tx_fifo_data_0[2], o_ss_tx_fifo_data_0[1], o_ss_tx_fifo_data_0[0] }),
                .o_ss_uxquad_async({ tmp_202, tmp_203, tmp_204, tmp_205, tmp_206, tmp_207, tmp_208, tmp_209, tmp_210, tmp_211, tmp_212, tmp_213, tmp_214, tmp_215, tmp_216, tmp_217, tmp_218, tmp_219, tmp_220, tmp_221, tmp_222, tmp_223, tmp_224, tmp_225, tmp_226, tmp_227, tmp_228, tmp_229, tmp_230, tmp_231, tmp_232, tmp_233, tmp_234, tmp_235, tmp_236, tmp_237, tmp_238, tmp_239, tmp_240, tmp_241, tmp_242, tmp_243, tmp_244, tmp_245, tmp_246, tmp_247, tmp_248, tmp_249, tmp_250, tmp_251, tmp_252, tmp_253, tmp_254, tmp_255, tmp_256, tmp_257, tmp_258, tmp_259, tmp_260, tmp_261, tmp_262, tmp_263, tmp_264, tmp_265, tmp_266, tmp_267, tmp_268, tmp_269, tmp_270, tmp_271, tmp_272, tmp_273, tmp_274, tmp_275, tmp_276, tmp_277, tmp_278, tmp_279, tmp_280, tmp_281 }),
                .o_ss_uxquad_async_pcie_mux({ tmp_282, tmp_283, tmp_284, tmp_285, tmp_286, tmp_287, tmp_288, tmp_289, tmp_290, tmp_291, tmp_292, tmp_293, tmp_294, tmp_295, tmp_296, tmp_297, tmp_298, tmp_299, tmp_300, tmp_301, tmp_302, tmp_303, tmp_304, tmp_305, tmp_306, tmp_307, tmp_308, tmp_309, tmp_310, tmp_311, tmp_312, tmp_313, tmp_314, tmp_315, tmp_316, tmp_317, tmp_318, tmp_319, tmp_320, tmp_321, tmp_322, tmp_323, tmp_324, tmp_325, tmp_326, tmp_327, tmp_328, tmp_329, tmp_330, tmp_331, tmp_332, tmp_333, tmp_334, tmp_335, tmp_336, tmp_337, tmp_338, tmp_339, tmp_340, tmp_341, tmp_342, tmp_343, tmp_344, tmp_345, tmp_346, tmp_347, tmp_348, tmp_349, tmp_350, tmp_351, tmp_352, tmp_353, tmp_354, tmp_355, tmp_356, tmp_357, tmp_358, tmp_359, tmp_360, tmp_361 })
        );

        tennm_sm_pld_rx_mux #(
                .sel(x_mux_sm_pld_rx_mux_0__sel)
        ) x_mux_sm_pld_rx_mux_0 (
                .i_eth({ pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1], pld_pwr_level_shifter_u0__o_dft_ptcb_eth_top_edt_channel_in_0[1] }),
                .i_pcie({ o_ch0_rx_data_1[79], o_ch0_rx_data_1[78], o_ch0_rx_data_1[77], o_ch0_rx_data_1[76], o_ch0_rx_data_1[75], o_ch0_rx_data_1[74], o_ch0_rx_data_1[73], o_ch0_rx_data_1[72], o_ch0_rx_data_1[71], o_ch0_rx_data_1[70], o_ch0_rx_data_1[69], o_ch0_rx_data_1[68], o_ch0_rx_data_1[67], o_ch0_rx_data_1[66], o_ch0_rx_data_1[65], o_ch0_rx_data_1[64], o_ch0_rx_data_1[63], o_ch0_rx_data_1[62], o_ch0_rx_data_1[61], o_ch0_rx_data_1[60], o_ch0_rx_data_1[59], o_ch0_rx_data_1[58], o_ch0_rx_data_1[57], o_ch0_rx_data_1[56], o_ch0_rx_data_1[55], o_ch0_rx_data_1[54], o_ch0_rx_data_1[53], o_ch0_rx_data_1[52], o_ch0_rx_data_1[51], o_ch0_rx_data_1[50], o_ch0_rx_data_1[49], o_ch0_rx_data_1[48], o_ch0_rx_data_1[47], o_ch0_rx_data_1[46], o_ch0_rx_data_1[45], o_ch0_rx_data_1[44], o_ch0_rx_data_1[43], o_ch0_rx_data_1[42], o_ch0_rx_data_1[41], o_ch0_rx_data_1[40], o_ch0_rx_data_1[39], o_ch0_rx_data_1[38], o_ch0_rx_data_1[37], o_ch0_rx_data_1[36], o_ch0_rx_data_1[35], o_ch0_rx_data_1[34], o_ch0_rx_data_1[33], o_ch0_rx_data_1[32], o_ch0_rx_data_1[31], o_ch0_rx_data_1[30], o_ch0_rx_data_1[29], o_ch0_rx_data_1[28], o_ch0_rx_data_1[27], o_ch0_rx_data_1[26], o_ch0_rx_data_1[25], o_ch0_rx_data_1[24], o_ch0_rx_data_1[23], o_ch0_rx_data_1[22], o_ch0_rx_data_1[21], o_ch0_rx_data_1[20], o_ch0_rx_data_1[19], o_ch0_rx_data_1[18], o_ch0_rx_data_1[17], o_ch0_rx_data_1[16], o_ch0_rx_data_1[15], o_ch0_rx_data_1[14], o_ch0_rx_data_1[13], o_ch0_rx_data_1[12], o_ch0_rx_data_1[11], o_ch0_rx_data_1[10], o_ch0_rx_data_1[9], o_ch0_rx_data_1[8], o_ch0_rx_data_1[7], o_ch0_rx_data_1[6], o_ch0_rx_data_1[5], o_ch0_rx_data_1[4], o_ch0_rx_data_1[3], o_ch0_rx_data_1[2], o_ch0_rx_data_1[1], o_ch0_rx_data_1[0] }),
                .i_pcie_bond({ quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0 , quartus_i_dft_hssi_scan_mode_0  }),
                .o_rx_data({ pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[79], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[78], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[77], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[76], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[75], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[74], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[73], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[72], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[71], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[70], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[69], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[68], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[67], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[66], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[65], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[64], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[63], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[62], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[61], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[60], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[59], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[58], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[57], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[56], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[55], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[54], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[53], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[52], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[51], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[50], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[49], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[48], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[47], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[46], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[45], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[44], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[43], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[42], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[41], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[40], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[39], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[38], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[37], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[36], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[35], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[34], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[33], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[32], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[31], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[30], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[29], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[28], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[27], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[26], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[25], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[24], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[23], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[22], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[21], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[20], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[19], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[18], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[17], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[16], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[15], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[14], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[13], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[12], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[11], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[10], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[9], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[8], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[7], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[6], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[5], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[4], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[3], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[2], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[1], pld_chnl_dp_wr_u0__i_ss_rx_fifo_data_0[0] })
        );

        tennm_sm_pld_tx_demux #(
                .sel(x_decoder_sm_pld_tx_demux_0__sel)
        ) x_decoder_sm_pld_tx_demux_0 (
                .i_ss_tx_fifo_rd_empty(),
                .i_ss_tx_fifo_rd_pempty(),
                .i_tx_data({ o_ss_tx_fifo_data_0[79], o_ss_tx_fifo_data_0[78], o_ss_tx_fifo_data_0[77], o_ss_tx_fifo_data_0[76], o_ss_tx_fifo_data_0[75], o_ss_tx_fifo_data_0[74], o_ss_tx_fifo_data_0[73], o_ss_tx_fifo_data_0[72], o_ss_tx_fifo_data_0[71], o_ss_tx_fifo_data_0[70], o_ss_tx_fifo_data_0[69], o_ss_tx_fifo_data_0[68], o_ss_tx_fifo_data_0[67], o_ss_tx_fifo_data_0[66], o_ss_tx_fifo_data_0[65], o_ss_tx_fifo_data_0[64], o_ss_tx_fifo_data_0[63], o_ss_tx_fifo_data_0[62], o_ss_tx_fifo_data_0[61], o_ss_tx_fifo_data_0[60], o_ss_tx_fifo_data_0[59], o_ss_tx_fifo_data_0[58], o_ss_tx_fifo_data_0[57], o_ss_tx_fifo_data_0[56], o_ss_tx_fifo_data_0[55], o_ss_tx_fifo_data_0[54], o_ss_tx_fifo_data_0[53], o_ss_tx_fifo_data_0[52], o_ss_tx_fifo_data_0[51], o_ss_tx_fifo_data_0[50], o_ss_tx_fifo_data_0[49], o_ss_tx_fifo_data_0[48], o_ss_tx_fifo_data_0[47], o_ss_tx_fifo_data_0[46], o_ss_tx_fifo_data_0[45], o_ss_tx_fifo_data_0[44], o_ss_tx_fifo_data_0[43], o_ss_tx_fifo_data_0[42], o_ss_tx_fifo_data_0[41], o_ss_tx_fifo_data_0[40], o_ss_tx_fifo_data_0[39], o_ss_tx_fifo_data_0[38], o_ss_tx_fifo_data_0[37], o_ss_tx_fifo_data_0[36], o_ss_tx_fifo_data_0[35], o_ss_tx_fifo_data_0[34], o_ss_tx_fifo_data_0[33], o_ss_tx_fifo_data_0[32], o_ss_tx_fifo_data_0[31], o_ss_tx_fifo_data_0[30], o_ss_tx_fifo_data_0[29], o_ss_tx_fifo_data_0[28], o_ss_tx_fifo_data_0[27], o_ss_tx_fifo_data_0[26], o_ss_tx_fifo_data_0[25], o_ss_tx_fifo_data_0[24], o_ss_tx_fifo_data_0[23], o_ss_tx_fifo_data_0[22], o_ss_tx_fifo_data_0[21], o_ss_tx_fifo_data_0[20], o_ss_tx_fifo_data_0[19], o_ss_tx_fifo_data_0[18], o_ss_tx_fifo_data_0[17], o_ss_tx_fifo_data_0[16], o_ss_tx_fifo_data_0[15], o_ss_tx_fifo_data_0[14], o_ss_tx_fifo_data_0[13], o_ss_tx_fifo_data_0[12], o_ss_tx_fifo_data_0[11], o_ss_tx_fifo_data_0[10], o_ss_tx_fifo_data_0[9], o_ss_tx_fifo_data_0[8], o_ss_tx_fifo_data_0[7], o_ss_tx_fifo_data_0[6], o_ss_tx_fifo_data_0[5], o_ss_tx_fifo_data_0[4], o_ss_tx_fifo_data_0[3], o_ss_tx_fifo_data_0[2], o_ss_tx_fifo_data_0[1], o_ss_tx_fifo_data_0[0] }),
                .o_eth({ tmp, tmp_1, tmp_2, tmp_3, tmp_4, tmp_5, tmp_6, tmp_7, tmp_8, tmp_9, tmp_10, tmp_11, tmp_12, tmp_13, tmp_14, tmp_15, tmp_16, tmp_17, tmp_18, tmp_19, tmp_20, tmp_21, tmp_22, tmp_23, tmp_24, tmp_25, tmp_26, tmp_27, tmp_28, tmp_29, tmp_30, tmp_31, tmp_32, tmp_33, tmp_34, tmp_35, tmp_36, tmp_37, tmp_38, tmp_39 }),
                .o_pcie({ o_ss_ch0_pcie_tx_data_0[79], o_ss_ch0_pcie_tx_data_0[78], o_ss_ch0_pcie_tx_data_0[77], o_ss_ch0_pcie_tx_data_0[76], o_ss_ch0_pcie_tx_data_0[75], o_ss_ch0_pcie_tx_data_0[74], o_ss_ch0_pcie_tx_data_0[73], o_ss_ch0_pcie_tx_data_0[72], o_ss_ch0_pcie_tx_data_0[71], o_ss_ch0_pcie_tx_data_0[70], o_ss_ch0_pcie_tx_data_0[69], o_ss_ch0_pcie_tx_data_0[68], o_ss_ch0_pcie_tx_data_0[67], o_ss_ch0_pcie_tx_data_0[66], o_ss_ch0_pcie_tx_data_0[65], o_ss_ch0_pcie_tx_data_0[64], o_ss_ch0_pcie_tx_data_0[63], o_ss_ch0_pcie_tx_data_0[62], o_ss_ch0_pcie_tx_data_0[61], o_ss_ch0_pcie_tx_data_0[60], o_ss_ch0_pcie_tx_data_0[59], o_ss_ch0_pcie_tx_data_0[58], o_ss_ch0_pcie_tx_data_0[57], o_ss_ch0_pcie_tx_data_0[56], o_ss_ch0_pcie_tx_data_0[55], o_ss_ch0_pcie_tx_data_0[54], o_ss_ch0_pcie_tx_data_0[53], o_ss_ch0_pcie_tx_data_0[52], o_ss_ch0_pcie_tx_data_0[51], o_ss_ch0_pcie_tx_data_0[50], o_ss_ch0_pcie_tx_data_0[49], o_ss_ch0_pcie_tx_data_0[48], o_ss_ch0_pcie_tx_data_0[47], o_ss_ch0_pcie_tx_data_0[46], o_ss_ch0_pcie_tx_data_0[45], o_ss_ch0_pcie_tx_data_0[44], o_ss_ch0_pcie_tx_data_0[43], o_ss_ch0_pcie_tx_data_0[42], o_ss_ch0_pcie_tx_data_0[41], o_ss_ch0_pcie_tx_data_0[40], o_ss_ch0_pcie_tx_data_0[39], o_ss_ch0_pcie_tx_data_0[38], o_ss_ch0_pcie_tx_data_0[37], o_ss_ch0_pcie_tx_data_0[36], o_ss_ch0_pcie_tx_data_0[35], o_ss_ch0_pcie_tx_data_0[34], o_ss_ch0_pcie_tx_data_0[33], o_ss_ch0_pcie_tx_data_0[32], o_ss_ch0_pcie_tx_data_0[31], o_ss_ch0_pcie_tx_data_0[30], o_ss_ch0_pcie_tx_data_0[29], o_ss_ch0_pcie_tx_data_0[28], o_ss_ch0_pcie_tx_data_0[27], o_ss_ch0_pcie_tx_data_0[26], o_ss_ch0_pcie_tx_data_0[25], o_ss_ch0_pcie_tx_data_0[24], o_ss_ch0_pcie_tx_data_0[23], o_ss_ch0_pcie_tx_data_0[22], o_ss_ch0_pcie_tx_data_0[21], o_ss_ch0_pcie_tx_data_0[20], o_ss_ch0_pcie_tx_data_0[19], o_ss_ch0_pcie_tx_data_0[18], o_ss_ch0_pcie_tx_data_0[17], o_ss_ch0_pcie_tx_data_0[16], o_ss_ch0_pcie_tx_data_0[15], o_ss_ch0_pcie_tx_data_0[14], o_ss_ch0_pcie_tx_data_0[13], o_ss_ch0_pcie_tx_data_0[12], o_ss_ch0_pcie_tx_data_0[11], o_ss_ch0_pcie_tx_data_0[10], o_ss_ch0_pcie_tx_data_0[9], o_ss_ch0_pcie_tx_data_0[8], o_ss_ch0_pcie_tx_data_0[7], o_ss_ch0_pcie_tx_data_0[6], o_ss_ch0_pcie_tx_data_0[5], o_ss_ch0_pcie_tx_data_0[4], o_ss_ch0_pcie_tx_data_0[3], o_ss_ch0_pcie_tx_data_0[2], o_ss_ch0_pcie_tx_data_0[1], o_ss_ch0_pcie_tx_data_0[0] }),
                .o_pcie_bond({ tmp_40, tmp_41, tmp_42, tmp_43, tmp_44, tmp_45, tmp_46, tmp_47, tmp_48, tmp_49, tmp_50, tmp_51, tmp_52, tmp_53, tmp_54, tmp_55, tmp_56, tmp_57, tmp_58, tmp_59, tmp_60, tmp_61, tmp_62, tmp_63, tmp_64, tmp_65, tmp_66, tmp_67, tmp_68, tmp_69, tmp_70, tmp_71, tmp_72, tmp_73, tmp_74, tmp_75, tmp_76, tmp_77, tmp_78, tmp_79, tmp_80, tmp_81, tmp_82, tmp_83, tmp_84, tmp_85, tmp_86, tmp_87, tmp_88, tmp_89, tmp_90, tmp_91, tmp_92, tmp_93, tmp_94, tmp_95, tmp_96, tmp_97, tmp_98, tmp_99, tmp_100, tmp_101, tmp_102, tmp_103, tmp_104, tmp_105, tmp_106, tmp_107, tmp_108, tmp_109, tmp_110, tmp_111, tmp_112, tmp_113, tmp_114, tmp_115, tmp_116, tmp_117, tmp_118, tmp_119 }),
                .o_ss_tx_fifo_rd_en(tmp_120)
        );

        tennm_sm_hssi_pld_chnl_rx_fifo_wr_clk_mux #(
                .sel(x_mux_sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0__sel)
        ) x_mux_sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0 (
                .i_eth_or_ptp(),
                .i_pcie(o_pld_pcie_clk_4),
                .i_pcie_top(s441_51_1__hssi_clk__clk),
                .o_rxfifo_ss_write_clk(o_rxfifo_ss_write_clk_0)
        );

        tennm_sm_hssi_pld_chnl_tx_fifo_rd_clk_mux #(
                .sel(x_mux_sm_hssi_pld_chnl_tx_fifo_rd_clk_mux_0__sel)
        ) x_mux_sm_hssi_pld_chnl_tx_fifo_rd_clk_mux_0 (
                .i_eth_or_ptp(),
                .i_pcie(o_pld_pcie_clk_4),
                .i_pcie_top(s441_51_1__hssi_clk__clk),
                .o_tx_fifo_ss_read_clk(o_txfifo_ss_read_clk_0)
        );


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iWZfLCRQjuc87I83kTmQGfuF5C2xFgFuJarJIIXh4hvsOQmRxzJu/cjdVoL9x9CBeSLwWsUW8T2d9Yj+7TYBUY4i2leN9Q/DWolDZysrX4+2w087ip224L9sDKMP/qgTf2G+iebtIRvHFLjfxEf+ULR6k1dQvgfd+VEmpe/fRKtGwEm5ksA1r4BBGI+5wPuHCOTjlPHcqtIp6BQwnPAV1XVsT1O+piBA+MGd4D5t1IUzIfZ2GbPHVWbJCSqgTgiyXiNsF7q5ukqjjcw3CQeoumvtEe0wGA8xLCPri/vkupbMkP80CmR0BaOP8JBa08WWCc1sBzw/oU4YmklfaXY96rwtkeqnUkOMZN4MbiyvqvJzty4Q6qWDfGoxispOAkpv+tnHEM5pu4EdoP6TsmLyT0blLpZL7QlsHTLrRtanQjtVpkp5dt2B7WaWQ7bynUf8j5PdIPb1S5pdkych6/Kk9MdfmiRQ2BwU8YtdNfWn8WgDwZvTMAoT6XzJW/DEAvxzyEKlopG5KWkmW3YTZ5p9LL6Rep6hQl0a1+H196t98AcDLu3ov+qV2zjA/BBSPvnosO2PPCwxCJdJoEcSJXw02AAVPMtfJEVtNRcxwwMwDgo0L6AUfkDcf5Ag16eFI0l1pwYKYBUyejITniAdhtcJ+TvX+m+xB2ynkc0J3lk494o2oyzPpiaXDv7zMJ7c4/BN2AkO1a0MutVDGx0t+pA4dIcd7GKWAt5LqwUf1c9LiJ3/Vk6xKYGwOG5KPZsRY6l40OfYqMW83SEpC//w/IfNB7TkcrEZKt3YlKILOZL1qDnSEkIprO/uPfHgaoQIEBUuOb19j8TZhlia1GbC15ns7ErAo2N9Y3mRWfN9ysI1S57H7cz9xasyQWn+G58TYzkMkqqiBNlHidBD6z6goV6fQDa5taDan8N7XqeBahvNegeOg3T8MZtvhjl31w2Lc4q57cdmk0ZcNFX7MwePoG7bPQQ2wVbvXGULm47uzTBz8yWterB+Td+ao4IryvIZWH0m"
`endif