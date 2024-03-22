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




  module system_intel_pcie_gts_0_pcie_hal_top_2100_okrywsy 
  #(    
//    parameter num_of_lanes                                  = 1                                                    ,        

    parameter ch0_xcvr_tx_preloaded_hardware_configs_atom   = "CH0_TX_PRELOADED_HARDWARE_CONFIGS_NONE"             ,   
    parameter ch0_xcvr_rx_preloaded_hardware_configs_atom   = "CH0_RX_PRELOADED_HARDWARE_CONFIGS_NONE"             ,   
    parameter ch0_lc_postdiv_sel_atom                       = "CH0_LC_POSTDIV_SEL_SYNTH_FAST"                      ,   
    parameter ch0_sequencer_reg_en_atom                     = "CH0_SEQUENCER_REG_EN_DISABLE"                       ,   
    parameter ch0_rst_mux_static_sel_atom                   = "CH0_RST_MUX_STATIC_SEL_UNUSED"                      ,
    parameter ch0_xcvr_tx_prbs_pattern_atom                 = 4'd0                                                 ,
    parameter ch0_xcvr_rx_prbs_pattern_atom                 = 4'd0                                                 ,
    parameter ch0_xcvr_tx_user_clk_only_mode_atom           = "CH0_TX_USER_CLK_ONLY_MODE_ENABLE"                   ,
    parameter ch0_xcvr_tx_width_atom                        = "CH0_TX_WIDTH_DISABLED"                              ,
    parameter ch0_xcvr_rx_width_atom                        = "CH0_RX_WIDTH_DISABLED"                              ,
    parameter ch0_phy_loopback_mode_atom                    = "CH0_LOOPBACK_MODE_DISABLED"                         ,
    parameter ch0_flux_mode_atom                            = "CH0_FLUX_MODE_DISABLED"                             ,
    parameter ch0_tx_sim_mode_atom                          = "CH0_TX_SIM_MODE_DISABLE"                            ,
    parameter ch0_rx_sim_mode_atom                          = "CH0_RX_SIM_MODE_DISABLE"                            ,
    parameter ch0_tx_dl_enable_atom                         = "CH0_TX_DL_ENABLE_DISABLE"                           , 
    parameter ch0_rx_dl_enable_atom                         = "CH0_RX_DL_ENABLE_DISABLE"                           , 
    parameter ch0_rx_fec_type_used_atom                     = "CH0_RX_FEC_TYPE_USED_NONE"                          , 
    parameter ch0_xcvr_rx_prbs_monitor_en_atom              = "CH0_RX_PRBS_MONITOR_EN_DISABLE"                     , 
    parameter ch0_tx_prbs_gen_en_atom                       = "CH0_TX_PRBS_GEN_EN_DISABLE"                         , 
    parameter ch0_rx_user1_clk_mux_dynamic_sel_atom         = "CH0_RX_USER1_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch0_rx_user2_clk_mux_dynamic_sel_atom         = "CH0_RX_USER2_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch0_tx_user1_clk_mux_dynamic_sel_atom         = "CH0_TX_USER1_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch0_tx_user2_clk_mux_dynamic_sel_atom         = "CH0_TX_USER2_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch0_xcvr_rx_protocol_hint_atom                = "CH0_RX_PROTOCOL_HINT_DISABLED"                      , 
    parameter ch0_pcie_mode_atom                            = "CH0_PCIE_MODE_GEN3"                             , 
    parameter ch1_xcvr_tx_preloaded_hardware_configs_atom   = "CH1_TX_PRELOADED_HARDWARE_CONFIGS_NONE"             ,
    parameter ch1_xcvr_rx_preloaded_hardware_configs_atom   = "CH1_RX_PRELOADED_HARDWARE_CONFIGS_NONE"             ,
    parameter ch1_lc_postdiv_sel_atom                       = "CH1_LC_POSTDIV_SEL_SYNTH_FAST"                      ,
    parameter ch1_sequencer_reg_en_atom                     = "CH1_SEQUENCER_REG_EN_DISABLE"                       ,  
    parameter ch1_rst_mux_static_sel_atom                   = "CH1_RST_MUX_STATIC_SEL_UNUSED"                      ,  
    parameter ch1_xcvr_tx_prbs_pattern_atom                 = 4'd0                                                 ,
    parameter ch1_xcvr_rx_prbs_pattern_atom                 = 4'd0                                                 ,  
    parameter ch1_xcvr_tx_user_clk_only_mode_atom           = "CH1_TX_USER_CLK_ONLY_MODE_ENABLE"                   ,  
    parameter ch1_xcvr_tx_width_atom                        = "CH1_TX_WIDTH_DISABLED"                              ,
    parameter ch1_xcvr_rx_width_atom                        = "CH1_RX_WIDTH_DISABLED"                              , 
    parameter ch1_phy_loopback_mode_atom                    = "CH1_LOOPBACK_MODE_DISABLED"                         , 
    parameter ch1_flux_mode_atom                            = "CH1_FLUX_MODE_DISABLED"                             , 
    parameter ch1_tx_sim_mode_atom                          = "CH1_TX_SIM_MODE_DISABLE"                            , 
    parameter ch1_rx_sim_mode_atom                          = "CH1_RX_SIM_MODE_DISABLE"                            ,
    parameter ch1_tx_dl_enable_atom                         = "CH1_TX_DL_ENABLE_DISABLE"                           ,
    parameter ch1_rx_dl_enable_atom                         = "CH1_RX_DL_ENABLE_DISABLE"                           ,
    parameter ch1_rx_fec_type_used_atom                     = "CH1_RX_FEC_TYPE_USED_NONE"                          ,
    parameter ch1_xcvr_rx_prbs_monitor_en_atom              = "CH1_RX_PRBS_MONITOR_EN_DISABLE"                     , 
    parameter ch1_tx_prbs_gen_en_atom                       = "CH1_TX_PRBS_GEN_EN_DISABLE"                         , 
    parameter ch1_rx_user1_clk_mux_dynamic_sel_atom         = "CH1_RX_USER1_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch1_rx_user2_clk_mux_dynamic_sel_atom         = "CH1_RX_USER2_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch1_tx_user1_clk_mux_dynamic_sel_atom         = "CH1_TX_USER1_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch1_tx_user2_clk_mux_dynamic_sel_atom         = "CH1_TX_USER2_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch1_xcvr_rx_protocol_hint_atom                = "CH1_RX_PROTOCOL_HINT_DISABLED"                      , 
    parameter ch1_pcie_mode_atom                            = "CH1_PCIE_MODE_GEN3"                             , 
    parameter ch2_xcvr_tx_preloaded_hardware_configs_atom   = "CH2_TX_PRELOADED_HARDWARE_CONFIGS_NONE"             ,
    parameter ch2_xcvr_rx_preloaded_hardware_configs_atom   = "CH2_RX_PRELOADED_HARDWARE_CONFIGS_NONE"             ,
    parameter ch2_lc_postdiv_sel_atom                       = "CH2_LC_POSTDIV_SEL_SYNTH_FAST"                      ,
    parameter ch2_sequencer_reg_en_atom                     = "CH2_SEQUENCER_REG_EN_DISABLE"                       ,
    parameter ch2_rst_mux_static_sel_atom                   = "CH2_RST_MUX_STATIC_SEL_UNUSED"                      , 
    parameter ch2_xcvr_tx_prbs_pattern_atom                 = 4'd0                                                 , 
    parameter ch2_xcvr_rx_prbs_pattern_atom                 = 4'd0                                                 , 
    parameter ch2_xcvr_tx_user_clk_only_mode_atom           = "CH2_TX_USER_CLK_ONLY_MODE_ENABLE"                   , 
    parameter ch2_xcvr_tx_width_atom                        = "CH2_TX_WIDTH_DISABLED"                              ,
    parameter ch2_xcvr_rx_width_atom                        = "CH2_RX_WIDTH_DISABLED"                              ,
    parameter ch2_phy_loopback_mode_atom                    = "CH2_LOOPBACK_MODE_DISABLED"                         ,
    parameter ch2_flux_mode_atom                            = "CH2_FLUX_MODE_DISABLED"                             ,
    parameter ch2_tx_sim_mode_atom                          = "CH2_TX_SIM_MODE_DISABLE"                            ,
    parameter ch2_rx_sim_mode_atom                          = "CH2_RX_SIM_MODE_DISABLE"                            ,
    parameter ch2_tx_dl_enable_atom                         = "CH2_TX_DL_ENABLE_DISABLE"                           ,
    parameter ch2_rx_dl_enable_atom                         = "CH2_RX_DL_ENABLE_DISABLE"                           ,
    parameter ch2_rx_fec_type_used_atom                     = "CH2_RX_FEC_TYPE_USED_NONE"                          ,
    parameter ch2_xcvr_rx_prbs_monitor_en_atom              = "CH2_RX_PRBS_MONITOR_EN_DISABLE"                     , 
    parameter ch2_tx_prbs_gen_en_atom                       = "CH2_TX_PRBS_GEN_EN_DISABLE"                         , 
    parameter ch2_rx_user1_clk_mux_dynamic_sel_atom         = "CH2_RX_USER1_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch2_rx_user2_clk_mux_dynamic_sel_atom         = "CH2_RX_USER2_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch2_tx_user1_clk_mux_dynamic_sel_atom         = "CH2_TX_USER1_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch2_tx_user2_clk_mux_dynamic_sel_atom         = "CH2_TX_USER2_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch2_xcvr_rx_protocol_hint_atom                = "CH2_RX_PROTOCOL_HINT_DISABLED"                      , 
    parameter ch2_pcie_mode_atom                            = "CH2_PCIE_MODE_GEN3"                             , 
    parameter ch3_xcvr_tx_preloaded_hardware_configs_atom   = "CH3_TX_PRELOADED_HARDWARE_CONFIGS_NONE"             ,
    parameter ch3_xcvr_rx_preloaded_hardware_configs_atom   = "CH3_RX_PRELOADED_HARDWARE_CONFIGS_NONE"             ,
    parameter ch3_lc_postdiv_sel_atom                       = "CH3_LC_POSTDIV_SEL_SYNTH_FAST"                      ,
    parameter ch3_sequencer_reg_en_atom                     = "CH3_SEQUENCER_REG_EN_DISABLE"                       ,
    parameter ch3_rst_mux_static_sel_atom                   = "CH3_RST_MUX_STATIC_SEL_UNUSED"                      ,
    parameter ch3_xcvr_tx_prbs_pattern_atom                 = 4'd0                                                 ,
    parameter ch3_xcvr_rx_prbs_pattern_atom                 = 4'd0                                                 ,
    parameter ch3_xcvr_tx_user_clk_only_mode_atom           = "CH3_TX_USER_CLK_ONLY_MODE_ENABLE"                   ,
    parameter ch3_xcvr_tx_width_atom                        = "CH3_TX_WIDTH_DISABLED"                              ,
    parameter ch3_xcvr_rx_width_atom                        = "CH3_RX_WIDTH_DISABLED"                              ,
    parameter ch3_phy_loopback_mode_atom                    = "CH3_LOOPBACK_MODE_DISABLED"                         ,
    parameter ch3_flux_mode_atom                            = "CH3_FLUX_MODE_DISABLED"                             ,
    parameter ch3_tx_sim_mode_atom                          = "CH3_TX_SIM_MODE_DISABLE"                            ,
    parameter ch3_rx_sim_mode_atom                          = "CH3_RX_SIM_MODE_DISABLE"                            ,
    parameter ch3_tx_dl_enable_atom                         = "CH3_TX_DL_ENABLE_DISABLE"                           ,
    parameter ch3_rx_dl_enable_atom                         = "CH3_RX_DL_ENABLE_DISABLE"                           ,
    parameter ch3_rx_fec_type_used_atom                     = "CH3_RX_FEC_TYPE_USED_NONE"                          ,
    parameter ch3_xcvr_rx_prbs_monitor_en_atom              = "CH3_RX_PRBS_MONITOR_EN_DISABLE"                     , 
    parameter ch3_tx_prbs_gen_en_atom                       = "CH3_TX_PRBS_GEN_EN_DISABLE"                         , 
    parameter ch3_rx_user1_clk_mux_dynamic_sel_atom         = "CH3_RX_USER1_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch3_rx_user2_clk_mux_dynamic_sel_atom         = "CH3_RX_USER2_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch3_tx_user1_clk_mux_dynamic_sel_atom         = "CH3_TX_USER1_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch3_tx_user2_clk_mux_dynamic_sel_atom         = "CH3_TX_USER2_CLK_MUX_DYNAMIC_SEL_UNUSED"            , 
    parameter ch3_xcvr_rx_protocol_hint_atom                = "CH3_RX_PROTOCOL_HINT_DISABLED"                      , 
    parameter ch3_pcie_mode_atom                            = "CH3_PCIE_MODE_GEN3"                             , 
    //Added 0p8 Allignment
    parameter ch0_tx_pll_l_counter_atom                     = 6'd0                                                 ,
    parameter ch0_cdr_l_counter_atom                        = 6'd0                                                 ,
    parameter ch0_tx_pll_refclk_select_atom                 = "CH0_TX_PLL_REFCLK_SELECT_GLOBAL_REFCLK0"            ,
    parameter ch0_cdr_refclk_select_atom                    = "CH0_CDR_REFCLK_SELECT_GLOBAL_REFCLK0"               ,
    parameter ch1_tx_pll_l_counter_atom                     = 6'd0                                                 ,
    parameter ch1_cdr_l_counter_atom                        = 6'd0                                                 ,
    parameter ch1_tx_pll_refclk_select_atom                 = "CH1_TX_PLL_REFCLK_SELECT_GLOBAL_REFCLK0"            ,
    parameter ch1_cdr_refclk_select_atom                    = "CH1_CDR_REFCLK_SELECT_GLOBAL_REFCLK0"               ,
    parameter ch2_tx_pll_l_counter_atom                     = 6'd0                                                 ,
    parameter ch2_cdr_l_counter_atom                        = 6'd0                                                 ,
    parameter ch2_tx_pll_refclk_select_atom                 = "CH2_TX_PLL_REFCLK_SELECT_GLOBAL_REFCLK0"            ,
    parameter ch2_cdr_refclk_select_atom                    = "CH2_CDR_REFCLK_SELECT_GLOBAL_REFCLK0"               ,
    parameter ch3_tx_pll_l_counter_atom                     = 6'd0                                                 ,
    parameter ch3_cdr_l_counter_atom                        = 6'd0                                                 ,
    parameter ch3_tx_pll_refclk_select_atom                 = "CH3_TX_PLL_REFCLK_SELECT_GLOBAL_REFCLK0"            ,
    parameter ch3_cdr_refclk_select_atom                    = "CH3_CDR_REFCLK_SELECT_GLOBAL_REFCLK0"               ,
    parameter ch0_rx_dl_rx_lat_bit_for_async_atom           = 18'd0                                                ,
    parameter ch0_rx_dl_rxbit_cntr_pma_atom                 = "CH0_RX_DL_RXBIT_CNTR_PMA_DISABLE"                   ,
    parameter ch0_rx_dl_rxbit_rollover_atom                 = 18'd0                                                ,
    parameter ch1_rx_dl_rx_lat_bit_for_async_atom           = 18'd0                                                ,
    parameter ch1_rx_dl_rxbit_cntr_pma_atom                 = "CH1_RX_DL_RXBIT_CNTR_PMA_DISABLE"                   ,
    parameter ch1_rx_dl_rxbit_rollover_atom                 = 18'd0                                                ,
    parameter ch2_rx_dl_rx_lat_bit_for_async_atom           = 18'd0                                                ,
    parameter ch2_rx_dl_rxbit_cntr_pma_atom                 = "CH2_RX_DL_RXBIT_CNTR_PMA_DISABLE"                   ,
    parameter ch2_rx_dl_rxbit_rollover_atom                 = 18'd0                                                ,
    parameter ch3_rx_dl_rx_lat_bit_for_async_atom           = 18'd0                                                ,
    parameter ch3_rx_dl_rxbit_cntr_pma_atom                 = "CH3_RX_DL_RXBIT_CNTR_PMA_DISABLE"                   ,
    parameter ch3_rx_dl_rxbit_rollover_atom                 = 18'd0                                                ,
    parameter ch0_tx_bonding_category_atom                  = "CH0_TX_BONDING_CATEGORY_UNUSED"                     ,
    parameter ch1_tx_bonding_category_atom                  = "CH1_TX_BONDING_CATEGORY_UNUSED"                     ,
    parameter ch2_tx_bonding_category_atom                  = "CH2_TX_BONDING_CATEGORY_UNUSED"                     ,
    parameter ch3_tx_bonding_category_atom                  = "CH3_TX_BONDING_CATEGORY_UNUSED"                     ,
    parameter ch0_tx_bond_size_atom                         = "CH0_TX_BOND_SIZE_UNUSED"                            ,
    parameter ch1_tx_bond_size_atom                         = "CH1_TX_BOND_SIZE_UNUSED"                            ,
    parameter ch2_tx_bond_size_atom                         = "CH2_TX_BOND_SIZE_UNUSED"                            ,
    parameter ch3_tx_bond_size_atom                         = "CH3_TX_BOND_SIZE_UNUSED"                            ,
    
    parameter ch0_duplex_mode_atom                      =  "CH0_DUPLEX_MODE_DUPLEX"   ,
    parameter ch0_fec_spec_atom                         =  "CH0_FEC_SPEC_DISABLED"    ,
    parameter ch0_fracture_atom                         =  "CH0_FRACTURE_F25G"        ,
    parameter ch0_dr_enabled_atom                       =  "CH0_DR_ENABLED_DR_ENABLED",
    parameter ch0_sup_mode_atom                         =  "CH0_SUP_MODE_USER_MODE"   ,
    parameter ch0_sim_mode_atom                         =  "CH0_SIM_MODE_DISABLE"     ,
    parameter ch1_duplex_mode_atom                      =  "CH1_DUPLEX_MODE_DUPLEX"   ,
    parameter ch1_fec_spec_atom                         =  "CH1_FEC_SPEC_DISABLED"    ,
    parameter ch1_fracture_atom                         =  "CH1_FRACTURE_F25G"        ,
    parameter ch1_dr_enabled_atom                       =  "CH1_DR_ENABLED_DR_ENABLED",
    parameter ch1_sup_mode_atom                         =  "CH1_SUP_MODE_USER_MODE"   ,
    parameter ch1_sim_mode_atom                         =  "CH1_SIM_MODE_DISABLE"     ,
    parameter ch2_duplex_mode_atom                      =  "CH2_DUPLEX_MODE_DUPLEX"   ,
    parameter ch2_fec_spec_atom                         =  "CH2_FEC_SPEC_DISABLED"    ,
    parameter ch2_fracture_atom                         =  "CH2_FRACTURE_F25G"        ,
    parameter ch2_dr_enabled_atom                       =  "CH2_DR_ENABLED_DR_ENABLED",
    parameter ch2_sup_mode_atom                         =  "CH2_SUP_MODE_USER_MODE"   ,
    parameter ch2_sim_mode_atom                         =  "CH2_SIM_MODE_DISABLE"     ,
    parameter ch3_duplex_mode_atom                      =  "CH3_DUPLEX_MODE_DUPLEX"   ,
    parameter ch3_fec_spec_atom                         =  "CH3_FEC_SPEC_DISABLED"    ,
    parameter ch3_fracture_atom                         =  "CH3_FRACTURE_F25G"        ,
    parameter ch3_dr_enabled_atom                       =  "CH3_DR_ENABLED_DR_ENABLED",
    parameter ch3_sup_mode_atom                         =  "CH3_SUP_MODE_USER_MODE"   ,
    parameter ch3_sim_mode_atom                         =  "CH3_SIM_MODE_DISABLE"     ,
    parameter ch0_pcs_l_tx_en_atom                      = "FALSE"                     ,
    parameter ch0_pcs_l_rx_en_atom                      = "FALSE"                     ,
    parameter ch0_fec_loopback_mode_atom                = "CH0_LOOPBACK_MODE_DISABLE" ,
    parameter ch0_fec_dyn_tx_mux_atom                   = "CH0_DYN_TX_MUX_UNUSED"     ,
    parameter ch0_fec_error_atom                        = "FALSE"                     ,
    parameter ch0_fec_rx_en_atom                        = "FALSE"                     ,
    parameter ch0_fec_tx_en_atom                        = "FALSE"                     ,
    parameter ch0_fec_mode_atom                         = "CH0_FEC_MODE_DISABLED"     ,
    parameter ch1_pcs_l_tx_en_atom                      = "FALSE"                     ,
    parameter ch1_pcs_l_rx_en_atom                      = "FALSE"                     ,
    parameter ch1_fec_loopback_mode_atom                = "CH1_LOOPBACK_MODE_DISABLE" ,
    parameter ch1_fec_dyn_tx_mux_atom                   = "CH1_DYN_TX_MUX_UNUSED"     ,
    parameter ch1_fec_error_atom                        = "FALSE"                     ,
    parameter ch1_fec_rx_en_atom                        = "FALSE"                     ,
    parameter ch1_fec_tx_en_atom                        = "FALSE"                     ,
    parameter ch1_fec_mode_atom                         = "CH1_FEC_MODE_DISABLED"     ,
    parameter ch2_pcs_l_tx_en_atom                      = "FALSE"                     ,
    parameter ch2_pcs_l_rx_en_atom                      = "FALSE"                     ,
    parameter ch2_fec_loopback_mode_atom                = "CH2_LOOPBACK_MODE_DISABLE" ,
    parameter ch2_fec_dyn_tx_mux_atom                   = "CH2_DYN_TX_MUX_UNUSED"     ,
    parameter ch2_fec_error_atom                        = "FALSE"                     ,
    parameter ch2_fec_rx_en_atom                        = "FALSE"                     ,
    parameter ch2_fec_tx_en_atom                        = "FALSE"                     ,
    parameter ch2_fec_mode_atom                         = "CH2_FEC_MODE_DISABLED"     ,
    parameter ch3_pcs_l_tx_en_atom                      = "FALSE"                     ,
    parameter ch3_pcs_l_rx_en_atom                      = "FALSE"                     ,
    parameter ch3_fec_loopback_mode_atom                = "CH3_LOOPBACK_MODE_DISABLE" ,
    parameter ch3_fec_dyn_tx_mux_atom                   = "CH3_DYN_TX_MUX_UNUSED"     ,
    parameter ch3_fec_error_atom                        = "FALSE"                     ,
    parameter ch3_fec_rx_en_atom                        = "FALSE"                     ,
    parameter ch3_fec_tx_en_atom                        = "FALSE"                     ,
    parameter ch3_fec_mode_atom                         = "CH3_FEC_MODE_DISABLED"     ,

    parameter ch0_clkrx_refclk_cssm_fw_control_atom                = "CH0_CLKRX_REFCLK_CSSM_FW_CONTROL_ENABLE"                ,
    parameter ch1_clkrx_refclk_cssm_fw_control_atom                = "CH1_CLKRX_REFCLK_CSSM_FW_CONTROL_ENABLE"                ,
    parameter ch2_clkrx_refclk_cssm_fw_control_atom                = "CH2_CLKRX_REFCLK_CSSM_FW_CONTROL_ENABLE"                ,
    parameter ch3_clkrx_refclk_cssm_fw_control_atom                = "CH3_CLKRX_REFCLK_CSSM_FW_CONTROL_ENABLE"                ,
    parameter ch0_clkrx_refclk_sector_specifies_refclk_ready_atom  = "CH0_CLKRX_REFCLK_SECTOR_SPECIFIES_REFCLK_READY_ENABLE"  ,
    parameter ch1_clkrx_refclk_sector_specifies_refclk_ready_atom  = "CH1_CLKRX_REFCLK_SECTOR_SPECIFIES_REFCLK_READY_ENABLE"  ,
    parameter ch2_clkrx_refclk_sector_specifies_refclk_ready_atom  = "CH2_CLKRX_REFCLK_SECTOR_SPECIFIES_REFCLK_READY_ENABLE"  ,
    parameter ch3_clkrx_refclk_sector_specifies_refclk_ready_atom  = "CH3_CLKRX_REFCLK_SECTOR_SPECIFIES_REFCLK_READY_ENABLE"  ,
    parameter ch0_local_refclk_cssm_fw_control_atom                = "CH0_LOCAL_REFCLK_CSSM_FW_CONTROL_ENABLE"                ,
    parameter ch1_local_refclk_cssm_fw_control_atom                = "CH1_LOCAL_REFCLK_CSSM_FW_CONTROL_ENABLE"                ,
    parameter ch2_local_refclk_cssm_fw_control_atom                = "CH2_LOCAL_REFCLK_CSSM_FW_CONTROL_ENABLE"                ,
    parameter ch3_local_refclk_cssm_fw_control_atom                = "CH3_LOCAL_REFCLK_CSSM_FW_CONTROL_ENABLE"                ,
    parameter ch0_local_refclk_sector_specifies_refclk_ready_atom  = "CH0_LOCAL_REFCLK_SECTOR_SPECIFIES_REFCLK_READY_ENABLE"  ,
    parameter ch1_local_refclk_sector_specifies_refclk_ready_atom  = "CH1_LOCAL_REFCLK_SECTOR_SPECIFIES_REFCLK_READY_ENABLE"  ,
    parameter ch2_local_refclk_sector_specifies_refclk_ready_atom  = "CH2_LOCAL_REFCLK_SECTOR_SPECIFIES_REFCLK_READY_ENABLE"  ,
    parameter ch3_local_refclk_sector_specifies_refclk_ready_atom  = "CH3_LOCAL_REFCLK_SECTOR_SPECIFIES_REFCLK_READY_ENABLE"  ,

// KAHUAT_EDIT
    parameter cfg_ptm_auto_update_signal                 = "FALSE",                                                     
    parameter cvp_enable                                 = "CVP_ENABLE_DISABLED",                                       
    parameter cii_monitor_en                             = "CII_MONITOR_EN_ENABLE",
    parameter cvp_vendor_specific_header_id              = 0,                                                           
    parameter drop_vendor0_msg                           = "FALSE",                                                     
    parameter drop_vendor1_msg                           = "FALSE",                                                     
    parameter dtk_mode_en                                = "DTK_MODE_EN_ENABLE",
    parameter exvf_msix_tablesize_pf0                    = 0,                                                           
    parameter exvf_msix_tablesize_pf1                    = 0,                                                           
    parameter exvf_msix_tablesize_pf2                    = 0,                                                           
    parameter exvf_msix_tablesize_pf3                    = 0,                                                           
    parameter exvf_msixpba_bir_pf0                       = 0,                                                           
    parameter exvf_msixpba_bir_pf1                       = 0,                                                           
    parameter exvf_msixpba_bir_pf2                       = 0,                                                           
    parameter exvf_msixpba_bir_pf3                       = 0,                                                           
    parameter exvf_msixpba_offset_pf0                    = 0,                                                           
    parameter exvf_msixpba_offset_pf1                    = 0,                                                           
    parameter exvf_msixpba_offset_pf2                    = 0,                                                           
    parameter exvf_msixpba_offset_pf3                    = 0,                                                           
    parameter exvf_msixtable_bir_pf0                     = 0,                                                           
    parameter exvf_msixtable_bir_pf1                     = 0,                                                           
    parameter exvf_msixtable_bir_pf2                     = 0,                                                           
    parameter exvf_msixtable_bir_pf3                     = 0,                                                           
    parameter exvf_msixtable_offset_pf0                  = 0,                                                           
    parameter exvf_msixtable_offset_pf1                  = 0,                                                           
    parameter exvf_msixtable_offset_pf2                  = 0,                                                           
    parameter exvf_msixtable_offset_pf3                  = 0,                                                           
    parameter exvf_subsysid_pf0                          = 0,                                                           
    parameter exvf_subsysid_pf1                          = 0,                                                           
    parameter exvf_subsysid_pf2                          = 0,                                                           
    parameter exvf_subsysid_pf3                          = 0,                                                           
    parameter exvf_tph_sttablelocation_pf0               = 0,                                                           
    parameter exvf_tph_sttablelocation_pf1               = 0,                                                           
    parameter exvf_tph_sttablelocation_pf2               = 0,                                                           
    parameter exvf_tph_sttablelocation_pf3               = 0,                                                           
    parameter exvf_tph_sttablesize_pf0                   = 0,                                                           
    parameter exvf_tph_sttablesize_pf1                   = 0,                                                           
    parameter exvf_tph_sttablesize_pf2                   = 0,                                                           
    parameter exvf_tph_sttablesize_pf3                   = 0,                                                           
    parameter hrc_arb_sel                                = "HRC_ARB_SEL_LOCAL_QUAD_ARB",
    parameter link_rate                                  = "LINK_RATE_DISABLED",                                        
    parameter link_width                                 = "LINK_WIDTH_DISABLED",
    parameter maxpayload_size                            = "MAXPAYLOAD_SIZE_MAX_PAYLOAD_128",                           
    parameter num_arb_ip                                 = 1,
    parameter num_of_lanes                               = "NUM_OF_LANES_NUM_1",
    parameter hal_num_of_lanes_hwtcl                     = 1,
    parameter pcie_hrc_pulse_sel                         = 0,
    parameter pcie_parity_bypass                         = "FALSE",                                                     
    parameter pclk_clk_hz                                = 0,
    parameter pf0_acs_cap_acs_at_block                   = "PF0_ACS_CAP_ACS_AT_BLOCK_DISABLED",                         
    parameter pf0_acs_cap_acs_direct_translated_p2p      = "PF0_ACS_CAP_ACS_DIRECT_TRANSLATED_P2P_DISABLED",            
    parameter pf0_acs_cap_acs_egress_ctrl_size           = 8,                                                           
    parameter pf0_acs_cap_acs_p2p_cpl_redirect           = "PF0_ACS_CAP_ACS_P2P_CPL_REDIRECT_DISABLED",                 
    parameter pf0_acs_cap_acs_p2p_egress_control         = "PF0_ACS_CAP_ACS_P2P_EGRESS_CONTROL_DISABLED",               
    parameter pf0_acs_cap_acs_p2p_req_redirect           = "PF0_ACS_CAP_ACS_P2P_REQ_REDIRECT_DISABLED",                 
    parameter pf0_acs_cap_acs_src_valid                  = "PF0_ACS_CAP_ACS_SRC_VALID_DISABLED",                        
    parameter pf0_acs_cap_acs_usp_forwarding             = "PF0_ACS_CAP_ACS_USP_FORWARDING_DISABLED",                   
    parameter pf0_acs_cap_enable                         = "PF0_ACS_CAP_ENABLE_DISABLED",                               
    parameter pf0_ats_cap_enable                         = "PF0_ATS_CAP_ENABLE_DISABLED",                               
    parameter pf0_ats_cap_invalidate_q_depth             = 0, 
    parameter pf0_ats_exvf_align_request                 = "PF0_ATS_EXVF_ALIGN_REQUEST_ENABLE",
    parameter pf0_bar0_prefetch                          = "FALSE",                                                     
    parameter pf0_bar0_type                              = "PF0_BAR0_TYPE_BAR_MEM32",                                   
    parameter pf0_bar1_prefetch                          = "FALSE",                                                     
    parameter pf0_bar2_prefetch                          = "FALSE",                                                     
    parameter pf0_bar2_type                              = "PF0_BAR2_TYPE_BAR_MEM32",                                   
    parameter pf0_bar3_prefetch                          = "FALSE",                                                     
    parameter pf0_bar4_prefetch                          = "FALSE",                                                     
    parameter pf0_bar4_type                              = "PF0_BAR4_TYPE_BAR_MEM32",                                   
    parameter pf0_bar5_prefetch                          = "FALSE",                                                     
    parameter pf0_base_class_code                        = 0,                                                           
    parameter pf0_cap_link_surprise_down_err_cap         = "PF0_CAP_LINK_SURPRISE_DOWN_ERR_CAP_ENABLE",
    parameter pf0_dsp_16g_tx_preset0                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset1                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset2                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset3                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset4                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset5                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset6                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset7                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset8                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset9                     = 0,                                                           
    parameter pf0_dsp_16g_tx_preset10                    = 0,                                                           
    parameter pf0_dsp_16g_tx_preset11                    = 0,                                                           
    parameter pf0_dsp_16g_tx_preset12                    = 0,                                                           
    parameter pf0_dsp_16g_tx_preset13                    = 0,                                                           
    parameter pf0_dsp_16g_tx_preset14                    = 0,                                                           
    parameter pf0_dsp_16g_tx_preset15                    = 0,                                                           
    parameter pf0_dsp_tx_preset0                         = 0,                                                           
    parameter pf0_dsp_tx_preset1                         = 0,                                                           
    parameter pf0_dsp_tx_preset2                         = 0,                                                           
    parameter pf0_dsp_tx_preset3                         = 0,                                                           
    parameter pf0_dsp_tx_preset4                         = 0,                                                           
    parameter pf0_dsp_tx_preset5                         = 0,                                                           
    parameter pf0_dsp_tx_preset6                         = 0,                                                           
    parameter pf0_dsp_tx_preset7                         = 0,                                                           
    parameter pf0_dsp_tx_preset8                         = 0,                                                           
    parameter pf0_dsp_tx_preset9                         = 0,                                                           
    parameter pf0_dsp_tx_preset10                        = 0,                                                           
    parameter pf0_dsp_tx_preset11                        = 0,                                                           
    parameter pf0_dsp_tx_preset12                        = 0,                                                           
    parameter pf0_dsp_tx_preset13                        = 0,                                                           
    parameter pf0_dsp_tx_preset14                        = 0,                                                           
    parameter pf0_dsp_tx_preset15                        = 0,                                                           
    parameter pf0_exvf_acs_cap_enable                    = "PF0_EXVF_ACS_CAP_ENABLE_DISABLED",                          
    parameter pf0_exvf_ats_cap_enable                    = "PF0_EXVF_ATS_CAP_ENABLE_DISABLED",                          
    parameter pf0_exvf_msix_cap_enable                   = "PF0_EXVF_MSIX_CAP_ENABLE_DISABLED",                         
    parameter pf0_exvf_tph_cap_enable                    = "PF0_EXVF_TPH_CAP_ENABLE_DISABLED",                          
    parameter pf0_exvf_virtio_en                         = "PF0_EXVF_VIRTIO_EN_DISABLED",                               
    parameter pf0_int_pin                                = "PF0_INT_PIN_INTA",                                          
    parameter pf0_ltr_cap_enable                         = "PF0_LTR_CAP_ENABLE_DISABLED",                               
    parameter pf0_msi_enable                             = "PF0_MSI_ENABLE_DISABLED",                                   
    parameter pf0_msix_enable                            = "PF0_MSIX_ENABLE_DISABLED",                                  
    parameter pf0_pasid_cap_enable                       = "PF0_PASID_CAP_ENABLE_DISABLED",                             
    parameter pf0_pasid_cap_execute_permission_supported = "PF0_PASID_CAP_EXECUTE_PERMISSION_SUPPORTED_DISABLED",       
    parameter pf0_pasid_cap_max_pasid_width              = 0,                                                           
    parameter pf0_pasid_cap_privileged_mode_supported    = "PF0_PASID_CAP_PRIVILEGED_MODE_SUPPORTED_DISABLED",          
    parameter pf0_pci_msi_64_bit_addr_cap                = "FALSE",                                                     
    parameter pf0_pci_msi_ext_data_cap                   = "FALSE",                                                     
    parameter pf0_pci_msi_ext_data_en                    = "FALSE",                                                     
    parameter pf0_pci_msi_multiple_msg_cap               = "PF0_PCI_MSI_MULTIPLE_MSG_CAP_MSI_VEC_1",                    
    parameter pf0_pci_msix_bir                           = 0,                                                           
    parameter pf0_pci_msix_pba                           = 0,                                                           
    parameter pf0_pci_msix_pba_offset                    = 0,                                                           
    parameter pf0_pci_msix_table_offset                  = 0,                                                           
    parameter pf0_pci_msix_table_size                    = 0,                                                           
    parameter pf0_pci_msix_table_size_vfcomm_cs2         = 0,                                                           
    parameter pf0_pci_type0_bar0_enabled                 = "PF0_PCI_TYPE0_BAR0_ENABLED_DISABLED",                       
    parameter pf0_pci_type0_bar0_mask_31_1               = 32'h0,                                                           
    parameter pf0_pci_type0_bar1_enabled                 = "PF0_PCI_TYPE0_BAR1_ENABLED_DISABLED",                       
    parameter pf0_pci_type0_bar1_mask_31_0               = 32'h0,                                                           
    parameter pf0_pci_type0_bar2_enabled                 = "PF0_PCI_TYPE0_BAR2_ENABLED_DISABLED",                       
    parameter pf0_pci_type0_bar2_mask_31_1               = 32'h0,                                                           
    parameter pf0_pci_type0_bar3_enabled                 = "PF0_PCI_TYPE0_BAR3_ENABLED_DISABLED",                       
    parameter pf0_pci_type0_bar3_mask_31_0               = 32'h0,                                                           
    parameter pf0_pci_type0_bar4_enabled                 = "PF0_PCI_TYPE0_BAR4_ENABLED_DISABLED",                       
    parameter pf0_pci_type0_bar4_mask_31_1               = 32'h0,                                                           
    parameter pf0_pci_type0_bar5_enabled                 = "PF0_PCI_TYPE0_BAR5_ENABLED_DISABLED",                       
    parameter pf0_pci_type0_bar5_mask_31_0               = 32'h0,                                                           
    parameter pf0_pci_type0_device_id                    = 0,                                                           
    parameter pf0_pci_type0_vendor_id                    = 0,                                                           
    parameter pf0_pcie_cap_ep_l0s_accpt_latency          = 0,                                                           
    parameter pf0_pcie_cap_ep_l1_accpt_latency           = 0,                                                           
    parameter pf0_pcie_cap_ext_tag_en                    = "FALSE",                                                     
    parameter pf0_pcie_cap_flr_cap                       = "PF0_PCIE_CAP_FLR_CAP_CAPABLE",                              
    parameter pf0_pcie_cap_hot_plug_capable              = "FALSE",                                                     
    parameter pf0_pcie_cap_l0s_exit_latency_commclk_dis  = 0,                                                           
    parameter pf0_pcie_cap_l1_exit_latency_commclk_dis   = 0,                                                           
    parameter pf0_pcie_cap_phy_slot_num                  = 0,                                                           
    parameter pf0_pcie_cap_port_num                      = 0,                                                           
    parameter pf0_pcie_cap_slot_clk_config               = "FALSE",                                                     
    parameter pf0_pcie_cap_slot_power_limit_scale        = 0,                                                           
    parameter pf0_pcie_cap_slot_power_limit_value        = 0,                                                           
    parameter pf0_pcie_slot_imp                          = "PF0_PCIE_SLOT_IMP_IMPLEMENTED",                             
    parameter pf0_port_logic_fast_link_mode              = "PF0_PORT_LOGIC_FAST_LINK_MODE_ENABLE",
    parameter pf0_prefetch_decode                        = "PF0_PREFETCH_DECODE_PREF32",
    parameter pf0_program_interface                      = 0,                                                           
    parameter pf0_prs_ext_cap_enable                     = "PF0_PRS_EXT_CAP_ENABLE_DISABLED",                           
    parameter pf0_prs_ext_cap_outstanding_capacity       = 0,
    parameter pf0_revision_id                            = 0,                                                           
    parameter pf0_rom_bar_enable                         = "PF0_ROM_BAR_ENABLE_DISABLED",                               
    parameter pf0_rom_bar_enabled                        = "PF0_ROM_BAR_ENABLED_DISABLED",
    parameter pf0_rom_mask                               = 0,                                                           
    parameter pf0_rp_rom_bar_enabled                     = "PF0_RP_ROM_BAR_ENABLED_DISABLED",                           
    parameter pf0_rp_rom_mask                            = 0,                                                           
    parameter pf0_sn_cap_enable                          = "PF0_SN_CAP_ENABLE_DISABLED",                                
    parameter pf0_sn_ser_num_reg_1_dw                    = 32'h0,                                                           
    parameter pf0_sn_ser_num_reg_2_dw                    = 32'h0,                                                           
    parameter pf0_sriov_cap_sup_page_size                = 1363,
    parameter pf0_sriov_enable                           = "PF0_SRIOV_ENABLE_DISABLED",                                 
    parameter pf0_sriov_num_vf                           = 0,
    parameter pf0_sriov_vf_bar0_enabled                  = "PF0_SRIOV_VF_BAR0_ENABLED_DISABLED",                        
    parameter pf0_sriov_vf_bar0_mask                     = 32'h0,                                                           
    parameter pf0_sriov_vf_bar0_prefetch                 = "FALSE",                                                     
    parameter pf0_sriov_vf_bar0_type                     = "PF0_SRIOV_VF_BAR0_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf0_sriov_vf_bar1_enabled                  = "PF0_SRIOV_VF_BAR1_ENABLED_DISABLED",                        
    parameter pf0_sriov_vf_bar1_mask                     = 32'h0,                                                           
    parameter pf0_sriov_vf_bar1_prefetch                 = "FALSE",                                                     
    parameter pf0_sriov_vf_bar2_enabled                  = "PF0_SRIOV_VF_BAR2_ENABLED_DISABLED",                        
    parameter pf0_sriov_vf_bar2_mask                     = 32'h0,                                                           
    parameter pf0_sriov_vf_bar2_prefetch                 = "FALSE",                                                     
    parameter pf0_sriov_vf_bar2_type                     = "PF0_SRIOV_VF_BAR2_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf0_sriov_vf_bar3_enabled                  = "PF0_SRIOV_VF_BAR3_ENABLED_DISABLED",                        
    parameter pf0_sriov_vf_bar3_mask                     = 32'h0,                                                           
    parameter pf0_sriov_vf_bar3_prefetch                 = "FALSE",                                                     
    parameter pf0_sriov_vf_bar4_enabled                  = "PF0_SRIOV_VF_BAR4_ENABLED_DISABLED",                        
    parameter pf0_sriov_vf_bar4_mask                     = 32'h0,                                                           
    parameter pf0_sriov_vf_bar4_prefetch                 = "FALSE",                                                     
    parameter pf0_sriov_vf_bar4_type                     = "PF0_SRIOV_VF_BAR4_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf0_sriov_vf_bar5_enabled                  = "PF0_SRIOV_VF_BAR5_ENABLED_DISABLED",                        
    parameter pf0_sriov_vf_bar5_mask                     = 32'h0,                                                           
    parameter pf0_sriov_vf_bar5_prefetch                 = "FALSE",                                                     
    parameter pf0_sriov_vf_device_id                     = 0,                                                           
    parameter pf0_subclass_code                          = 0,                                                           
    parameter pf0_subsys_dev_id                          = 0,                                                           
    parameter pf0_subsys_vendor_id                       = 0,                                                           
    parameter pf0_tph_cap_enable                         = "PF0_TPH_CAP_ENABLE_DISABLED",                               
    parameter pf0_tph_req_cap_int_vec                    = "PF0_TPH_REQ_CAP_INT_VEC_DISABLED",                          
    parameter pf0_tph_req_cap_int_vec_vfcomm_cs2         = "PF0_TPH_REQ_CAP_INT_VEC_VFCOMM_CS2_DISABLED",               
    parameter pf0_tph_req_cap_st_table_loc_0_vfcomm_cs2  = "PF0_TPH_REQ_CAP_ST_TABLE_LOC_0_VFCOMM_CS2_IN_TPH_STRUCT_VF",
    parameter pf0_tph_req_cap_st_table_loc_1             = "PF0_TPH_REQ_CAP_ST_TABLE_LOC_1_IN_MSIX_TABLE",              
    parameter pf0_tph_req_cap_st_table_loc_1_vfcomm_cs2  = "PF0_TPH_REQ_CAP_ST_TABLE_LOC_1_VFCOMM_CS2_IN_MSIX_TABLE_VF",
    parameter pf0_tph_req_cap_st_table_size              = 0,                                                           
    parameter pf0_tph_req_cap_st_table_size_vfcomm_cs2   = 0,                                                           
    parameter pf0_tph_req_device_spec                    = "PF0_TPH_REQ_DEVICE_SPEC_DISABLED",                          
    parameter pf0_tph_req_device_spec_vfcomm_cs2         = "PF0_TPH_REQ_DEVICE_SPEC_VFCOMM_CS2_DISABLED",               
    parameter pf0_user_vsec_cap_enable                   = "PF0_USER_VSEC_CAP_ENABLE_DISABLED",                         
    parameter pf0_usp_16g_tx_preset0                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset1                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset2                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset3                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset4                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset5                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset6                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset7                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset8                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset9                     = 0,                                                           
    parameter pf0_usp_16g_tx_preset10                    = 0,                                                           
    parameter pf0_usp_16g_tx_preset11                    = 0,                                                           
    parameter pf0_usp_16g_tx_preset12                    = 0,                                                           
    parameter pf0_usp_16g_tx_preset13                    = 0,                                                           
    parameter pf0_usp_16g_tx_preset14                    = 0,                                                           
    parameter pf0_usp_16g_tx_preset15                    = 0,                                                           
    parameter pf0_usp_tx_preset0                         = 0,                                                           
    parameter pf0_usp_tx_preset1                         = 0,                                                           
    parameter pf0_usp_tx_preset2                         = 0,                                                           
    parameter pf0_usp_tx_preset3                         = 0,                                                           
    parameter pf0_usp_tx_preset4                         = 0,                                                           
    parameter pf0_usp_tx_preset5                         = 0,                                                           
    parameter pf0_usp_tx_preset6                         = 0,                                                           
    parameter pf0_usp_tx_preset7                         = 0,                                                           
    parameter pf0_usp_tx_preset8                         = 0,                                                           
    parameter pf0_usp_tx_preset9                         = 0,                                                           
    parameter pf0_usp_tx_preset10                        = 0,                                                           
    parameter pf0_usp_tx_preset11                        = 0,                                                           
    parameter pf0_usp_tx_preset12                        = 0,                                                           
    parameter pf0_usp_tx_preset13                        = 0,                                                           
    parameter pf0_usp_tx_preset14                        = 0,                                                           
    parameter pf0_usp_tx_preset15                        = 0,                                                           
    parameter pf0_virtio_en                              = "PF0_VIRTIO_EN_DISABLED",                                    
    parameter pf1_acs_cap_acs_at_block                   = "PF1_ACS_CAP_ACS_AT_BLOCK_DISABLED",                         
    parameter pf1_acs_cap_acs_direct_translated_p2p      = "PF1_ACS_CAP_ACS_DIRECT_TRANSLATED_P2P_DISABLED",            
    parameter pf1_acs_cap_acs_egress_ctrl_size           = 8,                                                           
    parameter pf1_acs_cap_acs_p2p_cpl_redirect           = "PF1_ACS_CAP_ACS_P2P_CPL_REDIRECT_DISABLED",                 
    parameter pf1_acs_cap_acs_p2p_egress_control         = "PF1_ACS_CAP_ACS_P2P_EGRESS_CONTROL_DISABLED",               
    parameter pf1_acs_cap_acs_p2p_req_redirect           = "PF1_ACS_CAP_ACS_P2P_REQ_REDIRECT_DISABLED",                 
    parameter pf1_acs_cap_acs_src_valid                  = "PF1_ACS_CAP_ACS_SRC_VALID_DISABLED",                        
    parameter pf1_acs_cap_acs_usp_forwarding             = "PF1_ACS_CAP_ACS_USP_FORWARDING_DISABLED",                   
    parameter pf1_acs_cap_enable                         = "PF1_ACS_CAP_ENABLE_DISABLED",                               
    parameter pf1_ats_cap_enable                         = "PF1_ATS_CAP_ENABLE_DISABLED",                               
    parameter pf1_ats_cap_invalidate_q_depth             = 0, 
    parameter pf1_ats_exvf_align_request                 = "PF1_ATS_EXVF_ALIGN_REQUEST_ENABLE",
    parameter pf1_bar0_prefetch                          = "FALSE",                                                     
    parameter pf1_bar0_type                              = "PF1_BAR0_TYPE_BAR_MEM32",                                   
    parameter pf1_bar1_prefetch                          = "FALSE",                                                     
    parameter pf1_bar2_prefetch                          = "FALSE",                                                     
    parameter pf1_bar2_type                              = "PF1_BAR2_TYPE_BAR_MEM32",                                   
    parameter pf1_bar3_prefetch                          = "FALSE",                                                     
    parameter pf1_bar4_prefetch                          = "FALSE",                                                     
    parameter pf1_bar4_type                              = "PF1_BAR4_TYPE_BAR_MEM32",                                   
    parameter pf1_bar5_prefetch                          = "FALSE",                                                     
    parameter pf1_base_class_code                        = 0,                                                           
    parameter pf1_enable                                 = "PF1_ENABLE_DISABLED",                                       
    parameter pf1_exvf_acs_cap_enable                    = "PF1_EXVF_ACS_CAP_ENABLE_DISABLED",                          
    parameter pf1_exvf_ats_cap_enable                    = "PF1_EXVF_ATS_CAP_ENABLE_DISABLED",                          
    parameter pf1_exvf_msix_cap_enable                   = "PF1_EXVF_MSIX_CAP_ENABLE_DISABLED",                         
    parameter pf1_exvf_tph_cap_enable                    = "PF1_EXVF_TPH_CAP_ENABLE_DISABLED",                          
    parameter pf1_exvf_virtio_en                         = "PF1_EXVF_VIRTIO_EN_DISABLED",                               
    parameter pf1_int_pin                                = "PF1_INT_PIN_INTA",                                          
    parameter pf1_msi_enable                             = "PF1_MSI_ENABLE_DISABLED",                                   
    parameter pf1_msix_enable                            = "PF1_MSIX_ENABLE_DISABLED",                                  
    parameter pf1_pasid_cap_enable                       = "PF1_PASID_CAP_ENABLE_DISABLED",                             
    parameter pf1_pasid_cap_execute_permission_supported = "PF1_PASID_CAP_EXECUTE_PERMISSION_SUPPORTED_DISABLED",       
    parameter pf1_pasid_cap_max_pasid_width              = 0,                                                           
    parameter pf1_pasid_cap_privileged_mode_supported    = "PF1_PASID_CAP_PRIVILEGED_MODE_SUPPORTED_DISABLED",          
    parameter pf1_pci_msi_64_bit_addr_cap                = "FALSE",                                                     
    parameter pf1_pci_msi_ext_data_cap                   = "FALSE",                                                     
    parameter pf1_pci_msi_ext_data_en                    = "FALSE",                                                     
    parameter pf1_pci_msi_multiple_msg_cap               = "PF1_PCI_MSI_MULTIPLE_MSG_CAP_MSI_VEC_1",                    
    parameter pf1_pci_msix_bir                           = 0,                                                           
    parameter pf1_pci_msix_pba                           = 0,                                                           
    parameter pf1_pci_msix_pba_offset                    = 0,                                                           
    parameter pf1_pci_msix_table_offset                  = 0,                                                           
    parameter pf1_pci_msix_table_size                    = 0,                                                           
    parameter pf1_pci_msix_table_size_vfcomm_cs2         = 0,                                                           
    parameter pf1_pci_type0_bar0_enabled                 = "PF1_PCI_TYPE0_BAR0_ENABLED_DISABLED",                       
    parameter pf1_pci_type0_bar0_mask_31_1               = 32'h0,                                                           
    parameter pf1_pci_type0_bar1_enabled                 = "PF1_PCI_TYPE0_BAR1_ENABLED_DISABLED",                       
    parameter pf1_pci_type0_bar1_mask_31_0               = 32'h0,                                                           
    parameter pf1_pci_type0_bar2_enabled                 = "PF1_PCI_TYPE0_BAR2_ENABLED_DISABLED",                       
    parameter pf1_pci_type0_bar2_mask_31_1               = 32'h0,                                                           
    parameter pf1_pci_type0_bar3_enabled                 = "PF1_PCI_TYPE0_BAR3_ENABLED_DISABLED",                       
    parameter pf1_pci_type0_bar3_mask_31_0               = 32'h0,                                                           
    parameter pf1_pci_type0_bar4_enabled                 = "PF1_PCI_TYPE0_BAR4_ENABLED_DISABLED",                       
    parameter pf1_pci_type0_bar4_mask_31_1               = 32'h0,                                                           
    parameter pf1_pci_type0_bar5_enabled                 = "PF1_PCI_TYPE0_BAR5_ENABLED_DISABLED",                       
    parameter pf1_pci_type0_bar5_mask_31_0               = 32'h0,                                                           
    parameter pf1_pci_type0_device_id                    = 0,                                                           
    parameter pf1_pci_type0_vendor_id                    = 0,                                                           
    parameter pf1_pcie_cap_ep_l0s_accpt_latency          = 0,                                                           
    parameter pf1_pcie_cap_ep_l1_accpt_latency           = 0,                                                           
    parameter pf1_pcie_cap_ext_tag_en                    = "FALSE",                                                     
    parameter pf1_pcie_cap_flr_cap                       = "PF1_PCIE_CAP_FLR_CAP_CAPABLE",                              
    parameter pf1_pcie_cap_l0s_exit_latency_commclk_dis  = 0,                                                           
    parameter pf1_pcie_cap_l1_exit_latency_commclk_dis   = 0,                                                           
    parameter pf1_pcie_cap_port_num                      = 0,                                                           
    parameter pf1_pcie_cap_slot_clk_config               = "FALSE",                                                     
    parameter pf1_program_interface                      = 0,                                                           
    parameter pf1_prs_ext_cap_enable                     = "PF1_PRS_EXT_CAP_ENABLE_DISABLED",                           
    parameter pf1_prs_ext_cap_outstanding_capacity       = 0,
    parameter pf1_revision_id                            = 0,                                                           
    parameter pf1_rom_bar_enable                         = "PF1_ROM_BAR_ENABLE_DISABLED",                               
    parameter pf1_rom_bar_enabled                        = "PF1_ROM_BAR_ENABLED_DISABLED",
    parameter pf1_rom_mask                               = 0,                                                           
    parameter pf1_sn_cap_enable                          = "PF1_SN_CAP_ENABLE_DISABLED",                                
    parameter pf1_sn_ser_num_reg_1_dw                    = 32'h0,                                                           
    parameter pf1_sn_ser_num_reg_2_dw                    = 32'h0,                                                           
    parameter pf1_sriov_cap_sup_page_size                = 1363,
    parameter pf1_sriov_enable                           = "PF1_SRIOV_ENABLE_DISABLED",                                 
    parameter pf1_sriov_num_vf                           = 0,
    parameter pf1_sriov_vf_bar0_enabled                  = "PF1_SRIOV_VF_BAR0_ENABLED_DISABLED",                        
    parameter pf1_sriov_vf_bar0_mask                     = 32'h0,                                                           
    parameter pf1_sriov_vf_bar0_prefetch                 = "FALSE",                                                     
    parameter pf1_sriov_vf_bar0_type                     = "PF1_SRIOV_VF_BAR0_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf1_sriov_vf_bar1_enabled                  = "PF1_SRIOV_VF_BAR1_ENABLED_DISABLED",                        
    parameter pf1_sriov_vf_bar1_mask                     = 32'h0,                                                           
    parameter pf1_sriov_vf_bar1_prefetch                 = "FALSE",                                                     
    parameter pf1_sriov_vf_bar2_enabled                  = "PF1_SRIOV_VF_BAR2_ENABLED_DISABLED",                        
    parameter pf1_sriov_vf_bar2_mask                     = 32'h0,                                                           
    parameter pf1_sriov_vf_bar2_prefetch                 = "FALSE",                                                     
    parameter pf1_sriov_vf_bar2_type                     = "PF1_SRIOV_VF_BAR2_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf1_sriov_vf_bar3_enabled                  = "PF1_SRIOV_VF_BAR3_ENABLED_DISABLED",                        
    parameter pf1_sriov_vf_bar3_mask                     = 32'h0,                                                           
    parameter pf1_sriov_vf_bar3_prefetch                 = "FALSE",                                                     
    parameter pf1_sriov_vf_bar4_enabled                  = "PF1_SRIOV_VF_BAR4_ENABLED_DISABLED",                        
    parameter pf1_sriov_vf_bar4_mask                     = 32'h0,                                                           
    parameter pf1_sriov_vf_bar4_prefetch                 = "FALSE",                                                     
    parameter pf1_sriov_vf_bar4_type                     = "PF1_SRIOV_VF_BAR4_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf1_sriov_vf_bar5_enabled                  = "PF1_SRIOV_VF_BAR5_ENABLED_DISABLED",                        
    parameter pf1_sriov_vf_bar5_mask                     = 32'h0,                                                           
    parameter pf1_sriov_vf_bar5_prefetch                 = "FALSE",                                                     
    parameter pf1_sriov_vf_device_id                     = 0,                                                           
    parameter pf1_subclass_code                          = 0,                                                           
    parameter pf1_subsys_dev_id                          = 0,                                                           
    parameter pf1_subsys_vendor_id                       = 0,                                                           
    parameter pf1_tph_cap_enable                         = "PF1_TPH_CAP_ENABLE_DISABLED",                               
    parameter pf1_tph_req_cap_int_vec                    = "PF1_TPH_REQ_CAP_INT_VEC_DISABLED",                          
    parameter pf1_tph_req_cap_int_vec_vfcomm_cs2         = "PF1_TPH_REQ_CAP_INT_VEC_VFCOMM_CS2_DISABLED",               
    parameter pf1_tph_req_cap_st_table_loc_0_vfcomm_cs2  = "PF1_TPH_REQ_CAP_ST_TABLE_LOC_0_VFCOMM_CS2_IN_TPH_STRUCT_VF",
    parameter pf1_tph_req_cap_st_table_loc_1             = "PF1_TPH_REQ_CAP_ST_TABLE_LOC_1_IN_MSIX_TABLE",              
    parameter pf1_tph_req_cap_st_table_loc_1_vfcomm_cs2  = "PF1_TPH_REQ_CAP_ST_TABLE_LOC_1_VFCOMM_CS2_IN_MSIX_TABLE_VF",
    parameter pf1_tph_req_cap_st_table_size              = 0,                                                           
    parameter pf1_tph_req_cap_st_table_size_vfcomm_cs2   = 0,                                                           
    parameter pf1_tph_req_device_spec                    = "PF1_TPH_REQ_DEVICE_SPEC_DISABLED",                          
    parameter pf1_tph_req_device_spec_vfcomm_cs2         = "PF1_TPH_REQ_DEVICE_SPEC_VFCOMM_CS2_DISABLED",               
    parameter pf1_user_vsec_cap_enable                   = "PF1_USER_VSEC_CAP_ENABLE_DISABLED",                         
    parameter pf1_user_vsec_offset                       = 0,                                                           
    parameter pf1_virtio_en                              = "PF1_VIRTIO_EN_DISABLED",                                    
    parameter pf2_acs_cap_acs_at_block                   = "PF2_ACS_CAP_ACS_AT_BLOCK_DISABLED",                         
    parameter pf2_acs_cap_acs_direct_translated_p2p      = "PF2_ACS_CAP_ACS_DIRECT_TRANSLATED_P2P_DISABLED",            
    parameter pf2_acs_cap_acs_egress_ctrl_size           = 8,                                                           
    parameter pf2_acs_cap_acs_p2p_cpl_redirect           = "PF2_ACS_CAP_ACS_P2P_CPL_REDIRECT_DISABLED",                 
    parameter pf2_acs_cap_acs_p2p_egress_control         = "PF2_ACS_CAP_ACS_P2P_EGRESS_CONTROL_DISABLED",               
    parameter pf2_acs_cap_acs_p2p_req_redirect           = "PF2_ACS_CAP_ACS_P2P_REQ_REDIRECT_DISABLED",                 
    parameter pf2_acs_cap_acs_src_valid                  = "PF2_ACS_CAP_ACS_SRC_VALID_DISABLED",                        
    parameter pf2_acs_cap_acs_usp_forwarding             = "PF2_ACS_CAP_ACS_USP_FORWARDING_DISABLED",                   
    parameter pf2_acs_cap_enable                         = "PF2_ACS_CAP_ENABLE_DISABLED",                               
    parameter pf2_ats_cap_enable                         = "PF2_ATS_CAP_ENABLE_DISABLED",                               
    parameter pf2_ats_cap_invalidate_q_depth             = 0, 
    parameter pf2_ats_exvf_align_request                 = "PF2_ATS_EXVF_ALIGN_REQUEST_ENABLE",
    parameter pf2_bar0_prefetch                          = "FALSE",                                                     
    parameter pf2_bar0_type                              = "PF2_BAR0_TYPE_BAR_MEM32",                                   
    parameter pf2_bar1_prefetch                          = "FALSE",                                                     
    parameter pf2_bar2_prefetch                          = "FALSE",                                                     
    parameter pf2_bar2_type                              = "PF2_BAR2_TYPE_BAR_MEM32",                                   
    parameter pf2_bar3_prefetch                          = "FALSE",                                                     
    parameter pf2_bar4_prefetch                          = "FALSE",                                                     
    parameter pf2_bar4_type                              = "PF2_BAR4_TYPE_BAR_MEM32",                                   
    parameter pf2_bar5_prefetch                          = "FALSE",                                                     
    parameter pf2_base_class_code                        = 0,                                                           
    parameter pf2_enable                                 = "PF2_ENABLE_DISABLED",                                       
    parameter pf2_exvf_acs_cap_enable                    = "PF2_EXVF_ACS_CAP_ENABLE_DISABLED",                          
    parameter pf2_exvf_ats_cap_enable                    = "PF2_EXVF_ATS_CAP_ENABLE_DISABLED",                          
    parameter pf2_exvf_msix_cap_enable                   = "PF2_EXVF_MSIX_CAP_ENABLE_DISABLED",                         
    parameter pf2_exvf_tph_cap_enable                    = "PF2_EXVF_TPH_CAP_ENABLE_DISABLED",                          
    parameter pf2_exvf_virtio_en                         = "PF2_EXVF_VIRTIO_EN_DISABLED",                               
    parameter pf2_int_pin                                = "PF2_INT_PIN_INTA",                                          
    parameter pf2_msi_enable                             = "PF2_MSI_ENABLE_DISABLED",                                   
    parameter pf2_msix_enable                            = "PF2_MSIX_ENABLE_DISABLED",                                  
    parameter pf2_pasid_cap_enable                       = "PF2_PASID_CAP_ENABLE_DISABLED",                             
    parameter pf2_pasid_cap_execute_permission_supported = "PF2_PASID_CAP_EXECUTE_PERMISSION_SUPPORTED_DISABLED",       
    parameter pf2_pasid_cap_max_pasid_width              = 0,                                                           
    parameter pf2_pasid_cap_privileged_mode_supported    = "PF2_PASID_CAP_PRIVILEGED_MODE_SUPPORTED_DISABLED",          
    parameter pf2_pci_msi_64_bit_addr_cap                = "FALSE",                                                     
    parameter pf2_pci_msi_ext_data_cap                   = "FALSE",                                                     
    parameter pf2_pci_msi_ext_data_en                    = "FALSE",                                                     
    parameter pf2_pci_msi_multiple_msg_cap               = "PF2_PCI_MSI_MULTIPLE_MSG_CAP_MSI_VEC_1",                    
    parameter pf2_pci_msix_bir                           = 0,                                                           
    parameter pf2_pci_msix_pba                           = 0,                                                           
    parameter pf2_pci_msix_pba_offset                    = 0,                                                           
    parameter pf2_pci_msix_table_offset                  = 0,                                                           
    parameter pf2_pci_msix_table_size                    = 0,                                                           
    parameter pf2_pci_msix_table_size_vfcomm_cs2         = 0,                                                           
    parameter pf2_pci_type0_bar0_enabled                 = "PF2_PCI_TYPE0_BAR0_ENABLED_DISABLED",                       
    parameter pf2_pci_type0_bar0_mask_31_1               = 32'h0,                                                           
    parameter pf2_pci_type0_bar1_enabled                 = "PF2_PCI_TYPE0_BAR1_ENABLED_DISABLED",                       
    parameter pf2_pci_type0_bar1_mask_31_0               = 32'h0,                                                           
    parameter pf2_pci_type0_bar2_enabled                 = "PF2_PCI_TYPE0_BAR2_ENABLED_DISABLED",                       
    parameter pf2_pci_type0_bar2_mask_31_1               = 32'h0,                                                           
    parameter pf2_pci_type0_bar3_enabled                 = "PF2_PCI_TYPE0_BAR3_ENABLED_DISABLED",                       
    parameter pf2_pci_type0_bar3_mask_31_0               = 32'h0,                                                           
    parameter pf2_pci_type0_bar4_enabled                 = "PF2_PCI_TYPE0_BAR4_ENABLED_DISABLED",                       
    parameter pf2_pci_type0_bar4_mask_31_1               = 32'h0,                                                           
    parameter pf2_pci_type0_bar5_enabled                 = "PF2_PCI_TYPE0_BAR5_ENABLED_DISABLED",                       
    parameter pf2_pci_type0_bar5_mask_31_0               = 32'h0,                                                           
    parameter pf2_pci_type0_device_id                    = 0,                                                           
    parameter pf2_pci_type0_vendor_id                    = 0,                                                           
    parameter pf2_pcie_cap_ep_l0s_accpt_latency          = 0,                                                           
    parameter pf2_pcie_cap_ep_l1_accpt_latency           = 0,                                                           
    parameter pf2_pcie_cap_ext_tag_en                    = "FALSE",                                                     
    parameter pf2_pcie_cap_flr_cap                       = "PF2_PCIE_CAP_FLR_CAP_CAPABLE",                              
    parameter pf2_pcie_cap_l0s_exit_latency_commclk_dis  = 0,                                                           
    parameter pf2_pcie_cap_l1_exit_latency_commclk_dis   = 0,                                                           
    parameter pf2_pcie_cap_port_num                      = 0,                                                           
    parameter pf2_pcie_cap_slot_clk_config               = "FALSE",                                                     
    parameter pf2_program_interface                      = 0,                                                           
    parameter pf2_prs_ext_cap_enable                     = "PF2_PRS_EXT_CAP_ENABLE_DISABLED",                           
    parameter pf2_prs_ext_cap_outstanding_capacity       = 0,
    parameter pf2_revision_id                            = 0,                                                           
    parameter pf2_rom_bar_enable                         = "PF2_ROM_BAR_ENABLE_DISABLED",                               
    parameter pf2_rom_bar_enabled                        = "PF2_ROM_BAR_ENABLED_DISABLED",
    parameter pf2_rom_mask                               = 0,                                                           
    parameter pf2_sn_cap_enable                          = "PF2_SN_CAP_ENABLE_DISABLED",                                
    parameter pf2_sn_ser_num_reg_1_dw                    = 32'h0,                                                           
    parameter pf2_sn_ser_num_reg_2_dw                    = 32'h0,                                                           
    parameter pf2_sriov_cap_sup_page_size                = 1363,
    parameter pf2_sriov_enable                           = "PF2_SRIOV_ENABLE_DISABLED",                                 
    parameter pf2_sriov_num_vf                           = 0,
    parameter pf2_sriov_vf_bar0_enabled                  = "PF2_SRIOV_VF_BAR0_ENABLED_DISABLED",                        
    parameter pf2_sriov_vf_bar0_mask                     = 32'h0,                                                           
    parameter pf2_sriov_vf_bar0_prefetch                 = "FALSE",                                                     
    parameter pf2_sriov_vf_bar0_type                     = "PF2_SRIOV_VF_BAR0_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf2_sriov_vf_bar1_enabled                  = "PF2_SRIOV_VF_BAR1_ENABLED_DISABLED",                        
    parameter pf2_sriov_vf_bar1_mask                     = 32'h0,                                                           
    parameter pf2_sriov_vf_bar1_prefetch                 = "FALSE",                                                     
    parameter pf2_sriov_vf_bar2_enabled                  = "PF2_SRIOV_VF_BAR2_ENABLED_DISABLED",                        
    parameter pf2_sriov_vf_bar2_mask                     = 32'h0,                                                           
    parameter pf2_sriov_vf_bar2_prefetch                 = "FALSE",                                                     
    parameter pf2_sriov_vf_bar2_type                     = "PF2_SRIOV_VF_BAR2_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf2_sriov_vf_bar3_enabled                  = "PF2_SRIOV_VF_BAR3_ENABLED_DISABLED",                        
    parameter pf2_sriov_vf_bar3_mask                     = 32'h0,                                                           
    parameter pf2_sriov_vf_bar3_prefetch                 = "FALSE",                                                     
    parameter pf2_sriov_vf_bar4_enabled                  = "PF2_SRIOV_VF_BAR4_ENABLED_DISABLED",                        
    parameter pf2_sriov_vf_bar4_mask                     = 32'h0,                                                           
    parameter pf2_sriov_vf_bar4_prefetch                 = "FALSE",                                                     
    parameter pf2_sriov_vf_bar4_type                     = "PF2_SRIOV_VF_BAR4_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf2_sriov_vf_bar5_enabled                  = "PF2_SRIOV_VF_BAR5_ENABLED_DISABLED",                        
    parameter pf2_sriov_vf_bar5_mask                     = 32'h0,                                                           
    parameter pf2_sriov_vf_bar5_prefetch                 = "FALSE",                                                     
    parameter pf2_sriov_vf_device_id                     = 0,                                                           
    parameter pf2_subclass_code                          = 0,                                                           
    parameter pf2_subsys_dev_id                          = 0,                                                           
    parameter pf2_subsys_vendor_id                       = 0,                                                           
    parameter pf2_tph_cap_enable                         = "PF2_TPH_CAP_ENABLE_DISABLED",                               
    parameter pf2_tph_req_cap_int_vec                    = "PF2_TPH_REQ_CAP_INT_VEC_DISABLED",                          
    parameter pf2_tph_req_cap_int_vec_vfcomm_cs2         = "PF2_TPH_REQ_CAP_INT_VEC_VFCOMM_CS2_DISABLED",               
    parameter pf2_tph_req_cap_st_table_loc_0_vfcomm_cs2  = "PF2_TPH_REQ_CAP_ST_TABLE_LOC_0_VFCOMM_CS2_IN_TPH_STRUCT_VF",
    parameter pf2_tph_req_cap_st_table_loc_1             = "PF2_TPH_REQ_CAP_ST_TABLE_LOC_1_IN_MSIX_TABLE",              
    parameter pf2_tph_req_cap_st_table_loc_1_vfcomm_cs2  = "PF2_TPH_REQ_CAP_ST_TABLE_LOC_1_VFCOMM_CS2_IN_MSIX_TABLE_VF",
    parameter pf2_tph_req_cap_st_table_size              = 0,                                                           
    parameter pf2_tph_req_cap_st_table_size_vfcomm_cs2   = 0,                                                           
    parameter pf2_tph_req_device_spec                    = "PF2_TPH_REQ_DEVICE_SPEC_DISABLED",                          
    parameter pf2_tph_req_device_spec_vfcomm_cs2         = "PF2_TPH_REQ_DEVICE_SPEC_VFCOMM_CS2_DISABLED",               
    parameter pf2_user_vsec_cap_enable                   = "PF2_USER_VSEC_CAP_ENABLE_DISABLED",                         
    parameter pf2_user_vsec_offset                       = 0,                                                           
    parameter pf2_virtio_en                              = "PF2_VIRTIO_EN_DISABLED",                                    
    parameter pf3_acs_cap_acs_at_block                   = "PF3_ACS_CAP_ACS_AT_BLOCK_DISABLED",                         
    parameter pf3_acs_cap_acs_direct_translated_p2p      = "PF3_ACS_CAP_ACS_DIRECT_TRANSLATED_P2P_DISABLED",            
    parameter pf3_acs_cap_acs_egress_ctrl_size           = 8,                                                           
    parameter pf3_acs_cap_acs_p2p_cpl_redirect           = "PF3_ACS_CAP_ACS_P2P_CPL_REDIRECT_DISABLED",                 
    parameter pf3_acs_cap_acs_p2p_egress_control         = "PF3_ACS_CAP_ACS_P2P_EGRESS_CONTROL_DISABLED",               
    parameter pf3_acs_cap_acs_p2p_req_redirect           = "PF3_ACS_CAP_ACS_P2P_REQ_REDIRECT_DISABLED",                 
    parameter pf3_acs_cap_acs_src_valid                  = "PF3_ACS_CAP_ACS_SRC_VALID_DISABLED",                        
    parameter pf3_acs_cap_acs_usp_forwarding             = "PF3_ACS_CAP_ACS_USP_FORWARDING_DISABLED",                   
    parameter pf3_acs_cap_enable                         = "PF3_ACS_CAP_ENABLE_DISABLED",                               
    parameter pf3_ats_cap_enable                         = "PF3_ATS_CAP_ENABLE_DISABLED",                               
    parameter pf3_ats_cap_invalidate_q_depth             = 0, 
    parameter pf3_ats_exvf_align_request                 = "PF3_ATS_EXVF_ALIGN_REQUEST_ENABLE",
    parameter pf3_bar0_prefetch                          = "FALSE",                                                     
    parameter pf3_bar0_type                              = "PF3_BAR0_TYPE_BAR_MEM32",                                   
    parameter pf3_bar1_prefetch                          = "FALSE",                                                     
    parameter pf3_bar2_prefetch                          = "FALSE",                                                     
    parameter pf3_bar2_type                              = "PF3_BAR2_TYPE_BAR_MEM32",                                   
    parameter pf3_bar3_prefetch                          = "FALSE",                                                     
    parameter pf3_bar4_prefetch                          = "FALSE",                                                     
    parameter pf3_bar4_type                              = "PF3_BAR4_TYPE_BAR_MEM32",                                   
    parameter pf3_bar5_prefetch                          = "FALSE",                                                     
    parameter pf3_base_class_code                        = 0,                                                           
    parameter pf3_enable                                 = "PF3_ENABLE_DISABLED",                                       
    parameter pf3_exvf_acs_cap_enable                    = "PF3_EXVF_ACS_CAP_ENABLE_DISABLED",                          
    parameter pf3_exvf_ats_cap_enable                    = "PF3_EXVF_ATS_CAP_ENABLE_DISABLED",                          
    parameter pf3_exvf_msix_cap_enable                   = "PF3_EXVF_MSIX_CAP_ENABLE_DISABLED",                         
    parameter pf3_exvf_tph_cap_enable                    = "PF3_EXVF_TPH_CAP_ENABLE_DISABLED",                          
    parameter pf3_exvf_virtio_en                         = "PF3_EXVF_VIRTIO_EN_DISABLED",                               
    parameter pf3_int_pin                                = "PF3_INT_PIN_INTA",                                          
    parameter pf3_msi_enable                             = "PF3_MSI_ENABLE_DISABLED",                                   
    parameter pf3_msix_enable                            = "PF3_MSIX_ENABLE_DISABLED",                                  
    parameter pf3_pasid_cap_enable                       = "PF3_PASID_CAP_ENABLE_DISABLED",                             
    parameter pf3_pasid_cap_execute_permission_supported = "PF3_PASID_CAP_EXECUTE_PERMISSION_SUPPORTED_DISABLED",       
    parameter pf3_pasid_cap_max_pasid_width              = 0,                                                           
    parameter pf3_pasid_cap_privileged_mode_supported    = "PF3_PASID_CAP_PRIVILEGED_MODE_SUPPORTED_DISABLED",          
    parameter pf3_pci_msi_64_bit_addr_cap                = "FALSE",                                                     
    parameter pf3_pci_msi_ext_data_cap                   = "FALSE",                                                     
    parameter pf3_pci_msi_ext_data_en                    = "FALSE",                                                     
    parameter pf3_pci_msi_multiple_msg_cap               = "PF3_PCI_MSI_MULTIPLE_MSG_CAP_MSI_VEC_1",                    
    parameter pf3_pci_msix_bir                           = 0,                                                           
    parameter pf3_pci_msix_pba                           = 0,                                                           
    parameter pf3_pci_msix_pba_offset                    = 0,                                                           
    parameter pf3_pci_msix_table_offset                  = 0,                                                           
    parameter pf3_pci_msix_table_size                    = 0,                                                           
    parameter pf3_pci_msix_table_size_vfcomm_cs2         = 0,                                                           
    parameter pf3_pci_type0_bar0_enabled                 = "PF3_PCI_TYPE0_BAR0_ENABLED_DISABLED",                       
    parameter pf3_pci_type0_bar0_mask_31_1               = 32'h0,                                                           
    parameter pf3_pci_type0_bar1_enabled                 = "PF3_PCI_TYPE0_BAR1_ENABLED_DISABLED",                       
    parameter pf3_pci_type0_bar1_mask_31_0               = 32'h0,                                                           
    parameter pf3_pci_type0_bar2_enabled                 = "PF3_PCI_TYPE0_BAR2_ENABLED_DISABLED",                       
    parameter pf3_pci_type0_bar2_mask_31_1               = 32'h0,                                                           
    parameter pf3_pci_type0_bar3_enabled                 = "PF3_PCI_TYPE0_BAR3_ENABLED_DISABLED",                       
    parameter pf3_pci_type0_bar3_mask_31_0               = 32'h0,                                                           
    parameter pf3_pci_type0_bar4_enabled                 = "PF3_PCI_TYPE0_BAR4_ENABLED_DISABLED",                       
    parameter pf3_pci_type0_bar4_mask_31_1               = 32'h0,                                                           
    parameter pf3_pci_type0_bar5_enabled                 = "PF3_PCI_TYPE0_BAR5_ENABLED_DISABLED",                       
    parameter pf3_pci_type0_bar5_mask_31_0               = 32'h0,                                                           
    parameter pf3_pci_type0_device_id                    = 0,                                                           
    parameter pf3_pci_type0_vendor_id                    = 0,                                                           
    parameter pf3_pcie_cap_ep_l0s_accpt_latency          = 0,                                                           
    parameter pf3_pcie_cap_ep_l1_accpt_latency           = 0,                                                           
    parameter pf3_pcie_cap_ext_tag_en                    = "FALSE",                                                     
    parameter pf3_pcie_cap_flr_cap                       = "PF3_PCIE_CAP_FLR_CAP_CAPABLE",                              
    parameter pf3_pcie_cap_l0s_exit_latency_commclk_dis  = 0,                                                           
    parameter pf3_pcie_cap_l1_exit_latency_commclk_dis   = 0,                                                           
    parameter pf3_pcie_cap_port_num                      = 0,                                                           
    parameter pf3_pcie_cap_slot_clk_config               = "FALSE",                                                     
    parameter pf3_program_interface                      = 0,                                                           
    parameter pf3_prs_ext_cap_enable                     = "PF3_PRS_EXT_CAP_ENABLE_DISABLED",                           
    parameter pf3_prs_ext_cap_outstanding_capacity       = 0,
    parameter pf3_revision_id                            = 0,                                                           
    parameter pf3_rom_bar_enable                         = "PF3_ROM_BAR_ENABLE_DISABLED",                               
    parameter pf3_rom_bar_enabled                        = "PF3_ROM_BAR_ENABLED_DISABLED",
    parameter pf3_rom_mask                               = 0,                                                           
    parameter pf3_sn_cap_enable                          = "PF3_SN_CAP_ENABLE_DISABLED",                                
    parameter pf3_sn_ser_num_reg_1_dw                    = 32'h0,                                                           
    parameter pf3_sn_ser_num_reg_2_dw                    = 32'h0,                                                           
    parameter pf3_sriov_cap_sup_page_size                = 1363,
    parameter pf3_sriov_enable                           = "PF3_SRIOV_ENABLE_DISABLED",                                 
    parameter pf3_sriov_num_vf                           = 0,
    parameter pf3_sriov_vf_bar0_enabled                  = "PF3_SRIOV_VF_BAR0_ENABLED_DISABLED",                        
    parameter pf3_sriov_vf_bar0_mask                     = 32'h0,                                                           
    parameter pf3_sriov_vf_bar0_prefetch                 = "FALSE",                                                     
    parameter pf3_sriov_vf_bar0_type                     = "PF3_SRIOV_VF_BAR0_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf3_sriov_vf_bar1_enabled                  = "PF3_SRIOV_VF_BAR1_ENABLED_DISABLED",                        
    parameter pf3_sriov_vf_bar1_mask                     = 32'h0,                                                           
    parameter pf3_sriov_vf_bar1_prefetch                 = "FALSE",                                                     
    parameter pf3_sriov_vf_bar2_enabled                  = "PF3_SRIOV_VF_BAR2_ENABLED_DISABLED",                        
    parameter pf3_sriov_vf_bar2_mask                     = 32'h0,                                                           
    parameter pf3_sriov_vf_bar2_prefetch                 = "FALSE",                                                     
    parameter pf3_sriov_vf_bar2_type                     = "PF3_SRIOV_VF_BAR2_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf3_sriov_vf_bar3_enabled                  = "PF3_SRIOV_VF_BAR3_ENABLED_DISABLED",                        
    parameter pf3_sriov_vf_bar3_mask                     = 32'h0,                                                           
    parameter pf3_sriov_vf_bar3_prefetch                 = "FALSE",                                                     
    parameter pf3_sriov_vf_bar4_enabled                  = "PF3_SRIOV_VF_BAR4_ENABLED_DISABLED",                        
    parameter pf3_sriov_vf_bar4_mask                     = 32'h0,                                                           
    parameter pf3_sriov_vf_bar4_prefetch                 = "FALSE",                                                     
    parameter pf3_sriov_vf_bar4_type                     = "PF3_SRIOV_VF_BAR4_TYPE_SRIOV_VF_BAR_MEM32",                 
    parameter pf3_sriov_vf_bar5_enabled                  = "PF3_SRIOV_VF_BAR5_ENABLED_DISABLED",                        
    parameter pf3_sriov_vf_bar5_mask                     = 32'h0,                                                           
    parameter pf3_sriov_vf_bar5_prefetch                 = "FALSE",                                                     
    parameter pf3_sriov_vf_device_id                     = 0,                                                           
    parameter pf3_subclass_code                          = 0,                                                           
    parameter pf3_subsys_dev_id                          = 0,                                                           
    parameter pf3_subsys_vendor_id                       = 0,                                                           
    parameter pf3_tph_cap_enable                         = "PF3_TPH_CAP_ENABLE_DISABLED",                               
    parameter pf3_tph_req_cap_int_vec                    = "PF3_TPH_REQ_CAP_INT_VEC_DISABLED",                          
    parameter pf3_tph_req_cap_int_vec_vfcomm_cs2         = "PF3_TPH_REQ_CAP_INT_VEC_VFCOMM_CS2_DISABLED",               
    parameter pf3_tph_req_cap_st_table_loc_0_vfcomm_cs2  = "PF3_TPH_REQ_CAP_ST_TABLE_LOC_0_VFCOMM_CS2_IN_TPH_STRUCT_VF",
    parameter pf3_tph_req_cap_st_table_loc_1             = "PF3_TPH_REQ_CAP_ST_TABLE_LOC_1_IN_MSIX_TABLE",              
    parameter pf3_tph_req_cap_st_table_loc_1_vfcomm_cs2  = "PF3_TPH_REQ_CAP_ST_TABLE_LOC_1_VFCOMM_CS2_IN_MSIX_TABLE_VF",
    parameter pf3_tph_req_cap_st_table_size              = 0,                                                           
    parameter pf3_tph_req_cap_st_table_size_vfcomm_cs2   = 0,                                                           
    parameter pf3_tph_req_device_spec                    = "PF3_TPH_REQ_DEVICE_SPEC_DISABLED",                          
    parameter pf3_tph_req_device_spec_vfcomm_cs2         = "PF3_TPH_REQ_DEVICE_SPEC_VFCOMM_CS2_DISABLED",               
    parameter pf3_user_vsec_cap_enable                   = "PF3_USER_VSEC_CAP_ENABLE_DISABLED",                         
    parameter pf3_user_vsec_offset                       = 0,                                                           
    parameter pf3_virtio_en                              = "PF3_VIRTIO_EN_DISABLED",                                    
    parameter pldclk_rate                                = "PLDCLK_RATE_FAST",                                          
    parameter port_type                                  = "PORT_TYPE_NATIVE_EP",                                       
    parameter ptm_autoupdate                             = "PTM_AUTOUPDATE_AUTOUPDATE_10MS",                            
    parameter ptm_enable                                 = "PTM_ENABLE_ENABLE",
    parameter rxbuf_limit_bypass                         = 0,                                                           
    parameter sim_mode                                   = "SIM_MODE_DISABLE_VSIM_MODE",                                
    parameter sris_enable                                = "SRIS_ENABLE_DISABLED",                                      
    parameter sris_mode                                  = "FALSE",                                                     
    parameter sup_mode                                   = "SUP_MODE_ADVANCED_USER_MODE",                               
    parameter sys_clk_hz                                 = 0,
    parameter usb_hrc_pulse_sel                          = 0,
    parameter vsec_next_offset                           = 0,                                                           
    parameter vsec_select                                = "FALSE",

    parameter pcie_pcs_mode                              = "PCIE_PCS_MODE_PCIE",

    parameter sm_hssi_pcie_pcs_clk_mux_0_sel             = "SEL_SAME_QUAD_PCLK0",
    parameter sm_hssi_pcie_pcs_clk_mux_1_sel             = "SEL_SAME_QUAD_PCLK0",
    parameter sm_hssi_pcie_pcs_clk_mux_2_sel             = "SEL_SAME_QUAD_PCLK0",
    parameter sm_hssi_pcie_pcs_clk_mux_3_sel             = "SEL_SAME_QUAD_PCLK0",
    parameter sm_hssi_pcie_pcs_hps_clkmux_0_sel          = "SEL_HPS_PCS1_ENABLED",
    parameter sm_hssi_pcie_pcs_hps_demux_0_sel           = "SEL_HPS_PCS1_ENABLED",
    parameter sm_hssi_pcie_pcs_hps_mux_0_sel             = "SEL_HPS_PCS1_ENABLED",
    parameter sm_hssi_pcie_pcs_rst_mux_0_sel             = "SEL_SAME_QUAD_PCS_RST",
    parameter sm_hssi_pcie_pcs_rst_mux_1_sel             = "SEL_SAME_QUAD_PCS_RST",
    parameter sm_hssi_pcie_pcs_rst_mux_2_sel             = "SEL_SAME_QUAD_PCS_RST",
    parameter sm_hssi_pcie_pcs_rst_mux_3_sel             = "SEL_SAME_QUAD_PCS_RST",
    parameter sm_hssi_pcie_pcs_rx_demux_0_sel            = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter sm_hssi_pcie_pcs_rx_demux_1_sel            = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter sm_hssi_pcie_pcs_rx_demux_2_sel            = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter sm_hssi_pcie_pcs_rx_demux_3_sel            = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter sm_hssi_pcie_pcs_tx_mux_0_sel              = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter sm_hssi_pcie_pcs_tx_mux_1_sel              = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter sm_hssi_pcie_pcs_tx_mux_2_sel              = "SEL_SAME_QUAD_PCIE_CTRL",
    parameter sm_hssi_pcie_pcs_tx_mux_3_sel              = "SEL_SAME_QUAD_PCIE_CTRL",

    parameter sm_hssi_pcie_clk_mux_0_sel                 = "SEL_MIDDLE",
    parameter sm_hssi_pcie_data_mux_0_sel                = "SEL_MIDDLE",
    parameter sm_hssi_pld_chnl_dp_0_dr_enabled           = "DR_ENABLED_DR_DISABLED",
    parameter sm_hssi_pld_chnl_dp_0_duplex_mode          = "DUPLEX_MODE_DUPLEX",
    parameter sm_hssi_pld_chnl_dp_0_pld_channel_identifier   = "PLD_CHANNEL_IDENTIFIER_PHIP",
    parameter sm_hssi_pld_chnl_dp_0_rx_clkout1_divider       = "RX_CLKOUT1_DIVIDER_DIV1",
    parameter sm_hssi_pld_chnl_dp_0_rx_clkout2_divider       = "RX_CLKOUT2_DIVIDER_DIV1",
    parameter sm_hssi_pld_chnl_dp_0_rx_en                = "TRUE",
    parameter sm_hssi_pld_chnl_dp_0_rx_fifo_mode         = "RX_FIFO_MODE_PHASE_COMP",
    parameter sm_hssi_pld_chnl_dp_0_rx_fifo_width        = "RX_FIFO_WIDTH_DOUBLE_DOUBLE_WIDTH",
    parameter sm_hssi_pld_chnl_dp_0_rx_fifo_wr_clk_hz        = 36'b110111010011010101011010101110001100,
    parameter sm_hssi_pld_chnl_dp_0_rx_user1_clk_dynamic_mux = "RX_USER1_CLK_DYNAMIC_MUX_C2",
    parameter sm_hssi_pld_chnl_dp_0_rx_user2_clk_dynamic_mux = "RX_USER2_CLK_DYNAMIC_MUX_UX",
    parameter sm_hssi_pld_chnl_dp_0_sup_mode             = "SUP_MODE_USER_MODE",
    parameter sm_hssi_pld_chnl_dp_0_tx_clkout1_divider   = "TX_CLKOUT1_DIVIDER_DIV1",
    parameter sm_hssi_pld_chnl_dp_0_tx_clkout2_divider   = "TX_CLKOUT2_DIVIDER_DIV1",
    parameter sm_hssi_pld_chnl_dp_0_tx_en                = "TRUE",
    parameter sm_hssi_pld_chnl_dp_0_tx_fifo_mode         = "TX_FIFO_MODE_PHASE_COMP",
    parameter sm_hssi_pld_chnl_dp_0_tx_fifo_rd_clk_hz    = 36'b1110011000101010001000001011001,
    parameter sm_hssi_pld_chnl_dp_0_tx_fifo_width        = "TX_FIFO_WIDTH_DOUBLE_DOUBLE_WIDTH",
    parameter sm_hssi_pld_chnl_dp_0_tx_user1_clk_dynamic_mux = "TX_USER1_CLK_DYNAMIC_MUX_C1",
    parameter sm_hssi_pld_chnl_dp_0_tx_user2_clk_dynamic_mux = "TX_USER2_CLK_DYNAMIC_MUX_UNUSED",
    parameter sm_hssi_pld_chnl_dp_0_vc_rx_pldif_wm_en    = "VC_RX_PLDIF_WM_EN_ENABLE",
    parameter sm_pld_rx_mux_0_sel                        = "SEL_PCIE",
    parameter sm_pld_tx_demux_0_sel                      = "SEL_PCIE",
    parameter sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0_sel  = "SEL_PCIE",
    parameter sm_hssi_pld_chnl_tx_fifo_rd_clk_mux_0_sel  = "SEL_PCIE"


)
(
    input      [4-1+1:0] [79:0] i_hio_txdata                             ,
    input      [4-1+1:0] [9:0]  i_hio_txdata_extra                       ,
    input      [4-1+1:0]        i_hio_txdata_fifo_wr_en                  ,
    input      [4-1+1:0]        i_hio_rxdata_fifo_rd_en                  ,


    input   [20:0]                       i_hio_ch0_lavmm_addr                    ,
    input   [3:0]                        i_hio_ch0_lavmm_be                      ,
    input                                i_hio_ch0_lavmm_read                    ,
    input                                i_hio_ch0_lavmm_write                   ,
    input   [31:0]                       i_hio_ch0_lavmm_wdata                   ,
    output  [31:0]                       o_hio_ch0_lavmm_rdata                   ,
    output                               o_hio_ch0_lavmm_rdata_valid             ,
    output                               o_hio_ch0_lavmm_waitreq                 ,
    input                                i_hio_ch0_lavmm_rstn                    ,
    input                                i_hio_ch0_lavmm_clk                     ,

    input                                i_hio_ch0_pld_rx_clk_in_row_clk         ,
    input                                i_hio_ch0_pld_tx_clk_in_row_clk         ,
    input                                i_hio_ch0_det_lat_rx_dl_clk             ,
    input                                i_hio_ch0_det_lat_rx_mux_select         ,
    input                                i_hio_ch0_det_lat_rx_sclk_flop          ,
    input                                i_hio_ch0_det_lat_rx_sclk_gen_clk       ,
    input                                i_hio_ch0_det_lat_rx_trig_flop          ,
    input                                i_hio_ch0_det_lat_sampling_clk          ,
    input                                i_hio_ch0_det_lat_tx_dl_clk             ,
    input                                i_hio_ch0_det_lat_tx_mux_select         ,
    input                                i_hio_ch0_det_lat_tx_sclk_flop          ,
    input                                i_hio_ch0_det_lat_tx_sclk_gen_clk       ,
    input                                i_hio_ch0_det_lat_tx_trig_flop          ,
   /*  input                                i_ch0_i_refclk_tx_p   ,
    input                                i_ch0_i_refclk_tx_n   ,
    input                                i_ch0_i_syspll_c0_clk ,
    input                                i_ch0_i_syspll_c1_clk ,
    input                                i_ch0_i_syspll_c2_clk ,
    input                                i_ch0_i_flux_clk      ,
    input                                i_ch0_i_refclk_rx_p   ,
    input                                i_ch0_i_refclk_rx_n   , */
    output                               o_hio_ch0_user_rx_clk1_clk              ,
    output                               o_hio_ch0_user_rx_clk2_clk              ,
    output                               o_hio_ch0_user_tx_clk1_clk              ,
    output                               o_hio_ch0_user_tx_clk2_clk              ,
    output                               o_hio_ch0_ux_chnl_refclk_mux            ,
    output                               o_hio_ch0_det_lat_rx_async_dl_sync      ,
    output                               o_hio_ch0_det_lat_rx_async_pulse        ,
    output                               o_hio_ch0_det_lat_rx_async_sample_sync  ,
    output                               o_hio_ch0_det_lat_rx_sclk_sample_sync   ,
    output                               o_hio_ch0_det_lat_rx_trig_sample_sync   ,
    output                               o_hio_ch0_det_lat_tx_async_dl_sync      ,
    output                               o_hio_ch0_det_lat_tx_async_pulse        ,
    output                               o_hio_ch0_det_lat_tx_async_sample_sync  ,
    output                               o_hio_ch0_det_lat_tx_sclk_sample_sync   ,
    output                               o_hio_ch0_det_lat_tx_trig_sample_sync   ,
    output                               o_hio_ch0_xcvrif_rx_latency_pulse       ,
    output                               o_hio_ch0_xcvrif_tx_latency_pulse       ,
    input   [20:0]                       i_hio_ch1_lavmm_addr                    ,
    input   [3:0]                        i_hio_ch1_lavmm_be                      ,
    input                                i_hio_ch1_lavmm_read                    ,
    input                                i_hio_ch1_lavmm_write                   ,
    input   [31:0]                       i_hio_ch1_lavmm_wdata                   ,
    output  [31:0]                       o_hio_ch1_lavmm_rdata                   ,
    output                               o_hio_ch1_lavmm_rdata_valid             ,
    output                               o_hio_ch1_lavmm_waitreq                 ,
    input                                i_hio_ch1_lavmm_rstn                    ,
    input                                i_hio_ch1_lavmm_clk                     ,

    input                                i_hio_ch1_pld_rx_clk_in_row_clk         ,
    input                                i_hio_ch1_pld_tx_clk_in_row_clk         ,
    input                                i_hio_ch1_det_lat_rx_dl_clk             ,
    input                                i_hio_ch1_det_lat_rx_mux_select         ,
    input                                i_hio_ch1_det_lat_rx_sclk_flop          ,
    input                                i_hio_ch1_det_lat_rx_sclk_gen_clk       ,
    input                                i_hio_ch1_det_lat_rx_trig_flop          ,
    input                                i_hio_ch1_det_lat_sampling_clk          ,
    input                                i_hio_ch1_det_lat_tx_dl_clk             ,
    input                                i_hio_ch1_det_lat_tx_mux_select         ,
    input                                i_hio_ch1_det_lat_tx_sclk_flop          ,
    input                                i_hio_ch1_det_lat_tx_sclk_gen_clk       ,
    input                                i_hio_ch1_det_lat_tx_trig_flop          ,
   /*  input                                i_ch1_i_refclk_tx_p   ,
    input                                i_ch1_i_refclk_tx_n   ,
    input                                i_ch1_i_syspll_c0_clk ,
    input                                i_ch1_i_syspll_c1_clk ,
    input                                i_ch1_i_syspll_c2_clk ,
    input                                i_ch1_i_flux_clk      ,
    input                                i_ch1_i_refclk_rx_p   ,
    input                                i_ch1_i_refclk_rx_n   , */
    output                               o_hio_ch1_user_rx_clk1_clk              ,
    output                               o_hio_ch1_user_rx_clk2_clk              ,
    output                               o_hio_ch1_user_tx_clk1_clk              ,
    output                               o_hio_ch1_user_tx_clk2_clk              ,
    output                               o_hio_ch1_ux_chnl_refclk_mux            ,
    output                               o_hio_ch1_det_lat_rx_async_dl_sync      ,
    output                               o_hio_ch1_det_lat_rx_async_pulse        ,
    output                               o_hio_ch1_det_lat_rx_async_sample_sync  ,
    output                               o_hio_ch1_det_lat_rx_sclk_sample_sync   ,
    output                               o_hio_ch1_det_lat_rx_trig_sample_sync   ,
    output                               o_hio_ch1_det_lat_tx_async_dl_sync      ,
    output                               o_hio_ch1_det_lat_tx_async_pulse        ,
    output                               o_hio_ch1_det_lat_tx_async_sample_sync  ,
    output                               o_hio_ch1_det_lat_tx_sclk_sample_sync   ,
    output                               o_hio_ch1_det_lat_tx_trig_sample_sync   ,
    output                               o_hio_ch1_xcvrif_rx_latency_pulse       ,
    output                               o_hio_ch1_xcvrif_tx_latency_pulse       ,
    input   [20:0]                       i_hio_ch2_lavmm_addr                    ,
    input   [3:0]                        i_hio_ch2_lavmm_be                      ,
    input                                i_hio_ch2_lavmm_read                    ,
    input                                i_hio_ch2_lavmm_write                   ,
    input   [31:0]                       i_hio_ch2_lavmm_wdata                   ,
    output  [31:0]                       o_hio_ch2_lavmm_rdata                   ,
    output                               o_hio_ch2_lavmm_rdata_valid             ,
    output                               o_hio_ch2_lavmm_waitreq                 ,
    input                                i_hio_ch2_lavmm_rstn                    ,
    input                                i_hio_ch2_lavmm_clk                     ,

    input                                i_hio_ch2_pld_rx_clk_in_row_clk         ,
    input                                i_hio_ch2_pld_tx_clk_in_row_clk         ,
    input                                i_hio_ch2_det_lat_rx_dl_clk             ,
    input                                i_hio_ch2_det_lat_rx_mux_select         ,
    input                                i_hio_ch2_det_lat_rx_sclk_flop          ,
    input                                i_hio_ch2_det_lat_rx_sclk_gen_clk       ,
    input                                i_hio_ch2_det_lat_rx_trig_flop          ,
    input                                i_hio_ch2_det_lat_sampling_clk          ,
    input                                i_hio_ch2_det_lat_tx_dl_clk             ,
    input                                i_hio_ch2_det_lat_tx_mux_select         ,
    input                                i_hio_ch2_det_lat_tx_sclk_flop          ,
    input                                i_hio_ch2_det_lat_tx_sclk_gen_clk       ,
    input                                i_hio_ch2_det_lat_tx_trig_flop          ,
   /*  input                                i_ch2_i_refclk_tx_p   ,
    input                                i_ch2_i_refclk_tx_n   ,
    input                                i_ch2_i_syspll_c0_clk ,
    input                                i_ch2_i_syspll_c1_clk ,
    input                                i_ch2_i_syspll_c2_clk ,
    input                                i_ch2_i_flux_clk      ,
    input                                i_ch2_i_refclk_rx_p   ,
    input                                i_ch2_i_refclk_rx_n   , */
    output                               o_hio_ch2_user_rx_clk1_clk              ,
    output                               o_hio_ch2_user_rx_clk2_clk              ,
    output                               o_hio_ch2_user_tx_clk1_clk              ,
    output                               o_hio_ch2_user_tx_clk2_clk              ,
    output                               o_hio_ch2_ux_chnl_refclk_mux            ,
    output                               o_hio_ch2_det_lat_rx_async_dl_sync      ,
    output                               o_hio_ch2_det_lat_rx_async_pulse        ,
    output                               o_hio_ch2_det_lat_rx_async_sample_sync  ,
    output                               o_hio_ch2_det_lat_rx_sclk_sample_sync   ,
    output                               o_hio_ch2_det_lat_rx_trig_sample_sync   ,
    output                               o_hio_ch2_det_lat_tx_async_dl_sync      ,
    output                               o_hio_ch2_det_lat_tx_async_pulse        ,
    output                               o_hio_ch2_det_lat_tx_async_sample_sync  ,
    output                               o_hio_ch2_det_lat_tx_sclk_sample_sync   ,
    output                               o_hio_ch2_det_lat_tx_trig_sample_sync   ,
    output                               o_hio_ch2_xcvrif_rx_latency_pulse       ,
    output                               o_hio_ch2_xcvrif_tx_latency_pulse       ,
    input   [20:0]                       i_hio_ch3_lavmm_addr                    ,
    input   [3:0]                        i_hio_ch3_lavmm_be                      ,
    input                                i_hio_ch3_lavmm_read                    ,
    input                                i_hio_ch3_lavmm_write                   ,
    input   [31:0]                       i_hio_ch3_lavmm_wdata                   ,
    output  [31:0]                       o_hio_ch3_lavmm_rdata                   ,
    output                               o_hio_ch3_lavmm_rdata_valid             ,
    output                               o_hio_ch3_lavmm_waitreq                 ,
    input                                i_hio_ch3_lavmm_rstn                    ,
    input                                i_hio_ch3_lavmm_clk                     ,

    input                                i_hio_ch3_pld_rx_clk_in_row_clk         ,
    input                                i_hio_ch3_pld_tx_clk_in_row_clk         ,
    input                                i_hio_ch3_det_lat_rx_dl_clk             ,
    input                                i_hio_ch3_det_lat_rx_mux_select         ,
    input                                i_hio_ch3_det_lat_rx_sclk_flop          ,
    input                                i_hio_ch3_det_lat_rx_sclk_gen_clk       ,
    input                                i_hio_ch3_det_lat_rx_trig_flop          ,
    input                                i_hio_ch3_det_lat_sampling_clk          ,
    input                                i_hio_ch3_det_lat_tx_dl_clk             ,
    input                                i_hio_ch3_det_lat_tx_mux_select         ,
    input                                i_hio_ch3_det_lat_tx_sclk_flop          ,
    input                                i_hio_ch3_det_lat_tx_sclk_gen_clk       ,
    input                                i_hio_ch3_det_lat_tx_trig_flop          ,
   /*  input                                i_ch3_i_refclk_tx_p   ,
    input                                i_ch3_i_refclk_tx_n   ,
    input                                i_ch3_i_syspll_c0_clk ,
    input                                i_ch3_i_syspll_c1_clk ,
    input                                i_ch3_i_syspll_c2_clk ,
    input                                i_ch3_i_flux_clk      ,
    input                                i_ch3_i_refclk_rx_p   ,
    input                                i_ch3_i_refclk_rx_n   , */
    output                               o_hio_ch3_user_rx_clk1_clk              ,
    output                               o_hio_ch3_user_rx_clk2_clk              ,
    output                               o_hio_ch3_user_tx_clk1_clk              ,
    output                               o_hio_ch3_user_tx_clk2_clk              ,
    output                               o_hio_ch3_ux_chnl_refclk_mux            ,
    output                               o_hio_ch3_det_lat_rx_async_dl_sync      ,
    output                               o_hio_ch3_det_lat_rx_async_pulse        ,
    output                               o_hio_ch3_det_lat_rx_async_sample_sync  ,
    output                               o_hio_ch3_det_lat_rx_sclk_sample_sync   ,
    output                               o_hio_ch3_det_lat_rx_trig_sample_sync   ,
    output                               o_hio_ch3_det_lat_tx_async_dl_sync      ,
    output                               o_hio_ch3_det_lat_tx_async_pulse        ,
    output                               o_hio_ch3_det_lat_tx_async_sample_sync  ,
    output                               o_hio_ch3_det_lat_tx_sclk_sample_sync   ,
    output                               o_hio_ch3_det_lat_tx_trig_sample_sync   ,
    output                               o_hio_ch3_xcvrif_rx_latency_pulse       ,
    output                               o_hio_ch3_xcvrif_tx_latency_pulse       ,
    input   [20:0]                       i_hio_ch4_lavmm_addr                    ,
    input   [3:0]                        i_hio_ch4_lavmm_be                      ,
    input                                i_hio_ch4_lavmm_read                    ,
    input                                i_hio_ch4_lavmm_write                   ,
    input   [31:0]                       i_hio_ch4_lavmm_wdata                   ,
    output  [31:0]                       o_hio_ch4_lavmm_rdata                   ,
    output                               o_hio_ch4_lavmm_rdata_valid             ,
    output                               o_hio_ch4_lavmm_waitreq                 ,
    input                                i_hio_ch4_lavmm_rstn                    ,
    input                                i_hio_ch4_lavmm_clk                     ,

    input                                i_hio_ch4_pld_rx_clk_in_row_clk         ,
    input                                i_hio_ch4_pld_tx_clk_in_row_clk         ,
    input                                i_hio_ch4_det_lat_rx_dl_clk             ,
    input                                i_hio_ch4_det_lat_rx_mux_select         ,
    input                                i_hio_ch4_det_lat_rx_sclk_flop          ,
    input                                i_hio_ch4_det_lat_rx_sclk_gen_clk       ,
    input                                i_hio_ch4_det_lat_rx_trig_flop          ,
    input                                i_hio_ch4_det_lat_sampling_clk          ,
    input                                i_hio_ch4_det_lat_tx_dl_clk             ,
    input                                i_hio_ch4_det_lat_tx_mux_select         ,
    input                                i_hio_ch4_det_lat_tx_sclk_flop          ,
    input                                i_hio_ch4_det_lat_tx_sclk_gen_clk       ,
    input                                i_hio_ch4_det_lat_tx_trig_flop          ,
   /*  input                                i_ch4_i_refclk_tx_p   ,
    input                                i_ch4_i_refclk_tx_n   ,
    input                                i_ch4_i_syspll_c0_clk ,
    input                                i_ch4_i_syspll_c1_clk ,
    input                                i_ch4_i_syspll_c2_clk ,
    input                                i_ch4_i_flux_clk      ,
    input                                i_ch4_i_refclk_rx_p   ,
    input                                i_ch4_i_refclk_rx_n   , */
    output                               o_hio_ch4_user_rx_clk1_clk              ,
    output                               o_hio_ch4_user_rx_clk2_clk              ,
    output                               o_hio_ch4_user_tx_clk1_clk              ,
    output                               o_hio_ch4_user_tx_clk2_clk              ,
    output                               o_hio_ch4_ux_chnl_refclk_mux            ,
    output                               o_hio_ch4_det_lat_rx_async_dl_sync      ,
    output                               o_hio_ch4_det_lat_rx_async_pulse        ,
    output                               o_hio_ch4_det_lat_rx_async_sample_sync  ,
    output                               o_hio_ch4_det_lat_rx_sclk_sample_sync   ,
    output                               o_hio_ch4_det_lat_rx_trig_sample_sync   ,
    output                               o_hio_ch4_det_lat_tx_async_dl_sync      ,
    output                               o_hio_ch4_det_lat_tx_async_pulse        ,
    output                               o_hio_ch4_det_lat_tx_async_sample_sync  ,
    output                               o_hio_ch4_det_lat_tx_sclk_sample_sync   ,
    output                               o_hio_ch4_det_lat_tx_trig_sample_sync   ,
    output                               o_hio_ch4_xcvrif_rx_latency_pulse       ,
    output                               o_hio_ch4_xcvrif_tx_latency_pulse       ,

    input      [4-1+1:0]        i_hio_ptp_rst_n                          ,
    input      [4-1+1:0]        i_hio_ehip_rx_rst_n                      ,
    input      [4-1+1:0]        i_hio_ehip_tx_rst_n                      ,
    input      [4-1+1:0]        i_hio_ehip_signal_ok                     ,
    input      [4-1+1:0]        i_hio_sfreeze_2_r03f_rx_mac_srfz_n       ,
    input      [4-1+1:0]        i_hio_sfreeze_3_c2f_tx_deskew_srfz_n    ,
    input      [4-1+1:0]        i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n       ,
    input      [4-1+1:0]        i_hio_rstfec_fec_rx_rst_n                ,
    input      [4-1+1:0]        i_hio_rstfec_fec_tx_rst_n                ,
    input      [4-1+1:0]        i_hio_rstfec_fec_csr_ret                 ,
    input      [4-1+1:0]        i_hio_rstfec_rx_fec_sfrz_n               ,
    input      [4-1+1:0]        i_hio_rstfec_tx_fec_sfrz_n               ,
    input      [4-1+1:0]        i_hio_rstxcvrif_xcvrif_rx_rst_n          ,
    input      [4-1+1:0]        i_hio_rstxcvrif_xcvrif_tx_rst_n          ,
    input      [4-1+1:0]        i_hio_rstxcvrif_xcvrif_signal_ok         ,
    input      [4-1+1:0]        i_hio_rstxcvrif_rx_xcvrif_sfrz_n         ,
    input      [4-1+1:0]        i_hio_rstxcvrif_tx_xcvrif_sfrz_n         ,
    input      [4-1+1:0]        i_hio_rst_pld_clrhip                     ,
    input      [4-1+1:0]        i_hio_rst_pld_clrpcs                     ,
    input      [4-1+1:0]        i_hio_rst_pld_perstn                     ,
    input      [4-1+1:0]        i_hio_rst_pld_ready                      ,
    input      [4-1+1:0]        i_hio_rst_pld_adapter_rx_pld_rst_n       ,
    input      [4-1+1:0]        i_hio_rst_pld_adapter_tx_pld_rst_n       ,
    input      [4-1+1:0]        i_hio_rst_ux_rx_pma_rst_n                ,
    input      [4-1+1:0]        i_hio_rst_ux_rx_sfrz                     ,
    input      [4-1+1:0]        i_hio_rst_ux_tx_pma_rst_n                ,
    input      [4-1+1:0]        i_hio_pld_reset_clk_row                  ,
    input      [4-1+1:0] [79:0] i_hio_uxquad_async                       ,
    input      [4-1+1:0] [79:0] i_hio_uxquad_async_pcie_mux              ,
    //input      [4-1:0] [20:0] i_hio_lavmm_addr                         ,
    //input      [4-1:0]  [3:0] i_hio_lavmm_be                           ,
    //input      [4-1:0]        i_hio_lavmm_clk                          ,
    //input      [4-1:0]        i_hio_lavmm_read                         ,
    //input      [4-1:0]        i_hio_lavmm_rstn                         ,
    //input      [4-1:0][31:0]  i_hio_lavmm_wdata                        ,
    //input      [4-1:0]        i_hio_lavmm_write                        ,
    //input      [4-1:0]        i_hio_pld_rx_clk_in_row_clk              ,
    //input      [4-1:0]        i_hio_pld_tx_clk_in_row_clk              ,
    //input      [4-1:0]        i_hio_det_lat_rx_dl_clk                  ,
    //input      [4-1:0]        i_hio_det_lat_rx_mux_select              ,
    //input      [4-1:0]        i_hio_det_lat_rx_sclk_flop               ,
    //input      [4-1:0]        i_hio_det_lat_rx_sclk_gen_clk            ,
    //input      [4-1:0]        i_hio_det_lat_rx_trig_flop               ,
    //input      [4-1:0]        i_hio_det_lat_sampling_clk               ,
    //input      [4-1:0]        i_hio_det_lat_tx_dl_clk                  ,
    //input      [4-1:0]        i_hio_det_lat_tx_mux_select              ,
    //input      [4-1:0]        i_hio_det_lat_tx_sclk_flop               ,
    //input      [4-1:0]        i_hio_det_lat_tx_sclk_gen_clk            ,
    //input      [4-1:0]        i_hio_det_lat_tx_trig_flop               ,
    input      [4-1:0]        rx_serial_n                              ,
    input      [4-1:0]        rx_serial_p                              ,   
    //input      [4-1:0] [7:0]  i_hio_tx_pfc                             , //bits defined
    //input      [4-1:0]        i_hio_tx_pause                           , //bits defined
    //input      [4-1:0]        i_hio_clear_internal                     , //bits defined
    //input      [4-1:0]        i_hio_signal_ok                          , //bits defined
    //input      [4-1:0]        i_hio_pld_ready                          , //bits defined
    //input      [4-1:0]        i_hio_pma_rx_sf                          , //bits defined
    //input      [4-1:0]        i_hio_ch_rstxcvrif_lphy_signal_ok        , //bits defined
    //input      [4-1:0]        i_clear_tx_internal_err                  , //bits defined 
    output     [4-1+1:0]        o_hio_txdata_fifo_wr_empty               ,
    output     [4-1+1:0]        o_hio_txdata_fifo_wr_pempty              ,
    output     [4-1+1:0]        o_hio_txdata_fifo_wr_full                ,
    output     [4-1+1:0]        o_hio_txdata_fifo_wr_pfull               ,
    output     [4-1+1:0] [79:0] o_hio_rxdata                             ,
    output     [4-1+1:0] [9:0]  o_hio_rxdata_extra                       ,
    output     [4-1+1:0]        o_hio_rxdata_fifo_rd_empty               ,
    output     [4-1+1:0]        o_hio_rxdata_fifo_rd_pempty              ,
    output     [4-1+1:0]        o_hio_rxdata_fifo_rd_full                ,
    output     [4-1+1:0]        o_hio_rxdata_fifo_rd_pfull               ,
    output     [4-1+1:0]        o_hio_rstepcs_rx_pcs_fully_aligned       ,
    output     [4-1+1:0]        o_hio_rstfec_fec_rx_rdy_n                ,
    output     [4-1+1:0]        o_hio_rst_flux0_cpi_cmn_busy             ,
    output     [4-1+1:0]        o_hio_rst_oflux_rx_srds_rdy              ,
    output     [4-1+1:0]        o_hio_rst_ux_all_synthlockstatus         ,
    output     [4-1+1:0]        o_hio_rst_ux_octl_pcs_rxstatus           ,
    output     [4-1+1:0]        o_hio_rst_ux_octl_pcs_txstatus           ,
    output     [4-1+1:0]        o_hio_rst_ux_rxcdrlock2data              ,
    output     [4-1+1:0]        o_hio_rst_ux_rxcdrlockstatus             ,
    output     [4-1+1:0] [49:0] o_hio_uxquad_async                       ,
    //output     [4-1:0] [31:0] o_hio_lavmm_rdata                        ,
    //output     [4-1:0]        o_hio_lavmm_rdata_valid                  ,
    //output     [4-1:0]        o_hio_lavmm_waitreq                      ,
    //output     [4-1:0] [2:0]  k_user_rx_clk1_c0c1c2_sel                ,
    //output     [4-1:0] [2:0]  k_user_rx_clk2_c0c1c2_sel                ,
    //output     [4-1:0] [2:0]  k_user_tx_clk1_c0c1c2_sel                ,
    //output     [4-1:0] [2:0]  k_user_tx_clk2_c0c1c2_sel                ,
    //output     [4-1:0]        o_hio_user_rx_clk1_clk                   ,
    //output     [4-1:0]        o_hio_user_rx_clk2_clk                   ,
    //output     [4-1:0]        o_hio_user_tx_clk1_clk                   ,
    //output     [4-1:0]        o_hio_user_tx_clk2_clk                   ,
    //output     [4-1:0]        o_hio_ux_chnl_refclk_mux                 ,
    //output     [4-1:0]        o_hio_det_lat_rx_async_dl_sync           ,
    //output     [4-1:0]        o_hio_det_lat_rx_async_pulse             ,
    //output     [4-1:0]        o_hio_det_lat_rx_async_sample_sync       ,
    //output     [4-1:0]        o_hio_det_lat_rx_sclk_sample_sync        ,
    //output     [4-1:0]        o_hio_det_lat_rx_trig_sample_sync        ,
    //output     [4-1:0]        o_hio_det_lat_tx_async_dl_sync           ,
    //output     [4-1:0]        o_hio_det_lat_tx_async_pulse             ,
    //output     [4-1:0]        o_hio_det_lat_tx_async_sample_sync       ,
    //output     [4-1:0]        o_hio_det_lat_tx_sclk_sample_sync        ,
    //output     [4-1:0]        o_hio_det_lat_tx_trig_sample_sync        ,
    //output     [4-1:0]        o_hio_xcvrif_rx_latency_pulse            ,
    //output     [4-1:0]        o_hio_xcvrif_tx_latency_pulse            ,
    output     [4-1:0]        tx_serial_p                              ,
    output     [4-1:0]        tx_serial_n                              ,
    //output     [4-1:0]        o_hio_local_fault                        , //bits defined
    //output     [4-1:0]        o_hio_remote_fault                       , //bits defined
    //output     [4-1:0]        o_hio_rx_pause                           , //bits defined
    //output     [4-1:0] [7:0]  o_hio_rx_pfc                             , //bits defined
    //output     [4-1:0]        o_hio_txfifo_pfull                       , //bits defined
    //output     [4-1:0]        o_hio_dsk_err                            , //bits defined
    //output     [4-1:0]        o_hio_dsk_mon_err                        , //bits defined
    //output     [4-1:0]        o_hio_hip_ready                          , //bits defined
    //output     [4-1:0]        o_hio_rx_block_lock                      , //bits defined
    //output     [4-1:0]        o_hio_rx_dsk_done                        , //bits defined
    //output     [4-1:0]        o_hio_rx_am_lock                         , //bits defined
    //output     [4-1:0]        o_hio_rx_pcs_fully_aligned               , //bits defined
    //output     [4-1:0]        o_hio_hi_ber                             , //bits defined
    //output     [4-1:0]        o_hio_rx_pcs_internal_err                , //bits defined
    //output     [4-1:0]        o_hio_tx_fifo_status_fifo_wr_pfull       , //bits defined
    //output     [4-1:0]        o_hio_tx_fifo_status_fifo_pempty         , //bits defined
    //output     [4-1:0]        o_hio_rx_fifo_status_fifo_pempty         , //bits defined
    //output     [4-1:0]        o_hio_rx_fifo_status_fifo_wr_pfull       , //bits defined
    //output     [4-1:0]        o_hio_rx_fifo_status_fifo_empty          , //bits defined
    //output     [4-1:0]        o_hio_tx_fifo_status_fifo_empty          , //bits defined
    //output     [4-1:0]        o_hio_rx_fifo_status_gb_restarted        , //bits defined
    //output     [4-1:0]        o_hio_tx_fifo_status_gb_restarted          //bits defined 

    input  [4-1+1:0] [99:0] i_hio_txdata_async  ,    
    input  [4-1+1:0] [9:0 ] i_hio_txdata_direct ,    
    output [4-1+1:0] [99:0] o_hio_rxdata_async ,     
    output [4-1+1:0] [9:0 ] o_hio_rxdata_direct ,

    input                            i_refclk_tx_p   ,
//    input                            i_refclk_tx_n   ,//can derive as negated i_refclk_tx_p
    input                            i_syspll_c0_clk ,
    input                            i_syspll_c1_clk ,
    input                            i_syspll_c2_clk ,
    input                            i_flux_clk      ,
    input                            i_flux_clk_1    ,
    input                            i_refclk_rx_p   ,
//    input                            i_refclk_rx_n   ,

//KAHUAT_EDIT
    input                           i_ss_vccl_syspll_locked,
    output                          o_hio_pcie_user_rx_clk1_clk,
    output                          o_hio_pcie_user_rx_clk2_clk,
    output                          o_hio_pcie_user_tx_clk1_clk,
    output                          o_hio_pcie_user_tx_clk2_clk,
    output                [2:0]     k_user_rx_clk1_c0c1c2_sel,
    output                [2:0]     k_user_rx_clk2_c0c1c2_sel,
    output                [2:0]     k_user_tx_clk1_c0c1c2_sel,
    output                [2:0]     k_user_tx_clk2_c0c1c2_sel,


/* //As per 0p8 Signals Exposed to HAL_TOP 
    input                 [3:0]     i_q2q_xcvrrc_ux_ux__txstatus_rc_ux   ,
    output                [3:0]     o_q2q_xcvrrc_ux_ux__txstatus_ux_rc */

    output [4-1:0]      ioack_cdrdiv_left_ux_bidir_out,

//KAHUAT_EDIT
//    input   [79:0] i_ch0_tx_data,                              
//    input   [79:0] i_ch1_tx_data,                              
//    input   [79:0] i_ch2_tx_data,                              
//    input   [79:0] i_ch3_tx_data,                              
//    input   [79:0] i_ch4_tx_data,                              
    input   [79:0] i_ch5_tx_data,                              
    input   [79:0] i_ch6_tx_data,                              
    input   [79:0] i_ch7_tx_data,                              
    input   [79:0] i_ch8_tx_data,                              
    input          i_pin_perst_n,                              
//    input          i_rst_ch0_flux0_cpi_cmn_busy,               
//    input          i_rst_ch1_flux0_cpi_cmn_busy,               
//    input          i_rst_ch2_flux0_cpi_cmn_busy,               
//    input          i_rst_ch3_flux0_cpi_cmn_busy,               
    input   [5:0]  i_rxpipe4_dirfeedback,                      
    input   [7:0]  i_rxpipe4_linkevaluationfeedbackfiguremerit,
    input   [5:0]  i_rxpipe4_localfs,                          
    input   [5:0]  i_rxpipe4_locallf,                          
    input          i_rxpipe4_localtxcoefficientsvalid,         
    input   [17:0] i_rxpipe4_localtxpresetcoefficients,        
    input   [7:0]  i_rxpipe4_p2m_bus,                          
    input          i_rxpipe4_pclkchangeok,                     
    input          i_rxpipe4_phystatus,                        
    input   [39:0] i_rxpipe4_rxdata,                           
    input   [3:0]  i_rxpipe4_rxdatak,                          
    input          i_rxpipe4_rxdatavalid,                      
    input          i_rxpipe4_rxelecidlea,                      
    input          i_rxpipe4_rxstandbystatus,                  
    input          i_rxpipe4_rxstartblock,                     
    input   [2:0]  i_rxpipe4_rxstatus,                         
    input   [3:0]  i_rxpipe4_rxsyncheader,                     
    input          i_rxpipe4_rxvalid,                          
    input   [5:0]  i_rxpipe5_dirfeedback,                      
    input   [7:0]  i_rxpipe5_linkevaluationfeedbackfiguremerit,
    input   [5:0]  i_rxpipe5_localfs,                          
    input   [5:0]  i_rxpipe5_locallf,                          
    input          i_rxpipe5_localtxcoefficientsvalid,         
    input   [17:0] i_rxpipe5_localtxpresetcoefficients,        
    input   [7:0]  i_rxpipe5_p2m_bus,                          
    input          i_rxpipe5_pclkchangeok,                     
    input          i_rxpipe5_phystatus,                        
    input   [39:0] i_rxpipe5_rxdata,                           
    input   [3:0]  i_rxpipe5_rxdatak,                          
    input          i_rxpipe5_rxdatavalid,                      
    input          i_rxpipe5_rxelecidlea,                      
    input          i_rxpipe5_rxstandbystatus,                  
    input          i_rxpipe5_rxstartblock,                     
    input   [2:0]  i_rxpipe5_rxstatus,                         
    input   [3:0]  i_rxpipe5_rxsyncheader,                     
    input          i_rxpipe5_rxvalid,                          
    input   [5:0]  i_rxpipe6_dirfeedback,                      
    input   [7:0]  i_rxpipe6_linkevaluationfeedbackfiguremerit,
    input   [5:0]  i_rxpipe6_localfs,                          
    input   [5:0]  i_rxpipe6_locallf,                          
    input          i_rxpipe6_localtxcoefficientsvalid,         
    input   [17:0] i_rxpipe6_localtxpresetcoefficients,        
    input   [7:0]  i_rxpipe6_p2m_bus,                          
    input          i_rxpipe6_pclkchangeok,                     
    input          i_rxpipe6_phystatus,                        
    input   [39:0] i_rxpipe6_rxdata,                           
    input   [3:0]  i_rxpipe6_rxdatak,                          
    input          i_rxpipe6_rxdatavalid,                      
    input          i_rxpipe6_rxelecidlea,                      
    input          i_rxpipe6_rxstandbystatus,                  
    input          i_rxpipe6_rxstartblock,                     
    input   [2:0]  i_rxpipe6_rxstatus,                         
    input   [3:0]  i_rxpipe6_rxsyncheader,                     
    input          i_rxpipe6_rxvalid,                          
    input   [5:0]  i_rxpipe7_dirfeedback,                      
    input   [7:0]  i_rxpipe7_linkevaluationfeedbackfiguremerit,
    input   [5:0]  i_rxpipe7_localfs,                          
    input   [5:0]  i_rxpipe7_locallf,                          
    input          i_rxpipe7_localtxcoefficientsvalid,         
    input   [17:0] i_rxpipe7_localtxpresetcoefficients,        
    input   [7:0]  i_rxpipe7_p2m_bus,                          
    input          i_rxpipe7_pclkchangeok,                     
    input          i_rxpipe7_phystatus,                        
    input   [39:0] i_rxpipe7_rxdata,                           
    input   [3:0]  i_rxpipe7_rxdatak,                          
    input          i_rxpipe7_rxdatavalid,                      
    input          i_rxpipe7_rxelecidlea,                      
    input          i_rxpipe7_rxstandbystatus,                  
    input          i_rxpipe7_rxstartblock,                     
    input   [2:0]  i_rxpipe7_rxstatus,                         
    input   [3:0]  i_rxpipe7_rxsyncheader,                     
    input          i_rxpipe7_rxvalid,                          
//    output  [79:0] o_ch0_rx_data,                              
//    output  [79:0] o_ch1_rx_data,                              
//    output  [79:0] o_ch2_rx_data,                              
//    output  [79:0] o_ch3_rx_data,                              
//    output  [79:0] o_ch4_rx_data,                              
    output  [79:0] o_ch5_rx_data,                              
    output  [79:0] o_ch6_rx_data,                              
    output  [79:0] o_ch7_rx_data,                              
    output  [79:0] o_ch8_rx_data,                              
    output         o_pcs4_pipe_rst_n,                          
    output         o_pcs5_pipe_rst_n,                          
    output         o_pcs6_pipe_rst_n,                          
    output         o_pcs7_pipe_rst_n,                          

    output         o_txpipe4_asyncpowerchangeack,              
    output         o_txpipe4_blockaligncontrol,                
    output         o_txpipe4_cfg_hw_auto_sp_dis,               
    output         o_txpipe4_dirchange,                        
    output         o_txpipe4_ebuf_mode,                        
    output         o_txpipe4_encodedecodebypass,               
    output  [5:0]  o_txpipe4_fs,                               
    output         o_txpipe4_getlocalpresetcoefficients,       
    output         o_txpipe4_invalidrequest,                   
    output  [5:0]  o_txpipe4_lf,                               
    output  [4:0]  o_txpipe4_localpresetindex,                 
    output         o_txpipe4_lowpin_nt,                        
    output  [7:0]  o_txpipe4_m2p_bus,                          
    output  [2:0]  o_txpipe4_pclk_rate,                        
    output         o_txpipe4_pclkchangeack,                    
    output  [3:0]  o_txpipe4_phy_mode_nt,                      
    output  [3:0]  o_txpipe4_powerdown,                        
    output  [2:0]  o_txpipe4_rate,                             
    output         o_txpipe4_rxelecidle_disable_a,             
    output         o_txpipe4_rxeqclr,                          
    output         o_txpipe4_rxeqeval,                         
    output         o_txpipe4_rxeqinprogress,                   
    output         o_txpipe4_rxeqtraining,                     
    output         o_txpipe4_rxpolarity,                       
    output  [2:0]  o_txpipe4_rxpresethint,                     
    output         o_txpipe4_rxstandby,                        
    output         o_txpipe4_rxtermination,                    
    output         o_txpipe4_srisenable,                       
    output         o_txpipe4_txcmnmode_disable_a,              
    output         o_txpipe4_txcompliance,                     
    output  [39:0] o_txpipe4_txdata,                           
    output  [3:0]  o_txpipe4_txdatak,                          
    output         o_txpipe4_txdatavalid,                      
    output  [17:0] o_txpipe4_txdeemph,                         
    output         o_txpipe4_txdtctrx_lb,                      
    output         o_txpipe4_txelecidle,                       
    output  [2:0]  o_txpipe4_txmargin,                         
    output         o_txpipe4_txoneszeros,                      
    output         o_txpipe4_txstartblock,                     
    output         o_txpipe4_txswing,                          
    output  [3:0]  o_txpipe4_txsyncheader,                     
    output  [2:0]  o_txpipe4_width,                            
    output         o_txpipe5_asyncpowerchangeack,              
    output         o_txpipe5_blockaligncontrol,                
    output         o_txpipe5_cfg_hw_auto_sp_dis,               
    output         o_txpipe5_dirchange,                        
    output         o_txpipe5_ebuf_mode,                        
    output         o_txpipe5_encodedecodebypass,               
    output  [5:0]  o_txpipe5_fs,                               
    output         o_txpipe5_getlocalpresetcoefficients,       
    output         o_txpipe5_invalidrequest,                   
    output  [5:0]  o_txpipe5_lf,                               
    output  [4:0]  o_txpipe5_localpresetindex,                 
    output         o_txpipe5_lowpin_nt,                        
    output  [7:0]  o_txpipe5_m2p_bus,                          
    output  [2:0]  o_txpipe5_pclk_rate,                        
    output         o_txpipe5_pclkchangeack,                    
    output  [3:0]  o_txpipe5_phy_mode_nt,                      
    output  [3:0]  o_txpipe5_powerdown,                        
    output  [2:0]  o_txpipe5_rate,                             
    output         o_txpipe5_rxelecidle_disable_a,             
    output         o_txpipe5_rxeqclr,                          
    output         o_txpipe5_rxeqeval,                         
    output         o_txpipe5_rxeqinprogress,                   
    output         o_txpipe5_rxeqtraining,                     
    output         o_txpipe5_rxpolarity,                       
    output  [2:0]  o_txpipe5_rxpresethint,                     
    output         o_txpipe5_rxstandby,                        
    output         o_txpipe5_rxtermination,                    
    output         o_txpipe5_srisenable,                       
    output         o_txpipe5_txcmnmode_disable_a,              
    output         o_txpipe5_txcompliance,                     
    output  [39:0] o_txpipe5_txdata,                           
    output  [3:0]  o_txpipe5_txdatak,                          
    output         o_txpipe5_txdatavalid,                      
    output  [17:0] o_txpipe5_txdeemph,                         
    output         o_txpipe5_txdtctrx_lb,                      
    output         o_txpipe5_txelecidle,                       
    output  [2:0]  o_txpipe5_txmargin,                         
    output         o_txpipe5_txoneszeros,                      
    output         o_txpipe5_txstartblock,                     
    output         o_txpipe5_txswing,                          
    output  [3:0]  o_txpipe5_txsyncheader,                     
    output  [2:0]  o_txpipe5_width,                            
    output         o_txpipe6_asyncpowerchangeack,              
    output         o_txpipe6_blockaligncontrol,                
    output         o_txpipe6_cfg_hw_auto_sp_dis,               
    output         o_txpipe6_dirchange,                        
    output         o_txpipe6_ebuf_mode,                        
    output         o_txpipe6_encodedecodebypass,               
    output  [5:0]  o_txpipe6_fs,                               
    output         o_txpipe6_getlocalpresetcoefficients,       
    output         o_txpipe6_invalidrequest,                   
    output  [5:0]  o_txpipe6_lf,                               
    output  [4:0]  o_txpipe6_localpresetindex,                 
    output         o_txpipe6_lowpin_nt,                        
    output  [7:0]  o_txpipe6_m2p_bus,                          
    output  [2:0]  o_txpipe6_pclk_rate,                        
    output         o_txpipe6_pclkchangeack,                    
    output  [3:0]  o_txpipe6_phy_mode_nt,                      
    output  [3:0]  o_txpipe6_powerdown,                        
    output  [2:0]  o_txpipe6_rate,                             
    output         o_txpipe6_rxelecidle_disable_a,             
    output         o_txpipe6_rxeqclr,                          
    output         o_txpipe6_rxeqeval,                         
    output         o_txpipe6_rxeqinprogress,                   
    output         o_txpipe6_rxeqtraining,                     
    output         o_txpipe6_rxpolarity,                       
    output  [2:0]  o_txpipe6_rxpresethint,                     
    output         o_txpipe6_rxstandby,                        
    output         o_txpipe6_rxtermination,                    
    output         o_txpipe6_srisenable,                       
    output         o_txpipe6_txcmnmode_disable_a,              
    output         o_txpipe6_txcompliance,                     
    output  [39:0] o_txpipe6_txdata,                           
    output  [3:0]  o_txpipe6_txdatak,                          
    output         o_txpipe6_txdatavalid,                      
    output  [17:0] o_txpipe6_txdeemph,                         
    output         o_txpipe6_txdtctrx_lb,                      
    output         o_txpipe6_txelecidle,                       
    output  [2:0]  o_txpipe6_txmargin,                         
    output         o_txpipe6_txoneszeros,                      
    output         o_txpipe6_txstartblock,                     
    output         o_txpipe6_txswing,                          
    output  [3:0]  o_txpipe6_txsyncheader,                     
    output  [2:0]  o_txpipe6_width,                            
    output         o_txpipe7_asyncpowerchangeack,              
    output         o_txpipe7_blockaligncontrol,                
    output         o_txpipe7_cfg_hw_auto_sp_dis,               
    output         o_txpipe7_dirchange,                        
    output         o_txpipe7_ebuf_mode,                        
    output         o_txpipe7_encodedecodebypass,               
    output  [5:0]  o_txpipe7_fs,                               
    output         o_txpipe7_getlocalpresetcoefficients,       
    output         o_txpipe7_invalidrequest,                   
    output  [5:0]  o_txpipe7_lf,                               
    output  [4:0]  o_txpipe7_localpresetindex,                 
    output         o_txpipe7_lowpin_nt,                        
    output  [7:0]  o_txpipe7_m2p_bus,                          
    output  [2:0]  o_txpipe7_pclk_rate,                        
    output         o_txpipe7_pclkchangeack,                    
    output  [3:0]  o_txpipe7_phy_mode_nt,                      
    output  [3:0]  o_txpipe7_powerdown,                        
    output  [2:0]  o_txpipe7_rate,                             
    output         o_txpipe7_rxelecidle_disable_a,             
    output         o_txpipe7_rxeqclr,                          
    output         o_txpipe7_rxeqeval,                         
    output         o_txpipe7_rxeqinprogress,                   
    output         o_txpipe7_rxeqtraining,                     
    output         o_txpipe7_rxpolarity,                       
    output  [2:0]  o_txpipe7_rxpresethint,                     
    output         o_txpipe7_rxstandby,                        
    output         o_txpipe7_rxtermination,                    
    output         o_txpipe7_srisenable,                       
    output         o_txpipe7_txcmnmode_disable_a,              
    output         o_txpipe7_txcompliance,                     
    output  [39:0] o_txpipe7_txdata,                           
    output  [3:0]  o_txpipe7_txdatak,                          
    output         o_txpipe7_txdatavalid,                      
    output  [17:0] o_txpipe7_txdeemph,                         
    output         o_txpipe7_txdtctrx_lb,                      
    output         o_txpipe7_txelecidle,                       
    output  [2:0]  o_txpipe7_txmargin,                         
    output         o_txpipe7_txoneszeros,                      
    output         o_txpipe7_txstartblock,                     
    output         o_txpipe7_txswing,                          
    output  [3:0]  o_txpipe7_txsyncheader,                     
    output  [2:0]  o_txpipe7_width

);

    //wire [4-1:0] [99:0] i_hio_txdata_async  ;     
    //wire [4-1:0] [9:0 ] i_hio_txdata_direct ;     
    //wire [4-1:0] [99:0] o_hio_rxdata_async  ;     
    //wire [4-1:0] [9:0 ] o_hio_rxdata_direct ;
    
//phy_hal_shared signals
    wire [4-1:0][767:0]  uxwrap_bus_in_phy_shared                ;
    wire [4-1:0][703:0]  uxwrap_bus_out_phy_shared               ;
    //wire [4-1:0]           flux_sclk_mux_phy_shared                 ;
    //wire [4-1:0][79:0]   ss_async_pldif_phy_shared                  ;  /////
    //wire [4-1:0][49:0]   ss_async_pldif_phy_shared                  ;  /////
    //wire [4-1:0][79:0]   ss_async_pldif_pcie_mux_phy_shared         ;  /////
    wire [4-1:0][19:0]   lavmm_addr_phy_shared                    ;
    wire [4-1:0][3:0]    lavmm_be_phy_shared                      ;
    wire [4-1:0]         lavmm_clk_phy_shared                     ;
    wire [4-1:0]         lavmm_read_phy_shared                    ;
    wire [4-1:0]         lavmm_rstn_phy_shared                    ;
    wire [4-1:0][31:0]   lavmm_wdata_phy_shared                   ;
    wire [4-1:0]         lavmm_write_phy_shared                   ;
    wire [4-1:0][31:0]   lavmm_rdata_phy_shared                   ;
    wire [4-1:0]         lavmm_rdata_valid_phy_shared            ;
    wire [4-1:0]         lavmm_waitreq_phy_shared                ;
    //wire [4-1:0][2:0]    rxpstate_phy_shared                     ;
    //wire [4-1:0][3:0]    rxrate_phy_shared                       ;
    //wire [4-1:0]         rxterm_hiz_ena_phy_shared               ;
    //wire [4-1:0][2:0]    rxwidth_phy_shared                      ;
    //wire [4-1:0]         tstbus_lane_phy_shared                  ;
    //wire [4-1:0]         txbeacona_phy_shared                    ;
    //wire [4-1:0][2:0]    txclkdivrate_phy_shared                 ;
    //wire [4-1:0]         txdetectrx_reqa_phy_shared              ;
    //wire [4-1:0][5:0]    txdrv_levn_phy_shared                   ;
    //wire [4-1:0][4:0]    txdrv_levnm1_phy_shared                 ;
    //wire [4-1:0][2:0]    txdrv_levnm2_phy_shared                 ;
    //wire [4-1:0][4:0]    txdrv_levnp1_phy_shared                 ;
    //wire [4-1:0][3:0]    txdrv_slew_phy_shared                   ;
    //wire [4-1:0][3:0]    txelecidle_phy_shared                   ;
    //wire [4-1:0][2:0]    txpstate_phy_shared                     ;
    //wire [4-1:0][3:0]    txrate_phy_shared                       ;
    //wire [4-1:0][2:0]    txwidth_phy_shared                      ;
    //wire [4-1:0][1:0]    rxmargin_status_gray_phy_shared         ;
    //wire [4-1:0]         rst_ux_rx_sfrz_phy_shared               ;   /////
    //wire [4-1:0]         rst_flux0_cpi_cmn_busy_phy_shared       ;   /////
    //wire [4-1:0]         rst_oflux_rx_srds_rdy_phy_shared        ;   /////
    //wire [4-1:0]         rst_ux_all_synthlockstatus_phy_shared   ;   /////
    //wire [4-1:0]         rst_ux_rxcdrlockstatus_phy_shared       ;   /////
    //wire [4-1:0]         ock_pcs_cdrfbclk_phy_shared             ;   
    //wire [4-1:0]         ock_pcs_ref_phy_shared                  ;
    //wire [4-1:0]         ux_tx_ch_ptr_smpl_phy_shared            ;   /////
    wire [4-1:0]         dat_pcs_measlatrndtripbit_phy_shared    ;
    wire [4-1:0]         sclk_return_sel_rx_phy_shared           ;
    wire [4-1:0]         sclk_return_sel_tx_phy_shared           ;
    //wire [4-1:0]         s_i_ick_sclk_rx_phy_shared              ;   /////
    //wire [4-1:0]         ick_sclk_tx_phy_shared                  ;   /////
    wire [4-1:0]         s_o_ick_sclk_rx_phy_shared              ;
    wire [4-1:0] [4:0]   sync_common_control_phy_shared          ;
    
    wire [4-1:0]         ft_rx_sclk_sync_ch_phy_shared             ;
    wire [4-1:0]         ft_tx_sclk_sync_ch_phy_shared             ;
    wire [4-1:0]         rst_ux_rx_pma_rst_n_phy_shared            ;
    wire [4-1:0]         rst_ux_tx_pma_rst_n_phy_shared            ;
    wire [4-1:0]         ick_pcs_txword_phy_shared                 ;
    wire [4-1:0]         tx_dl_ch_bit_phy_shared                   ;
    wire [4-1:0]         dat_pcs_measlatbit_phy_shared             ;
    wire [4-1:0]         ft_rx_async_pulse_ch_phy_shared           ;
    wire [4-1:0]         ft_tx_async_pulse_ch_phy_shared           ;
    wire [4-1:0]         rx_dl_ch_bit_phy_shared                   ;
    wire [4-1:0] [1:0]   ux_rxuser1_sel_phy_shared                 ;
    wire [4-1:0] [1:0]   ux_rxuser2_sel_phy_shared                 ;
    wire [4-1:0] [1:0]   ux_txuser1_sel_phy_shared                 ;
    wire [4-1:0] [1:0]   ux_txuser2_sel_phy_shared                 ;
    wire [4-1:0]         octl_pcs_txstatus_a_phy_shared            ;
    wire [4-1:0]         ictl_pcs_txenable_a_phy_shared            ;
    wire [4-1:0] [124:0] sync_cfg_data_phy_shared                  ;
    wire [4-1:0] [249:0] sync_interface_control_phy_shared         ;
    wire [4-1:0] [79:0]  tx_data_phy_shared                        ;
    wire [4-1:0] [79:0]  rx_data_phy_shared                        ;
    wire [4-1:0] [319:0] sm_flux_ingress_phy_shared                ;
    wire [4-1:0] [256:0] sm_flux_egress_phy_shared                 ;
    wire 			        flux_cpi_int_phy_shared                   ;       ////                
    wire [4-1:0]         flux_int_phy_shared                       ;
    wire [4-1:0]         oflux_octl_pcs_txptr_smpl_lane_phy_shared ;
    wire [4-1:0]         ick_sclk_tx_phy_shared                    ;
    wire [4-1:0]         flux_srds_rdy_phy_shared                  ;
    wire [4-1:0]         pcs_rxword_phy_shared                     ;
    wire [4-1:0]         pcs_rxpostdiv_phy_shared                  ;
    wire [4-1:0]         ock_pcs_txword_phy_shared                 ;
    
    
//fec_wrap signals
//    wire [4-1:0][19:0]   ch_lavmm_fec_addr_fec_wrap        ;
//    wire [4-1:0][3:0]    ch_lavmm_fec_be_fec_wrap          ;
//    wire [4-1:0]         ch_lavmm_fec_clk_fec_wrap         ;
//    wire [4-1:0]         ch_lavmm_fec_read_fec_wrap        ;
//    wire [4-1:0]         ch_lavmm_fec_rstn_fec_wrap        ;
//    wire [4-1:0][31:0]   ch_lavmm_fec_wdata_fec_wrap       ;
//    wire [4-1:0]         ch_lavmm_fec_write_fec_wrap       ;
//    wire [4-1:0][31:0]   ch_lavmm_fec_rdata_fec_wrap       ;
//    wire [4-1:0]         ch_lavmm_fec_rdata_valid_fec_wrap ;
//    wire [4-1:0]         ch_lavmm_fec_waitreq_fec_wrap     ;
    wire [4-1:0][11:0]   ch_eth_fec_rx_async_fec_wrap      ;
    wire [4-1:0]         ch_eth_fec_rx_direct_fec_wrap     ;
//    wire [4-1:0][6:0]    ch_eth_fec_tx_async_fec_wrap      ;
//    wire [4-1:0]         ch_eth_fec_tx_direct_fec_wrap     ;
//    wire [4-1:0]         rstfec_fec_csr_ret_fec_wrap       ;
    wire [4-1:0]         fec_rx_rdy_n_fec_wrap             ;
//    wire [4-1:0]         rstfec_fec_rx_rst_n_fec_wrap      ;
//    wire [4-1:0]         rstfec_fec_tx_rst_n_fec_wrap      ;
//    wire [4-1:0]         rstfec_rx_fec_sfrz_n_fec_wrap     ;
//    wire [4-1:0]         rstfec_tx_fec_sfrz_n_fec_wrap     ;
    wire [4-1:0]         fec_tx_data_mux_sel_fec_wrap      ;
    wire [4-1:0][42:0]   fec_rx_data_fec_wrap              ;
//    wire [4-1:0][42:0]   fec_i_tx_mux_data_fec_wrap        ;
//    wire [4-1:0][42:0]   xcvr_rx_data                      ;
    wire [4-1:0][42:0]   xcvr_tx_data                      ;
    wire [4-1:0]         ss_rst_flux0_cpi_cmn_busy         ;
    wire [4-1:0]         pma_rx_sf                         ;

    wire  [4-1:0]  xcvrif_tx_fifo_rd_en_mux_x1             ;
    wire  [4-1:0]  xcvrif_tx_rst_mux_x1                    ;
    wire  [4-1:0]  xcvrif_tx_word_clk_mux_x1               ;
    wire  [4-1:0]  xcvrif_tx_fifo_rd_en_mux_x2             ;
    wire  [4-1:0]  xcvrif_tx_fifo_rd_en_mux_x4             ;
    wire  [4-1:0]  xcvrif_tx_fifo_rd_en_mux_x6_bot         ;
    wire  [4-1:0]  xcvrif_tx_fifo_rd_en_mux_x6_top         ;
    wire  [4-1:0]  xcvrif_tx_fifo_rd_en_mux_x8_bot         ;
    wire  [4-1:0]  xcvrif_tx_fifo_rd_en_mux_x8_top         ;
    wire  [4-1:0]  xcvrif_tx_rst_mux_x2                    ;
    wire  [4-1:0]  xcvrif_tx_rst_mux_x4                    ;
    wire  [4-1:0]  xcvrif_tx_rst_mux_x6_bot                ;
    wire  [4-1:0]  xcvrif_tx_rst_mux_x6_top                ;
    wire  [4-1:0]  xcvrif_tx_rst_mux_x8_bot                ;
    wire  [4-1:0]  xcvrif_tx_rst_mux_x8_top                ;
    wire  [4-1:0]  xcvrif_tx_word_clk_mux_x2               ;
    wire  [4-1:0]  xcvrif_tx_word_clk_mux_x4               ;
    wire  [4-1:0]  xcvrif_tx_word_clk_mux_x6_bot           ;
    wire  [4-1:0]  xcvrif_tx_word_clk_mux_x6_top           ;
    wire  [4-1:0]  xcvrif_tx_word_clk_mux_x8_bot           ;
    wire  [4-1:0]  xcvrif_tx_word_clk_mux_x8_top           ;

//1p0 Allignment
    wire  [4-1:0]  xcvrif_tx_rst_wr_sync_mux_x1            ;
    wire  [4-1:0]  xcvrif_tx_rst_wr_sync_mux_x2            ;
    wire  [4-1:0]  xcvrif_tx_rst_wr_sync_mux_x4            ;
    wire  [4-1:0]  xcvrif_tx_rst_wr_sync_mux_x6_bot        ;
    wire  [4-1:0]  xcvrif_tx_rst_wr_sync_mux_x6_top        ;
    wire  [4-1:0]  xcvrif_tx_rst_wr_sync_mux_x8_bot        ;
    wire  [4-1:0]  xcvrif_tx_rst_wr_sync_mux_x8_top        ;

    wire  [4-1:0]  ioack_synthdiv1_left_ux_bidir_out_reg   ;
    wire  [4-1:0]  ioack_synthdiv1_left_ux_bidir_in_reg    ;
//    wire  [4-1:0]  o_hio_rst_flux0_cpi_cmn_busy            ;
    wire  [4-1+1:0]  ss_user_rx_clk1_clk                     ;
    wire  [4-1+1:0]  ss_user_rx_clk2_clk                     ;
    wire  [4-1+1:0]  ss_user_tx_clk1_clk                     ;
    wire  [4-1+1:0]  ss_user_tx_clk2_clk                     ;
    wire  [4-1+1:0]  ss_user_rx_clk1_clk_w                     ; //KAHUAT_EDIT
    wire  [4-1+1:0]  ss_user_rx_clk2_clk_w                     ; //KAHUAT_EDIT
    wire  [4-1+1:0]  ss_user_tx_clk1_clk_w                     ; //KAHUAT_EDIT
    wire  [4-1+1:0]  ss_user_tx_clk2_clk_w                     ; //KAHUAT_EDIT
    wire  [4-1+1:0]  o_hio_ux_tx_ch_ptr_smpl                 ;

//lint fix for 1x1,1x2 variant
if ( 4 == 1) begin
  assign pma_rx_sf[3:1] = '0;
  assign lavmm_addr_phy_shared[3:1] = '0;
  assign lavmm_be_phy_shared[3:1] = '0;
  assign lavmm_clk_phy_shared[3:1] = '0;
  assign lavmm_read_phy_shared[3:1] = '0;
  assign lavmm_rstn_phy_shared[3:1] = '0;
  assign lavmm_wdata_phy_shared[3:1] = '0;
  assign lavmm_write_phy_shared[3:1] = '0;
  assign dat_pcs_measlatrndtripbit_phy_shared[3:1] = '0;
  assign ft_rx_sclk_sync_ch_phy_shared[3:1] = '0;
  assign ft_tx_sclk_sync_ch_phy_shared[3:1] = '0;
  assign rst_ux_rx_pma_rst_n_phy_shared[3:1] = '0;
  assign rst_ux_tx_pma_rst_n_phy_shared[3:1] = '0;
  assign tx_dl_ch_bit_phy_shared[3:1] = '0;
  assign octl_pcs_txstatus_a_phy_shared[3:1] = '0;
  assign s_o_ick_sclk_rx_phy_shared[3:1] = '0;
  assign sclk_return_sel_rx_phy_shared[3:1] = '0;
  assign sclk_return_sel_tx_phy_shared[3:1] = '0;
  assign tx_data_phy_shared[3:1] = '0;
  assign sm_flux_ingress_phy_shared[3:1] = '0;
  assign ick_pcs_txword_phy_shared[3:1] = '0;
  assign ick_sclk_tx_phy_shared[3:1] = '0;
  assign uxwrap_bus_out_phy_shared[3:1] = '0;

end else if ( 4 == 2) begin
  assign pma_rx_sf[3:2] = '0;
  assign lavmm_addr_phy_shared[3:2] = '0;
  assign lavmm_be_phy_shared[3:2] = '0;
  assign lavmm_clk_phy_shared[3:2] = '0;
  assign lavmm_read_phy_shared[3:2] = '0;
  assign lavmm_rstn_phy_shared[3:2] = '0;
  assign lavmm_wdata_phy_shared[3:2] = '0;
  assign lavmm_write_phy_shared[3:2] = '0;
  assign dat_pcs_measlatrndtripbit_phy_shared[3:2] = '0;
  assign ft_rx_sclk_sync_ch_phy_shared[3:2] = '0;
  assign ft_tx_sclk_sync_ch_phy_shared[3:2] = '0;
  assign rst_ux_rx_pma_rst_n_phy_shared[3:2] = '0;
  assign rst_ux_tx_pma_rst_n_phy_shared[3:2] = '0;
  assign tx_dl_ch_bit_phy_shared[3:2] = '0;
  assign octl_pcs_txstatus_a_phy_shared[3:2] = '0;
  assign s_o_ick_sclk_rx_phy_shared[3:2] = '0;
  assign sclk_return_sel_rx_phy_shared[3:2] = '0;
  assign sclk_return_sel_tx_phy_shared[3:2] = '0;
  assign tx_data_phy_shared[3:2] = '0;
  assign sm_flux_ingress_phy_shared[3:2] = '0;
  assign ick_pcs_txword_phy_shared[3:2] = '0;
  assign ick_sclk_tx_phy_shared[3:2] = '0;
  assign uxwrap_bus_out_phy_shared[3:2] = '0;

end
    
    assign xcvrif_tx_fifo_rd_en_mux_x2[0]     = ((4>=2 && 0<2)? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4>=2 && 0<4)? xcvrif_tx_fifo_rd_en_mux_x1[2] : ((4>=2 && 0<6)? xcvrif_tx_fifo_rd_en_mux_x1[4] : ((4>=2 && 0<8)? xcvrif_tx_fifo_rd_en_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_fifo_rd_en_mux_x4[0]     = ((4>=3 && 0<=3)? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4==8)? xcvrif_tx_fifo_rd_en_mux_x1[4] : 1'bz)); 
    assign xcvrif_tx_fifo_rd_en_mux_x6_bot[0] = (((4==5 || 4==6) && (0==4 || 0==5))? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4==8) && (0==6 || 0==7)) ? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x6_top[0] = ((4>=5 && 0<4)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x8_bot[0] = ((4>=7 && 0>=4)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x8_top[0] = ((4>=7 && 0<=3)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);

    assign xcvrif_tx_rst_mux_x2[0]     = ((4>=2 && 0<2)? xcvrif_tx_rst_mux_x1[0] : ((4>=2 && 0<4)? xcvrif_tx_rst_mux_x1[2] : ((4>=2 && 0<6)? xcvrif_tx_rst_mux_x1[4] : ((4>=2 && 0<8)? xcvrif_tx_rst_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_rst_mux_x4[0]     = ((4>=3 && 0<=3)? xcvrif_tx_rst_mux_x1[0] : ((4==8)? xcvrif_tx_rst_mux_x1[4] : 1'bz));
    assign xcvrif_tx_rst_mux_x6_bot[0] = (((4==5 || 4==6) && (0==4 || 0==5))? xcvrif_tx_rst_mux_x1[0] : ((4==8) && (0==6 || 0==7)) ? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x6_top[0] = ((4>=5 && 0<4)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x8_bot[0] = ((4>=7 && 0>=4)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x8_top[0] = ((4>=7 && 0<=3)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    
    assign xcvrif_tx_word_clk_mux_x2[0]     = ((4>=2 && 0<2)? xcvrif_tx_word_clk_mux_x1[0] : ((4>=2 && 0<4)? xcvrif_tx_word_clk_mux_x1[2] : ((4>=2 && 0<6)? xcvrif_tx_word_clk_mux_x1[4] : ((4>=2 && 0<8)? xcvrif_tx_word_clk_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_word_clk_mux_x4[0]     = ((4>=3 && 0<=3)? xcvrif_tx_word_clk_mux_x1[0] : ((4==8)? xcvrif_tx_word_clk_mux_x1[4] : 1'bz));
    assign xcvrif_tx_word_clk_mux_x6_bot[0] = (((4==5 || 4==6) && (0==4 || 0==5))? xcvrif_tx_word_clk_mux_x1[0] : ((4==8) && (0==6 || 0==7)) ? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x6_top[0] = ((4>=5 && 0<4)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x8_bot[0] = ((4>=7 && 0>=4)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x8_top[0] = ((4>=7 && 0<=3)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);   
//1p0 Allignment
    assign xcvrif_tx_rst_wr_sync_mux_x2[0]     = ((4>=2 && 0<2)? xcvrif_tx_rst_wr_sync_mux_x1[0] : ((4>=2 && 0<4)? xcvrif_tx_rst_wr_sync_mux_x1[2] : ((4>=2 && 0<6)? xcvrif_tx_rst_wr_sync_mux_x1[4] : ((4>=2 && 0<8)? xcvrif_tx_rst_wr_sync_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_rst_wr_sync_mux_x4[0]     = ((4>=3 && 0<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : ((4==8)? xcvrif_tx_rst_wr_sync_mux_x1[4] : 1'bz));
    assign xcvrif_tx_rst_wr_sync_mux_x6_bot[0] = ((4>=5 && 0<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x6_top[0] = ((4>=5 && 0>=4)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x8_bot[0] = ((4>=7 && 0<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x8_top[0] = ((4>=7 && 0>=4)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x2[1]     = ((4>=2 && 1<2)? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4>=2 && 1<4)? xcvrif_tx_fifo_rd_en_mux_x1[2] : ((4>=2 && 1<6)? xcvrif_tx_fifo_rd_en_mux_x1[4] : ((4>=2 && 1<8)? xcvrif_tx_fifo_rd_en_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_fifo_rd_en_mux_x4[1]     = ((4>=3 && 1<=3)? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4==8)? xcvrif_tx_fifo_rd_en_mux_x1[4] : 1'bz)); 
    assign xcvrif_tx_fifo_rd_en_mux_x6_bot[1] = (((4==5 || 4==6) && (1==4 || 1==5))? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4==8) && (1==6 || 1==7)) ? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x6_top[1] = ((4>=5 && 1<4)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x8_bot[1] = ((4>=7 && 1>=4)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x8_top[1] = ((4>=7 && 1<=3)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);

    assign xcvrif_tx_rst_mux_x2[1]     = ((4>=2 && 1<2)? xcvrif_tx_rst_mux_x1[0] : ((4>=2 && 1<4)? xcvrif_tx_rst_mux_x1[2] : ((4>=2 && 1<6)? xcvrif_tx_rst_mux_x1[4] : ((4>=2 && 1<8)? xcvrif_tx_rst_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_rst_mux_x4[1]     = ((4>=3 && 1<=3)? xcvrif_tx_rst_mux_x1[0] : ((4==8)? xcvrif_tx_rst_mux_x1[4] : 1'bz));
    assign xcvrif_tx_rst_mux_x6_bot[1] = (((4==5 || 4==6) && (1==4 || 1==5))? xcvrif_tx_rst_mux_x1[0] : ((4==8) && (1==6 || 1==7)) ? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x6_top[1] = ((4>=5 && 1<4)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x8_bot[1] = ((4>=7 && 1>=4)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x8_top[1] = ((4>=7 && 1<=3)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    
    assign xcvrif_tx_word_clk_mux_x2[1]     = ((4>=2 && 1<2)? xcvrif_tx_word_clk_mux_x1[0] : ((4>=2 && 1<4)? xcvrif_tx_word_clk_mux_x1[2] : ((4>=2 && 1<6)? xcvrif_tx_word_clk_mux_x1[4] : ((4>=2 && 1<8)? xcvrif_tx_word_clk_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_word_clk_mux_x4[1]     = ((4>=3 && 1<=3)? xcvrif_tx_word_clk_mux_x1[0] : ((4==8)? xcvrif_tx_word_clk_mux_x1[4] : 1'bz));
    assign xcvrif_tx_word_clk_mux_x6_bot[1] = (((4==5 || 4==6) && (1==4 || 1==5))? xcvrif_tx_word_clk_mux_x1[0] : ((4==8) && (1==6 || 1==7)) ? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x6_top[1] = ((4>=5 && 1<4)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x8_bot[1] = ((4>=7 && 1>=4)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x8_top[1] = ((4>=7 && 1<=3)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);   
//1p0 Allignment
    assign xcvrif_tx_rst_wr_sync_mux_x2[1]     = ((4>=2 && 1<2)? xcvrif_tx_rst_wr_sync_mux_x1[0] : ((4>=2 && 1<4)? xcvrif_tx_rst_wr_sync_mux_x1[2] : ((4>=2 && 1<6)? xcvrif_tx_rst_wr_sync_mux_x1[4] : ((4>=2 && 1<8)? xcvrif_tx_rst_wr_sync_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_rst_wr_sync_mux_x4[1]     = ((4>=3 && 1<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : ((4==8)? xcvrif_tx_rst_wr_sync_mux_x1[4] : 1'bz));
    assign xcvrif_tx_rst_wr_sync_mux_x6_bot[1] = ((4>=5 && 1<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x6_top[1] = ((4>=5 && 1>=4)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x8_bot[1] = ((4>=7 && 1<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x8_top[1] = ((4>=7 && 1>=4)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x2[2]     = ((4>=2 && 2<2)? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4>=2 && 2<4)? xcvrif_tx_fifo_rd_en_mux_x1[2] : ((4>=2 && 2<6)? xcvrif_tx_fifo_rd_en_mux_x1[4] : ((4>=2 && 2<8)? xcvrif_tx_fifo_rd_en_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_fifo_rd_en_mux_x4[2]     = ((4>=3 && 2<=3)? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4==8)? xcvrif_tx_fifo_rd_en_mux_x1[4] : 1'bz)); 
    assign xcvrif_tx_fifo_rd_en_mux_x6_bot[2] = (((4==5 || 4==6) && (2==4 || 2==5))? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4==8) && (2==6 || 2==7)) ? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x6_top[2] = ((4>=5 && 2<4)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x8_bot[2] = ((4>=7 && 2>=4)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x8_top[2] = ((4>=7 && 2<=3)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);

    assign xcvrif_tx_rst_mux_x2[2]     = ((4>=2 && 2<2)? xcvrif_tx_rst_mux_x1[0] : ((4>=2 && 2<4)? xcvrif_tx_rst_mux_x1[2] : ((4>=2 && 2<6)? xcvrif_tx_rst_mux_x1[4] : ((4>=2 && 2<8)? xcvrif_tx_rst_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_rst_mux_x4[2]     = ((4>=3 && 2<=3)? xcvrif_tx_rst_mux_x1[0] : ((4==8)? xcvrif_tx_rst_mux_x1[4] : 1'bz));
    assign xcvrif_tx_rst_mux_x6_bot[2] = (((4==5 || 4==6) && (2==4 || 2==5))? xcvrif_tx_rst_mux_x1[0] : ((4==8) && (2==6 || 2==7)) ? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x6_top[2] = ((4>=5 && 2<4)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x8_bot[2] = ((4>=7 && 2>=4)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x8_top[2] = ((4>=7 && 2<=3)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    
    assign xcvrif_tx_word_clk_mux_x2[2]     = ((4>=2 && 2<2)? xcvrif_tx_word_clk_mux_x1[0] : ((4>=2 && 2<4)? xcvrif_tx_word_clk_mux_x1[2] : ((4>=2 && 2<6)? xcvrif_tx_word_clk_mux_x1[4] : ((4>=2 && 2<8)? xcvrif_tx_word_clk_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_word_clk_mux_x4[2]     = ((4>=3 && 2<=3)? xcvrif_tx_word_clk_mux_x1[0] : ((4==8)? xcvrif_tx_word_clk_mux_x1[4] : 1'bz));
    assign xcvrif_tx_word_clk_mux_x6_bot[2] = (((4==5 || 4==6) && (2==4 || 2==5))? xcvrif_tx_word_clk_mux_x1[0] : ((4==8) && (2==6 || 2==7)) ? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x6_top[2] = ((4>=5 && 2<4)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x8_bot[2] = ((4>=7 && 2>=4)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x8_top[2] = ((4>=7 && 2<=3)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);   
//1p0 Allignment
    assign xcvrif_tx_rst_wr_sync_mux_x2[2]     = ((4>=2 && 2<2)? xcvrif_tx_rst_wr_sync_mux_x1[0] : ((4>=2 && 2<4)? xcvrif_tx_rst_wr_sync_mux_x1[2] : ((4>=2 && 2<6)? xcvrif_tx_rst_wr_sync_mux_x1[4] : ((4>=2 && 2<8)? xcvrif_tx_rst_wr_sync_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_rst_wr_sync_mux_x4[2]     = ((4>=3 && 2<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : ((4==8)? xcvrif_tx_rst_wr_sync_mux_x1[4] : 1'bz));
    assign xcvrif_tx_rst_wr_sync_mux_x6_bot[2] = ((4>=5 && 2<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x6_top[2] = ((4>=5 && 2>=4)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x8_bot[2] = ((4>=7 && 2<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x8_top[2] = ((4>=7 && 2>=4)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x2[3]     = ((4>=2 && 3<2)? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4>=2 && 3<4)? xcvrif_tx_fifo_rd_en_mux_x1[2] : ((4>=2 && 3<6)? xcvrif_tx_fifo_rd_en_mux_x1[4] : ((4>=2 && 3<8)? xcvrif_tx_fifo_rd_en_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_fifo_rd_en_mux_x4[3]     = ((4>=3 && 3<=3)? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4==8)? xcvrif_tx_fifo_rd_en_mux_x1[4] : 1'bz)); 
    assign xcvrif_tx_fifo_rd_en_mux_x6_bot[3] = (((4==5 || 4==6) && (3==4 || 3==5))? xcvrif_tx_fifo_rd_en_mux_x1[0] : ((4==8) && (3==6 || 3==7)) ? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x6_top[3] = ((4>=5 && 3<4)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x8_bot[3] = ((4>=7 && 3>=4)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);
    assign xcvrif_tx_fifo_rd_en_mux_x8_top[3] = ((4>=7 && 3<=3)? xcvrif_tx_fifo_rd_en_mux_x1[0] : 1'bz);

    assign xcvrif_tx_rst_mux_x2[3]     = ((4>=2 && 3<2)? xcvrif_tx_rst_mux_x1[0] : ((4>=2 && 3<4)? xcvrif_tx_rst_mux_x1[2] : ((4>=2 && 3<6)? xcvrif_tx_rst_mux_x1[4] : ((4>=2 && 3<8)? xcvrif_tx_rst_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_rst_mux_x4[3]     = ((4>=3 && 3<=3)? xcvrif_tx_rst_mux_x1[0] : ((4==8)? xcvrif_tx_rst_mux_x1[4] : 1'bz));
    assign xcvrif_tx_rst_mux_x6_bot[3] = (((4==5 || 4==6) && (3==4 || 3==5))? xcvrif_tx_rst_mux_x1[0] : ((4==8) && (3==6 || 3==7)) ? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x6_top[3] = ((4>=5 && 3<4)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x8_bot[3] = ((4>=7 && 3>=4)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_mux_x8_top[3] = ((4>=7 && 3<=3)? xcvrif_tx_rst_mux_x1[0] : 1'bz);
    
    assign xcvrif_tx_word_clk_mux_x2[3]     = ((4>=2 && 3<2)? xcvrif_tx_word_clk_mux_x1[0] : ((4>=2 && 3<4)? xcvrif_tx_word_clk_mux_x1[2] : ((4>=2 && 3<6)? xcvrif_tx_word_clk_mux_x1[4] : ((4>=2 && 3<8)? xcvrif_tx_word_clk_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_word_clk_mux_x4[3]     = ((4>=3 && 3<=3)? xcvrif_tx_word_clk_mux_x1[0] : ((4==8)? xcvrif_tx_word_clk_mux_x1[4] : 1'bz));
    assign xcvrif_tx_word_clk_mux_x6_bot[3] = (((4==5 || 4==6) && (3==4 || 3==5))? xcvrif_tx_word_clk_mux_x1[0] : ((4==8) && (3==6 || 3==7)) ? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x6_top[3] = ((4>=5 && 3<4)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x8_bot[3] = ((4>=7 && 3>=4)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);
    assign xcvrif_tx_word_clk_mux_x8_top[3] = ((4>=7 && 3<=3)? xcvrif_tx_word_clk_mux_x1[0] : 1'bz);   
//1p0 Allignment
    assign xcvrif_tx_rst_wr_sync_mux_x2[3]     = ((4>=2 && 3<2)? xcvrif_tx_rst_wr_sync_mux_x1[0] : ((4>=2 && 3<4)? xcvrif_tx_rst_wr_sync_mux_x1[2] : ((4>=2 && 3<6)? xcvrif_tx_rst_wr_sync_mux_x1[4] : ((4>=2 && 3<8)? xcvrif_tx_rst_wr_sync_mux_x1[6] : 1'bz)))) ;
    assign xcvrif_tx_rst_wr_sync_mux_x4[3]     = ((4>=3 && 3<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : ((4==8)? xcvrif_tx_rst_wr_sync_mux_x1[4] : 1'bz));
    assign xcvrif_tx_rst_wr_sync_mux_x6_bot[3] = ((4>=5 && 3<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x6_top[3] = ((4>=5 && 3>=4)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x8_bot[3] = ((4>=7 && 3<=3)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);
    assign xcvrif_tx_rst_wr_sync_mux_x8_top[3] = ((4>=7 && 3>=4)? xcvrif_tx_rst_wr_sync_mux_x1[0] : 1'bz);

//    assign marker_found_up[0]     = ((0<1)? marker_found[1] : ((0<2)? marker_found[2] : ((0<3)? marker_found[3] : 1'bz)));
//    assign marker_found_dn[0]     = ((0<1)? 1'bz : ((0<2)? marker_found[0] : ((0<3)? marker_found[1] : marker_found[2])));
//    assign marker_found_up[1]     = ((1<1)? marker_found[1] : ((1<2)? marker_found[2] : ((1<3)? marker_found[3] : 1'bz)));
//    assign marker_found_dn[1]     = ((1<1)? 1'bz : ((1<2)? marker_found[0] : ((1<3)? marker_found[1] : marker_found[2])));
//    assign marker_found_up[2]     = ((2<1)? marker_found[1] : ((2<2)? marker_found[2] : ((2<3)? marker_found[3] : 1'bz)));
//    assign marker_found_dn[2]     = ((2<1)? 1'bz : ((2<2)? marker_found[0] : ((2<3)? marker_found[1] : marker_found[2])));
//    assign marker_found_up[3]     = ((3<1)? marker_found[1] : ((3<2)? marker_found[2] : ((3<3)? marker_found[3] : 1'bz)));
//    assign marker_found_dn[3]     = ((3<1)? 1'bz : ((3<2)? marker_found[0] : ((3<3)? marker_found[1] : marker_found[2])));


        assign ioack_synthdiv1_left_ux_bidir_in_reg[0] =   1'bz;
        assign ioack_synthdiv1_left_ux_bidir_in_reg[1] =   1'bz;
        assign ioack_synthdiv1_left_ux_bidir_in_reg[2] =   1'bz;
        assign ioack_synthdiv1_left_ux_bidir_in_reg[3] =   1'bz;

//for KM This offset value need to update
    localparam offset = (4 == 6)? 2 : 0;

///// only one bit output from shared_hal_top
/////    assign flux_cpi_int_phy_shared_reg = ({4>4}? flux_cpi_int_phy_shared[1] : flux_cpi_int_phy_shared[0]);

//KAHUAT_EDIT
    wire   [16:0] i_ch0_lavmm_pcie_addr;
    wire    [3:0] i_ch0_lavmm_pcie_be;
    wire          i_ch0_lavmm_pcie_clk;
    wire          i_ch0_lavmm_pcie_read;
    wire          i_ch0_lavmm_pcie_rstn;
    wire   [31:0] i_ch0_lavmm_pcie_wdata;
    wire          i_ch0_lavmm_pcie_write;
    wire          i_ch0_pcie_rxword_clk;
    wire          i_ch0_pcie_txword_clk;
    wire          i_ch0_pcs_pclk;
    wire          i_ch0_pcs_pipe_rstn;
    wire          i_ch0_txpipe_asyncpowerchangeack;
    wire          i_ch0_txpipe_blockaligncontrol;
    wire          i_ch0_txpipe_cfg_hw_auto_sp_dis;
    wire          i_ch0_txpipe_dirchange;
    wire          i_ch0_txpipe_ebuf_mode;
    wire          i_ch0_txpipe_encodedecodebypass;
    wire    [5:0] i_ch0_txpipe_fs;
    wire          i_ch0_txpipe_getlocalpresetcoefficients;
    wire          i_ch0_txpipe_invalidrequest;
    wire    [5:0] i_ch0_txpipe_lf;
    wire    [4:0] i_ch0_txpipe_localpresetindex;
    wire          i_ch0_txpipe_lowpin_nt;
    wire    [7:0] i_ch0_txpipe_m2p_bus;
    wire    [2:0] i_ch0_txpipe_pclk_rate;
    wire          i_ch0_txpipe_pclkchangeack;
    wire    [3:0] i_ch0_txpipe_phy_mode_nt;
    wire    [3:0] i_ch0_txpipe_powerdown;
    wire    [2:0] i_ch0_txpipe_rate;
    wire          i_ch0_txpipe_rxelecidle_disable_a;
    wire          i_ch0_txpipe_rxeqclr;
    wire          i_ch0_txpipe_rxeqeval;
    wire          i_ch0_txpipe_rxeqinprogress;
    wire          i_ch0_txpipe_rxeqtraining;
    wire          i_ch0_txpipe_rxpolarity;
    wire    [2:0] i_ch0_txpipe_rxpresethint;
    wire          i_ch0_txpipe_rxstandby;
    wire          i_ch0_txpipe_rxtermination;
    wire          i_ch0_txpipe_srisenable;
    wire          i_ch0_txpipe_txcmnmode_disable_a;
    wire          i_ch0_txpipe_txcompliance;
    wire   [39:0] i_ch0_txpipe_txdata;
    wire    [3:0] i_ch0_txpipe_txdatak;
    wire          i_ch0_txpipe_txdatavalid;
    wire   [17:0] i_ch0_txpipe_txdeemph;
    wire          i_ch0_txpipe_txdtctrx_lb;
    wire          i_ch0_txpipe_txelecidle;
    wire    [2:0] i_ch0_txpipe_txmargin;
    wire          i_ch0_txpipe_txoneszeros;
    wire          i_ch0_txpipe_txstartblock;
    wire          i_ch0_txpipe_txswing;
    wire    [3:0] i_ch0_txpipe_txsyncheader;
    wire    [2:0] i_ch0_txpipe_width;
    wire          i_ch0_uxq_rxcdrlock2dataa;
    wire   [13:0] i_ch0_uxq_rxeq_best_eye_vala;
    wire          i_ch0_uxq_rxeq_donea;
    wire          i_ch0_uxq_rxmargin_nacka;
    wire    [1:0] i_ch0_uxq_rxmargin_status_gray_a;
    wire          i_ch0_uxq_rxmargin_statusa;
    wire          i_ch0_uxq_rxsignaldetect_lfpsa;
    wire          i_ch0_uxq_rxsignaldetecta;
    wire          i_ch0_uxq_rxstatusa;
    wire   [39:0] i_ch0_uxq_rxword;
    wire          i_ch0_uxq_synthlcfast_postdiv;
    wire          i_ch0_uxq_synthlcmed_postdiv;
    wire          i_ch0_uxq_synthlcslow_postdiv;
    wire          i_ch0_uxq_txdetectrx_acka;
    wire          i_ch0_uxq_txdetectrx_statct;
    wire          i_ch0_uxq_txstatusa;
    wire   [31:0] o_ch0_lavmm_pcie_rdata;
    wire          o_ch0_lavmm_pcie_rdata_valid;
    wire          o_ch0_lavmm_pcie_waitreq;
    wire          o_ch0_pcs_pclk;
    wire          o_ch0_pcs_pipe_rstn;
    wire          o_ch0_ux_ock_pma_clk;
    wire          o_ch0_uxq_lfps_ennt;
    wire   [1:0]  o_ch0_uxq_pcie_l1ctrla;
    wire          o_ch0_uxq_pma_cmn_ctrl;
    wire          o_ch0_uxq_pma_ctrl;
    wire          o_ch0_uxq_rst_pcs_rx_b_a;
    wire          o_ch0_uxq_rst_pcs_tx_b_a;
    wire          o_ch0_uxq_rxeiosdetectstata;
    wire   [2:0]  o_ch0_uxq_rxeq_precal_code_selnt;
    wire          o_ch0_uxq_rxeq_starta;
    wire          o_ch0_uxq_rxeq_static_ena;
    wire          o_ch0_uxq_rxmargin_direction_nt;
    wire          o_ch0_uxq_rxmargin_offset_change_a;
    wire          o_ch0_uxq_rxmargin_mode_nt;
    wire   [6:0]  o_ch0_uxq_rxmargin_offset_nt;
    wire          o_ch0_uxq_rxmargin_start_a;
    wire   [2:0]  o_ch0_uxq_rxpstate;
    wire   [3:0]  o_ch0_uxq_rxrate;
    wire          o_ch0_uxq_rxterm_hiz_ena;
    wire   [2:0]  o_ch0_uxq_rxwidth;
    wire          o_ch0_uxq_tstbus_lane;
    wire          o_ch0_uxq_txbeacona;
    wire   [2:0]  o_ch0_uxq_txclkdivrate;
    wire          o_ch0_uxq_txdetectrx_reqa;
    wire   [5:0]  o_ch0_uxq_txdrv_levn;
    wire   [4:0]  o_ch0_uxq_txdrv_levnm1;
    wire   [2:0]  o_ch0_uxq_txdrv_levnm2;
    wire   [4:0]  o_ch0_uxq_txdrv_levnp1;
    wire   [3:0]  o_ch0_uxq_txdrv_slew;
    wire   [3:0]  o_ch0_uxq_txelecidle;
    wire   [2:0]  o_ch0_uxq_txpstate;
    wire   [3:0]  o_ch0_uxq_txrate;
    wire   [2:0]  o_ch0_uxq_txwidth;
    wire  [39:0]  o_ch0_uxq_txword;
    wire  [79:0]  i_ch1_tx_data;	//PY edit
    wire  [79:0]  o_ch1_rx_data;	//PY edit

    wire   [16:0] i_ch1_lavmm_pcie_addr;
    wire    [3:0] i_ch1_lavmm_pcie_be;
    wire          i_ch1_lavmm_pcie_clk;
    wire          i_ch1_lavmm_pcie_read;
    wire          i_ch1_lavmm_pcie_rstn;
    wire   [31:0] i_ch1_lavmm_pcie_wdata;
    wire          i_ch1_lavmm_pcie_write;
    wire          i_ch1_pcie_rxword_clk;
    wire          i_ch1_pcie_txword_clk;
    wire          i_ch1_pcs_pclk;
    wire          i_ch1_pcs_pipe_rstn;
    wire          i_ch1_txpipe_asyncpowerchangeack;
    wire          i_ch1_txpipe_blockaligncontrol;
    wire          i_ch1_txpipe_cfg_hw_auto_sp_dis;
    wire          i_ch1_txpipe_dirchange;
    wire          i_ch1_txpipe_ebuf_mode;
    wire          i_ch1_txpipe_encodedecodebypass;
    wire    [5:0] i_ch1_txpipe_fs;
    wire          i_ch1_txpipe_getlocalpresetcoefficients;
    wire          i_ch1_txpipe_invalidrequest;
    wire    [5:0] i_ch1_txpipe_lf;
    wire    [4:0] i_ch1_txpipe_localpresetindex;
    wire          i_ch1_txpipe_lowpin_nt;
    wire    [7:0] i_ch1_txpipe_m2p_bus;
    wire    [2:0] i_ch1_txpipe_pclk_rate;
    wire          i_ch1_txpipe_pclkchangeack;
    wire    [3:0] i_ch1_txpipe_phy_mode_nt;
    wire    [3:0] i_ch1_txpipe_powerdown;
    wire    [2:0] i_ch1_txpipe_rate;
    wire          i_ch1_txpipe_rxelecidle_disable_a;
    wire          i_ch1_txpipe_rxeqclr;
    wire          i_ch1_txpipe_rxeqeval;
    wire          i_ch1_txpipe_rxeqinprogress;
    wire          i_ch1_txpipe_rxeqtraining;
    wire          i_ch1_txpipe_rxpolarity;
    wire    [2:0] i_ch1_txpipe_rxpresethint;
    wire          i_ch1_txpipe_rxstandby;
    wire          i_ch1_txpipe_rxtermination;
    wire          i_ch1_txpipe_srisenable;
    wire          i_ch1_txpipe_txcmnmode_disable_a;
    wire          i_ch1_txpipe_txcompliance;
    wire   [39:0] i_ch1_txpipe_txdata;
    wire    [3:0] i_ch1_txpipe_txdatak;
    wire          i_ch1_txpipe_txdatavalid;
    wire   [17:0] i_ch1_txpipe_txdeemph;
    wire          i_ch1_txpipe_txdtctrx_lb;
    wire          i_ch1_txpipe_txelecidle;
    wire    [2:0] i_ch1_txpipe_txmargin;
    wire          i_ch1_txpipe_txoneszeros;
    wire          i_ch1_txpipe_txstartblock;
    wire          i_ch1_txpipe_txswing;
    wire    [3:0] i_ch1_txpipe_txsyncheader;
    wire    [2:0] i_ch1_txpipe_width;
    wire          i_ch1_uxq_rxcdrlock2dataa;
    wire   [13:0] i_ch1_uxq_rxeq_best_eye_vala;
    wire          i_ch1_uxq_rxeq_donea;
    wire          i_ch1_uxq_rxmargin_nacka;
    wire    [1:0] i_ch1_uxq_rxmargin_status_gray_a;
    wire          i_ch1_uxq_rxmargin_statusa;
    wire          i_ch1_uxq_rxsignaldetect_lfpsa;
    wire          i_ch1_uxq_rxsignaldetecta;
    wire          i_ch1_uxq_rxstatusa;
    wire   [39:0] i_ch1_uxq_rxword;
    wire          i_ch1_uxq_synthlcfast_postdiv;
    wire          i_ch1_uxq_synthlcmed_postdiv;
    wire          i_ch1_uxq_synthlcslow_postdiv;
    wire          i_ch1_uxq_txdetectrx_acka;
    wire          i_ch1_uxq_txdetectrx_statct;
    wire          i_ch1_uxq_txstatusa;
    wire   [31:0] o_ch1_lavmm_pcie_rdata;
    wire          o_ch1_lavmm_pcie_rdata_valid;
    wire          o_ch1_lavmm_pcie_waitreq;
    wire          o_ch1_pcs_pclk;
    wire          o_ch1_pcs_pipe_rstn;
    wire          o_ch1_ux_ock_pma_clk;
    wire          o_ch1_uxq_lfps_ennt;
    wire   [1:0]  o_ch1_uxq_pcie_l1ctrla;
    wire          o_ch1_uxq_pma_cmn_ctrl;
    wire          o_ch1_uxq_pma_ctrl;
    wire          o_ch1_uxq_rst_pcs_rx_b_a;
    wire          o_ch1_uxq_rst_pcs_tx_b_a;
    wire          o_ch1_uxq_rxeiosdetectstata;
    wire   [2:0]  o_ch1_uxq_rxeq_precal_code_selnt;
    wire          o_ch1_uxq_rxeq_starta;
    wire          o_ch1_uxq_rxeq_static_ena;
    wire          o_ch1_uxq_rxmargin_direction_nt;
    wire          o_ch1_uxq_rxmargin_offset_change_a;
    wire          o_ch1_uxq_rxmargin_mode_nt;
    wire   [6:0]  o_ch1_uxq_rxmargin_offset_nt;
    wire          o_ch1_uxq_rxmargin_start_a;
    wire   [2:0]  o_ch1_uxq_rxpstate;
    wire   [3:0]  o_ch1_uxq_rxrate;
    wire          o_ch1_uxq_rxterm_hiz_ena;
    wire   [2:0]  o_ch1_uxq_rxwidth;
    wire          o_ch1_uxq_tstbus_lane;
    wire          o_ch1_uxq_txbeacona;
    wire   [2:0]  o_ch1_uxq_txclkdivrate;
    wire          o_ch1_uxq_txdetectrx_reqa;
    wire   [5:0]  o_ch1_uxq_txdrv_levn;
    wire   [4:0]  o_ch1_uxq_txdrv_levnm1;
    wire   [2:0]  o_ch1_uxq_txdrv_levnm2;
    wire   [4:0]  o_ch1_uxq_txdrv_levnp1;
    wire   [3:0]  o_ch1_uxq_txdrv_slew;
    wire   [3:0]  o_ch1_uxq_txelecidle;
    wire   [2:0]  o_ch1_uxq_txpstate;
    wire   [3:0]  o_ch1_uxq_txrate;
    wire   [2:0]  o_ch1_uxq_txwidth;
    wire  [39:0]  o_ch1_uxq_txword;
    wire  [79:0]  i_ch2_tx_data;	//PY edit 
    wire  [79:0]  o_ch2_rx_data;	//PY edit

    wire   [16:0] i_ch2_lavmm_pcie_addr;
    wire    [3:0] i_ch2_lavmm_pcie_be;
    wire          i_ch2_lavmm_pcie_clk;
    wire          i_ch2_lavmm_pcie_read;
    wire          i_ch2_lavmm_pcie_rstn;
    wire   [31:0] i_ch2_lavmm_pcie_wdata;
    wire          i_ch2_lavmm_pcie_write;
    wire          i_ch2_pcie_rxword_clk;
    wire          i_ch2_pcie_txword_clk;
    wire          i_ch2_pcs_pclk;
    wire          i_ch2_pcs_pipe_rstn;
    wire          i_ch2_txpipe_asyncpowerchangeack;
    wire          i_ch2_txpipe_blockaligncontrol;
    wire          i_ch2_txpipe_cfg_hw_auto_sp_dis;
    wire          i_ch2_txpipe_dirchange;
    wire          i_ch2_txpipe_ebuf_mode;
    wire          i_ch2_txpipe_encodedecodebypass;
    wire    [5:0] i_ch2_txpipe_fs;
    wire          i_ch2_txpipe_getlocalpresetcoefficients;
    wire          i_ch2_txpipe_invalidrequest;
    wire    [5:0] i_ch2_txpipe_lf;
    wire    [4:0] i_ch2_txpipe_localpresetindex;
    wire          i_ch2_txpipe_lowpin_nt;
    wire    [7:0] i_ch2_txpipe_m2p_bus;
    wire    [2:0] i_ch2_txpipe_pclk_rate;
    wire          i_ch2_txpipe_pclkchangeack;
    wire    [3:0] i_ch2_txpipe_phy_mode_nt;
    wire    [3:0] i_ch2_txpipe_powerdown;
    wire    [2:0] i_ch2_txpipe_rate;
    wire          i_ch2_txpipe_rxelecidle_disable_a;
    wire          i_ch2_txpipe_rxeqclr;
    wire          i_ch2_txpipe_rxeqeval;
    wire          i_ch2_txpipe_rxeqinprogress;
    wire          i_ch2_txpipe_rxeqtraining;
    wire          i_ch2_txpipe_rxpolarity;
    wire    [2:0] i_ch2_txpipe_rxpresethint;
    wire          i_ch2_txpipe_rxstandby;
    wire          i_ch2_txpipe_rxtermination;
    wire          i_ch2_txpipe_srisenable;
    wire          i_ch2_txpipe_txcmnmode_disable_a;
    wire          i_ch2_txpipe_txcompliance;
    wire   [39:0] i_ch2_txpipe_txdata;
    wire    [3:0] i_ch2_txpipe_txdatak;
    wire          i_ch2_txpipe_txdatavalid;
    wire   [17:0] i_ch2_txpipe_txdeemph;
    wire          i_ch2_txpipe_txdtctrx_lb;
    wire          i_ch2_txpipe_txelecidle;
    wire    [2:0] i_ch2_txpipe_txmargin;
    wire          i_ch2_txpipe_txoneszeros;
    wire          i_ch2_txpipe_txstartblock;
    wire          i_ch2_txpipe_txswing;
    wire    [3:0] i_ch2_txpipe_txsyncheader;
    wire    [2:0] i_ch2_txpipe_width;
    wire          i_ch2_uxq_rxcdrlock2dataa;
    wire   [13:0] i_ch2_uxq_rxeq_best_eye_vala;
    wire          i_ch2_uxq_rxeq_donea;
    wire          i_ch2_uxq_rxmargin_nacka;
    wire    [1:0] i_ch2_uxq_rxmargin_status_gray_a;
    wire          i_ch2_uxq_rxmargin_statusa;
    wire          i_ch2_uxq_rxsignaldetect_lfpsa;
    wire          i_ch2_uxq_rxsignaldetecta;
    wire          i_ch2_uxq_rxstatusa;
    wire   [39:0] i_ch2_uxq_rxword;
    wire          i_ch2_uxq_synthlcfast_postdiv;
    wire          i_ch2_uxq_synthlcmed_postdiv;
    wire          i_ch2_uxq_synthlcslow_postdiv;
    wire          i_ch2_uxq_txdetectrx_acka;
    wire          i_ch2_uxq_txdetectrx_statct;
    wire          i_ch2_uxq_txstatusa;
    wire   [31:0] o_ch2_lavmm_pcie_rdata;
    wire          o_ch2_lavmm_pcie_rdata_valid;
    wire          o_ch2_lavmm_pcie_waitreq;
    wire          o_ch2_pcs_pclk;
    wire          o_ch2_pcs_pipe_rstn;
    wire          o_ch2_ux_ock_pma_clk;
    wire          o_ch2_uxq_lfps_ennt;
    wire   [1:0]  o_ch2_uxq_pcie_l1ctrla;
    wire          o_ch2_uxq_pma_cmn_ctrl;
    wire          o_ch2_uxq_pma_ctrl;
    wire          o_ch2_uxq_rst_pcs_rx_b_a;
    wire          o_ch2_uxq_rst_pcs_tx_b_a;
    wire          o_ch2_uxq_rxeiosdetectstata;
    wire   [2:0]  o_ch2_uxq_rxeq_precal_code_selnt;
    wire          o_ch2_uxq_rxeq_starta;
    wire          o_ch2_uxq_rxeq_static_ena;
    wire          o_ch2_uxq_rxmargin_direction_nt;
    wire          o_ch2_uxq_rxmargin_offset_change_a;
    wire          o_ch2_uxq_rxmargin_mode_nt;
    wire   [6:0]  o_ch2_uxq_rxmargin_offset_nt;
    wire          o_ch2_uxq_rxmargin_start_a;
    wire   [2:0]  o_ch2_uxq_rxpstate;
    wire   [3:0]  o_ch2_uxq_rxrate;
    wire          o_ch2_uxq_rxterm_hiz_ena;
    wire   [2:0]  o_ch2_uxq_rxwidth;
    wire          o_ch2_uxq_tstbus_lane;
    wire          o_ch2_uxq_txbeacona;
    wire   [2:0]  o_ch2_uxq_txclkdivrate;
    wire          o_ch2_uxq_txdetectrx_reqa;
    wire   [5:0]  o_ch2_uxq_txdrv_levn;
    wire   [4:0]  o_ch2_uxq_txdrv_levnm1;
    wire   [2:0]  o_ch2_uxq_txdrv_levnm2;
    wire   [4:0]  o_ch2_uxq_txdrv_levnp1;
    wire   [3:0]  o_ch2_uxq_txdrv_slew;
    wire   [3:0]  o_ch2_uxq_txelecidle;
    wire   [2:0]  o_ch2_uxq_txpstate;
    wire   [3:0]  o_ch2_uxq_txrate;
    wire   [2:0]  o_ch2_uxq_txwidth;
    wire  [39:0]  o_ch2_uxq_txword;

    wire   [16:0] i_ch3_lavmm_pcie_addr;
    wire    [3:0] i_ch3_lavmm_pcie_be;
    wire          i_ch3_lavmm_pcie_clk;
    wire          i_ch3_lavmm_pcie_read;
    wire          i_ch3_lavmm_pcie_rstn;
    wire   [31:0] i_ch3_lavmm_pcie_wdata;
    wire          i_ch3_lavmm_pcie_write;
    wire          i_ch3_pcie_rxword_clk;
    wire          i_ch3_pcie_txword_clk;
    wire          i_ch3_pcs_pclk;
    wire          i_ch3_pcs_pipe_rstn;
    wire          i_ch3_txpipe_asyncpowerchangeack;
    wire          i_ch3_txpipe_blockaligncontrol;
    wire          i_ch3_txpipe_cfg_hw_auto_sp_dis;
    wire          i_ch3_txpipe_dirchange;
    wire          i_ch3_txpipe_ebuf_mode;
    wire          i_ch3_txpipe_encodedecodebypass;
    wire    [5:0] i_ch3_txpipe_fs;
    wire          i_ch3_txpipe_getlocalpresetcoefficients;
    wire          i_ch3_txpipe_invalidrequest;
    wire    [5:0] i_ch3_txpipe_lf;
    wire    [4:0] i_ch3_txpipe_localpresetindex;
    wire          i_ch3_txpipe_lowpin_nt;
    wire    [7:0] i_ch3_txpipe_m2p_bus;
    wire    [2:0] i_ch3_txpipe_pclk_rate;
    wire          i_ch3_txpipe_pclkchangeack;
    wire    [3:0] i_ch3_txpipe_phy_mode_nt;
    wire    [3:0] i_ch3_txpipe_powerdown;
    wire    [2:0] i_ch3_txpipe_rate;
    wire          i_ch3_txpipe_rxelecidle_disable_a;
    wire          i_ch3_txpipe_rxeqclr;
    wire          i_ch3_txpipe_rxeqeval;
    wire          i_ch3_txpipe_rxeqinprogress;
    wire          i_ch3_txpipe_rxeqtraining;
    wire          i_ch3_txpipe_rxpolarity;
    wire    [2:0] i_ch3_txpipe_rxpresethint;
    wire          i_ch3_txpipe_rxstandby;
    wire          i_ch3_txpipe_rxtermination;
    wire          i_ch3_txpipe_srisenable;
    wire          i_ch3_txpipe_txcmnmode_disable_a;
    wire          i_ch3_txpipe_txcompliance;
    wire   [39:0] i_ch3_txpipe_txdata;
    wire    [3:0] i_ch3_txpipe_txdatak;
    wire          i_ch3_txpipe_txdatavalid;
    wire   [17:0] i_ch3_txpipe_txdeemph;
    wire          i_ch3_txpipe_txdtctrx_lb;
    wire          i_ch3_txpipe_txelecidle;
    wire    [2:0] i_ch3_txpipe_txmargin;
    wire          i_ch3_txpipe_txoneszeros;
    wire          i_ch3_txpipe_txstartblock;
    wire          i_ch3_txpipe_txswing;
    wire    [3:0] i_ch3_txpipe_txsyncheader;
    wire    [2:0] i_ch3_txpipe_width;
    wire          i_ch3_uxq_rxcdrlock2dataa;
    wire   [13:0] i_ch3_uxq_rxeq_best_eye_vala;
    wire          i_ch3_uxq_rxeq_donea;
    wire          i_ch3_uxq_rxmargin_nacka;
    wire    [1:0] i_ch3_uxq_rxmargin_status_gray_a;
    wire          i_ch3_uxq_rxmargin_statusa;
    wire          i_ch3_uxq_rxsignaldetect_lfpsa;
    wire          i_ch3_uxq_rxsignaldetecta;
    wire          i_ch3_uxq_rxstatusa;
    wire   [39:0] i_ch3_uxq_rxword;
    wire          i_ch3_uxq_synthlcfast_postdiv;
    wire          i_ch3_uxq_synthlcmed_postdiv;
    wire          i_ch3_uxq_synthlcslow_postdiv;
    wire          i_ch3_uxq_txdetectrx_acka;
    wire          i_ch3_uxq_txdetectrx_statct;
    wire          i_ch3_uxq_txstatusa;
    wire   [31:0] o_ch3_lavmm_pcie_rdata;
    wire          o_ch3_lavmm_pcie_rdata_valid;
    wire          o_ch3_lavmm_pcie_waitreq;
    wire          o_ch3_pcs_pclk;
    wire          o_ch3_pcs_pipe_rstn;
    wire          o_ch3_ux_ock_pma_clk;
    wire          o_ch3_uxq_lfps_ennt;
    wire   [1:0]  o_ch3_uxq_pcie_l1ctrla;
    wire          o_ch3_uxq_pma_cmn_ctrl;
    wire          o_ch3_uxq_pma_ctrl;
    wire          o_ch3_uxq_rst_pcs_rx_b_a;
    wire          o_ch3_uxq_rst_pcs_tx_b_a;
    wire          o_ch3_uxq_rxeiosdetectstata;
    wire   [2:0]  o_ch3_uxq_rxeq_precal_code_selnt;
    wire          o_ch3_uxq_rxeq_starta;
    wire          o_ch3_uxq_rxeq_static_ena;
    wire          o_ch3_uxq_rxmargin_direction_nt;
    wire          o_ch3_uxq_rxmargin_offset_change_a;
    wire          o_ch3_uxq_rxmargin_mode_nt;
    wire   [6:0]  o_ch3_uxq_rxmargin_offset_nt;
    wire          o_ch3_uxq_rxmargin_start_a;
    wire   [2:0]  o_ch3_uxq_rxpstate;
    wire   [3:0]  o_ch3_uxq_rxrate;
    wire          o_ch3_uxq_rxterm_hiz_ena;
    wire   [2:0]  o_ch3_uxq_rxwidth;
    wire          o_ch3_uxq_tstbus_lane;
    wire          o_ch3_uxq_txbeacona;
    wire   [2:0]  o_ch3_uxq_txclkdivrate;
    wire          o_ch3_uxq_txdetectrx_reqa;
    wire   [5:0]  o_ch3_uxq_txdrv_levn;
    wire   [4:0]  o_ch3_uxq_txdrv_levnm1;
    wire   [2:0]  o_ch3_uxq_txdrv_levnm2;
    wire   [4:0]  o_ch3_uxq_txdrv_levnp1;
    wire   [3:0]  o_ch3_uxq_txdrv_slew;
    wire   [3:0]  o_ch3_uxq_txelecidle;
    wire   [2:0]  o_ch3_uxq_txpstate;
    wire   [3:0]  o_ch3_uxq_txrate;
    wire   [2:0]  o_ch3_uxq_txwidth;
    wire  [39:0]  o_ch3_uxq_txword;
    wire  [79:0]  i_ch3_tx_data;	//PY edit 
    wire  [79:0]  i_ch4_tx_data;	//PY edit
    wire  [79:0]  o_ch3_rx_data;	//PY edit                              
    wire  [79:0]  o_ch4_rx_data;	//PY edit  

    wire   [5:0]  o_ch0_rxpipe_dirfeedback;
    wire   [7:0]  o_ch0_rxpipe_linkevaluationfeedbackfiguremerit;
    wire   [5:0]  o_ch0_rxpipe_localfs;
    wire   [5:0]  o_ch0_rxpipe_locallf;
    wire          o_ch0_rxpipe_localtxcoefficientsvalid;
    wire  [17:0]  o_ch0_rxpipe_localtxpresetcoefficients;
    wire   [7:0]  o_ch0_rxpipe_p2m_bus;
    wire          o_ch0_rxpipe_pclkchangeok;
    wire          o_ch0_rxpipe_phystatus;
    wire  [39:0]  o_ch0_rxpipe_rxdata;
    wire   [3:0]  o_ch0_rxpipe_rxdatak;
    wire          o_ch0_rxpipe_rxdatavalid;
    wire          o_ch0_rxpipe_rxelecidlea;
    wire          o_ch0_rxpipe_rxstandbystatus;
    wire          o_ch0_rxpipe_rxstartblock;
    wire   [2:0]  o_ch0_rxpipe_rxstatus;
    wire   [3:0]  o_ch0_rxpipe_rxsyncheader;
    wire          o_ch0_rxpipe_rxvalid;
    wire   [5:0]  o_ch1_rxpipe_dirfeedback;
    wire   [7:0]  o_ch1_rxpipe_linkevaluationfeedbackfiguremerit;
    wire   [5:0]  o_ch1_rxpipe_localfs;
    wire   [5:0]  o_ch1_rxpipe_locallf;
    wire          o_ch1_rxpipe_localtxcoefficientsvalid;
    wire  [17:0]  o_ch1_rxpipe_localtxpresetcoefficients;
    wire   [7:0]  o_ch1_rxpipe_p2m_bus;
    wire          o_ch1_rxpipe_pclkchangeok;
    wire          o_ch1_rxpipe_phystatus;
    wire  [39:0]  o_ch1_rxpipe_rxdata;
    wire   [3:0]  o_ch1_rxpipe_rxdatak;
    wire          o_ch1_rxpipe_rxdatavalid;
    wire          o_ch1_rxpipe_rxelecidlea;
    wire          o_ch1_rxpipe_rxstandbystatus;
    wire          o_ch1_rxpipe_rxstartblock;
    wire   [2:0]  o_ch1_rxpipe_rxstatus;
    wire   [3:0]  o_ch1_rxpipe_rxsyncheader;
    wire          o_ch1_rxpipe_rxvalid;
    wire   [5:0]  o_ch2_rxpipe_dirfeedback;
    wire   [7:0]  o_ch2_rxpipe_linkevaluationfeedbackfiguremerit;
    wire   [5:0]  o_ch2_rxpipe_localfs;
    wire   [5:0]  o_ch2_rxpipe_locallf;
    wire          o_ch2_rxpipe_localtxcoefficientsvalid;
    wire  [17:0]  o_ch2_rxpipe_localtxpresetcoefficients;
    wire   [7:0]  o_ch2_rxpipe_p2m_bus;
    wire          o_ch2_rxpipe_pclkchangeok;
    wire          o_ch2_rxpipe_phystatus;
    wire  [39:0]  o_ch2_rxpipe_rxdata;
    wire   [3:0]  o_ch2_rxpipe_rxdatak;
    wire          o_ch2_rxpipe_rxdatavalid;
    wire          o_ch2_rxpipe_rxelecidlea;
    wire          o_ch2_rxpipe_rxstandbystatus;
    wire          o_ch2_rxpipe_rxstartblock;
    wire   [2:0]  o_ch2_rxpipe_rxstatus;
    wire   [3:0]  o_ch2_rxpipe_rxsyncheader;
    wire          o_ch2_rxpipe_rxvalid;
    wire   [5:0]  o_ch3_rxpipe_dirfeedback;
    wire   [7:0]  o_ch3_rxpipe_linkevaluationfeedbackfiguremerit;
    wire   [5:0]  o_ch3_rxpipe_localfs;
    wire   [5:0]  o_ch3_rxpipe_locallf;
    wire          o_ch3_rxpipe_localtxcoefficientsvalid;
    wire  [17:0]  o_ch3_rxpipe_localtxpresetcoefficients;
    wire   [7:0]  o_ch3_rxpipe_p2m_bus;
    wire          o_ch3_rxpipe_pclkchangeok;
    wire          o_ch3_rxpipe_phystatus;
    wire  [39:0]  o_ch3_rxpipe_rxdata;
    wire   [3:0]  o_ch3_rxpipe_rxdatak;
    wire          o_ch3_rxpipe_rxdatavalid;
    wire          o_ch3_rxpipe_rxelecidlea;
    wire          o_ch3_rxpipe_rxstandbystatus;
    wire          o_ch3_rxpipe_rxstartblock;
    wire   [2:0]  o_ch3_rxpipe_rxstatus;
    wire   [3:0]  o_ch3_rxpipe_rxsyncheader;
    wire          o_ch3_rxpipe_rxvalid;

    wire   [79:0] i_ch0_tx_data;                              
//    wire   [79:0] i_ch1_tx_data;	//PY edit                              
//    wire   [79:0] i_ch2_tx_data;	//PY edit                              
//    wire   [79:0] i_ch3_tx_data;	//PY edit                              
//    wire   [79:0] i_ch4_tx_data;	//PY edit                            
    wire   [5:0]  i_rxpipe0_dirfeedback;                      
    wire   [7:0]  i_rxpipe0_linkevaluationfeedbackfiguremerit;
    wire   [5:0]  i_rxpipe0_localfs;                          
    wire   [5:0]  i_rxpipe0_locallf;                          
    wire          i_rxpipe0_localtxcoefficientsvalid;         
    wire   [17:0] i_rxpipe0_localtxpresetcoefficients;        
    wire   [7:0]  i_rxpipe0_p2m_bus;                          
    wire          i_rxpipe0_pclkchangeok;                     
    wire          i_rxpipe0_phystatus;                        
    wire   [39:0] i_rxpipe0_rxdata;                           
    wire   [3:0]  i_rxpipe0_rxdatak;                          
    wire          i_rxpipe0_rxdatavalid;                      
    wire          i_rxpipe0_rxelecidlea;                      
    wire          i_rxpipe0_rxstandbystatus;                  
    wire          i_rxpipe0_rxstartblock;                     
    wire   [2:0]  i_rxpipe0_rxstatus;                         
    wire   [3:0]  i_rxpipe0_rxsyncheader;                     
    wire          i_rxpipe0_rxvalid;                          
    wire   [5:0]  i_rxpipe1_dirfeedback;                      
    wire   [7:0]  i_rxpipe1_linkevaluationfeedbackfiguremerit;
    wire   [5:0]  i_rxpipe1_localfs;                          
    wire   [5:0]  i_rxpipe1_locallf;                          
    wire          i_rxpipe1_localtxcoefficientsvalid;         
    wire   [17:0] i_rxpipe1_localtxpresetcoefficients;        
    wire   [7:0]  i_rxpipe1_p2m_bus;                          
    wire          i_rxpipe1_pclkchangeok;                     
    wire          i_rxpipe1_phystatus;                        
    wire   [39:0] i_rxpipe1_rxdata;                           
    wire   [3:0]  i_rxpipe1_rxdatak;                          
    wire          i_rxpipe1_rxdatavalid;                      
    wire          i_rxpipe1_rxelecidlea;                      
    wire          i_rxpipe1_rxstandbystatus;                  
    wire          i_rxpipe1_rxstartblock;                     
    wire   [2:0]  i_rxpipe1_rxstatus;                         
    wire   [3:0]  i_rxpipe1_rxsyncheader;                     
    wire          i_rxpipe1_rxvalid;                          
    wire   [5:0]  i_rxpipe2_dirfeedback;                      
    wire   [7:0]  i_rxpipe2_linkevaluationfeedbackfiguremerit;
    wire   [5:0]  i_rxpipe2_localfs;                          
    wire   [5:0]  i_rxpipe2_locallf;                          
    wire          i_rxpipe2_localtxcoefficientsvalid;         
    wire   [17:0] i_rxpipe2_localtxpresetcoefficients;        
    wire   [7:0]  i_rxpipe2_p2m_bus;                          
    wire          i_rxpipe2_pclkchangeok;                     
    wire          i_rxpipe2_phystatus;                        
    wire   [39:0] i_rxpipe2_rxdata;                           
    wire   [3:0]  i_rxpipe2_rxdatak;                          
    wire          i_rxpipe2_rxdatavalid;                      
    wire          i_rxpipe2_rxelecidlea;                      
    wire          i_rxpipe2_rxstandbystatus;                  
    wire          i_rxpipe2_rxstartblock;                     
    wire   [2:0]  i_rxpipe2_rxstatus;                         
    wire   [3:0]  i_rxpipe2_rxsyncheader;                     
    wire          i_rxpipe2_rxvalid;                          
    wire   [5:0]  i_rxpipe3_dirfeedback;                      
    wire   [7:0]  i_rxpipe3_linkevaluationfeedbackfiguremerit;
    wire   [5:0]  i_rxpipe3_localfs;                          
    wire   [5:0]  i_rxpipe3_locallf;                          
    wire          i_rxpipe3_localtxcoefficientsvalid;         
    wire   [17:0] i_rxpipe3_localtxpresetcoefficients;        
    wire   [7:0]  i_rxpipe3_p2m_bus;                          
    wire          i_rxpipe3_pclkchangeok;                     
    wire          i_rxpipe3_phystatus;                        
    wire   [39:0] i_rxpipe3_rxdata;                           
    wire   [3:0]  i_rxpipe3_rxdatak;                          
    wire          i_rxpipe3_rxdatavalid;                      
    wire          i_rxpipe3_rxelecidlea;                      
    wire          i_rxpipe3_rxstandbystatus;                  
    wire          i_rxpipe3_rxstartblock;                     
    wire   [2:0]  i_rxpipe3_rxstatus;                         
    wire   [3:0]  i_rxpipe3_rxsyncheader;                     
    wire          i_rxpipe3_rxvalid;                          
    wire          i_pld_pcie_clk;                             
    wire          i_gbl_ctrl_syspll_locked;                   

    wire  [79:0]  o_ch0_rx_data;                              
//    wire  [79:0]  o_ch1_rx_data;	//PY edit                              
//    wire  [79:0]  o_ch2_rx_data;	//PY edit                              
//    wire  [79:0]  o_ch3_rx_data;	//PY edit                              
//    wire  [79:0]  o_ch4_rx_data;	//PY edit                              
    wire          o_txpipe0_asyncpowerchangeack;              
    wire          o_txpipe0_blockaligncontrol;                
    wire          o_txpipe0_cfg_hw_auto_sp_dis;               
    wire          o_txpipe0_dirchange;                        
    wire          o_txpipe0_ebuf_mode;                        
    wire          o_txpipe0_encodedecodebypass;               
    wire   [5:0]  o_txpipe0_fs;                               
    wire          o_txpipe0_getlocalpresetcoefficients;       
    wire          o_txpipe0_invalidrequest;                   
    wire   [5:0]  o_txpipe0_lf;                               
    wire   [4:0]  o_txpipe0_localpresetindex;                 
    wire          o_txpipe0_lowpin_nt;                        
    wire   [7:0]  o_txpipe0_m2p_bus;                          
    wire   [2:0]  o_txpipe0_pclk_rate;                        
    wire          o_txpipe0_pclkchangeack;                    
    wire   [3:0]  o_txpipe0_phy_mode_nt;                      
    wire   [3:0]  o_txpipe0_powerdown;                        
    wire   [2:0]  o_txpipe0_rate;                             
    wire          o_txpipe0_rxelecidle_disable_a;             
    wire          o_txpipe0_rxeqclr;                          
    wire          o_txpipe0_rxeqeval;                         
    wire          o_txpipe0_rxeqinprogress;                   
    wire          o_txpipe0_rxeqtraining;                     
    wire          o_txpipe0_rxpolarity;                       
    wire   [2:0]  o_txpipe0_rxpresethint;                     
    wire          o_txpipe0_rxstandby;                        
    wire          o_txpipe0_rxtermination;                    
    wire          o_txpipe0_srisenable;                       
    wire          o_txpipe0_txcmnmode_disable_a;              
    wire          o_txpipe0_txcompliance;                     
    wire   [39:0] o_txpipe0_txdata;                           
    wire   [3:0]  o_txpipe0_txdatak;                          
    wire          o_txpipe0_txdatavalid;                      
    wire   [17:0] o_txpipe0_txdeemph;                         
    wire          o_txpipe0_txdtctrx_lb;                      
    wire          o_txpipe0_txelecidle;                       
    wire   [2:0]  o_txpipe0_txmargin;                         
    wire          o_txpipe0_txoneszeros;                      
    wire          o_txpipe0_txstartblock;                     
    wire          o_txpipe0_txswing;                          
    wire   [3:0]  o_txpipe0_txsyncheader;                     
    wire   [2:0]  o_txpipe0_width;                            
    wire          o_txpipe1_asyncpowerchangeack;              
    wire          o_txpipe1_blockaligncontrol;                
    wire          o_txpipe1_cfg_hw_auto_sp_dis;               
    wire          o_txpipe1_dirchange;                        
    wire          o_txpipe1_ebuf_mode;                        
    wire          o_txpipe1_encodedecodebypass;               
    wire   [5:0]  o_txpipe1_fs;                               
    wire          o_txpipe1_getlocalpresetcoefficients;       
    wire          o_txpipe1_invalidrequest;                   
    wire   [5:0]  o_txpipe1_lf;                               
    wire   [4:0]  o_txpipe1_localpresetindex;                 
    wire          o_txpipe1_lowpin_nt;                        
    wire   [7:0]  o_txpipe1_m2p_bus;                          
    wire   [2:0]  o_txpipe1_pclk_rate;                        
    wire          o_txpipe1_pclkchangeack;                    
    wire   [3:0]  o_txpipe1_phy_mode_nt;                      
    wire   [3:0]  o_txpipe1_powerdown;                        
    wire   [2:0]  o_txpipe1_rate;                             
    wire          o_txpipe1_rxelecidle_disable_a;             
    wire          o_txpipe1_rxeqclr;                          
    wire          o_txpipe1_rxeqeval;                         
    wire          o_txpipe1_rxeqinprogress;                   
    wire          o_txpipe1_rxeqtraining;                     
    wire          o_txpipe1_rxpolarity;                       
    wire   [2:0]  o_txpipe1_rxpresethint;                     
    wire          o_txpipe1_rxstandby;                        
    wire          o_txpipe1_rxtermination;                    
    wire          o_txpipe1_srisenable;                       
    wire          o_txpipe1_txcmnmode_disable_a;              
    wire          o_txpipe1_txcompliance;                     
    wire   [39:0] o_txpipe1_txdata;                           
    wire   [3:0]  o_txpipe1_txdatak;                          
    wire          o_txpipe1_txdatavalid;                      
    wire   [17:0] o_txpipe1_txdeemph;                         
    wire          o_txpipe1_txdtctrx_lb;                      
    wire          o_txpipe1_txelecidle;                       
    wire   [2:0]  o_txpipe1_txmargin;                         
    wire          o_txpipe1_txoneszeros;                      
    wire          o_txpipe1_txstartblock;                     
    wire          o_txpipe1_txswing;                          
    wire   [3:0]  o_txpipe1_txsyncheader;                     
    wire   [2:0]  o_txpipe1_width;                            
    wire          o_txpipe2_asyncpowerchangeack;              
    wire          o_txpipe2_blockaligncontrol;                
    wire          o_txpipe2_cfg_hw_auto_sp_dis;               
    wire          o_txpipe2_dirchange;                        
    wire          o_txpipe2_ebuf_mode;                        
    wire          o_txpipe2_encodedecodebypass;               
    wire   [5:0]  o_txpipe2_fs;                               
    wire          o_txpipe2_getlocalpresetcoefficients;       
    wire          o_txpipe2_invalidrequest;                   
    wire   [5:0]  o_txpipe2_lf;                               
    wire   [4:0]  o_txpipe2_localpresetindex;                 
    wire          o_txpipe2_lowpin_nt;                        
    wire   [7:0]  o_txpipe2_m2p_bus;                          
    wire   [2:0]  o_txpipe2_pclk_rate;                        
    wire          o_txpipe2_pclkchangeack;                    
    wire   [3:0]  o_txpipe2_phy_mode_nt;                      
    wire   [3:0]  o_txpipe2_powerdown;                        
    wire   [2:0]  o_txpipe2_rate;                             
    wire          o_txpipe2_rxelecidle_disable_a;             
    wire          o_txpipe2_rxeqclr;                          
    wire          o_txpipe2_rxeqeval;                         
    wire          o_txpipe2_rxeqinprogress;                   
    wire          o_txpipe2_rxeqtraining;                     
    wire          o_txpipe2_rxpolarity;                       
    wire   [2:0]  o_txpipe2_rxpresethint;                     
    wire          o_txpipe2_rxstandby;                        
    wire          o_txpipe2_rxtermination;                    
    wire          o_txpipe2_srisenable;                       
    wire          o_txpipe2_txcmnmode_disable_a;              
    wire          o_txpipe2_txcompliance;                     
    wire   [39:0] o_txpipe2_txdata;                           
    wire   [3:0]  o_txpipe2_txdatak;                          
    wire          o_txpipe2_txdatavalid;                      
    wire   [17:0] o_txpipe2_txdeemph;                         
    wire          o_txpipe2_txdtctrx_lb;                      
    wire          o_txpipe2_txelecidle;                       
    wire   [2:0]  o_txpipe2_txmargin;                         
    wire          o_txpipe2_txoneszeros;                      
    wire          o_txpipe2_txstartblock;                     
    wire          o_txpipe2_txswing;                          
    wire   [3:0]  o_txpipe2_txsyncheader;                     
    wire   [2:0]  o_txpipe2_width;                            
    wire          o_txpipe3_asyncpowerchangeack;              
    wire          o_txpipe3_blockaligncontrol;                
    wire          o_txpipe3_cfg_hw_auto_sp_dis;               
    wire          o_txpipe3_dirchange;                        
    wire          o_txpipe3_ebuf_mode;                        
    wire          o_txpipe3_encodedecodebypass;               
    wire   [5:0]  o_txpipe3_fs;                               
    wire          o_txpipe3_getlocalpresetcoefficients;       
    wire          o_txpipe3_invalidrequest;                   
    wire   [5:0]  o_txpipe3_lf;                               
    wire   [4:0]  o_txpipe3_localpresetindex;                 
    wire          o_txpipe3_lowpin_nt;                        
    wire   [7:0]  o_txpipe3_m2p_bus;                          
    wire   [2:0]  o_txpipe3_pclk_rate;                        
    wire          o_txpipe3_pclkchangeack;                    
    wire   [3:0]  o_txpipe3_phy_mode_nt;                      
    wire   [3:0]  o_txpipe3_powerdown;                        
    wire   [2:0]  o_txpipe3_rate;                             
    wire          o_txpipe3_rxelecidle_disable_a;             
    wire          o_txpipe3_rxeqclr;                          
    wire          o_txpipe3_rxeqeval;                         
    wire          o_txpipe3_rxeqinprogress;                   
    wire          o_txpipe3_rxeqtraining;                     
    wire          o_txpipe3_rxpolarity;                       
    wire   [2:0]  o_txpipe3_rxpresethint;                     
    wire          o_txpipe3_rxstandby;                        
    wire          o_txpipe3_rxtermination;                    
    wire          o_txpipe3_srisenable;                       
    wire          o_txpipe3_txcmnmode_disable_a;              
    wire          o_txpipe3_txcompliance;                     
    wire   [39:0] o_txpipe3_txdata;                           
    wire   [3:0]  o_txpipe3_txdatak;                          
    wire          o_txpipe3_txdatavalid;                      
    wire   [17:0] o_txpipe3_txdeemph;                         
    wire          o_txpipe3_txdtctrx_lb;                      
    wire          o_txpipe3_txelecidle;                       
    wire   [2:0]  o_txpipe3_txmargin;                         
    wire          o_txpipe3_txoneszeros;                      
    wire          o_txpipe3_txstartblock;                     
    wire          o_txpipe3_txswing;                          
    wire   [3:0]  o_txpipe3_txsyncheader;                     
    wire   [2:0]  o_txpipe3_width;                            


    wire   [87:0] i_ch0_pcie_ctrl_tx_async;                   
    wire   [7:0]  i_ch0_pcie_ctrl_tx_direct;                  
    wire   [87:0] o_ch0_pcie_ctrl_rx_async;                   
    wire   [7:0]  o_ch0_pcie_ctrl_rx_direct;                  
    wire          i_ch0_rst_pld_clrhip;                       
    wire          i_ch0_rst_pld_clrpcs;                       
    wire          i_ch0_rst_pld_perstn;
    wire          o_pld_pcie_clk_4;
    wire          o_pcs0_pipe_rst_n;                          
    wire          o_pcs1_pipe_rst_n;                          
    wire          o_pcs2_pipe_rst_n;                          
    wire          o_pcs3_pipe_rst_n;                          

//  if {PCIE_GEN4=="PCIE_GEN1" || PCIE_GEN4=="PCIE_GEN2" || PCIE_GEN4=="PCIE_GEN3" || PCIE_GEN4=="PCIE_GEN4"} {

system_intel_pcie_gts_0_pcie_hal_top_one_lane_pcie_hal_2100_ydlnppi one_lane_pcie_inst_0(
    .i_hio_txdata                                   (i_hio_txdata[1]                           ),
    .i_hio_txdata_extra                             (i_hio_txdata_extra[1]                     ),
    .i_hio_txdata_fifo_wr_en                        (i_hio_txdata_fifo_wr_en[1]                ),
    .i_hio_rxdata_fifo_rd_en                        (i_hio_rxdata_fifo_rd_en[1]                ),
    .i_hio_ptp_rst_n                                (i_hio_ptp_rst_n[1]                        ),
    .i_hio_ehip_rx_rst_n                            (i_hio_ehip_rx_rst_n[1]                    ),
    .i_hio_ehip_tx_rst_n                            (i_hio_ehip_tx_rst_n[1]                    ),
    .i_hio_ehip_signal_ok                           (i_hio_ehip_signal_ok[1]                   ),
    .i_hio_sfreeze_2_r03f_rx_mac_srfz_n             (i_hio_sfreeze_2_r03f_rx_mac_srfz_n[1]     ),
    .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n           (i_hio_sfreeze_3_c2f_tx_deskew_srfz_n[1]   ),
    .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n             (i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n[1]     ),
    .i_hio_rstfec_fec_rx_rst_n                      (i_hio_rstfec_fec_rx_rst_n[1]              ),
    .i_hio_rstfec_fec_tx_rst_n                      (i_hio_rstfec_fec_tx_rst_n[1]              ),
    .i_hio_rstfec_fec_csr_ret                       (i_hio_rstfec_fec_csr_ret[1]               ),
    .i_hio_rstfec_rx_fec_sfrz_n                     (i_hio_rstfec_rx_fec_sfrz_n[1]             ),
    .i_hio_rstfec_tx_fec_sfrz_n                     (i_hio_rstfec_tx_fec_sfrz_n[1]             ),
    .i_hio_rstxcvrif_xcvrif_rx_rst_n                (i_hio_rstxcvrif_xcvrif_rx_rst_n[1]        ),
    .i_hio_rstxcvrif_xcvrif_tx_rst_n                (i_hio_rstxcvrif_xcvrif_tx_rst_n[1]        ),
    .i_hio_rstxcvrif_xcvrif_signal_ok               (i_hio_rstxcvrif_xcvrif_signal_ok[1]       ),
    .i_hio_rstxcvrif_rx_xcvrif_sfrz_n               (i_hio_rstxcvrif_rx_xcvrif_sfrz_n[1]       ),
    .i_hio_rstxcvrif_tx_xcvrif_sfrz_n               (i_hio_rstxcvrif_tx_xcvrif_sfrz_n[1]       ),
    .i_hio_rst_pld_clrhip                           (i_hio_rst_pld_clrhip[1]                   ),
    .i_hio_rst_pld_clrpcs                           (i_hio_rst_pld_clrpcs[1]                   ),
    .i_hio_rst_pld_perstn                           (i_hio_rst_pld_perstn[1]                   ),
    .i_hio_rst_pld_ready                            (i_hio_rst_pld_ready[1]                    ),
    .i_hio_rst_pld_adapter_rx_pld_rst_n             (i_hio_rst_pld_adapter_rx_pld_rst_n[1]     ),
    .i_hio_rst_pld_adapter_tx_pld_rst_n             (i_hio_rst_pld_adapter_tx_pld_rst_n[1]     ),
    .i_hio_rst_ux_rx_pma_rst_n                      (i_hio_rst_ux_rx_pma_rst_n[1]              ),
    .i_hio_rst_ux_rx_sfrz                           (i_hio_rst_ux_rx_sfrz[1]                   ),
    .i_hio_rst_ux_tx_pma_rst_n                      (i_hio_rst_ux_tx_pma_rst_n[1]              ),
    .i_hio_pld_reset_clk_row                        (i_hio_pld_reset_clk_row[1]                ),
    .i_hio_uxquad_async                             (i_hio_uxquad_async[1]                     ),
    .i_hio_uxquad_async_pcie_mux                    (i_hio_uxquad_async_pcie_mux[1]            ),

    .i_hio_lavmm_clk                                (i_hio_ch1_lavmm_clk                       ),
    .i_hio_lavmm_rstn                               (i_hio_ch1_lavmm_rstn                      ),
    .i_hio_lavmm_addr                               (i_hio_ch1_lavmm_addr                      ),
    .i_hio_lavmm_be                                 (i_hio_ch1_lavmm_be                        ),
    .i_hio_lavmm_read                               (i_hio_ch1_lavmm_read                      ),
    .i_hio_lavmm_wdata                              (i_hio_ch1_lavmm_wdata                     ),
    .i_hio_lavmm_write                              (i_hio_ch1_lavmm_write                     ),
    .o_hio_lavmm_rdata                              (o_hio_ch1_lavmm_rdata                     ),
    .o_hio_lavmm_rdata_valid                        (o_hio_ch1_lavmm_rdata_valid               ),
    .o_hio_lavmm_waitreq                            (o_hio_ch1_lavmm_waitreq                   ),
    .i_hio_pld_rx_clk_in_row_clk                    (i_hio_ch1_pld_rx_clk_in_row_clk           ),
    .i_hio_pld_tx_clk_in_row_clk                    (i_hio_ch1_pld_tx_clk_in_row_clk           ),
    .i_hio_det_lat_rx_dl_clk                        (i_hio_ch1_det_lat_rx_dl_clk               ),
    .i_hio_det_lat_rx_mux_select                    (i_hio_ch1_det_lat_rx_mux_select           ),
    .i_hio_det_lat_rx_sclk_flop                     (i_hio_ch1_det_lat_rx_sclk_flop            ),
    .i_hio_det_lat_rx_sclk_gen_clk                  (i_hio_ch1_det_lat_rx_sclk_gen_clk         ),
    .i_hio_det_lat_rx_trig_flop                     (i_hio_ch1_det_lat_rx_trig_flop            ),
    .i_hio_det_lat_sampling_clk                     (i_hio_ch1_det_lat_sampling_clk            ),
    .i_hio_det_lat_tx_dl_clk                        (i_hio_ch1_det_lat_tx_dl_clk               ),
    .i_hio_det_lat_tx_mux_select                    (i_hio_ch1_det_lat_tx_mux_select           ),
    .i_hio_det_lat_tx_sclk_flop                     (i_hio_ch1_det_lat_tx_sclk_flop            ),
    .i_hio_det_lat_tx_sclk_gen_clk                  (i_hio_ch1_det_lat_tx_sclk_gen_clk         ),
    .i_hio_det_lat_tx_trig_flop                     (i_hio_ch1_det_lat_tx_trig_flop            ),

    .rx_serial_n                                    (rx_serial_n[0]                            ),
    .rx_serial_p                                    (rx_serial_p[0]                            ),
    //.i_hio_tx_pfc                                   (i_hio_tx_pfc[0]                           ),
    //.i_hio_tx_pause                                 (i_hio_tx_pause[0]                         ),
    //.i_hio_clear_internal                           (i_hio_clear_internal[0]                   ),
    //.i_hio_signal_ok                                (i_hio_signal_ok[0]                        ),
    //.i_hio_pld_ready                                (i_hio_pld_ready[0]                        ),
    //.i_hio_pma_rx_sf                                (i_hio_pma_rx_sf[0]                        ),
    //.i_hio_ch_rstxcvrif_lphy_signal_ok              (i_hio_ch_rstxcvrif_lphy_signal_ok[0]      ),
    //.i_clear_tx_internal_err                        (i_clear_tx_internal_err[0]                ),
    .o_hio_txdata_fifo_wr_empty                     (o_hio_txdata_fifo_wr_empty[1]             ),
    .i_hio_txdata_async                             (i_hio_txdata_async[1]                     ),
    .i_hio_txdata_direct                            (i_hio_txdata_direct[1]                    ),
    .o_hio_rxdata_async                             (o_hio_rxdata_async[1]                     ),
    .o_hio_rxdata_direct                            (o_hio_rxdata_direct[1]                    ),
    .o_hio_txdata_fifo_wr_pempty                    (o_hio_txdata_fifo_wr_pempty[1]            ),
    .o_hio_txdata_fifo_wr_full                      (o_hio_txdata_fifo_wr_full[1]              ),
    .o_hio_txdata_fifo_wr_pfull                     (o_hio_txdata_fifo_wr_pfull[1]             ),
    .o_hio_rxdata                                   (o_hio_rxdata[1]                           ),
    .o_hio_rxdata_extra                             (o_hio_rxdata_extra[1]                     ),
    .o_hio_rxdata_fifo_rd_empty                     (o_hio_rxdata_fifo_rd_empty[1]             ),
    .o_hio_rxdata_fifo_rd_pempty                    (o_hio_rxdata_fifo_rd_pempty[1]            ),
    .o_hio_rxdata_fifo_rd_full                      (o_hio_rxdata_fifo_rd_full[1]              ),
    .o_hio_rxdata_fifo_rd_pfull                     (o_hio_rxdata_fifo_rd_pfull[1]             ),
    .o_hio_rstepcs_rx_pcs_fully_aligned             (o_hio_rstepcs_rx_pcs_fully_aligned[1]     ),
    .o_hio_rstfec_fec_rx_rdy_n                      (o_hio_rstfec_fec_rx_rdy_n[1]              ),
    .o_hio_rst_flux0_cpi_cmn_busy                   (o_hio_rst_flux0_cpi_cmn_busy[1]           ),
    .o_hio_rst_oflux_rx_srds_rdy                    (o_hio_rst_oflux_rx_srds_rdy[1]            ),
    .o_hio_rst_ux_all_synthlockstatus               (o_hio_rst_ux_all_synthlockstatus[1]       ),
    .o_hio_rst_ux_octl_pcs_rxstatus                 (o_hio_rst_ux_octl_pcs_rxstatus[1]         ),
    .o_hio_rst_ux_octl_pcs_txstatus                 (o_hio_rst_ux_octl_pcs_txstatus[1]         ),
    .o_hio_rst_ux_rxcdrlock2data                    (o_hio_rst_ux_rxcdrlock2data[1]            ),
    .o_hio_rst_ux_rxcdrlockstatus                   (o_hio_rst_ux_rxcdrlockstatus[1]           ),
    .o_hio_uxquad_async                             (o_hio_uxquad_async[1]                     ),
    //.k_user_rx_clk1_c0c1c2_sel                      (k_user_rx_clk1_c0c1c2_sel[0]              ),
    //.k_user_rx_clk2_c0c1c2_sel                      (k_user_rx_clk2_c0c1c2_sel[0]              ),
    //.k_user_tx_clk1_c0c1c2_sel                      (k_user_tx_clk1_c0c1c2_sel[0]              ),
    //.k_user_tx_clk2_c0c1c2_sel                      (k_user_tx_clk2_c0c1c2_sel[0]              ),

    .o_hio_user_rx_clk1_clk                         (o_hio_ch1_user_rx_clk1_clk                ),
    .o_hio_user_rx_clk2_clk                         (o_hio_ch1_user_rx_clk2_clk                ),
    .o_hio_user_tx_clk1_clk                         (o_hio_ch1_user_tx_clk1_clk                ),
    .o_hio_user_tx_clk2_clk                         (o_hio_ch1_user_tx_clk2_clk                ),
    .o_hio_ux_chnl_refclk_mux                       (o_hio_ch1_ux_chnl_refclk_mux              ),
    .o_hio_det_lat_rx_async_dl_sync                 (o_hio_ch1_det_lat_rx_async_dl_sync        ),
    .o_hio_det_lat_rx_async_pulse                   (o_hio_ch1_det_lat_rx_async_pulse          ),
    .o_hio_det_lat_rx_async_sample_sync             (o_hio_ch1_det_lat_rx_async_sample_sync    ),
    .o_hio_det_lat_rx_sclk_sample_sync              (o_hio_ch1_det_lat_rx_sclk_sample_sync     ),
    .o_hio_det_lat_rx_trig_sample_sync              (o_hio_ch1_det_lat_rx_trig_sample_sync     ),
    .o_hio_det_lat_tx_async_dl_sync                 (o_hio_ch1_det_lat_tx_async_dl_sync        ),
    .o_hio_det_lat_tx_async_pulse                   (o_hio_ch1_det_lat_tx_async_pulse          ),
    .o_hio_det_lat_tx_async_sample_sync             (o_hio_ch1_det_lat_tx_async_sample_sync    ),
    .o_hio_det_lat_tx_sclk_sample_sync              (o_hio_ch1_det_lat_tx_sclk_sample_sync     ),
    .o_hio_det_lat_tx_trig_sample_sync              (o_hio_ch1_det_lat_tx_trig_sample_sync     ),
    .o_hio_xcvrif_rx_latency_pulse                  (o_hio_ch1_xcvrif_rx_latency_pulse         ),
    .o_hio_xcvrif_tx_latency_pulse                  (o_hio_ch1_xcvrif_tx_latency_pulse         ),

    .tx_serial_p                                    (tx_serial_p[0]                            ),
    .tx_serial_n                                    (tx_serial_n[0]                            ),
   // .o_hio_local_fault                              (o_hio_local_fault[0]                      ),
   // .o_hio_remote_fault                             (o_hio_remote_fault[0]                     ),
   // .o_hio_rx_pause                                 (o_hio_rx_pause[0]                         ),
   // .o_hio_rx_pfc                                   (o_hio_rx_pfc[0]                           ),
   // .o_hio_txfifo_pfull                             (o_hio_txfifo_pfull[0]                     ),
   // .o_hio_dsk_mon_err                              (o_hio_dsk_mon_err[0]                      ),
   // .o_hio_hip_ready                                (o_hio_hip_ready[0]                        ),
   // .o_hio_rx_block_lock                            (o_hio_rx_block_lock[0]                    ),
   // .o_hio_rx_dsk_done                              (o_hio_rx_dsk_done[0]                      ),
   // .o_hio_rx_am_lock                               (o_hio_rx_am_lock[0]                       ),
   // .o_hio_rx_pcs_fully_aligned                     (o_hio_rx_pcs_fully_aligned[0]             ),
   // .o_hio_hi_ber                                   (o_hio_hi_ber[0]                           ),
   // .o_hio_rx_pcs_internal_err                      (o_hio_rx_pcs_internal_err[0]              ),
   // .o_hio_tx_fifo_status_fifo_wr_pfull             (o_hio_tx_fifo_status_fifo_wr_pfull[0]     ),
   // .o_hio_tx_fifo_status_fifo_pempty               (o_hio_tx_fifo_status_fifo_pempty[0]       ),
   // .o_hio_rx_fifo_status_fifo_pempty               (o_hio_rx_fifo_status_fifo_pempty[0]       ),
   // .o_hio_rx_fifo_status_fifo_wr_pfull             (o_hio_rx_fifo_status_fifo_wr_pfull[0]     ),
   // .o_hio_rx_fifo_status_fifo_empty                (o_hio_rx_fifo_status_fifo_empty[0]        ),
   // .o_hio_tx_fifo_status_fifo_empty                (o_hio_tx_fifo_status_fifo_empty[0]        ),
   // .o_hio_rx_fifo_status_gb_restarted              (o_hio_rx_fifo_status_gb_restarted[0]      ),
   // .o_hio_tx_fifo_status_gb_restarted              (o_hio_tx_fifo_status_gb_restarted[0]      ),
    
    .i_uxwrap_bus_in_phy_shared                     (uxwrap_bus_in_phy_shared[0]              ),      //ipfluxtop_uxtop_wrap signals to phy_hal_shared
    .o_uxwrap_bus_out_phy_shared                    (uxwrap_bus_out_phy_shared[0]             ),
    //.o_flux_sclk_mux_phy_shared                   (flux_sclk_mux_phy_shared[0]                ),    //sm_flux_ingress_signals to phy_hal_shared////not used, should i remove 
    //.i_ss_async_pldif_phy_shared                  (ss_async_pldif_phy_shared[0]               ),    //sm_flux_ingress_signals to phy_hal_shared 
    //.o_ss_async_pldif_phy_shared                    (ss_async_pldif_phy_shared[0]             ),    
    //.i_ss_async_pldif_pcie_mux_phy_shared           (ss_async_pldif_pcie_mux_phy_shared[0]    ),    
    .o_lavmm_addr_phy_shared                        (lavmm_addr_phy_shared[0]                 ),
    .o_lavmm_be_phy_shared                          (lavmm_be_phy_shared[0]                   ),
    .o_lavmm_clk_phy_shared                         (lavmm_clk_phy_shared[0]                  ),
    .o_lavmm_read_phy_shared                        (lavmm_read_phy_shared[0]                 ),
    .o_lavmm_rstn_phy_shared                        (lavmm_rstn_phy_shared[0]                 ),
    .o_lavmm_wdata_phy_shared                       (lavmm_wdata_phy_shared[0]                ),
    .o_lavmm_write_phy_shared                       (lavmm_write_phy_shared[0]                ),
    .i_lavmm_rdata_phy_shared                       (lavmm_rdata_phy_shared[0]                ),
    .i_lavmm_rdata_valid_phy_shared                 (lavmm_rdata_valid_phy_shared[0]          ),
    .i_lavmm_waitreq_phy_shared                     (lavmm_waitreq_phy_shared[0]              ),
    //.i_rxpstate_phy_shared                          (rxpstate_phy_shared[0]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxrate_phy_shared                            (rxrate_phy_shared[0]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxterm_hiz_ena_phy_shared                    (rxterm_hiz_ena_phy_shared[0]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxwidth_phy_shared                           (rxwidth_phy_shared[0]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_tstbus_lane_phy_shared                       (tstbus_lane_phy_shared[0]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txbeacona_phy_shared                         (txbeacona_phy_shared[0]                  ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txclkdivrate_phy_shared                      (txclkdivrate_phy_shared[0]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdetectrx_reqa_phy_shared                   (txdetectrx_reqa_phy_shared[0]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levn_phy_shared                        (txdrv_levn_phy_shared[0]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm1_phy_shared                      (txdrv_levnm1_phy_shared[0]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm2_phy_shared                      (txdrv_levnm2_phy_shared[0]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnp1_phy_shared                      (txdrv_levnp1_phy_shared[0]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_slew_phy_shared                        (txdrv_slew_phy_shared[0]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txelecidle_phy_shared                        (txelecidle_phy_shared[0]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txpstate_phy_shared                          (txpstate_phy_shared[0]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txrate_phy_shared                            (txrate_phy_shared[0]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txwidth_phy_shared                           (txwidth_phy_shared[0]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.o_rxmargin_status_gray_phy_shared              (rxmargin_status_gray_phy_shared[0]       ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rst_ux_rx_sfrz_phy_shared                    (rst_ux_rx_sfrz_phy_shared[0]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_flux0_cpi_cmn_busy_phy_shared            (rst_flux0_cpi_cmn_busy_phy_shared[0]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_oflux_rx_srds_rdy_phy_shared             (rst_oflux_rx_srds_rdy_phy_shared[0]      ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_ux_all_synthlockstatus_phy_shared        (rst_ux_all_synthlockstatus_phy_shared[0] ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_rst_ux_rxcdrlockstatus_phy_shared            (rst_ux_rxcdrlockstatus_phy_shared[0]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_cdrfbclk_phy_shared                  (ock_pcs_cdrfbclk_phy_shared[0]           ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_ref_phy_shared                       (ock_pcs_ref_phy_shared[0]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ux_tx_ch_ptr_smpl_phy_shared                 (ux_tx_ch_ptr_smpl_phy_shared[0]          ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    .o_dat_pcs_measlatrndtripbit_phy_shared         (dat_pcs_measlatrndtripbit_phy_shared[0]  ),        ////Navid sheet says to sm_ux_toolbox, but in toolbox it says to fluxcore, so not added in phy_shared. In sujoys, connected to toolbox. Should I add this to physhared
    .o_sclk_return_sel_rx_phy_shared                (sclk_return_sel_rx_phy_shared[0]         ),
    .o_sclk_return_sel_tx_phy_shared                (sclk_return_sel_tx_phy_shared[0]         ),
    //.i_ick_sclk_rx_phy_shared                       (s_i_ick_sclk_rx_phy_shared[0]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.i_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[0]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    .o_ick_sclk_rx_phy_shared                       (s_o_ick_sclk_rx_phy_shared[0]            ),
    .i_sync_common_control_phy_shared               (sync_common_control_phy_shared[0]        ),
    
    .o_ft_rx_sclk_sync_ch_phy_shared                (ft_rx_sclk_sync_ch_phy_shared[0]            ) ,
    .o_ft_tx_sclk_sync_ch_phy_shared                (ft_tx_sclk_sync_ch_phy_shared[0]            ) ,
    .o_rst_ux_rx_pma_rst_n_phy_shared               (rst_ux_rx_pma_rst_n_phy_shared[0]           ) ,
    .o_rst_ux_tx_pma_rst_n_phy_shared               (rst_ux_tx_pma_rst_n_phy_shared[0]           ) ,
    .o_ick_pcs_txword_phy_shared                    (ick_pcs_txword_phy_shared[0]                ) ,
    .o_tx_dl_ch_bit_phy_shared                      (tx_dl_ch_bit_phy_shared[0]                  ) ,
    .i_dat_pcs_measlatbit_phy_shared                (dat_pcs_measlatbit_phy_shared[0]            ) ,
    .i_ft_rx_async_pulse_ch_phy_shared              (ft_rx_async_pulse_ch_phy_shared[0]          ) ,
    .i_ft_tx_async_pulse_ch_phy_shared              (ft_tx_async_pulse_ch_phy_shared[0]          ) ,
    .i_rx_dl_ch_bit_phy_shared                      (rx_dl_ch_bit_phy_shared[0]                  ) ,
    .i_ux_rxuser1_sel_phy_shared                    (ux_rxuser1_sel_phy_shared[0]                ) ,
    .i_ux_rxuser2_sel_phy_shared                    (ux_rxuser2_sel_phy_shared[0]                ) ,
    .i_ux_txuser1_sel_phy_shared                    (ux_txuser1_sel_phy_shared[0]                ) ,
    .i_ux_txuser2_sel_phy_shared                    (ux_txuser2_sel_phy_shared[0]                ) ,
    .o_octl_pcs_txstatus_a_phy_shared               (octl_pcs_txstatus_a_phy_shared[0]           ) ,
    .i_ictl_pcs_txenable_a_phy_shared               (ictl_pcs_txenable_a_phy_shared[0]           ) ,
    .i_sync_cfg_data_phy_shared                     (sync_cfg_data_phy_shared[0]                 ) ,
    .i_sync_interface_control_phy_shared            (sync_interface_control_phy_shared[0]        ) ,
    .o_tx_data_phy_shared                           (tx_data_phy_shared[0]                       ) ,
    .i_rx_data_phy_shared                           (rx_data_phy_shared[0]                       ) ,
    .o_sm_flux_ingress_phy_shared                   (sm_flux_ingress_phy_shared[0]               ) ,
    .i_sm_flux_egress_phy_shared                    (sm_flux_egress_phy_shared[0]                ) ,
    .i_flux_cpi_int_phy_shared                      (flux_cpi_int_phy_shared                               ) ,      //only one bit needed
    .i_flux_int_phy_shared                          (flux_int_phy_shared[0]                      ) ,
    .i_oflux_octl_pcs_txptr_smpl_lane_phy_shared    (oflux_octl_pcs_txptr_smpl_lane_phy_shared[0]) ,
    .o_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[0]                   ) ,
    .i_flux_srds_rdy_phy_shared                     (flux_srds_rdy_phy_shared[0]                 ) ,
    .i_pcs_rxword_phy_shared                        (pcs_rxword_phy_shared[0]                    ) ,
    .i_pcs_rxpostdiv_phy_shared                     (pcs_rxpostdiv_phy_shared[0]                 ) ,
    .i_ock_pcs_txword_phy_shared                    (ock_pcs_txword_phy_shared[0]                ) ,

//    .o_ch_lavmm_fec_addr_fec_wrap                   (ch_lavmm_fec_addr_fec_wrap[0]),
//    .o_ch_lavmm_fec_be_fec_wrap                     (ch_lavmm_fec_be_fec_wrap[0]),
//    .o_ch_lavmm_fec_clk_fec_wrap                    (ch_lavmm_fec_clk_fec_wrap[0]),
//    .o_ch_lavmm_fec_read_fec_wrap                   (ch_lavmm_fec_read_fec_wrap[0]),
//    .o_ch_lavmm_fec_rstn_fec_wrap                   (ch_lavmm_fec_rstn_fec_wrap[0]),
//    .o_ch_lavmm_fec_wdata_fec_wrap                  (ch_lavmm_fec_wdata_fec_wrap[0]),
//    .o_ch_lavmm_fec_write_fec_wrap                  (ch_lavmm_fec_write_fec_wrap[0]),
//    .i_ch_lavmm_fec_rdata_fec_wrap                  (ch_lavmm_fec_rdata_fec_wrap[0]),
//    .i_ch_lavmm_fec_rdata_valid_fec_wrap            (ch_lavmm_fec_rdata_valid_fec_wrap[0]),
//    .i_ch_lavmm_fec_waitreq_fec_wrap                (ch_lavmm_fec_waitreq_fec_wrap[0]),
    .i_ch_eth_fec_rx_async_fec_wrap                 (ch_eth_fec_rx_async_fec_wrap[0]),
    .i_ch_eth_fec_rx_direct_fec_wrap                (ch_eth_fec_rx_direct_fec_wrap[0]),
//    .o_ch_eth_fec_tx_async_fec_wrap                 (ch_eth_fec_tx_async_fec_wrap[0]),
//    .o_ch_eth_fec_tx_direct_fec_wrap                (ch_eth_fec_tx_direct_fec_wrap[0]),
//    .o_rstfec_fec_csr_ret_fec_wrap                  (rstfec_fec_csr_ret_fec_wrap[0]),
    .i_fec_rx_rdy_n_fec_wrap                        (fec_rx_rdy_n_fec_wrap[0]),
//    .o_rstfec_fec_rx_rst_n_fec_wrap                 (rstfec_fec_rx_rst_n_fec_wrap[0]),
//    .o_rstfec_fec_tx_rst_n_fec_wrap                 (rstfec_fec_tx_rst_n_fec_wrap[0]),
//    .o_rstfec_rx_fec_sfrz_n_fec_wrap                (rstfec_rx_fec_sfrz_n_fec_wrap[0]),
//    .o_rstfec_tx_fec_sfrz_n_fec_wrap                (rstfec_tx_fec_sfrz_n_fec_wrap[0]),
    .i_fec_tx_data_mux_sel_fec_wrap                 (fec_tx_data_mux_sel_fec_wrap[0]),
    .i_fec_rx_data_fec_wrap                         (fec_rx_data_fec_wrap[0]),
//    .o_fec_i_tx_mux_data_fec_wrap                   (fec_i_tx_mux_data_fec_wrap[0]),
//    .o_xcvr_rx_data                                 (xcvr_rx_data[0]),
    .i_xcvr_tx_data                                 (xcvr_tx_data[0]),
    .ss_rst_flux0_cpi_cmn_busy                      (ss_rst_flux0_cpi_cmn_busy[0]),
    .o_pma_rx_sf                                    (pma_rx_sf[0]),

    .i_refclk_tx_p                                  (i_refclk_tx_p   ),
//    .i_refclk_tx_n                                  (i_refclk_tx_n   ),//can derive as negated i_refclk_tx_p
    .i_syspll_c0_clk                                (i_syspll_c0_clk ),
    .i_syspll_c1_clk                                (i_syspll_c1_clk ),
    .i_syspll_c2_clk                                (i_syspll_c2_clk ),
    .i_flux_clk                                     (i_flux_clk      ),
    .i_refclk_rx_p                                  (i_refclk_rx_p   ),
//    .i_refclk_rx_n                                  (i_refclk_rx_n   ),

    .i_ux_chnl_refclk_mux_phy_shared                (sm_flux_egress_phy_shared[0][193]),
    .o_xcvrif_tx_fifo_rd_en_mux_x1                  (xcvrif_tx_fifo_rd_en_mux_x1[0]),
    .i_xcvrif_tx_fifo_rd_en_mux_x2                  (xcvrif_tx_fifo_rd_en_mux_x2[0]),
    .i_xcvrif_tx_fifo_rd_en_mux_x4                  (xcvrif_tx_fifo_rd_en_mux_x4[0]),
    .i_xcvrif_tx_fifo_rd_en_mux_x6_bot              (xcvrif_tx_fifo_rd_en_mux_x6_bot[0]),
    .i_xcvrif_tx_fifo_rd_en_mux_x6_top              (xcvrif_tx_fifo_rd_en_mux_x6_top[0]),
    .i_xcvrif_tx_fifo_rd_en_mux_x8_bot              (xcvrif_tx_fifo_rd_en_mux_x8_bot[0]),
    .i_xcvrif_tx_fifo_rd_en_mux_x8_top              (xcvrif_tx_fifo_rd_en_mux_x8_top[0]),
    .o_xcvrif_tx_rst_mux_x1                         (xcvrif_tx_rst_mux_x1[0]),
    .i_xcvrif_tx_rst_mux_x2                         (xcvrif_tx_rst_mux_x2[0]),
    .i_xcvrif_tx_rst_mux_x4                         (xcvrif_tx_rst_mux_x4[0]),
    .i_xcvrif_tx_rst_mux_x6_bot                     (xcvrif_tx_rst_mux_x6_bot[0]),
    .i_xcvrif_tx_rst_mux_x6_top                     (xcvrif_tx_rst_mux_x6_top[0]),
    .i_xcvrif_tx_rst_mux_x8_bot                     (xcvrif_tx_rst_mux_x8_bot[0]),
    .i_xcvrif_tx_rst_mux_x8_top                     (xcvrif_tx_rst_mux_x8_top[0]),
    .o_xcvrif_tx_word_clk_mux_x1                    (xcvrif_tx_word_clk_mux_x1[0]),
    .i_xcvrif_tx_word_clk_mux_x2                    (xcvrif_tx_word_clk_mux_x2[0]),
    .i_xcvrif_tx_word_clk_mux_x4                    (xcvrif_tx_word_clk_mux_x4[0]),
    .i_xcvrif_tx_word_clk_mux_x6_bot                (xcvrif_tx_word_clk_mux_x6_bot[0]),
    .i_xcvrif_tx_word_clk_mux_x6_top                (xcvrif_tx_word_clk_mux_x6_top[0]),
    .i_xcvrif_tx_word_clk_mux_x8_bot                (xcvrif_tx_word_clk_mux_x8_bot[0]),
    .i_xcvrif_tx_word_clk_mux_x8_top                (xcvrif_tx_word_clk_mux_x8_top[0]),
    .ioack_cdrdiv_left_ux_bidir_in                  ('b0),
    .ioack_synthdiv1_left_ux_bidir_in               (ioack_synthdiv1_left_ux_bidir_in_reg[0]),
    .ioack_synthdiv2_left_ux_bidir_in               ('b0),
    .ioack_cdrdiv_left_ux_bidir_out                 (ioack_cdrdiv_left_ux_bidir_out[0]),
    .ioack_synthdiv1_left_ux_bidir_out              (ioack_synthdiv1_left_ux_bidir_out_reg[0]),
    .ioack_synthdiv2_left_ux_bidir_out              (),
//SHUNXIONG EDIT
//    .i_marker_found_up                              (marker_found_up[0]),
//    .i_marker_found_dn                              (marker_found_dn[0]),
//    .o_marker_found                                 (marker_found[0]),
    .o_xcvrif_tx_rst_wr_sync_mux_x1                 (xcvrif_tx_rst_wr_sync_mux_x1[0]),
    .i_xcvrif_tx_rst_wr_sync_mux_x2                 (xcvrif_tx_rst_wr_sync_mux_x2[0]),
    .i_xcvrif_tx_rst_wr_sync_mux_x4                 (xcvrif_tx_rst_wr_sync_mux_x4[0]),
    .i_xcvrif_tx_rst_wr_sync_mux_x6_bot             (xcvrif_tx_rst_wr_sync_mux_x6_bot[0]),
    .i_xcvrif_tx_rst_wr_sync_mux_x6_top             (xcvrif_tx_rst_wr_sync_mux_x6_top[0]),
    .i_xcvrif_tx_rst_wr_sync_mux_x8_bot             (xcvrif_tx_rst_wr_sync_mux_x8_bot[0]),
    .i_xcvrif_tx_rst_wr_sync_mux_x8_top             (xcvrif_tx_rst_wr_sync_mux_x8_top[0]),

    .ss_user_rx_clk1_clk                            (ss_user_rx_clk1_clk[1]),
    .ss_user_rx_clk2_clk                            (ss_user_rx_clk2_clk[1]),
    .ss_user_tx_clk1_clk                            (ss_user_tx_clk1_clk[1]),
    .ss_user_tx_clk2_clk                            (ss_user_tx_clk2_clk[1]),
    .ss_user_rx_clk1_clk_w                          (ss_user_rx_clk1_clk_w[1]), //KAHUAT_EDIT
    .ss_user_rx_clk2_clk_w                          (ss_user_rx_clk2_clk_w[1]), //KAHUAT_EDIT
    .ss_user_tx_clk1_clk_w                          (ss_user_tx_clk1_clk_w[1]), //KAHUAT_EDIT
    .ss_user_tx_clk2_clk_w                          (ss_user_tx_clk2_clk_w[1]), //KAHUAT_EDIT
    .o_hio_ux_tx_ch_ptr_smpl                        (o_hio_ux_tx_ch_ptr_smpl[1]),

//KAHUAT_EDIT
    .o_ss_lavmm_pcie_addr                           (i_ch0_lavmm_pcie_addr[16:0]),
    .o_ss_lavmm_pcie_be                             (i_ch0_lavmm_pcie_be[3:0]),
    .o_ss_lavmm_pcie_clk                            (i_ch0_lavmm_pcie_clk),
    .o_ss_lavmm_pcie_read                           (i_ch0_lavmm_pcie_read),
    .o_ss_lavmm_pcie_rstn                           (i_ch0_lavmm_pcie_rstn),
    .o_ss_lavmm_pcie_wdata                          (i_ch0_lavmm_pcie_wdata[31:0]),
    .o_ss_lavmm_pcie_write                          (i_ch0_lavmm_pcie_write),
    .sm_pld_tx_demux_0_o_pcie                       (i_ch1_tx_data),
    .i_ss_lavmm_pcie_rdata                          (o_ch0_lavmm_pcie_rdata[31:0]),
    .i_ss_lavmm_pcie_rdata_valid                    (o_ch0_lavmm_pcie_rdata_valid),
    .i_ss_lavmm_pcie_waitreq                        (o_ch0_lavmm_pcie_waitreq),
    .sm_pld_rx_mux_0_i_pcie                         (o_ch1_rx_data),
    .o_pld_pcie_clk_4                               (o_pld_pcie_clk_4),

    .o_pcie_rxword_clk                              (i_ch0_pcie_rxword_clk),
    .o_pcie_txword_clk                              (i_ch0_pcie_txword_clk),
    .ss_rst_ux_rxcdrlock2data                       (i_ch0_uxq_rxcdrlock2dataa),
    .o_rxeq_best_eye_vala                           (i_ch0_uxq_rxeq_best_eye_vala[13:0]),
    .o_rxeq_donea                                   (i_ch0_uxq_rxeq_donea),
    .o_rxmargin_nacka                               (i_ch0_uxq_rxmargin_nacka),
    .o_rxmargin_statusa                             (i_ch0_uxq_rxmargin_statusa),
    .o_rxsignaldetect_lfpsa                         (i_ch0_uxq_rxsignaldetect_lfpsa),
    .o_rxsignaldetecta                              (i_ch0_uxq_rxsignaldetecta),
    .o_rxmargin_status_gray                         (i_ch0_uxq_rxmargin_status_gray_a[1:0]),
    .rxstatusa                                      (i_ch0_uxq_rxstatusa),
    .o_pcie_pcs                                     (i_ch0_uxq_rxword[39:0]),
    .o_synthlcfast_postdiv                          (i_ch0_uxq_synthlcfast_postdiv),
    .o_synthlcmed_postdiv                           (i_ch0_uxq_synthlcmed_postdiv),
    .o_synthlcslow_postdiv                          (i_ch0_uxq_synthlcslow_postdiv),
    .o_txdetectrx_acka                              (i_ch0_uxq_txdetectrx_acka),
    .o_txdetectrx_statct                            (i_ch0_uxq_txdetectrx_statct),
    .txstatusa                                      (i_ch0_uxq_txstatusa),
    .i_pcs_pipe_rstn                                (o_ch0_pcs_pipe_rstn),
    .i_ux_ock_pma_clk                               (o_ch0_ux_ock_pma_clk),
    .i_lfps_ennt                                    (o_ch0_uxq_lfps_ennt),
    .i_pcie_l1ctrla                                 (o_ch0_uxq_pcie_l1ctrla[1:0]),
    .i_pma_cmn_ctrl                                 (o_ch0_uxq_pma_cmn_ctrl),
    .i_pma_ctrl                                     (o_ch0_uxq_pma_ctrl),
    .i_pcie_pcs_rx_rst                              (o_ch0_uxq_rst_pcs_rx_b_a),
    .i_pcie_pcs_tx_rst                              (o_ch0_uxq_rst_pcs_tx_b_a),
    .i_rxeiosdetectstata                            (o_ch0_uxq_rxeiosdetectstata),
    .i_rxeq_precal_code_selnt                       (o_ch0_uxq_rxeq_precal_code_selnt[2:0]),
    .i_rxeq_starta                                  (o_ch0_uxq_rxeq_starta),
    .i_rxeq_static_ena                              (o_ch0_uxq_rxeq_static_ena),
    .i_rxmargin_direction_nt                        (o_ch0_uxq_rxmargin_direction_nt),
    .i_rxmargin_offset_change_a                     (o_ch0_uxq_rxmargin_offset_change_a),
    .i_rxmargin_mode_nt                             (o_ch0_uxq_rxmargin_mode_nt),
    .i_rxmargin_offset_nt                           (o_ch0_uxq_rxmargin_offset_nt[6:0]),
    .i_rxmargin_start_a                             (o_ch0_uxq_rxmargin_start_a),
    .i_rxpstate                                     (o_ch0_uxq_rxpstate[2:0]),
    .i_rxrate                                       (o_ch0_uxq_rxrate[3:0]),
    .i_rxterm_hiz_ena                               (o_ch0_uxq_rxterm_hiz_ena),
    .i_rxwidth                                      (o_ch0_uxq_rxwidth[2:0]),
    .i_tstbus_lane                                  (o_ch0_uxq_tstbus_lane),
    .i_txbeacona                                    (o_ch0_uxq_txbeacona),
    .i_txclkdivrate                                 (o_ch0_uxq_txclkdivrate[2:0]),
    .i_txdetectrx_reqa                              (o_ch0_uxq_txdetectrx_reqa),
    .i_txdrv_levn                                   (o_ch0_uxq_txdrv_levn[5:0]),
    .i_txdrv_levnm1                                 (o_ch0_uxq_txdrv_levnm1[4:0]),
    .i_txdrv_levnm2                                 (o_ch0_uxq_txdrv_levnm2[2:0]),
    .i_txdrv_levnp1                                 (o_ch0_uxq_txdrv_levnp1[4:0]),
    .i_txdrv_slew                                   (o_ch0_uxq_txdrv_slew[3:0]),
    .i_txelecidle                                   (o_ch0_uxq_txelecidle[3:0]),
    .i_txpstate                                     (o_ch0_uxq_txpstate[2:0]),
    .i_txrate                                       (o_ch0_uxq_txrate[3:0]),
    .i_txwidth                                      (o_ch0_uxq_txwidth[2:0]),
    .i_pcie_pcs                                     (o_ch0_uxq_txword[39:0])
);
//  } else {
//  one_lane_hal_top_p0 one_lane_inst_0(
//    .i_hio_txdata                                   (i_hio_txdata[0]                           ),
//    .i_hio_txdata_extra                             (i_hio_txdata_extra[0]                     ),
//    .i_hio_txdata_fifo_wr_en                        (i_hio_txdata_fifo_wr_en[0]                ),
//    .i_hio_rxdata_fifo_rd_en                        (i_hio_rxdata_fifo_rd_en[0]                ),
//    .i_hio_ptp_rst_n                                (i_hio_ptp_rst_n[0]                        ),
//    .i_hio_ehip_rx_rst_n                            (i_hio_ehip_rx_rst_n[0]                    ),
//    .i_hio_ehip_tx_rst_n                            (i_hio_ehip_tx_rst_n[0]                    ),
//    .i_hio_ehip_signal_ok                           (i_hio_ehip_signal_ok[0]                   ),
//    .i_hio_sfreeze_2_r03f_rx_mac_srfz_n             (i_hio_sfreeze_2_r03f_rx_mac_srfz_n[0]     ),
//    .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n           (i_hio_sfreeze_3_c2f_tx_deskew_srfz_n[0]   ),
//    .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n             (i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n[0]     ),
//    .i_hio_rstfec_fec_rx_rst_n                      (i_hio_rstfec_fec_rx_rst_n[0]              ),
//    .i_hio_rstfec_fec_tx_rst_n                      (i_hio_rstfec_fec_tx_rst_n[0]              ),
//    .i_hio_rstfec_fec_csr_ret                       (i_hio_rstfec_fec_csr_ret[0]               ),
//    .i_hio_rstfec_rx_fec_sfrz_n                     (i_hio_rstfec_rx_fec_sfrz_n[0]             ),
//    .i_hio_rstfec_tx_fec_sfrz_n                     (i_hio_rstfec_tx_fec_sfrz_n[0]             ),
//    .i_hio_rstxcvrif_xcvrif_rx_rst_n                (i_hio_rstxcvrif_xcvrif_rx_rst_n[0]        ),
//    .i_hio_rstxcvrif_xcvrif_tx_rst_n                (i_hio_rstxcvrif_xcvrif_tx_rst_n[0]        ),
//    .i_hio_rstxcvrif_xcvrif_signal_ok               (i_hio_rstxcvrif_xcvrif_signal_ok[0]       ),
//    .i_hio_rstxcvrif_rx_xcvrif_sfrz_n               (i_hio_rstxcvrif_rx_xcvrif_sfrz_n[0]       ),
//    .i_hio_rstxcvrif_tx_xcvrif_sfrz_n               (i_hio_rstxcvrif_tx_xcvrif_sfrz_n[0]       ),
//    .i_hio_rst_pld_clrhip                           (i_hio_rst_pld_clrhip[0]                   ),
//    .i_hio_rst_pld_clrpcs                           (i_hio_rst_pld_clrpcs[0]                   ),
//    .i_hio_rst_pld_perstn                           (i_hio_rst_pld_perstn[0]                   ),
//    .i_hio_rst_pld_ready                            (i_hio_rst_pld_ready[0]                    ),
//    .i_hio_rst_pld_adapter_rx_pld_rst_n             (i_hio_rst_pld_adapter_rx_pld_rst_n[0]     ),
//    .i_hio_rst_pld_adapter_tx_pld_rst_n             (i_hio_rst_pld_adapter_tx_pld_rst_n[0]     ),
//    .i_hio_rst_ux_rx_pma_rst_n                      (i_hio_rst_ux_rx_pma_rst_n[0]              ),
//    .i_hio_rst_ux_rx_sfrz                           (i_hio_rst_ux_rx_sfrz[0]                   ),
//    .i_hio_rst_ux_tx_pma_rst_n                      (i_hio_rst_ux_tx_pma_rst_n[0]              ),
//    .i_hio_pld_reset_clk_row                        (i_hio_pld_reset_clk_row[0]                ),
//    .i_hio_uxquad_async                             (i_hio_uxquad_async[0]                     ),
//    .i_hio_uxquad_async_pcie_mux                    (i_hio_uxquad_async_pcie_mux[0]            ),
//
//    .i_hio_lavmm_clk                                (i_hio_ch0_lavmm_clk                       ),
//    .i_hio_lavmm_rstn                               (i_hio_ch0_lavmm_rstn                      ),
//    .i_hio_lavmm_addr                               (i_hio_ch0_lavmm_addr                      ),
//    .i_hio_lavmm_be                                 (i_hio_ch0_lavmm_be                        ),
//    .i_hio_lavmm_read                               (i_hio_ch0_lavmm_read                      ),
//    .i_hio_lavmm_wdata                              (i_hio_ch0_lavmm_wdata                     ),
//    .i_hio_lavmm_write                              (i_hio_ch0_lavmm_write                     ),
//    .o_hio_lavmm_rdata                              (o_hio_ch0_lavmm_rdata                     ),
//    .o_hio_lavmm_rdata_valid                        (o_hio_ch0_lavmm_rdata_valid               ),
//    .o_hio_lavmm_waitreq                            (o_hio_ch0_lavmm_waitreq                   ),
//    .i_hio_pld_rx_clk_in_row_clk                    (i_hio_ch0_pld_rx_clk_in_row_clk           ),
//    .i_hio_pld_tx_clk_in_row_clk                    (i_hio_ch0_pld_tx_clk_in_row_clk           ),
//    .i_hio_det_lat_rx_dl_clk                        (i_hio_ch0_det_lat_rx_dl_clk               ),
//    .i_hio_det_lat_rx_mux_select                    (i_hio_ch0_det_lat_rx_mux_select           ),
//    .i_hio_det_lat_rx_sclk_flop                     (i_hio_ch0_det_lat_rx_sclk_flop            ),
//    .i_hio_det_lat_rx_sclk_gen_clk                  (i_hio_ch0_det_lat_rx_sclk_gen_clk         ),
//    .i_hio_det_lat_rx_trig_flop                     (i_hio_ch0_det_lat_rx_trig_flop            ),
//    .i_hio_det_lat_sampling_clk                     (i_hio_ch0_det_lat_sampling_clk            ),
//    .i_hio_det_lat_tx_dl_clk                        (i_hio_ch0_det_lat_tx_dl_clk               ),
//    .i_hio_det_lat_tx_mux_select                    (i_hio_ch0_det_lat_tx_mux_select           ),
//    .i_hio_det_lat_tx_sclk_flop                     (i_hio_ch0_det_lat_tx_sclk_flop            ),
//    .i_hio_det_lat_tx_sclk_gen_clk                  (i_hio_ch0_det_lat_tx_sclk_gen_clk         ),
//    .i_hio_det_lat_tx_trig_flop                     (i_hio_ch0_det_lat_tx_trig_flop            ),
//
//    .rx_serial_n                                    (rx_serial_n[0]                            ),
//    .rx_serial_p                                    (rx_serial_p[0]                            ),
    //.i_hio_tx_pfc                                   (i_hio_tx_pfc[0]                           ),
    //.i_hio_tx_pause                                 (i_hio_tx_pause[0]                         ),
    //.i_hio_clear_internal                           (i_hio_clear_internal[0]                   ),
    //.i_hio_signal_ok                                (i_hio_signal_ok[0]                        ),
    //.i_hio_pld_ready                                (i_hio_pld_ready[0]                        ),
    //.i_hio_pma_rx_sf                                (i_hio_pma_rx_sf[0]                        ),
    //.i_hio_ch_rstxcvrif_lphy_signal_ok              (i_hio_ch_rstxcvrif_lphy_signal_ok[0]      ),
    //.i_clear_tx_internal_err                        (i_clear_tx_internal_err[0]                ),
//    .o_hio_txdata_fifo_wr_empty                     (o_hio_txdata_fifo_wr_empty[0]             ),
//    .i_hio_txdata_async                             (i_hio_txdata_async [0]                    ),
//    .i_hio_txdata_direct                            (i_hio_txdata_direct[0]                    ),
//    .o_hio_rxdata_async                             (o_hio_rxdata_async [0]                    ),
//    .o_hio_rxdata_direct                            (o_hio_rxdata_direct[0]                    ),
//    .o_hio_txdata_fifo_wr_pempty                    (o_hio_txdata_fifo_wr_pempty[0]            ),
//    .o_hio_txdata_fifo_wr_full                      (o_hio_txdata_fifo_wr_full[0]              ),
//    .o_hio_txdata_fifo_wr_pfull                     (o_hio_txdata_fifo_wr_pfull[0]             ),
//    .o_hio_rxdata                                   (o_hio_rxdata[0]                           ),
//    .o_hio_rxdata_extra                             (o_hio_rxdata_extra[0]                     ),
//    .o_hio_rxdata_fifo_rd_empty                     (o_hio_rxdata_fifo_rd_empty[0]             ),
//    .o_hio_rxdata_fifo_rd_pempty                    (o_hio_rxdata_fifo_rd_pempty[0]            ),
//    .o_hio_rxdata_fifo_rd_full                      (o_hio_rxdata_fifo_rd_full[0]              ),
//    .o_hio_rxdata_fifo_rd_pfull                     (o_hio_rxdata_fifo_rd_pfull[0]             ),
//    .o_hio_rstepcs_rx_pcs_fully_aligned             (o_hio_rstepcs_rx_pcs_fully_aligned[0]     ),
//    .o_hio_rstfec_fec_rx_rdy_n                      (o_hio_rstfec_fec_rx_rdy_n[0]              ),
//    .o_hio_rst_flux0_cpi_cmn_busy                   (o_hio_rst_flux0_cpi_cmn_busy[0]           ),
//    .o_hio_rst_oflux_rx_srds_rdy                    (o_hio_rst_oflux_rx_srds_rdy[0]            ),
//    .o_hio_rst_ux_all_synthlockstatus               (o_hio_rst_ux_all_synthlockstatus[0]       ),
//    .o_hio_rst_ux_octl_pcs_rxstatus                 (o_hio_rst_ux_octl_pcs_rxstatus[0]         ),
//    .o_hio_rst_ux_octl_pcs_txstatus                 (o_hio_rst_ux_octl_pcs_txstatus[0]         ),
//    .o_hio_rst_ux_rxcdrlock2data                    (o_hio_rst_ux_rxcdrlock2data[0]            ),
//    .o_hio_rst_ux_rxcdrlockstatus                   (o_hio_rst_ux_rxcdrlockstatus[0]           ),
//    .o_hio_uxquad_async                             (o_hio_uxquad_async[0]                     ),
    //.k_user_rx_clk1_c0c1c2_sel                      (k_user_rx_clk1_c0c1c2_sel[0]              ),
    //.k_user_rx_clk2_c0c1c2_sel                      (k_user_rx_clk2_c0c1c2_sel[0]              ),
    //.k_user_tx_clk1_c0c1c2_sel                      (k_user_tx_clk1_c0c1c2_sel[0]              ),
    //.k_user_tx_clk2_c0c1c2_sel                      (k_user_tx_clk2_c0c1c2_sel[0]              ),
//
//    .o_hio_user_rx_clk1_clk                         (o_hio_ch0_user_rx_clk1_clk                ),
//    .o_hio_user_rx_clk2_clk                         (o_hio_ch0_user_rx_clk2_clk                ),
//    .o_hio_user_tx_clk1_clk                         (o_hio_ch0_user_tx_clk1_clk                ),
//    .o_hio_user_tx_clk2_clk                         (o_hio_ch0_user_tx_clk2_clk                ),
//    .o_hio_ux_chnl_refclk_mux                       (o_hio_ch0_ux_chnl_refclk_mux              ),
//    .o_hio_det_lat_rx_async_dl_sync                 (o_hio_ch0_det_lat_rx_async_dl_sync        ),
//    .o_hio_det_lat_rx_async_pulse                   (o_hio_ch0_det_lat_rx_async_pulse          ),
//    .o_hio_det_lat_rx_async_sample_sync             (o_hio_ch0_det_lat_rx_async_sample_sync    ),
//    .o_hio_det_lat_rx_sclk_sample_sync              (o_hio_ch0_det_lat_rx_sclk_sample_sync     ),
//    .o_hio_det_lat_rx_trig_sample_sync              (o_hio_ch0_det_lat_rx_trig_sample_sync     ),
//    .o_hio_det_lat_tx_async_dl_sync                 (o_hio_ch0_det_lat_tx_async_dl_sync        ),
//    .o_hio_det_lat_tx_async_pulse                   (o_hio_ch0_det_lat_tx_async_pulse          ),
//    .o_hio_det_lat_tx_async_sample_sync             (o_hio_ch0_det_lat_tx_async_sample_sync    ),
//    .o_hio_det_lat_tx_sclk_sample_sync              (o_hio_ch0_det_lat_tx_sclk_sample_sync     ),
//    .o_hio_det_lat_tx_trig_sample_sync              (o_hio_ch0_det_lat_tx_trig_sample_sync     ),
//    .o_hio_xcvrif_rx_latency_pulse                  (o_hio_ch0_xcvrif_rx_latency_pulse         ),
//    .o_hio_xcvrif_tx_latency_pulse                  (o_hio_ch0_xcvrif_tx_latency_pulse         ),
//
//    .tx_serial_p                                    (tx_serial_p[0]                            ),
//    .tx_serial_n                                    (tx_serial_n[0]                            ),
   // .o_hio_local_fault                              (o_hio_local_fault[0]                      ),
   // .o_hio_remote_fault                             (o_hio_remote_fault[0]                     ),
   // .o_hio_rx_pause                                 (o_hio_rx_pause[0]                         ),
   // .o_hio_rx_pfc                                   (o_hio_rx_pfc[0]                           ),
   // .o_hio_txfifo_pfull                             (o_hio_txfifo_pfull[0]                     ),
   // .o_hio_dsk_mon_err                              (o_hio_dsk_mon_err[0]                      ),
   // .o_hio_hip_ready                                (o_hio_hip_ready[0]                        ),
   // .o_hio_rx_block_lock                            (o_hio_rx_block_lock[0]                    ),
   // .o_hio_rx_dsk_done                              (o_hio_rx_dsk_done[0]                      ),
   // .o_hio_rx_am_lock                               (o_hio_rx_am_lock[0]                       ),
   // .o_hio_rx_pcs_fully_aligned                     (o_hio_rx_pcs_fully_aligned[0]             ),
   // .o_hio_hi_ber                                   (o_hio_hi_ber[0]                           ),
   // .o_hio_rx_pcs_internal_err                      (o_hio_rx_pcs_internal_err[0]              ),
   // .o_hio_tx_fifo_status_fifo_wr_pfull             (o_hio_tx_fifo_status_fifo_wr_pfull[0]     ),
   // .o_hio_tx_fifo_status_fifo_pempty               (o_hio_tx_fifo_status_fifo_pempty[0]       ),
   // .o_hio_rx_fifo_status_fifo_pempty               (o_hio_rx_fifo_status_fifo_pempty[0]       ),
   // .o_hio_rx_fifo_status_fifo_wr_pfull             (o_hio_rx_fifo_status_fifo_wr_pfull[0]     ),
   // .o_hio_rx_fifo_status_fifo_empty                (o_hio_rx_fifo_status_fifo_empty[0]        ),
   // .o_hio_tx_fifo_status_fifo_empty                (o_hio_tx_fifo_status_fifo_empty[0]        ),
   // .o_hio_rx_fifo_status_gb_restarted              (o_hio_rx_fifo_status_gb_restarted[0]      ),
   // .o_hio_tx_fifo_status_gb_restarted              (o_hio_tx_fifo_status_gb_restarted[0]      ),
    
//    .i_uxwrap_bus_in_phy_shared                     (uxwrap_bus_in_phy_shared[0]              ),      //ipfluxtop_uxtop_wrap signals to phy_hal_shared
//    .o_uxwrap_bus_out_phy_shared                    (uxwrap_bus_out_phy_shared[0]             ),
    //.o_flux_sclk_mux_phy_shared                   (flux_sclk_mux_phy_shared[0]                ),    //sm_flux_ingress_signals to phy_hal_shared////not used, should i remove 
    //.i_ss_async_pldif_phy_shared                  (ss_async_pldif_phy_shared[0]               ),    //sm_flux_ingress_signals to phy_hal_shared 
    //.o_ss_async_pldif_phy_shared                    (ss_async_pldif_phy_shared[0]             ),    
    //.i_ss_async_pldif_pcie_mux_phy_shared           (ss_async_pldif_pcie_mux_phy_shared[0]    ),    
//    .o_lavmm_addr_phy_shared                        (lavmm_addr_phy_shared[0]                 ),
//    .o_lavmm_be_phy_shared                          (lavmm_be_phy_shared[0]                   ),
//    .o_lavmm_clk_phy_shared                         (lavmm_clk_phy_shared[0]                  ),
//    .o_lavmm_read_phy_shared                        (lavmm_read_phy_shared[0]                 ),
//    .o_lavmm_rstn_phy_shared                        (lavmm_rstn_phy_shared[0]                 ),
//    .o_lavmm_wdata_phy_shared                       (lavmm_wdata_phy_shared[0]                ),
//    .o_lavmm_write_phy_shared                       (lavmm_write_phy_shared[0]                ),
//    .i_lavmm_rdata_phy_shared                       (lavmm_rdata_phy_shared[0]                ),
//    .i_lavmm_rdata_valid_phy_shared                 (lavmm_rdata_valid_phy_shared[0]          ),
//    .i_lavmm_waitreq_phy_shared                     (lavmm_waitreq_phy_shared[0]              ),
    //.i_rxpstate_phy_shared                          (rxpstate_phy_shared[0]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxrate_phy_shared                            (rxrate_phy_shared[0]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxterm_hiz_ena_phy_shared                    (rxterm_hiz_ena_phy_shared[0]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxwidth_phy_shared                           (rxwidth_phy_shared[0]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_tstbus_lane_phy_shared                       (tstbus_lane_phy_shared[0]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txbeacona_phy_shared                         (txbeacona_phy_shared[0]                  ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txclkdivrate_phy_shared                      (txclkdivrate_phy_shared[0]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdetectrx_reqa_phy_shared                   (txdetectrx_reqa_phy_shared[0]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levn_phy_shared                        (txdrv_levn_phy_shared[0]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm1_phy_shared                      (txdrv_levnm1_phy_shared[0]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm2_phy_shared                      (txdrv_levnm2_phy_shared[0]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnp1_phy_shared                      (txdrv_levnp1_phy_shared[0]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_slew_phy_shared                        (txdrv_slew_phy_shared[0]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txelecidle_phy_shared                        (txelecidle_phy_shared[0]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txpstate_phy_shared                          (txpstate_phy_shared[0]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txrate_phy_shared                            (txrate_phy_shared[0]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txwidth_phy_shared                           (txwidth_phy_shared[0]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.o_rxmargin_status_gray_phy_shared              (rxmargin_status_gray_phy_shared[0]       ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rst_ux_rx_sfrz_phy_shared                    (rst_ux_rx_sfrz_phy_shared[0]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_flux0_cpi_cmn_busy_phy_shared            (rst_flux0_cpi_cmn_busy_phy_shared[0]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_oflux_rx_srds_rdy_phy_shared             (rst_oflux_rx_srds_rdy_phy_shared[0]      ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_ux_all_synthlockstatus_phy_shared        (rst_ux_all_synthlockstatus_phy_shared[0] ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_rst_ux_rxcdrlockstatus_phy_shared            (rst_ux_rxcdrlockstatus_phy_shared[0]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_cdrfbclk_phy_shared                  (ock_pcs_cdrfbclk_phy_shared[0]           ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_ref_phy_shared                       (ock_pcs_ref_phy_shared[0]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ux_tx_ch_ptr_smpl_phy_shared                 (ux_tx_ch_ptr_smpl_phy_shared[0]          ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
//    .o_dat_pcs_measlatrndtripbit_phy_shared         (dat_pcs_measlatrndtripbit_phy_shared[0]  ),        ////Navid sheet says to sm_ux_toolbox, but in toolbox it says to fluxcore, so not added in phy_shared. In sujoys, connected to toolbox. Should I add this to physhared
//    .o_sclk_return_sel_rx_phy_shared                (sclk_return_sel_rx_phy_shared[0]         ),
//    .o_sclk_return_sel_tx_phy_shared                (sclk_return_sel_tx_phy_shared[0]         ),
    //.i_ick_sclk_rx_phy_shared                       (s_i_ick_sclk_rx_phy_shared[0]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.i_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[0]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
//    .o_ick_sclk_rx_phy_shared                       (s_o_ick_sclk_rx_phy_shared[0]            ),
//    .i_sync_common_control_phy_shared               (sync_common_control_phy_shared[0]        ),
//    
//    .o_ft_rx_sclk_sync_ch_phy_shared                (ft_rx_sclk_sync_ch_phy_shared[0]            ) ,
//    .o_ft_tx_sclk_sync_ch_phy_shared                (ft_tx_sclk_sync_ch_phy_shared[0]            ) ,
//    .o_rst_ux_rx_pma_rst_n_phy_shared               (rst_ux_rx_pma_rst_n_phy_shared[0]           ) ,
//    .o_rst_ux_tx_pma_rst_n_phy_shared               (rst_ux_tx_pma_rst_n_phy_shared[0]           ) ,
//    .o_ick_pcs_txword_phy_shared                    (ick_pcs_txword_phy_shared[0]                ) ,
//    .o_tx_dl_ch_bit_phy_shared                      (tx_dl_ch_bit_phy_shared[0]                  ) ,
//    .i_dat_pcs_measlatbit_phy_shared                (dat_pcs_measlatbit_phy_shared[0]            ) ,
//    .i_ft_rx_async_pulse_ch_phy_shared              (ft_rx_async_pulse_ch_phy_shared[0]          ) ,
//    .i_ft_tx_async_pulse_ch_phy_shared              (ft_tx_async_pulse_ch_phy_shared[0]          ) ,
//    .i_rx_dl_ch_bit_phy_shared                      (rx_dl_ch_bit_phy_shared[0]                  ) ,
//    .i_ux_rxuser1_sel_phy_shared                    (ux_rxuser1_sel_phy_shared[0]                ) ,
//    .i_ux_rxuser2_sel_phy_shared                    (ux_rxuser2_sel_phy_shared[0]                ) ,
//    .i_ux_txuser1_sel_phy_shared                    (ux_txuser1_sel_phy_shared[0]                ) ,
//    .i_ux_txuser2_sel_phy_shared                    (ux_txuser2_sel_phy_shared[0]                ) ,
//    .o_octl_pcs_txstatus_a_phy_shared               (octl_pcs_txstatus_a_phy_shared[0]           ) ,
//    .i_ictl_pcs_txenable_a_phy_shared               (ictl_pcs_txenable_a_phy_shared[0]           ) ,
//    .i_sync_cfg_data_phy_shared                     (sync_cfg_data_phy_shared[0]                 ) ,
//    .i_sync_interface_control_phy_shared            (sync_interface_control_phy_shared[0]        ) ,
//    .o_tx_data_phy_shared                           (tx_data_phy_shared[0]                       ) ,
//    .i_rx_data_phy_shared                           (rx_data_phy_shared[0]                       ) ,
//    .o_sm_flux_ingress_phy_shared                   (sm_flux_ingress_phy_shared[0]               ) ,
//    .i_sm_flux_egress_phy_shared                    (sm_flux_egress_phy_shared[0]                ) ,
//    .i_flux_cpi_int_phy_shared                      (flux_cpi_int_phy_shared                               ) ,      //only one bit needed
//    .i_flux_int_phy_shared                          (flux_int_phy_shared[0]                      ) ,
//    .i_oflux_octl_pcs_txptr_smpl_lane_phy_shared    (oflux_octl_pcs_txptr_smpl_lane_phy_shared[0]) ,
//    .o_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[0]                   ) ,
//    .i_flux_srds_rdy_phy_shared                     (flux_srds_rdy_phy_shared[0]                 ) ,
//    .i_pcs_rxword_phy_shared                        (pcs_rxword_phy_shared[0]                    ) ,
//    .i_pcs_rxpostdiv_phy_shared                     (pcs_rxpostdiv_phy_shared[0]                 ) ,
//    .i_ock_pcs_txword_phy_shared                    (ock_pcs_txword_phy_shared[0]                ) ,
//
//    .o_ch_lavmm_fec_addr_fec_wrap                   (ch_lavmm_fec_addr_fec_wrap[0]),
//    .o_ch_lavmm_fec_be_fec_wrap                     (ch_lavmm_fec_be_fec_wrap[0]),
//    .o_ch_lavmm_fec_clk_fec_wrap                    (ch_lavmm_fec_clk_fec_wrap[0]),
//    .o_ch_lavmm_fec_read_fec_wrap                   (ch_lavmm_fec_read_fec_wrap[0]),
//    .o_ch_lavmm_fec_rstn_fec_wrap                   (ch_lavmm_fec_rstn_fec_wrap[0]),
//    .o_ch_lavmm_fec_wdata_fec_wrap                  (ch_lavmm_fec_wdata_fec_wrap[0]),
//    .o_ch_lavmm_fec_write_fec_wrap                  (ch_lavmm_fec_write_fec_wrap[0]),
//    .i_ch_lavmm_fec_rdata_fec_wrap                  (ch_lavmm_fec_rdata_fec_wrap[0]),
//    .i_ch_lavmm_fec_rdata_valid_fec_wrap            (ch_lavmm_fec_rdata_valid_fec_wrap[0]),
//    .i_ch_lavmm_fec_waitreq_fec_wrap                (ch_lavmm_fec_waitreq_fec_wrap[0]),
//    .i_ch_eth_fec_rx_async_fec_wrap                 (ch_eth_fec_rx_async_fec_wrap[0]),
//    .i_ch_eth_fec_rx_direct_fec_wrap                (ch_eth_fec_rx_direct_fec_wrap[0]),
//    .o_ch_eth_fec_tx_async_fec_wrap                 (ch_eth_fec_tx_async_fec_wrap[0]),
//    .o_ch_eth_fec_tx_direct_fec_wrap                (ch_eth_fec_tx_direct_fec_wrap[0]),
//    .o_rstfec_fec_csr_ret_fec_wrap                  (rstfec_fec_csr_ret_fec_wrap[0]),
//    .i_fec_rx_rdy_n_fec_wrap                        (fec_rx_rdy_n_fec_wrap[0]),
//    .o_rstfec_fec_rx_rst_n_fec_wrap                 (rstfec_fec_rx_rst_n_fec_wrap[0]),
//    .o_rstfec_fec_tx_rst_n_fec_wrap                 (rstfec_fec_tx_rst_n_fec_wrap[0]),
//    .o_rstfec_rx_fec_sfrz_n_fec_wrap                (rstfec_rx_fec_sfrz_n_fec_wrap[0]),
//    .o_rstfec_tx_fec_sfrz_n_fec_wrap                (rstfec_tx_fec_sfrz_n_fec_wrap[0]),
//    .i_fec_tx_data_mux_sel_fec_wrap                 (fec_tx_data_mux_sel_fec_wrap[0]),
//    .i_fec_rx_data_fec_wrap                         (fec_rx_data_fec_wrap[0]),
//    .o_fec_i_tx_mux_data_fec_wrap                   (fec_i_tx_mux_data_fec_wrap[0]),
//    .o_xcvr_rx_data                                 (xcvr_rx_data[0]),
//    .i_xcvr_tx_data                                 (xcvr_tx_data[0]),
//    .o_pma_rx_sf                                    (pma_rx_sf[0]),
//
//    .i_refclk_tx_p                                  (i_refclk_tx_p   ),
//    .i_refclk_tx_n                                  (i_refclk_tx_n   ),//can derive as negated i_refclk_tx_p
//    .i_syspll_c0_clk                                (i_syspll_c0_clk ),
//    .i_syspll_c1_clk                                (i_syspll_c1_clk ),
//    .i_syspll_c2_clk                                (i_syspll_c2_clk ),
//    .i_flux_clk                                     (i_flux_clk      ),
//    .i_refclk_rx_p                                  (i_refclk_rx_p   ),
//    .i_refclk_rx_n                                  (i_refclk_rx_n   ),
//
//    .i_ux_chnl_refclk_mux_phy_shared                (sm_flux_egress_phy_shared[0][193]),
//    .i_ch0_top_xcvrif_tx_fifo_rd_en                 (),
//    .i_ch1_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch2_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch3_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch0_top_xcvrif_rx_fifo_rd_en                 (),
//    .i_ch1_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch2_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch3_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch0_top_xcvrif_tx_rst_mux                    (),
//    .i_ch1_xcvrif_tx_rst_mux                        (),
//    .i_ch2_xcvrif_tx_rst_mux                        (),
//    .i_ch3_xcvrif_tx_rst_mux                        (),
//    .i_ux0_top_xcvrif_tx_word_clk                   (),
//    .i_ux1_xcvrif_tx_word_clk                       (),
//    .i_ux2_xcvrif_tx_word_clk                       (),
//    .i_ux3_xcvrif_tx_word_clk                       (),
//    .ioack_cdrdiv_left_ux_bidir_in                  (),
//    .ioack_synthdiv1_left_ux_bidir_in               (),
//    .ioack_synthdiv2_left_ux_bidir_in               (),
//    .ioack_cdrdiv_right_ux_bidir_out                (),
//    .ioack_synthdiv1_right_ux_bidir_out             (),
//    .ioack_synthdiv2_right_ux_bidir_out             ()
//
//);
//  }
//  if {PCIE_GEN4=="PCIE_GEN1" || PCIE_GEN4=="PCIE_GEN2" || PCIE_GEN4=="PCIE_GEN3" || PCIE_GEN4=="PCIE_GEN4"} {

system_intel_pcie_gts_0_pcie_hal_top_one_lane_pcie_hal_2100_ssolv5i one_lane_pcie_inst_1(
    .i_hio_txdata                                   (i_hio_txdata[2]                           ),
    .i_hio_txdata_extra                             (i_hio_txdata_extra[2]                     ),
    .i_hio_txdata_fifo_wr_en                        (i_hio_txdata_fifo_wr_en[2]                ),
    .i_hio_rxdata_fifo_rd_en                        (i_hio_rxdata_fifo_rd_en[2]                ),
    .i_hio_ptp_rst_n                                (i_hio_ptp_rst_n[2]                        ),
    .i_hio_ehip_rx_rst_n                            (i_hio_ehip_rx_rst_n[2]                    ),
    .i_hio_ehip_tx_rst_n                            (i_hio_ehip_tx_rst_n[2]                    ),
    .i_hio_ehip_signal_ok                           (i_hio_ehip_signal_ok[2]                   ),
    .i_hio_sfreeze_2_r03f_rx_mac_srfz_n             (i_hio_sfreeze_2_r03f_rx_mac_srfz_n[2]     ),
    .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n           (i_hio_sfreeze_3_c2f_tx_deskew_srfz_n[2]   ),
    .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n             (i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n[2]     ),
    .i_hio_rstfec_fec_rx_rst_n                      (i_hio_rstfec_fec_rx_rst_n[2]              ),
    .i_hio_rstfec_fec_tx_rst_n                      (i_hio_rstfec_fec_tx_rst_n[2]              ),
    .i_hio_rstfec_fec_csr_ret                       (i_hio_rstfec_fec_csr_ret[2]               ),
    .i_hio_rstfec_rx_fec_sfrz_n                     (i_hio_rstfec_rx_fec_sfrz_n[2]             ),
    .i_hio_rstfec_tx_fec_sfrz_n                     (i_hio_rstfec_tx_fec_sfrz_n[2]             ),
    .i_hio_rstxcvrif_xcvrif_rx_rst_n                (i_hio_rstxcvrif_xcvrif_rx_rst_n[2]        ),
    .i_hio_rstxcvrif_xcvrif_tx_rst_n                (i_hio_rstxcvrif_xcvrif_tx_rst_n[2]        ),
    .i_hio_rstxcvrif_xcvrif_signal_ok               (i_hio_rstxcvrif_xcvrif_signal_ok[2]       ),
    .i_hio_rstxcvrif_rx_xcvrif_sfrz_n               (i_hio_rstxcvrif_rx_xcvrif_sfrz_n[2]       ),
    .i_hio_rstxcvrif_tx_xcvrif_sfrz_n               (i_hio_rstxcvrif_tx_xcvrif_sfrz_n[2]       ),
    .i_hio_rst_pld_clrhip                           (i_hio_rst_pld_clrhip[2]                   ),
    .i_hio_rst_pld_clrpcs                           (i_hio_rst_pld_clrpcs[2]                   ),
    .i_hio_rst_pld_perstn                           (i_hio_rst_pld_perstn[2]                   ),
    .i_hio_rst_pld_ready                            (i_hio_rst_pld_ready[2]                    ),
    .i_hio_rst_pld_adapter_rx_pld_rst_n             (i_hio_rst_pld_adapter_rx_pld_rst_n[2]     ),
    .i_hio_rst_pld_adapter_tx_pld_rst_n             (i_hio_rst_pld_adapter_tx_pld_rst_n[2]     ),
    .i_hio_rst_ux_rx_pma_rst_n                      (i_hio_rst_ux_rx_pma_rst_n[2]              ),
    .i_hio_rst_ux_rx_sfrz                           (i_hio_rst_ux_rx_sfrz[2]                   ),
    .i_hio_rst_ux_tx_pma_rst_n                      (i_hio_rst_ux_tx_pma_rst_n[2]              ),
    .i_hio_pld_reset_clk_row                        (i_hio_pld_reset_clk_row[2]                ),
    .i_hio_uxquad_async                             (i_hio_uxquad_async[2]                     ),
    .i_hio_uxquad_async_pcie_mux                    (i_hio_uxquad_async_pcie_mux[2]            ),

    .i_hio_lavmm_clk                                (i_hio_ch2_lavmm_clk                       ),
    .i_hio_lavmm_rstn                               (i_hio_ch2_lavmm_rstn                      ),
    .i_hio_lavmm_addr                               (i_hio_ch2_lavmm_addr                      ),
    .i_hio_lavmm_be                                 (i_hio_ch2_lavmm_be                        ),
    .i_hio_lavmm_read                               (i_hio_ch2_lavmm_read                      ),
    .i_hio_lavmm_wdata                              (i_hio_ch2_lavmm_wdata                     ),
    .i_hio_lavmm_write                              (i_hio_ch2_lavmm_write                     ),
    .o_hio_lavmm_rdata                              (o_hio_ch2_lavmm_rdata                     ),
    .o_hio_lavmm_rdata_valid                        (o_hio_ch2_lavmm_rdata_valid               ),
    .o_hio_lavmm_waitreq                            (o_hio_ch2_lavmm_waitreq                   ),
    .i_hio_pld_rx_clk_in_row_clk                    (i_hio_ch2_pld_rx_clk_in_row_clk           ),
    .i_hio_pld_tx_clk_in_row_clk                    (i_hio_ch2_pld_tx_clk_in_row_clk           ),
    .i_hio_det_lat_rx_dl_clk                        (i_hio_ch2_det_lat_rx_dl_clk               ),
    .i_hio_det_lat_rx_mux_select                    (i_hio_ch2_det_lat_rx_mux_select           ),
    .i_hio_det_lat_rx_sclk_flop                     (i_hio_ch2_det_lat_rx_sclk_flop            ),
    .i_hio_det_lat_rx_sclk_gen_clk                  (i_hio_ch2_det_lat_rx_sclk_gen_clk         ),
    .i_hio_det_lat_rx_trig_flop                     (i_hio_ch2_det_lat_rx_trig_flop            ),
    .i_hio_det_lat_sampling_clk                     (i_hio_ch2_det_lat_sampling_clk            ),
    .i_hio_det_lat_tx_dl_clk                        (i_hio_ch2_det_lat_tx_dl_clk               ),
    .i_hio_det_lat_tx_mux_select                    (i_hio_ch2_det_lat_tx_mux_select           ),
    .i_hio_det_lat_tx_sclk_flop                     (i_hio_ch2_det_lat_tx_sclk_flop            ),
    .i_hio_det_lat_tx_sclk_gen_clk                  (i_hio_ch2_det_lat_tx_sclk_gen_clk         ),
    .i_hio_det_lat_tx_trig_flop                     (i_hio_ch2_det_lat_tx_trig_flop            ),

    .rx_serial_n                                    (rx_serial_n[1]                            ),
    .rx_serial_p                                    (rx_serial_p[1]                            ),
    //.i_hio_tx_pfc                                   (i_hio_tx_pfc[1]                           ),
    //.i_hio_tx_pause                                 (i_hio_tx_pause[1]                         ),
    //.i_hio_clear_internal                           (i_hio_clear_internal[1]                   ),
    //.i_hio_signal_ok                                (i_hio_signal_ok[1]                        ),
    //.i_hio_pld_ready                                (i_hio_pld_ready[1]                        ),
    //.i_hio_pma_rx_sf                                (i_hio_pma_rx_sf[1]                        ),
    //.i_hio_ch_rstxcvrif_lphy_signal_ok              (i_hio_ch_rstxcvrif_lphy_signal_ok[1]      ),
    //.i_clear_tx_internal_err                        (i_clear_tx_internal_err[1]                ),
    .o_hio_txdata_fifo_wr_empty                     (o_hio_txdata_fifo_wr_empty[2]             ),
    .i_hio_txdata_async                             (i_hio_txdata_async[2]                     ),
    .i_hio_txdata_direct                            (i_hio_txdata_direct[2]                    ),
    .o_hio_rxdata_async                             (o_hio_rxdata_async[2]                     ),
    .o_hio_rxdata_direct                            (o_hio_rxdata_direct[2]                    ),
    .o_hio_txdata_fifo_wr_pempty                    (o_hio_txdata_fifo_wr_pempty[2]            ),
    .o_hio_txdata_fifo_wr_full                      (o_hio_txdata_fifo_wr_full[2]              ),
    .o_hio_txdata_fifo_wr_pfull                     (o_hio_txdata_fifo_wr_pfull[2]             ),
    .o_hio_rxdata                                   (o_hio_rxdata[2]                           ),
    .o_hio_rxdata_extra                             (o_hio_rxdata_extra[2]                     ),
    .o_hio_rxdata_fifo_rd_empty                     (o_hio_rxdata_fifo_rd_empty[2]             ),
    .o_hio_rxdata_fifo_rd_pempty                    (o_hio_rxdata_fifo_rd_pempty[2]            ),
    .o_hio_rxdata_fifo_rd_full                      (o_hio_rxdata_fifo_rd_full[2]              ),
    .o_hio_rxdata_fifo_rd_pfull                     (o_hio_rxdata_fifo_rd_pfull[2]             ),
    .o_hio_rstepcs_rx_pcs_fully_aligned             (o_hio_rstepcs_rx_pcs_fully_aligned[2]     ),
    .o_hio_rstfec_fec_rx_rdy_n                      (o_hio_rstfec_fec_rx_rdy_n[2]              ),
    .o_hio_rst_flux0_cpi_cmn_busy                   (o_hio_rst_flux0_cpi_cmn_busy[2]           ),
    .o_hio_rst_oflux_rx_srds_rdy                    (o_hio_rst_oflux_rx_srds_rdy[2]            ),
    .o_hio_rst_ux_all_synthlockstatus               (o_hio_rst_ux_all_synthlockstatus[2]       ),
    .o_hio_rst_ux_octl_pcs_rxstatus                 (o_hio_rst_ux_octl_pcs_rxstatus[2]         ),
    .o_hio_rst_ux_octl_pcs_txstatus                 (o_hio_rst_ux_octl_pcs_txstatus[2]         ),
    .o_hio_rst_ux_rxcdrlock2data                    (o_hio_rst_ux_rxcdrlock2data[2]            ),
    .o_hio_rst_ux_rxcdrlockstatus                   (o_hio_rst_ux_rxcdrlockstatus[2]           ),
    .o_hio_uxquad_async                             (o_hio_uxquad_async[2]                     ),
    //.k_user_rx_clk1_c0c1c2_sel                      (k_user_rx_clk1_c0c1c2_sel[1]              ),
    //.k_user_rx_clk2_c0c1c2_sel                      (k_user_rx_clk2_c0c1c2_sel[1]              ),
    //.k_user_tx_clk1_c0c1c2_sel                      (k_user_tx_clk1_c0c1c2_sel[1]              ),
    //.k_user_tx_clk2_c0c1c2_sel                      (k_user_tx_clk2_c0c1c2_sel[1]              ),

    .o_hio_user_rx_clk1_clk                         (o_hio_ch2_user_rx_clk1_clk                ),
    .o_hio_user_rx_clk2_clk                         (o_hio_ch2_user_rx_clk2_clk                ),
    .o_hio_user_tx_clk1_clk                         (o_hio_ch2_user_tx_clk1_clk                ),
    .o_hio_user_tx_clk2_clk                         (o_hio_ch2_user_tx_clk2_clk                ),
    .o_hio_ux_chnl_refclk_mux                       (o_hio_ch2_ux_chnl_refclk_mux              ),
    .o_hio_det_lat_rx_async_dl_sync                 (o_hio_ch2_det_lat_rx_async_dl_sync        ),
    .o_hio_det_lat_rx_async_pulse                   (o_hio_ch2_det_lat_rx_async_pulse          ),
    .o_hio_det_lat_rx_async_sample_sync             (o_hio_ch2_det_lat_rx_async_sample_sync    ),
    .o_hio_det_lat_rx_sclk_sample_sync              (o_hio_ch2_det_lat_rx_sclk_sample_sync     ),
    .o_hio_det_lat_rx_trig_sample_sync              (o_hio_ch2_det_lat_rx_trig_sample_sync     ),
    .o_hio_det_lat_tx_async_dl_sync                 (o_hio_ch2_det_lat_tx_async_dl_sync        ),
    .o_hio_det_lat_tx_async_pulse                   (o_hio_ch2_det_lat_tx_async_pulse          ),
    .o_hio_det_lat_tx_async_sample_sync             (o_hio_ch2_det_lat_tx_async_sample_sync    ),
    .o_hio_det_lat_tx_sclk_sample_sync              (o_hio_ch2_det_lat_tx_sclk_sample_sync     ),
    .o_hio_det_lat_tx_trig_sample_sync              (o_hio_ch2_det_lat_tx_trig_sample_sync     ),
    .o_hio_xcvrif_rx_latency_pulse                  (o_hio_ch2_xcvrif_rx_latency_pulse         ),
    .o_hio_xcvrif_tx_latency_pulse                  (o_hio_ch2_xcvrif_tx_latency_pulse         ),

    .tx_serial_p                                    (tx_serial_p[1]                            ),
    .tx_serial_n                                    (tx_serial_n[1]                            ),
   // .o_hio_local_fault                              (o_hio_local_fault[1]                      ),
   // .o_hio_remote_fault                             (o_hio_remote_fault[1]                     ),
   // .o_hio_rx_pause                                 (o_hio_rx_pause[1]                         ),
   // .o_hio_rx_pfc                                   (o_hio_rx_pfc[1]                           ),
   // .o_hio_txfifo_pfull                             (o_hio_txfifo_pfull[1]                     ),
   // .o_hio_dsk_mon_err                              (o_hio_dsk_mon_err[1]                      ),
   // .o_hio_hip_ready                                (o_hio_hip_ready[1]                        ),
   // .o_hio_rx_block_lock                            (o_hio_rx_block_lock[1]                    ),
   // .o_hio_rx_dsk_done                              (o_hio_rx_dsk_done[1]                      ),
   // .o_hio_rx_am_lock                               (o_hio_rx_am_lock[1]                       ),
   // .o_hio_rx_pcs_fully_aligned                     (o_hio_rx_pcs_fully_aligned[1]             ),
   // .o_hio_hi_ber                                   (o_hio_hi_ber[1]                           ),
   // .o_hio_rx_pcs_internal_err                      (o_hio_rx_pcs_internal_err[1]              ),
   // .o_hio_tx_fifo_status_fifo_wr_pfull             (o_hio_tx_fifo_status_fifo_wr_pfull[1]     ),
   // .o_hio_tx_fifo_status_fifo_pempty               (o_hio_tx_fifo_status_fifo_pempty[1]       ),
   // .o_hio_rx_fifo_status_fifo_pempty               (o_hio_rx_fifo_status_fifo_pempty[1]       ),
   // .o_hio_rx_fifo_status_fifo_wr_pfull             (o_hio_rx_fifo_status_fifo_wr_pfull[1]     ),
   // .o_hio_rx_fifo_status_fifo_empty                (o_hio_rx_fifo_status_fifo_empty[1]        ),
   // .o_hio_tx_fifo_status_fifo_empty                (o_hio_tx_fifo_status_fifo_empty[1]        ),
   // .o_hio_rx_fifo_status_gb_restarted              (o_hio_rx_fifo_status_gb_restarted[1]      ),
   // .o_hio_tx_fifo_status_gb_restarted              (o_hio_tx_fifo_status_gb_restarted[1]      ),
    
    .i_uxwrap_bus_in_phy_shared                     (uxwrap_bus_in_phy_shared[1]              ),      //ipfluxtop_uxtop_wrap signals to phy_hal_shared
    .o_uxwrap_bus_out_phy_shared                    (uxwrap_bus_out_phy_shared[1]             ),
    //.o_flux_sclk_mux_phy_shared                   (flux_sclk_mux_phy_shared[1]                ),    //sm_flux_ingress_signals to phy_hal_shared////not used, should i remove 
    //.i_ss_async_pldif_phy_shared                  (ss_async_pldif_phy_shared[1]               ),    //sm_flux_ingress_signals to phy_hal_shared 
    //.o_ss_async_pldif_phy_shared                    (ss_async_pldif_phy_shared[1]             ),    
    //.i_ss_async_pldif_pcie_mux_phy_shared           (ss_async_pldif_pcie_mux_phy_shared[1]    ),    
    .o_lavmm_addr_phy_shared                        (lavmm_addr_phy_shared[1]                 ),
    .o_lavmm_be_phy_shared                          (lavmm_be_phy_shared[1]                   ),
    .o_lavmm_clk_phy_shared                         (lavmm_clk_phy_shared[1]                  ),
    .o_lavmm_read_phy_shared                        (lavmm_read_phy_shared[1]                 ),
    .o_lavmm_rstn_phy_shared                        (lavmm_rstn_phy_shared[1]                 ),
    .o_lavmm_wdata_phy_shared                       (lavmm_wdata_phy_shared[1]                ),
    .o_lavmm_write_phy_shared                       (lavmm_write_phy_shared[1]                ),
    .i_lavmm_rdata_phy_shared                       (lavmm_rdata_phy_shared[1]                ),
    .i_lavmm_rdata_valid_phy_shared                 (lavmm_rdata_valid_phy_shared[1]          ),
    .i_lavmm_waitreq_phy_shared                     (lavmm_waitreq_phy_shared[1]              ),
    //.i_rxpstate_phy_shared                          (rxpstate_phy_shared[1]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxrate_phy_shared                            (rxrate_phy_shared[1]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxterm_hiz_ena_phy_shared                    (rxterm_hiz_ena_phy_shared[1]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxwidth_phy_shared                           (rxwidth_phy_shared[1]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_tstbus_lane_phy_shared                       (tstbus_lane_phy_shared[1]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txbeacona_phy_shared                         (txbeacona_phy_shared[1]                  ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txclkdivrate_phy_shared                      (txclkdivrate_phy_shared[1]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdetectrx_reqa_phy_shared                   (txdetectrx_reqa_phy_shared[1]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levn_phy_shared                        (txdrv_levn_phy_shared[1]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm1_phy_shared                      (txdrv_levnm1_phy_shared[1]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm2_phy_shared                      (txdrv_levnm2_phy_shared[1]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnp1_phy_shared                      (txdrv_levnp1_phy_shared[1]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_slew_phy_shared                        (txdrv_slew_phy_shared[1]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txelecidle_phy_shared                        (txelecidle_phy_shared[1]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txpstate_phy_shared                          (txpstate_phy_shared[1]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txrate_phy_shared                            (txrate_phy_shared[1]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txwidth_phy_shared                           (txwidth_phy_shared[1]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.o_rxmargin_status_gray_phy_shared              (rxmargin_status_gray_phy_shared[1]       ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rst_ux_rx_sfrz_phy_shared                    (rst_ux_rx_sfrz_phy_shared[1]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_flux0_cpi_cmn_busy_phy_shared            (rst_flux0_cpi_cmn_busy_phy_shared[1]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_oflux_rx_srds_rdy_phy_shared             (rst_oflux_rx_srds_rdy_phy_shared[1]      ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_ux_all_synthlockstatus_phy_shared        (rst_ux_all_synthlockstatus_phy_shared[1] ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_rst_ux_rxcdrlockstatus_phy_shared            (rst_ux_rxcdrlockstatus_phy_shared[1]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_cdrfbclk_phy_shared                  (ock_pcs_cdrfbclk_phy_shared[1]           ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_ref_phy_shared                       (ock_pcs_ref_phy_shared[1]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ux_tx_ch_ptr_smpl_phy_shared                 (ux_tx_ch_ptr_smpl_phy_shared[1]          ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    .o_dat_pcs_measlatrndtripbit_phy_shared         (dat_pcs_measlatrndtripbit_phy_shared[1]  ),        ////Navid sheet says to sm_ux_toolbox, but in toolbox it says to fluxcore, so not added in phy_shared. In sujoys, connected to toolbox. Should I add this to physhared
    .o_sclk_return_sel_rx_phy_shared                (sclk_return_sel_rx_phy_shared[1]         ),
    .o_sclk_return_sel_tx_phy_shared                (sclk_return_sel_tx_phy_shared[1]         ),
    //.i_ick_sclk_rx_phy_shared                       (s_i_ick_sclk_rx_phy_shared[1]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.i_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[1]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    .o_ick_sclk_rx_phy_shared                       (s_o_ick_sclk_rx_phy_shared[1]            ),
    .i_sync_common_control_phy_shared               (sync_common_control_phy_shared[1]        ),
    
    .o_ft_rx_sclk_sync_ch_phy_shared                (ft_rx_sclk_sync_ch_phy_shared[1]            ) ,
    .o_ft_tx_sclk_sync_ch_phy_shared                (ft_tx_sclk_sync_ch_phy_shared[1]            ) ,
    .o_rst_ux_rx_pma_rst_n_phy_shared               (rst_ux_rx_pma_rst_n_phy_shared[1]           ) ,
    .o_rst_ux_tx_pma_rst_n_phy_shared               (rst_ux_tx_pma_rst_n_phy_shared[1]           ) ,
    .o_ick_pcs_txword_phy_shared                    (ick_pcs_txword_phy_shared[1]                ) ,
    .o_tx_dl_ch_bit_phy_shared                      (tx_dl_ch_bit_phy_shared[1]                  ) ,
    .i_dat_pcs_measlatbit_phy_shared                (dat_pcs_measlatbit_phy_shared[1]            ) ,
    .i_ft_rx_async_pulse_ch_phy_shared              (ft_rx_async_pulse_ch_phy_shared[1]          ) ,
    .i_ft_tx_async_pulse_ch_phy_shared              (ft_tx_async_pulse_ch_phy_shared[1]          ) ,
    .i_rx_dl_ch_bit_phy_shared                      (rx_dl_ch_bit_phy_shared[1]                  ) ,
    .i_ux_rxuser1_sel_phy_shared                    (ux_rxuser1_sel_phy_shared[1]                ) ,
    .i_ux_rxuser2_sel_phy_shared                    (ux_rxuser2_sel_phy_shared[1]                ) ,
    .i_ux_txuser1_sel_phy_shared                    (ux_txuser1_sel_phy_shared[1]                ) ,
    .i_ux_txuser2_sel_phy_shared                    (ux_txuser2_sel_phy_shared[1]                ) ,
    .o_octl_pcs_txstatus_a_phy_shared               (octl_pcs_txstatus_a_phy_shared[1]           ) ,
    .i_ictl_pcs_txenable_a_phy_shared               (ictl_pcs_txenable_a_phy_shared[1]           ) ,
    .i_sync_cfg_data_phy_shared                     (sync_cfg_data_phy_shared[1]                 ) ,
    .i_sync_interface_control_phy_shared            (sync_interface_control_phy_shared[1]        ) ,
    .o_tx_data_phy_shared                           (tx_data_phy_shared[1]                       ) ,
    .i_rx_data_phy_shared                           (rx_data_phy_shared[1]                       ) ,
    .o_sm_flux_ingress_phy_shared                   (sm_flux_ingress_phy_shared[1]               ) ,
    .i_sm_flux_egress_phy_shared                    (sm_flux_egress_phy_shared[1]                ) ,
    .i_flux_cpi_int_phy_shared                      (flux_cpi_int_phy_shared                               ) ,      //only one bit needed
    .i_flux_int_phy_shared                          (flux_int_phy_shared[1]                      ) ,
    .i_oflux_octl_pcs_txptr_smpl_lane_phy_shared    (oflux_octl_pcs_txptr_smpl_lane_phy_shared[1]) ,
    .o_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[1]                   ) ,
    .i_flux_srds_rdy_phy_shared                     (flux_srds_rdy_phy_shared[1]                 ) ,
    .i_pcs_rxword_phy_shared                        (pcs_rxword_phy_shared[1]                    ) ,
    .i_pcs_rxpostdiv_phy_shared                     (pcs_rxpostdiv_phy_shared[1]                 ) ,
    .i_ock_pcs_txword_phy_shared                    (ock_pcs_txword_phy_shared[1]                ) ,

//    .o_ch_lavmm_fec_addr_fec_wrap                   (ch_lavmm_fec_addr_fec_wrap[1]),
//    .o_ch_lavmm_fec_be_fec_wrap                     (ch_lavmm_fec_be_fec_wrap[1]),
//    .o_ch_lavmm_fec_clk_fec_wrap                    (ch_lavmm_fec_clk_fec_wrap[1]),
//    .o_ch_lavmm_fec_read_fec_wrap                   (ch_lavmm_fec_read_fec_wrap[1]),
//    .o_ch_lavmm_fec_rstn_fec_wrap                   (ch_lavmm_fec_rstn_fec_wrap[1]),
//    .o_ch_lavmm_fec_wdata_fec_wrap                  (ch_lavmm_fec_wdata_fec_wrap[1]),
//    .o_ch_lavmm_fec_write_fec_wrap                  (ch_lavmm_fec_write_fec_wrap[1]),
//    .i_ch_lavmm_fec_rdata_fec_wrap                  (ch_lavmm_fec_rdata_fec_wrap[1]),
//    .i_ch_lavmm_fec_rdata_valid_fec_wrap            (ch_lavmm_fec_rdata_valid_fec_wrap[1]),
//    .i_ch_lavmm_fec_waitreq_fec_wrap                (ch_lavmm_fec_waitreq_fec_wrap[1]),
    .i_ch_eth_fec_rx_async_fec_wrap                 (ch_eth_fec_rx_async_fec_wrap[1]),
    .i_ch_eth_fec_rx_direct_fec_wrap                (ch_eth_fec_rx_direct_fec_wrap[1]),
//    .o_ch_eth_fec_tx_async_fec_wrap                 (ch_eth_fec_tx_async_fec_wrap[1]),
//    .o_ch_eth_fec_tx_direct_fec_wrap                (ch_eth_fec_tx_direct_fec_wrap[1]),
//    .o_rstfec_fec_csr_ret_fec_wrap                  (rstfec_fec_csr_ret_fec_wrap[1]),
    .i_fec_rx_rdy_n_fec_wrap                        (fec_rx_rdy_n_fec_wrap[1]),
//    .o_rstfec_fec_rx_rst_n_fec_wrap                 (rstfec_fec_rx_rst_n_fec_wrap[1]),
//    .o_rstfec_fec_tx_rst_n_fec_wrap                 (rstfec_fec_tx_rst_n_fec_wrap[1]),
//    .o_rstfec_rx_fec_sfrz_n_fec_wrap                (rstfec_rx_fec_sfrz_n_fec_wrap[1]),
//    .o_rstfec_tx_fec_sfrz_n_fec_wrap                (rstfec_tx_fec_sfrz_n_fec_wrap[1]),
    .i_fec_tx_data_mux_sel_fec_wrap                 (fec_tx_data_mux_sel_fec_wrap[1]),
    .i_fec_rx_data_fec_wrap                         (fec_rx_data_fec_wrap[1]),
//    .o_fec_i_tx_mux_data_fec_wrap                   (fec_i_tx_mux_data_fec_wrap[1]),
//    .o_xcvr_rx_data                                 (xcvr_rx_data[1]),
    .i_xcvr_tx_data                                 (xcvr_tx_data[1]),
    .ss_rst_flux0_cpi_cmn_busy                      (ss_rst_flux0_cpi_cmn_busy[1]),
    .o_pma_rx_sf                                    (pma_rx_sf[1]),

    .i_refclk_tx_p                                  (i_refclk_tx_p   ),
//    .i_refclk_tx_n                                  (i_refclk_tx_n   ),//can derive as negated i_refclk_tx_p
    .i_syspll_c0_clk                                (i_syspll_c0_clk ),
    .i_syspll_c1_clk                                (i_syspll_c1_clk ),
    .i_syspll_c2_clk                                (i_syspll_c2_clk ),
    .i_flux_clk                                     (i_flux_clk      ),
    .i_refclk_rx_p                                  (i_refclk_rx_p   ),
//    .i_refclk_rx_n                                  (i_refclk_rx_n   ),

    .i_ux_chnl_refclk_mux_phy_shared                (sm_flux_egress_phy_shared[1][193]),
    .o_xcvrif_tx_fifo_rd_en_mux_x1                  (xcvrif_tx_fifo_rd_en_mux_x1[1]),
    .i_xcvrif_tx_fifo_rd_en_mux_x2                  (xcvrif_tx_fifo_rd_en_mux_x2[1]),
    .i_xcvrif_tx_fifo_rd_en_mux_x4                  (xcvrif_tx_fifo_rd_en_mux_x4[1]),
    .i_xcvrif_tx_fifo_rd_en_mux_x6_bot              (xcvrif_tx_fifo_rd_en_mux_x6_bot[1]),
    .i_xcvrif_tx_fifo_rd_en_mux_x6_top              (xcvrif_tx_fifo_rd_en_mux_x6_top[1]),
    .i_xcvrif_tx_fifo_rd_en_mux_x8_bot              (xcvrif_tx_fifo_rd_en_mux_x8_bot[1]),
    .i_xcvrif_tx_fifo_rd_en_mux_x8_top              (xcvrif_tx_fifo_rd_en_mux_x8_top[1]),
    .o_xcvrif_tx_rst_mux_x1                         (xcvrif_tx_rst_mux_x1[1]),
    .i_xcvrif_tx_rst_mux_x2                         (xcvrif_tx_rst_mux_x2[1]),
    .i_xcvrif_tx_rst_mux_x4                         (xcvrif_tx_rst_mux_x4[1]),
    .i_xcvrif_tx_rst_mux_x6_bot                     (xcvrif_tx_rst_mux_x6_bot[1]),
    .i_xcvrif_tx_rst_mux_x6_top                     (xcvrif_tx_rst_mux_x6_top[1]),
    .i_xcvrif_tx_rst_mux_x8_bot                     (xcvrif_tx_rst_mux_x8_bot[1]),
    .i_xcvrif_tx_rst_mux_x8_top                     (xcvrif_tx_rst_mux_x8_top[1]),
    .o_xcvrif_tx_word_clk_mux_x1                    (xcvrif_tx_word_clk_mux_x1[1]),
    .i_xcvrif_tx_word_clk_mux_x2                    (xcvrif_tx_word_clk_mux_x2[1]),
    .i_xcvrif_tx_word_clk_mux_x4                    (xcvrif_tx_word_clk_mux_x4[1]),
    .i_xcvrif_tx_word_clk_mux_x6_bot                (xcvrif_tx_word_clk_mux_x6_bot[1]),
    .i_xcvrif_tx_word_clk_mux_x6_top                (xcvrif_tx_word_clk_mux_x6_top[1]),
    .i_xcvrif_tx_word_clk_mux_x8_bot                (xcvrif_tx_word_clk_mux_x8_bot[1]),
    .i_xcvrif_tx_word_clk_mux_x8_top                (xcvrif_tx_word_clk_mux_x8_top[1]),
    .ioack_cdrdiv_left_ux_bidir_in                  ('b0),
    .ioack_synthdiv1_left_ux_bidir_in               (ioack_synthdiv1_left_ux_bidir_in_reg[1]),
    .ioack_synthdiv2_left_ux_bidir_in               ('b0),
    .ioack_cdrdiv_left_ux_bidir_out                 (ioack_cdrdiv_left_ux_bidir_out[1]),
    .ioack_synthdiv1_left_ux_bidir_out              (ioack_synthdiv1_left_ux_bidir_out_reg[1]),
    .ioack_synthdiv2_left_ux_bidir_out              (),
//SHUNXIONG EDIT
//    .i_marker_found_up                              (marker_found_up[1]),
//    .i_marker_found_dn                              (marker_found_dn[1]),
//    .o_marker_found                                 (marker_found[1]),
    .o_xcvrif_tx_rst_wr_sync_mux_x1                 (xcvrif_tx_rst_wr_sync_mux_x1[1]),
    .i_xcvrif_tx_rst_wr_sync_mux_x2                 (xcvrif_tx_rst_wr_sync_mux_x2[1]),
    .i_xcvrif_tx_rst_wr_sync_mux_x4                 (xcvrif_tx_rst_wr_sync_mux_x4[1]),
    .i_xcvrif_tx_rst_wr_sync_mux_x6_bot             (xcvrif_tx_rst_wr_sync_mux_x6_bot[1]),
    .i_xcvrif_tx_rst_wr_sync_mux_x6_top             (xcvrif_tx_rst_wr_sync_mux_x6_top[1]),
    .i_xcvrif_tx_rst_wr_sync_mux_x8_bot             (xcvrif_tx_rst_wr_sync_mux_x8_bot[1]),
    .i_xcvrif_tx_rst_wr_sync_mux_x8_top             (xcvrif_tx_rst_wr_sync_mux_x8_top[1]),

    .ss_user_rx_clk1_clk                            (ss_user_rx_clk1_clk[2]),
    .ss_user_rx_clk2_clk                            (ss_user_rx_clk2_clk[2]),
    .ss_user_tx_clk1_clk                            (ss_user_tx_clk1_clk[2]),
    .ss_user_tx_clk2_clk                            (ss_user_tx_clk2_clk[2]),
    .ss_user_rx_clk1_clk_w                          (ss_user_rx_clk1_clk_w[2]), //KAHUAT_EDIT
    .ss_user_rx_clk2_clk_w                          (ss_user_rx_clk2_clk_w[2]), //KAHUAT_EDIT
    .ss_user_tx_clk1_clk_w                          (ss_user_tx_clk1_clk_w[2]), //KAHUAT_EDIT
    .ss_user_tx_clk2_clk_w                          (ss_user_tx_clk2_clk_w[2]), //KAHUAT_EDIT
    .o_hio_ux_tx_ch_ptr_smpl                        (o_hio_ux_tx_ch_ptr_smpl[2]),

//KAHUAT_EDIT
    .o_ss_lavmm_pcie_addr                           (i_ch1_lavmm_pcie_addr[16:0]),
    .o_ss_lavmm_pcie_be                             (i_ch1_lavmm_pcie_be[3:0]),
    .o_ss_lavmm_pcie_clk                            (i_ch1_lavmm_pcie_clk),
    .o_ss_lavmm_pcie_read                           (i_ch1_lavmm_pcie_read),
    .o_ss_lavmm_pcie_rstn                           (i_ch1_lavmm_pcie_rstn),
    .o_ss_lavmm_pcie_wdata                          (i_ch1_lavmm_pcie_wdata[31:0]),
    .o_ss_lavmm_pcie_write                          (i_ch1_lavmm_pcie_write),
    .sm_pld_tx_demux_0_o_pcie                       (i_ch2_tx_data),
    .i_ss_lavmm_pcie_rdata                          (o_ch1_lavmm_pcie_rdata[31:0]),
    .i_ss_lavmm_pcie_rdata_valid                    (o_ch1_lavmm_pcie_rdata_valid),
    .i_ss_lavmm_pcie_waitreq                        (o_ch1_lavmm_pcie_waitreq),
    .sm_pld_rx_mux_0_i_pcie                         (o_ch2_rx_data),
    .o_pld_pcie_clk_4                               (o_pld_pcie_clk_4),

    .o_pcie_rxword_clk                              (i_ch1_pcie_rxword_clk),
    .o_pcie_txword_clk                              (i_ch1_pcie_txword_clk),
    .ss_rst_ux_rxcdrlock2data                       (i_ch1_uxq_rxcdrlock2dataa),
    .o_rxeq_best_eye_vala                           (i_ch1_uxq_rxeq_best_eye_vala[13:0]),
    .o_rxeq_donea                                   (i_ch1_uxq_rxeq_donea),
    .o_rxmargin_nacka                               (i_ch1_uxq_rxmargin_nacka),
    .o_rxmargin_statusa                             (i_ch1_uxq_rxmargin_statusa),
    .o_rxsignaldetect_lfpsa                         (i_ch1_uxq_rxsignaldetect_lfpsa),
    .o_rxsignaldetecta                              (i_ch1_uxq_rxsignaldetecta),
    .o_rxmargin_status_gray                         (i_ch1_uxq_rxmargin_status_gray_a[1:0]),
    .rxstatusa                                      (i_ch1_uxq_rxstatusa),
    .o_pcie_pcs                                     (i_ch1_uxq_rxword[39:0]),
    .o_synthlcfast_postdiv                          (i_ch1_uxq_synthlcfast_postdiv),
    .o_synthlcmed_postdiv                           (i_ch1_uxq_synthlcmed_postdiv),
    .o_synthlcslow_postdiv                          (i_ch1_uxq_synthlcslow_postdiv),
    .o_txdetectrx_acka                              (i_ch1_uxq_txdetectrx_acka),
    .o_txdetectrx_statct                            (i_ch1_uxq_txdetectrx_statct),
    .txstatusa                                      (i_ch1_uxq_txstatusa),
    .i_pcs_pipe_rstn                                (o_ch1_pcs_pipe_rstn),
    .i_ux_ock_pma_clk                               (o_ch1_ux_ock_pma_clk),
    .i_lfps_ennt                                    (o_ch1_uxq_lfps_ennt),
    .i_pcie_l1ctrla                                 (o_ch1_uxq_pcie_l1ctrla[1:0]),
    .i_pma_cmn_ctrl                                 (o_ch1_uxq_pma_cmn_ctrl),
    .i_pma_ctrl                                     (o_ch1_uxq_pma_ctrl),
    .i_pcie_pcs_rx_rst                              (o_ch1_uxq_rst_pcs_rx_b_a),
    .i_pcie_pcs_tx_rst                              (o_ch1_uxq_rst_pcs_tx_b_a),
    .i_rxeiosdetectstata                            (o_ch1_uxq_rxeiosdetectstata),
    .i_rxeq_precal_code_selnt                       (o_ch1_uxq_rxeq_precal_code_selnt[2:0]),
    .i_rxeq_starta                                  (o_ch1_uxq_rxeq_starta),
    .i_rxeq_static_ena                              (o_ch1_uxq_rxeq_static_ena),
    .i_rxmargin_direction_nt                        (o_ch1_uxq_rxmargin_direction_nt),
    .i_rxmargin_offset_change_a                     (o_ch1_uxq_rxmargin_offset_change_a),
    .i_rxmargin_mode_nt                             (o_ch1_uxq_rxmargin_mode_nt),
    .i_rxmargin_offset_nt                           (o_ch1_uxq_rxmargin_offset_nt[6:0]),
    .i_rxmargin_start_a                             (o_ch1_uxq_rxmargin_start_a),
    .i_rxpstate                                     (o_ch1_uxq_rxpstate[2:0]),
    .i_rxrate                                       (o_ch1_uxq_rxrate[3:0]),
    .i_rxterm_hiz_ena                               (o_ch1_uxq_rxterm_hiz_ena),
    .i_rxwidth                                      (o_ch1_uxq_rxwidth[2:0]),
    .i_tstbus_lane                                  (o_ch1_uxq_tstbus_lane),
    .i_txbeacona                                    (o_ch1_uxq_txbeacona),
    .i_txclkdivrate                                 (o_ch1_uxq_txclkdivrate[2:0]),
    .i_txdetectrx_reqa                              (o_ch1_uxq_txdetectrx_reqa),
    .i_txdrv_levn                                   (o_ch1_uxq_txdrv_levn[5:0]),
    .i_txdrv_levnm1                                 (o_ch1_uxq_txdrv_levnm1[4:0]),
    .i_txdrv_levnm2                                 (o_ch1_uxq_txdrv_levnm2[2:0]),
    .i_txdrv_levnp1                                 (o_ch1_uxq_txdrv_levnp1[4:0]),
    .i_txdrv_slew                                   (o_ch1_uxq_txdrv_slew[3:0]),
    .i_txelecidle                                   (o_ch1_uxq_txelecidle[3:0]),
    .i_txpstate                                     (o_ch1_uxq_txpstate[2:0]),
    .i_txrate                                       (o_ch1_uxq_txrate[3:0]),
    .i_txwidth                                      (o_ch1_uxq_txwidth[2:0]),
    .i_pcie_pcs                                     (o_ch1_uxq_txword[39:0])
);
//  } else {
//  one_lane_hal_top_p1 one_lane_inst_1(
//    .i_hio_txdata                                   (i_hio_txdata[1]                           ),
//    .i_hio_txdata_extra                             (i_hio_txdata_extra[1]                     ),
//    .i_hio_txdata_fifo_wr_en                        (i_hio_txdata_fifo_wr_en[1]                ),
//    .i_hio_rxdata_fifo_rd_en                        (i_hio_rxdata_fifo_rd_en[1]                ),
//    .i_hio_ptp_rst_n                                (i_hio_ptp_rst_n[1]                        ),
//    .i_hio_ehip_rx_rst_n                            (i_hio_ehip_rx_rst_n[1]                    ),
//    .i_hio_ehip_tx_rst_n                            (i_hio_ehip_tx_rst_n[1]                    ),
//    .i_hio_ehip_signal_ok                           (i_hio_ehip_signal_ok[1]                   ),
//    .i_hio_sfreeze_2_r03f_rx_mac_srfz_n             (i_hio_sfreeze_2_r03f_rx_mac_srfz_n[1]     ),
//    .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n           (i_hio_sfreeze_3_c2f_tx_deskew_srfz_n[1]   ),
//    .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n             (i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n[1]     ),
//    .i_hio_rstfec_fec_rx_rst_n                      (i_hio_rstfec_fec_rx_rst_n[1]              ),
//    .i_hio_rstfec_fec_tx_rst_n                      (i_hio_rstfec_fec_tx_rst_n[1]              ),
//    .i_hio_rstfec_fec_csr_ret                       (i_hio_rstfec_fec_csr_ret[1]               ),
//    .i_hio_rstfec_rx_fec_sfrz_n                     (i_hio_rstfec_rx_fec_sfrz_n[1]             ),
//    .i_hio_rstfec_tx_fec_sfrz_n                     (i_hio_rstfec_tx_fec_sfrz_n[1]             ),
//    .i_hio_rstxcvrif_xcvrif_rx_rst_n                (i_hio_rstxcvrif_xcvrif_rx_rst_n[1]        ),
//    .i_hio_rstxcvrif_xcvrif_tx_rst_n                (i_hio_rstxcvrif_xcvrif_tx_rst_n[1]        ),
//    .i_hio_rstxcvrif_xcvrif_signal_ok               (i_hio_rstxcvrif_xcvrif_signal_ok[1]       ),
//    .i_hio_rstxcvrif_rx_xcvrif_sfrz_n               (i_hio_rstxcvrif_rx_xcvrif_sfrz_n[1]       ),
//    .i_hio_rstxcvrif_tx_xcvrif_sfrz_n               (i_hio_rstxcvrif_tx_xcvrif_sfrz_n[1]       ),
//    .i_hio_rst_pld_clrhip                           (i_hio_rst_pld_clrhip[1]                   ),
//    .i_hio_rst_pld_clrpcs                           (i_hio_rst_pld_clrpcs[1]                   ),
//    .i_hio_rst_pld_perstn                           (i_hio_rst_pld_perstn[1]                   ),
//    .i_hio_rst_pld_ready                            (i_hio_rst_pld_ready[1]                    ),
//    .i_hio_rst_pld_adapter_rx_pld_rst_n             (i_hio_rst_pld_adapter_rx_pld_rst_n[1]     ),
//    .i_hio_rst_pld_adapter_tx_pld_rst_n             (i_hio_rst_pld_adapter_tx_pld_rst_n[1]     ),
//    .i_hio_rst_ux_rx_pma_rst_n                      (i_hio_rst_ux_rx_pma_rst_n[1]              ),
//    .i_hio_rst_ux_rx_sfrz                           (i_hio_rst_ux_rx_sfrz[1]                   ),
//    .i_hio_rst_ux_tx_pma_rst_n                      (i_hio_rst_ux_tx_pma_rst_n[1]              ),
//    .i_hio_pld_reset_clk_row                        (i_hio_pld_reset_clk_row[1]                ),
//    .i_hio_uxquad_async                             (i_hio_uxquad_async[1]                     ),
//    .i_hio_uxquad_async_pcie_mux                    (i_hio_uxquad_async_pcie_mux[1]            ),
//
//    .i_hio_lavmm_clk                                (i_hio_ch1_lavmm_clk                       ),
//    .i_hio_lavmm_rstn                               (i_hio_ch1_lavmm_rstn                      ),
//    .i_hio_lavmm_addr                               (i_hio_ch1_lavmm_addr                      ),
//    .i_hio_lavmm_be                                 (i_hio_ch1_lavmm_be                        ),
//    .i_hio_lavmm_read                               (i_hio_ch1_lavmm_read                      ),
//    .i_hio_lavmm_wdata                              (i_hio_ch1_lavmm_wdata                     ),
//    .i_hio_lavmm_write                              (i_hio_ch1_lavmm_write                     ),
//    .o_hio_lavmm_rdata                              (o_hio_ch1_lavmm_rdata                     ),
//    .o_hio_lavmm_rdata_valid                        (o_hio_ch1_lavmm_rdata_valid               ),
//    .o_hio_lavmm_waitreq                            (o_hio_ch1_lavmm_waitreq                   ),
//    .i_hio_pld_rx_clk_in_row_clk                    (i_hio_ch1_pld_rx_clk_in_row_clk           ),
//    .i_hio_pld_tx_clk_in_row_clk                    (i_hio_ch1_pld_tx_clk_in_row_clk           ),
//    .i_hio_det_lat_rx_dl_clk                        (i_hio_ch1_det_lat_rx_dl_clk               ),
//    .i_hio_det_lat_rx_mux_select                    (i_hio_ch1_det_lat_rx_mux_select           ),
//    .i_hio_det_lat_rx_sclk_flop                     (i_hio_ch1_det_lat_rx_sclk_flop            ),
//    .i_hio_det_lat_rx_sclk_gen_clk                  (i_hio_ch1_det_lat_rx_sclk_gen_clk         ),
//    .i_hio_det_lat_rx_trig_flop                     (i_hio_ch1_det_lat_rx_trig_flop            ),
//    .i_hio_det_lat_sampling_clk                     (i_hio_ch1_det_lat_sampling_clk            ),
//    .i_hio_det_lat_tx_dl_clk                        (i_hio_ch1_det_lat_tx_dl_clk               ),
//    .i_hio_det_lat_tx_mux_select                    (i_hio_ch1_det_lat_tx_mux_select           ),
//    .i_hio_det_lat_tx_sclk_flop                     (i_hio_ch1_det_lat_tx_sclk_flop            ),
//    .i_hio_det_lat_tx_sclk_gen_clk                  (i_hio_ch1_det_lat_tx_sclk_gen_clk         ),
//    .i_hio_det_lat_tx_trig_flop                     (i_hio_ch1_det_lat_tx_trig_flop            ),
//
//    .rx_serial_n                                    (rx_serial_n[1]                            ),
//    .rx_serial_p                                    (rx_serial_p[1]                            ),
    //.i_hio_tx_pfc                                   (i_hio_tx_pfc[1]                           ),
    //.i_hio_tx_pause                                 (i_hio_tx_pause[1]                         ),
    //.i_hio_clear_internal                           (i_hio_clear_internal[1]                   ),
    //.i_hio_signal_ok                                (i_hio_signal_ok[1]                        ),
    //.i_hio_pld_ready                                (i_hio_pld_ready[1]                        ),
    //.i_hio_pma_rx_sf                                (i_hio_pma_rx_sf[1]                        ),
    //.i_hio_ch_rstxcvrif_lphy_signal_ok              (i_hio_ch_rstxcvrif_lphy_signal_ok[1]      ),
    //.i_clear_tx_internal_err                        (i_clear_tx_internal_err[1]                ),
//    .o_hio_txdata_fifo_wr_empty                     (o_hio_txdata_fifo_wr_empty[1]             ),
//    .i_hio_txdata_async                             (i_hio_txdata_async [1]                    ),
//    .i_hio_txdata_direct                            (i_hio_txdata_direct[1]                    ),
//    .o_hio_rxdata_async                             (o_hio_rxdata_async [1]                    ),
//    .o_hio_rxdata_direct                            (o_hio_rxdata_direct[1]                    ),
//    .o_hio_txdata_fifo_wr_pempty                    (o_hio_txdata_fifo_wr_pempty[1]            ),
//    .o_hio_txdata_fifo_wr_full                      (o_hio_txdata_fifo_wr_full[1]              ),
//    .o_hio_txdata_fifo_wr_pfull                     (o_hio_txdata_fifo_wr_pfull[1]             ),
//    .o_hio_rxdata                                   (o_hio_rxdata[1]                           ),
//    .o_hio_rxdata_extra                             (o_hio_rxdata_extra[1]                     ),
//    .o_hio_rxdata_fifo_rd_empty                     (o_hio_rxdata_fifo_rd_empty[1]             ),
//    .o_hio_rxdata_fifo_rd_pempty                    (o_hio_rxdata_fifo_rd_pempty[1]            ),
//    .o_hio_rxdata_fifo_rd_full                      (o_hio_rxdata_fifo_rd_full[1]              ),
//    .o_hio_rxdata_fifo_rd_pfull                     (o_hio_rxdata_fifo_rd_pfull[1]             ),
//    .o_hio_rstepcs_rx_pcs_fully_aligned             (o_hio_rstepcs_rx_pcs_fully_aligned[1]     ),
//    .o_hio_rstfec_fec_rx_rdy_n                      (o_hio_rstfec_fec_rx_rdy_n[1]              ),
//    .o_hio_rst_flux0_cpi_cmn_busy                   (o_hio_rst_flux0_cpi_cmn_busy[1]           ),
//    .o_hio_rst_oflux_rx_srds_rdy                    (o_hio_rst_oflux_rx_srds_rdy[1]            ),
//    .o_hio_rst_ux_all_synthlockstatus               (o_hio_rst_ux_all_synthlockstatus[1]       ),
//    .o_hio_rst_ux_octl_pcs_rxstatus                 (o_hio_rst_ux_octl_pcs_rxstatus[1]         ),
//    .o_hio_rst_ux_octl_pcs_txstatus                 (o_hio_rst_ux_octl_pcs_txstatus[1]         ),
//    .o_hio_rst_ux_rxcdrlock2data                    (o_hio_rst_ux_rxcdrlock2data[1]            ),
//    .o_hio_rst_ux_rxcdrlockstatus                   (o_hio_rst_ux_rxcdrlockstatus[1]           ),
//    .o_hio_uxquad_async                             (o_hio_uxquad_async[1]                     ),
    //.k_user_rx_clk1_c0c1c2_sel                      (k_user_rx_clk1_c0c1c2_sel[1]              ),
    //.k_user_rx_clk2_c0c1c2_sel                      (k_user_rx_clk2_c0c1c2_sel[1]              ),
    //.k_user_tx_clk1_c0c1c2_sel                      (k_user_tx_clk1_c0c1c2_sel[1]              ),
    //.k_user_tx_clk2_c0c1c2_sel                      (k_user_tx_clk2_c0c1c2_sel[1]              ),
//
//    .o_hio_user_rx_clk1_clk                         (o_hio_ch1_user_rx_clk1_clk                ),
//    .o_hio_user_rx_clk2_clk                         (o_hio_ch1_user_rx_clk2_clk                ),
//    .o_hio_user_tx_clk1_clk                         (o_hio_ch1_user_tx_clk1_clk                ),
//    .o_hio_user_tx_clk2_clk                         (o_hio_ch1_user_tx_clk2_clk                ),
//    .o_hio_ux_chnl_refclk_mux                       (o_hio_ch1_ux_chnl_refclk_mux              ),
//    .o_hio_det_lat_rx_async_dl_sync                 (o_hio_ch1_det_lat_rx_async_dl_sync        ),
//    .o_hio_det_lat_rx_async_pulse                   (o_hio_ch1_det_lat_rx_async_pulse          ),
//    .o_hio_det_lat_rx_async_sample_sync             (o_hio_ch1_det_lat_rx_async_sample_sync    ),
//    .o_hio_det_lat_rx_sclk_sample_sync              (o_hio_ch1_det_lat_rx_sclk_sample_sync     ),
//    .o_hio_det_lat_rx_trig_sample_sync              (o_hio_ch1_det_lat_rx_trig_sample_sync     ),
//    .o_hio_det_lat_tx_async_dl_sync                 (o_hio_ch1_det_lat_tx_async_dl_sync        ),
//    .o_hio_det_lat_tx_async_pulse                   (o_hio_ch1_det_lat_tx_async_pulse          ),
//    .o_hio_det_lat_tx_async_sample_sync             (o_hio_ch1_det_lat_tx_async_sample_sync    ),
//    .o_hio_det_lat_tx_sclk_sample_sync              (o_hio_ch1_det_lat_tx_sclk_sample_sync     ),
//    .o_hio_det_lat_tx_trig_sample_sync              (o_hio_ch1_det_lat_tx_trig_sample_sync     ),
//    .o_hio_xcvrif_rx_latency_pulse                  (o_hio_ch1_xcvrif_rx_latency_pulse         ),
//    .o_hio_xcvrif_tx_latency_pulse                  (o_hio_ch1_xcvrif_tx_latency_pulse         ),
//
//    .tx_serial_p                                    (tx_serial_p[1]                            ),
//    .tx_serial_n                                    (tx_serial_n[1]                            ),
   // .o_hio_local_fault                              (o_hio_local_fault[1]                      ),
   // .o_hio_remote_fault                             (o_hio_remote_fault[1]                     ),
   // .o_hio_rx_pause                                 (o_hio_rx_pause[1]                         ),
   // .o_hio_rx_pfc                                   (o_hio_rx_pfc[1]                           ),
   // .o_hio_txfifo_pfull                             (o_hio_txfifo_pfull[1]                     ),
   // .o_hio_dsk_mon_err                              (o_hio_dsk_mon_err[1]                      ),
   // .o_hio_hip_ready                                (o_hio_hip_ready[1]                        ),
   // .o_hio_rx_block_lock                            (o_hio_rx_block_lock[1]                    ),
   // .o_hio_rx_dsk_done                              (o_hio_rx_dsk_done[1]                      ),
   // .o_hio_rx_am_lock                               (o_hio_rx_am_lock[1]                       ),
   // .o_hio_rx_pcs_fully_aligned                     (o_hio_rx_pcs_fully_aligned[1]             ),
   // .o_hio_hi_ber                                   (o_hio_hi_ber[1]                           ),
   // .o_hio_rx_pcs_internal_err                      (o_hio_rx_pcs_internal_err[1]              ),
   // .o_hio_tx_fifo_status_fifo_wr_pfull             (o_hio_tx_fifo_status_fifo_wr_pfull[1]     ),
   // .o_hio_tx_fifo_status_fifo_pempty               (o_hio_tx_fifo_status_fifo_pempty[1]       ),
   // .o_hio_rx_fifo_status_fifo_pempty               (o_hio_rx_fifo_status_fifo_pempty[1]       ),
   // .o_hio_rx_fifo_status_fifo_wr_pfull             (o_hio_rx_fifo_status_fifo_wr_pfull[1]     ),
   // .o_hio_rx_fifo_status_fifo_empty                (o_hio_rx_fifo_status_fifo_empty[1]        ),
   // .o_hio_tx_fifo_status_fifo_empty                (o_hio_tx_fifo_status_fifo_empty[1]        ),
   // .o_hio_rx_fifo_status_gb_restarted              (o_hio_rx_fifo_status_gb_restarted[1]      ),
   // .o_hio_tx_fifo_status_gb_restarted              (o_hio_tx_fifo_status_gb_restarted[1]      ),
    
//    .i_uxwrap_bus_in_phy_shared                     (uxwrap_bus_in_phy_shared[1]              ),      //ipfluxtop_uxtop_wrap signals to phy_hal_shared
//    .o_uxwrap_bus_out_phy_shared                    (uxwrap_bus_out_phy_shared[1]             ),
    //.o_flux_sclk_mux_phy_shared                   (flux_sclk_mux_phy_shared[1]                ),    //sm_flux_ingress_signals to phy_hal_shared////not used, should i remove 
    //.i_ss_async_pldif_phy_shared                  (ss_async_pldif_phy_shared[1]               ),    //sm_flux_ingress_signals to phy_hal_shared 
    //.o_ss_async_pldif_phy_shared                    (ss_async_pldif_phy_shared[1]             ),    
    //.i_ss_async_pldif_pcie_mux_phy_shared           (ss_async_pldif_pcie_mux_phy_shared[1]    ),    
//    .o_lavmm_addr_phy_shared                        (lavmm_addr_phy_shared[1]                 ),
//    .o_lavmm_be_phy_shared                          (lavmm_be_phy_shared[1]                   ),
//    .o_lavmm_clk_phy_shared                         (lavmm_clk_phy_shared[1]                  ),
//    .o_lavmm_read_phy_shared                        (lavmm_read_phy_shared[1]                 ),
//    .o_lavmm_rstn_phy_shared                        (lavmm_rstn_phy_shared[1]                 ),
//    .o_lavmm_wdata_phy_shared                       (lavmm_wdata_phy_shared[1]                ),
//    .o_lavmm_write_phy_shared                       (lavmm_write_phy_shared[1]                ),
//    .i_lavmm_rdata_phy_shared                       (lavmm_rdata_phy_shared[1]                ),
//    .i_lavmm_rdata_valid_phy_shared                 (lavmm_rdata_valid_phy_shared[1]          ),
//    .i_lavmm_waitreq_phy_shared                     (lavmm_waitreq_phy_shared[1]              ),
    //.i_rxpstate_phy_shared                          (rxpstate_phy_shared[1]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxrate_phy_shared                            (rxrate_phy_shared[1]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxterm_hiz_ena_phy_shared                    (rxterm_hiz_ena_phy_shared[1]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxwidth_phy_shared                           (rxwidth_phy_shared[1]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_tstbus_lane_phy_shared                       (tstbus_lane_phy_shared[1]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txbeacona_phy_shared                         (txbeacona_phy_shared[1]                  ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txclkdivrate_phy_shared                      (txclkdivrate_phy_shared[1]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdetectrx_reqa_phy_shared                   (txdetectrx_reqa_phy_shared[1]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levn_phy_shared                        (txdrv_levn_phy_shared[1]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm1_phy_shared                      (txdrv_levnm1_phy_shared[1]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm2_phy_shared                      (txdrv_levnm2_phy_shared[1]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnp1_phy_shared                      (txdrv_levnp1_phy_shared[1]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_slew_phy_shared                        (txdrv_slew_phy_shared[1]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txelecidle_phy_shared                        (txelecidle_phy_shared[1]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txpstate_phy_shared                          (txpstate_phy_shared[1]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txrate_phy_shared                            (txrate_phy_shared[1]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txwidth_phy_shared                           (txwidth_phy_shared[1]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.o_rxmargin_status_gray_phy_shared              (rxmargin_status_gray_phy_shared[1]       ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rst_ux_rx_sfrz_phy_shared                    (rst_ux_rx_sfrz_phy_shared[1]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_flux0_cpi_cmn_busy_phy_shared            (rst_flux0_cpi_cmn_busy_phy_shared[1]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_oflux_rx_srds_rdy_phy_shared             (rst_oflux_rx_srds_rdy_phy_shared[1]      ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_ux_all_synthlockstatus_phy_shared        (rst_ux_all_synthlockstatus_phy_shared[1] ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_rst_ux_rxcdrlockstatus_phy_shared            (rst_ux_rxcdrlockstatus_phy_shared[1]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_cdrfbclk_phy_shared                  (ock_pcs_cdrfbclk_phy_shared[1]           ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_ref_phy_shared                       (ock_pcs_ref_phy_shared[1]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ux_tx_ch_ptr_smpl_phy_shared                 (ux_tx_ch_ptr_smpl_phy_shared[1]          ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
//    .o_dat_pcs_measlatrndtripbit_phy_shared         (dat_pcs_measlatrndtripbit_phy_shared[1]  ),        ////Navid sheet says to sm_ux_toolbox, but in toolbox it says to fluxcore, so not added in phy_shared. In sujoys, connected to toolbox. Should I add this to physhared
//    .o_sclk_return_sel_rx_phy_shared                (sclk_return_sel_rx_phy_shared[1]         ),
//    .o_sclk_return_sel_tx_phy_shared                (sclk_return_sel_tx_phy_shared[1]         ),
    //.i_ick_sclk_rx_phy_shared                       (s_i_ick_sclk_rx_phy_shared[1]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.i_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[1]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
//    .o_ick_sclk_rx_phy_shared                       (s_o_ick_sclk_rx_phy_shared[1]            ),
//    .i_sync_common_control_phy_shared               (sync_common_control_phy_shared[1]        ),
//    
//    .o_ft_rx_sclk_sync_ch_phy_shared                (ft_rx_sclk_sync_ch_phy_shared[1]            ) ,
//    .o_ft_tx_sclk_sync_ch_phy_shared                (ft_tx_sclk_sync_ch_phy_shared[1]            ) ,
//    .o_rst_ux_rx_pma_rst_n_phy_shared               (rst_ux_rx_pma_rst_n_phy_shared[1]           ) ,
//    .o_rst_ux_tx_pma_rst_n_phy_shared               (rst_ux_tx_pma_rst_n_phy_shared[1]           ) ,
//    .o_ick_pcs_txword_phy_shared                    (ick_pcs_txword_phy_shared[1]                ) ,
//    .o_tx_dl_ch_bit_phy_shared                      (tx_dl_ch_bit_phy_shared[1]                  ) ,
//    .i_dat_pcs_measlatbit_phy_shared                (dat_pcs_measlatbit_phy_shared[1]            ) ,
//    .i_ft_rx_async_pulse_ch_phy_shared              (ft_rx_async_pulse_ch_phy_shared[1]          ) ,
//    .i_ft_tx_async_pulse_ch_phy_shared              (ft_tx_async_pulse_ch_phy_shared[1]          ) ,
//    .i_rx_dl_ch_bit_phy_shared                      (rx_dl_ch_bit_phy_shared[1]                  ) ,
//    .i_ux_rxuser1_sel_phy_shared                    (ux_rxuser1_sel_phy_shared[1]                ) ,
//    .i_ux_rxuser2_sel_phy_shared                    (ux_rxuser2_sel_phy_shared[1]                ) ,
//    .i_ux_txuser1_sel_phy_shared                    (ux_txuser1_sel_phy_shared[1]                ) ,
//    .i_ux_txuser2_sel_phy_shared                    (ux_txuser2_sel_phy_shared[1]                ) ,
//    .o_octl_pcs_txstatus_a_phy_shared               (octl_pcs_txstatus_a_phy_shared[1]           ) ,
//    .i_ictl_pcs_txenable_a_phy_shared               (ictl_pcs_txenable_a_phy_shared[1]           ) ,
//    .i_sync_cfg_data_phy_shared                     (sync_cfg_data_phy_shared[1]                 ) ,
//    .i_sync_interface_control_phy_shared            (sync_interface_control_phy_shared[1]        ) ,
//    .o_tx_data_phy_shared                           (tx_data_phy_shared[1]                       ) ,
//    .i_rx_data_phy_shared                           (rx_data_phy_shared[1]                       ) ,
//    .o_sm_flux_ingress_phy_shared                   (sm_flux_ingress_phy_shared[1]               ) ,
//    .i_sm_flux_egress_phy_shared                    (sm_flux_egress_phy_shared[1]                ) ,
//    .i_flux_cpi_int_phy_shared                      (flux_cpi_int_phy_shared                               ) ,      //only one bit needed
//    .i_flux_int_phy_shared                          (flux_int_phy_shared[1]                      ) ,
//    .i_oflux_octl_pcs_txptr_smpl_lane_phy_shared    (oflux_octl_pcs_txptr_smpl_lane_phy_shared[1]) ,
//    .o_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[1]                   ) ,
//    .i_flux_srds_rdy_phy_shared                     (flux_srds_rdy_phy_shared[1]                 ) ,
//    .i_pcs_rxword_phy_shared                        (pcs_rxword_phy_shared[1]                    ) ,
//    .i_pcs_rxpostdiv_phy_shared                     (pcs_rxpostdiv_phy_shared[1]                 ) ,
//    .i_ock_pcs_txword_phy_shared                    (ock_pcs_txword_phy_shared[1]                ) ,
//
//    .o_ch_lavmm_fec_addr_fec_wrap                   (ch_lavmm_fec_addr_fec_wrap[1]),
//    .o_ch_lavmm_fec_be_fec_wrap                     (ch_lavmm_fec_be_fec_wrap[1]),
//    .o_ch_lavmm_fec_clk_fec_wrap                    (ch_lavmm_fec_clk_fec_wrap[1]),
//    .o_ch_lavmm_fec_read_fec_wrap                   (ch_lavmm_fec_read_fec_wrap[1]),
//    .o_ch_lavmm_fec_rstn_fec_wrap                   (ch_lavmm_fec_rstn_fec_wrap[1]),
//    .o_ch_lavmm_fec_wdata_fec_wrap                  (ch_lavmm_fec_wdata_fec_wrap[1]),
//    .o_ch_lavmm_fec_write_fec_wrap                  (ch_lavmm_fec_write_fec_wrap[1]),
//    .i_ch_lavmm_fec_rdata_fec_wrap                  (ch_lavmm_fec_rdata_fec_wrap[1]),
//    .i_ch_lavmm_fec_rdata_valid_fec_wrap            (ch_lavmm_fec_rdata_valid_fec_wrap[1]),
//    .i_ch_lavmm_fec_waitreq_fec_wrap                (ch_lavmm_fec_waitreq_fec_wrap[1]),
//    .i_ch_eth_fec_rx_async_fec_wrap                 (ch_eth_fec_rx_async_fec_wrap[1]),
//    .i_ch_eth_fec_rx_direct_fec_wrap                (ch_eth_fec_rx_direct_fec_wrap[1]),
//    .o_ch_eth_fec_tx_async_fec_wrap                 (ch_eth_fec_tx_async_fec_wrap[1]),
//    .o_ch_eth_fec_tx_direct_fec_wrap                (ch_eth_fec_tx_direct_fec_wrap[1]),
//    .o_rstfec_fec_csr_ret_fec_wrap                  (rstfec_fec_csr_ret_fec_wrap[1]),
//    .i_fec_rx_rdy_n_fec_wrap                        (fec_rx_rdy_n_fec_wrap[1]),
//    .o_rstfec_fec_rx_rst_n_fec_wrap                 (rstfec_fec_rx_rst_n_fec_wrap[1]),
//    .o_rstfec_fec_tx_rst_n_fec_wrap                 (rstfec_fec_tx_rst_n_fec_wrap[1]),
//    .o_rstfec_rx_fec_sfrz_n_fec_wrap                (rstfec_rx_fec_sfrz_n_fec_wrap[1]),
//    .o_rstfec_tx_fec_sfrz_n_fec_wrap                (rstfec_tx_fec_sfrz_n_fec_wrap[1]),
//    .i_fec_tx_data_mux_sel_fec_wrap                 (fec_tx_data_mux_sel_fec_wrap[1]),
//    .i_fec_rx_data_fec_wrap                         (fec_rx_data_fec_wrap[1]),
//    .o_fec_i_tx_mux_data_fec_wrap                   (fec_i_tx_mux_data_fec_wrap[1]),
//    .o_xcvr_rx_data                                 (xcvr_rx_data[1]),
//    .i_xcvr_tx_data                                 (xcvr_tx_data[1]),
//    .o_pma_rx_sf                                    (pma_rx_sf[1]),
//
//    .i_refclk_tx_p                                  (i_refclk_tx_p   ),
//    .i_refclk_tx_n                                  (i_refclk_tx_n   ),//can derive as negated i_refclk_tx_p
//    .i_syspll_c0_clk                                (i_syspll_c0_clk ),
//    .i_syspll_c1_clk                                (i_syspll_c1_clk ),
//    .i_syspll_c2_clk                                (i_syspll_c2_clk ),
//    .i_flux_clk                                     (i_flux_clk      ),
//    .i_refclk_rx_p                                  (i_refclk_rx_p   ),
//    .i_refclk_rx_n                                  (i_refclk_rx_n   ),
//
//    .i_ux_chnl_refclk_mux_phy_shared                (sm_flux_egress_phy_shared[1][193]),
//    .i_ch0_top_xcvrif_tx_fifo_rd_en                 (),
//    .i_ch1_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch2_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch3_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch0_top_xcvrif_rx_fifo_rd_en                 (),
//    .i_ch1_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch2_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch3_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch0_top_xcvrif_tx_rst_mux                    (),
//    .i_ch1_xcvrif_tx_rst_mux                        (),
//    .i_ch2_xcvrif_tx_rst_mux                        (),
//    .i_ch3_xcvrif_tx_rst_mux                        (),
//    .i_ux0_top_xcvrif_tx_word_clk                   (),
//    .i_ux1_xcvrif_tx_word_clk                       (),
//    .i_ux2_xcvrif_tx_word_clk                       (),
//    .i_ux3_xcvrif_tx_word_clk                       (),
//    .ioack_cdrdiv_left_ux_bidir_in                  (),
//    .ioack_synthdiv1_left_ux_bidir_in               (),
//    .ioack_synthdiv2_left_ux_bidir_in               (),
//    .ioack_cdrdiv_right_ux_bidir_out                (),
//    .ioack_synthdiv1_right_ux_bidir_out             (),
//    .ioack_synthdiv2_right_ux_bidir_out             ()
//
//);
//  }
//  if {PCIE_GEN4=="PCIE_GEN1" || PCIE_GEN4=="PCIE_GEN2" || PCIE_GEN4=="PCIE_GEN3" || PCIE_GEN4=="PCIE_GEN4"} {

system_intel_pcie_gts_0_pcie_hal_top_one_lane_pcie_hal_2100_grpui7y one_lane_pcie_inst_2(
    .i_hio_txdata                                   (i_hio_txdata[3]                           ),
    .i_hio_txdata_extra                             (i_hio_txdata_extra[3]                     ),
    .i_hio_txdata_fifo_wr_en                        (i_hio_txdata_fifo_wr_en[3]                ),
    .i_hio_rxdata_fifo_rd_en                        (i_hio_rxdata_fifo_rd_en[3]                ),
    .i_hio_ptp_rst_n                                (i_hio_ptp_rst_n[3]                        ),
    .i_hio_ehip_rx_rst_n                            (i_hio_ehip_rx_rst_n[3]                    ),
    .i_hio_ehip_tx_rst_n                            (i_hio_ehip_tx_rst_n[3]                    ),
    .i_hio_ehip_signal_ok                           (i_hio_ehip_signal_ok[3]                   ),
    .i_hio_sfreeze_2_r03f_rx_mac_srfz_n             (i_hio_sfreeze_2_r03f_rx_mac_srfz_n[3]     ),
    .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n           (i_hio_sfreeze_3_c2f_tx_deskew_srfz_n[3]   ),
    .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n             (i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n[3]     ),
    .i_hio_rstfec_fec_rx_rst_n                      (i_hio_rstfec_fec_rx_rst_n[3]              ),
    .i_hio_rstfec_fec_tx_rst_n                      (i_hio_rstfec_fec_tx_rst_n[3]              ),
    .i_hio_rstfec_fec_csr_ret                       (i_hio_rstfec_fec_csr_ret[3]               ),
    .i_hio_rstfec_rx_fec_sfrz_n                     (i_hio_rstfec_rx_fec_sfrz_n[3]             ),
    .i_hio_rstfec_tx_fec_sfrz_n                     (i_hio_rstfec_tx_fec_sfrz_n[3]             ),
    .i_hio_rstxcvrif_xcvrif_rx_rst_n                (i_hio_rstxcvrif_xcvrif_rx_rst_n[3]        ),
    .i_hio_rstxcvrif_xcvrif_tx_rst_n                (i_hio_rstxcvrif_xcvrif_tx_rst_n[3]        ),
    .i_hio_rstxcvrif_xcvrif_signal_ok               (i_hio_rstxcvrif_xcvrif_signal_ok[3]       ),
    .i_hio_rstxcvrif_rx_xcvrif_sfrz_n               (i_hio_rstxcvrif_rx_xcvrif_sfrz_n[3]       ),
    .i_hio_rstxcvrif_tx_xcvrif_sfrz_n               (i_hio_rstxcvrif_tx_xcvrif_sfrz_n[3]       ),
    .i_hio_rst_pld_clrhip                           (i_hio_rst_pld_clrhip[3]                   ),
    .i_hio_rst_pld_clrpcs                           (i_hio_rst_pld_clrpcs[3]                   ),
    .i_hio_rst_pld_perstn                           (i_hio_rst_pld_perstn[3]                   ),
    .i_hio_rst_pld_ready                            (i_hio_rst_pld_ready[3]                    ),
    .i_hio_rst_pld_adapter_rx_pld_rst_n             (i_hio_rst_pld_adapter_rx_pld_rst_n[3]     ),
    .i_hio_rst_pld_adapter_tx_pld_rst_n             (i_hio_rst_pld_adapter_tx_pld_rst_n[3]     ),
    .i_hio_rst_ux_rx_pma_rst_n                      (i_hio_rst_ux_rx_pma_rst_n[3]              ),
    .i_hio_rst_ux_rx_sfrz                           (i_hio_rst_ux_rx_sfrz[3]                   ),
    .i_hio_rst_ux_tx_pma_rst_n                      (i_hio_rst_ux_tx_pma_rst_n[3]              ),
    .i_hio_pld_reset_clk_row                        (i_hio_pld_reset_clk_row[3]                ),
    .i_hio_uxquad_async                             (i_hio_uxquad_async[3]                     ),
    .i_hio_uxquad_async_pcie_mux                    (i_hio_uxquad_async_pcie_mux[3]            ),

    .i_hio_lavmm_clk                                (i_hio_ch3_lavmm_clk                       ),
    .i_hio_lavmm_rstn                               (i_hio_ch3_lavmm_rstn                      ),
    .i_hio_lavmm_addr                               (i_hio_ch3_lavmm_addr                      ),
    .i_hio_lavmm_be                                 (i_hio_ch3_lavmm_be                        ),
    .i_hio_lavmm_read                               (i_hio_ch3_lavmm_read                      ),
    .i_hio_lavmm_wdata                              (i_hio_ch3_lavmm_wdata                     ),
    .i_hio_lavmm_write                              (i_hio_ch3_lavmm_write                     ),
    .o_hio_lavmm_rdata                              (o_hio_ch3_lavmm_rdata                     ),
    .o_hio_lavmm_rdata_valid                        (o_hio_ch3_lavmm_rdata_valid               ),
    .o_hio_lavmm_waitreq                            (o_hio_ch3_lavmm_waitreq                   ),
    .i_hio_pld_rx_clk_in_row_clk                    (i_hio_ch3_pld_rx_clk_in_row_clk           ),
    .i_hio_pld_tx_clk_in_row_clk                    (i_hio_ch3_pld_tx_clk_in_row_clk           ),
    .i_hio_det_lat_rx_dl_clk                        (i_hio_ch3_det_lat_rx_dl_clk               ),
    .i_hio_det_lat_rx_mux_select                    (i_hio_ch3_det_lat_rx_mux_select           ),
    .i_hio_det_lat_rx_sclk_flop                     (i_hio_ch3_det_lat_rx_sclk_flop            ),
    .i_hio_det_lat_rx_sclk_gen_clk                  (i_hio_ch3_det_lat_rx_sclk_gen_clk         ),
    .i_hio_det_lat_rx_trig_flop                     (i_hio_ch3_det_lat_rx_trig_flop            ),
    .i_hio_det_lat_sampling_clk                     (i_hio_ch3_det_lat_sampling_clk            ),
    .i_hio_det_lat_tx_dl_clk                        (i_hio_ch3_det_lat_tx_dl_clk               ),
    .i_hio_det_lat_tx_mux_select                    (i_hio_ch3_det_lat_tx_mux_select           ),
    .i_hio_det_lat_tx_sclk_flop                     (i_hio_ch3_det_lat_tx_sclk_flop            ),
    .i_hio_det_lat_tx_sclk_gen_clk                  (i_hio_ch3_det_lat_tx_sclk_gen_clk         ),
    .i_hio_det_lat_tx_trig_flop                     (i_hio_ch3_det_lat_tx_trig_flop            ),

    .rx_serial_n                                    (rx_serial_n[2]                            ),
    .rx_serial_p                                    (rx_serial_p[2]                            ),
    //.i_hio_tx_pfc                                   (i_hio_tx_pfc[2]                           ),
    //.i_hio_tx_pause                                 (i_hio_tx_pause[2]                         ),
    //.i_hio_clear_internal                           (i_hio_clear_internal[2]                   ),
    //.i_hio_signal_ok                                (i_hio_signal_ok[2]                        ),
    //.i_hio_pld_ready                                (i_hio_pld_ready[2]                        ),
    //.i_hio_pma_rx_sf                                (i_hio_pma_rx_sf[2]                        ),
    //.i_hio_ch_rstxcvrif_lphy_signal_ok              (i_hio_ch_rstxcvrif_lphy_signal_ok[2]      ),
    //.i_clear_tx_internal_err                        (i_clear_tx_internal_err[2]                ),
    .o_hio_txdata_fifo_wr_empty                     (o_hio_txdata_fifo_wr_empty[3]             ),
    .i_hio_txdata_async                             (i_hio_txdata_async[3]                     ),
    .i_hio_txdata_direct                            (i_hio_txdata_direct[3]                    ),
    .o_hio_rxdata_async                             (o_hio_rxdata_async[3]                     ),
    .o_hio_rxdata_direct                            (o_hio_rxdata_direct[3]                    ),
    .o_hio_txdata_fifo_wr_pempty                    (o_hio_txdata_fifo_wr_pempty[3]            ),
    .o_hio_txdata_fifo_wr_full                      (o_hio_txdata_fifo_wr_full[3]              ),
    .o_hio_txdata_fifo_wr_pfull                     (o_hio_txdata_fifo_wr_pfull[3]             ),
    .o_hio_rxdata                                   (o_hio_rxdata[3]                           ),
    .o_hio_rxdata_extra                             (o_hio_rxdata_extra[3]                     ),
    .o_hio_rxdata_fifo_rd_empty                     (o_hio_rxdata_fifo_rd_empty[3]             ),
    .o_hio_rxdata_fifo_rd_pempty                    (o_hio_rxdata_fifo_rd_pempty[3]            ),
    .o_hio_rxdata_fifo_rd_full                      (o_hio_rxdata_fifo_rd_full[3]              ),
    .o_hio_rxdata_fifo_rd_pfull                     (o_hio_rxdata_fifo_rd_pfull[3]             ),
    .o_hio_rstepcs_rx_pcs_fully_aligned             (o_hio_rstepcs_rx_pcs_fully_aligned[3]     ),
    .o_hio_rstfec_fec_rx_rdy_n                      (o_hio_rstfec_fec_rx_rdy_n[3]              ),
    .o_hio_rst_flux0_cpi_cmn_busy                   (o_hio_rst_flux0_cpi_cmn_busy[3]           ),
    .o_hio_rst_oflux_rx_srds_rdy                    (o_hio_rst_oflux_rx_srds_rdy[3]            ),
    .o_hio_rst_ux_all_synthlockstatus               (o_hio_rst_ux_all_synthlockstatus[3]       ),
    .o_hio_rst_ux_octl_pcs_rxstatus                 (o_hio_rst_ux_octl_pcs_rxstatus[3]         ),
    .o_hio_rst_ux_octl_pcs_txstatus                 (o_hio_rst_ux_octl_pcs_txstatus[3]         ),
    .o_hio_rst_ux_rxcdrlock2data                    (o_hio_rst_ux_rxcdrlock2data[3]            ),
    .o_hio_rst_ux_rxcdrlockstatus                   (o_hio_rst_ux_rxcdrlockstatus[3]           ),
    .o_hio_uxquad_async                             (o_hio_uxquad_async[3]                     ),
    //.k_user_rx_clk1_c0c1c2_sel                      (k_user_rx_clk1_c0c1c2_sel[2]              ),
    //.k_user_rx_clk2_c0c1c2_sel                      (k_user_rx_clk2_c0c1c2_sel[2]              ),
    //.k_user_tx_clk1_c0c1c2_sel                      (k_user_tx_clk1_c0c1c2_sel[2]              ),
    //.k_user_tx_clk2_c0c1c2_sel                      (k_user_tx_clk2_c0c1c2_sel[2]              ),

    .o_hio_user_rx_clk1_clk                         (o_hio_ch3_user_rx_clk1_clk                ),
    .o_hio_user_rx_clk2_clk                         (o_hio_ch3_user_rx_clk2_clk                ),
    .o_hio_user_tx_clk1_clk                         (o_hio_ch3_user_tx_clk1_clk                ),
    .o_hio_user_tx_clk2_clk                         (o_hio_ch3_user_tx_clk2_clk                ),
    .o_hio_ux_chnl_refclk_mux                       (o_hio_ch3_ux_chnl_refclk_mux              ),
    .o_hio_det_lat_rx_async_dl_sync                 (o_hio_ch3_det_lat_rx_async_dl_sync        ),
    .o_hio_det_lat_rx_async_pulse                   (o_hio_ch3_det_lat_rx_async_pulse          ),
    .o_hio_det_lat_rx_async_sample_sync             (o_hio_ch3_det_lat_rx_async_sample_sync    ),
    .o_hio_det_lat_rx_sclk_sample_sync              (o_hio_ch3_det_lat_rx_sclk_sample_sync     ),
    .o_hio_det_lat_rx_trig_sample_sync              (o_hio_ch3_det_lat_rx_trig_sample_sync     ),
    .o_hio_det_lat_tx_async_dl_sync                 (o_hio_ch3_det_lat_tx_async_dl_sync        ),
    .o_hio_det_lat_tx_async_pulse                   (o_hio_ch3_det_lat_tx_async_pulse          ),
    .o_hio_det_lat_tx_async_sample_sync             (o_hio_ch3_det_lat_tx_async_sample_sync    ),
    .o_hio_det_lat_tx_sclk_sample_sync              (o_hio_ch3_det_lat_tx_sclk_sample_sync     ),
    .o_hio_det_lat_tx_trig_sample_sync              (o_hio_ch3_det_lat_tx_trig_sample_sync     ),
    .o_hio_xcvrif_rx_latency_pulse                  (o_hio_ch3_xcvrif_rx_latency_pulse         ),
    .o_hio_xcvrif_tx_latency_pulse                  (o_hio_ch3_xcvrif_tx_latency_pulse         ),

    .tx_serial_p                                    (tx_serial_p[2]                            ),
    .tx_serial_n                                    (tx_serial_n[2]                            ),
   // .o_hio_local_fault                              (o_hio_local_fault[2]                      ),
   // .o_hio_remote_fault                             (o_hio_remote_fault[2]                     ),
   // .o_hio_rx_pause                                 (o_hio_rx_pause[2]                         ),
   // .o_hio_rx_pfc                                   (o_hio_rx_pfc[2]                           ),
   // .o_hio_txfifo_pfull                             (o_hio_txfifo_pfull[2]                     ),
   // .o_hio_dsk_mon_err                              (o_hio_dsk_mon_err[2]                      ),
   // .o_hio_hip_ready                                (o_hio_hip_ready[2]                        ),
   // .o_hio_rx_block_lock                            (o_hio_rx_block_lock[2]                    ),
   // .o_hio_rx_dsk_done                              (o_hio_rx_dsk_done[2]                      ),
   // .o_hio_rx_am_lock                               (o_hio_rx_am_lock[2]                       ),
   // .o_hio_rx_pcs_fully_aligned                     (o_hio_rx_pcs_fully_aligned[2]             ),
   // .o_hio_hi_ber                                   (o_hio_hi_ber[2]                           ),
   // .o_hio_rx_pcs_internal_err                      (o_hio_rx_pcs_internal_err[2]              ),
   // .o_hio_tx_fifo_status_fifo_wr_pfull             (o_hio_tx_fifo_status_fifo_wr_pfull[2]     ),
   // .o_hio_tx_fifo_status_fifo_pempty               (o_hio_tx_fifo_status_fifo_pempty[2]       ),
   // .o_hio_rx_fifo_status_fifo_pempty               (o_hio_rx_fifo_status_fifo_pempty[2]       ),
   // .o_hio_rx_fifo_status_fifo_wr_pfull             (o_hio_rx_fifo_status_fifo_wr_pfull[2]     ),
   // .o_hio_rx_fifo_status_fifo_empty                (o_hio_rx_fifo_status_fifo_empty[2]        ),
   // .o_hio_tx_fifo_status_fifo_empty                (o_hio_tx_fifo_status_fifo_empty[2]        ),
   // .o_hio_rx_fifo_status_gb_restarted              (o_hio_rx_fifo_status_gb_restarted[2]      ),
   // .o_hio_tx_fifo_status_gb_restarted              (o_hio_tx_fifo_status_gb_restarted[2]      ),
    
    .i_uxwrap_bus_in_phy_shared                     (uxwrap_bus_in_phy_shared[2]              ),      //ipfluxtop_uxtop_wrap signals to phy_hal_shared
    .o_uxwrap_bus_out_phy_shared                    (uxwrap_bus_out_phy_shared[2]             ),
    //.o_flux_sclk_mux_phy_shared                   (flux_sclk_mux_phy_shared[2]                ),    //sm_flux_ingress_signals to phy_hal_shared////not used, should i remove 
    //.i_ss_async_pldif_phy_shared                  (ss_async_pldif_phy_shared[2]               ),    //sm_flux_ingress_signals to phy_hal_shared 
    //.o_ss_async_pldif_phy_shared                    (ss_async_pldif_phy_shared[2]             ),    
    //.i_ss_async_pldif_pcie_mux_phy_shared           (ss_async_pldif_pcie_mux_phy_shared[2]    ),    
    .o_lavmm_addr_phy_shared                        (lavmm_addr_phy_shared[2]                 ),
    .o_lavmm_be_phy_shared                          (lavmm_be_phy_shared[2]                   ),
    .o_lavmm_clk_phy_shared                         (lavmm_clk_phy_shared[2]                  ),
    .o_lavmm_read_phy_shared                        (lavmm_read_phy_shared[2]                 ),
    .o_lavmm_rstn_phy_shared                        (lavmm_rstn_phy_shared[2]                 ),
    .o_lavmm_wdata_phy_shared                       (lavmm_wdata_phy_shared[2]                ),
    .o_lavmm_write_phy_shared                       (lavmm_write_phy_shared[2]                ),
    .i_lavmm_rdata_phy_shared                       (lavmm_rdata_phy_shared[2]                ),
    .i_lavmm_rdata_valid_phy_shared                 (lavmm_rdata_valid_phy_shared[2]          ),
    .i_lavmm_waitreq_phy_shared                     (lavmm_waitreq_phy_shared[2]              ),
    //.i_rxpstate_phy_shared                          (rxpstate_phy_shared[2]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxrate_phy_shared                            (rxrate_phy_shared[2]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxterm_hiz_ena_phy_shared                    (rxterm_hiz_ena_phy_shared[2]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxwidth_phy_shared                           (rxwidth_phy_shared[2]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_tstbus_lane_phy_shared                       (tstbus_lane_phy_shared[2]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txbeacona_phy_shared                         (txbeacona_phy_shared[2]                  ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txclkdivrate_phy_shared                      (txclkdivrate_phy_shared[2]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdetectrx_reqa_phy_shared                   (txdetectrx_reqa_phy_shared[2]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levn_phy_shared                        (txdrv_levn_phy_shared[2]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm1_phy_shared                      (txdrv_levnm1_phy_shared[2]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm2_phy_shared                      (txdrv_levnm2_phy_shared[2]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnp1_phy_shared                      (txdrv_levnp1_phy_shared[2]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_slew_phy_shared                        (txdrv_slew_phy_shared[2]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txelecidle_phy_shared                        (txelecidle_phy_shared[2]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txpstate_phy_shared                          (txpstate_phy_shared[2]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txrate_phy_shared                            (txrate_phy_shared[2]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txwidth_phy_shared                           (txwidth_phy_shared[2]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.o_rxmargin_status_gray_phy_shared              (rxmargin_status_gray_phy_shared[2]       ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rst_ux_rx_sfrz_phy_shared                    (rst_ux_rx_sfrz_phy_shared[2]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_flux0_cpi_cmn_busy_phy_shared            (rst_flux0_cpi_cmn_busy_phy_shared[2]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_oflux_rx_srds_rdy_phy_shared             (rst_oflux_rx_srds_rdy_phy_shared[2]      ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_ux_all_synthlockstatus_phy_shared        (rst_ux_all_synthlockstatus_phy_shared[2] ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_rst_ux_rxcdrlockstatus_phy_shared            (rst_ux_rxcdrlockstatus_phy_shared[2]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_cdrfbclk_phy_shared                  (ock_pcs_cdrfbclk_phy_shared[2]           ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_ref_phy_shared                       (ock_pcs_ref_phy_shared[2]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ux_tx_ch_ptr_smpl_phy_shared                 (ux_tx_ch_ptr_smpl_phy_shared[2]          ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    .o_dat_pcs_measlatrndtripbit_phy_shared         (dat_pcs_measlatrndtripbit_phy_shared[2]  ),        ////Navid sheet says to sm_ux_toolbox, but in toolbox it says to fluxcore, so not added in phy_shared. In sujoys, connected to toolbox. Should I add this to physhared
    .o_sclk_return_sel_rx_phy_shared                (sclk_return_sel_rx_phy_shared[2]         ),
    .o_sclk_return_sel_tx_phy_shared                (sclk_return_sel_tx_phy_shared[2]         ),
    //.i_ick_sclk_rx_phy_shared                       (s_i_ick_sclk_rx_phy_shared[2]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.i_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[2]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    .o_ick_sclk_rx_phy_shared                       (s_o_ick_sclk_rx_phy_shared[2]            ),
    .i_sync_common_control_phy_shared               (sync_common_control_phy_shared[2]        ),
    
    .o_ft_rx_sclk_sync_ch_phy_shared                (ft_rx_sclk_sync_ch_phy_shared[2]            ) ,
    .o_ft_tx_sclk_sync_ch_phy_shared                (ft_tx_sclk_sync_ch_phy_shared[2]            ) ,
    .o_rst_ux_rx_pma_rst_n_phy_shared               (rst_ux_rx_pma_rst_n_phy_shared[2]           ) ,
    .o_rst_ux_tx_pma_rst_n_phy_shared               (rst_ux_tx_pma_rst_n_phy_shared[2]           ) ,
    .o_ick_pcs_txword_phy_shared                    (ick_pcs_txword_phy_shared[2]                ) ,
    .o_tx_dl_ch_bit_phy_shared                      (tx_dl_ch_bit_phy_shared[2]                  ) ,
    .i_dat_pcs_measlatbit_phy_shared                (dat_pcs_measlatbit_phy_shared[2]            ) ,
    .i_ft_rx_async_pulse_ch_phy_shared              (ft_rx_async_pulse_ch_phy_shared[2]          ) ,
    .i_ft_tx_async_pulse_ch_phy_shared              (ft_tx_async_pulse_ch_phy_shared[2]          ) ,
    .i_rx_dl_ch_bit_phy_shared                      (rx_dl_ch_bit_phy_shared[2]                  ) ,
    .i_ux_rxuser1_sel_phy_shared                    (ux_rxuser1_sel_phy_shared[2]                ) ,
    .i_ux_rxuser2_sel_phy_shared                    (ux_rxuser2_sel_phy_shared[2]                ) ,
    .i_ux_txuser1_sel_phy_shared                    (ux_txuser1_sel_phy_shared[2]                ) ,
    .i_ux_txuser2_sel_phy_shared                    (ux_txuser2_sel_phy_shared[2]                ) ,
    .o_octl_pcs_txstatus_a_phy_shared               (octl_pcs_txstatus_a_phy_shared[2]           ) ,
    .i_ictl_pcs_txenable_a_phy_shared               (ictl_pcs_txenable_a_phy_shared[2]           ) ,
    .i_sync_cfg_data_phy_shared                     (sync_cfg_data_phy_shared[2]                 ) ,
    .i_sync_interface_control_phy_shared            (sync_interface_control_phy_shared[2]        ) ,
    .o_tx_data_phy_shared                           (tx_data_phy_shared[2]                       ) ,
    .i_rx_data_phy_shared                           (rx_data_phy_shared[2]                       ) ,
    .o_sm_flux_ingress_phy_shared                   (sm_flux_ingress_phy_shared[2]               ) ,
    .i_sm_flux_egress_phy_shared                    (sm_flux_egress_phy_shared[2]                ) ,
    .i_flux_cpi_int_phy_shared                      (flux_cpi_int_phy_shared                               ) ,      //only one bit needed
    .i_flux_int_phy_shared                          (flux_int_phy_shared[2]                      ) ,
    .i_oflux_octl_pcs_txptr_smpl_lane_phy_shared    (oflux_octl_pcs_txptr_smpl_lane_phy_shared[2]) ,
    .o_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[2]                   ) ,
    .i_flux_srds_rdy_phy_shared                     (flux_srds_rdy_phy_shared[2]                 ) ,
    .i_pcs_rxword_phy_shared                        (pcs_rxword_phy_shared[2]                    ) ,
    .i_pcs_rxpostdiv_phy_shared                     (pcs_rxpostdiv_phy_shared[2]                 ) ,
    .i_ock_pcs_txword_phy_shared                    (ock_pcs_txword_phy_shared[2]                ) ,

//    .o_ch_lavmm_fec_addr_fec_wrap                   (ch_lavmm_fec_addr_fec_wrap[2]),
//    .o_ch_lavmm_fec_be_fec_wrap                     (ch_lavmm_fec_be_fec_wrap[2]),
//    .o_ch_lavmm_fec_clk_fec_wrap                    (ch_lavmm_fec_clk_fec_wrap[2]),
//    .o_ch_lavmm_fec_read_fec_wrap                   (ch_lavmm_fec_read_fec_wrap[2]),
//    .o_ch_lavmm_fec_rstn_fec_wrap                   (ch_lavmm_fec_rstn_fec_wrap[2]),
//    .o_ch_lavmm_fec_wdata_fec_wrap                  (ch_lavmm_fec_wdata_fec_wrap[2]),
//    .o_ch_lavmm_fec_write_fec_wrap                  (ch_lavmm_fec_write_fec_wrap[2]),
//    .i_ch_lavmm_fec_rdata_fec_wrap                  (ch_lavmm_fec_rdata_fec_wrap[2]),
//    .i_ch_lavmm_fec_rdata_valid_fec_wrap            (ch_lavmm_fec_rdata_valid_fec_wrap[2]),
//    .i_ch_lavmm_fec_waitreq_fec_wrap                (ch_lavmm_fec_waitreq_fec_wrap[2]),
    .i_ch_eth_fec_rx_async_fec_wrap                 (ch_eth_fec_rx_async_fec_wrap[2]),
    .i_ch_eth_fec_rx_direct_fec_wrap                (ch_eth_fec_rx_direct_fec_wrap[2]),
//    .o_ch_eth_fec_tx_async_fec_wrap                 (ch_eth_fec_tx_async_fec_wrap[2]),
//    .o_ch_eth_fec_tx_direct_fec_wrap                (ch_eth_fec_tx_direct_fec_wrap[2]),
//    .o_rstfec_fec_csr_ret_fec_wrap                  (rstfec_fec_csr_ret_fec_wrap[2]),
    .i_fec_rx_rdy_n_fec_wrap                        (fec_rx_rdy_n_fec_wrap[2]),
//    .o_rstfec_fec_rx_rst_n_fec_wrap                 (rstfec_fec_rx_rst_n_fec_wrap[2]),
//    .o_rstfec_fec_tx_rst_n_fec_wrap                 (rstfec_fec_tx_rst_n_fec_wrap[2]),
//    .o_rstfec_rx_fec_sfrz_n_fec_wrap                (rstfec_rx_fec_sfrz_n_fec_wrap[2]),
//    .o_rstfec_tx_fec_sfrz_n_fec_wrap                (rstfec_tx_fec_sfrz_n_fec_wrap[2]),
    .i_fec_tx_data_mux_sel_fec_wrap                 (fec_tx_data_mux_sel_fec_wrap[2]),
    .i_fec_rx_data_fec_wrap                         (fec_rx_data_fec_wrap[2]),
//    .o_fec_i_tx_mux_data_fec_wrap                   (fec_i_tx_mux_data_fec_wrap[2]),
//    .o_xcvr_rx_data                                 (xcvr_rx_data[2]),
    .i_xcvr_tx_data                                 (xcvr_tx_data[2]),
    .ss_rst_flux0_cpi_cmn_busy                      (ss_rst_flux0_cpi_cmn_busy[2]),
    .o_pma_rx_sf                                    (pma_rx_sf[2]),

    .i_refclk_tx_p                                  (i_refclk_tx_p   ),
//    .i_refclk_tx_n                                  (i_refclk_tx_n   ),//can derive as negated i_refclk_tx_p
    .i_syspll_c0_clk                                (i_syspll_c0_clk ),
    .i_syspll_c1_clk                                (i_syspll_c1_clk ),
    .i_syspll_c2_clk                                (i_syspll_c2_clk ),
    .i_flux_clk                                     (i_flux_clk      ),
    .i_refclk_rx_p                                  (i_refclk_rx_p   ),
//    .i_refclk_rx_n                                  (i_refclk_rx_n   ),

    .i_ux_chnl_refclk_mux_phy_shared                (sm_flux_egress_phy_shared[2][193]),
    .o_xcvrif_tx_fifo_rd_en_mux_x1                  (xcvrif_tx_fifo_rd_en_mux_x1[2]),
    .i_xcvrif_tx_fifo_rd_en_mux_x2                  (xcvrif_tx_fifo_rd_en_mux_x2[2]),
    .i_xcvrif_tx_fifo_rd_en_mux_x4                  (xcvrif_tx_fifo_rd_en_mux_x4[2]),
    .i_xcvrif_tx_fifo_rd_en_mux_x6_bot              (xcvrif_tx_fifo_rd_en_mux_x6_bot[2]),
    .i_xcvrif_tx_fifo_rd_en_mux_x6_top              (xcvrif_tx_fifo_rd_en_mux_x6_top[2]),
    .i_xcvrif_tx_fifo_rd_en_mux_x8_bot              (xcvrif_tx_fifo_rd_en_mux_x8_bot[2]),
    .i_xcvrif_tx_fifo_rd_en_mux_x8_top              (xcvrif_tx_fifo_rd_en_mux_x8_top[2]),
    .o_xcvrif_tx_rst_mux_x1                         (xcvrif_tx_rst_mux_x1[2]),
    .i_xcvrif_tx_rst_mux_x2                         (xcvrif_tx_rst_mux_x2[2]),
    .i_xcvrif_tx_rst_mux_x4                         (xcvrif_tx_rst_mux_x4[2]),
    .i_xcvrif_tx_rst_mux_x6_bot                     (xcvrif_tx_rst_mux_x6_bot[2]),
    .i_xcvrif_tx_rst_mux_x6_top                     (xcvrif_tx_rst_mux_x6_top[2]),
    .i_xcvrif_tx_rst_mux_x8_bot                     (xcvrif_tx_rst_mux_x8_bot[2]),
    .i_xcvrif_tx_rst_mux_x8_top                     (xcvrif_tx_rst_mux_x8_top[2]),
    .o_xcvrif_tx_word_clk_mux_x1                    (xcvrif_tx_word_clk_mux_x1[2]),
    .i_xcvrif_tx_word_clk_mux_x2                    (xcvrif_tx_word_clk_mux_x2[2]),
    .i_xcvrif_tx_word_clk_mux_x4                    (xcvrif_tx_word_clk_mux_x4[2]),
    .i_xcvrif_tx_word_clk_mux_x6_bot                (xcvrif_tx_word_clk_mux_x6_bot[2]),
    .i_xcvrif_tx_word_clk_mux_x6_top                (xcvrif_tx_word_clk_mux_x6_top[2]),
    .i_xcvrif_tx_word_clk_mux_x8_bot                (xcvrif_tx_word_clk_mux_x8_bot[2]),
    .i_xcvrif_tx_word_clk_mux_x8_top                (xcvrif_tx_word_clk_mux_x8_top[2]),
    .ioack_cdrdiv_left_ux_bidir_in                  ('b0),
    .ioack_synthdiv1_left_ux_bidir_in               (ioack_synthdiv1_left_ux_bidir_in_reg[2]),
    .ioack_synthdiv2_left_ux_bidir_in               ('b0),
    .ioack_cdrdiv_left_ux_bidir_out                 (ioack_cdrdiv_left_ux_bidir_out[2]),
    .ioack_synthdiv1_left_ux_bidir_out              (ioack_synthdiv1_left_ux_bidir_out_reg[2]),
    .ioack_synthdiv2_left_ux_bidir_out              (),
//SHUNXIONG EDIT
//    .i_marker_found_up                              (marker_found_up[2]),
//    .i_marker_found_dn                              (marker_found_dn[2]),
//    .o_marker_found                                 (marker_found[2]),
    .o_xcvrif_tx_rst_wr_sync_mux_x1                 (xcvrif_tx_rst_wr_sync_mux_x1[2]),
    .i_xcvrif_tx_rst_wr_sync_mux_x2                 (xcvrif_tx_rst_wr_sync_mux_x2[2]),
    .i_xcvrif_tx_rst_wr_sync_mux_x4                 (xcvrif_tx_rst_wr_sync_mux_x4[2]),
    .i_xcvrif_tx_rst_wr_sync_mux_x6_bot             (xcvrif_tx_rst_wr_sync_mux_x6_bot[2]),
    .i_xcvrif_tx_rst_wr_sync_mux_x6_top             (xcvrif_tx_rst_wr_sync_mux_x6_top[2]),
    .i_xcvrif_tx_rst_wr_sync_mux_x8_bot             (xcvrif_tx_rst_wr_sync_mux_x8_bot[2]),
    .i_xcvrif_tx_rst_wr_sync_mux_x8_top             (xcvrif_tx_rst_wr_sync_mux_x8_top[2]),

    .ss_user_rx_clk1_clk                            (ss_user_rx_clk1_clk[3]),
    .ss_user_rx_clk2_clk                            (ss_user_rx_clk2_clk[3]),
    .ss_user_tx_clk1_clk                            (ss_user_tx_clk1_clk[3]),
    .ss_user_tx_clk2_clk                            (ss_user_tx_clk2_clk[3]),
    .ss_user_rx_clk1_clk_w                          (ss_user_rx_clk1_clk_w[3]), //KAHUAT_EDIT
    .ss_user_rx_clk2_clk_w                          (ss_user_rx_clk2_clk_w[3]), //KAHUAT_EDIT
    .ss_user_tx_clk1_clk_w                          (ss_user_tx_clk1_clk_w[3]), //KAHUAT_EDIT
    .ss_user_tx_clk2_clk_w                          (ss_user_tx_clk2_clk_w[3]), //KAHUAT_EDIT
    .o_hio_ux_tx_ch_ptr_smpl                        (o_hio_ux_tx_ch_ptr_smpl[3]),

//KAHUAT_EDIT
    .o_ss_lavmm_pcie_addr                           (i_ch2_lavmm_pcie_addr[16:0]),
    .o_ss_lavmm_pcie_be                             (i_ch2_lavmm_pcie_be[3:0]),
    .o_ss_lavmm_pcie_clk                            (i_ch2_lavmm_pcie_clk),
    .o_ss_lavmm_pcie_read                           (i_ch2_lavmm_pcie_read),
    .o_ss_lavmm_pcie_rstn                           (i_ch2_lavmm_pcie_rstn),
    .o_ss_lavmm_pcie_wdata                          (i_ch2_lavmm_pcie_wdata[31:0]),
    .o_ss_lavmm_pcie_write                          (i_ch2_lavmm_pcie_write),
    .sm_pld_tx_demux_0_o_pcie                       (i_ch3_tx_data),
    .i_ss_lavmm_pcie_rdata                          (o_ch2_lavmm_pcie_rdata[31:0]),
    .i_ss_lavmm_pcie_rdata_valid                    (o_ch2_lavmm_pcie_rdata_valid),
    .i_ss_lavmm_pcie_waitreq                        (o_ch2_lavmm_pcie_waitreq),
    .sm_pld_rx_mux_0_i_pcie                         (o_ch3_rx_data),
    .o_pld_pcie_clk_4                               (o_pld_pcie_clk_4),

    .o_pcie_rxword_clk                              (i_ch2_pcie_rxword_clk),
    .o_pcie_txword_clk                              (i_ch2_pcie_txword_clk),
    .ss_rst_ux_rxcdrlock2data                       (i_ch2_uxq_rxcdrlock2dataa),
    .o_rxeq_best_eye_vala                           (i_ch2_uxq_rxeq_best_eye_vala[13:0]),
    .o_rxeq_donea                                   (i_ch2_uxq_rxeq_donea),
    .o_rxmargin_nacka                               (i_ch2_uxq_rxmargin_nacka),
    .o_rxmargin_statusa                             (i_ch2_uxq_rxmargin_statusa),
    .o_rxsignaldetect_lfpsa                         (i_ch2_uxq_rxsignaldetect_lfpsa),
    .o_rxsignaldetecta                              (i_ch2_uxq_rxsignaldetecta),
    .o_rxmargin_status_gray                         (i_ch2_uxq_rxmargin_status_gray_a[1:0]),
    .rxstatusa                                      (i_ch2_uxq_rxstatusa),
    .o_pcie_pcs                                     (i_ch2_uxq_rxword[39:0]),
    .o_synthlcfast_postdiv                          (i_ch2_uxq_synthlcfast_postdiv),
    .o_synthlcmed_postdiv                           (i_ch2_uxq_synthlcmed_postdiv),
    .o_synthlcslow_postdiv                          (i_ch2_uxq_synthlcslow_postdiv),
    .o_txdetectrx_acka                              (i_ch2_uxq_txdetectrx_acka),
    .o_txdetectrx_statct                            (i_ch2_uxq_txdetectrx_statct),
    .txstatusa                                      (i_ch2_uxq_txstatusa),
    .i_pcs_pipe_rstn                                (o_ch2_pcs_pipe_rstn),
    .i_ux_ock_pma_clk                               (o_ch2_ux_ock_pma_clk),
    .i_lfps_ennt                                    (o_ch2_uxq_lfps_ennt),
    .i_pcie_l1ctrla                                 (o_ch2_uxq_pcie_l1ctrla[1:0]),
    .i_pma_cmn_ctrl                                 (o_ch2_uxq_pma_cmn_ctrl),
    .i_pma_ctrl                                     (o_ch2_uxq_pma_ctrl),
    .i_pcie_pcs_rx_rst                              (o_ch2_uxq_rst_pcs_rx_b_a),
    .i_pcie_pcs_tx_rst                              (o_ch2_uxq_rst_pcs_tx_b_a),
    .i_rxeiosdetectstata                            (o_ch2_uxq_rxeiosdetectstata),
    .i_rxeq_precal_code_selnt                       (o_ch2_uxq_rxeq_precal_code_selnt[2:0]),
    .i_rxeq_starta                                  (o_ch2_uxq_rxeq_starta),
    .i_rxeq_static_ena                              (o_ch2_uxq_rxeq_static_ena),
    .i_rxmargin_direction_nt                        (o_ch2_uxq_rxmargin_direction_nt),
    .i_rxmargin_offset_change_a                     (o_ch2_uxq_rxmargin_offset_change_a),
    .i_rxmargin_mode_nt                             (o_ch2_uxq_rxmargin_mode_nt),
    .i_rxmargin_offset_nt                           (o_ch2_uxq_rxmargin_offset_nt[6:0]),
    .i_rxmargin_start_a                             (o_ch2_uxq_rxmargin_start_a),
    .i_rxpstate                                     (o_ch2_uxq_rxpstate[2:0]),
    .i_rxrate                                       (o_ch2_uxq_rxrate[3:0]),
    .i_rxterm_hiz_ena                               (o_ch2_uxq_rxterm_hiz_ena),
    .i_rxwidth                                      (o_ch2_uxq_rxwidth[2:0]),
    .i_tstbus_lane                                  (o_ch2_uxq_tstbus_lane),
    .i_txbeacona                                    (o_ch2_uxq_txbeacona),
    .i_txclkdivrate                                 (o_ch2_uxq_txclkdivrate[2:0]),
    .i_txdetectrx_reqa                              (o_ch2_uxq_txdetectrx_reqa),
    .i_txdrv_levn                                   (o_ch2_uxq_txdrv_levn[5:0]),
    .i_txdrv_levnm1                                 (o_ch2_uxq_txdrv_levnm1[4:0]),
    .i_txdrv_levnm2                                 (o_ch2_uxq_txdrv_levnm2[2:0]),
    .i_txdrv_levnp1                                 (o_ch2_uxq_txdrv_levnp1[4:0]),
    .i_txdrv_slew                                   (o_ch2_uxq_txdrv_slew[3:0]),
    .i_txelecidle                                   (o_ch2_uxq_txelecidle[3:0]),
    .i_txpstate                                     (o_ch2_uxq_txpstate[2:0]),
    .i_txrate                                       (o_ch2_uxq_txrate[3:0]),
    .i_txwidth                                      (o_ch2_uxq_txwidth[2:0]),
    .i_pcie_pcs                                     (o_ch2_uxq_txword[39:0])
);
//  } else {
//  one_lane_hal_top_p2 one_lane_inst_2(
//    .i_hio_txdata                                   (i_hio_txdata[2]                           ),
//    .i_hio_txdata_extra                             (i_hio_txdata_extra[2]                     ),
//    .i_hio_txdata_fifo_wr_en                        (i_hio_txdata_fifo_wr_en[2]                ),
//    .i_hio_rxdata_fifo_rd_en                        (i_hio_rxdata_fifo_rd_en[2]                ),
//    .i_hio_ptp_rst_n                                (i_hio_ptp_rst_n[2]                        ),
//    .i_hio_ehip_rx_rst_n                            (i_hio_ehip_rx_rst_n[2]                    ),
//    .i_hio_ehip_tx_rst_n                            (i_hio_ehip_tx_rst_n[2]                    ),
//    .i_hio_ehip_signal_ok                           (i_hio_ehip_signal_ok[2]                   ),
//    .i_hio_sfreeze_2_r03f_rx_mac_srfz_n             (i_hio_sfreeze_2_r03f_rx_mac_srfz_n[2]     ),
//    .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n           (i_hio_sfreeze_3_c2f_tx_deskew_srfz_n[2]   ),
//    .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n             (i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n[2]     ),
//    .i_hio_rstfec_fec_rx_rst_n                      (i_hio_rstfec_fec_rx_rst_n[2]              ),
//    .i_hio_rstfec_fec_tx_rst_n                      (i_hio_rstfec_fec_tx_rst_n[2]              ),
//    .i_hio_rstfec_fec_csr_ret                       (i_hio_rstfec_fec_csr_ret[2]               ),
//    .i_hio_rstfec_rx_fec_sfrz_n                     (i_hio_rstfec_rx_fec_sfrz_n[2]             ),
//    .i_hio_rstfec_tx_fec_sfrz_n                     (i_hio_rstfec_tx_fec_sfrz_n[2]             ),
//    .i_hio_rstxcvrif_xcvrif_rx_rst_n                (i_hio_rstxcvrif_xcvrif_rx_rst_n[2]        ),
//    .i_hio_rstxcvrif_xcvrif_tx_rst_n                (i_hio_rstxcvrif_xcvrif_tx_rst_n[2]        ),
//    .i_hio_rstxcvrif_xcvrif_signal_ok               (i_hio_rstxcvrif_xcvrif_signal_ok[2]       ),
//    .i_hio_rstxcvrif_rx_xcvrif_sfrz_n               (i_hio_rstxcvrif_rx_xcvrif_sfrz_n[2]       ),
//    .i_hio_rstxcvrif_tx_xcvrif_sfrz_n               (i_hio_rstxcvrif_tx_xcvrif_sfrz_n[2]       ),
//    .i_hio_rst_pld_clrhip                           (i_hio_rst_pld_clrhip[2]                   ),
//    .i_hio_rst_pld_clrpcs                           (i_hio_rst_pld_clrpcs[2]                   ),
//    .i_hio_rst_pld_perstn                           (i_hio_rst_pld_perstn[2]                   ),
//    .i_hio_rst_pld_ready                            (i_hio_rst_pld_ready[2]                    ),
//    .i_hio_rst_pld_adapter_rx_pld_rst_n             (i_hio_rst_pld_adapter_rx_pld_rst_n[2]     ),
//    .i_hio_rst_pld_adapter_tx_pld_rst_n             (i_hio_rst_pld_adapter_tx_pld_rst_n[2]     ),
//    .i_hio_rst_ux_rx_pma_rst_n                      (i_hio_rst_ux_rx_pma_rst_n[2]              ),
//    .i_hio_rst_ux_rx_sfrz                           (i_hio_rst_ux_rx_sfrz[2]                   ),
//    .i_hio_rst_ux_tx_pma_rst_n                      (i_hio_rst_ux_tx_pma_rst_n[2]              ),
//    .i_hio_pld_reset_clk_row                        (i_hio_pld_reset_clk_row[2]                ),
//    .i_hio_uxquad_async                             (i_hio_uxquad_async[2]                     ),
//    .i_hio_uxquad_async_pcie_mux                    (i_hio_uxquad_async_pcie_mux[2]            ),
//
//    .i_hio_lavmm_clk                                (i_hio_ch2_lavmm_clk                       ),
//    .i_hio_lavmm_rstn                               (i_hio_ch2_lavmm_rstn                      ),
//    .i_hio_lavmm_addr                               (i_hio_ch2_lavmm_addr                      ),
//    .i_hio_lavmm_be                                 (i_hio_ch2_lavmm_be                        ),
//    .i_hio_lavmm_read                               (i_hio_ch2_lavmm_read                      ),
//    .i_hio_lavmm_wdata                              (i_hio_ch2_lavmm_wdata                     ),
//    .i_hio_lavmm_write                              (i_hio_ch2_lavmm_write                     ),
//    .o_hio_lavmm_rdata                              (o_hio_ch2_lavmm_rdata                     ),
//    .o_hio_lavmm_rdata_valid                        (o_hio_ch2_lavmm_rdata_valid               ),
//    .o_hio_lavmm_waitreq                            (o_hio_ch2_lavmm_waitreq                   ),
//    .i_hio_pld_rx_clk_in_row_clk                    (i_hio_ch2_pld_rx_clk_in_row_clk           ),
//    .i_hio_pld_tx_clk_in_row_clk                    (i_hio_ch2_pld_tx_clk_in_row_clk           ),
//    .i_hio_det_lat_rx_dl_clk                        (i_hio_ch2_det_lat_rx_dl_clk               ),
//    .i_hio_det_lat_rx_mux_select                    (i_hio_ch2_det_lat_rx_mux_select           ),
//    .i_hio_det_lat_rx_sclk_flop                     (i_hio_ch2_det_lat_rx_sclk_flop            ),
//    .i_hio_det_lat_rx_sclk_gen_clk                  (i_hio_ch2_det_lat_rx_sclk_gen_clk         ),
//    .i_hio_det_lat_rx_trig_flop                     (i_hio_ch2_det_lat_rx_trig_flop            ),
//    .i_hio_det_lat_sampling_clk                     (i_hio_ch2_det_lat_sampling_clk            ),
//    .i_hio_det_lat_tx_dl_clk                        (i_hio_ch2_det_lat_tx_dl_clk               ),
//    .i_hio_det_lat_tx_mux_select                    (i_hio_ch2_det_lat_tx_mux_select           ),
//    .i_hio_det_lat_tx_sclk_flop                     (i_hio_ch2_det_lat_tx_sclk_flop            ),
//    .i_hio_det_lat_tx_sclk_gen_clk                  (i_hio_ch2_det_lat_tx_sclk_gen_clk         ),
//    .i_hio_det_lat_tx_trig_flop                     (i_hio_ch2_det_lat_tx_trig_flop            ),
//
//    .rx_serial_n                                    (rx_serial_n[2]                            ),
//    .rx_serial_p                                    (rx_serial_p[2]                            ),
    //.i_hio_tx_pfc                                   (i_hio_tx_pfc[2]                           ),
    //.i_hio_tx_pause                                 (i_hio_tx_pause[2]                         ),
    //.i_hio_clear_internal                           (i_hio_clear_internal[2]                   ),
    //.i_hio_signal_ok                                (i_hio_signal_ok[2]                        ),
    //.i_hio_pld_ready                                (i_hio_pld_ready[2]                        ),
    //.i_hio_pma_rx_sf                                (i_hio_pma_rx_sf[2]                        ),
    //.i_hio_ch_rstxcvrif_lphy_signal_ok              (i_hio_ch_rstxcvrif_lphy_signal_ok[2]      ),
    //.i_clear_tx_internal_err                        (i_clear_tx_internal_err[2]                ),
//    .o_hio_txdata_fifo_wr_empty                     (o_hio_txdata_fifo_wr_empty[2]             ),
//    .i_hio_txdata_async                             (i_hio_txdata_async [2]                    ),
//    .i_hio_txdata_direct                            (i_hio_txdata_direct[2]                    ),
//    .o_hio_rxdata_async                             (o_hio_rxdata_async [2]                    ),
//    .o_hio_rxdata_direct                            (o_hio_rxdata_direct[2]                    ),
//    .o_hio_txdata_fifo_wr_pempty                    (o_hio_txdata_fifo_wr_pempty[2]            ),
//    .o_hio_txdata_fifo_wr_full                      (o_hio_txdata_fifo_wr_full[2]              ),
//    .o_hio_txdata_fifo_wr_pfull                     (o_hio_txdata_fifo_wr_pfull[2]             ),
//    .o_hio_rxdata                                   (o_hio_rxdata[2]                           ),
//    .o_hio_rxdata_extra                             (o_hio_rxdata_extra[2]                     ),
//    .o_hio_rxdata_fifo_rd_empty                     (o_hio_rxdata_fifo_rd_empty[2]             ),
//    .o_hio_rxdata_fifo_rd_pempty                    (o_hio_rxdata_fifo_rd_pempty[2]            ),
//    .o_hio_rxdata_fifo_rd_full                      (o_hio_rxdata_fifo_rd_full[2]              ),
//    .o_hio_rxdata_fifo_rd_pfull                     (o_hio_rxdata_fifo_rd_pfull[2]             ),
//    .o_hio_rstepcs_rx_pcs_fully_aligned             (o_hio_rstepcs_rx_pcs_fully_aligned[2]     ),
//    .o_hio_rstfec_fec_rx_rdy_n                      (o_hio_rstfec_fec_rx_rdy_n[2]              ),
//    .o_hio_rst_flux0_cpi_cmn_busy                   (o_hio_rst_flux0_cpi_cmn_busy[2]           ),
//    .o_hio_rst_oflux_rx_srds_rdy                    (o_hio_rst_oflux_rx_srds_rdy[2]            ),
//    .o_hio_rst_ux_all_synthlockstatus               (o_hio_rst_ux_all_synthlockstatus[2]       ),
//    .o_hio_rst_ux_octl_pcs_rxstatus                 (o_hio_rst_ux_octl_pcs_rxstatus[2]         ),
//    .o_hio_rst_ux_octl_pcs_txstatus                 (o_hio_rst_ux_octl_pcs_txstatus[2]         ),
//    .o_hio_rst_ux_rxcdrlock2data                    (o_hio_rst_ux_rxcdrlock2data[2]            ),
//    .o_hio_rst_ux_rxcdrlockstatus                   (o_hio_rst_ux_rxcdrlockstatus[2]           ),
//    .o_hio_uxquad_async                             (o_hio_uxquad_async[2]                     ),
    //.k_user_rx_clk1_c0c1c2_sel                      (k_user_rx_clk1_c0c1c2_sel[2]              ),
    //.k_user_rx_clk2_c0c1c2_sel                      (k_user_rx_clk2_c0c1c2_sel[2]              ),
    //.k_user_tx_clk1_c0c1c2_sel                      (k_user_tx_clk1_c0c1c2_sel[2]              ),
    //.k_user_tx_clk2_c0c1c2_sel                      (k_user_tx_clk2_c0c1c2_sel[2]              ),
//
//    .o_hio_user_rx_clk1_clk                         (o_hio_ch2_user_rx_clk1_clk                ),
//    .o_hio_user_rx_clk2_clk                         (o_hio_ch2_user_rx_clk2_clk                ),
//    .o_hio_user_tx_clk1_clk                         (o_hio_ch2_user_tx_clk1_clk                ),
//    .o_hio_user_tx_clk2_clk                         (o_hio_ch2_user_tx_clk2_clk                ),
//    .o_hio_ux_chnl_refclk_mux                       (o_hio_ch2_ux_chnl_refclk_mux              ),
//    .o_hio_det_lat_rx_async_dl_sync                 (o_hio_ch2_det_lat_rx_async_dl_sync        ),
//    .o_hio_det_lat_rx_async_pulse                   (o_hio_ch2_det_lat_rx_async_pulse          ),
//    .o_hio_det_lat_rx_async_sample_sync             (o_hio_ch2_det_lat_rx_async_sample_sync    ),
//    .o_hio_det_lat_rx_sclk_sample_sync              (o_hio_ch2_det_lat_rx_sclk_sample_sync     ),
//    .o_hio_det_lat_rx_trig_sample_sync              (o_hio_ch2_det_lat_rx_trig_sample_sync     ),
//    .o_hio_det_lat_tx_async_dl_sync                 (o_hio_ch2_det_lat_tx_async_dl_sync        ),
//    .o_hio_det_lat_tx_async_pulse                   (o_hio_ch2_det_lat_tx_async_pulse          ),
//    .o_hio_det_lat_tx_async_sample_sync             (o_hio_ch2_det_lat_tx_async_sample_sync    ),
//    .o_hio_det_lat_tx_sclk_sample_sync              (o_hio_ch2_det_lat_tx_sclk_sample_sync     ),
//    .o_hio_det_lat_tx_trig_sample_sync              (o_hio_ch2_det_lat_tx_trig_sample_sync     ),
//    .o_hio_xcvrif_rx_latency_pulse                  (o_hio_ch2_xcvrif_rx_latency_pulse         ),
//    .o_hio_xcvrif_tx_latency_pulse                  (o_hio_ch2_xcvrif_tx_latency_pulse         ),
//
//    .tx_serial_p                                    (tx_serial_p[2]                            ),
//    .tx_serial_n                                    (tx_serial_n[2]                            ),
   // .o_hio_local_fault                              (o_hio_local_fault[2]                      ),
   // .o_hio_remote_fault                             (o_hio_remote_fault[2]                     ),
   // .o_hio_rx_pause                                 (o_hio_rx_pause[2]                         ),
   // .o_hio_rx_pfc                                   (o_hio_rx_pfc[2]                           ),
   // .o_hio_txfifo_pfull                             (o_hio_txfifo_pfull[2]                     ),
   // .o_hio_dsk_mon_err                              (o_hio_dsk_mon_err[2]                      ),
   // .o_hio_hip_ready                                (o_hio_hip_ready[2]                        ),
   // .o_hio_rx_block_lock                            (o_hio_rx_block_lock[2]                    ),
   // .o_hio_rx_dsk_done                              (o_hio_rx_dsk_done[2]                      ),
   // .o_hio_rx_am_lock                               (o_hio_rx_am_lock[2]                       ),
   // .o_hio_rx_pcs_fully_aligned                     (o_hio_rx_pcs_fully_aligned[2]             ),
   // .o_hio_hi_ber                                   (o_hio_hi_ber[2]                           ),
   // .o_hio_rx_pcs_internal_err                      (o_hio_rx_pcs_internal_err[2]              ),
   // .o_hio_tx_fifo_status_fifo_wr_pfull             (o_hio_tx_fifo_status_fifo_wr_pfull[2]     ),
   // .o_hio_tx_fifo_status_fifo_pempty               (o_hio_tx_fifo_status_fifo_pempty[2]       ),
   // .o_hio_rx_fifo_status_fifo_pempty               (o_hio_rx_fifo_status_fifo_pempty[2]       ),
   // .o_hio_rx_fifo_status_fifo_wr_pfull             (o_hio_rx_fifo_status_fifo_wr_pfull[2]     ),
   // .o_hio_rx_fifo_status_fifo_empty                (o_hio_rx_fifo_status_fifo_empty[2]        ),
   // .o_hio_tx_fifo_status_fifo_empty                (o_hio_tx_fifo_status_fifo_empty[2]        ),
   // .o_hio_rx_fifo_status_gb_restarted              (o_hio_rx_fifo_status_gb_restarted[2]      ),
   // .o_hio_tx_fifo_status_gb_restarted              (o_hio_tx_fifo_status_gb_restarted[2]      ),
    
//    .i_uxwrap_bus_in_phy_shared                     (uxwrap_bus_in_phy_shared[2]              ),      //ipfluxtop_uxtop_wrap signals to phy_hal_shared
//    .o_uxwrap_bus_out_phy_shared                    (uxwrap_bus_out_phy_shared[2]             ),
    //.o_flux_sclk_mux_phy_shared                   (flux_sclk_mux_phy_shared[2]                ),    //sm_flux_ingress_signals to phy_hal_shared////not used, should i remove 
    //.i_ss_async_pldif_phy_shared                  (ss_async_pldif_phy_shared[2]               ),    //sm_flux_ingress_signals to phy_hal_shared 
    //.o_ss_async_pldif_phy_shared                    (ss_async_pldif_phy_shared[2]             ),    
    //.i_ss_async_pldif_pcie_mux_phy_shared           (ss_async_pldif_pcie_mux_phy_shared[2]    ),    
//    .o_lavmm_addr_phy_shared                        (lavmm_addr_phy_shared[2]                 ),
//    .o_lavmm_be_phy_shared                          (lavmm_be_phy_shared[2]                   ),
//    .o_lavmm_clk_phy_shared                         (lavmm_clk_phy_shared[2]                  ),
//    .o_lavmm_read_phy_shared                        (lavmm_read_phy_shared[2]                 ),
//    .o_lavmm_rstn_phy_shared                        (lavmm_rstn_phy_shared[2]                 ),
//    .o_lavmm_wdata_phy_shared                       (lavmm_wdata_phy_shared[2]                ),
//    .o_lavmm_write_phy_shared                       (lavmm_write_phy_shared[2]                ),
//    .i_lavmm_rdata_phy_shared                       (lavmm_rdata_phy_shared[2]                ),
//    .i_lavmm_rdata_valid_phy_shared                 (lavmm_rdata_valid_phy_shared[2]          ),
//    .i_lavmm_waitreq_phy_shared                     (lavmm_waitreq_phy_shared[2]              ),
    //.i_rxpstate_phy_shared                          (rxpstate_phy_shared[2]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxrate_phy_shared                            (rxrate_phy_shared[2]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxterm_hiz_ena_phy_shared                    (rxterm_hiz_ena_phy_shared[2]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxwidth_phy_shared                           (rxwidth_phy_shared[2]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_tstbus_lane_phy_shared                       (tstbus_lane_phy_shared[2]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txbeacona_phy_shared                         (txbeacona_phy_shared[2]                  ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txclkdivrate_phy_shared                      (txclkdivrate_phy_shared[2]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdetectrx_reqa_phy_shared                   (txdetectrx_reqa_phy_shared[2]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levn_phy_shared                        (txdrv_levn_phy_shared[2]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm1_phy_shared                      (txdrv_levnm1_phy_shared[2]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm2_phy_shared                      (txdrv_levnm2_phy_shared[2]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnp1_phy_shared                      (txdrv_levnp1_phy_shared[2]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_slew_phy_shared                        (txdrv_slew_phy_shared[2]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txelecidle_phy_shared                        (txelecidle_phy_shared[2]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txpstate_phy_shared                          (txpstate_phy_shared[2]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txrate_phy_shared                            (txrate_phy_shared[2]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txwidth_phy_shared                           (txwidth_phy_shared[2]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.o_rxmargin_status_gray_phy_shared              (rxmargin_status_gray_phy_shared[2]       ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rst_ux_rx_sfrz_phy_shared                    (rst_ux_rx_sfrz_phy_shared[2]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_flux0_cpi_cmn_busy_phy_shared            (rst_flux0_cpi_cmn_busy_phy_shared[2]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_oflux_rx_srds_rdy_phy_shared             (rst_oflux_rx_srds_rdy_phy_shared[2]      ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_ux_all_synthlockstatus_phy_shared        (rst_ux_all_synthlockstatus_phy_shared[2] ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_rst_ux_rxcdrlockstatus_phy_shared            (rst_ux_rxcdrlockstatus_phy_shared[2]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_cdrfbclk_phy_shared                  (ock_pcs_cdrfbclk_phy_shared[2]           ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_ref_phy_shared                       (ock_pcs_ref_phy_shared[2]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ux_tx_ch_ptr_smpl_phy_shared                 (ux_tx_ch_ptr_smpl_phy_shared[2]          ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
//    .o_dat_pcs_measlatrndtripbit_phy_shared         (dat_pcs_measlatrndtripbit_phy_shared[2]  ),        ////Navid sheet says to sm_ux_toolbox, but in toolbox it says to fluxcore, so not added in phy_shared. In sujoys, connected to toolbox. Should I add this to physhared
//    .o_sclk_return_sel_rx_phy_shared                (sclk_return_sel_rx_phy_shared[2]         ),
//    .o_sclk_return_sel_tx_phy_shared                (sclk_return_sel_tx_phy_shared[2]         ),
    //.i_ick_sclk_rx_phy_shared                       (s_i_ick_sclk_rx_phy_shared[2]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.i_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[2]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
//    .o_ick_sclk_rx_phy_shared                       (s_o_ick_sclk_rx_phy_shared[2]            ),
//    .i_sync_common_control_phy_shared               (sync_common_control_phy_shared[2]        ),
//    
//    .o_ft_rx_sclk_sync_ch_phy_shared                (ft_rx_sclk_sync_ch_phy_shared[2]            ) ,
//    .o_ft_tx_sclk_sync_ch_phy_shared                (ft_tx_sclk_sync_ch_phy_shared[2]            ) ,
//    .o_rst_ux_rx_pma_rst_n_phy_shared               (rst_ux_rx_pma_rst_n_phy_shared[2]           ) ,
//    .o_rst_ux_tx_pma_rst_n_phy_shared               (rst_ux_tx_pma_rst_n_phy_shared[2]           ) ,
//    .o_ick_pcs_txword_phy_shared                    (ick_pcs_txword_phy_shared[2]                ) ,
//    .o_tx_dl_ch_bit_phy_shared                      (tx_dl_ch_bit_phy_shared[2]                  ) ,
//    .i_dat_pcs_measlatbit_phy_shared                (dat_pcs_measlatbit_phy_shared[2]            ) ,
//    .i_ft_rx_async_pulse_ch_phy_shared              (ft_rx_async_pulse_ch_phy_shared[2]          ) ,
//    .i_ft_tx_async_pulse_ch_phy_shared              (ft_tx_async_pulse_ch_phy_shared[2]          ) ,
//    .i_rx_dl_ch_bit_phy_shared                      (rx_dl_ch_bit_phy_shared[2]                  ) ,
//    .i_ux_rxuser1_sel_phy_shared                    (ux_rxuser1_sel_phy_shared[2]                ) ,
//    .i_ux_rxuser2_sel_phy_shared                    (ux_rxuser2_sel_phy_shared[2]                ) ,
//    .i_ux_txuser1_sel_phy_shared                    (ux_txuser1_sel_phy_shared[2]                ) ,
//    .i_ux_txuser2_sel_phy_shared                    (ux_txuser2_sel_phy_shared[2]                ) ,
//    .o_octl_pcs_txstatus_a_phy_shared               (octl_pcs_txstatus_a_phy_shared[2]           ) ,
//    .i_ictl_pcs_txenable_a_phy_shared               (ictl_pcs_txenable_a_phy_shared[2]           ) ,
//    .i_sync_cfg_data_phy_shared                     (sync_cfg_data_phy_shared[2]                 ) ,
//    .i_sync_interface_control_phy_shared            (sync_interface_control_phy_shared[2]        ) ,
//    .o_tx_data_phy_shared                           (tx_data_phy_shared[2]                       ) ,
//    .i_rx_data_phy_shared                           (rx_data_phy_shared[2]                       ) ,
//    .o_sm_flux_ingress_phy_shared                   (sm_flux_ingress_phy_shared[2]               ) ,
//    .i_sm_flux_egress_phy_shared                    (sm_flux_egress_phy_shared[2]                ) ,
//    .i_flux_cpi_int_phy_shared                      (flux_cpi_int_phy_shared                               ) ,      //only one bit needed
//    .i_flux_int_phy_shared                          (flux_int_phy_shared[2]                      ) ,
//    .i_oflux_octl_pcs_txptr_smpl_lane_phy_shared    (oflux_octl_pcs_txptr_smpl_lane_phy_shared[2]) ,
//    .o_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[2]                   ) ,
//    .i_flux_srds_rdy_phy_shared                     (flux_srds_rdy_phy_shared[2]                 ) ,
//    .i_pcs_rxword_phy_shared                        (pcs_rxword_phy_shared[2]                    ) ,
//    .i_pcs_rxpostdiv_phy_shared                     (pcs_rxpostdiv_phy_shared[2]                 ) ,
//    .i_ock_pcs_txword_phy_shared                    (ock_pcs_txword_phy_shared[2]                ) ,
//
//    .o_ch_lavmm_fec_addr_fec_wrap                   (ch_lavmm_fec_addr_fec_wrap[2]),
//    .o_ch_lavmm_fec_be_fec_wrap                     (ch_lavmm_fec_be_fec_wrap[2]),
//    .o_ch_lavmm_fec_clk_fec_wrap                    (ch_lavmm_fec_clk_fec_wrap[2]),
//    .o_ch_lavmm_fec_read_fec_wrap                   (ch_lavmm_fec_read_fec_wrap[2]),
//    .o_ch_lavmm_fec_rstn_fec_wrap                   (ch_lavmm_fec_rstn_fec_wrap[2]),
//    .o_ch_lavmm_fec_wdata_fec_wrap                  (ch_lavmm_fec_wdata_fec_wrap[2]),
//    .o_ch_lavmm_fec_write_fec_wrap                  (ch_lavmm_fec_write_fec_wrap[2]),
//    .i_ch_lavmm_fec_rdata_fec_wrap                  (ch_lavmm_fec_rdata_fec_wrap[2]),
//    .i_ch_lavmm_fec_rdata_valid_fec_wrap            (ch_lavmm_fec_rdata_valid_fec_wrap[2]),
//    .i_ch_lavmm_fec_waitreq_fec_wrap                (ch_lavmm_fec_waitreq_fec_wrap[2]),
//    .i_ch_eth_fec_rx_async_fec_wrap                 (ch_eth_fec_rx_async_fec_wrap[2]),
//    .i_ch_eth_fec_rx_direct_fec_wrap                (ch_eth_fec_rx_direct_fec_wrap[2]),
//    .o_ch_eth_fec_tx_async_fec_wrap                 (ch_eth_fec_tx_async_fec_wrap[2]),
//    .o_ch_eth_fec_tx_direct_fec_wrap                (ch_eth_fec_tx_direct_fec_wrap[2]),
//    .o_rstfec_fec_csr_ret_fec_wrap                  (rstfec_fec_csr_ret_fec_wrap[2]),
//    .i_fec_rx_rdy_n_fec_wrap                        (fec_rx_rdy_n_fec_wrap[2]),
//    .o_rstfec_fec_rx_rst_n_fec_wrap                 (rstfec_fec_rx_rst_n_fec_wrap[2]),
//    .o_rstfec_fec_tx_rst_n_fec_wrap                 (rstfec_fec_tx_rst_n_fec_wrap[2]),
//    .o_rstfec_rx_fec_sfrz_n_fec_wrap                (rstfec_rx_fec_sfrz_n_fec_wrap[2]),
//    .o_rstfec_tx_fec_sfrz_n_fec_wrap                (rstfec_tx_fec_sfrz_n_fec_wrap[2]),
//    .i_fec_tx_data_mux_sel_fec_wrap                 (fec_tx_data_mux_sel_fec_wrap[2]),
//    .i_fec_rx_data_fec_wrap                         (fec_rx_data_fec_wrap[2]),
//    .o_fec_i_tx_mux_data_fec_wrap                   (fec_i_tx_mux_data_fec_wrap[2]),
//    .o_xcvr_rx_data                                 (xcvr_rx_data[2]),
//    .i_xcvr_tx_data                                 (xcvr_tx_data[2]),
//    .o_pma_rx_sf                                    (pma_rx_sf[2]),
//
//    .i_refclk_tx_p                                  (i_refclk_tx_p   ),
//    .i_refclk_tx_n                                  (i_refclk_tx_n   ),//can derive as negated i_refclk_tx_p
//    .i_syspll_c0_clk                                (i_syspll_c0_clk ),
//    .i_syspll_c1_clk                                (i_syspll_c1_clk ),
//    .i_syspll_c2_clk                                (i_syspll_c2_clk ),
//    .i_flux_clk                                     (i_flux_clk      ),
//    .i_refclk_rx_p                                  (i_refclk_rx_p   ),
//    .i_refclk_rx_n                                  (i_refclk_rx_n   ),
//
//    .i_ux_chnl_refclk_mux_phy_shared                (sm_flux_egress_phy_shared[2][193]),
//    .i_ch0_top_xcvrif_tx_fifo_rd_en                 (),
//    .i_ch1_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch2_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch3_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch0_top_xcvrif_rx_fifo_rd_en                 (),
//    .i_ch1_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch2_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch3_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch0_top_xcvrif_tx_rst_mux                    (),
//    .i_ch1_xcvrif_tx_rst_mux                        (),
//    .i_ch2_xcvrif_tx_rst_mux                        (),
//    .i_ch3_xcvrif_tx_rst_mux                        (),
//    .i_ux0_top_xcvrif_tx_word_clk                   (),
//    .i_ux1_xcvrif_tx_word_clk                       (),
//    .i_ux2_xcvrif_tx_word_clk                       (),
//    .i_ux3_xcvrif_tx_word_clk                       (),
//    .ioack_cdrdiv_left_ux_bidir_in                  (),
//    .ioack_synthdiv1_left_ux_bidir_in               (),
//    .ioack_synthdiv2_left_ux_bidir_in               (),
//    .ioack_cdrdiv_right_ux_bidir_out                (),
//    .ioack_synthdiv1_right_ux_bidir_out             (),
//    .ioack_synthdiv2_right_ux_bidir_out             ()
//
//);
//  }
//  if {PCIE_GEN4=="PCIE_GEN1" || PCIE_GEN4=="PCIE_GEN2" || PCIE_GEN4=="PCIE_GEN3" || PCIE_GEN4=="PCIE_GEN4"} {

system_intel_pcie_gts_0_pcie_hal_top_one_lane_pcie_hal_2100_kki5zwy one_lane_pcie_inst_3(
    .i_hio_txdata                                   (i_hio_txdata[4]                           ),
    .i_hio_txdata_extra                             (i_hio_txdata_extra[4]                     ),
    .i_hio_txdata_fifo_wr_en                        (i_hio_txdata_fifo_wr_en[4]                ),
    .i_hio_rxdata_fifo_rd_en                        (i_hio_rxdata_fifo_rd_en[4]                ),
    .i_hio_ptp_rst_n                                (i_hio_ptp_rst_n[4]                        ),
    .i_hio_ehip_rx_rst_n                            (i_hio_ehip_rx_rst_n[4]                    ),
    .i_hio_ehip_tx_rst_n                            (i_hio_ehip_tx_rst_n[4]                    ),
    .i_hio_ehip_signal_ok                           (i_hio_ehip_signal_ok[4]                   ),
    .i_hio_sfreeze_2_r03f_rx_mac_srfz_n             (i_hio_sfreeze_2_r03f_rx_mac_srfz_n[4]     ),
    .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n           (i_hio_sfreeze_3_c2f_tx_deskew_srfz_n[4]   ),
    .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n             (i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n[4]     ),
    .i_hio_rstfec_fec_rx_rst_n                      (i_hio_rstfec_fec_rx_rst_n[4]              ),
    .i_hio_rstfec_fec_tx_rst_n                      (i_hio_rstfec_fec_tx_rst_n[4]              ),
    .i_hio_rstfec_fec_csr_ret                       (i_hio_rstfec_fec_csr_ret[4]               ),
    .i_hio_rstfec_rx_fec_sfrz_n                     (i_hio_rstfec_rx_fec_sfrz_n[4]             ),
    .i_hio_rstfec_tx_fec_sfrz_n                     (i_hio_rstfec_tx_fec_sfrz_n[4]             ),
    .i_hio_rstxcvrif_xcvrif_rx_rst_n                (i_hio_rstxcvrif_xcvrif_rx_rst_n[4]        ),
    .i_hio_rstxcvrif_xcvrif_tx_rst_n                (i_hio_rstxcvrif_xcvrif_tx_rst_n[4]        ),
    .i_hio_rstxcvrif_xcvrif_signal_ok               (i_hio_rstxcvrif_xcvrif_signal_ok[4]       ),
    .i_hio_rstxcvrif_rx_xcvrif_sfrz_n               (i_hio_rstxcvrif_rx_xcvrif_sfrz_n[4]       ),
    .i_hio_rstxcvrif_tx_xcvrif_sfrz_n               (i_hio_rstxcvrif_tx_xcvrif_sfrz_n[4]       ),
    .i_hio_rst_pld_clrhip                           (i_hio_rst_pld_clrhip[4]                   ),
    .i_hio_rst_pld_clrpcs                           (i_hio_rst_pld_clrpcs[4]                   ),
    .i_hio_rst_pld_perstn                           (i_hio_rst_pld_perstn[4]                   ),
    .i_hio_rst_pld_ready                            (i_hio_rst_pld_ready[4]                    ),
    .i_hio_rst_pld_adapter_rx_pld_rst_n             (i_hio_rst_pld_adapter_rx_pld_rst_n[4]     ),
    .i_hio_rst_pld_adapter_tx_pld_rst_n             (i_hio_rst_pld_adapter_tx_pld_rst_n[4]     ),
    .i_hio_rst_ux_rx_pma_rst_n                      (i_hio_rst_ux_rx_pma_rst_n[4]              ),
    .i_hio_rst_ux_rx_sfrz                           (i_hio_rst_ux_rx_sfrz[4]                   ),
    .i_hio_rst_ux_tx_pma_rst_n                      (i_hio_rst_ux_tx_pma_rst_n[4]              ),
    .i_hio_pld_reset_clk_row                        (i_hio_pld_reset_clk_row[4]                ),
    .i_hio_uxquad_async                             (i_hio_uxquad_async[4]                     ),
    .i_hio_uxquad_async_pcie_mux                    (i_hio_uxquad_async_pcie_mux[4]            ),

    .i_hio_lavmm_clk                                (i_hio_ch4_lavmm_clk                       ),
    .i_hio_lavmm_rstn                               (i_hio_ch4_lavmm_rstn                      ),
    .i_hio_lavmm_addr                               (i_hio_ch4_lavmm_addr                      ),
    .i_hio_lavmm_be                                 (i_hio_ch4_lavmm_be                        ),
    .i_hio_lavmm_read                               (i_hio_ch4_lavmm_read                      ),
    .i_hio_lavmm_wdata                              (i_hio_ch4_lavmm_wdata                     ),
    .i_hio_lavmm_write                              (i_hio_ch4_lavmm_write                     ),
    .o_hio_lavmm_rdata                              (o_hio_ch4_lavmm_rdata                     ),
    .o_hio_lavmm_rdata_valid                        (o_hio_ch4_lavmm_rdata_valid               ),
    .o_hio_lavmm_waitreq                            (o_hio_ch4_lavmm_waitreq                   ),
    .i_hio_pld_rx_clk_in_row_clk                    (i_hio_ch4_pld_rx_clk_in_row_clk           ),
    .i_hio_pld_tx_clk_in_row_clk                    (i_hio_ch4_pld_tx_clk_in_row_clk           ),
    .i_hio_det_lat_rx_dl_clk                        (i_hio_ch4_det_lat_rx_dl_clk               ),
    .i_hio_det_lat_rx_mux_select                    (i_hio_ch4_det_lat_rx_mux_select           ),
    .i_hio_det_lat_rx_sclk_flop                     (i_hio_ch4_det_lat_rx_sclk_flop            ),
    .i_hio_det_lat_rx_sclk_gen_clk                  (i_hio_ch4_det_lat_rx_sclk_gen_clk         ),
    .i_hio_det_lat_rx_trig_flop                     (i_hio_ch4_det_lat_rx_trig_flop            ),
    .i_hio_det_lat_sampling_clk                     (i_hio_ch4_det_lat_sampling_clk            ),
    .i_hio_det_lat_tx_dl_clk                        (i_hio_ch4_det_lat_tx_dl_clk               ),
    .i_hio_det_lat_tx_mux_select                    (i_hio_ch4_det_lat_tx_mux_select           ),
    .i_hio_det_lat_tx_sclk_flop                     (i_hio_ch4_det_lat_tx_sclk_flop            ),
    .i_hio_det_lat_tx_sclk_gen_clk                  (i_hio_ch4_det_lat_tx_sclk_gen_clk         ),
    .i_hio_det_lat_tx_trig_flop                     (i_hio_ch4_det_lat_tx_trig_flop            ),

    .rx_serial_n                                    (rx_serial_n[3]                            ),
    .rx_serial_p                                    (rx_serial_p[3]                            ),
    //.i_hio_tx_pfc                                   (i_hio_tx_pfc[3]                           ),
    //.i_hio_tx_pause                                 (i_hio_tx_pause[3]                         ),
    //.i_hio_clear_internal                           (i_hio_clear_internal[3]                   ),
    //.i_hio_signal_ok                                (i_hio_signal_ok[3]                        ),
    //.i_hio_pld_ready                                (i_hio_pld_ready[3]                        ),
    //.i_hio_pma_rx_sf                                (i_hio_pma_rx_sf[3]                        ),
    //.i_hio_ch_rstxcvrif_lphy_signal_ok              (i_hio_ch_rstxcvrif_lphy_signal_ok[3]      ),
    //.i_clear_tx_internal_err                        (i_clear_tx_internal_err[3]                ),
    .o_hio_txdata_fifo_wr_empty                     (o_hio_txdata_fifo_wr_empty[4]             ),
    .i_hio_txdata_async                             (i_hio_txdata_async[4]                     ),
    .i_hio_txdata_direct                            (i_hio_txdata_direct[4]                    ),
    .o_hio_rxdata_async                             (o_hio_rxdata_async[4]                     ),
    .o_hio_rxdata_direct                            (o_hio_rxdata_direct[4]                    ),
    .o_hio_txdata_fifo_wr_pempty                    (o_hio_txdata_fifo_wr_pempty[4]            ),
    .o_hio_txdata_fifo_wr_full                      (o_hio_txdata_fifo_wr_full[4]              ),
    .o_hio_txdata_fifo_wr_pfull                     (o_hio_txdata_fifo_wr_pfull[4]             ),
    .o_hio_rxdata                                   (o_hio_rxdata[4]                           ),
    .o_hio_rxdata_extra                             (o_hio_rxdata_extra[4]                     ),
    .o_hio_rxdata_fifo_rd_empty                     (o_hio_rxdata_fifo_rd_empty[4]             ),
    .o_hio_rxdata_fifo_rd_pempty                    (o_hio_rxdata_fifo_rd_pempty[4]            ),
    .o_hio_rxdata_fifo_rd_full                      (o_hio_rxdata_fifo_rd_full[4]              ),
    .o_hio_rxdata_fifo_rd_pfull                     (o_hio_rxdata_fifo_rd_pfull[4]             ),
    .o_hio_rstepcs_rx_pcs_fully_aligned             (o_hio_rstepcs_rx_pcs_fully_aligned[4]     ),
    .o_hio_rstfec_fec_rx_rdy_n                      (o_hio_rstfec_fec_rx_rdy_n[4]              ),
    .o_hio_rst_flux0_cpi_cmn_busy                   (o_hio_rst_flux0_cpi_cmn_busy[4]           ),
    .o_hio_rst_oflux_rx_srds_rdy                    (o_hio_rst_oflux_rx_srds_rdy[4]            ),
    .o_hio_rst_ux_all_synthlockstatus               (o_hio_rst_ux_all_synthlockstatus[4]       ),
    .o_hio_rst_ux_octl_pcs_rxstatus                 (o_hio_rst_ux_octl_pcs_rxstatus[4]         ),
    .o_hio_rst_ux_octl_pcs_txstatus                 (o_hio_rst_ux_octl_pcs_txstatus[4]         ),
    .o_hio_rst_ux_rxcdrlock2data                    (o_hio_rst_ux_rxcdrlock2data[4]            ),
    .o_hio_rst_ux_rxcdrlockstatus                   (o_hio_rst_ux_rxcdrlockstatus[4]           ),
    .o_hio_uxquad_async                             (o_hio_uxquad_async[4]                     ),
    //.k_user_rx_clk1_c0c1c2_sel                      (k_user_rx_clk1_c0c1c2_sel[3]              ),
    //.k_user_rx_clk2_c0c1c2_sel                      (k_user_rx_clk2_c0c1c2_sel[3]              ),
    //.k_user_tx_clk1_c0c1c2_sel                      (k_user_tx_clk1_c0c1c2_sel[3]              ),
    //.k_user_tx_clk2_c0c1c2_sel                      (k_user_tx_clk2_c0c1c2_sel[3]              ),

    .o_hio_user_rx_clk1_clk                         (o_hio_ch4_user_rx_clk1_clk                ),
    .o_hio_user_rx_clk2_clk                         (o_hio_ch4_user_rx_clk2_clk                ),
    .o_hio_user_tx_clk1_clk                         (o_hio_ch4_user_tx_clk1_clk                ),
    .o_hio_user_tx_clk2_clk                         (o_hio_ch4_user_tx_clk2_clk                ),
    .o_hio_ux_chnl_refclk_mux                       (o_hio_ch4_ux_chnl_refclk_mux              ),
    .o_hio_det_lat_rx_async_dl_sync                 (o_hio_ch4_det_lat_rx_async_dl_sync        ),
    .o_hio_det_lat_rx_async_pulse                   (o_hio_ch4_det_lat_rx_async_pulse          ),
    .o_hio_det_lat_rx_async_sample_sync             (o_hio_ch4_det_lat_rx_async_sample_sync    ),
    .o_hio_det_lat_rx_sclk_sample_sync              (o_hio_ch4_det_lat_rx_sclk_sample_sync     ),
    .o_hio_det_lat_rx_trig_sample_sync              (o_hio_ch4_det_lat_rx_trig_sample_sync     ),
    .o_hio_det_lat_tx_async_dl_sync                 (o_hio_ch4_det_lat_tx_async_dl_sync        ),
    .o_hio_det_lat_tx_async_pulse                   (o_hio_ch4_det_lat_tx_async_pulse          ),
    .o_hio_det_lat_tx_async_sample_sync             (o_hio_ch4_det_lat_tx_async_sample_sync    ),
    .o_hio_det_lat_tx_sclk_sample_sync              (o_hio_ch4_det_lat_tx_sclk_sample_sync     ),
    .o_hio_det_lat_tx_trig_sample_sync              (o_hio_ch4_det_lat_tx_trig_sample_sync     ),
    .o_hio_xcvrif_rx_latency_pulse                  (o_hio_ch4_xcvrif_rx_latency_pulse         ),
    .o_hio_xcvrif_tx_latency_pulse                  (o_hio_ch4_xcvrif_tx_latency_pulse         ),

    .tx_serial_p                                    (tx_serial_p[3]                            ),
    .tx_serial_n                                    (tx_serial_n[3]                            ),
   // .o_hio_local_fault                              (o_hio_local_fault[3]                      ),
   // .o_hio_remote_fault                             (o_hio_remote_fault[3]                     ),
   // .o_hio_rx_pause                                 (o_hio_rx_pause[3]                         ),
   // .o_hio_rx_pfc                                   (o_hio_rx_pfc[3]                           ),
   // .o_hio_txfifo_pfull                             (o_hio_txfifo_pfull[3]                     ),
   // .o_hio_dsk_mon_err                              (o_hio_dsk_mon_err[3]                      ),
   // .o_hio_hip_ready                                (o_hio_hip_ready[3]                        ),
   // .o_hio_rx_block_lock                            (o_hio_rx_block_lock[3]                    ),
   // .o_hio_rx_dsk_done                              (o_hio_rx_dsk_done[3]                      ),
   // .o_hio_rx_am_lock                               (o_hio_rx_am_lock[3]                       ),
   // .o_hio_rx_pcs_fully_aligned                     (o_hio_rx_pcs_fully_aligned[3]             ),
   // .o_hio_hi_ber                                   (o_hio_hi_ber[3]                           ),
   // .o_hio_rx_pcs_internal_err                      (o_hio_rx_pcs_internal_err[3]              ),
   // .o_hio_tx_fifo_status_fifo_wr_pfull             (o_hio_tx_fifo_status_fifo_wr_pfull[3]     ),
   // .o_hio_tx_fifo_status_fifo_pempty               (o_hio_tx_fifo_status_fifo_pempty[3]       ),
   // .o_hio_rx_fifo_status_fifo_pempty               (o_hio_rx_fifo_status_fifo_pempty[3]       ),
   // .o_hio_rx_fifo_status_fifo_wr_pfull             (o_hio_rx_fifo_status_fifo_wr_pfull[3]     ),
   // .o_hio_rx_fifo_status_fifo_empty                (o_hio_rx_fifo_status_fifo_empty[3]        ),
   // .o_hio_tx_fifo_status_fifo_empty                (o_hio_tx_fifo_status_fifo_empty[3]        ),
   // .o_hio_rx_fifo_status_gb_restarted              (o_hio_rx_fifo_status_gb_restarted[3]      ),
   // .o_hio_tx_fifo_status_gb_restarted              (o_hio_tx_fifo_status_gb_restarted[3]      ),
    
    .i_uxwrap_bus_in_phy_shared                     (uxwrap_bus_in_phy_shared[3]              ),      //ipfluxtop_uxtop_wrap signals to phy_hal_shared
    .o_uxwrap_bus_out_phy_shared                    (uxwrap_bus_out_phy_shared[3]             ),
    //.o_flux_sclk_mux_phy_shared                   (flux_sclk_mux_phy_shared[3]                ),    //sm_flux_ingress_signals to phy_hal_shared////not used, should i remove 
    //.i_ss_async_pldif_phy_shared                  (ss_async_pldif_phy_shared[3]               ),    //sm_flux_ingress_signals to phy_hal_shared 
    //.o_ss_async_pldif_phy_shared                    (ss_async_pldif_phy_shared[3]             ),    
    //.i_ss_async_pldif_pcie_mux_phy_shared           (ss_async_pldif_pcie_mux_phy_shared[3]    ),    
    .o_lavmm_addr_phy_shared                        (lavmm_addr_phy_shared[3]                 ),
    .o_lavmm_be_phy_shared                          (lavmm_be_phy_shared[3]                   ),
    .o_lavmm_clk_phy_shared                         (lavmm_clk_phy_shared[3]                  ),
    .o_lavmm_read_phy_shared                        (lavmm_read_phy_shared[3]                 ),
    .o_lavmm_rstn_phy_shared                        (lavmm_rstn_phy_shared[3]                 ),
    .o_lavmm_wdata_phy_shared                       (lavmm_wdata_phy_shared[3]                ),
    .o_lavmm_write_phy_shared                       (lavmm_write_phy_shared[3]                ),
    .i_lavmm_rdata_phy_shared                       (lavmm_rdata_phy_shared[3]                ),
    .i_lavmm_rdata_valid_phy_shared                 (lavmm_rdata_valid_phy_shared[3]          ),
    .i_lavmm_waitreq_phy_shared                     (lavmm_waitreq_phy_shared[3]              ),
    //.i_rxpstate_phy_shared                          (rxpstate_phy_shared[3]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxrate_phy_shared                            (rxrate_phy_shared[3]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxterm_hiz_ena_phy_shared                    (rxterm_hiz_ena_phy_shared[3]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxwidth_phy_shared                           (rxwidth_phy_shared[3]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_tstbus_lane_phy_shared                       (tstbus_lane_phy_shared[3]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txbeacona_phy_shared                         (txbeacona_phy_shared[3]                  ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txclkdivrate_phy_shared                      (txclkdivrate_phy_shared[3]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdetectrx_reqa_phy_shared                   (txdetectrx_reqa_phy_shared[3]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levn_phy_shared                        (txdrv_levn_phy_shared[3]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm1_phy_shared                      (txdrv_levnm1_phy_shared[3]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm2_phy_shared                      (txdrv_levnm2_phy_shared[3]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnp1_phy_shared                      (txdrv_levnp1_phy_shared[3]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_slew_phy_shared                        (txdrv_slew_phy_shared[3]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txelecidle_phy_shared                        (txelecidle_phy_shared[3]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txpstate_phy_shared                          (txpstate_phy_shared[3]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txrate_phy_shared                            (txrate_phy_shared[3]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txwidth_phy_shared                           (txwidth_phy_shared[3]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.o_rxmargin_status_gray_phy_shared              (rxmargin_status_gray_phy_shared[3]       ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rst_ux_rx_sfrz_phy_shared                    (rst_ux_rx_sfrz_phy_shared[3]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_flux0_cpi_cmn_busy_phy_shared            (rst_flux0_cpi_cmn_busy_phy_shared[3]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_oflux_rx_srds_rdy_phy_shared             (rst_oflux_rx_srds_rdy_phy_shared[3]      ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_ux_all_synthlockstatus_phy_shared        (rst_ux_all_synthlockstatus_phy_shared[3] ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_rst_ux_rxcdrlockstatus_phy_shared            (rst_ux_rxcdrlockstatus_phy_shared[3]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_cdrfbclk_phy_shared                  (ock_pcs_cdrfbclk_phy_shared[3]           ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_ref_phy_shared                       (ock_pcs_ref_phy_shared[3]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ux_tx_ch_ptr_smpl_phy_shared                 (ux_tx_ch_ptr_smpl_phy_shared[3]          ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    .o_dat_pcs_measlatrndtripbit_phy_shared         (dat_pcs_measlatrndtripbit_phy_shared[3]  ),        ////Navid sheet says to sm_ux_toolbox, but in toolbox it says to fluxcore, so not added in phy_shared. In sujoys, connected to toolbox. Should I add this to physhared
    .o_sclk_return_sel_rx_phy_shared                (sclk_return_sel_rx_phy_shared[3]         ),
    .o_sclk_return_sel_tx_phy_shared                (sclk_return_sel_tx_phy_shared[3]         ),
    //.i_ick_sclk_rx_phy_shared                       (s_i_ick_sclk_rx_phy_shared[3]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.i_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[3]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    .o_ick_sclk_rx_phy_shared                       (s_o_ick_sclk_rx_phy_shared[3]            ),
    .i_sync_common_control_phy_shared               (sync_common_control_phy_shared[3]        ),
    
    .o_ft_rx_sclk_sync_ch_phy_shared                (ft_rx_sclk_sync_ch_phy_shared[3]            ) ,
    .o_ft_tx_sclk_sync_ch_phy_shared                (ft_tx_sclk_sync_ch_phy_shared[3]            ) ,
    .o_rst_ux_rx_pma_rst_n_phy_shared               (rst_ux_rx_pma_rst_n_phy_shared[3]           ) ,
    .o_rst_ux_tx_pma_rst_n_phy_shared               (rst_ux_tx_pma_rst_n_phy_shared[3]           ) ,
    .o_ick_pcs_txword_phy_shared                    (ick_pcs_txword_phy_shared[3]                ) ,
    .o_tx_dl_ch_bit_phy_shared                      (tx_dl_ch_bit_phy_shared[3]                  ) ,
    .i_dat_pcs_measlatbit_phy_shared                (dat_pcs_measlatbit_phy_shared[3]            ) ,
    .i_ft_rx_async_pulse_ch_phy_shared              (ft_rx_async_pulse_ch_phy_shared[3]          ) ,
    .i_ft_tx_async_pulse_ch_phy_shared              (ft_tx_async_pulse_ch_phy_shared[3]          ) ,
    .i_rx_dl_ch_bit_phy_shared                      (rx_dl_ch_bit_phy_shared[3]                  ) ,
    .i_ux_rxuser1_sel_phy_shared                    (ux_rxuser1_sel_phy_shared[3]                ) ,
    .i_ux_rxuser2_sel_phy_shared                    (ux_rxuser2_sel_phy_shared[3]                ) ,
    .i_ux_txuser1_sel_phy_shared                    (ux_txuser1_sel_phy_shared[3]                ) ,
    .i_ux_txuser2_sel_phy_shared                    (ux_txuser2_sel_phy_shared[3]                ) ,
    .o_octl_pcs_txstatus_a_phy_shared               (octl_pcs_txstatus_a_phy_shared[3]           ) ,
    .i_ictl_pcs_txenable_a_phy_shared               (ictl_pcs_txenable_a_phy_shared[3]           ) ,
    .i_sync_cfg_data_phy_shared                     (sync_cfg_data_phy_shared[3]                 ) ,
    .i_sync_interface_control_phy_shared            (sync_interface_control_phy_shared[3]        ) ,
    .o_tx_data_phy_shared                           (tx_data_phy_shared[3]                       ) ,
    .i_rx_data_phy_shared                           (rx_data_phy_shared[3]                       ) ,
    .o_sm_flux_ingress_phy_shared                   (sm_flux_ingress_phy_shared[3]               ) ,
    .i_sm_flux_egress_phy_shared                    (sm_flux_egress_phy_shared[3]                ) ,
    .i_flux_cpi_int_phy_shared                      (flux_cpi_int_phy_shared                               ) ,      //only one bit needed
    .i_flux_int_phy_shared                          (flux_int_phy_shared[3]                      ) ,
    .i_oflux_octl_pcs_txptr_smpl_lane_phy_shared    (oflux_octl_pcs_txptr_smpl_lane_phy_shared[3]) ,
    .o_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[3]                   ) ,
    .i_flux_srds_rdy_phy_shared                     (flux_srds_rdy_phy_shared[3]                 ) ,
    .i_pcs_rxword_phy_shared                        (pcs_rxword_phy_shared[3]                    ) ,
    .i_pcs_rxpostdiv_phy_shared                     (pcs_rxpostdiv_phy_shared[3]                 ) ,
    .i_ock_pcs_txword_phy_shared                    (ock_pcs_txword_phy_shared[3]                ) ,

//    .o_ch_lavmm_fec_addr_fec_wrap                   (ch_lavmm_fec_addr_fec_wrap[3]),
//    .o_ch_lavmm_fec_be_fec_wrap                     (ch_lavmm_fec_be_fec_wrap[3]),
//    .o_ch_lavmm_fec_clk_fec_wrap                    (ch_lavmm_fec_clk_fec_wrap[3]),
//    .o_ch_lavmm_fec_read_fec_wrap                   (ch_lavmm_fec_read_fec_wrap[3]),
//    .o_ch_lavmm_fec_rstn_fec_wrap                   (ch_lavmm_fec_rstn_fec_wrap[3]),
//    .o_ch_lavmm_fec_wdata_fec_wrap                  (ch_lavmm_fec_wdata_fec_wrap[3]),
//    .o_ch_lavmm_fec_write_fec_wrap                  (ch_lavmm_fec_write_fec_wrap[3]),
//    .i_ch_lavmm_fec_rdata_fec_wrap                  (ch_lavmm_fec_rdata_fec_wrap[3]),
//    .i_ch_lavmm_fec_rdata_valid_fec_wrap            (ch_lavmm_fec_rdata_valid_fec_wrap[3]),
//    .i_ch_lavmm_fec_waitreq_fec_wrap                (ch_lavmm_fec_waitreq_fec_wrap[3]),
    .i_ch_eth_fec_rx_async_fec_wrap                 (ch_eth_fec_rx_async_fec_wrap[3]),
    .i_ch_eth_fec_rx_direct_fec_wrap                (ch_eth_fec_rx_direct_fec_wrap[3]),
//    .o_ch_eth_fec_tx_async_fec_wrap                 (ch_eth_fec_tx_async_fec_wrap[3]),
//    .o_ch_eth_fec_tx_direct_fec_wrap                (ch_eth_fec_tx_direct_fec_wrap[3]),
//    .o_rstfec_fec_csr_ret_fec_wrap                  (rstfec_fec_csr_ret_fec_wrap[3]),
    .i_fec_rx_rdy_n_fec_wrap                        (fec_rx_rdy_n_fec_wrap[3]),
//    .o_rstfec_fec_rx_rst_n_fec_wrap                 (rstfec_fec_rx_rst_n_fec_wrap[3]),
//    .o_rstfec_fec_tx_rst_n_fec_wrap                 (rstfec_fec_tx_rst_n_fec_wrap[3]),
//    .o_rstfec_rx_fec_sfrz_n_fec_wrap                (rstfec_rx_fec_sfrz_n_fec_wrap[3]),
//    .o_rstfec_tx_fec_sfrz_n_fec_wrap                (rstfec_tx_fec_sfrz_n_fec_wrap[3]),
    .i_fec_tx_data_mux_sel_fec_wrap                 (fec_tx_data_mux_sel_fec_wrap[3]),
    .i_fec_rx_data_fec_wrap                         (fec_rx_data_fec_wrap[3]),
//    .o_fec_i_tx_mux_data_fec_wrap                   (fec_i_tx_mux_data_fec_wrap[3]),
//    .o_xcvr_rx_data                                 (xcvr_rx_data[3]),
    .i_xcvr_tx_data                                 (xcvr_tx_data[3]),
    .ss_rst_flux0_cpi_cmn_busy                      (ss_rst_flux0_cpi_cmn_busy[3]),
    .o_pma_rx_sf                                    (pma_rx_sf[3]),

    .i_refclk_tx_p                                  (i_refclk_tx_p   ),
//    .i_refclk_tx_n                                  (i_refclk_tx_n   ),//can derive as negated i_refclk_tx_p
    .i_syspll_c0_clk                                (i_syspll_c0_clk ),
    .i_syspll_c1_clk                                (i_syspll_c1_clk ),
    .i_syspll_c2_clk                                (i_syspll_c2_clk ),
    .i_flux_clk                                     (i_flux_clk      ),
    .i_refclk_rx_p                                  (i_refclk_rx_p   ),
//    .i_refclk_rx_n                                  (i_refclk_rx_n   ),

    .i_ux_chnl_refclk_mux_phy_shared                (sm_flux_egress_phy_shared[3][193]),
    .o_xcvrif_tx_fifo_rd_en_mux_x1                  (xcvrif_tx_fifo_rd_en_mux_x1[3]),
    .i_xcvrif_tx_fifo_rd_en_mux_x2                  (xcvrif_tx_fifo_rd_en_mux_x2[3]),
    .i_xcvrif_tx_fifo_rd_en_mux_x4                  (xcvrif_tx_fifo_rd_en_mux_x4[3]),
    .i_xcvrif_tx_fifo_rd_en_mux_x6_bot              (xcvrif_tx_fifo_rd_en_mux_x6_bot[3]),
    .i_xcvrif_tx_fifo_rd_en_mux_x6_top              (xcvrif_tx_fifo_rd_en_mux_x6_top[3]),
    .i_xcvrif_tx_fifo_rd_en_mux_x8_bot              (xcvrif_tx_fifo_rd_en_mux_x8_bot[3]),
    .i_xcvrif_tx_fifo_rd_en_mux_x8_top              (xcvrif_tx_fifo_rd_en_mux_x8_top[3]),
    .o_xcvrif_tx_rst_mux_x1                         (xcvrif_tx_rst_mux_x1[3]),
    .i_xcvrif_tx_rst_mux_x2                         (xcvrif_tx_rst_mux_x2[3]),
    .i_xcvrif_tx_rst_mux_x4                         (xcvrif_tx_rst_mux_x4[3]),
    .i_xcvrif_tx_rst_mux_x6_bot                     (xcvrif_tx_rst_mux_x6_bot[3]),
    .i_xcvrif_tx_rst_mux_x6_top                     (xcvrif_tx_rst_mux_x6_top[3]),
    .i_xcvrif_tx_rst_mux_x8_bot                     (xcvrif_tx_rst_mux_x8_bot[3]),
    .i_xcvrif_tx_rst_mux_x8_top                     (xcvrif_tx_rst_mux_x8_top[3]),
    .o_xcvrif_tx_word_clk_mux_x1                    (xcvrif_tx_word_clk_mux_x1[3]),
    .i_xcvrif_tx_word_clk_mux_x2                    (xcvrif_tx_word_clk_mux_x2[3]),
    .i_xcvrif_tx_word_clk_mux_x4                    (xcvrif_tx_word_clk_mux_x4[3]),
    .i_xcvrif_tx_word_clk_mux_x6_bot                (xcvrif_tx_word_clk_mux_x6_bot[3]),
    .i_xcvrif_tx_word_clk_mux_x6_top                (xcvrif_tx_word_clk_mux_x6_top[3]),
    .i_xcvrif_tx_word_clk_mux_x8_bot                (xcvrif_tx_word_clk_mux_x8_bot[3]),
    .i_xcvrif_tx_word_clk_mux_x8_top                (xcvrif_tx_word_clk_mux_x8_top[3]),
    .ioack_cdrdiv_left_ux_bidir_in                  ('b0),
    .ioack_synthdiv1_left_ux_bidir_in               (ioack_synthdiv1_left_ux_bidir_in_reg[3]),
    .ioack_synthdiv2_left_ux_bidir_in               ('b0),
    .ioack_cdrdiv_left_ux_bidir_out                 (ioack_cdrdiv_left_ux_bidir_out[3]),
    .ioack_synthdiv1_left_ux_bidir_out              (ioack_synthdiv1_left_ux_bidir_out_reg[3]),
    .ioack_synthdiv2_left_ux_bidir_out              (),
//SHUNXIONG EDIT
//    .i_marker_found_up                              (marker_found_up[3]),
//    .i_marker_found_dn                              (marker_found_dn[3]),
//    .o_marker_found                                 (marker_found[3]),
    .o_xcvrif_tx_rst_wr_sync_mux_x1                 (xcvrif_tx_rst_wr_sync_mux_x1[3]),
    .i_xcvrif_tx_rst_wr_sync_mux_x2                 (xcvrif_tx_rst_wr_sync_mux_x2[3]),
    .i_xcvrif_tx_rst_wr_sync_mux_x4                 (xcvrif_tx_rst_wr_sync_mux_x4[3]),
    .i_xcvrif_tx_rst_wr_sync_mux_x6_bot             (xcvrif_tx_rst_wr_sync_mux_x6_bot[3]),
    .i_xcvrif_tx_rst_wr_sync_mux_x6_top             (xcvrif_tx_rst_wr_sync_mux_x6_top[3]),
    .i_xcvrif_tx_rst_wr_sync_mux_x8_bot             (xcvrif_tx_rst_wr_sync_mux_x8_bot[3]),
    .i_xcvrif_tx_rst_wr_sync_mux_x8_top             (xcvrif_tx_rst_wr_sync_mux_x8_top[3]),

    .ss_user_rx_clk1_clk                            (ss_user_rx_clk1_clk[4]),
    .ss_user_rx_clk2_clk                            (ss_user_rx_clk2_clk[4]),
    .ss_user_tx_clk1_clk                            (ss_user_tx_clk1_clk[4]),
    .ss_user_tx_clk2_clk                            (ss_user_tx_clk2_clk[4]),
    .ss_user_rx_clk1_clk_w                          (ss_user_rx_clk1_clk_w[4]), //KAHUAT_EDIT
    .ss_user_rx_clk2_clk_w                          (ss_user_rx_clk2_clk_w[4]), //KAHUAT_EDIT
    .ss_user_tx_clk1_clk_w                          (ss_user_tx_clk1_clk_w[4]), //KAHUAT_EDIT
    .ss_user_tx_clk2_clk_w                          (ss_user_tx_clk2_clk_w[4]), //KAHUAT_EDIT
    .o_hio_ux_tx_ch_ptr_smpl                        (o_hio_ux_tx_ch_ptr_smpl[4]),

//KAHUAT_EDIT
    .o_ss_lavmm_pcie_addr                           (i_ch3_lavmm_pcie_addr[16:0]),
    .o_ss_lavmm_pcie_be                             (i_ch3_lavmm_pcie_be[3:0]),
    .o_ss_lavmm_pcie_clk                            (i_ch3_lavmm_pcie_clk),
    .o_ss_lavmm_pcie_read                           (i_ch3_lavmm_pcie_read),
    .o_ss_lavmm_pcie_rstn                           (i_ch3_lavmm_pcie_rstn),
    .o_ss_lavmm_pcie_wdata                          (i_ch3_lavmm_pcie_wdata[31:0]),
    .o_ss_lavmm_pcie_write                          (i_ch3_lavmm_pcie_write),
    .sm_pld_tx_demux_0_o_pcie                       (i_ch4_tx_data),
    .i_ss_lavmm_pcie_rdata                          (o_ch3_lavmm_pcie_rdata[31:0]),
    .i_ss_lavmm_pcie_rdata_valid                    (o_ch3_lavmm_pcie_rdata_valid),
    .i_ss_lavmm_pcie_waitreq                        (o_ch3_lavmm_pcie_waitreq),
    .sm_pld_rx_mux_0_i_pcie                         (o_ch4_rx_data),
    .o_pld_pcie_clk_4                               (o_pld_pcie_clk_4),

    .o_pcie_rxword_clk                              (i_ch3_pcie_rxword_clk),
    .o_pcie_txword_clk                              (i_ch3_pcie_txword_clk),
    .ss_rst_ux_rxcdrlock2data                       (i_ch3_uxq_rxcdrlock2dataa),
    .o_rxeq_best_eye_vala                           (i_ch3_uxq_rxeq_best_eye_vala[13:0]),
    .o_rxeq_donea                                   (i_ch3_uxq_rxeq_donea),
    .o_rxmargin_nacka                               (i_ch3_uxq_rxmargin_nacka),
    .o_rxmargin_statusa                             (i_ch3_uxq_rxmargin_statusa),
    .o_rxsignaldetect_lfpsa                         (i_ch3_uxq_rxsignaldetect_lfpsa),
    .o_rxsignaldetecta                              (i_ch3_uxq_rxsignaldetecta),
    .o_rxmargin_status_gray                         (i_ch3_uxq_rxmargin_status_gray_a[1:0]),
    .rxstatusa                                      (i_ch3_uxq_rxstatusa),
    .o_pcie_pcs                                     (i_ch3_uxq_rxword[39:0]),
    .o_synthlcfast_postdiv                          (i_ch3_uxq_synthlcfast_postdiv),
    .o_synthlcmed_postdiv                           (i_ch3_uxq_synthlcmed_postdiv),
    .o_synthlcslow_postdiv                          (i_ch3_uxq_synthlcslow_postdiv),
    .o_txdetectrx_acka                              (i_ch3_uxq_txdetectrx_acka),
    .o_txdetectrx_statct                            (i_ch3_uxq_txdetectrx_statct),
    .txstatusa                                      (i_ch3_uxq_txstatusa),
    .i_pcs_pipe_rstn                                (o_ch3_pcs_pipe_rstn),
    .i_ux_ock_pma_clk                               (o_ch3_ux_ock_pma_clk),
    .i_lfps_ennt                                    (o_ch3_uxq_lfps_ennt),
    .i_pcie_l1ctrla                                 (o_ch3_uxq_pcie_l1ctrla[1:0]),
    .i_pma_cmn_ctrl                                 (o_ch3_uxq_pma_cmn_ctrl),
    .i_pma_ctrl                                     (o_ch3_uxq_pma_ctrl),
    .i_pcie_pcs_rx_rst                              (o_ch3_uxq_rst_pcs_rx_b_a),
    .i_pcie_pcs_tx_rst                              (o_ch3_uxq_rst_pcs_tx_b_a),
    .i_rxeiosdetectstata                            (o_ch3_uxq_rxeiosdetectstata),
    .i_rxeq_precal_code_selnt                       (o_ch3_uxq_rxeq_precal_code_selnt[2:0]),
    .i_rxeq_starta                                  (o_ch3_uxq_rxeq_starta),
    .i_rxeq_static_ena                              (o_ch3_uxq_rxeq_static_ena),
    .i_rxmargin_direction_nt                        (o_ch3_uxq_rxmargin_direction_nt),
    .i_rxmargin_offset_change_a                     (o_ch3_uxq_rxmargin_offset_change_a),
    .i_rxmargin_mode_nt                             (o_ch3_uxq_rxmargin_mode_nt),
    .i_rxmargin_offset_nt                           (o_ch3_uxq_rxmargin_offset_nt[6:0]),
    .i_rxmargin_start_a                             (o_ch3_uxq_rxmargin_start_a),
    .i_rxpstate                                     (o_ch3_uxq_rxpstate[2:0]),
    .i_rxrate                                       (o_ch3_uxq_rxrate[3:0]),
    .i_rxterm_hiz_ena                               (o_ch3_uxq_rxterm_hiz_ena),
    .i_rxwidth                                      (o_ch3_uxq_rxwidth[2:0]),
    .i_tstbus_lane                                  (o_ch3_uxq_tstbus_lane),
    .i_txbeacona                                    (o_ch3_uxq_txbeacona),
    .i_txclkdivrate                                 (o_ch3_uxq_txclkdivrate[2:0]),
    .i_txdetectrx_reqa                              (o_ch3_uxq_txdetectrx_reqa),
    .i_txdrv_levn                                   (o_ch3_uxq_txdrv_levn[5:0]),
    .i_txdrv_levnm1                                 (o_ch3_uxq_txdrv_levnm1[4:0]),
    .i_txdrv_levnm2                                 (o_ch3_uxq_txdrv_levnm2[2:0]),
    .i_txdrv_levnp1                                 (o_ch3_uxq_txdrv_levnp1[4:0]),
    .i_txdrv_slew                                   (o_ch3_uxq_txdrv_slew[3:0]),
    .i_txelecidle                                   (o_ch3_uxq_txelecidle[3:0]),
    .i_txpstate                                     (o_ch3_uxq_txpstate[2:0]),
    .i_txrate                                       (o_ch3_uxq_txrate[3:0]),
    .i_txwidth                                      (o_ch3_uxq_txwidth[2:0]),
    .i_pcie_pcs                                     (o_ch3_uxq_txword[39:0])
);
//  } else {
//  one_lane_hal_top_p3 one_lane_inst_3(
//    .i_hio_txdata                                   (i_hio_txdata[3]                           ),
//    .i_hio_txdata_extra                             (i_hio_txdata_extra[3]                     ),
//    .i_hio_txdata_fifo_wr_en                        (i_hio_txdata_fifo_wr_en[3]                ),
//    .i_hio_rxdata_fifo_rd_en                        (i_hio_rxdata_fifo_rd_en[3]                ),
//    .i_hio_ptp_rst_n                                (i_hio_ptp_rst_n[3]                        ),
//    .i_hio_ehip_rx_rst_n                            (i_hio_ehip_rx_rst_n[3]                    ),
//    .i_hio_ehip_tx_rst_n                            (i_hio_ehip_tx_rst_n[3]                    ),
//    .i_hio_ehip_signal_ok                           (i_hio_ehip_signal_ok[3]                   ),
//    .i_hio_sfreeze_2_r03f_rx_mac_srfz_n             (i_hio_sfreeze_2_r03f_rx_mac_srfz_n[3]     ),
//    .i_hio_sfreeze_3_c2f_tx_deskew_srfz_n           (i_hio_sfreeze_3_c2f_tx_deskew_srfz_n[3]   ),
//    .i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n             (i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n[3]     ),
//    .i_hio_rstfec_fec_rx_rst_n                      (i_hio_rstfec_fec_rx_rst_n[3]              ),
//    .i_hio_rstfec_fec_tx_rst_n                      (i_hio_rstfec_fec_tx_rst_n[3]              ),
//    .i_hio_rstfec_fec_csr_ret                       (i_hio_rstfec_fec_csr_ret[3]               ),
//    .i_hio_rstfec_rx_fec_sfrz_n                     (i_hio_rstfec_rx_fec_sfrz_n[3]             ),
//    .i_hio_rstfec_tx_fec_sfrz_n                     (i_hio_rstfec_tx_fec_sfrz_n[3]             ),
//    .i_hio_rstxcvrif_xcvrif_rx_rst_n                (i_hio_rstxcvrif_xcvrif_rx_rst_n[3]        ),
//    .i_hio_rstxcvrif_xcvrif_tx_rst_n                (i_hio_rstxcvrif_xcvrif_tx_rst_n[3]        ),
//    .i_hio_rstxcvrif_xcvrif_signal_ok               (i_hio_rstxcvrif_xcvrif_signal_ok[3]       ),
//    .i_hio_rstxcvrif_rx_xcvrif_sfrz_n               (i_hio_rstxcvrif_rx_xcvrif_sfrz_n[3]       ),
//    .i_hio_rstxcvrif_tx_xcvrif_sfrz_n               (i_hio_rstxcvrif_tx_xcvrif_sfrz_n[3]       ),
//    .i_hio_rst_pld_clrhip                           (i_hio_rst_pld_clrhip[3]                   ),
//    .i_hio_rst_pld_clrpcs                           (i_hio_rst_pld_clrpcs[3]                   ),
//    .i_hio_rst_pld_perstn                           (i_hio_rst_pld_perstn[3]                   ),
//    .i_hio_rst_pld_ready                            (i_hio_rst_pld_ready[3]                    ),
//    .i_hio_rst_pld_adapter_rx_pld_rst_n             (i_hio_rst_pld_adapter_rx_pld_rst_n[3]     ),
//    .i_hio_rst_pld_adapter_tx_pld_rst_n             (i_hio_rst_pld_adapter_tx_pld_rst_n[3]     ),
//    .i_hio_rst_ux_rx_pma_rst_n                      (i_hio_rst_ux_rx_pma_rst_n[3]              ),
//    .i_hio_rst_ux_rx_sfrz                           (i_hio_rst_ux_rx_sfrz[3]                   ),
//    .i_hio_rst_ux_tx_pma_rst_n                      (i_hio_rst_ux_tx_pma_rst_n[3]              ),
//    .i_hio_pld_reset_clk_row                        (i_hio_pld_reset_clk_row[3]                ),
//    .i_hio_uxquad_async                             (i_hio_uxquad_async[3]                     ),
//    .i_hio_uxquad_async_pcie_mux                    (i_hio_uxquad_async_pcie_mux[3]            ),
//
//    .i_hio_lavmm_clk                                (i_hio_ch3_lavmm_clk                       ),
//    .i_hio_lavmm_rstn                               (i_hio_ch3_lavmm_rstn                      ),
//    .i_hio_lavmm_addr                               (i_hio_ch3_lavmm_addr                      ),
//    .i_hio_lavmm_be                                 (i_hio_ch3_lavmm_be                        ),
//    .i_hio_lavmm_read                               (i_hio_ch3_lavmm_read                      ),
//    .i_hio_lavmm_wdata                              (i_hio_ch3_lavmm_wdata                     ),
//    .i_hio_lavmm_write                              (i_hio_ch3_lavmm_write                     ),
//    .o_hio_lavmm_rdata                              (o_hio_ch3_lavmm_rdata                     ),
//    .o_hio_lavmm_rdata_valid                        (o_hio_ch3_lavmm_rdata_valid               ),
//    .o_hio_lavmm_waitreq                            (o_hio_ch3_lavmm_waitreq                   ),
//    .i_hio_pld_rx_clk_in_row_clk                    (i_hio_ch3_pld_rx_clk_in_row_clk           ),
//    .i_hio_pld_tx_clk_in_row_clk                    (i_hio_ch3_pld_tx_clk_in_row_clk           ),
//    .i_hio_det_lat_rx_dl_clk                        (i_hio_ch3_det_lat_rx_dl_clk               ),
//    .i_hio_det_lat_rx_mux_select                    (i_hio_ch3_det_lat_rx_mux_select           ),
//    .i_hio_det_lat_rx_sclk_flop                     (i_hio_ch3_det_lat_rx_sclk_flop            ),
//    .i_hio_det_lat_rx_sclk_gen_clk                  (i_hio_ch3_det_lat_rx_sclk_gen_clk         ),
//    .i_hio_det_lat_rx_trig_flop                     (i_hio_ch3_det_lat_rx_trig_flop            ),
//    .i_hio_det_lat_sampling_clk                     (i_hio_ch3_det_lat_sampling_clk            ),
//    .i_hio_det_lat_tx_dl_clk                        (i_hio_ch3_det_lat_tx_dl_clk               ),
//    .i_hio_det_lat_tx_mux_select                    (i_hio_ch3_det_lat_tx_mux_select           ),
//    .i_hio_det_lat_tx_sclk_flop                     (i_hio_ch3_det_lat_tx_sclk_flop            ),
//    .i_hio_det_lat_tx_sclk_gen_clk                  (i_hio_ch3_det_lat_tx_sclk_gen_clk         ),
//    .i_hio_det_lat_tx_trig_flop                     (i_hio_ch3_det_lat_tx_trig_flop            ),
//
//    .rx_serial_n                                    (rx_serial_n[3]                            ),
//    .rx_serial_p                                    (rx_serial_p[3]                            ),
    //.i_hio_tx_pfc                                   (i_hio_tx_pfc[3]                           ),
    //.i_hio_tx_pause                                 (i_hio_tx_pause[3]                         ),
    //.i_hio_clear_internal                           (i_hio_clear_internal[3]                   ),
    //.i_hio_signal_ok                                (i_hio_signal_ok[3]                        ),
    //.i_hio_pld_ready                                (i_hio_pld_ready[3]                        ),
    //.i_hio_pma_rx_sf                                (i_hio_pma_rx_sf[3]                        ),
    //.i_hio_ch_rstxcvrif_lphy_signal_ok              (i_hio_ch_rstxcvrif_lphy_signal_ok[3]      ),
    //.i_clear_tx_internal_err                        (i_clear_tx_internal_err[3]                ),
//    .o_hio_txdata_fifo_wr_empty                     (o_hio_txdata_fifo_wr_empty[3]             ),
//    .i_hio_txdata_async                             (i_hio_txdata_async [3]                    ),
//    .i_hio_txdata_direct                            (i_hio_txdata_direct[3]                    ),
//    .o_hio_rxdata_async                             (o_hio_rxdata_async [3]                    ),
//    .o_hio_rxdata_direct                            (o_hio_rxdata_direct[3]                    ),
//    .o_hio_txdata_fifo_wr_pempty                    (o_hio_txdata_fifo_wr_pempty[3]            ),
//    .o_hio_txdata_fifo_wr_full                      (o_hio_txdata_fifo_wr_full[3]              ),
//    .o_hio_txdata_fifo_wr_pfull                     (o_hio_txdata_fifo_wr_pfull[3]             ),
//    .o_hio_rxdata                                   (o_hio_rxdata[3]                           ),
//    .o_hio_rxdata_extra                             (o_hio_rxdata_extra[3]                     ),
//    .o_hio_rxdata_fifo_rd_empty                     (o_hio_rxdata_fifo_rd_empty[3]             ),
//    .o_hio_rxdata_fifo_rd_pempty                    (o_hio_rxdata_fifo_rd_pempty[3]            ),
//    .o_hio_rxdata_fifo_rd_full                      (o_hio_rxdata_fifo_rd_full[3]              ),
//    .o_hio_rxdata_fifo_rd_pfull                     (o_hio_rxdata_fifo_rd_pfull[3]             ),
//    .o_hio_rstepcs_rx_pcs_fully_aligned             (o_hio_rstepcs_rx_pcs_fully_aligned[3]     ),
//    .o_hio_rstfec_fec_rx_rdy_n                      (o_hio_rstfec_fec_rx_rdy_n[3]              ),
//    .o_hio_rst_flux0_cpi_cmn_busy                   (o_hio_rst_flux0_cpi_cmn_busy[3]           ),
//    .o_hio_rst_oflux_rx_srds_rdy                    (o_hio_rst_oflux_rx_srds_rdy[3]            ),
//    .o_hio_rst_ux_all_synthlockstatus               (o_hio_rst_ux_all_synthlockstatus[3]       ),
//    .o_hio_rst_ux_octl_pcs_rxstatus                 (o_hio_rst_ux_octl_pcs_rxstatus[3]         ),
//    .o_hio_rst_ux_octl_pcs_txstatus                 (o_hio_rst_ux_octl_pcs_txstatus[3]         ),
//    .o_hio_rst_ux_rxcdrlock2data                    (o_hio_rst_ux_rxcdrlock2data[3]            ),
//    .o_hio_rst_ux_rxcdrlockstatus                   (o_hio_rst_ux_rxcdrlockstatus[3]           ),
//    .o_hio_uxquad_async                             (o_hio_uxquad_async[3]                     ),
    //.k_user_rx_clk1_c0c1c2_sel                      (k_user_rx_clk1_c0c1c2_sel[3]              ),
    //.k_user_rx_clk2_c0c1c2_sel                      (k_user_rx_clk2_c0c1c2_sel[3]              ),
    //.k_user_tx_clk1_c0c1c2_sel                      (k_user_tx_clk1_c0c1c2_sel[3]              ),
    //.k_user_tx_clk2_c0c1c2_sel                      (k_user_tx_clk2_c0c1c2_sel[3]              ),
//
//    .o_hio_user_rx_clk1_clk                         (o_hio_ch3_user_rx_clk1_clk                ),
//    .o_hio_user_rx_clk2_clk                         (o_hio_ch3_user_rx_clk2_clk                ),
//    .o_hio_user_tx_clk1_clk                         (o_hio_ch3_user_tx_clk1_clk                ),
//    .o_hio_user_tx_clk2_clk                         (o_hio_ch3_user_tx_clk2_clk                ),
//    .o_hio_ux_chnl_refclk_mux                       (o_hio_ch3_ux_chnl_refclk_mux              ),
//    .o_hio_det_lat_rx_async_dl_sync                 (o_hio_ch3_det_lat_rx_async_dl_sync        ),
//    .o_hio_det_lat_rx_async_pulse                   (o_hio_ch3_det_lat_rx_async_pulse          ),
//    .o_hio_det_lat_rx_async_sample_sync             (o_hio_ch3_det_lat_rx_async_sample_sync    ),
//    .o_hio_det_lat_rx_sclk_sample_sync              (o_hio_ch3_det_lat_rx_sclk_sample_sync     ),
//    .o_hio_det_lat_rx_trig_sample_sync              (o_hio_ch3_det_lat_rx_trig_sample_sync     ),
//    .o_hio_det_lat_tx_async_dl_sync                 (o_hio_ch3_det_lat_tx_async_dl_sync        ),
//    .o_hio_det_lat_tx_async_pulse                   (o_hio_ch3_det_lat_tx_async_pulse          ),
//    .o_hio_det_lat_tx_async_sample_sync             (o_hio_ch3_det_lat_tx_async_sample_sync    ),
//    .o_hio_det_lat_tx_sclk_sample_sync              (o_hio_ch3_det_lat_tx_sclk_sample_sync     ),
//    .o_hio_det_lat_tx_trig_sample_sync              (o_hio_ch3_det_lat_tx_trig_sample_sync     ),
//    .o_hio_xcvrif_rx_latency_pulse                  (o_hio_ch3_xcvrif_rx_latency_pulse         ),
//    .o_hio_xcvrif_tx_latency_pulse                  (o_hio_ch3_xcvrif_tx_latency_pulse         ),
//
//    .tx_serial_p                                    (tx_serial_p[3]                            ),
//    .tx_serial_n                                    (tx_serial_n[3]                            ),
   // .o_hio_local_fault                              (o_hio_local_fault[3]                      ),
   // .o_hio_remote_fault                             (o_hio_remote_fault[3]                     ),
   // .o_hio_rx_pause                                 (o_hio_rx_pause[3]                         ),
   // .o_hio_rx_pfc                                   (o_hio_rx_pfc[3]                           ),
   // .o_hio_txfifo_pfull                             (o_hio_txfifo_pfull[3]                     ),
   // .o_hio_dsk_mon_err                              (o_hio_dsk_mon_err[3]                      ),
   // .o_hio_hip_ready                                (o_hio_hip_ready[3]                        ),
   // .o_hio_rx_block_lock                            (o_hio_rx_block_lock[3]                    ),
   // .o_hio_rx_dsk_done                              (o_hio_rx_dsk_done[3]                      ),
   // .o_hio_rx_am_lock                               (o_hio_rx_am_lock[3]                       ),
   // .o_hio_rx_pcs_fully_aligned                     (o_hio_rx_pcs_fully_aligned[3]             ),
   // .o_hio_hi_ber                                   (o_hio_hi_ber[3]                           ),
   // .o_hio_rx_pcs_internal_err                      (o_hio_rx_pcs_internal_err[3]              ),
   // .o_hio_tx_fifo_status_fifo_wr_pfull             (o_hio_tx_fifo_status_fifo_wr_pfull[3]     ),
   // .o_hio_tx_fifo_status_fifo_pempty               (o_hio_tx_fifo_status_fifo_pempty[3]       ),
   // .o_hio_rx_fifo_status_fifo_pempty               (o_hio_rx_fifo_status_fifo_pempty[3]       ),
   // .o_hio_rx_fifo_status_fifo_wr_pfull             (o_hio_rx_fifo_status_fifo_wr_pfull[3]     ),
   // .o_hio_rx_fifo_status_fifo_empty                (o_hio_rx_fifo_status_fifo_empty[3]        ),
   // .o_hio_tx_fifo_status_fifo_empty                (o_hio_tx_fifo_status_fifo_empty[3]        ),
   // .o_hio_rx_fifo_status_gb_restarted              (o_hio_rx_fifo_status_gb_restarted[3]      ),
   // .o_hio_tx_fifo_status_gb_restarted              (o_hio_tx_fifo_status_gb_restarted[3]      ),
    
//    .i_uxwrap_bus_in_phy_shared                     (uxwrap_bus_in_phy_shared[3]              ),      //ipfluxtop_uxtop_wrap signals to phy_hal_shared
//    .o_uxwrap_bus_out_phy_shared                    (uxwrap_bus_out_phy_shared[3]             ),
    //.o_flux_sclk_mux_phy_shared                   (flux_sclk_mux_phy_shared[3]                ),    //sm_flux_ingress_signals to phy_hal_shared////not used, should i remove 
    //.i_ss_async_pldif_phy_shared                  (ss_async_pldif_phy_shared[3]               ),    //sm_flux_ingress_signals to phy_hal_shared 
    //.o_ss_async_pldif_phy_shared                    (ss_async_pldif_phy_shared[3]             ),    
    //.i_ss_async_pldif_pcie_mux_phy_shared           (ss_async_pldif_pcie_mux_phy_shared[3]    ),    
//    .o_lavmm_addr_phy_shared                        (lavmm_addr_phy_shared[3]                 ),
//    .o_lavmm_be_phy_shared                          (lavmm_be_phy_shared[3]                   ),
//    .o_lavmm_clk_phy_shared                         (lavmm_clk_phy_shared[3]                  ),
//    .o_lavmm_read_phy_shared                        (lavmm_read_phy_shared[3]                 ),
//    .o_lavmm_rstn_phy_shared                        (lavmm_rstn_phy_shared[3]                 ),
//    .o_lavmm_wdata_phy_shared                       (lavmm_wdata_phy_shared[3]                ),
//    .o_lavmm_write_phy_shared                       (lavmm_write_phy_shared[3]                ),
//    .i_lavmm_rdata_phy_shared                       (lavmm_rdata_phy_shared[3]                ),
//    .i_lavmm_rdata_valid_phy_shared                 (lavmm_rdata_valid_phy_shared[3]          ),
//    .i_lavmm_waitreq_phy_shared                     (lavmm_waitreq_phy_shared[3]              ),
    //.i_rxpstate_phy_shared                          (rxpstate_phy_shared[3]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxrate_phy_shared                            (rxrate_phy_shared[3]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxterm_hiz_ena_phy_shared                    (rxterm_hiz_ena_phy_shared[3]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rxwidth_phy_shared                           (rxwidth_phy_shared[3]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_tstbus_lane_phy_shared                       (tstbus_lane_phy_shared[3]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txbeacona_phy_shared                         (txbeacona_phy_shared[3]                  ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txclkdivrate_phy_shared                      (txclkdivrate_phy_shared[3]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdetectrx_reqa_phy_shared                   (txdetectrx_reqa_phy_shared[3]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levn_phy_shared                        (txdrv_levn_phy_shared[3]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm1_phy_shared                      (txdrv_levnm1_phy_shared[3]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnm2_phy_shared                      (txdrv_levnm2_phy_shared[3]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_levnp1_phy_shared                      (txdrv_levnp1_phy_shared[3]               ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txdrv_slew_phy_shared                        (txdrv_slew_phy_shared[3]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txelecidle_phy_shared                        (txelecidle_phy_shared[3]                 ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txpstate_phy_shared                          (txpstate_phy_shared[3]                   ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txrate_phy_shared                            (txrate_phy_shared[3]                     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_txwidth_phy_shared                           (txwidth_phy_shared[3]                    ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.o_rxmargin_status_gray_phy_shared              (rxmargin_status_gray_phy_shared[3]       ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to ppcs
    //.i_rst_ux_rx_sfrz_phy_shared                    (rst_ux_rx_sfrz_phy_shared[3]             ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_flux0_cpi_cmn_busy_phy_shared            (rst_flux0_cpi_cmn_busy_phy_shared[3]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_oflux_rx_srds_rdy_phy_shared             (rst_oflux_rx_srds_rdy_phy_shared[3]      ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.o_rst_ux_all_synthlockstatus_phy_shared        (rst_ux_all_synthlockstatus_phy_shared[3] ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_rst_ux_rxcdrlockstatus_phy_shared            (rst_ux_rxcdrlockstatus_phy_shared[3]     ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_cdrfbclk_phy_shared                  (ock_pcs_cdrfbclk_phy_shared[3]           ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ock_pcs_ref_phy_shared                       (ock_pcs_ref_phy_shared[3]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
    //.o_ux_tx_ch_ptr_smpl_phy_shared                 (ux_tx_ch_ptr_smpl_phy_shared[3]          ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's different
//    .o_dat_pcs_measlatrndtripbit_phy_shared         (dat_pcs_measlatrndtripbit_phy_shared[3]  ),        ////Navid sheet says to sm_ux_toolbox, but in toolbox it says to fluxcore, so not added in phy_shared. In sujoys, connected to toolbox. Should I add this to physhared
//    .o_sclk_return_sel_rx_phy_shared                (sclk_return_sel_rx_phy_shared[3]         ),
//    .o_sclk_return_sel_tx_phy_shared                (sclk_return_sel_tx_phy_shared[3]         ),
    //.i_ick_sclk_rx_phy_shared                       (s_i_ick_sclk_rx_phy_shared[3]            ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
    //.i_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[3]                ),      ////Navid sheet says to sm_ux_toolbox, but sujoy's connected to pldif
//    .o_ick_sclk_rx_phy_shared                       (s_o_ick_sclk_rx_phy_shared[3]            ),
//    .i_sync_common_control_phy_shared               (sync_common_control_phy_shared[3]        ),
//    
//    .o_ft_rx_sclk_sync_ch_phy_shared                (ft_rx_sclk_sync_ch_phy_shared[3]            ) ,
//    .o_ft_tx_sclk_sync_ch_phy_shared                (ft_tx_sclk_sync_ch_phy_shared[3]            ) ,
//    .o_rst_ux_rx_pma_rst_n_phy_shared               (rst_ux_rx_pma_rst_n_phy_shared[3]           ) ,
//    .o_rst_ux_tx_pma_rst_n_phy_shared               (rst_ux_tx_pma_rst_n_phy_shared[3]           ) ,
//    .o_ick_pcs_txword_phy_shared                    (ick_pcs_txword_phy_shared[3]                ) ,
//    .o_tx_dl_ch_bit_phy_shared                      (tx_dl_ch_bit_phy_shared[3]                  ) ,
//    .i_dat_pcs_measlatbit_phy_shared                (dat_pcs_measlatbit_phy_shared[3]            ) ,
//    .i_ft_rx_async_pulse_ch_phy_shared              (ft_rx_async_pulse_ch_phy_shared[3]          ) ,
//    .i_ft_tx_async_pulse_ch_phy_shared              (ft_tx_async_pulse_ch_phy_shared[3]          ) ,
//    .i_rx_dl_ch_bit_phy_shared                      (rx_dl_ch_bit_phy_shared[3]                  ) ,
//    .i_ux_rxuser1_sel_phy_shared                    (ux_rxuser1_sel_phy_shared[3]                ) ,
//    .i_ux_rxuser2_sel_phy_shared                    (ux_rxuser2_sel_phy_shared[3]                ) ,
//    .i_ux_txuser1_sel_phy_shared                    (ux_txuser1_sel_phy_shared[3]                ) ,
//    .i_ux_txuser2_sel_phy_shared                    (ux_txuser2_sel_phy_shared[3]                ) ,
//    .o_octl_pcs_txstatus_a_phy_shared               (octl_pcs_txstatus_a_phy_shared[3]           ) ,
//    .i_ictl_pcs_txenable_a_phy_shared               (ictl_pcs_txenable_a_phy_shared[3]           ) ,
//    .i_sync_cfg_data_phy_shared                     (sync_cfg_data_phy_shared[3]                 ) ,
//    .i_sync_interface_control_phy_shared            (sync_interface_control_phy_shared[3]        ) ,
//    .o_tx_data_phy_shared                           (tx_data_phy_shared[3]                       ) ,
//    .i_rx_data_phy_shared                           (rx_data_phy_shared[3]                       ) ,
//    .o_sm_flux_ingress_phy_shared                   (sm_flux_ingress_phy_shared[3]               ) ,
//    .i_sm_flux_egress_phy_shared                    (sm_flux_egress_phy_shared[3]                ) ,
//    .i_flux_cpi_int_phy_shared                      (flux_cpi_int_phy_shared                               ) ,      //only one bit needed
//    .i_flux_int_phy_shared                          (flux_int_phy_shared[3]                      ) ,
//    .i_oflux_octl_pcs_txptr_smpl_lane_phy_shared    (oflux_octl_pcs_txptr_smpl_lane_phy_shared[3]) ,
//    .o_ick_sclk_tx_phy_shared                       (ick_sclk_tx_phy_shared[3]                   ) ,
//    .i_flux_srds_rdy_phy_shared                     (flux_srds_rdy_phy_shared[3]                 ) ,
//    .i_pcs_rxword_phy_shared                        (pcs_rxword_phy_shared[3]                    ) ,
//    .i_pcs_rxpostdiv_phy_shared                     (pcs_rxpostdiv_phy_shared[3]                 ) ,
//    .i_ock_pcs_txword_phy_shared                    (ock_pcs_txword_phy_shared[3]                ) ,
//
//    .o_ch_lavmm_fec_addr_fec_wrap                   (ch_lavmm_fec_addr_fec_wrap[3]),
//    .o_ch_lavmm_fec_be_fec_wrap                     (ch_lavmm_fec_be_fec_wrap[3]),
//    .o_ch_lavmm_fec_clk_fec_wrap                    (ch_lavmm_fec_clk_fec_wrap[3]),
//    .o_ch_lavmm_fec_read_fec_wrap                   (ch_lavmm_fec_read_fec_wrap[3]),
//    .o_ch_lavmm_fec_rstn_fec_wrap                   (ch_lavmm_fec_rstn_fec_wrap[3]),
//    .o_ch_lavmm_fec_wdata_fec_wrap                  (ch_lavmm_fec_wdata_fec_wrap[3]),
//    .o_ch_lavmm_fec_write_fec_wrap                  (ch_lavmm_fec_write_fec_wrap[3]),
//    .i_ch_lavmm_fec_rdata_fec_wrap                  (ch_lavmm_fec_rdata_fec_wrap[3]),
//    .i_ch_lavmm_fec_rdata_valid_fec_wrap            (ch_lavmm_fec_rdata_valid_fec_wrap[3]),
//    .i_ch_lavmm_fec_waitreq_fec_wrap                (ch_lavmm_fec_waitreq_fec_wrap[3]),
//    .i_ch_eth_fec_rx_async_fec_wrap                 (ch_eth_fec_rx_async_fec_wrap[3]),
//    .i_ch_eth_fec_rx_direct_fec_wrap                (ch_eth_fec_rx_direct_fec_wrap[3]),
//    .o_ch_eth_fec_tx_async_fec_wrap                 (ch_eth_fec_tx_async_fec_wrap[3]),
//    .o_ch_eth_fec_tx_direct_fec_wrap                (ch_eth_fec_tx_direct_fec_wrap[3]),
//    .o_rstfec_fec_csr_ret_fec_wrap                  (rstfec_fec_csr_ret_fec_wrap[3]),
//    .i_fec_rx_rdy_n_fec_wrap                        (fec_rx_rdy_n_fec_wrap[3]),
//    .o_rstfec_fec_rx_rst_n_fec_wrap                 (rstfec_fec_rx_rst_n_fec_wrap[3]),
//    .o_rstfec_fec_tx_rst_n_fec_wrap                 (rstfec_fec_tx_rst_n_fec_wrap[3]),
//    .o_rstfec_rx_fec_sfrz_n_fec_wrap                (rstfec_rx_fec_sfrz_n_fec_wrap[3]),
//    .o_rstfec_tx_fec_sfrz_n_fec_wrap                (rstfec_tx_fec_sfrz_n_fec_wrap[3]),
//    .i_fec_tx_data_mux_sel_fec_wrap                 (fec_tx_data_mux_sel_fec_wrap[3]),
//    .i_fec_rx_data_fec_wrap                         (fec_rx_data_fec_wrap[3]),
//    .o_fec_i_tx_mux_data_fec_wrap                   (fec_i_tx_mux_data_fec_wrap[3]),
//    .o_xcvr_rx_data                                 (xcvr_rx_data[3]),
//    .i_xcvr_tx_data                                 (xcvr_tx_data[3]),
//    .o_pma_rx_sf                                    (pma_rx_sf[3]),
//
//    .i_refclk_tx_p                                  (i_refclk_tx_p   ),
//    .i_refclk_tx_n                                  (i_refclk_tx_n   ),//can derive as negated i_refclk_tx_p
//    .i_syspll_c0_clk                                (i_syspll_c0_clk ),
//    .i_syspll_c1_clk                                (i_syspll_c1_clk ),
//    .i_syspll_c2_clk                                (i_syspll_c2_clk ),
//    .i_flux_clk                                     (i_flux_clk      ),
//    .i_refclk_rx_p                                  (i_refclk_rx_p   ),
//    .i_refclk_rx_n                                  (i_refclk_rx_n   ),
//
//    .i_ux_chnl_refclk_mux_phy_shared                (sm_flux_egress_phy_shared[3][193]),
//    .i_ch0_top_xcvrif_tx_fifo_rd_en                 (),
//    .i_ch1_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch2_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch3_xcvrif_tx_fifo_rd_en                     (),
//    .i_ch0_top_xcvrif_rx_fifo_rd_en                 (),
//    .i_ch1_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch2_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch3_xcvrif_rx_fifo_rd_en                     (),
//    .i_ch0_top_xcvrif_tx_rst_mux                    (),
//    .i_ch1_xcvrif_tx_rst_mux                        (),
//    .i_ch2_xcvrif_tx_rst_mux                        (),
//    .i_ch3_xcvrif_tx_rst_mux                        (),
//    .i_ux0_top_xcvrif_tx_word_clk                   (),
//    .i_ux1_xcvrif_tx_word_clk                       (),
//    .i_ux2_xcvrif_tx_word_clk                       (),
//    .i_ux3_xcvrif_tx_word_clk                       (),
//    .ioack_cdrdiv_left_ux_bidir_in                  (),
//    .ioack_synthdiv1_left_ux_bidir_in               (),
//    .ioack_synthdiv2_left_ux_bidir_in               (),
//    .ioack_cdrdiv_right_ux_bidir_out                (),
//    .ioack_synthdiv1_right_ux_bidir_out             (),
//    .ioack_synthdiv2_right_ux_bidir_out             ()
//
//);
//  }


shared_hal_coreip
#(
    .ch0_duplex_mode_atom               (ch0_duplex_mode_atom       ),      
    .ch0_fec_spec_atom                  (ch0_fec_spec_atom          ),  
    .ch0_fracture_atom                  (ch0_fracture_atom          ),  
    .ch0_dr_enabled_atom                (ch0_dr_enabled_atom        ),  
    .ch0_sup_mode_atom                  (ch0_sup_mode_atom          ),  
`ifdef ALTERA_RESERVED_QIS
    .ch0_sim_mode_atom                  ("CH0_SIM_MODE_DISABLE"     ),
    .ch1_sim_mode_atom                  ("CH1_SIM_MODE_DISABLE"     ),
    .ch2_sim_mode_atom                  ("CH2_SIM_MODE_DISABLE"     ),
    .ch3_sim_mode_atom                  ("CH3_SIM_MODE_DISABLE"     ),

    .ch0_tx_sim_mode_atom               ("CH0_TX_SIM_MODE_DISABLE"  ),
    .ch0_rx_sim_mode_atom               ("CH0_RX_SIM_MODE_DISABLE"  ),
    .ch1_tx_sim_mode_atom               ("CH1_TX_SIM_MODE_DISABLE"  ),
    .ch1_rx_sim_mode_atom               ("CH1_RX_SIM_MODE_DISABLE"  ),
    .ch2_tx_sim_mode_atom               ("CH2_TX_SIM_MODE_DISABLE"  ),
    .ch2_rx_sim_mode_atom               ("CH2_RX_SIM_MODE_DISABLE"  ),
    .ch3_tx_sim_mode_atom               ("CH3_TX_SIM_MODE_DISABLE"  ),
    .ch3_rx_sim_mode_atom               ("CH3_RX_SIM_MODE_DISABLE"  ),  
    
    .ch0_flux_mode_atom                 ("CH0_FLUX_MODE_FLUX_MODE_SNIFFER"          ),
    .ch1_flux_mode_atom                 ("CH1_FLUX_MODE_FLUX_MODE_SNIFFER"          ),
    .ch2_flux_mode_atom                 ("CH2_FLUX_MODE_FLUX_MODE_SNIFFER"          ),
    .ch3_flux_mode_atom                 ("CH3_FLUX_MODE_FLUX_MODE_SNIFFER"          ),  
`else   
    .ch0_sim_mode_atom                  (ch0_sim_mode_atom          ),
    .ch1_sim_mode_atom                  (ch1_sim_mode_atom          ),
    .ch2_sim_mode_atom                  (ch2_sim_mode_atom          ),  
    .ch3_sim_mode_atom                  (ch3_sim_mode_atom          ), 

    .ch0_tx_sim_mode_atom               (ch0_tx_sim_mode_atom       ),
    .ch0_rx_sim_mode_atom               (ch0_rx_sim_mode_atom       ),
    .ch1_tx_sim_mode_atom               (ch1_tx_sim_mode_atom       ),
    .ch1_rx_sim_mode_atom               (ch1_rx_sim_mode_atom       ),
    .ch2_tx_sim_mode_atom               (ch2_tx_sim_mode_atom       ),
    .ch2_rx_sim_mode_atom               (ch2_rx_sim_mode_atom       ),
    .ch3_tx_sim_mode_atom               (ch3_tx_sim_mode_atom       ),
    .ch3_rx_sim_mode_atom               (ch3_rx_sim_mode_atom       ),

    .ch0_flux_mode_atom                 (ch0_flux_mode_atom         ),
    .ch1_flux_mode_atom                 (ch1_flux_mode_atom         ),
    .ch2_flux_mode_atom                 (ch2_flux_mode_atom         ),
    .ch3_flux_mode_atom                 (ch3_flux_mode_atom         ),
    
`endif  
    .ch1_duplex_mode_atom               (ch1_duplex_mode_atom       ),  
    .ch1_fec_spec_atom                  (ch1_fec_spec_atom          ),  
    .ch1_fracture_atom                  (ch1_fracture_atom          ),  
    .ch1_dr_enabled_atom                (ch1_dr_enabled_atom        ),  
    .ch1_sup_mode_atom                  (ch1_sup_mode_atom          ),  
    .ch2_duplex_mode_atom               (ch2_duplex_mode_atom       ),  
    .ch2_fec_spec_atom                  (ch2_fec_spec_atom          ),  
    .ch2_fracture_atom                  (ch2_fracture_atom          ),  
    .ch2_dr_enabled_atom                (ch2_dr_enabled_atom        ),  
    .ch2_sup_mode_atom                  (ch2_sup_mode_atom          ),  
    .ch3_duplex_mode_atom               (ch3_duplex_mode_atom       ),  
    .ch3_fec_spec_atom                  (ch3_fec_spec_atom          ),  
    .ch3_fracture_atom                  (ch3_fracture_atom          ),  
    .ch3_dr_enabled_atom                (ch3_dr_enabled_atom        ),  
    .ch3_sup_mode_atom                  (ch3_sup_mode_atom          ),  
    .ch0_pcs_l_tx_en_atom               (ch0_pcs_l_tx_en_atom       ),  
    .ch0_pcs_l_rx_en_atom               (ch0_pcs_l_rx_en_atom       ),  
    .ch0_fec_loopback_mode_atom         (ch0_fec_loopback_mode_atom ),  
    .ch0_fec_dyn_tx_mux_atom            (ch0_fec_dyn_tx_mux_atom    ),  
    .ch0_fec_error_atom                 (ch0_fec_error_atom         ),  
    .ch0_fec_rx_en_atom                 (ch0_fec_rx_en_atom         ),  
    .ch0_fec_tx_en_atom                 (ch0_fec_tx_en_atom         ),  
    .ch0_fec_mode_atom                  (ch0_fec_mode_atom          ),  
    .ch1_pcs_l_tx_en_atom               (ch1_pcs_l_tx_en_atom       ),  
    .ch1_pcs_l_rx_en_atom               (ch1_pcs_l_rx_en_atom       ),  
    .ch1_fec_loopback_mode_atom         (ch1_fec_loopback_mode_atom ),  
    .ch1_fec_dyn_tx_mux_atom            (ch1_fec_dyn_tx_mux_atom    ),  
    .ch1_fec_error_atom                 (ch1_fec_error_atom         ),  
    .ch1_fec_rx_en_atom                 (ch1_fec_rx_en_atom         ),  
    .ch1_fec_tx_en_atom                 (ch1_fec_tx_en_atom         ),  
    .ch1_fec_mode_atom                  (ch1_fec_mode_atom          ),  
    .ch2_pcs_l_tx_en_atom               (ch2_pcs_l_tx_en_atom       ),  
    .ch2_pcs_l_rx_en_atom               (ch2_pcs_l_rx_en_atom       ),  
    .ch2_fec_loopback_mode_atom         (ch2_fec_loopback_mode_atom ),  
    .ch2_fec_dyn_tx_mux_atom            (ch2_fec_dyn_tx_mux_atom    ),  
    .ch2_fec_error_atom                 (ch2_fec_error_atom         ),  
    .ch2_fec_rx_en_atom                 (ch2_fec_rx_en_atom         ),  
    .ch2_fec_tx_en_atom                 (ch2_fec_tx_en_atom         ),  
    .ch2_fec_mode_atom                  (ch2_fec_mode_atom          ),  
    .ch3_pcs_l_tx_en_atom               (ch3_pcs_l_tx_en_atom       ),  
    .ch3_pcs_l_rx_en_atom               (ch3_pcs_l_rx_en_atom       ),  
    .ch3_fec_loopback_mode_atom         (ch3_fec_loopback_mode_atom ),  
    .ch3_fec_dyn_tx_mux_atom            (ch3_fec_dyn_tx_mux_atom    ),  
    .ch3_fec_error_atom                 (ch3_fec_error_atom         ),  
    .ch3_fec_rx_en_atom                 (ch3_fec_rx_en_atom         ),  
    .ch3_fec_tx_en_atom                 (ch3_fec_tx_en_atom         ),  
    .ch3_fec_mode_atom                  (ch3_fec_mode_atom          ),

    .ch0_xcvr_tx_preloaded_hardware_configs_atom    (ch0_xcvr_tx_preloaded_hardware_configs_atom ),
    .ch0_xcvr_rx_preloaded_hardware_configs_atom    (ch0_xcvr_rx_preloaded_hardware_configs_atom ),
    .ch0_lc_postdiv_sel_atom                        (ch0_lc_postdiv_sel_atom                     ),
    .ch0_sequencer_reg_en_atom                      (ch0_sequencer_reg_en_atom                   ),
    .ch0_rst_mux_static_sel_atom                    (ch0_rst_mux_static_sel_atom                 ),
    .ch0_xcvr_tx_prbs_pattern_atom                  (ch0_xcvr_tx_prbs_pattern_atom               ),
    .ch0_xcvr_rx_prbs_pattern_atom                  (ch0_xcvr_rx_prbs_pattern_atom               ),
    .ch0_xcvr_tx_user_clk_only_mode_atom            (ch0_xcvr_tx_user_clk_only_mode_atom         ),
    .ch0_xcvr_tx_width_atom                         (ch0_xcvr_tx_width_atom                      ),
    .ch0_xcvr_rx_width_atom                         (ch0_xcvr_rx_width_atom                      ),
    .ch0_phy_loopback_mode_atom                     (ch0_phy_loopback_mode_atom                  ),
    .ch0_tx_dl_enable_atom                          (ch0_tx_dl_enable_atom                       ),
    .ch0_rx_dl_enable_atom                          (ch0_rx_dl_enable_atom                       ),
    .ch0_rx_fec_type_used_atom                      (ch0_rx_fec_type_used_atom                   ),
    //.ch0_dr_enabled_atom                            (ch0_dr_enabled_atom                         ),
    .ch0_xcvr_rx_prbs_monitor_en_atom               (ch0_xcvr_rx_prbs_monitor_en_atom            ),
    .ch0_tx_prbs_gen_en_atom                        (ch0_tx_prbs_gen_en_atom                     ),
    .ch0_rx_user1_clk_mux_dynamic_sel_atom          (ch0_rx_user1_clk_mux_dynamic_sel_atom       ),
    .ch0_rx_user2_clk_mux_dynamic_sel_atom          (ch0_rx_user2_clk_mux_dynamic_sel_atom       ),
    .ch0_tx_user1_clk_mux_dynamic_sel_atom          (ch0_tx_user1_clk_mux_dynamic_sel_atom       ),
    .ch0_tx_user2_clk_mux_dynamic_sel_atom          (ch0_tx_user2_clk_mux_dynamic_sel_atom       ),
    .ch0_xcvr_rx_protocol_hint_atom                 (ch0_xcvr_rx_protocol_hint_atom              ),
    .ch0_pcie_mode_atom                             (ch0_pcie_mode_atom                          ),
    .ch1_xcvr_tx_preloaded_hardware_configs_atom    (ch1_xcvr_tx_preloaded_hardware_configs_atom ),
    .ch1_xcvr_rx_preloaded_hardware_configs_atom    (ch1_xcvr_rx_preloaded_hardware_configs_atom ),
    .ch1_lc_postdiv_sel_atom                        (ch1_lc_postdiv_sel_atom                     ),
    .ch1_sequencer_reg_en_atom                      (ch1_sequencer_reg_en_atom                   ),
    .ch1_rst_mux_static_sel_atom                    (ch1_rst_mux_static_sel_atom                 ),
    .ch1_xcvr_tx_prbs_pattern_atom                  (ch1_xcvr_tx_prbs_pattern_atom               ),
    .ch1_xcvr_rx_prbs_pattern_atom                  (ch1_xcvr_rx_prbs_pattern_atom               ),
    .ch1_xcvr_tx_user_clk_only_mode_atom            (ch1_xcvr_tx_user_clk_only_mode_atom         ),
    .ch1_xcvr_tx_width_atom                         (ch1_xcvr_tx_width_atom                      ),
    .ch1_xcvr_rx_width_atom                         (ch1_xcvr_rx_width_atom                      ),
    .ch1_phy_loopback_mode_atom                     (ch1_phy_loopback_mode_atom                  ),
    .ch1_tx_dl_enable_atom                          (ch1_tx_dl_enable_atom                       ),
    .ch1_rx_dl_enable_atom                          (ch1_rx_dl_enable_atom                       ),
    .ch1_rx_fec_type_used_atom                      (ch1_rx_fec_type_used_atom                   ),
    //.ch1_dr_enabled_atom                            (ch1_dr_enabled_atom                         ),
    .ch1_xcvr_rx_prbs_monitor_en_atom               (ch1_xcvr_rx_prbs_monitor_en_atom            ),
    .ch1_tx_prbs_gen_en_atom                        (ch1_tx_prbs_gen_en_atom                     ),
    .ch1_rx_user1_clk_mux_dynamic_sel_atom          (ch1_rx_user1_clk_mux_dynamic_sel_atom       ),
    .ch1_rx_user2_clk_mux_dynamic_sel_atom          (ch1_rx_user2_clk_mux_dynamic_sel_atom       ),
    .ch1_tx_user1_clk_mux_dynamic_sel_atom          (ch1_tx_user1_clk_mux_dynamic_sel_atom       ),
    .ch1_tx_user2_clk_mux_dynamic_sel_atom          (ch1_tx_user2_clk_mux_dynamic_sel_atom       ),
    .ch1_xcvr_rx_protocol_hint_atom                 (ch1_xcvr_rx_protocol_hint_atom              ),
    .ch1_pcie_mode_atom                             (ch1_pcie_mode_atom                          ),
    .ch2_xcvr_tx_preloaded_hardware_configs_atom    (ch2_xcvr_tx_preloaded_hardware_configs_atom ),
    .ch2_xcvr_rx_preloaded_hardware_configs_atom    (ch2_xcvr_rx_preloaded_hardware_configs_atom ),
    .ch2_lc_postdiv_sel_atom                        (ch2_lc_postdiv_sel_atom                     ),
    .ch2_sequencer_reg_en_atom                      (ch2_sequencer_reg_en_atom                   ),
    .ch2_rst_mux_static_sel_atom                    (ch2_rst_mux_static_sel_atom                 ),
    .ch2_xcvr_tx_prbs_pattern_atom                  (ch2_xcvr_tx_prbs_pattern_atom               ),
    .ch2_xcvr_rx_prbs_pattern_atom                  (ch2_xcvr_rx_prbs_pattern_atom               ),
    .ch2_xcvr_tx_user_clk_only_mode_atom            (ch2_xcvr_tx_user_clk_only_mode_atom         ),
    .ch2_xcvr_tx_width_atom                         (ch2_xcvr_tx_width_atom                      ),
    .ch2_xcvr_rx_width_atom                         (ch2_xcvr_rx_width_atom                      ),
    .ch2_phy_loopback_mode_atom                     (ch2_phy_loopback_mode_atom                  ),
    .ch2_tx_dl_enable_atom                          (ch2_tx_dl_enable_atom                       ),
    .ch2_rx_dl_enable_atom                          (ch2_rx_dl_enable_atom                       ),
    .ch2_rx_fec_type_used_atom                      (ch2_rx_fec_type_used_atom                   ),
    //.ch2_dr_enabled_atom                            (ch2_dr_enabled_atom                         ),
    .ch2_xcvr_rx_prbs_monitor_en_atom               (ch2_xcvr_rx_prbs_monitor_en_atom            ),
    .ch2_tx_prbs_gen_en_atom                        (ch2_tx_prbs_gen_en_atom                     ),
    .ch2_rx_user1_clk_mux_dynamic_sel_atom          (ch2_rx_user1_clk_mux_dynamic_sel_atom       ),
    .ch2_rx_user2_clk_mux_dynamic_sel_atom          (ch2_rx_user2_clk_mux_dynamic_sel_atom       ),
    .ch2_tx_user1_clk_mux_dynamic_sel_atom          (ch2_tx_user1_clk_mux_dynamic_sel_atom       ),
    .ch2_tx_user2_clk_mux_dynamic_sel_atom          (ch2_tx_user2_clk_mux_dynamic_sel_atom       ),
    .ch2_xcvr_rx_protocol_hint_atom                 (ch2_xcvr_rx_protocol_hint_atom              ),
    .ch2_pcie_mode_atom                             (ch2_pcie_mode_atom                          ),
    .ch3_xcvr_tx_preloaded_hardware_configs_atom    (ch3_xcvr_tx_preloaded_hardware_configs_atom ),
    .ch3_xcvr_rx_preloaded_hardware_configs_atom    (ch3_xcvr_rx_preloaded_hardware_configs_atom ),
    .ch3_lc_postdiv_sel_atom                        (ch3_lc_postdiv_sel_atom                     ),
    .ch3_sequencer_reg_en_atom                      (ch3_sequencer_reg_en_atom                   ),
    .ch3_rst_mux_static_sel_atom                    (ch3_rst_mux_static_sel_atom                 ),
    .ch3_xcvr_tx_prbs_pattern_atom                  (ch3_xcvr_tx_prbs_pattern_atom               ),
    .ch3_xcvr_rx_prbs_pattern_atom                  (ch3_xcvr_rx_prbs_pattern_atom               ),
    .ch3_xcvr_tx_user_clk_only_mode_atom            (ch3_xcvr_tx_user_clk_only_mode_atom         ),
    .ch3_xcvr_tx_width_atom                         (ch3_xcvr_tx_width_atom                      ),
    .ch3_xcvr_rx_width_atom                         (ch3_xcvr_rx_width_atom                      ),
    .ch3_phy_loopback_mode_atom                     (ch3_phy_loopback_mode_atom                  ),
    .ch3_tx_dl_enable_atom                          (ch3_tx_dl_enable_atom                       ),
    .ch3_rx_dl_enable_atom                          (ch3_rx_dl_enable_atom                       ),
    .ch3_rx_fec_type_used_atom                      (ch3_rx_fec_type_used_atom                   ),
    //.ch3_dr_enabled_atom                            (ch3_dr_enabled_atom                         ),
    .ch3_xcvr_rx_prbs_monitor_en_atom               (ch3_xcvr_rx_prbs_monitor_en_atom            ),
    .ch3_tx_prbs_gen_en_atom                        (ch3_tx_prbs_gen_en_atom                     ),
    .ch3_rx_user1_clk_mux_dynamic_sel_atom          (ch3_rx_user1_clk_mux_dynamic_sel_atom       ),
    .ch3_rx_user2_clk_mux_dynamic_sel_atom          (ch3_rx_user2_clk_mux_dynamic_sel_atom       ),
    .ch3_tx_user1_clk_mux_dynamic_sel_atom          (ch3_tx_user1_clk_mux_dynamic_sel_atom       ),
    .ch3_tx_user2_clk_mux_dynamic_sel_atom          (ch3_tx_user2_clk_mux_dynamic_sel_atom       ),
    .ch3_xcvr_rx_protocol_hint_atom                 (ch3_xcvr_rx_protocol_hint_atom              ),
    .ch3_pcie_mode_atom                             (ch3_pcie_mode_atom                          ),
    .ch0_tx_pll_l_counter_atom                      (ch0_tx_pll_l_counter_atom           ),
    .ch0_cdr_l_counter_atom                         (ch0_cdr_l_counter_atom              ),
    .ch0_tx_pll_refclk_select_atom                  (ch0_tx_pll_refclk_select_atom       ),
    .ch0_cdr_refclk_select_atom                     (ch0_cdr_refclk_select_atom          ),
    .ch1_tx_pll_l_counter_atom                      (ch1_tx_pll_l_counter_atom           ),
    .ch1_cdr_l_counter_atom                         (ch1_cdr_l_counter_atom              ),
    .ch1_tx_pll_refclk_select_atom                  (ch1_tx_pll_refclk_select_atom       ),
    .ch1_cdr_refclk_select_atom                     (ch1_cdr_refclk_select_atom          ),
    .ch2_tx_pll_l_counter_atom                      (ch2_tx_pll_l_counter_atom           ),
    .ch2_cdr_l_counter_atom                         (ch2_cdr_l_counter_atom              ),
    .ch2_tx_pll_refclk_select_atom                  (ch2_tx_pll_refclk_select_atom       ),
    .ch2_cdr_refclk_select_atom                     (ch2_cdr_refclk_select_atom          ),
    .ch3_tx_pll_l_counter_atom                      (ch3_tx_pll_l_counter_atom           ),
    .ch3_cdr_l_counter_atom                         (ch3_cdr_l_counter_atom              ),
    .ch3_tx_pll_refclk_select_atom                  (ch3_tx_pll_refclk_select_atom       ),
    .ch3_cdr_refclk_select_atom                     (ch3_cdr_refclk_select_atom          ),
    .ch0_rx_dl_rx_lat_bit_for_async_atom            (ch0_rx_dl_rx_lat_bit_for_async_atom ),
    .ch0_rx_dl_rxbit_cntr_pma_atom                  (ch0_rx_dl_rxbit_cntr_pma_atom       ),
    .ch0_rx_dl_rxbit_rollover_atom                  (ch0_rx_dl_rxbit_rollover_atom       ),
    .ch1_rx_dl_rx_lat_bit_for_async_atom            (ch1_rx_dl_rx_lat_bit_for_async_atom ),
    .ch1_rx_dl_rxbit_cntr_pma_atom                  (ch1_rx_dl_rxbit_cntr_pma_atom       ),
    .ch1_rx_dl_rxbit_rollover_atom                  (ch1_rx_dl_rxbit_rollover_atom       ),
    .ch2_rx_dl_rx_lat_bit_for_async_atom            (ch2_rx_dl_rx_lat_bit_for_async_atom ),
    .ch2_rx_dl_rxbit_cntr_pma_atom                  (ch2_rx_dl_rxbit_cntr_pma_atom       ),
    .ch2_rx_dl_rxbit_rollover_atom                  (ch2_rx_dl_rxbit_rollover_atom       ),
    .ch3_rx_dl_rx_lat_bit_for_async_atom            (ch3_rx_dl_rx_lat_bit_for_async_atom ),
    .ch3_rx_dl_rxbit_cntr_pma_atom                  (ch3_rx_dl_rxbit_cntr_pma_atom       ),
    .ch3_rx_dl_rxbit_rollover_atom                  (ch3_rx_dl_rxbit_rollover_atom       ), 
    .ch0_tx_bonding_category_atom                   (ch0_tx_bonding_category_atom        ), 
    .ch1_tx_bonding_category_atom                   (ch1_tx_bonding_category_atom        ), 
    .ch2_tx_bonding_category_atom                   (ch2_tx_bonding_category_atom        ), 
    .ch3_tx_bonding_category_atom                   (ch3_tx_bonding_category_atom        ), 
    .ch0_tx_bond_size_atom                          (ch0_tx_bond_size_atom               ), 
    .ch1_tx_bond_size_atom                          (ch1_tx_bond_size_atom               ), 
    .ch2_tx_bond_size_atom                          (ch2_tx_bond_size_atom               ), 
    .ch3_tx_bond_size_atom                          (ch3_tx_bond_size_atom               ),
    .ch0_clkrx_refclk_cssm_fw_control_atom          (ch0_clkrx_refclk_cssm_fw_control_atom                    ),
    .ch1_clkrx_refclk_cssm_fw_control_atom          (ch1_clkrx_refclk_cssm_fw_control_atom                    ),
    .ch2_clkrx_refclk_cssm_fw_control_atom          (ch2_clkrx_refclk_cssm_fw_control_atom                    ),
    .ch3_clkrx_refclk_cssm_fw_control_atom          (ch3_clkrx_refclk_cssm_fw_control_atom                    ),
    .ch0_clkrx_refclk_sector_specifies_refclk_ready_atom (ch0_clkrx_refclk_sector_specifies_refclk_ready_atom ),
    .ch1_clkrx_refclk_sector_specifies_refclk_ready_atom (ch1_clkrx_refclk_sector_specifies_refclk_ready_atom ),
    .ch2_clkrx_refclk_sector_specifies_refclk_ready_atom (ch2_clkrx_refclk_sector_specifies_refclk_ready_atom ),
    .ch3_clkrx_refclk_sector_specifies_refclk_ready_atom (ch3_clkrx_refclk_sector_specifies_refclk_ready_atom ),
    .ch0_local_refclk_cssm_fw_control_atom          (ch0_local_refclk_cssm_fw_control_atom                    ),
    .ch1_local_refclk_cssm_fw_control_atom          (ch1_local_refclk_cssm_fw_control_atom                    ),
    .ch2_local_refclk_cssm_fw_control_atom          (ch2_local_refclk_cssm_fw_control_atom                    ),
    .ch3_local_refclk_cssm_fw_control_atom          (ch3_local_refclk_cssm_fw_control_atom                    ),
    .ch0_local_refclk_sector_specifies_refclk_ready_atom (ch0_local_refclk_sector_specifies_refclk_ready_atom ),
    .ch1_local_refclk_sector_specifies_refclk_ready_atom (ch1_local_refclk_sector_specifies_refclk_ready_atom ),
    .ch2_local_refclk_sector_specifies_refclk_ready_atom (ch2_local_refclk_sector_specifies_refclk_ready_atom ),
    .ch3_local_refclk_sector_specifies_refclk_ready_atom (ch3_local_refclk_sector_specifies_refclk_ready_atom )
)
shared_hal_coreip_inst(
    .i_fec_wrap_ch0_tx_mux_data     ('0	      ),	// fec_i_tx_mux_data_fec_wrap[0]
    .i_fec_wrap_ch1_tx_mux_data     ('0	      ),	// fec_i_tx_mux_data_fec_wrap[1]
    .i_fec_wrap_ch2_tx_mux_data     ('0	      ),	// fec_i_tx_mux_data_fec_wrap[2]
    .i_fec_wrap_ch3_tx_mux_data     ('0	      ),	// fec_i_tx_mux_data_fec_wrap[3]
    .o_fec_ch0_rx_data              (fec_rx_data_fec_wrap[0]             ),
    .o_fec_ch1_rx_data              (fec_rx_data_fec_wrap[1]             ),
    .o_fec_ch2_rx_data              (fec_rx_data_fec_wrap[2]             ),
    .o_fec_ch3_rx_data              (fec_rx_data_fec_wrap[3]             ),
    .i_xcvr_ch0_rx_data             ('0       ),	// xcvr_rx_data[0]
    .i_xcvr_ch1_rx_data             ('0       ),	// xcvr_rx_data[1]
    .i_xcvr_ch2_rx_data             ('0       ),	// xcvr_rx_data[2]
    .i_xcvr_ch3_rx_data             ('0       ),	// xcvr_rx_data[3]
    .o_xcvr_ch0_tx_data             (xcvr_tx_data[0]                     ),
    .o_xcvr_ch1_tx_data             (xcvr_tx_data[1]                     ),
    .o_xcvr_ch2_tx_data             (xcvr_tx_data[2]                     ),
    .o_xcvr_ch3_tx_data             (xcvr_tx_data[3]                     ),
    .i_fec_clk                      (i_syspll_c0_clk                     ),
    .o_fec_tx_data_mux_sel_ch0      (fec_tx_data_mux_sel_fec_wrap[0]     ),
    .o_fec_tx_data_mux_sel_ch1      (fec_tx_data_mux_sel_fec_wrap[1]     ),
    .o_fec_tx_data_mux_sel_ch2      (fec_tx_data_mux_sel_fec_wrap[2]     ),
    .o_fec_tx_data_mux_sel_ch3      (fec_tx_data_mux_sel_fec_wrap[3]     ),
//    .o_ch0_lavmm_fec_rdata          (ch_lavmm_fec_rdata_fec_wrap[0]      ),
//    .o_ch0_lavmm_fec_rdata_valid    (ch_lavmm_fec_rdata_valid_fec_wrap[0]),
//    .o_ch0_lavmm_fec_waitreq        (ch_lavmm_fec_waitreq_fec_wrap[0]    ),
    .i_ch0_lavmm_fec_addr           ('0       ),	// ch_lavmm_fec_addr_fec_wrap[0]
    .i_ch0_lavmm_fec_be             ('0       ),	// ch_lavmm_fec_be_fec_wrap[0]
    .i_ch0_lavmm_fec_clk            ('0	      ),	// ch_lavmm_fec_clk_fec_wrap[0]
    .i_ch0_lavmm_fec_read           ('0       ),	// ch_lavmm_fec_read_fec_wrap[0]
    .i_ch0_lavmm_fec_rstn           ('0       ),	// ch_lavmm_fec_rstn_fec_wrap[0]
    .i_ch0_lavmm_fec_wdata          ('0       ),	// ch_lavmm_fec_wdata_fec_wrap[0]
    .i_ch0_lavmm_fec_write          ('0       ),	// ch_lavmm_fec_write_fec_wrap[0]
//    .o_ch1_lavmm_fec_rdata          (ch_lavmm_fec_rdata_fec_wrap[1]      ),
//    .o_ch1_lavmm_fec_rdata_valid    (ch_lavmm_fec_rdata_valid_fec_wrap[1]),
//    .o_ch1_lavmm_fec_waitreq        (ch_lavmm_fec_waitreq_fec_wrap[1]    ),
    .i_ch1_lavmm_fec_addr           ('0       ),	// ch_lavmm_fec_addr_fec_wrap[1]
    .i_ch1_lavmm_fec_be             ('0       ),	// ch_lavmm_fec_be_fec_wrap[1]
    .i_ch1_lavmm_fec_clk            ('0	      ),	// ch_lavmm_fec_clk_fec_wrap[1]
    .i_ch1_lavmm_fec_read           ('0       ),	// ch_lavmm_fec_read_fec_wrap[1]
    .i_ch1_lavmm_fec_rstn           ('0       ),	// ch_lavmm_fec_rstn_fec_wrap[1]
    .i_ch1_lavmm_fec_wdata          ('0       ),	// ch_lavmm_fec_wdata_fec_wrap[1]
    .i_ch1_lavmm_fec_write          ('0       ),	// ch_lavmm_fec_write_fec_wrap[1]
//    .o_ch2_lavmm_fec_rdata          (ch_lavmm_fec_rdata_fec_wrap[2]      ),
//    .o_ch2_lavmm_fec_rdata_valid    (ch_lavmm_fec_rdata_valid_fec_wrap[2]),
//    .o_ch2_lavmm_fec_waitreq        (ch_lavmm_fec_waitreq_fec_wrap[2]    ),
    .i_ch2_lavmm_fec_addr           ('0       ),	// ch_lavmm_fec_addr_fec_wrap[2]
    .i_ch2_lavmm_fec_be             ('0       ),	// ch_lavmm_fec_be_fec_wrap[2]
    .i_ch2_lavmm_fec_clk            ('0	      ),	// ch_lavmm_fec_clk_fec_wrap[2]
    .i_ch2_lavmm_fec_read           ('0       ),	// ch_lavmm_fec_read_fec_wrap[2]
    .i_ch2_lavmm_fec_rstn           ('0       ),	// ch_lavmm_fec_rstn_fec_wrap[2]
    .i_ch2_lavmm_fec_wdata          ('0       ),	// ch_lavmm_fec_wdata_fec_wrap[2]
    .i_ch2_lavmm_fec_write          ('0       ),	// ch_lavmm_fec_write_fec_wrap[2]
//    .o_ch3_lavmm_fec_rdata          (ch_lavmm_fec_rdata_fec_wrap[3]      ),
//    .o_ch3_lavmm_fec_rdata_valid    (ch_lavmm_fec_rdata_valid_fec_wrap[3]),
//    .o_ch3_lavmm_fec_waitreq        (ch_lavmm_fec_waitreq_fec_wrap[3]    ),
    .i_ch3_lavmm_fec_addr           ('0       ),	// ch_lavmm_fec_addr_fec_wrap[3]
    .i_ch3_lavmm_fec_be             ('0       ),	// ch_lavmm_fec_be_fec_wrap[3]
    .i_ch3_lavmm_fec_clk            ('0	      ),	// ch_lavmm_fec_clk_fec_wrap[3]
    .i_ch3_lavmm_fec_read           ('0       ),	// ch_lavmm_fec_read_fec_wrap[3]
    .i_ch3_lavmm_fec_rstn           ('0       ),	// ch_lavmm_fec_rstn_fec_wrap[3]
    .i_ch3_lavmm_fec_wdata          ('0       ),	// ch_lavmm_fec_wdata_fec_wrap[3]
    .i_ch3_lavmm_fec_write          ('0       ),	// ch_lavmm_fec_write_fec_wrap[3]
    .i_ch0_eth_fec_tx_async         ('0       ),	// ch_eth_fec_tx_async_fec_wrap[0]
    .i_ch0_eth_fec_tx_direct        ('0	      ),	// ch_eth_fec_tx_direct_fec_wrap[0]
    .o_ch0_eth_fec_rx_async         (ch_eth_fec_rx_async_fec_wrap[0]     ),
    .o_ch0_eth_fec_rx_direct        (ch_eth_fec_rx_direct_fec_wrap[0]    ),
    .i_ch1_eth_fec_tx_async         ('0       ),	// ch_eth_fec_tx_async_fec_wrap[1]
    .i_ch1_eth_fec_tx_direct        ('0	      ),	// ch_eth_fec_tx_direct_fec_wrap[1]
    .o_ch1_eth_fec_rx_async         (ch_eth_fec_rx_async_fec_wrap[1]     ),
    .o_ch1_eth_fec_rx_direct        (ch_eth_fec_rx_direct_fec_wrap[1]    ),
    .i_ch2_eth_fec_tx_async         ('0       ),	// ch_eth_fec_tx_async_fec_wrap[2]
    .i_ch2_eth_fec_tx_direct        ('0	      ),	// ch_eth_fec_tx_direct_fec_wrap[2]
    .o_ch2_eth_fec_rx_async         (ch_eth_fec_rx_async_fec_wrap[2]     ),
    .o_ch2_eth_fec_rx_direct        (ch_eth_fec_rx_direct_fec_wrap[2]    ),
    .i_ch3_eth_fec_tx_async         ('0       ),	// ch_eth_fec_tx_async_fec_wrap[3]
    .i_ch3_eth_fec_tx_direct        ('0	      ),	// ch_eth_fec_tx_direct_fec_wrap[3]
    .o_ch3_eth_fec_rx_async         (ch_eth_fec_rx_async_fec_wrap[3]     ),
    .o_ch3_eth_fec_rx_direct        (ch_eth_fec_rx_direct_fec_wrap[3]    ),
    .i_ch0_rstfec_fec_csr_ret       ('0       ),	// rstfec_fec_csr_ret_fec_wrap[0]
    .o_ch0_fec_rx_rdy_n             (fec_rx_rdy_n_fec_wrap[0]            ),
    .i_ch0_rstfec_fec_rx_rst_n      ('0       ),	// rstfec_fec_rx_rst_n_fec_wrap[0]
    .i_ch0_rstfec_fec_tx_rst_n      ('0       ),	// rstfec_fec_tx_rst_n_fec_wrap[0]
    .i_ch0_rstfec_rx_fec_sfrz_n     ('0       ),	// rstfec_rx_fec_sfrz_n_fec_wrap[0]
    .i_ch0_rstfec_tx_fec_sfrz_n     ('0       ),	// rstfec_tx_fec_sfrz_n_fec_wrap[0]
    .i_ch1_rstfec_fec_csr_ret       ('0       ),	// rstfec_fec_csr_ret_fec_wrap[1]
    .o_ch1_fec_rx_rdy_n             (fec_rx_rdy_n_fec_wrap[1]            ),
    .i_ch1_rstfec_fec_rx_rst_n      ('0       ),	// rstfec_fec_rx_rst_n_fec_wrap[1]
    .i_ch1_rstfec_fec_tx_rst_n      ('0       ),	// rstfec_fec_tx_rst_n_fec_wrap[1]
    .i_ch1_rstfec_rx_fec_sfrz_n     ('0       ),	// rstfec_rx_fec_sfrz_n_fec_wrap[1]
    .i_ch1_rstfec_tx_fec_sfrz_n     ('0       ),	// rstfec_tx_fec_sfrz_n_fec_wrap[1]
    .i_ch2_rstfec_fec_csr_ret       ('0       ),	// rstfec_fec_csr_ret_fec_wrap[2]
    .o_ch2_fec_rx_rdy_n             (fec_rx_rdy_n_fec_wrap[2]            ),
    .i_ch2_rstfec_fec_rx_rst_n      ('0       ),	// rstfec_fec_rx_rst_n_fec_wrap[2]
    .i_ch2_rstfec_fec_tx_rst_n      ('0       ),	// rstfec_fec_tx_rst_n_fec_wrap[2]
    .i_ch2_rstfec_rx_fec_sfrz_n     ('0       ),	// rstfec_rx_fec_sfrz_n_fec_wrap[2]
    .i_ch2_rstfec_tx_fec_sfrz_n     ('0       ),	// rstfec_tx_fec_sfrz_n_fec_wrap[2]
    .i_ch3_rstfec_fec_csr_ret       ('0       ),	// rstfec_fec_csr_ret_fec_wrap[3]
    .o_ch3_fec_rx_rdy_n             (fec_rx_rdy_n_fec_wrap[3]            ),
    .i_ch3_rstfec_fec_rx_rst_n      ('0       ),	// rstfec_fec_rx_rst_n_fec_wrap[3]
    .i_ch3_rstfec_fec_tx_rst_n      ('0       ),	// rstfec_fec_tx_rst_n_fec_wrap[3]
    .i_ch3_rstfec_rx_fec_sfrz_n     ('0       ),	// rstfec_rx_fec_sfrz_n_fec_wrap[3]
    .i_ch3_rstfec_tx_fec_sfrz_n     ('0       ),	// rstfec_tx_fec_sfrz_n_fec_wrap[3]
    .i_pma_rx_sf_ch0                (pma_rx_sf[0]                        ),
    .i_pma_rx_sf_ch1                (pma_rx_sf[1]                        ),
    .i_pma_rx_sf_ch2                (pma_rx_sf[2]                        ),
    .i_pma_rx_sf_ch3                (pma_rx_sf[3]                        ),
    
    .i_ch0_lavmm_addr                      (lavmm_addr_phy_shared[0]                     ),
    .i_ch0_lavmm_be                        (lavmm_be_phy_shared[0]                       ),
    .i_ch0_lavmm_clk                       (lavmm_clk_phy_shared[0]                      ),
    .i_ch0_lavmm_read                      (lavmm_read_phy_shared[0]                     ),
    .i_ch0_lavmm_rstn                      (lavmm_rstn_phy_shared[0]                     ),
    .i_ch0_lavmm_wdata                     (lavmm_wdata_phy_shared[0]                    ),
    .i_ch0_lavmm_write                     (lavmm_write_phy_shared[0]                    ),
    .i_ch1_lavmm_addr                      (lavmm_addr_phy_shared[1]                     ),
    .i_ch1_lavmm_be                        (lavmm_be_phy_shared[1]                       ),
    .i_ch1_lavmm_clk                       (lavmm_clk_phy_shared[1]                      ),
    .i_ch1_lavmm_read                      (lavmm_read_phy_shared[1]                     ),
    .i_ch1_lavmm_rstn                      (lavmm_rstn_phy_shared[1]                     ),
    .i_ch1_lavmm_wdata                     (lavmm_wdata_phy_shared[1]                    ),
    .i_ch1_lavmm_write                     (lavmm_write_phy_shared[1]                    ),
    .i_ch2_lavmm_addr                      (lavmm_addr_phy_shared[2]                     ),
    .i_ch2_lavmm_be                        (lavmm_be_phy_shared[2]                       ),
    .i_ch2_lavmm_clk                       (lavmm_clk_phy_shared[2]                      ),
    .i_ch2_lavmm_read                      (lavmm_read_phy_shared[2]                     ),
    .i_ch2_lavmm_rstn                      (lavmm_rstn_phy_shared[2]                     ),
    .i_ch2_lavmm_wdata                     (lavmm_wdata_phy_shared[2]                    ),
    .i_ch2_lavmm_write                     (lavmm_write_phy_shared[2]                    ),
    .i_ch3_lavmm_addr                      (lavmm_addr_phy_shared[3]                     ),
    .i_ch3_lavmm_be                        (lavmm_be_phy_shared[3]                       ),
    .i_ch3_lavmm_clk                       (lavmm_clk_phy_shared[3]                      ),
    .i_ch3_lavmm_read                      (lavmm_read_phy_shared[3]                     ),
    .i_ch3_lavmm_rstn                      (lavmm_rstn_phy_shared[3]                     ),
    .i_ch3_lavmm_wdata                     (lavmm_wdata_phy_shared[3]                    ),
    .i_ch3_lavmm_write                     (lavmm_write_phy_shared[3]                    ),
    .o_ch0_lavmm_rdata                     (lavmm_rdata_phy_shared[0]                    ),
    .o_ch0_lavmm_rdata_valid               (lavmm_rdata_valid_phy_shared[0]              ),
    .o_ch0_lavmm_waitreq                   (lavmm_waitreq_phy_shared[0]                  ),
    .o_ch1_lavmm_rdata                     (lavmm_rdata_phy_shared[1]                    ),
    .o_ch1_lavmm_rdata_valid               (lavmm_rdata_valid_phy_shared[1]              ),
    .o_ch1_lavmm_waitreq                   (lavmm_waitreq_phy_shared[1]                  ),
    .o_ch2_lavmm_rdata                     (lavmm_rdata_phy_shared[2]                    ),
    .o_ch2_lavmm_rdata_valid               (lavmm_rdata_valid_phy_shared[2]              ),
    .o_ch2_lavmm_waitreq                   (lavmm_waitreq_phy_shared[2]                  ),
    .o_ch3_lavmm_rdata                     (lavmm_rdata_phy_shared[3]                    ),
    .o_ch3_lavmm_rdata_valid               (lavmm_rdata_valid_phy_shared[3]              ),
    .o_ch3_lavmm_waitreq                   (lavmm_waitreq_phy_shared[3]                  ),
    .i_dat_pcs_measlatrndtripbit_ch0       (dat_pcs_measlatrndtripbit_phy_shared[0]      ),
    .i_dat_pcs_measlatrndtripbit_ch1       (dat_pcs_measlatrndtripbit_phy_shared[1]      ),
    .i_dat_pcs_measlatrndtripbit_ch2       (dat_pcs_measlatrndtripbit_phy_shared[2]      ),
    .i_dat_pcs_measlatrndtripbit_ch3       (dat_pcs_measlatrndtripbit_phy_shared[3]      ),
    .i_ft_rx_sclk_sync_ch0                 (ft_rx_sclk_sync_ch_phy_shared[0]             ),                  ////out from flux_ingress as per Navid.But in flux ingress-going to pcie_pcs_lane. In Sujoy's connected one-to-one. So adding this fec_ingress port too
    .i_ft_rx_sclk_sync_ch1                 (ft_rx_sclk_sync_ch_phy_shared[1]             ),
    .i_ft_rx_sclk_sync_ch2                 (ft_rx_sclk_sync_ch_phy_shared[2]             ),
    .i_ft_rx_sclk_sync_ch3                 (ft_rx_sclk_sync_ch_phy_shared[3]             ),
    .i_ft_tx_sclk_sync_ch0                 (ft_tx_sclk_sync_ch_phy_shared[0]             ),
    .i_ft_tx_sclk_sync_ch1                 (ft_tx_sclk_sync_ch_phy_shared[1]             ),
    .i_ft_tx_sclk_sync_ch2                 (ft_tx_sclk_sync_ch_phy_shared[2]             ),
    .i_ft_tx_sclk_sync_ch3                 (ft_tx_sclk_sync_ch_phy_shared[3]             ),
    .i_rst_ux_rx_pma_rst_n_ch0             (rst_ux_rx_pma_rst_n_phy_shared[0]            ),
    .i_rst_ux_rx_pma_rst_n_ch1             (rst_ux_rx_pma_rst_n_phy_shared[1]            ),
    .i_rst_ux_rx_pma_rst_n_ch2             (rst_ux_rx_pma_rst_n_phy_shared[2]            ),
    .i_rst_ux_rx_pma_rst_n_ch3             (rst_ux_rx_pma_rst_n_phy_shared[3]            ),
    .i_rst_ux_tx_pma_rst_n_ch0             (rst_ux_tx_pma_rst_n_phy_shared[0]            ),
    .i_rst_ux_tx_pma_rst_n_ch1             (rst_ux_tx_pma_rst_n_phy_shared[1]            ),
    .i_rst_ux_tx_pma_rst_n_ch2             (rst_ux_tx_pma_rst_n_phy_shared[2]            ),
    .i_rst_ux_tx_pma_rst_n_ch3             (rst_ux_tx_pma_rst_n_phy_shared[3]            ),
/*     .i_pcs_ick_txword_ch0                  (ick_pcs_txword_phy_shared[0]                 ), In Shared HAL Connected iflux_srds_tx_clk_lane0 
    .i_pcs_ick_txword_ch0                  (ick_pcs_txword_phy_shared[0]                 ),
    .i_pcs_ick_txword_ch1                  (ick_pcs_txword_phy_shared[1]                 ),
    .i_pcs_ick_txword_ch2                  (ick_pcs_txword_phy_shared[2]                 ),
    .i_pcs_ick_txword_ch3                  (ick_pcs_txword_phy_shared[3]                 ), */
    .i_tx_dl_ch0_bit                       (tx_dl_ch_bit_phy_shared[0]                   ),
    .i_tx_dl_ch1_bit                       (tx_dl_ch_bit_phy_shared[1]                   ),
    .i_tx_dl_ch2_bit                       (tx_dl_ch_bit_phy_shared[2]                   ),
    .i_tx_dl_ch3_bit                       (tx_dl_ch_bit_phy_shared[3]                   ),
    .o_dat_pcs_measlatbit_ch0              (dat_pcs_measlatbit_phy_shared[0]             ),
    .o_dat_pcs_measlatbit_ch1              (dat_pcs_measlatbit_phy_shared[1]             ),
    .o_dat_pcs_measlatbit_ch2              (dat_pcs_measlatbit_phy_shared[2]             ),
    .o_dat_pcs_measlatbit_ch3              (dat_pcs_measlatbit_phy_shared[3]             ),
    .o_ft_rx_async_pulse_ch0               (ft_rx_async_pulse_ch_phy_shared[0]           ),
    .o_ft_rx_async_pulse_ch1               (ft_rx_async_pulse_ch_phy_shared[1]           ),
    .o_ft_rx_async_pulse_ch2               (ft_rx_async_pulse_ch_phy_shared[2]           ),
    .o_ft_rx_async_pulse_ch3               (ft_rx_async_pulse_ch_phy_shared[3]           ),
    .o_ft_tx_async_pulse_ch0               (ft_tx_async_pulse_ch_phy_shared[0]           ),
    .o_ft_tx_async_pulse_ch1               (ft_tx_async_pulse_ch_phy_shared[1]           ),
    .o_ft_tx_async_pulse_ch2               (ft_tx_async_pulse_ch_phy_shared[2]           ),
    .o_ft_tx_async_pulse_ch3               (ft_tx_async_pulse_ch_phy_shared[3]           ),
    .o_rx_dl_ch0_bit                       (rx_dl_ch_bit_phy_shared[0]                   ),
    .o_rx_dl_ch1_bit                       (rx_dl_ch_bit_phy_shared[1]                   ),
    .o_rx_dl_ch2_bit                       (rx_dl_ch_bit_phy_shared[2]                   ),
    .o_rx_dl_ch3_bit                       (rx_dl_ch_bit_phy_shared[3]                   ),
    .o_ux0_rxuser1_sel                     (ux_rxuser1_sel_phy_shared[0]                 ),
    .o_ux0_rxuser2_sel                     (ux_rxuser2_sel_phy_shared[0]                 ),
    .o_ux0_txuser1_sel                     (ux_txuser1_sel_phy_shared[0]                 ),
    .o_ux0_txuser2_sel                     (ux_txuser2_sel_phy_shared[0]                 ),
    .o_ux1_rxuser1_sel                     (ux_rxuser1_sel_phy_shared[1]                 ),
    .o_ux1_rxuser2_sel                     (ux_rxuser2_sel_phy_shared[1]                 ),
    .o_ux1_txuser1_sel                     (ux_txuser1_sel_phy_shared[1]                 ),
    .o_ux1_txuser2_sel                     (ux_txuser2_sel_phy_shared[1]                 ),
    .o_ux2_rxuser1_sel                     (ux_rxuser1_sel_phy_shared[2]                 ),
    .o_ux2_rxuser2_sel                     (ux_rxuser2_sel_phy_shared[2]                 ),
    .o_ux2_txuser1_sel                     (ux_txuser1_sel_phy_shared[2]                 ),
    .o_ux2_txuser2_sel                     (ux_txuser2_sel_phy_shared[2]                 ),
    .o_ux3_rxuser1_sel                     (ux_rxuser1_sel_phy_shared[3]                 ),
    .o_ux3_rxuser2_sel                     (ux_rxuser2_sel_phy_shared[3]                 ),
    .o_ux3_txuser1_sel                     (ux_txuser1_sel_phy_shared[3]                 ),
    .o_ux3_txuser2_sel                     (ux_txuser2_sel_phy_shared[3]                 ),
    .i_octl_pcs_txstatus_ch0_a             (octl_pcs_txstatus_a_phy_shared[0]            ),
    .i_octl_pcs_txstatus_ch1_a             (octl_pcs_txstatus_a_phy_shared[1]            ),
    .i_octl_pcs_txstatus_ch2_a             (octl_pcs_txstatus_a_phy_shared[2]            ),
    .i_octl_pcs_txstatus_ch3_a             (octl_pcs_txstatus_a_phy_shared[3]            ),
    .o_ictl_pcs_txenable_ch0_a             (ictl_pcs_txenable_a_phy_shared[0]            ),
    .o_ictl_pcs_txenable_ch1_a             (ictl_pcs_txenable_a_phy_shared[1]            ),
    .o_ictl_pcs_txenable_ch2_a             (ictl_pcs_txenable_a_phy_shared[2]            ),
    .o_ictl_pcs_txenable_ch3_a             (ictl_pcs_txenable_a_phy_shared[3]            ),
    .i_ick_sclk_rx_ch0                     (s_o_ick_sclk_rx_phy_shared[0]                ),
    .i_ick_sclk_rx_ch1                     (s_o_ick_sclk_rx_phy_shared[1]                ),
    .i_ick_sclk_rx_ch2                     (s_o_ick_sclk_rx_phy_shared[2]                ),
    .i_ick_sclk_rx_ch3                     (s_o_ick_sclk_rx_phy_shared[3]                ),
    .i_sclk_return_sel_rx_ch0              (sclk_return_sel_rx_phy_shared[0]             ),
    .i_sclk_return_sel_rx_ch1              (sclk_return_sel_rx_phy_shared[1]             ),
    .i_sclk_return_sel_rx_ch2              (sclk_return_sel_rx_phy_shared[2]             ),
    .i_sclk_return_sel_rx_ch3              (sclk_return_sel_rx_phy_shared[3]             ),
    .i_sclk_return_sel_tx_ch0              (sclk_return_sel_tx_phy_shared[0]             ),
    .i_sclk_return_sel_tx_ch1              (sclk_return_sel_tx_phy_shared[1]             ),
    .i_sclk_return_sel_tx_ch2              (sclk_return_sel_tx_phy_shared[2]             ),
    .i_sclk_return_sel_tx_ch3              (sclk_return_sel_tx_phy_shared[3]             ),
    .o_sync_cfg_data_ch0                   (sync_cfg_data_phy_shared[0]                  ),
    .o_sync_cfg_data_ch1                   (sync_cfg_data_phy_shared[1]                  ),
    .o_sync_cfg_data_ch2                   (sync_cfg_data_phy_shared[2]                  ),
    .o_sync_cfg_data_ch3                   (sync_cfg_data_phy_shared[3]                  ),
    .o_sync_common_control_ch0             (sync_common_control_phy_shared[0]            ),
    .o_sync_common_control_ch1             (sync_common_control_phy_shared[1]            ),
    .o_sync_common_control_ch2             (sync_common_control_phy_shared[2]            ),
    .o_sync_common_control_ch3             (sync_common_control_phy_shared[3]            ),
    .o_sync_interface_control_ch0          (sync_interface_control_phy_shared[0]         ),
    .o_sync_interface_control_ch1          (sync_interface_control_phy_shared[1]         ),
    .o_sync_interface_control_ch2          (sync_interface_control_phy_shared[2]         ),
    .o_sync_interface_control_ch3          (sync_interface_control_phy_shared[3]         ),
    .iflux_ext_cpu_fast_clk                (i_flux_clk                                   ),
    .iflux_pcs_txword_lane0                (tx_data_phy_shared[0]                        ),
    .iflux_pcs_txword_lane1                (tx_data_phy_shared[1]                        ),
    .iflux_pcs_txword_lane2                (tx_data_phy_shared[2]                        ),
    .iflux_pcs_txword_lane3                (tx_data_phy_shared[3]                        ),
    .oflux_pcs_rxword_lane0                (rx_data_phy_shared[0]                        ),
    .oflux_pcs_rxword_lane1                (rx_data_phy_shared[1]                        ),
    .oflux_pcs_rxword_lane2                (rx_data_phy_shared[2]                        ),
    .oflux_pcs_rxword_lane3                (rx_data_phy_shared[3]                        ),
    .iflux_ingress_direct_lane0            (sm_flux_ingress_phy_shared[0]                ),
    .iflux_ingress_direct_lane1            (sm_flux_ingress_phy_shared[1]                ),
    .iflux_ingress_direct_lane2            (sm_flux_ingress_phy_shared[2]                ),
    .iflux_ingress_direct_lane3            (sm_flux_ingress_phy_shared[3]                ),
    .oflux_egress_direct_lane0             (sm_flux_egress_phy_shared[0]                 ),
    .oflux_egress_direct_lane1             (sm_flux_egress_phy_shared[1]                 ),
    .oflux_egress_direct_lane2             (sm_flux_egress_phy_shared[2]                 ),
    .oflux_egress_direct_lane3             (sm_flux_egress_phy_shared[3]                 ),
    .iflux_srds_tx_clk_lane0               (ick_pcs_txword_phy_shared[0]                 ),
    .iflux_srds_tx_clk_lane1               (ick_pcs_txword_phy_shared[1]                 ),
    .iflux_srds_tx_clk_lane2               (ick_pcs_txword_phy_shared[2]                 ),
    .iflux_srds_tx_clk_lane3               (ick_pcs_txword_phy_shared[3]                 ),
    .oflux_cpi_int                         (flux_cpi_int_phy_shared                      ),
    .oflux_int0                            (flux_int_phy_shared[0]                       ),
    .oflux_int1                            (flux_int_phy_shared[1]                       ),
    .oflux_int2                            (flux_int_phy_shared[2]                       ),
    .oflux_int3                            (flux_int_phy_shared[3]                       ),
    .oflux_octl_pcs_txptr_smpl_lane0       (oflux_octl_pcs_txptr_smpl_lane_phy_shared[0] ),
    .oflux_octl_pcs_txptr_smpl_lane1       (oflux_octl_pcs_txptr_smpl_lane_phy_shared[1] ),
    .oflux_octl_pcs_txptr_smpl_lane2       (oflux_octl_pcs_txptr_smpl_lane_phy_shared[2] ),
    .oflux_octl_pcs_txptr_smpl_lane3       (oflux_octl_pcs_txptr_smpl_lane_phy_shared[3] ),
    .iflux_ick_pcs_txptr_smpl_clk_l0_lane0 (ick_sclk_tx_phy_shared[0]                    ),
    .iflux_ick_pcs_txptr_smpl_clk_l0_lane1 (ick_sclk_tx_phy_shared[1]                    ),
    .iflux_ick_pcs_txptr_smpl_clk_l0_lane2 (ick_sclk_tx_phy_shared[2]                    ),
    .iflux_ick_pcs_txptr_smpl_clk_l0_lane3 (ick_sclk_tx_phy_shared[3]                    ),
    .oflux_srds_rdy0                       (flux_srds_rdy_phy_shared[0]                  ),
    .oflux_srds_rdy1                       (flux_srds_rdy_phy_shared[1]                  ),
    .oflux_srds_rdy2                       (flux_srds_rdy_phy_shared[2]                  ),
    .oflux_srds_rdy3                       (flux_srds_rdy_phy_shared[3]                  ),
    .oflux_srds_rx_clk_lane0               (pcs_rxword_phy_shared[0]                     ),
    .oflux_srds_rx_clk_lane1               (pcs_rxword_phy_shared[1]                     ),
    .oflux_srds_rx_clk_lane2               (pcs_rxword_phy_shared[2]                     ),
    .oflux_srds_rx_clk_lane3               (pcs_rxword_phy_shared[3]                     ),
    .oflux_srds_rx_divn_clk_lane0          (pcs_rxpostdiv_phy_shared[0]                  ),
    .oflux_srds_rx_divn_clk_lane1          (pcs_rxpostdiv_phy_shared[1]                  ),
    .oflux_srds_rx_divn_clk_lane2          (pcs_rxpostdiv_phy_shared[2]                  ),
    .oflux_srds_rx_divn_clk_lane3          (pcs_rxpostdiv_phy_shared[3]                  ),
    .oflux_srds_tx_clk_lane0               (ock_pcs_txword_phy_shared[0]                 ),
    .oflux_srds_tx_clk_lane1               (ock_pcs_txword_phy_shared[1]                 ),
    .oflux_srds_tx_clk_lane2               (ock_pcs_txword_phy_shared[2]                 ),
    .oflux_srds_tx_clk_lane3               (ock_pcs_txword_phy_shared[3]                 ),
    .uxwrap_bus_in_lane0                   (uxwrap_bus_in_phy_shared[0]                  ),
    .uxwrap_bus_in_lane1                   (uxwrap_bus_in_phy_shared[1]                  ),
    .uxwrap_bus_in_lane2                   (uxwrap_bus_in_phy_shared[2]                  ),
    .uxwrap_bus_in_lane3                   (uxwrap_bus_in_phy_shared[3]                  ),
    .uxwrap_bus_out_lane0                  (uxwrap_bus_out_phy_shared[0]                 ),
    .uxwrap_bus_out_lane1                  (uxwrap_bus_out_phy_shared[1]                 ),
    .uxwrap_bus_out_lane2                  (uxwrap_bus_out_phy_shared[2]                 ),
    .uxwrap_bus_out_lane3                  (uxwrap_bus_out_phy_shared[3]                 ),

    .i_q2q_xcvrrc_ux_ux__txstatus_rc_ux    ('0),
    .o_q2q_xcvrrc_ux_ux__txstatus_ux_rc    (           )
);

/* 
fec_hal_shared_coreip
#(
    .ch0_duplex_mode_atom               (ch0_duplex_mode_atom       ),      
    .ch0_fec_spec_atom                  (ch0_fec_spec_atom          ),  
    .ch0_fracture_atom                  (ch0_fracture_atom          ),  
    .ch0_dr_enabled_atom                (ch0_dr_enabled_atom        ),  
    .ch0_sup_mode_atom                  (ch0_sup_mode_atom          ),  
    .ch0_sim_mode_atom                  (ch0_sim_mode_atom          ),  
    .ch1_duplex_mode_atom               (ch1_duplex_mode_atom       ),  
    .ch1_fec_spec_atom                  (ch1_fec_spec_atom          ),  
    .ch1_fracture_atom                  (ch1_fracture_atom          ),  
    .ch1_dr_enabled_atom                (ch1_dr_enabled_atom        ),  
    .ch1_sup_mode_atom                  (ch1_sup_mode_atom          ),  
    .ch1_sim_mode_atom                  (ch1_sim_mode_atom          ),  
    .ch2_duplex_mode_atom               (ch2_duplex_mode_atom       ),  
    .ch2_fec_spec_atom                  (ch2_fec_spec_atom          ),  
    .ch2_fracture_atom                  (ch2_fracture_atom          ),  
    .ch2_dr_enabled_atom                (ch2_dr_enabled_atom        ),  
    .ch2_sup_mode_atom                  (ch2_sup_mode_atom          ),  
    .ch2_sim_mode_atom                  (ch2_sim_mode_atom          ),  
    .ch3_duplex_mode_atom               (ch3_duplex_mode_atom       ),  
    .ch3_fec_spec_atom                  (ch3_fec_spec_atom          ),  
    .ch3_fracture_atom                  (ch3_fracture_atom          ),  
    .ch3_dr_enabled_atom                (ch3_dr_enabled_atom        ),  
    .ch3_sup_mode_atom                  (ch3_sup_mode_atom          ),  
    .ch3_sim_mode_atom                  (ch3_sim_mode_atom          ),  
    .ch0_pcs_l_tx_en_atom               (ch0_pcs_l_tx_en_atom       ),  
    .ch0_pcs_l_rx_en_atom               (ch0_pcs_l_rx_en_atom       ),  
    .ch0_fec_loopback_mode_atom         (ch0_fec_loopback_mode_atom ),  
    .ch0_fec_dyn_tx_mux_atom            (ch0_fec_dyn_tx_mux_atom    ),  
    .ch0_fec_error_atom                 (ch0_fec_error_atom         ),  
    .ch0_fec_rx_en_atom                 (ch0_fec_rx_en_atom         ),  
    .ch0_fec_tx_en_atom                 (ch0_fec_tx_en_atom         ),  
    .ch0_fec_mode_atom                  (ch0_fec_mode_atom          ),  
    .ch1_pcs_l_tx_en_atom               (ch1_pcs_l_tx_en_atom       ),  
    .ch1_pcs_l_rx_en_atom               (ch1_pcs_l_rx_en_atom       ),  
    .ch1_fec_loopback_mode_atom         (ch1_fec_loopback_mode_atom ),  
    .ch1_fec_dyn_tx_mux_atom            (ch1_fec_dyn_tx_mux_atom    ),  
    .ch1_fec_error_atom                 (ch1_fec_error_atom         ),  
    .ch1_fec_rx_en_atom                 (ch1_fec_rx_en_atom         ),  
    .ch1_fec_tx_en_atom                 (ch1_fec_tx_en_atom         ),  
    .ch1_fec_mode_atom                  (ch1_fec_mode_atom          ),  
    .ch2_pcs_l_tx_en_atom               (ch2_pcs_l_tx_en_atom       ),  
    .ch2_pcs_l_rx_en_atom               (ch2_pcs_l_rx_en_atom       ),  
    .ch2_fec_loopback_mode_atom         (ch2_fec_loopback_mode_atom ),  
    .ch2_fec_dyn_tx_mux_atom            (ch2_fec_dyn_tx_mux_atom    ),  
    .ch2_fec_error_atom                 (ch2_fec_error_atom         ),  
    .ch2_fec_rx_en_atom                 (ch2_fec_rx_en_atom         ),  
    .ch2_fec_tx_en_atom                 (ch2_fec_tx_en_atom         ),  
    .ch2_fec_mode_atom                  (ch2_fec_mode_atom          ),  
    .ch3_pcs_l_tx_en_atom               (ch3_pcs_l_tx_en_atom       ),  
    .ch3_pcs_l_rx_en_atom               (ch3_pcs_l_rx_en_atom       ),  
    .ch3_fec_loopback_mode_atom         (ch3_fec_loopback_mode_atom ),  
    .ch3_fec_dyn_tx_mux_atom            (ch3_fec_dyn_tx_mux_atom    ),  
    .ch3_fec_error_atom                 (ch3_fec_error_atom         ),  
    .ch3_fec_rx_en_atom                 (ch3_fec_rx_en_atom         ),  
    .ch3_fec_tx_en_atom                 (ch3_fec_tx_en_atom         ),  
    .ch3_fec_mode_atom                  (ch3_fec_mode_atom          )   
)
fec_hal_shared_inst(
    .i_fec_wrap_ch0_tx_mux_data     (fec_i_tx_mux_data_fec_wrap[0]       ),
    .i_fec_wrap_ch1_tx_mux_data     (fec_i_tx_mux_data_fec_wrap[1]       ),
    .i_fec_wrap_ch2_tx_mux_data     (fec_i_tx_mux_data_fec_wrap[2]       ),
    .i_fec_wrap_ch3_tx_mux_data     (fec_i_tx_mux_data_fec_wrap[3]       ),
    .o_fec_ch0_rx_data              (fec_rx_data_fec_wrap[0]             ),
    .o_fec_ch1_rx_data              (fec_rx_data_fec_wrap[1]             ),
    .o_fec_ch2_rx_data              (fec_rx_data_fec_wrap[2]             ),
    .o_fec_ch3_rx_data              (fec_rx_data_fec_wrap[3]             ),
    .i_xcvr_ch0_rx_data             (xcvr_rx_data[0]                     ),
    .i_xcvr_ch1_rx_data             (xcvr_rx_data[1]                     ),
    .i_xcvr_ch2_rx_data             (xcvr_rx_data[2]                     ),
    .i_xcvr_ch3_rx_data             (xcvr_rx_data[3]                     ),
    .o_xcvr_ch0_tx_data             (xcvr_tx_data[0]                     ),
    .o_xcvr_ch1_tx_data             (xcvr_tx_data[1]                     ),
    .o_xcvr_ch2_tx_data             (xcvr_tx_data[2]                     ),
    .o_xcvr_ch3_tx_data             (xcvr_tx_data[3]                     ),
    .i_fec_clk                      (                                    ),
    .o_fec_tx_data_mux_sel_ch0      (fec_tx_data_mux_sel_fec_wrap[0]     ),
    .o_fec_tx_data_mux_sel_ch1      (fec_tx_data_mux_sel_fec_wrap[1]     ),
    .o_fec_tx_data_mux_sel_ch2      (fec_tx_data_mux_sel_fec_wrap[2]     ),
    .o_fec_tx_data_mux_sel_ch3      (fec_tx_data_mux_sel_fec_wrap[3]     ),
    .o_ch0_lavmm_fec_rdata          (ch_lavmm_fec_rdata_fec_wrap[0]      ),
    .o_ch0_lavmm_fec_rdata_valid    (ch_lavmm_fec_rdata_valid_fec_wrap[0]),
    .o_ch0_lavmm_fec_waitreq        (ch_lavmm_fec_waitreq_fec_wrap[0]    ),
    .i_ch0_lavmm_fec_addr           (ch_lavmm_fec_addr_fec_wrap[0]       ),
    .i_ch0_lavmm_fec_be             (ch_lavmm_fec_be_fec_wrap[0]         ),
    .i_ch0_lavmm_fec_clk            (ch_lavmm_fec_clk_fec_wrap[0]        ),
    .i_ch0_lavmm_fec_read           (ch_lavmm_fec_read_fec_wrap[0]       ),
    .i_ch0_lavmm_fec_rstn           (ch_lavmm_fec_rstn_fec_wrap[0]       ),
    .i_ch0_lavmm_fec_wdata          (ch_lavmm_fec_wdata_fec_wrap[0]      ),
    .i_ch0_lavmm_fec_write          (ch_lavmm_fec_write_fec_wrap[0]      ),
    .o_ch1_lavmm_fec_rdata          (ch_lavmm_fec_rdata_fec_wrap[1]      ),
    .o_ch1_lavmm_fec_rdata_valid    (ch_lavmm_fec_rdata_valid_fec_wrap[1]),
    .o_ch1_lavmm_fec_waitreq        (ch_lavmm_fec_waitreq_fec_wrap[1]    ),
    .i_ch1_lavmm_fec_addr           (ch_lavmm_fec_addr_fec_wrap[1]       ),
    .i_ch1_lavmm_fec_be             (ch_lavmm_fec_be_fec_wrap[1]         ),
    .i_ch1_lavmm_fec_clk            (ch_lavmm_fec_clk_fec_wrap[1]        ),
    .i_ch1_lavmm_fec_read           (ch_lavmm_fec_read_fec_wrap[1]       ),
    .i_ch1_lavmm_fec_rstn           (ch_lavmm_fec_rstn_fec_wrap[1]       ),
    .i_ch1_lavmm_fec_wdata          (ch_lavmm_fec_wdata_fec_wrap[1]      ),
    .i_ch1_lavmm_fec_write          (ch_lavmm_fec_write_fec_wrap[1]      ),
    .o_ch2_lavmm_fec_rdata          (ch_lavmm_fec_rdata_fec_wrap[2]      ),
    .o_ch2_lavmm_fec_rdata_valid    (ch_lavmm_fec_rdata_valid_fec_wrap[2]),
    .o_ch2_lavmm_fec_waitreq        (ch_lavmm_fec_waitreq_fec_wrap[2]    ),
    .i_ch2_lavmm_fec_addr           (ch_lavmm_fec_addr_fec_wrap[2]       ),
    .i_ch2_lavmm_fec_be             (ch_lavmm_fec_be_fec_wrap[2]         ),
    .i_ch2_lavmm_fec_clk            (ch_lavmm_fec_clk_fec_wrap[2]        ),
    .i_ch2_lavmm_fec_read           (ch_lavmm_fec_read_fec_wrap[2]       ),
    .i_ch2_lavmm_fec_rstn           (ch_lavmm_fec_rstn_fec_wrap[2]       ),
    .i_ch2_lavmm_fec_wdata          (ch_lavmm_fec_wdata_fec_wrap[2]      ),
    .i_ch2_lavmm_fec_write          (ch_lavmm_fec_write_fec_wrap[2]      ),
    .o_ch3_lavmm_fec_rdata          (ch_lavmm_fec_rdata_fec_wrap[3]      ),
    .o_ch3_lavmm_fec_rdata_valid    (ch_lavmm_fec_rdata_valid_fec_wrap[3]),
    .o_ch3_lavmm_fec_waitreq        (ch_lavmm_fec_waitreq_fec_wrap[3]    ),
    .i_ch3_lavmm_fec_addr           (ch_lavmm_fec_addr_fec_wrap[3]       ),
    .i_ch3_lavmm_fec_be             (ch_lavmm_fec_be_fec_wrap[3]         ),
    .i_ch3_lavmm_fec_clk            (ch_lavmm_fec_clk_fec_wrap[3]        ),
    .i_ch3_lavmm_fec_read           (ch_lavmm_fec_read_fec_wrap[3]       ),
    .i_ch3_lavmm_fec_rstn           (ch_lavmm_fec_rstn_fec_wrap[3]       ),
    .i_ch3_lavmm_fec_wdata          (ch_lavmm_fec_wdata_fec_wrap[3]      ),
    .i_ch3_lavmm_fec_write          (ch_lavmm_fec_write_fec_wrap[3]      ),
    .i_ch0_eth_fec_tx_async         (ch_eth_fec_tx_async_fec_wrap[0]     ),
    .i_ch0_eth_fec_tx_direct        (ch_eth_fec_tx_direct_fec_wrap[0]    ),
    .o_ch0_eth_fec_rx_async         (ch_eth_fec_rx_async_fec_wrap[0]     ),
    .o_ch0_eth_fec_rx_direct        (ch_eth_fec_rx_direct_fec_wrap[0]    ),
    .i_ch1_eth_fec_tx_async         (ch_eth_fec_tx_async_fec_wrap[1]     ),
    .i_ch1_eth_fec_tx_direct        (ch_eth_fec_tx_direct_fec_wrap[1]    ),
    .o_ch1_eth_fec_rx_async         (ch_eth_fec_rx_async_fec_wrap[1]     ),
    .o_ch1_eth_fec_rx_direct        (ch_eth_fec_rx_direct_fec_wrap[1]    ),
    .i_ch2_eth_fec_tx_async         (ch_eth_fec_tx_async_fec_wrap[2]     ),
    .i_ch2_eth_fec_tx_direct        (ch_eth_fec_tx_direct_fec_wrap[2]    ),
    .o_ch2_eth_fec_rx_async         (ch_eth_fec_rx_async_fec_wrap[2]     ),
    .o_ch2_eth_fec_rx_direct        (ch_eth_fec_rx_direct_fec_wrap[2]    ),
    .i_ch3_eth_fec_tx_async         (ch_eth_fec_tx_async_fec_wrap[3]     ),
    .i_ch3_eth_fec_tx_direct        (ch_eth_fec_tx_direct_fec_wrap[3]    ),
    .o_ch3_eth_fec_rx_async         (ch_eth_fec_rx_async_fec_wrap[3]     ),
    .o_ch3_eth_fec_rx_direct        (ch_eth_fec_rx_direct_fec_wrap[3]    ),
    .i_ch0_rstfec_fec_csr_ret       (rstfec_fec_csr_ret_fec_wrap[0]      ),
    .o_ch0_fec_rx_rdy_n             (fec_rx_rdy_n_fec_wrap[0]            ),
    .i_ch0_rstfec_fec_rx_rst_n      (rstfec_fec_rx_rst_n_fec_wrap[0]     ),
    .i_ch0_rstfec_fec_tx_rst_n      (rstfec_fec_tx_rst_n_fec_wrap[0]     ),
    .i_ch0_rstfec_rx_fec_sfrz_n     (rstfec_rx_fec_sfrz_n_fec_wrap[0]    ),
    .i_ch0_rstfec_tx_fec_sfrz_n     (rstfec_tx_fec_sfrz_n_fec_wrap[0]    ),
    .i_ch1_rstfec_fec_csr_ret       (rstfec_fec_csr_ret_fec_wrap[1]      ),
    .o_ch1_fec_rx_rdy_n             (fec_rx_rdy_n_fec_wrap[1]            ),
    .i_ch1_rstfec_fec_rx_rst_n      (rstfec_fec_rx_rst_n_fec_wrap[1]     ),
    .i_ch1_rstfec_fec_tx_rst_n      (rstfec_fec_tx_rst_n_fec_wrap[1]     ),
    .i_ch1_rstfec_rx_fec_sfrz_n     (rstfec_rx_fec_sfrz_n_fec_wrap[1]    ),
    .i_ch1_rstfec_tx_fec_sfrz_n     (rstfec_tx_fec_sfrz_n_fec_wrap[1]    ),
    .i_ch2_rstfec_fec_csr_ret       (rstfec_fec_csr_ret_fec_wrap[2]      ),
    .o_ch2_fec_rx_rdy_n             (fec_rx_rdy_n_fec_wrap[2]            ),
    .i_ch2_rstfec_fec_rx_rst_n      (rstfec_fec_rx_rst_n_fec_wrap[2]     ),
    .i_ch2_rstfec_fec_tx_rst_n      (rstfec_fec_tx_rst_n_fec_wrap[2]     ),
    .i_ch2_rstfec_rx_fec_sfrz_n     (rstfec_rx_fec_sfrz_n_fec_wrap[2]    ),
    .i_ch2_rstfec_tx_fec_sfrz_n     (rstfec_tx_fec_sfrz_n_fec_wrap[2]    ),
    .i_ch3_rstfec_fec_csr_ret       (rstfec_fec_csr_ret_fec_wrap[3]      ),
    .o_ch3_fec_rx_rdy_n             (fec_rx_rdy_n_fec_wrap[3]            ),
    .i_ch3_rstfec_fec_rx_rst_n      (rstfec_fec_rx_rst_n_fec_wrap[3]     ),
    .i_ch3_rstfec_fec_tx_rst_n      (rstfec_fec_tx_rst_n_fec_wrap[3]     ),
    .i_ch3_rstfec_rx_fec_sfrz_n     (rstfec_rx_fec_sfrz_n_fec_wrap[3]    ),
    .i_ch3_rstfec_tx_fec_sfrz_n     (rstfec_tx_fec_sfrz_n_fec_wrap[3]    ),
    .i_pma_rx_sf_ch0                (pma_rx_sf[0]                        ),
    .i_pma_rx_sf_ch1                (pma_rx_sf[1]                        ),
    .i_pma_rx_sf_ch2                (pma_rx_sf[2]                        ),
    .i_pma_rx_sf_ch3                (pma_rx_sf[3]                        )
);

phy_hal_shared_coreip
#(
    .ch0_xcvr_tx_preloaded_hardware_configs_atom    (ch0_xcvr_tx_preloaded_hardware_configs_atom ),
    .ch0_xcvr_rx_preloaded_hardware_configs_atom    (ch0_xcvr_rx_preloaded_hardware_configs_atom ),
    .ch0_lc_postdiv_sel_atom                        (ch0_lc_postdiv_sel_atom                     ),
    .ch0_sequencer_reg_en_atom                      (ch0_sequencer_reg_en_atom                   ),
    .ch0_rst_mux_static_sel_atom                    (ch0_rst_mux_static_sel_atom                 ),
    .ch0_xcvr_tx_prbs_pattern_atom                  (ch0_xcvr_tx_prbs_pattern_atom               ),
    .ch0_xcvr_rx_prbs_pattern_atom                  (ch0_xcvr_rx_prbs_pattern_atom               ),
    .ch0_xcvr_tx_user_clk_only_mode_atom            (ch0_xcvr_tx_user_clk_only_mode_atom         ),
    .ch0_xcvr_tx_width_atom                         (ch0_xcvr_tx_width_atom                      ),
    .ch0_xcvr_rx_width_atom                         (ch0_xcvr_rx_width_atom                      ),
    .ch0_phy_loopback_mode_atom                     (ch0_phy_loopback_mode_atom                  ),
    .ch0_flux_mode_atom                             (ch0_flux_mode_atom                          ),
    .ch0_tx_sim_mode_atom                           (ch0_tx_sim_mode_atom                        ),
    .ch0_rx_sim_mode_atom                           (ch0_rx_sim_mode_atom                        ),
    .ch0_tx_dl_enable_atom                          (ch0_tx_dl_enable_atom                       ),
    .ch0_rx_dl_enable_atom                          (ch0_rx_dl_enable_atom                       ),
    .ch0_rx_fec_type_used_atom                      (ch0_rx_fec_type_used_atom                   ),
    .ch0_dr_enabled_atom                            (ch0_dr_enabled_atom                         ),
    .ch0_xcvr_rx_prbs_monitor_en_atom               (ch0_xcvr_rx_prbs_monitor_en_atom            ),
    .ch0_tx_prbs_gen_en_atom                        (ch0_tx_prbs_gen_en_atom                     ),
    .ch0_rx_user1_clk_mux_dynamic_sel_atom          (ch0_rx_user1_clk_mux_dynamic_sel_atom       ),
    .ch0_rx_user2_clk_mux_dynamic_sel_atom          (ch0_rx_user2_clk_mux_dynamic_sel_atom       ),
    .ch0_tx_user1_clk_mux_dynamic_sel_atom          (ch0_tx_user1_clk_mux_dynamic_sel_atom       ),
    .ch0_tx_user2_clk_mux_dynamic_sel_atom          (ch0_tx_user2_clk_mux_dynamic_sel_atom       ),
    .ch0_xcvr_rx_protocol_hint_atom                 (ch0_xcvr_rx_protocol_hint_atom              ),
    .ch0_pcie_mode_atom                             (ch0_pcie_mode_atom                          ),
    .ch1_xcvr_tx_preloaded_hardware_configs_atom    (ch1_xcvr_tx_preloaded_hardware_configs_atom ),
    .ch1_xcvr_rx_preloaded_hardware_configs_atom    (ch1_xcvr_rx_preloaded_hardware_configs_atom ),
    .ch1_lc_postdiv_sel_atom                        (ch1_lc_postdiv_sel_atom                     ),
    .ch1_sequencer_reg_en_atom                      (ch1_sequencer_reg_en_atom                   ),
    .ch1_rst_mux_static_sel_atom                    (ch1_rst_mux_static_sel_atom                 ),
    .ch1_xcvr_tx_prbs_pattern_atom                  (ch1_xcvr_tx_prbs_pattern_atom               ),
    .ch1_xcvr_rx_prbs_pattern_atom                  (ch1_xcvr_rx_prbs_pattern_atom               ),
    .ch1_xcvr_tx_user_clk_only_mode_atom            (ch1_xcvr_tx_user_clk_only_mode_atom         ),
    .ch1_xcvr_tx_width_atom                         (ch1_xcvr_tx_width_atom                      ),
    .ch1_xcvr_rx_width_atom                         (ch1_xcvr_rx_width_atom                      ),
    .ch1_phy_loopback_mode_atom                     (ch1_phy_loopback_mode_atom                  ),
    .ch1_flux_mode_atom                             (ch1_flux_mode_atom                          ),
    .ch1_tx_sim_mode_atom                           (ch1_tx_sim_mode_atom                        ),
    .ch1_rx_sim_mode_atom                           (ch1_rx_sim_mode_atom                        ),
    .ch1_tx_dl_enable_atom                          (ch1_tx_dl_enable_atom                       ),
    .ch1_rx_dl_enable_atom                          (ch1_rx_dl_enable_atom                       ),
    .ch1_rx_fec_type_used_atom                      (ch1_rx_fec_type_used_atom                   ),
    .ch1_dr_enabled_atom                            (ch1_dr_enabled_atom                         ),
    .ch1_xcvr_rx_prbs_monitor_en_atom               (ch1_xcvr_rx_prbs_monitor_en_atom            ),
    .ch1_tx_prbs_gen_en_atom                        (ch1_tx_prbs_gen_en_atom                     ),
    .ch1_rx_user1_clk_mux_dynamic_sel_atom          (ch1_rx_user1_clk_mux_dynamic_sel_atom       ),
    .ch1_rx_user2_clk_mux_dynamic_sel_atom          (ch1_rx_user2_clk_mux_dynamic_sel_atom       ),
    .ch1_tx_user1_clk_mux_dynamic_sel_atom          (ch1_tx_user1_clk_mux_dynamic_sel_atom       ),
    .ch1_tx_user2_clk_mux_dynamic_sel_atom          (ch1_tx_user2_clk_mux_dynamic_sel_atom       ),
    .ch1_xcvr_rx_protocol_hint_atom                 (ch1_xcvr_rx_protocol_hint_atom              ),
    .ch1_pcie_mode_atom                             (ch1_pcie_mode_atom                          ),
    .ch2_xcvr_tx_preloaded_hardware_configs_atom    (ch2_xcvr_tx_preloaded_hardware_configs_atom ),
    .ch2_xcvr_rx_preloaded_hardware_configs_atom    (ch2_xcvr_rx_preloaded_hardware_configs_atom ),
    .ch2_lc_postdiv_sel_atom                        (ch2_lc_postdiv_sel_atom                     ),
    .ch2_sequencer_reg_en_atom                      (ch2_sequencer_reg_en_atom                   ),
    .ch2_rst_mux_static_sel_atom                    (ch2_rst_mux_static_sel_atom                 ),
    .ch2_xcvr_tx_prbs_pattern_atom                  (ch2_xcvr_tx_prbs_pattern_atom               ),
    .ch2_xcvr_rx_prbs_pattern_atom                  (ch2_xcvr_rx_prbs_pattern_atom               ),
    .ch2_xcvr_tx_user_clk_only_mode_atom            (ch2_xcvr_tx_user_clk_only_mode_atom         ),
    .ch2_xcvr_tx_width_atom                         (ch2_xcvr_tx_width_atom                      ),
    .ch2_xcvr_rx_width_atom                         (ch2_xcvr_rx_width_atom                      ),
    .ch2_phy_loopback_mode_atom                     (ch2_phy_loopback_mode_atom                  ),
    .ch2_flux_mode_atom                             (ch2_flux_mode_atom                          ),
    .ch2_tx_sim_mode_atom                           (ch2_tx_sim_mode_atom                        ),
    .ch2_rx_sim_mode_atom                           (ch2_rx_sim_mode_atom                        ),
    .ch2_tx_dl_enable_atom                          (ch2_tx_dl_enable_atom                       ),
    .ch2_rx_dl_enable_atom                          (ch2_rx_dl_enable_atom                       ),
    .ch2_rx_fec_type_used_atom                      (ch2_rx_fec_type_used_atom                   ),
    .ch2_dr_enabled_atom                            (ch2_dr_enabled_atom                         ),
    .ch2_xcvr_rx_prbs_monitor_en_atom               (ch2_xcvr_rx_prbs_monitor_en_atom            ),
    .ch2_tx_prbs_gen_en_atom                        (ch2_tx_prbs_gen_en_atom                     ),
    .ch2_rx_user1_clk_mux_dynamic_sel_atom          (ch2_rx_user1_clk_mux_dynamic_sel_atom       ),
    .ch2_rx_user2_clk_mux_dynamic_sel_atom          (ch2_rx_user2_clk_mux_dynamic_sel_atom       ),
    .ch2_tx_user1_clk_mux_dynamic_sel_atom          (ch2_tx_user1_clk_mux_dynamic_sel_atom       ),
    .ch2_tx_user2_clk_mux_dynamic_sel_atom          (ch2_tx_user2_clk_mux_dynamic_sel_atom       ),
    .ch2_xcvr_rx_protocol_hint_atom                 (ch2_xcvr_rx_protocol_hint_atom              ),
    .ch2_pcie_mode_atom                             (ch2_pcie_mode_atom                          ),
    .ch3_xcvr_tx_preloaded_hardware_configs_atom    (ch3_xcvr_tx_preloaded_hardware_configs_atom ),
    .ch3_xcvr_rx_preloaded_hardware_configs_atom    (ch3_xcvr_rx_preloaded_hardware_configs_atom ),
    .ch3_lc_postdiv_sel_atom                        (ch3_lc_postdiv_sel_atom                     ),
    .ch3_sequencer_reg_en_atom                      (ch3_sequencer_reg_en_atom                   ),
    .ch3_rst_mux_static_sel_atom                    (ch3_rst_mux_static_sel_atom                 ),
    .ch3_xcvr_tx_prbs_pattern_atom                  (ch3_xcvr_tx_prbs_pattern_atom               ),
    .ch3_xcvr_rx_prbs_pattern_atom                  (ch3_xcvr_rx_prbs_pattern_atom               ),
    .ch3_xcvr_tx_user_clk_only_mode_atom            (ch3_xcvr_tx_user_clk_only_mode_atom         ),
    .ch3_xcvr_tx_width_atom                         (ch3_xcvr_tx_width_atom                      ),
    .ch3_xcvr_rx_width_atom                         (ch3_xcvr_rx_width_atom                      ),
    .ch3_phy_loopback_mode_atom                     (ch3_phy_loopback_mode_atom                  ),
    .ch3_flux_mode_atom                             (ch3_flux_mode_atom                          ),
    .ch3_tx_sim_mode_atom                           (ch3_tx_sim_mode_atom                        ),
    .ch3_rx_sim_mode_atom                           (ch3_rx_sim_mode_atom                        ),
    .ch3_tx_dl_enable_atom                          (ch3_tx_dl_enable_atom                       ),
    .ch3_rx_dl_enable_atom                          (ch3_rx_dl_enable_atom                       ),
    .ch3_rx_fec_type_used_atom                      (ch3_rx_fec_type_used_atom                   ),
    .ch3_dr_enabled_atom                            (ch3_dr_enabled_atom                         ),
    .ch3_xcvr_rx_prbs_monitor_en_atom               (ch3_xcvr_rx_prbs_monitor_en_atom            ),
    .ch3_tx_prbs_gen_en_atom                        (ch3_tx_prbs_gen_en_atom                     ),
    .ch3_rx_user1_clk_mux_dynamic_sel_atom          (ch3_rx_user1_clk_mux_dynamic_sel_atom       ),
    .ch3_rx_user2_clk_mux_dynamic_sel_atom          (ch3_rx_user2_clk_mux_dynamic_sel_atom       ),
    .ch3_tx_user1_clk_mux_dynamic_sel_atom          (ch3_tx_user1_clk_mux_dynamic_sel_atom       ),
    .ch3_tx_user2_clk_mux_dynamic_sel_atom          (ch3_tx_user2_clk_mux_dynamic_sel_atom       ),
    .ch3_xcvr_rx_protocol_hint_atom                 (ch3_xcvr_rx_protocol_hint_atom              ),
    .ch3_pcie_mode_atom                             (ch3_pcie_mode_atom                          )
)
phy_hal_shared_inst(
    .i_ch0_lavmm_addr                      (lavmm_addr_phy_shared[0]                     ),
    .i_ch0_lavmm_be                        (lavmm_be_phy_shared[0]                       ),
    .i_ch0_lavmm_clk                       (lavmm_clk_phy_shared[0]                      ),
    .i_ch0_lavmm_read                      (lavmm_read_phy_shared[0]                     ),
    .i_ch0_lavmm_rstn                      (lavmm_rstn_phy_shared[0]                     ),
    .i_ch0_lavmm_wdata                     (lavmm_wdata_phy_shared[0]                    ),
    .i_ch0_lavmm_write                     (lavmm_write_phy_shared[0]                    ),
    .i_ch1_lavmm_addr                      (lavmm_addr_phy_shared[1]                     ),
    .i_ch1_lavmm_be                        (lavmm_be_phy_shared[1]                       ),
    .i_ch1_lavmm_clk                       (lavmm_clk_phy_shared[1]                      ),
    .i_ch1_lavmm_read                      (lavmm_read_phy_shared[1]                     ),
    .i_ch1_lavmm_rstn                      (lavmm_rstn_phy_shared[1]                     ),
    .i_ch1_lavmm_wdata                     (lavmm_wdata_phy_shared[1]                    ),
    .i_ch1_lavmm_write                     (lavmm_write_phy_shared[1]                    ),
    .i_ch2_lavmm_addr                      (lavmm_addr_phy_shared[2]                     ),
    .i_ch2_lavmm_be                        (lavmm_be_phy_shared[2]                       ),
    .i_ch2_lavmm_clk                       (lavmm_clk_phy_shared[2]                      ),
    .i_ch2_lavmm_read                      (lavmm_read_phy_shared[2]                     ),
    .i_ch2_lavmm_rstn                      (lavmm_rstn_phy_shared[2]                     ),
    .i_ch2_lavmm_wdata                     (lavmm_wdata_phy_shared[2]                    ),
    .i_ch2_lavmm_write                     (lavmm_write_phy_shared[2]                    ),
    .i_ch3_lavmm_addr                      (lavmm_addr_phy_shared[3]                     ),
    .i_ch3_lavmm_be                        (lavmm_be_phy_shared[3]                       ),
    .i_ch3_lavmm_clk                       (lavmm_clk_phy_shared[3]                      ),
    .i_ch3_lavmm_read                      (lavmm_read_phy_shared[3]                     ),
    .i_ch3_lavmm_rstn                      (lavmm_rstn_phy_shared[3]                     ),
    .i_ch3_lavmm_wdata                     (lavmm_wdata_phy_shared[3]                    ),
    .i_ch3_lavmm_write                     (lavmm_write_phy_shared[3]                    ),
    .o_ch0_lavmm_rdata                     (lavmm_rdata_phy_shared[0]                    ),
    .o_ch0_lavmm_rdata_valid               (lavmm_rdata_valid_phy_shared[0]              ),
    .o_ch0_lavmm_waitreq                   (lavmm_waitreq_phy_shared[0]                  ),
    .o_ch1_lavmm_rdata                     (lavmm_rdata_phy_shared[1]                    ),
    .o_ch1_lavmm_rdata_valid               (lavmm_rdata_valid_phy_shared[1]              ),
    .o_ch1_lavmm_waitreq                   (lavmm_waitreq_phy_shared[1]                  ),
    .o_ch2_lavmm_rdata                     (lavmm_rdata_phy_shared[2]                    ),
    .o_ch2_lavmm_rdata_valid               (lavmm_rdata_valid_phy_shared[2]              ),
    .o_ch2_lavmm_waitreq                   (lavmm_waitreq_phy_shared[2]                  ),
    .o_ch3_lavmm_rdata                     (lavmm_rdata_phy_shared[3]                    ),
    .o_ch3_lavmm_rdata_valid               (lavmm_rdata_valid_phy_shared[3]              ),
    .o_ch3_lavmm_waitreq                   (lavmm_waitreq_phy_shared[3]                  ),
    .i_ft_rx_sclk_sync_ch0                 (ft_rx_sclk_sync_ch_phy_shared[0]            ),                  ////out from flux_ingress as per Navid.But in flux ingress-going to pcie_pcs_lane. In Sujoy's connected one-to-one. So adding this fec_ingress port too
    .i_ft_rx_sclk_sync_ch1                 (ft_rx_sclk_sync_ch_phy_shared[1]             ),
    .i_ft_rx_sclk_sync_ch2                 (ft_rx_sclk_sync_ch_phy_shared[2]             ),
    .i_ft_rx_sclk_sync_ch3                 (ft_rx_sclk_sync_ch_phy_shared[3]             ),
    .i_ft_tx_sclk_sync_ch0                 (ft_tx_sclk_sync_ch_phy_shared[0]             ),
    .i_ft_tx_sclk_sync_ch1                 (ft_tx_sclk_sync_ch_phy_shared[1]             ),
    .i_ft_tx_sclk_sync_ch2                 (ft_tx_sclk_sync_ch_phy_shared[2]             ),
    .i_ft_tx_sclk_sync_ch3                 (ft_tx_sclk_sync_ch_phy_shared[3]             ),
    .i_rst_ux_rx_pma_rst_n_ch0             (rst_ux_rx_pma_rst_n_phy_shared[0]            ),
    .i_rst_ux_rx_pma_rst_n_ch1             (rst_ux_rx_pma_rst_n_phy_shared[1]            ),
    .i_rst_ux_rx_pma_rst_n_ch2             (rst_ux_rx_pma_rst_n_phy_shared[2]            ),
    .i_rst_ux_rx_pma_rst_n_ch3             (rst_ux_rx_pma_rst_n_phy_shared[3]            ),
    .i_rst_ux_tx_pma_rst_n_ch0             (rst_ux_tx_pma_rst_n_phy_shared[0]            ),
    .i_rst_ux_tx_pma_rst_n_ch1             (rst_ux_tx_pma_rst_n_phy_shared[1]            ),
    .i_rst_ux_tx_pma_rst_n_ch2             (rst_ux_tx_pma_rst_n_phy_shared[2]            ),
    .i_rst_ux_tx_pma_rst_n_ch3             (rst_ux_tx_pma_rst_n_phy_shared[3]            ),
    .i_pcs_ick_txword_ch0                  (ick_pcs_txword_phy_shared[0]                 ),
    .i_pcs_ick_txword_ch1                  (ick_pcs_txword_phy_shared[1]                 ),
    .i_pcs_ick_txword_ch2                  (ick_pcs_txword_phy_shared[2]                 ),
    .i_pcs_ick_txword_ch3                  (ick_pcs_txword_phy_shared[3]                 ),
    .i_tx_dl_ch0_bit                       (tx_dl_ch_bit_phy_shared[0]                   ),
    .i_tx_dl_ch1_bit                       (tx_dl_ch_bit_phy_shared[1]                   ),
    .i_tx_dl_ch2_bit                       (tx_dl_ch_bit_phy_shared[2]                   ),
    .i_tx_dl_ch3_bit                       (tx_dl_ch_bit_phy_shared[3]                   ),
    .o_dat_pcs_measlatbit_ch0              (dat_pcs_measlatbit_phy_shared[0]             ),
    .o_dat_pcs_measlatbit_ch1              (dat_pcs_measlatbit_phy_shared[1]             ),
    .o_dat_pcs_measlatbit_ch2              (dat_pcs_measlatbit_phy_shared[2]             ),
    .o_dat_pcs_measlatbit_ch3              (dat_pcs_measlatbit_phy_shared[3]             ),
    .o_ft_rx_async_pulse_ch0               (ft_rx_async_pulse_ch_phy_shared[0]           ),
    .o_ft_rx_async_pulse_ch1               (ft_rx_async_pulse_ch_phy_shared[1]           ),
    .o_ft_rx_async_pulse_ch2               (ft_rx_async_pulse_ch_phy_shared[2]           ),
    .o_ft_rx_async_pulse_ch3               (ft_rx_async_pulse_ch_phy_shared[3]           ),
    .o_ft_tx_async_pulse_ch0               (ft_tx_async_pulse_ch_phy_shared[0]           ),
    .o_ft_tx_async_pulse_ch1               (ft_tx_async_pulse_ch_phy_shared[1]           ),
    .o_ft_tx_async_pulse_ch2               (ft_tx_async_pulse_ch_phy_shared[2]           ),
    .o_ft_tx_async_pulse_ch3               (ft_tx_async_pulse_ch_phy_shared[3]           ),
    .o_rx_dl_ch0_bit                       (rx_dl_ch_bit_phy_shared                      ),
    .o_rx_dl_ch1_bit                       (rx_dl_ch_bit_phy_shared                      ),
    .o_rx_dl_ch2_bit                       (rx_dl_ch_bit_phy_shared                      ),
    .o_rx_dl_ch3_bit                       (rx_dl_ch_bit_phy_shared                      ),
    .o_ux0_rxuser1_sel                     (ux_rxuser1_sel_phy_shared[0]                 ),
    .o_ux0_rxuser2_sel                     (ux_rxuser2_sel_phy_shared[0]                 ),
    .o_ux0_txuser1_sel                     (ux_txuser1_sel_phy_shared[0]                 ),
    .o_ux0_txuser2_sel                     (ux_txuser2_sel_phy_shared[0]                 ),
    .o_ux1_rxuser1_sel                     (ux_rxuser1_sel_phy_shared[1]                 ),
    .o_ux1_rxuser2_sel                     (ux_rxuser2_sel_phy_shared[1]                 ),
    .o_ux1_txuser1_sel                     (ux_txuser1_sel_phy_shared[1]                 ),
    .o_ux1_txuser2_sel                     (ux_txuser2_sel_phy_shared[1]                 ),
    .o_ux2_rxuser1_sel                     (ux_rxuser1_sel_phy_shared[2]                 ),
    .o_ux2_rxuser2_sel                     (ux_rxuser2_sel_phy_shared[2]                 ),
    .o_ux2_txuser1_sel                     (ux_txuser1_sel_phy_shared[2]                 ),
    .o_ux2_txuser2_sel                     (ux_txuser2_sel_phy_shared[2]                 ),
    .o_ux3_rxuser1_sel                     (ux_rxuser1_sel_phy_shared[3]                 ),
    .o_ux3_rxuser2_sel                     (ux_rxuser2_sel_phy_shared[3]                 ),
    .o_ux3_txuser1_sel                     (ux_txuser1_sel_phy_shared[3]                 ),
    .o_ux3_txuser2_sel                     (ux_txuser2_sel_phy_shared[3]                 ),
    .i_octl_pcs_txstatus_ch0_a             (octl_pcs_txstatus_a_phy_shared[0]            ),
    .i_octl_pcs_txstatus_ch1_a             (octl_pcs_txstatus_a_phy_shared[1]            ),
    .i_octl_pcs_txstatus_ch2_a             (octl_pcs_txstatus_a_phy_shared[2]            ),
    .i_octl_pcs_txstatus_ch3_a             (octl_pcs_txstatus_a_phy_shared[3]            ),
    .o_ictl_pcs_txenable_ch0_a             (ictl_pcs_txenable_a_phy_shared[0]            ),
    .o_ictl_pcs_txenable_ch1_a             (ictl_pcs_txenable_a_phy_shared[1]            ),
    .o_ictl_pcs_txenable_ch2_a             (ictl_pcs_txenable_a_phy_shared[2]            ),
    .o_ictl_pcs_txenable_ch3_a             (ictl_pcs_txenable_a_phy_shared[3]            ),
    .i_ick_sclk_rx_ch0                     (s_o_ick_sclk_rx_phy_shared[0]                ),
    .i_ick_sclk_rx_ch1                     (s_o_ick_sclk_rx_phy_shared[1]                ),
    .i_ick_sclk_rx_ch2                     (s_o_ick_sclk_rx_phy_shared[2]                ),
    .i_ick_sclk_rx_ch3                     (s_o_ick_sclk_rx_phy_shared[3]                ),
    .i_sclk_return_sel_rx_ch0              (sclk_return_sel_rx_phy_shared[0]             ),
    .i_sclk_return_sel_rx_ch1              (sclk_return_sel_rx_phy_shared[1]             ),
    .i_sclk_return_sel_rx_ch2              (sclk_return_sel_rx_phy_shared[2]             ),
    .i_sclk_return_sel_rx_ch3              (sclk_return_sel_rx_phy_shared[3]             ),
    .i_sclk_return_sel_tx_ch0              (sclk_return_sel_tx_phy_shared[0]             ),
    .i_sclk_return_sel_tx_ch1              (sclk_return_sel_tx_phy_shared[1]             ),
    .i_sclk_return_sel_tx_ch2              (sclk_return_sel_tx_phy_shared[2]             ),
    .i_sclk_return_sel_tx_ch3              (sclk_return_sel_tx_phy_shared[3]             ),
    .o_sync_cfg_data_ch0                   (sync_cfg_data_phy_shared[0]                  ),
    .o_sync_cfg_data_ch1                   (sync_cfg_data_phy_shared[1]                  ),
    .o_sync_cfg_data_ch2                   (sync_cfg_data_phy_shared[2]                  ),
    .o_sync_cfg_data_ch3                   (sync_cfg_data_phy_shared[3]                  ),
    .o_sync_common_control_ch0             (sync_common_control_phy_shared[0]            ),
    .o_sync_common_control_ch1             (sync_common_control_phy_shared[1]            ),
    .o_sync_common_control_ch2             (sync_common_control_phy_shared[2]            ),
    .o_sync_common_control_ch3             (sync_common_control_phy_shared[3]            ),
    .o_sync_interface_control_ch0          (sync_interface_control_phy_shared[0]         ),
    .o_sync_interface_control_ch1          (sync_interface_control_phy_shared[1]         ),
    .o_sync_interface_control_ch2          (sync_interface_control_phy_shared[2]         ),
    .o_sync_interface_control_ch3          (sync_interface_control_phy_shared[3]         ),
    .iflux_ext_cpu_fast_clk                (                                             ),
    .iflux_pcs_txword_lane0                (tx_data_phy_shared[0]                        ),
    .iflux_pcs_txword_lane1                (tx_data_phy_shared[1]                        ),
    .iflux_pcs_txword_lane2                (tx_data_phy_shared[2]                        ),
    .iflux_pcs_txword_lane3                (tx_data_phy_shared[3]                        ),
    .oflux_pcs_rxword_lane0                (rx_data_phy_shared[0]                        ),
    .oflux_pcs_rxword_lane1                (rx_data_phy_shared[1]                        ),
    .oflux_pcs_rxword_lane2                (rx_data_phy_shared[2]                        ),
    .oflux_pcs_rxword_lane3                (rx_data_phy_shared[3]                        ),
    .iflux_ingress_direct_lane0            (sm_flux_ingress_phy_shared[0]                ),
    .iflux_ingress_direct_lane1            (sm_flux_ingress_phy_shared[1]                ),
    .iflux_ingress_direct_lane2            (sm_flux_ingress_phy_shared[2]                ),
    .iflux_ingress_direct_lane3            (sm_flux_ingress_phy_shared[3]                ),
    .oflux_egress_direct_lane0             (sm_flux_egress_phy_shared[0]                 ),
    .oflux_egress_direct_lane1             (sm_flux_egress_phy_shared[1]                 ),
    .oflux_egress_direct_lane2             (sm_flux_egress_phy_shared[2]                 ),
    .oflux_egress_direct_lane3             (sm_flux_egress_phy_shared[3]                 ),
    .iflux_srds_tx_clk_lane0               (ick_pcs_txword_phy_shared[0]                 ),
    .iflux_srds_tx_clk_lane1               (ick_pcs_txword_phy_shared[1]                 ),
    .iflux_srds_tx_clk_lane2               (ick_pcs_txword_phy_shared[2]                 ),
    .iflux_srds_tx_clk_lane3               (ick_pcs_txword_phy_shared[3]                 ),
    .oflux_cpi_int                         (flux_cpi_int_phy_shared                      ),
    .oflux_int0                            (flux_int_phy_shared[0]                       ),
    .oflux_int1                            (flux_int_phy_shared[1]                       ),
    .oflux_int2                            (flux_int_phy_shared[2]                       ),
    .oflux_int3                            (flux_int_phy_shared[3]                       ),
    .oflux_octl_pcs_txptr_smpl_lane0       (oflux_octl_pcs_txptr_smpl_lane_phy_shared[0] ),
    .oflux_octl_pcs_txptr_smpl_lane1       (oflux_octl_pcs_txptr_smpl_lane_phy_shared[1] ),
    .oflux_octl_pcs_txptr_smpl_lane2       (oflux_octl_pcs_txptr_smpl_lane_phy_shared[2] ),
    .oflux_octl_pcs_txptr_smpl_lane3       (oflux_octl_pcs_txptr_smpl_lane_phy_shared[3] ),
    .iflux_ick_pcs_txptr_smpl_clk_l0_lane0 (ick_sclk_tx_phy_shared[0]                   ),
    .iflux_ick_pcs_txptr_smpl_clk_l0_lane1 (ick_sclk_tx_phy_shared[1]                   ),
    .iflux_ick_pcs_txptr_smpl_clk_l0_lane2 (ick_sclk_tx_phy_shared[2]                   ),
    .iflux_ick_pcs_txptr_smpl_clk_l0_lane3 (ick_sclk_tx_phy_shared[3]                   ),
    .oflux_srds_rdy0                       (flux_srds_rdy_phy_shared[0]                  ),
    .oflux_srds_rdy1                       (flux_srds_rdy_phy_shared[1]                  ),
    .oflux_srds_rdy2                       (flux_srds_rdy_phy_shared[2]                  ),
    .oflux_srds_rdy3                       (flux_srds_rdy_phy_shared[3]                  ),
    .oflux_srds_rx_clk_lane0               (pcs_rxword_phy_shared[0]                     ),
    .oflux_srds_rx_clk_lane1               (pcs_rxword_phy_shared[1]                     ),
    .oflux_srds_rx_clk_lane2               (pcs_rxword_phy_shared[2]                     ),
    .oflux_srds_rx_clk_lane3               (pcs_rxword_phy_shared[3]                     ),
    .oflux_srds_rx_divn_clk_lane0          (pcs_rxpostdiv_phy_shared[0]                  ),
    .oflux_srds_rx_divn_clk_lane1          (pcs_rxpostdiv_phy_shared[1]                  ),
    .oflux_srds_rx_divn_clk_lane2          (pcs_rxpostdiv_phy_shared[2]                  ),
    .oflux_srds_rx_divn_clk_lane3          (pcs_rxpostdiv_phy_shared[3]                  ),
    .oflux_srds_tx_clk_lane0               (ock_pcs_txword_phy_shared[0]                 ),
    .oflux_srds_tx_clk_lane1               (ock_pcs_txword_phy_shared[1]                 ),
    .oflux_srds_tx_clk_lane2               (ock_pcs_txword_phy_shared[2]                 ),
    .oflux_srds_tx_clk_lane3               (ock_pcs_txword_phy_shared[3]                 ),
    .uxwrap_bus_in_lane0                   (uxwrap_bus_in_phy_shared[0]                  ),
    .uxwrap_bus_in_lane1                   (uxwrap_bus_in_phy_shared[1]                  ),
    .uxwrap_bus_in_lane2                   (uxwrap_bus_in_phy_shared[2]                  ),
    .uxwrap_bus_in_lane3                   (uxwrap_bus_in_phy_shared[3]                  ),
    .uxwrap_bus_out_lane0                  (uxwrap_bus_out_phy_shared[0]                 ),
    .uxwrap_bus_out_lane1                  (uxwrap_bus_out_phy_shared[1]                 ),
    .uxwrap_bus_out_lane2                  (uxwrap_bus_out_phy_shared[2]                 ),
    .uxwrap_bus_out_lane3                  (uxwrap_bus_out_phy_shared[3]                 )


); */


//##  hip_sip_boundary_okrywsy
//##  #(
//##    .lane_num                   (num_of_lanes                   )   
//##)
//##hip_sip_boundary_inst(
//##        .i_ss_eth_fec_rx_async           (i_ss_eth_fec_rx_async      ), 
//##        .i_ss_eth_fec_rx_direct          (i_ss_eth_fec_rx_direct     ), 
//##        .o_ss_eth_fec_tx_async           (o_ss_eth_fec_tx_async      ), 
//##        .o_ss_eth_fec_tx_direct          (o_ss_eth_fec_tx_direct     ), 
//##        .i_ss_eth_mac_rx_async           (i_ss_eth_mac_rx_async      ), 
//##        .i_ss_eth_mac_rx_direct          (i_ss_eth_mac_rx_direct     ), 
//##        .o_ss_eth_mac_tx_async           (o_ss_eth_mac_tx_async      ), 
//##        .o_ss_eth_mac_tx_direct          (o_ss_eth_mac_tx_direct     ), 
//##        .i_ss_eth_pcs_rx_async           (i_ss_eth_pcs_rx_async      ), 
//##        .i_ss_eth_pcs_rx_direct          (i_ss_eth_pcs_rx_direct     ), 
//##        .o_ss_eth_pcs_tx_async           (o_ss_eth_pcs_tx_async      ), 
//##        .o_ss_eth_pcs_tx_direct          (o_ss_eth_pcs_tx_direct     ), 
//##        .i_ss_eth_xcvrif_rx_async        (i_ss_eth_xcvrif_rx_async   ), 
//##        .i_ss_eth_xcvrif_rx_direct       (i_ss_eth_xcvrif_rx_direct  ), 
//##        .o_ss_eth_xcvrif_tx_async        (o_ss_eth_xcvrif_tx_async   ), 
//##        .o_ss_eth_xcvrif_tx_direct       (o_ss_eth_xcvrif_tx_direct  ), 
//##        .i_ss_pcie_ctrl_rx_async         (i_ss_pcie_ctrl_rx_async    ), 
//##        .i_ss_pcie_ctrl_rx_direct        (i_ss_pcie_ctrl_rx_direct   ), 
//##        .o_ss_pcie_ctrl_tx_async         (o_ss_pcie_ctrl_tx_async    ), 
//##        .o_ss_pcie_ctrl_tx_direct        (o_ss_pcie_ctrl_tx_direct   ), 
//##        .o_ss_uxquad_async               (o_ss_uxquad_async          ), 
//##        .o_ss_uxquad_async_pcie_mux      (o_ss_uxquad_async_pcie_mux ), 
//##        .i_ss_uxquad_async               (i_ss_uxquad_async          ), 
//##        .i_hio_uxquad_async              (i_hio_uxquad_async         ), 
//##        .i_hio_uxquad_async_pcie_mux     (i_hio_uxquad_async_pcie_mux), 
//##        .o_hio_uxquad_async              (o_hio_uxquad_async         ), 
//##        .i_hio_txdata_async              (i_hio_txdata_async         ), 
//##        .i_hio_txdata_direct             (i_hio_txdata_direct        ), 
//##        .o_hio_rxdata_async              (o_hio_rxdata_async         ), 
//##        .o_hio_rxdata_direct             (o_hio_rxdata_direct        ) 

//);

//KAHUAT_EDIT
//for {set i 0} {4 < 4} {incr i} {
system_intel_pcie_gts_0_pcie_hal_top_pipe_hal_2100_e6uglya #(
    .sris_enable       (sris_enable),
    .pcie_pcs_mode     (pcie_pcs_mode),
    .pclk_clk_hz       (pclk_clk_hz),
    .num_of_lanes      (hal_num_of_lanes_hwtcl)
) pcie_pipe_hal_top (
    .i_ch0_lavmm_pcie_addr                          (i_ch0_lavmm_pcie_addr[16:0]),
    .i_ch0_lavmm_pcie_be                            (i_ch0_lavmm_pcie_be[3:0]),
    .i_ch0_lavmm_pcie_clk                           (i_ch0_lavmm_pcie_clk),
    .i_ch0_lavmm_pcie_read                          (i_ch0_lavmm_pcie_read),
    .i_ch0_lavmm_pcie_rstn                          (i_ch0_lavmm_pcie_rstn),
    .i_ch0_lavmm_pcie_wdata                         (i_ch0_lavmm_pcie_wdata[31:0]),
    .i_ch0_lavmm_pcie_write                         (i_ch0_lavmm_pcie_write),
    .i_ch0_pcie_rxword_clk                          (i_ch0_pcie_rxword_clk),
    .i_ch0_pcie_txword_clk                          (i_ch0_pcie_txword_clk),
    .i_ch0_pcs_pclk                                 (i_ch0_pcs_pclk),
    .i_ch0_pcs_pipe_rstn                            (i_ch0_pcs_pipe_rstn),
    .i_ch0_txpipe_asyncpowerchangeack               (i_ch0_txpipe_asyncpowerchangeack),
    .i_ch0_txpipe_blockaligncontrol                 (i_ch0_txpipe_blockaligncontrol),
    .i_ch0_txpipe_cfg_hw_auto_sp_dis                (i_ch0_txpipe_cfg_hw_auto_sp_dis),
    .i_ch0_txpipe_dirchange                         (i_ch0_txpipe_dirchange),
    .i_ch0_txpipe_ebuf_mode                         (i_ch0_txpipe_ebuf_mode),
    .i_ch0_txpipe_encodedecodebypass                (i_ch0_txpipe_encodedecodebypass),
    .i_ch0_txpipe_fs                                (i_ch0_txpipe_fs[5:0]),
    .i_ch0_txpipe_getlocalpresetcoefficients        (i_ch0_txpipe_getlocalpresetcoefficients),
    .i_ch0_txpipe_invalidrequest                    (i_ch0_txpipe_invalidrequest),
    .i_ch0_txpipe_lf                                (i_ch0_txpipe_lf[5:0]),
    .i_ch0_txpipe_localpresetindex                  (i_ch0_txpipe_localpresetindex[4:0]),
    .i_ch0_txpipe_lowpin_nt                         (i_ch0_txpipe_lowpin_nt),
    .i_ch0_txpipe_m2p_bus                           (i_ch0_txpipe_m2p_bus[7:0]),
    .i_ch0_txpipe_pclk_rate                         (i_ch0_txpipe_pclk_rate[2:0]),
    .i_ch0_txpipe_pclkchangeack                     (i_ch0_txpipe_pclkchangeack),
    .i_ch0_txpipe_phy_mode_nt                       (i_ch0_txpipe_phy_mode_nt[3:0]),
    .i_ch0_txpipe_powerdown                         (i_ch0_txpipe_powerdown[3:0]),
    .i_ch0_txpipe_rate                              (i_ch0_txpipe_rate[2:0]),
    .i_ch0_txpipe_rxelecidle_disable_a              (i_ch0_txpipe_rxelecidle_disable_a),
    .i_ch0_txpipe_rxeqclr                           (i_ch0_txpipe_rxeqclr),
    .i_ch0_txpipe_rxeqeval                          (i_ch0_txpipe_rxeqeval),
    .i_ch0_txpipe_rxeqinprogress                    (i_ch0_txpipe_rxeqinprogress),
    .i_ch0_txpipe_rxeqtraining                      (i_ch0_txpipe_rxeqtraining),
    .i_ch0_txpipe_rxpolarity                        (i_ch0_txpipe_rxpolarity),
    .i_ch0_txpipe_rxpresethint                      (i_ch0_txpipe_rxpresethint[2:0]),
    .i_ch0_txpipe_rxstandby                         (i_ch0_txpipe_rxstandby),
    .i_ch0_txpipe_rxtermination                     (i_ch0_txpipe_rxtermination),
    .i_ch0_txpipe_srisenable                        (i_ch0_txpipe_srisenable),
    .i_ch0_txpipe_txcmnmode_disable_a               (i_ch0_txpipe_txcmnmode_disable_a),
    .i_ch0_txpipe_txcompliance                      (i_ch0_txpipe_txcompliance),
    .i_ch0_txpipe_txdata                            (i_ch0_txpipe_txdata[39:0]),
    .i_ch0_txpipe_txdatak                           (i_ch0_txpipe_txdatak[3:0]),
    .i_ch0_txpipe_txdatavalid                       (i_ch0_txpipe_txdatavalid),
    .i_ch0_txpipe_txdeemph                          (i_ch0_txpipe_txdeemph[17:0]),
    .i_ch0_txpipe_txdtctrx_lb                       (i_ch0_txpipe_txdtctrx_lb),
    .i_ch0_txpipe_txelecidle                        (i_ch0_txpipe_txelecidle),
    .i_ch0_txpipe_txmargin                          (i_ch0_txpipe_txmargin[2:0]),
    .i_ch0_txpipe_txoneszeros                       (i_ch0_txpipe_txoneszeros),
    .i_ch0_txpipe_txstartblock                      (i_ch0_txpipe_txstartblock),
    .i_ch0_txpipe_txswing                           (i_ch0_txpipe_txswing),
    .i_ch0_txpipe_txsyncheader                      (i_ch0_txpipe_txsyncheader[3:0]),
    .i_ch0_txpipe_width                             (i_ch0_txpipe_width[2:0]),
    .i_ch0_uxq_rxcdrlock2dataa                      (i_ch0_uxq_rxcdrlock2dataa),
    .i_ch0_uxq_rxeq_best_eye_vala                   (i_ch0_uxq_rxeq_best_eye_vala[13:0]),
    .i_ch0_uxq_rxeq_donea                           (i_ch0_uxq_rxeq_donea),
    .i_ch0_uxq_rxmargin_nacka                       (i_ch0_uxq_rxmargin_nacka),
    .i_ch0_uxq_rxmargin_status_gray_a               (i_ch0_uxq_rxmargin_status_gray_a[1:0]),
    .i_ch0_uxq_rxmargin_statusa                     (i_ch0_uxq_rxmargin_statusa),
    .i_ch0_uxq_rxsignaldetect_lfpsa                 (i_ch0_uxq_rxsignaldetect_lfpsa),
    .i_ch0_uxq_rxsignaldetecta                      (i_ch0_uxq_rxsignaldetecta),
    .i_ch0_uxq_rxstatusa                            (i_ch0_uxq_rxstatusa),
    .i_ch0_uxq_rxword                               (i_ch0_uxq_rxword[39:0]),
    .i_ch0_uxq_synthlcfast_postdiv                  (i_ch0_uxq_synthlcfast_postdiv),
    .i_ch0_uxq_synthlcmed_postdiv                   (i_ch0_uxq_synthlcmed_postdiv),
    .i_ch0_uxq_synthlcslow_postdiv                  (i_ch0_uxq_synthlcslow_postdiv),
    .i_ch0_uxq_txdetectrx_acka                      (i_ch0_uxq_txdetectrx_acka),
    .i_ch0_uxq_txdetectrx_statct                    (i_ch0_uxq_txdetectrx_statct),
    .i_ch0_uxq_txstatusa                            (i_ch0_uxq_txstatusa),
    .o_ch0_lavmm_pcie_rdata                         (o_ch0_lavmm_pcie_rdata[31:0]),
    .o_ch0_lavmm_pcie_rdata_valid                   (o_ch0_lavmm_pcie_rdata_valid),
    .o_ch0_lavmm_pcie_waitreq                       (o_ch0_lavmm_pcie_waitreq),
    .o_ch0_pcs_pclk                                 (o_ch0_pcs_pclk),
    .o_ch0_pcs_pipe_rstn                            (o_ch0_pcs_pipe_rstn),
    .o_ch0_ux_ock_pma_clk                           (o_ch0_ux_ock_pma_clk),
    .o_ch0_uxq_lfps_ennt                            (o_ch0_uxq_lfps_ennt),
    .o_ch0_uxq_pcie_l1ctrla                         (o_ch0_uxq_pcie_l1ctrla[1:0]),
    .o_ch0_uxq_pma_cmn_ctrl                         (o_ch0_uxq_pma_cmn_ctrl),
    .o_ch0_uxq_pma_ctrl                             (o_ch0_uxq_pma_ctrl),
    .o_ch0_uxq_rst_pcs_rx_b_a                       (o_ch0_uxq_rst_pcs_rx_b_a),
    .o_ch0_uxq_rst_pcs_tx_b_a                       (o_ch0_uxq_rst_pcs_tx_b_a),
    .o_ch0_uxq_rxeiosdetectstata                    (o_ch0_uxq_rxeiosdetectstata),
    .o_ch0_uxq_rxeq_precal_code_selnt               (o_ch0_uxq_rxeq_precal_code_selnt[2:0]),
    .o_ch0_uxq_rxeq_starta                          (o_ch0_uxq_rxeq_starta),
    .o_ch0_uxq_rxeq_static_ena                      (o_ch0_uxq_rxeq_static_ena),
    .o_ch0_uxq_rxmargin_direction_nt                (o_ch0_uxq_rxmargin_direction_nt),
    .o_ch0_uxq_rxmargin_mode_nt                     (o_ch0_uxq_rxmargin_mode_nt),
    .o_ch0_uxq_rxmargin_offset_change_a             (o_ch0_uxq_rxmargin_offset_change_a),
    .o_ch0_uxq_rxmargin_offset_nt                   (o_ch0_uxq_rxmargin_offset_nt[6:0]),
    .o_ch0_uxq_rxmargin_start_a                     (o_ch0_uxq_rxmargin_start_a),
    .o_ch0_uxq_rxpstate                             (o_ch0_uxq_rxpstate[2:0]),
    .o_ch0_uxq_rxrate                               (o_ch0_uxq_rxrate[3:0]),
    .o_ch0_uxq_rxterm_hiz_ena                       (o_ch0_uxq_rxterm_hiz_ena),
    .o_ch0_uxq_rxwidth                              (o_ch0_uxq_rxwidth[2:0]),
    .o_ch0_uxq_tstbus_lane                          (o_ch0_uxq_tstbus_lane),
    .o_ch0_uxq_txbeacona                            (o_ch0_uxq_txbeacona),
    .o_ch0_uxq_txclkdivrate                         (o_ch0_uxq_txclkdivrate[2:0]),
    .o_ch0_uxq_txdetectrx_reqa                      (o_ch0_uxq_txdetectrx_reqa),
    .o_ch0_uxq_txdrv_levn                           (o_ch0_uxq_txdrv_levn[5:0]),
    .o_ch0_uxq_txdrv_levnm1                         (o_ch0_uxq_txdrv_levnm1[4:0]),
    .o_ch0_uxq_txdrv_levnm2                         (o_ch0_uxq_txdrv_levnm2[2:0]),
    .o_ch0_uxq_txdrv_levnp1                         (o_ch0_uxq_txdrv_levnp1[4:0]),
    .o_ch0_uxq_txdrv_slew                           (o_ch0_uxq_txdrv_slew[3:0]),
    .o_ch0_uxq_txelecidle                           (o_ch0_uxq_txelecidle[3:0]),
    .o_ch0_uxq_txpstate                             (o_ch0_uxq_txpstate[2:0]),
    .o_ch0_uxq_txrate                               (o_ch0_uxq_txrate[3:0]),
    .o_ch0_uxq_txwidth                              (o_ch0_uxq_txwidth[2:0]),
//    .o_ch0_uxq_txword                               (o_ch0_uxq_txword[39:0])
    .i_ch1_lavmm_pcie_addr                          (i_ch1_lavmm_pcie_addr[16:0]),
    .i_ch1_lavmm_pcie_be                            (i_ch1_lavmm_pcie_be[3:0]),
    .i_ch1_lavmm_pcie_clk                           (i_ch1_lavmm_pcie_clk),
    .i_ch1_lavmm_pcie_read                          (i_ch1_lavmm_pcie_read),
    .i_ch1_lavmm_pcie_rstn                          (i_ch1_lavmm_pcie_rstn),
    .i_ch1_lavmm_pcie_wdata                         (i_ch1_lavmm_pcie_wdata[31:0]),
    .i_ch1_lavmm_pcie_write                         (i_ch1_lavmm_pcie_write),
    .i_ch1_pcie_rxword_clk                          (i_ch1_pcie_rxword_clk),
    .i_ch1_pcie_txword_clk                          (i_ch1_pcie_txword_clk),
    .i_ch1_pcs_pclk                                 (i_ch1_pcs_pclk),
    .i_ch1_pcs_pipe_rstn                            (i_ch1_pcs_pipe_rstn),
    .i_ch1_txpipe_asyncpowerchangeack               (i_ch1_txpipe_asyncpowerchangeack),
    .i_ch1_txpipe_blockaligncontrol                 (i_ch1_txpipe_blockaligncontrol),
    .i_ch1_txpipe_cfg_hw_auto_sp_dis                (i_ch1_txpipe_cfg_hw_auto_sp_dis),
    .i_ch1_txpipe_dirchange                         (i_ch1_txpipe_dirchange),
    .i_ch1_txpipe_ebuf_mode                         (i_ch1_txpipe_ebuf_mode),
    .i_ch1_txpipe_encodedecodebypass                (i_ch1_txpipe_encodedecodebypass),
    .i_ch1_txpipe_fs                                (i_ch1_txpipe_fs[5:0]),
    .i_ch1_txpipe_getlocalpresetcoefficients        (i_ch1_txpipe_getlocalpresetcoefficients),
    .i_ch1_txpipe_invalidrequest                    (i_ch1_txpipe_invalidrequest),
    .i_ch1_txpipe_lf                                (i_ch1_txpipe_lf[5:0]),
    .i_ch1_txpipe_localpresetindex                  (i_ch1_txpipe_localpresetindex[4:0]),
    .i_ch1_txpipe_lowpin_nt                         (i_ch1_txpipe_lowpin_nt),
    .i_ch1_txpipe_m2p_bus                           (i_ch1_txpipe_m2p_bus[7:0]),
    .i_ch1_txpipe_pclk_rate                         (i_ch1_txpipe_pclk_rate[2:0]),
    .i_ch1_txpipe_pclkchangeack                     (i_ch1_txpipe_pclkchangeack),
    .i_ch1_txpipe_phy_mode_nt                       (i_ch1_txpipe_phy_mode_nt[3:0]),
    .i_ch1_txpipe_powerdown                         (i_ch1_txpipe_powerdown[3:0]),
    .i_ch1_txpipe_rate                              (i_ch1_txpipe_rate[2:0]),
    .i_ch1_txpipe_rxelecidle_disable_a              (i_ch1_txpipe_rxelecidle_disable_a),
    .i_ch1_txpipe_rxeqclr                           (i_ch1_txpipe_rxeqclr),
    .i_ch1_txpipe_rxeqeval                          (i_ch1_txpipe_rxeqeval),
    .i_ch1_txpipe_rxeqinprogress                    (i_ch1_txpipe_rxeqinprogress),
    .i_ch1_txpipe_rxeqtraining                      (i_ch1_txpipe_rxeqtraining),
    .i_ch1_txpipe_rxpolarity                        (i_ch1_txpipe_rxpolarity),
    .i_ch1_txpipe_rxpresethint                      (i_ch1_txpipe_rxpresethint[2:0]),
    .i_ch1_txpipe_rxstandby                         (i_ch1_txpipe_rxstandby),
    .i_ch1_txpipe_rxtermination                     (i_ch1_txpipe_rxtermination),
    .i_ch1_txpipe_srisenable                        (i_ch1_txpipe_srisenable),
    .i_ch1_txpipe_txcmnmode_disable_a               (i_ch1_txpipe_txcmnmode_disable_a),
    .i_ch1_txpipe_txcompliance                      (i_ch1_txpipe_txcompliance),
    .i_ch1_txpipe_txdata                            (i_ch1_txpipe_txdata[39:0]),
    .i_ch1_txpipe_txdatak                           (i_ch1_txpipe_txdatak[3:0]),
    .i_ch1_txpipe_txdatavalid                       (i_ch1_txpipe_txdatavalid),
    .i_ch1_txpipe_txdeemph                          (i_ch1_txpipe_txdeemph[17:0]),
    .i_ch1_txpipe_txdtctrx_lb                       (i_ch1_txpipe_txdtctrx_lb),
    .i_ch1_txpipe_txelecidle                        (i_ch1_txpipe_txelecidle),
    .i_ch1_txpipe_txmargin                          (i_ch1_txpipe_txmargin[2:0]),
    .i_ch1_txpipe_txoneszeros                       (i_ch1_txpipe_txoneszeros),
    .i_ch1_txpipe_txstartblock                      (i_ch1_txpipe_txstartblock),
    .i_ch1_txpipe_txswing                           (i_ch1_txpipe_txswing),
    .i_ch1_txpipe_txsyncheader                      (i_ch1_txpipe_txsyncheader[3:0]),
    .i_ch1_txpipe_width                             (i_ch1_txpipe_width[2:0]),
    .i_ch1_uxq_rxcdrlock2dataa                      (i_ch1_uxq_rxcdrlock2dataa),
    .i_ch1_uxq_rxeq_best_eye_vala                   (i_ch1_uxq_rxeq_best_eye_vala[13:0]),
    .i_ch1_uxq_rxeq_donea                           (i_ch1_uxq_rxeq_donea),
    .i_ch1_uxq_rxmargin_nacka                       (i_ch1_uxq_rxmargin_nacka),
    .i_ch1_uxq_rxmargin_status_gray_a               (i_ch1_uxq_rxmargin_status_gray_a[1:0]),
    .i_ch1_uxq_rxmargin_statusa                     (i_ch1_uxq_rxmargin_statusa),
    .i_ch1_uxq_rxsignaldetect_lfpsa                 (i_ch1_uxq_rxsignaldetect_lfpsa),
    .i_ch1_uxq_rxsignaldetecta                      (i_ch1_uxq_rxsignaldetecta),
    .i_ch1_uxq_rxstatusa                            (i_ch1_uxq_rxstatusa),
    .i_ch1_uxq_rxword                               (i_ch1_uxq_rxword[39:0]),
    .i_ch1_uxq_synthlcfast_postdiv                  (i_ch1_uxq_synthlcfast_postdiv),
    .i_ch1_uxq_synthlcmed_postdiv                   (i_ch1_uxq_synthlcmed_postdiv),
    .i_ch1_uxq_synthlcslow_postdiv                  (i_ch1_uxq_synthlcslow_postdiv),
    .i_ch1_uxq_txdetectrx_acka                      (i_ch1_uxq_txdetectrx_acka),
    .i_ch1_uxq_txdetectrx_statct                    (i_ch1_uxq_txdetectrx_statct),
    .i_ch1_uxq_txstatusa                            (i_ch1_uxq_txstatusa),
    .o_ch1_lavmm_pcie_rdata                         (o_ch1_lavmm_pcie_rdata[31:0]),
    .o_ch1_lavmm_pcie_rdata_valid                   (o_ch1_lavmm_pcie_rdata_valid),
    .o_ch1_lavmm_pcie_waitreq                       (o_ch1_lavmm_pcie_waitreq),
    .o_ch1_pcs_pclk                                 (o_ch1_pcs_pclk),
    .o_ch1_pcs_pipe_rstn                            (o_ch1_pcs_pipe_rstn),
    .o_ch1_ux_ock_pma_clk                           (o_ch1_ux_ock_pma_clk),
    .o_ch1_uxq_lfps_ennt                            (o_ch1_uxq_lfps_ennt),
    .o_ch1_uxq_pcie_l1ctrla                         (o_ch1_uxq_pcie_l1ctrla[1:0]),
    .o_ch1_uxq_pma_cmn_ctrl                         (o_ch1_uxq_pma_cmn_ctrl),
    .o_ch1_uxq_pma_ctrl                             (o_ch1_uxq_pma_ctrl),
    .o_ch1_uxq_rst_pcs_rx_b_a                       (o_ch1_uxq_rst_pcs_rx_b_a),
    .o_ch1_uxq_rst_pcs_tx_b_a                       (o_ch1_uxq_rst_pcs_tx_b_a),
    .o_ch1_uxq_rxeiosdetectstata                    (o_ch1_uxq_rxeiosdetectstata),
    .o_ch1_uxq_rxeq_precal_code_selnt               (o_ch1_uxq_rxeq_precal_code_selnt[2:0]),
    .o_ch1_uxq_rxeq_starta                          (o_ch1_uxq_rxeq_starta),
    .o_ch1_uxq_rxeq_static_ena                      (o_ch1_uxq_rxeq_static_ena),
    .o_ch1_uxq_rxmargin_direction_nt                (o_ch1_uxq_rxmargin_direction_nt),
    .o_ch1_uxq_rxmargin_mode_nt                     (o_ch1_uxq_rxmargin_mode_nt),
    .o_ch1_uxq_rxmargin_offset_change_a             (o_ch1_uxq_rxmargin_offset_change_a),
    .o_ch1_uxq_rxmargin_offset_nt                   (o_ch1_uxq_rxmargin_offset_nt[6:0]),
    .o_ch1_uxq_rxmargin_start_a                     (o_ch1_uxq_rxmargin_start_a),
    .o_ch1_uxq_rxpstate                             (o_ch1_uxq_rxpstate[2:0]),
    .o_ch1_uxq_rxrate                               (o_ch1_uxq_rxrate[3:0]),
    .o_ch1_uxq_rxterm_hiz_ena                       (o_ch1_uxq_rxterm_hiz_ena),
    .o_ch1_uxq_rxwidth                              (o_ch1_uxq_rxwidth[2:0]),
    .o_ch1_uxq_tstbus_lane                          (o_ch1_uxq_tstbus_lane),
    .o_ch1_uxq_txbeacona                            (o_ch1_uxq_txbeacona),
    .o_ch1_uxq_txclkdivrate                         (o_ch1_uxq_txclkdivrate[2:0]),
    .o_ch1_uxq_txdetectrx_reqa                      (o_ch1_uxq_txdetectrx_reqa),
    .o_ch1_uxq_txdrv_levn                           (o_ch1_uxq_txdrv_levn[5:0]),
    .o_ch1_uxq_txdrv_levnm1                         (o_ch1_uxq_txdrv_levnm1[4:0]),
    .o_ch1_uxq_txdrv_levnm2                         (o_ch1_uxq_txdrv_levnm2[2:0]),
    .o_ch1_uxq_txdrv_levnp1                         (o_ch1_uxq_txdrv_levnp1[4:0]),
    .o_ch1_uxq_txdrv_slew                           (o_ch1_uxq_txdrv_slew[3:0]),
    .o_ch1_uxq_txelecidle                           (o_ch1_uxq_txelecidle[3:0]),
    .o_ch1_uxq_txpstate                             (o_ch1_uxq_txpstate[2:0]),
    .o_ch1_uxq_txrate                               (o_ch1_uxq_txrate[3:0]),
    .o_ch1_uxq_txwidth                              (o_ch1_uxq_txwidth[2:0]),
//    .o_ch1_uxq_txword                               (o_ch1_uxq_txword[39:0])
    .i_ch2_lavmm_pcie_addr                          (i_ch2_lavmm_pcie_addr[16:0]),
    .i_ch2_lavmm_pcie_be                            (i_ch2_lavmm_pcie_be[3:0]),
    .i_ch2_lavmm_pcie_clk                           (i_ch2_lavmm_pcie_clk),
    .i_ch2_lavmm_pcie_read                          (i_ch2_lavmm_pcie_read),
    .i_ch2_lavmm_pcie_rstn                          (i_ch2_lavmm_pcie_rstn),
    .i_ch2_lavmm_pcie_wdata                         (i_ch2_lavmm_pcie_wdata[31:0]),
    .i_ch2_lavmm_pcie_write                         (i_ch2_lavmm_pcie_write),
    .i_ch2_pcie_rxword_clk                          (i_ch2_pcie_rxword_clk),
    .i_ch2_pcie_txword_clk                          (i_ch2_pcie_txword_clk),
    .i_ch2_pcs_pclk                                 (i_ch2_pcs_pclk),
    .i_ch2_pcs_pipe_rstn                            (i_ch2_pcs_pipe_rstn),
    .i_ch2_txpipe_asyncpowerchangeack               (i_ch2_txpipe_asyncpowerchangeack),
    .i_ch2_txpipe_blockaligncontrol                 (i_ch2_txpipe_blockaligncontrol),
    .i_ch2_txpipe_cfg_hw_auto_sp_dis                (i_ch2_txpipe_cfg_hw_auto_sp_dis),
    .i_ch2_txpipe_dirchange                         (i_ch2_txpipe_dirchange),
    .i_ch2_txpipe_ebuf_mode                         (i_ch2_txpipe_ebuf_mode),
    .i_ch2_txpipe_encodedecodebypass                (i_ch2_txpipe_encodedecodebypass),
    .i_ch2_txpipe_fs                                (i_ch2_txpipe_fs[5:0]),
    .i_ch2_txpipe_getlocalpresetcoefficients        (i_ch2_txpipe_getlocalpresetcoefficients),
    .i_ch2_txpipe_invalidrequest                    (i_ch2_txpipe_invalidrequest),
    .i_ch2_txpipe_lf                                (i_ch2_txpipe_lf[5:0]),
    .i_ch2_txpipe_localpresetindex                  (i_ch2_txpipe_localpresetindex[4:0]),
    .i_ch2_txpipe_lowpin_nt                         (i_ch2_txpipe_lowpin_nt),
    .i_ch2_txpipe_m2p_bus                           (i_ch2_txpipe_m2p_bus[7:0]),
    .i_ch2_txpipe_pclk_rate                         (i_ch2_txpipe_pclk_rate[2:0]),
    .i_ch2_txpipe_pclkchangeack                     (i_ch2_txpipe_pclkchangeack),
    .i_ch2_txpipe_phy_mode_nt                       (i_ch2_txpipe_phy_mode_nt[3:0]),
    .i_ch2_txpipe_powerdown                         (i_ch2_txpipe_powerdown[3:0]),
    .i_ch2_txpipe_rate                              (i_ch2_txpipe_rate[2:0]),
    .i_ch2_txpipe_rxelecidle_disable_a              (i_ch2_txpipe_rxelecidle_disable_a),
    .i_ch2_txpipe_rxeqclr                           (i_ch2_txpipe_rxeqclr),
    .i_ch2_txpipe_rxeqeval                          (i_ch2_txpipe_rxeqeval),
    .i_ch2_txpipe_rxeqinprogress                    (i_ch2_txpipe_rxeqinprogress),
    .i_ch2_txpipe_rxeqtraining                      (i_ch2_txpipe_rxeqtraining),
    .i_ch2_txpipe_rxpolarity                        (i_ch2_txpipe_rxpolarity),
    .i_ch2_txpipe_rxpresethint                      (i_ch2_txpipe_rxpresethint[2:0]),
    .i_ch2_txpipe_rxstandby                         (i_ch2_txpipe_rxstandby),
    .i_ch2_txpipe_rxtermination                     (i_ch2_txpipe_rxtermination),
    .i_ch2_txpipe_srisenable                        (i_ch2_txpipe_srisenable),
    .i_ch2_txpipe_txcmnmode_disable_a               (i_ch2_txpipe_txcmnmode_disable_a),
    .i_ch2_txpipe_txcompliance                      (i_ch2_txpipe_txcompliance),
    .i_ch2_txpipe_txdata                            (i_ch2_txpipe_txdata[39:0]),
    .i_ch2_txpipe_txdatak                           (i_ch2_txpipe_txdatak[3:0]),
    .i_ch2_txpipe_txdatavalid                       (i_ch2_txpipe_txdatavalid),
    .i_ch2_txpipe_txdeemph                          (i_ch2_txpipe_txdeemph[17:0]),
    .i_ch2_txpipe_txdtctrx_lb                       (i_ch2_txpipe_txdtctrx_lb),
    .i_ch2_txpipe_txelecidle                        (i_ch2_txpipe_txelecidle),
    .i_ch2_txpipe_txmargin                          (i_ch2_txpipe_txmargin[2:0]),
    .i_ch2_txpipe_txoneszeros                       (i_ch2_txpipe_txoneszeros),
    .i_ch2_txpipe_txstartblock                      (i_ch2_txpipe_txstartblock),
    .i_ch2_txpipe_txswing                           (i_ch2_txpipe_txswing),
    .i_ch2_txpipe_txsyncheader                      (i_ch2_txpipe_txsyncheader[3:0]),
    .i_ch2_txpipe_width                             (i_ch2_txpipe_width[2:0]),
    .i_ch2_uxq_rxcdrlock2dataa                      (i_ch2_uxq_rxcdrlock2dataa),
    .i_ch2_uxq_rxeq_best_eye_vala                   (i_ch2_uxq_rxeq_best_eye_vala[13:0]),
    .i_ch2_uxq_rxeq_donea                           (i_ch2_uxq_rxeq_donea),
    .i_ch2_uxq_rxmargin_nacka                       (i_ch2_uxq_rxmargin_nacka),
    .i_ch2_uxq_rxmargin_status_gray_a               (i_ch2_uxq_rxmargin_status_gray_a[1:0]),
    .i_ch2_uxq_rxmargin_statusa                     (i_ch2_uxq_rxmargin_statusa),
    .i_ch2_uxq_rxsignaldetect_lfpsa                 (i_ch2_uxq_rxsignaldetect_lfpsa),
    .i_ch2_uxq_rxsignaldetecta                      (i_ch2_uxq_rxsignaldetecta),
    .i_ch2_uxq_rxstatusa                            (i_ch2_uxq_rxstatusa),
    .i_ch2_uxq_rxword                               (i_ch2_uxq_rxword[39:0]),
    .i_ch2_uxq_synthlcfast_postdiv                  (i_ch2_uxq_synthlcfast_postdiv),
    .i_ch2_uxq_synthlcmed_postdiv                   (i_ch2_uxq_synthlcmed_postdiv),
    .i_ch2_uxq_synthlcslow_postdiv                  (i_ch2_uxq_synthlcslow_postdiv),
    .i_ch2_uxq_txdetectrx_acka                      (i_ch2_uxq_txdetectrx_acka),
    .i_ch2_uxq_txdetectrx_statct                    (i_ch2_uxq_txdetectrx_statct),
    .i_ch2_uxq_txstatusa                            (i_ch2_uxq_txstatusa),
    .o_ch2_lavmm_pcie_rdata                         (o_ch2_lavmm_pcie_rdata[31:0]),
    .o_ch2_lavmm_pcie_rdata_valid                   (o_ch2_lavmm_pcie_rdata_valid),
    .o_ch2_lavmm_pcie_waitreq                       (o_ch2_lavmm_pcie_waitreq),
    .o_ch2_pcs_pclk                                 (o_ch2_pcs_pclk),
    .o_ch2_pcs_pipe_rstn                            (o_ch2_pcs_pipe_rstn),
    .o_ch2_ux_ock_pma_clk                           (o_ch2_ux_ock_pma_clk),
    .o_ch2_uxq_lfps_ennt                            (o_ch2_uxq_lfps_ennt),
    .o_ch2_uxq_pcie_l1ctrla                         (o_ch2_uxq_pcie_l1ctrla[1:0]),
    .o_ch2_uxq_pma_cmn_ctrl                         (o_ch2_uxq_pma_cmn_ctrl),
    .o_ch2_uxq_pma_ctrl                             (o_ch2_uxq_pma_ctrl),
    .o_ch2_uxq_rst_pcs_rx_b_a                       (o_ch2_uxq_rst_pcs_rx_b_a),
    .o_ch2_uxq_rst_pcs_tx_b_a                       (o_ch2_uxq_rst_pcs_tx_b_a),
    .o_ch2_uxq_rxeiosdetectstata                    (o_ch2_uxq_rxeiosdetectstata),
    .o_ch2_uxq_rxeq_precal_code_selnt               (o_ch2_uxq_rxeq_precal_code_selnt[2:0]),
    .o_ch2_uxq_rxeq_starta                          (o_ch2_uxq_rxeq_starta),
    .o_ch2_uxq_rxeq_static_ena                      (o_ch2_uxq_rxeq_static_ena),
    .o_ch2_uxq_rxmargin_direction_nt                (o_ch2_uxq_rxmargin_direction_nt),
    .o_ch2_uxq_rxmargin_mode_nt                     (o_ch2_uxq_rxmargin_mode_nt),
    .o_ch2_uxq_rxmargin_offset_change_a             (o_ch2_uxq_rxmargin_offset_change_a),
    .o_ch2_uxq_rxmargin_offset_nt                   (o_ch2_uxq_rxmargin_offset_nt[6:0]),
    .o_ch2_uxq_rxmargin_start_a                     (o_ch2_uxq_rxmargin_start_a),
    .o_ch2_uxq_rxpstate                             (o_ch2_uxq_rxpstate[2:0]),
    .o_ch2_uxq_rxrate                               (o_ch2_uxq_rxrate[3:0]),
    .o_ch2_uxq_rxterm_hiz_ena                       (o_ch2_uxq_rxterm_hiz_ena),
    .o_ch2_uxq_rxwidth                              (o_ch2_uxq_rxwidth[2:0]),
    .o_ch2_uxq_tstbus_lane                          (o_ch2_uxq_tstbus_lane),
    .o_ch2_uxq_txbeacona                            (o_ch2_uxq_txbeacona),
    .o_ch2_uxq_txclkdivrate                         (o_ch2_uxq_txclkdivrate[2:0]),
    .o_ch2_uxq_txdetectrx_reqa                      (o_ch2_uxq_txdetectrx_reqa),
    .o_ch2_uxq_txdrv_levn                           (o_ch2_uxq_txdrv_levn[5:0]),
    .o_ch2_uxq_txdrv_levnm1                         (o_ch2_uxq_txdrv_levnm1[4:0]),
    .o_ch2_uxq_txdrv_levnm2                         (o_ch2_uxq_txdrv_levnm2[2:0]),
    .o_ch2_uxq_txdrv_levnp1                         (o_ch2_uxq_txdrv_levnp1[4:0]),
    .o_ch2_uxq_txdrv_slew                           (o_ch2_uxq_txdrv_slew[3:0]),
    .o_ch2_uxq_txelecidle                           (o_ch2_uxq_txelecidle[3:0]),
    .o_ch2_uxq_txpstate                             (o_ch2_uxq_txpstate[2:0]),
    .o_ch2_uxq_txrate                               (o_ch2_uxq_txrate[3:0]),
    .o_ch2_uxq_txwidth                              (o_ch2_uxq_txwidth[2:0]),
//    .o_ch2_uxq_txword                               (o_ch2_uxq_txword[39:0])
    .i_ch3_lavmm_pcie_addr                          (i_ch3_lavmm_pcie_addr[16:0]),
    .i_ch3_lavmm_pcie_be                            (i_ch3_lavmm_pcie_be[3:0]),
    .i_ch3_lavmm_pcie_clk                           (i_ch3_lavmm_pcie_clk),
    .i_ch3_lavmm_pcie_read                          (i_ch3_lavmm_pcie_read),
    .i_ch3_lavmm_pcie_rstn                          (i_ch3_lavmm_pcie_rstn),
    .i_ch3_lavmm_pcie_wdata                         (i_ch3_lavmm_pcie_wdata[31:0]),
    .i_ch3_lavmm_pcie_write                         (i_ch3_lavmm_pcie_write),
    .i_ch3_pcie_rxword_clk                          (i_ch3_pcie_rxword_clk),
    .i_ch3_pcie_txword_clk                          (i_ch3_pcie_txword_clk),
    .i_ch3_pcs_pclk                                 (i_ch3_pcs_pclk),
    .i_ch3_pcs_pipe_rstn                            (i_ch3_pcs_pipe_rstn),
    .i_ch3_txpipe_asyncpowerchangeack               (i_ch3_txpipe_asyncpowerchangeack),
    .i_ch3_txpipe_blockaligncontrol                 (i_ch3_txpipe_blockaligncontrol),
    .i_ch3_txpipe_cfg_hw_auto_sp_dis                (i_ch3_txpipe_cfg_hw_auto_sp_dis),
    .i_ch3_txpipe_dirchange                         (i_ch3_txpipe_dirchange),
    .i_ch3_txpipe_ebuf_mode                         (i_ch3_txpipe_ebuf_mode),
    .i_ch3_txpipe_encodedecodebypass                (i_ch3_txpipe_encodedecodebypass),
    .i_ch3_txpipe_fs                                (i_ch3_txpipe_fs[5:0]),
    .i_ch3_txpipe_getlocalpresetcoefficients        (i_ch3_txpipe_getlocalpresetcoefficients),
    .i_ch3_txpipe_invalidrequest                    (i_ch3_txpipe_invalidrequest),
    .i_ch3_txpipe_lf                                (i_ch3_txpipe_lf[5:0]),
    .i_ch3_txpipe_localpresetindex                  (i_ch3_txpipe_localpresetindex[4:0]),
    .i_ch3_txpipe_lowpin_nt                         (i_ch3_txpipe_lowpin_nt),
    .i_ch3_txpipe_m2p_bus                           (i_ch3_txpipe_m2p_bus[7:0]),
    .i_ch3_txpipe_pclk_rate                         (i_ch3_txpipe_pclk_rate[2:0]),
    .i_ch3_txpipe_pclkchangeack                     (i_ch3_txpipe_pclkchangeack),
    .i_ch3_txpipe_phy_mode_nt                       (i_ch3_txpipe_phy_mode_nt[3:0]),
    .i_ch3_txpipe_powerdown                         (i_ch3_txpipe_powerdown[3:0]),
    .i_ch3_txpipe_rate                              (i_ch3_txpipe_rate[2:0]),
    .i_ch3_txpipe_rxelecidle_disable_a              (i_ch3_txpipe_rxelecidle_disable_a),
    .i_ch3_txpipe_rxeqclr                           (i_ch3_txpipe_rxeqclr),
    .i_ch3_txpipe_rxeqeval                          (i_ch3_txpipe_rxeqeval),
    .i_ch3_txpipe_rxeqinprogress                    (i_ch3_txpipe_rxeqinprogress),
    .i_ch3_txpipe_rxeqtraining                      (i_ch3_txpipe_rxeqtraining),
    .i_ch3_txpipe_rxpolarity                        (i_ch3_txpipe_rxpolarity),
    .i_ch3_txpipe_rxpresethint                      (i_ch3_txpipe_rxpresethint[2:0]),
    .i_ch3_txpipe_rxstandby                         (i_ch3_txpipe_rxstandby),
    .i_ch3_txpipe_rxtermination                     (i_ch3_txpipe_rxtermination),
    .i_ch3_txpipe_srisenable                        (i_ch3_txpipe_srisenable),
    .i_ch3_txpipe_txcmnmode_disable_a               (i_ch3_txpipe_txcmnmode_disable_a),
    .i_ch3_txpipe_txcompliance                      (i_ch3_txpipe_txcompliance),
    .i_ch3_txpipe_txdata                            (i_ch3_txpipe_txdata[39:0]),
    .i_ch3_txpipe_txdatak                           (i_ch3_txpipe_txdatak[3:0]),
    .i_ch3_txpipe_txdatavalid                       (i_ch3_txpipe_txdatavalid),
    .i_ch3_txpipe_txdeemph                          (i_ch3_txpipe_txdeemph[17:0]),
    .i_ch3_txpipe_txdtctrx_lb                       (i_ch3_txpipe_txdtctrx_lb),
    .i_ch3_txpipe_txelecidle                        (i_ch3_txpipe_txelecidle),
    .i_ch3_txpipe_txmargin                          (i_ch3_txpipe_txmargin[2:0]),
    .i_ch3_txpipe_txoneszeros                       (i_ch3_txpipe_txoneszeros),
    .i_ch3_txpipe_txstartblock                      (i_ch3_txpipe_txstartblock),
    .i_ch3_txpipe_txswing                           (i_ch3_txpipe_txswing),
    .i_ch3_txpipe_txsyncheader                      (i_ch3_txpipe_txsyncheader[3:0]),
    .i_ch3_txpipe_width                             (i_ch3_txpipe_width[2:0]),
    .i_ch3_uxq_rxcdrlock2dataa                      (i_ch3_uxq_rxcdrlock2dataa),
    .i_ch3_uxq_rxeq_best_eye_vala                   (i_ch3_uxq_rxeq_best_eye_vala[13:0]),
    .i_ch3_uxq_rxeq_donea                           (i_ch3_uxq_rxeq_donea),
    .i_ch3_uxq_rxmargin_nacka                       (i_ch3_uxq_rxmargin_nacka),
    .i_ch3_uxq_rxmargin_status_gray_a               (i_ch3_uxq_rxmargin_status_gray_a[1:0]),
    .i_ch3_uxq_rxmargin_statusa                     (i_ch3_uxq_rxmargin_statusa),
    .i_ch3_uxq_rxsignaldetect_lfpsa                 (i_ch3_uxq_rxsignaldetect_lfpsa),
    .i_ch3_uxq_rxsignaldetecta                      (i_ch3_uxq_rxsignaldetecta),
    .i_ch3_uxq_rxstatusa                            (i_ch3_uxq_rxstatusa),
    .i_ch3_uxq_rxword                               (i_ch3_uxq_rxword[39:0]),
    .i_ch3_uxq_synthlcfast_postdiv                  (i_ch3_uxq_synthlcfast_postdiv),
    .i_ch3_uxq_synthlcmed_postdiv                   (i_ch3_uxq_synthlcmed_postdiv),
    .i_ch3_uxq_synthlcslow_postdiv                  (i_ch3_uxq_synthlcslow_postdiv),
    .i_ch3_uxq_txdetectrx_acka                      (i_ch3_uxq_txdetectrx_acka),
    .i_ch3_uxq_txdetectrx_statct                    (i_ch3_uxq_txdetectrx_statct),
    .i_ch3_uxq_txstatusa                            (i_ch3_uxq_txstatusa),
    .o_ch3_lavmm_pcie_rdata                         (o_ch3_lavmm_pcie_rdata[31:0]),
    .o_ch3_lavmm_pcie_rdata_valid                   (o_ch3_lavmm_pcie_rdata_valid),
    .o_ch3_lavmm_pcie_waitreq                       (o_ch3_lavmm_pcie_waitreq),
    .o_ch3_pcs_pclk                                 (o_ch3_pcs_pclk),
    .o_ch3_pcs_pipe_rstn                            (o_ch3_pcs_pipe_rstn),
    .o_ch3_ux_ock_pma_clk                           (o_ch3_ux_ock_pma_clk),
    .o_ch3_uxq_lfps_ennt                            (o_ch3_uxq_lfps_ennt),
    .o_ch3_uxq_pcie_l1ctrla                         (o_ch3_uxq_pcie_l1ctrla[1:0]),
    .o_ch3_uxq_pma_cmn_ctrl                         (o_ch3_uxq_pma_cmn_ctrl),
    .o_ch3_uxq_pma_ctrl                             (o_ch3_uxq_pma_ctrl),
    .o_ch3_uxq_rst_pcs_rx_b_a                       (o_ch3_uxq_rst_pcs_rx_b_a),
    .o_ch3_uxq_rst_pcs_tx_b_a                       (o_ch3_uxq_rst_pcs_tx_b_a),
    .o_ch3_uxq_rxeiosdetectstata                    (o_ch3_uxq_rxeiosdetectstata),
    .o_ch3_uxq_rxeq_precal_code_selnt               (o_ch3_uxq_rxeq_precal_code_selnt[2:0]),
    .o_ch3_uxq_rxeq_starta                          (o_ch3_uxq_rxeq_starta),
    .o_ch3_uxq_rxeq_static_ena                      (o_ch3_uxq_rxeq_static_ena),
    .o_ch3_uxq_rxmargin_direction_nt                (o_ch3_uxq_rxmargin_direction_nt),
    .o_ch3_uxq_rxmargin_mode_nt                     (o_ch3_uxq_rxmargin_mode_nt),
    .o_ch3_uxq_rxmargin_offset_change_a             (o_ch3_uxq_rxmargin_offset_change_a),
    .o_ch3_uxq_rxmargin_offset_nt                   (o_ch3_uxq_rxmargin_offset_nt[6:0]),
    .o_ch3_uxq_rxmargin_start_a                     (o_ch3_uxq_rxmargin_start_a),
    .o_ch3_uxq_rxpstate                             (o_ch3_uxq_rxpstate[2:0]),
    .o_ch3_uxq_rxrate                               (o_ch3_uxq_rxrate[3:0]),
    .o_ch3_uxq_rxterm_hiz_ena                       (o_ch3_uxq_rxterm_hiz_ena),
    .o_ch3_uxq_rxwidth                              (o_ch3_uxq_rxwidth[2:0]),
    .o_ch3_uxq_tstbus_lane                          (o_ch3_uxq_tstbus_lane),
    .o_ch3_uxq_txbeacona                            (o_ch3_uxq_txbeacona),
    .o_ch3_uxq_txclkdivrate                         (o_ch3_uxq_txclkdivrate[2:0]),
    .o_ch3_uxq_txdetectrx_reqa                      (o_ch3_uxq_txdetectrx_reqa),
    .o_ch3_uxq_txdrv_levn                           (o_ch3_uxq_txdrv_levn[5:0]),
    .o_ch3_uxq_txdrv_levnm1                         (o_ch3_uxq_txdrv_levnm1[4:0]),
    .o_ch3_uxq_txdrv_levnm2                         (o_ch3_uxq_txdrv_levnm2[2:0]),
    .o_ch3_uxq_txdrv_levnp1                         (o_ch3_uxq_txdrv_levnp1[4:0]),
    .o_ch3_uxq_txdrv_slew                           (o_ch3_uxq_txdrv_slew[3:0]),
    .o_ch3_uxq_txelecidle                           (o_ch3_uxq_txelecidle[3:0]),
    .o_ch3_uxq_txpstate                             (o_ch3_uxq_txpstate[2:0]),
    .o_ch3_uxq_txrate                               (o_ch3_uxq_txrate[3:0]),
    .o_ch3_uxq_txwidth                              (o_ch3_uxq_txwidth[2:0]),
//    .o_ch3_uxq_txword                               (o_ch3_uxq_txword[39:0])
    .o_ch0_rxpipe_dirfeedback                          (o_ch0_rxpipe_dirfeedback),
    .o_ch0_rxpipe_linkevaluationfeedbackfiguremerit    (o_ch0_rxpipe_linkevaluationfeedbackfiguremerit),
    .o_ch0_rxpipe_localfs                              (o_ch0_rxpipe_localfs),
    .o_ch0_rxpipe_locallf                              (o_ch0_rxpipe_locallf),
    .o_ch0_rxpipe_localtxcoefficientsvalid             (o_ch0_rxpipe_localtxcoefficientsvalid),
    .o_ch0_rxpipe_localtxpresetcoefficients            (o_ch0_rxpipe_localtxpresetcoefficients),
    .o_ch0_rxpipe_p2m_bus                              (o_ch0_rxpipe_p2m_bus),
    .o_ch0_rxpipe_pclkchangeok                         (o_ch0_rxpipe_pclkchangeok),
    .o_ch0_rxpipe_phystatus                            (o_ch0_rxpipe_phystatus),	
    .o_ch0_rxpipe_rxdata                               (o_ch0_rxpipe_rxdata),
    .o_ch0_rxpipe_rxdatak                              (o_ch0_rxpipe_rxdatak),
    .o_ch0_rxpipe_rxdatavalid                          (o_ch0_rxpipe_rxdatavalid),
    .o_ch0_rxpipe_rxelecidlea                          (o_ch0_rxpipe_rxelecidlea),
    .o_ch0_rxpipe_rxstandbystatus                      (o_ch0_rxpipe_rxstandbystatus),
    .o_ch0_rxpipe_rxstartblock                         (o_ch0_rxpipe_rxstartblock),
    .o_ch0_rxpipe_rxstatus                             (o_ch0_rxpipe_rxstatus),
    .o_ch0_rxpipe_rxsyncheader                         (o_ch0_rxpipe_rxsyncheader),
    .o_ch0_rxpipe_rxvalid                              (o_ch0_rxpipe_rxvalid),
    .o_ch1_rxpipe_dirfeedback                          (o_ch1_rxpipe_dirfeedback),
    .o_ch1_rxpipe_linkevaluationfeedbackfiguremerit    (o_ch1_rxpipe_linkevaluationfeedbackfiguremerit),
    .o_ch1_rxpipe_localfs                              (o_ch1_rxpipe_localfs),
    .o_ch1_rxpipe_locallf                              (o_ch1_rxpipe_locallf),
    .o_ch1_rxpipe_localtxcoefficientsvalid             (o_ch1_rxpipe_localtxcoefficientsvalid),
    .o_ch1_rxpipe_localtxpresetcoefficients            (o_ch1_rxpipe_localtxpresetcoefficients),
    .o_ch1_rxpipe_p2m_bus                              (o_ch1_rxpipe_p2m_bus),
    .o_ch1_rxpipe_pclkchangeok                         (o_ch1_rxpipe_pclkchangeok),
    .o_ch1_rxpipe_phystatus                            (o_ch1_rxpipe_phystatus),	
    .o_ch1_rxpipe_rxdata                               (o_ch1_rxpipe_rxdata),
    .o_ch1_rxpipe_rxdatak                              (o_ch1_rxpipe_rxdatak),
    .o_ch1_rxpipe_rxdatavalid                          (o_ch1_rxpipe_rxdatavalid),
    .o_ch1_rxpipe_rxelecidlea                          (o_ch1_rxpipe_rxelecidlea),
    .o_ch1_rxpipe_rxstandbystatus                      (o_ch1_rxpipe_rxstandbystatus),
    .o_ch1_rxpipe_rxstartblock                         (o_ch1_rxpipe_rxstartblock),
    .o_ch1_rxpipe_rxstatus                             (o_ch1_rxpipe_rxstatus),
    .o_ch1_rxpipe_rxsyncheader                         (o_ch1_rxpipe_rxsyncheader),
    .o_ch1_rxpipe_rxvalid                              (o_ch1_rxpipe_rxvalid),
    .o_ch2_rxpipe_dirfeedback                          (o_ch2_rxpipe_dirfeedback),
    .o_ch2_rxpipe_linkevaluationfeedbackfiguremerit    (o_ch2_rxpipe_linkevaluationfeedbackfiguremerit),
    .o_ch2_rxpipe_localfs                              (o_ch2_rxpipe_localfs),
    .o_ch2_rxpipe_locallf                              (o_ch2_rxpipe_locallf),
    .o_ch2_rxpipe_localtxcoefficientsvalid             (o_ch2_rxpipe_localtxcoefficientsvalid),
    .o_ch2_rxpipe_localtxpresetcoefficients            (o_ch2_rxpipe_localtxpresetcoefficients),
    .o_ch2_rxpipe_p2m_bus                              (o_ch2_rxpipe_p2m_bus),
    .o_ch2_rxpipe_pclkchangeok                         (o_ch2_rxpipe_pclkchangeok),
    .o_ch2_rxpipe_phystatus                            (o_ch2_rxpipe_phystatus),	
    .o_ch2_rxpipe_rxdata                               (o_ch2_rxpipe_rxdata),
    .o_ch2_rxpipe_rxdatak                              (o_ch2_rxpipe_rxdatak),
    .o_ch2_rxpipe_rxdatavalid                          (o_ch2_rxpipe_rxdatavalid),
    .o_ch2_rxpipe_rxelecidlea                          (o_ch2_rxpipe_rxelecidlea),
    .o_ch2_rxpipe_rxstandbystatus                      (o_ch2_rxpipe_rxstandbystatus),
    .o_ch2_rxpipe_rxstartblock                         (o_ch2_rxpipe_rxstartblock),
    .o_ch2_rxpipe_rxstatus                             (o_ch2_rxpipe_rxstatus),
    .o_ch2_rxpipe_rxsyncheader                         (o_ch2_rxpipe_rxsyncheader),
    .o_ch2_rxpipe_rxvalid                              (o_ch2_rxpipe_rxvalid),
    .o_ch3_rxpipe_dirfeedback                          (o_ch3_rxpipe_dirfeedback),
    .o_ch3_rxpipe_linkevaluationfeedbackfiguremerit    (o_ch3_rxpipe_linkevaluationfeedbackfiguremerit),
    .o_ch3_rxpipe_localfs                              (o_ch3_rxpipe_localfs),
    .o_ch3_rxpipe_locallf                              (o_ch3_rxpipe_locallf),
    .o_ch3_rxpipe_localtxcoefficientsvalid             (o_ch3_rxpipe_localtxcoefficientsvalid),
    .o_ch3_rxpipe_localtxpresetcoefficients            (o_ch3_rxpipe_localtxpresetcoefficients),
    .o_ch3_rxpipe_p2m_bus                              (o_ch3_rxpipe_p2m_bus),
    .o_ch3_rxpipe_pclkchangeok                         (o_ch3_rxpipe_pclkchangeok),
    .o_ch3_rxpipe_phystatus                            (o_ch3_rxpipe_phystatus),	
    .o_ch3_rxpipe_rxdata                               (o_ch3_rxpipe_rxdata),
    .o_ch3_rxpipe_rxdatak                              (o_ch3_rxpipe_rxdatak),
    .o_ch3_rxpipe_rxdatavalid                          (o_ch3_rxpipe_rxdatavalid),
    .o_ch3_rxpipe_rxelecidlea                          (o_ch3_rxpipe_rxelecidlea),
    .o_ch3_rxpipe_rxstandbystatus                      (o_ch3_rxpipe_rxstandbystatus),
    .o_ch3_rxpipe_rxstartblock                         (o_ch3_rxpipe_rxstartblock),
    .o_ch3_rxpipe_rxstatus                             (o_ch3_rxpipe_rxstatus),
    .o_ch3_rxpipe_rxsyncheader                         (o_ch3_rxpipe_rxsyncheader),
    .o_ch3_rxpipe_rxvalid                              (o_ch3_rxpipe_rxvalid),
    .o_ch1_uxq_txword                               (o_ch1_uxq_txword[39:0]),
    .o_ch2_uxq_txword                               (o_ch2_uxq_txword[39:0]),
    .o_ch3_uxq_txword                               (o_ch3_uxq_txword[39:0]),
    .o_ch0_uxq_txword                                  (o_ch0_uxq_txword[39:0])
);

system_intel_pcie_gts_0_pcie_hal_top_phip_hal_2100_sxn6eia #(
    .cfg_ptm_auto_update_signal                 (cfg_ptm_auto_update_signal),                
    .cvp_enable                                 (cvp_enable),                                
    .cii_monitor_en                             (cii_monitor_en),
    .cvp_vendor_specific_header_id              (cvp_vendor_specific_header_id),             
    .drop_vendor0_msg                           (drop_vendor0_msg),                          
    .drop_vendor1_msg                           (drop_vendor1_msg),                          
    .dtk_mode_en                                (dtk_mode_en),
    .exvf_msix_tablesize_pf0                    (exvf_msix_tablesize_pf0),                   
    .exvf_msix_tablesize_pf1                    (exvf_msix_tablesize_pf1),                   
    .exvf_msix_tablesize_pf2                    (exvf_msix_tablesize_pf2),                   
    .exvf_msix_tablesize_pf3                    (exvf_msix_tablesize_pf3),                   
    .exvf_msixpba_bir_pf0                       (exvf_msixpba_bir_pf0),                      
    .exvf_msixpba_bir_pf1                       (exvf_msixpba_bir_pf1),                      
    .exvf_msixpba_bir_pf2                       (exvf_msixpba_bir_pf2),                      
    .exvf_msixpba_bir_pf3                       (exvf_msixpba_bir_pf3),                      
    .exvf_msixpba_offset_pf0                    (exvf_msixpba_offset_pf0),                   
    .exvf_msixpba_offset_pf1                    (exvf_msixpba_offset_pf1),                   
    .exvf_msixpba_offset_pf2                    (exvf_msixpba_offset_pf2),                   
    .exvf_msixpba_offset_pf3                    (exvf_msixpba_offset_pf3),                   
    .exvf_msixtable_bir_pf0                     (exvf_msixtable_bir_pf0),                    
    .exvf_msixtable_bir_pf1                     (exvf_msixtable_bir_pf1),                    
    .exvf_msixtable_bir_pf2                     (exvf_msixtable_bir_pf2),                    
    .exvf_msixtable_bir_pf3                     (exvf_msixtable_bir_pf3),                    
    .exvf_msixtable_offset_pf0                  (exvf_msixtable_offset_pf0),                 
    .exvf_msixtable_offset_pf1                  (exvf_msixtable_offset_pf1),                 
    .exvf_msixtable_offset_pf2                  (exvf_msixtable_offset_pf2),                 
    .exvf_msixtable_offset_pf3                  (exvf_msixtable_offset_pf3),                 
    .exvf_subsysid_pf0                          (exvf_subsysid_pf0),                         
    .exvf_subsysid_pf1                          (exvf_subsysid_pf1),                         
    .exvf_subsysid_pf2                          (exvf_subsysid_pf2),                         
    .exvf_subsysid_pf3                          (exvf_subsysid_pf3),                         
    .exvf_tph_sttablelocation_pf0               (exvf_tph_sttablelocation_pf0),              
    .exvf_tph_sttablelocation_pf1               (exvf_tph_sttablelocation_pf1),              
    .exvf_tph_sttablelocation_pf2               (exvf_tph_sttablelocation_pf2),              
    .exvf_tph_sttablelocation_pf3               (exvf_tph_sttablelocation_pf3),              
    .exvf_tph_sttablesize_pf0                   (exvf_tph_sttablesize_pf0),                  
    .exvf_tph_sttablesize_pf1                   (exvf_tph_sttablesize_pf1),                  
    .exvf_tph_sttablesize_pf2                   (exvf_tph_sttablesize_pf2),                  
    .exvf_tph_sttablesize_pf3                   (exvf_tph_sttablesize_pf3),                  
    .hrc_arb_sel                                (hrc_arb_sel),
    .link_rate                                  (link_rate),                                 
    .link_width                                 (link_width),                                
    .maxpayload_size                            (maxpayload_size),                           
    .num_arb_ip                                 (num_arb_ip),
    .num_of_lanes                               (num_of_lanes),                              
    .pcie_hrc_pulse_sel                         (pcie_hrc_pulse_sel),
    .pcie_parity_bypass                         (pcie_parity_bypass),                        
    .pclk_clk_hz                                (pclk_clk_hz),
    .pf0_acs_cap_acs_at_block                   (pf0_acs_cap_acs_at_block),                  
    .pf0_acs_cap_acs_direct_translated_p2p      (pf0_acs_cap_acs_direct_translated_p2p),     
    .pf0_acs_cap_acs_egress_ctrl_size           (pf0_acs_cap_acs_egress_ctrl_size),          
    .pf0_acs_cap_acs_p2p_cpl_redirect           (pf0_acs_cap_acs_p2p_cpl_redirect),          
    .pf0_acs_cap_acs_p2p_egress_control         (pf0_acs_cap_acs_p2p_egress_control),        
    .pf0_acs_cap_acs_p2p_req_redirect           (pf0_acs_cap_acs_p2p_req_redirect),          
    .pf0_acs_cap_acs_src_valid                  (pf0_acs_cap_acs_src_valid),                 
    .pf0_acs_cap_acs_usp_forwarding             (pf0_acs_cap_acs_usp_forwarding),            
    .pf0_acs_cap_enable                         (pf0_acs_cap_enable),                        
    .pf0_ats_cap_enable                         (pf0_ats_cap_enable),                        
    .pf0_ats_cap_invalidate_q_depth             (pf0_ats_cap_invalidate_q_depth),
    .pf0_ats_exvf_align_request                 (pf0_ats_exvf_align_request),
    .pf0_bar0_prefetch                          (pf0_bar0_prefetch),                         
    .pf0_bar0_type                              (pf0_bar0_type),                             
    .pf0_bar1_prefetch                          (pf0_bar1_prefetch),                         
    .pf0_bar2_prefetch                          (pf0_bar2_prefetch),                         
    .pf0_bar2_type                              (pf0_bar2_type),                             
    .pf0_bar3_prefetch                          (pf0_bar3_prefetch),                         
    .pf0_bar4_prefetch                          (pf0_bar4_prefetch),                         
    .pf0_bar4_type                              (pf0_bar4_type),                             
    .pf0_bar5_prefetch                          (pf0_bar5_prefetch),                         
    .pf0_base_class_code                        (pf0_base_class_code),                       
    .pf0_cap_link_surprise_down_err_cap         (pf0_cap_link_surprise_down_err_cap),
    .pf0_dsp_16g_tx_preset0                     (pf0_dsp_16g_tx_preset0),                    
    .pf0_dsp_16g_tx_preset1                     (pf0_dsp_16g_tx_preset1),                    
    .pf0_dsp_16g_tx_preset2                     (pf0_dsp_16g_tx_preset2),                    
    .pf0_dsp_16g_tx_preset3                     (pf0_dsp_16g_tx_preset3),                    
    .pf0_dsp_16g_tx_preset4                     (pf0_dsp_16g_tx_preset4),                    
    .pf0_dsp_16g_tx_preset5                     (pf0_dsp_16g_tx_preset5),                    
    .pf0_dsp_16g_tx_preset6                     (pf0_dsp_16g_tx_preset6),                    
    .pf0_dsp_16g_tx_preset7                     (pf0_dsp_16g_tx_preset7),                    
    .pf0_dsp_16g_tx_preset8                     (pf0_dsp_16g_tx_preset8),                    
    .pf0_dsp_16g_tx_preset9                     (pf0_dsp_16g_tx_preset9),                    
    .pf0_dsp_16g_tx_preset10                    (pf0_dsp_16g_tx_preset10),                   
    .pf0_dsp_16g_tx_preset11                    (pf0_dsp_16g_tx_preset11),                   
    .pf0_dsp_16g_tx_preset12                    (pf0_dsp_16g_tx_preset12),                   
    .pf0_dsp_16g_tx_preset13                    (pf0_dsp_16g_tx_preset13),                   
    .pf0_dsp_16g_tx_preset14                    (pf0_dsp_16g_tx_preset14),                   
    .pf0_dsp_16g_tx_preset15                    (pf0_dsp_16g_tx_preset15),                   
    .pf0_dsp_tx_preset0                         (pf0_dsp_tx_preset0),                        
    .pf0_dsp_tx_preset1                         (pf0_dsp_tx_preset1),                        
    .pf0_dsp_tx_preset2                         (pf0_dsp_tx_preset2),                        
    .pf0_dsp_tx_preset3                         (pf0_dsp_tx_preset3),                        
    .pf0_dsp_tx_preset4                         (pf0_dsp_tx_preset4),                        
    .pf0_dsp_tx_preset5                         (pf0_dsp_tx_preset5),                        
    .pf0_dsp_tx_preset6                         (pf0_dsp_tx_preset6),                        
    .pf0_dsp_tx_preset7                         (pf0_dsp_tx_preset7),                        
    .pf0_dsp_tx_preset8                         (pf0_dsp_tx_preset8),                        
    .pf0_dsp_tx_preset9                         (pf0_dsp_tx_preset9),                        
    .pf0_dsp_tx_preset10                        (pf0_dsp_tx_preset10),                       
    .pf0_dsp_tx_preset11                        (pf0_dsp_tx_preset11),                       
    .pf0_dsp_tx_preset12                        (pf0_dsp_tx_preset12),                       
    .pf0_dsp_tx_preset13                        (pf0_dsp_tx_preset13),                       
    .pf0_dsp_tx_preset14                        (pf0_dsp_tx_preset14),                       
    .pf0_dsp_tx_preset15                        (pf0_dsp_tx_preset15),                       
    .pf0_exvf_acs_cap_enable                    (pf0_exvf_acs_cap_enable),                   
    .pf0_exvf_ats_cap_enable                    (pf0_exvf_ats_cap_enable),                   
    .pf0_exvf_msix_cap_enable                   (pf0_exvf_msix_cap_enable),                  
    .pf0_exvf_tph_cap_enable                    (pf0_exvf_tph_cap_enable),                   
    .pf0_exvf_virtio_en                         (pf0_exvf_virtio_en),                        
    .pf0_int_pin                                (pf0_int_pin),                               
    .pf0_ltr_cap_enable                         (pf0_ltr_cap_enable),                        
    .pf0_msi_enable                             (pf0_msi_enable),                            
    .pf0_msix_enable                            (pf0_msix_enable),                           
    .pf0_pasid_cap_enable                       (pf0_pasid_cap_enable),                      
    .pf0_pasid_cap_execute_permission_supported (pf0_pasid_cap_execute_permission_supported),
    .pf0_pasid_cap_max_pasid_width              (pf0_pasid_cap_max_pasid_width),             
    .pf0_pasid_cap_privileged_mode_supported    (pf0_pasid_cap_privileged_mode_supported),   
    .pf0_pci_msi_64_bit_addr_cap                (pf0_pci_msi_64_bit_addr_cap),               
    .pf0_pci_msi_ext_data_cap                   (pf0_pci_msi_ext_data_cap),                  
    .pf0_pci_msi_ext_data_en                    (pf0_pci_msi_ext_data_en),                   
    .pf0_pci_msi_multiple_msg_cap               (pf0_pci_msi_multiple_msg_cap),              
    .pf0_pci_msix_bir                           (pf0_pci_msix_bir),                          
    .pf0_pci_msix_pba                           (pf0_pci_msix_pba),                          
    .pf0_pci_msix_pba_offset                    (pf0_pci_msix_pba_offset),                   
    .pf0_pci_msix_table_offset                  (pf0_pci_msix_table_offset),                 
    .pf0_pci_msix_table_size                    (pf0_pci_msix_table_size),                   
    .pf0_pci_msix_table_size_vfcomm_cs2         (pf0_pci_msix_table_size_vfcomm_cs2),        
    .pf0_pci_type0_bar0_enabled                 (pf0_pci_type0_bar0_enabled),                
    .pf0_pci_type0_bar0_mask_31_1               (pf0_pci_type0_bar0_mask_31_1),              
    .pf0_pci_type0_bar1_enabled                 (pf0_pci_type0_bar1_enabled),                
    .pf0_pci_type0_bar1_mask_31_0               (pf0_pci_type0_bar1_mask_31_0),              
    .pf0_pci_type0_bar2_enabled                 (pf0_pci_type0_bar2_enabled),                
    .pf0_pci_type0_bar2_mask_31_1               (pf0_pci_type0_bar2_mask_31_1),              
    .pf0_pci_type0_bar3_enabled                 (pf0_pci_type0_bar3_enabled),                
    .pf0_pci_type0_bar3_mask_31_0               (pf0_pci_type0_bar3_mask_31_0),              
    .pf0_pci_type0_bar4_enabled                 (pf0_pci_type0_bar4_enabled),                
    .pf0_pci_type0_bar4_mask_31_1               (pf0_pci_type0_bar4_mask_31_1),              
    .pf0_pci_type0_bar5_enabled                 (pf0_pci_type0_bar5_enabled),                
    .pf0_pci_type0_bar5_mask_31_0               (pf0_pci_type0_bar5_mask_31_0),              
    .pf0_pci_type0_device_id                    (pf0_pci_type0_device_id),                   
    .pf0_pci_type0_vendor_id                    (pf0_pci_type0_vendor_id),                   
    .pf0_pcie_cap_ep_l0s_accpt_latency          (pf0_pcie_cap_ep_l0s_accpt_latency),         
    .pf0_pcie_cap_ep_l1_accpt_latency           (pf0_pcie_cap_ep_l1_accpt_latency),          
    .pf0_pcie_cap_ext_tag_en                    (pf0_pcie_cap_ext_tag_en),                   
    .pf0_pcie_cap_flr_cap                       (pf0_pcie_cap_flr_cap),                      
    .pf0_pcie_cap_hot_plug_capable              (pf0_pcie_cap_hot_plug_capable),             
    .pf0_pcie_cap_l0s_exit_latency_commclk_dis  (pf0_pcie_cap_l0s_exit_latency_commclk_dis), 
    .pf0_pcie_cap_l1_exit_latency_commclk_dis   (pf0_pcie_cap_l1_exit_latency_commclk_dis),  
    .pf0_pcie_cap_phy_slot_num                  (pf0_pcie_cap_phy_slot_num),                 
    .pf0_pcie_cap_port_num                      (pf0_pcie_cap_port_num),                     
    .pf0_pcie_cap_slot_clk_config               (pf0_pcie_cap_slot_clk_config),              
    .pf0_pcie_cap_slot_power_limit_scale        (pf0_pcie_cap_slot_power_limit_scale),       
    .pf0_pcie_cap_slot_power_limit_value        (pf0_pcie_cap_slot_power_limit_value),       
    .pf0_pcie_slot_imp                          (pf0_pcie_slot_imp),                         
    .pf0_port_logic_fast_link_mode              (pf0_port_logic_fast_link_mode),
    .pf0_prefetch_decode                        (pf0_prefetch_decode),
    .pf0_program_interface                      (pf0_program_interface),                     
    .pf0_prs_ext_cap_enable                     (pf0_prs_ext_cap_enable),                    
    .pf0_prs_ext_cap_outstanding_capacity       (pf0_prs_ext_cap_outstanding_capacity),
    .pf0_revision_id                            (pf0_revision_id),                           
    .pf0_rom_bar_enable                         (pf0_rom_bar_enable),                        
    .pf0_rom_bar_enabled                        (pf0_rom_bar_enabled),
    .pf0_rom_mask                               (pf0_rom_mask),                              
    .pf0_rp_rom_bar_enabled                     (pf0_rp_rom_bar_enabled),                    
    .pf0_rp_rom_mask                            (pf0_rp_rom_mask),                           
    .pf0_sn_cap_enable                          (pf0_sn_cap_enable),                         
    .pf0_sn_ser_num_reg_1_dw                    (pf0_sn_ser_num_reg_1_dw),                   
    .pf0_sn_ser_num_reg_2_dw                    (pf0_sn_ser_num_reg_2_dw),                   
    .pf0_sriov_cap_sup_page_size                (pf0_sriov_cap_sup_page_size),
    .pf0_sriov_enable                           (pf0_sriov_enable),
    .pf0_sriov_num_vf                           (pf0_sriov_num_vf),
    .pf0_sriov_vf_bar0_enabled                  (pf0_sriov_vf_bar0_enabled),                 
    .pf0_sriov_vf_bar0_mask                     (pf0_sriov_vf_bar0_mask),                    
    .pf0_sriov_vf_bar0_prefetch                 (pf0_sriov_vf_bar0_prefetch),                
    .pf0_sriov_vf_bar0_type                     (pf0_sriov_vf_bar0_type),                    
    .pf0_sriov_vf_bar1_enabled                  (pf0_sriov_vf_bar1_enabled),                 
    .pf0_sriov_vf_bar1_mask                     (pf0_sriov_vf_bar1_mask),                    
    .pf0_sriov_vf_bar1_prefetch                 (pf0_sriov_vf_bar1_prefetch),                
    .pf0_sriov_vf_bar2_enabled                  (pf0_sriov_vf_bar2_enabled),                 
    .pf0_sriov_vf_bar2_mask                     (pf0_sriov_vf_bar2_mask),                    
    .pf0_sriov_vf_bar2_prefetch                 (pf0_sriov_vf_bar2_prefetch),                
    .pf0_sriov_vf_bar2_type                     (pf0_sriov_vf_bar2_type),                    
    .pf0_sriov_vf_bar3_enabled                  (pf0_sriov_vf_bar3_enabled),                 
    .pf0_sriov_vf_bar3_mask                     (pf0_sriov_vf_bar3_mask),                    
    .pf0_sriov_vf_bar3_prefetch                 (pf0_sriov_vf_bar3_prefetch),                
    .pf0_sriov_vf_bar4_enabled                  (pf0_sriov_vf_bar4_enabled),                 
    .pf0_sriov_vf_bar4_mask                     (pf0_sriov_vf_bar4_mask),                    
    .pf0_sriov_vf_bar4_prefetch                 (pf0_sriov_vf_bar4_prefetch),                
    .pf0_sriov_vf_bar4_type                     (pf0_sriov_vf_bar4_type),                    
    .pf0_sriov_vf_bar5_enabled                  (pf0_sriov_vf_bar5_enabled),                 
    .pf0_sriov_vf_bar5_mask                     (pf0_sriov_vf_bar5_mask),                    
    .pf0_sriov_vf_bar5_prefetch                 (pf0_sriov_vf_bar5_prefetch),                
    .pf0_sriov_vf_device_id                     (pf0_sriov_vf_device_id),                    
    .pf0_subclass_code                          (pf0_subclass_code),                         
    .pf0_subsys_dev_id                          (pf0_subsys_dev_id),                         
    .pf0_subsys_vendor_id                       (pf0_subsys_vendor_id),                      
    .pf0_tph_cap_enable                         (pf0_tph_cap_enable),                        
    .pf0_tph_req_cap_int_vec                    (pf0_tph_req_cap_int_vec),                   
    .pf0_tph_req_cap_int_vec_vfcomm_cs2         (pf0_tph_req_cap_int_vec_vfcomm_cs2),        
    .pf0_tph_req_cap_st_table_loc_0_vfcomm_cs2  (pf0_tph_req_cap_st_table_loc_0_vfcomm_cs2), 
    .pf0_tph_req_cap_st_table_loc_1             (pf0_tph_req_cap_st_table_loc_1),            
    .pf0_tph_req_cap_st_table_loc_1_vfcomm_cs2  (pf0_tph_req_cap_st_table_loc_1_vfcomm_cs2), 
    .pf0_tph_req_cap_st_table_size              (pf0_tph_req_cap_st_table_size),             
    .pf0_tph_req_cap_st_table_size_vfcomm_cs2   (pf0_tph_req_cap_st_table_size_vfcomm_cs2),  
    .pf0_tph_req_device_spec                    (pf0_tph_req_device_spec),                   
    .pf0_tph_req_device_spec_vfcomm_cs2         (pf0_tph_req_device_spec_vfcomm_cs2),        
    .pf0_user_vsec_cap_enable                   (pf0_user_vsec_cap_enable),                  
    .pf0_usp_16g_tx_preset0                     (pf0_usp_16g_tx_preset0),                    
    .pf0_usp_16g_tx_preset1                     (pf0_usp_16g_tx_preset1),                    
    .pf0_usp_16g_tx_preset2                     (pf0_usp_16g_tx_preset2),                    
    .pf0_usp_16g_tx_preset3                     (pf0_usp_16g_tx_preset3),                    
    .pf0_usp_16g_tx_preset4                     (pf0_usp_16g_tx_preset4),                    
    .pf0_usp_16g_tx_preset5                     (pf0_usp_16g_tx_preset5),                    
    .pf0_usp_16g_tx_preset6                     (pf0_usp_16g_tx_preset6),                    
    .pf0_usp_16g_tx_preset7                     (pf0_usp_16g_tx_preset7),                    
    .pf0_usp_16g_tx_preset8                     (pf0_usp_16g_tx_preset8),                    
    .pf0_usp_16g_tx_preset9                     (pf0_usp_16g_tx_preset9),                    
    .pf0_usp_16g_tx_preset10                    (pf0_usp_16g_tx_preset10),                   
    .pf0_usp_16g_tx_preset11                    (pf0_usp_16g_tx_preset11),                   
    .pf0_usp_16g_tx_preset12                    (pf0_usp_16g_tx_preset12),                   
    .pf0_usp_16g_tx_preset13                    (pf0_usp_16g_tx_preset13),                   
    .pf0_usp_16g_tx_preset14                    (pf0_usp_16g_tx_preset14),                   
    .pf0_usp_16g_tx_preset15                    (pf0_usp_16g_tx_preset15),                   
    .pf0_usp_tx_preset0                         (pf0_usp_tx_preset0),                        
    .pf0_usp_tx_preset1                         (pf0_usp_tx_preset1),                        
    .pf0_usp_tx_preset2                         (pf0_usp_tx_preset2),                        
    .pf0_usp_tx_preset3                         (pf0_usp_tx_preset3),                        
    .pf0_usp_tx_preset4                         (pf0_usp_tx_preset4),                        
    .pf0_usp_tx_preset5                         (pf0_usp_tx_preset5),                        
    .pf0_usp_tx_preset6                         (pf0_usp_tx_preset6),                        
    .pf0_usp_tx_preset7                         (pf0_usp_tx_preset7),                        
    .pf0_usp_tx_preset8                         (pf0_usp_tx_preset8),                        
    .pf0_usp_tx_preset9                         (pf0_usp_tx_preset9),                        
    .pf0_usp_tx_preset10                        (pf0_usp_tx_preset10),                       
    .pf0_usp_tx_preset11                        (pf0_usp_tx_preset11),                       
    .pf0_usp_tx_preset12                        (pf0_usp_tx_preset12),                       
    .pf0_usp_tx_preset13                        (pf0_usp_tx_preset13),                       
    .pf0_usp_tx_preset14                        (pf0_usp_tx_preset14),                       
    .pf0_usp_tx_preset15                        (pf0_usp_tx_preset15),                       
    .pf0_virtio_en                              (pf0_virtio_en),                             
    .pf1_acs_cap_acs_at_block                   (pf1_acs_cap_acs_at_block),                  
    .pf1_acs_cap_acs_direct_translated_p2p      (pf1_acs_cap_acs_direct_translated_p2p),     
    .pf1_acs_cap_acs_egress_ctrl_size           (pf1_acs_cap_acs_egress_ctrl_size),          
    .pf1_acs_cap_acs_p2p_cpl_redirect           (pf1_acs_cap_acs_p2p_cpl_redirect),          
    .pf1_acs_cap_acs_p2p_egress_control         (pf1_acs_cap_acs_p2p_egress_control),        
    .pf1_acs_cap_acs_p2p_req_redirect           (pf1_acs_cap_acs_p2p_req_redirect),          
    .pf1_acs_cap_acs_src_valid                  (pf1_acs_cap_acs_src_valid),                 
    .pf1_acs_cap_acs_usp_forwarding             (pf1_acs_cap_acs_usp_forwarding),            
    .pf1_acs_cap_enable                         (pf1_acs_cap_enable),                        
    .pf1_ats_cap_enable                         (pf1_ats_cap_enable),                        
    .pf1_ats_cap_invalidate_q_depth             (pf1_ats_cap_invalidate_q_depth),
    .pf1_ats_exvf_align_request                 (pf1_ats_exvf_align_request),
    .pf1_bar0_prefetch                          (pf1_bar0_prefetch),                         
    .pf1_bar0_type                              (pf1_bar0_type),                             
    .pf1_bar1_prefetch                          (pf1_bar1_prefetch),                         
    .pf1_bar2_prefetch                          (pf1_bar2_prefetch),                         
    .pf1_bar2_type                              (pf1_bar2_type),                             
    .pf1_bar3_prefetch                          (pf1_bar3_prefetch),                         
    .pf1_bar4_prefetch                          (pf1_bar4_prefetch),                         
    .pf1_bar4_type                              (pf1_bar4_type),                             
    .pf1_bar5_prefetch                          (pf1_bar5_prefetch),                         
    .pf1_base_class_code                        (pf1_base_class_code),                       
    .pf1_enable                                 (pf1_enable),                                
    .pf1_exvf_acs_cap_enable                    (pf1_exvf_acs_cap_enable),                   
    .pf1_exvf_ats_cap_enable                    (pf1_exvf_ats_cap_enable),                   
    .pf1_exvf_msix_cap_enable                   (pf1_exvf_msix_cap_enable),                  
    .pf1_exvf_tph_cap_enable                    (pf1_exvf_tph_cap_enable),                   
    .pf1_exvf_virtio_en                         (pf1_exvf_virtio_en),                        
    .pf1_int_pin                                (pf1_int_pin),                               
    .pf1_msi_enable                             (pf1_msi_enable),                            
    .pf1_msix_enable                            (pf1_msix_enable),                           
    .pf1_pasid_cap_enable                       (pf1_pasid_cap_enable),                      
    .pf1_pasid_cap_execute_permission_supported (pf1_pasid_cap_execute_permission_supported),
    .pf1_pasid_cap_max_pasid_width              (pf1_pasid_cap_max_pasid_width),             
    .pf1_pasid_cap_privileged_mode_supported    (pf1_pasid_cap_privileged_mode_supported),   
    .pf1_pci_msi_64_bit_addr_cap                (pf1_pci_msi_64_bit_addr_cap),               
    .pf1_pci_msi_ext_data_cap                   (pf1_pci_msi_ext_data_cap),                  
    .pf1_pci_msi_ext_data_en                    (pf1_pci_msi_ext_data_en),                   
    .pf1_pci_msi_multiple_msg_cap               (pf1_pci_msi_multiple_msg_cap),              
    .pf1_pci_msix_bir                           (pf1_pci_msix_bir),                          
    .pf1_pci_msix_pba                           (pf1_pci_msix_pba),                          
    .pf1_pci_msix_pba_offset                    (pf1_pci_msix_pba_offset),                   
    .pf1_pci_msix_table_offset                  (pf1_pci_msix_table_offset),                 
    .pf1_pci_msix_table_size                    (pf1_pci_msix_table_size),                   
    .pf1_pci_msix_table_size_vfcomm_cs2         (pf1_pci_msix_table_size_vfcomm_cs2),        
    .pf1_pci_type0_bar0_enabled                 (pf1_pci_type0_bar0_enabled),                
    .pf1_pci_type0_bar0_mask_31_1               (pf1_pci_type0_bar0_mask_31_1),              
    .pf1_pci_type0_bar1_enabled                 (pf1_pci_type0_bar1_enabled),                
    .pf1_pci_type0_bar1_mask_31_0               (pf1_pci_type0_bar1_mask_31_0),              
    .pf1_pci_type0_bar2_enabled                 (pf1_pci_type0_bar2_enabled),                
    .pf1_pci_type0_bar2_mask_31_1               (pf1_pci_type0_bar2_mask_31_1),              
    .pf1_pci_type0_bar3_enabled                 (pf1_pci_type0_bar3_enabled),                
    .pf1_pci_type0_bar3_mask_31_0               (pf1_pci_type0_bar3_mask_31_0),              
    .pf1_pci_type0_bar4_enabled                 (pf1_pci_type0_bar4_enabled),                
    .pf1_pci_type0_bar4_mask_31_1               (pf1_pci_type0_bar4_mask_31_1),              
    .pf1_pci_type0_bar5_enabled                 (pf1_pci_type0_bar5_enabled),                
    .pf1_pci_type0_bar5_mask_31_0               (pf1_pci_type0_bar5_mask_31_0),              
    .pf1_pci_type0_device_id                    (pf1_pci_type0_device_id),                   
    .pf1_pci_type0_vendor_id                    (pf1_pci_type0_vendor_id),                   
    .pf1_pcie_cap_ep_l0s_accpt_latency          (pf1_pcie_cap_ep_l0s_accpt_latency),         
    .pf1_pcie_cap_ep_l1_accpt_latency           (pf1_pcie_cap_ep_l1_accpt_latency),          
    .pf1_pcie_cap_ext_tag_en                    (pf1_pcie_cap_ext_tag_en),                   
    .pf1_pcie_cap_flr_cap                       (pf1_pcie_cap_flr_cap),                      
    .pf1_pcie_cap_l0s_exit_latency_commclk_dis  (pf1_pcie_cap_l0s_exit_latency_commclk_dis), 
    .pf1_pcie_cap_l1_exit_latency_commclk_dis   (pf1_pcie_cap_l1_exit_latency_commclk_dis),  
    .pf1_pcie_cap_port_num                      (pf1_pcie_cap_port_num),                     
    .pf1_pcie_cap_slot_clk_config               (pf1_pcie_cap_slot_clk_config),              
    .pf1_program_interface                      (pf1_program_interface),                     
    .pf1_prs_ext_cap_enable                     (pf1_prs_ext_cap_enable),                    
    .pf1_prs_ext_cap_outstanding_capacity       (pf1_prs_ext_cap_outstanding_capacity),
    .pf1_revision_id                            (pf1_revision_id),                           
    .pf1_rom_bar_enable                         (pf1_rom_bar_enable),                        
    .pf1_rom_bar_enabled                        (pf1_rom_bar_enabled),
    .pf1_rom_mask                               (pf1_rom_mask),                              
    .pf1_sn_cap_enable                          (pf1_sn_cap_enable),                         
    .pf1_sn_ser_num_reg_1_dw                    (pf1_sn_ser_num_reg_1_dw),                   
    .pf1_sn_ser_num_reg_2_dw                    (pf1_sn_ser_num_reg_2_dw),                   
    .pf1_sriov_cap_sup_page_size                (pf1_sriov_cap_sup_page_size),
    .pf1_sriov_enable                           (pf1_sriov_enable),
    .pf1_sriov_num_vf                           (pf1_sriov_num_vf),
    .pf1_sriov_vf_bar0_enabled                  (pf1_sriov_vf_bar0_enabled),                 
    .pf1_sriov_vf_bar0_mask                     (pf1_sriov_vf_bar0_mask),                    
    .pf1_sriov_vf_bar0_prefetch                 (pf1_sriov_vf_bar0_prefetch),                
    .pf1_sriov_vf_bar0_type                     (pf1_sriov_vf_bar0_type),                    
    .pf1_sriov_vf_bar1_enabled                  (pf1_sriov_vf_bar1_enabled),                 
    .pf1_sriov_vf_bar1_mask                     (pf1_sriov_vf_bar1_mask),                    
    .pf1_sriov_vf_bar1_prefetch                 (pf1_sriov_vf_bar1_prefetch),                
    .pf1_sriov_vf_bar2_enabled                  (pf1_sriov_vf_bar2_enabled),                 
    .pf1_sriov_vf_bar2_mask                     (pf1_sriov_vf_bar2_mask),                    
    .pf1_sriov_vf_bar2_prefetch                 (pf1_sriov_vf_bar2_prefetch),                
    .pf1_sriov_vf_bar2_type                     (pf1_sriov_vf_bar2_type),                    
    .pf1_sriov_vf_bar3_enabled                  (pf1_sriov_vf_bar3_enabled),                 
    .pf1_sriov_vf_bar3_mask                     (pf1_sriov_vf_bar3_mask),                    
    .pf1_sriov_vf_bar3_prefetch                 (pf1_sriov_vf_bar3_prefetch),                
    .pf1_sriov_vf_bar4_enabled                  (pf1_sriov_vf_bar4_enabled),                 
    .pf1_sriov_vf_bar4_mask                     (pf1_sriov_vf_bar4_mask),                    
    .pf1_sriov_vf_bar4_prefetch                 (pf1_sriov_vf_bar4_prefetch),                
    .pf1_sriov_vf_bar4_type                     (pf1_sriov_vf_bar4_type),                    
    .pf1_sriov_vf_bar5_enabled                  (pf1_sriov_vf_bar5_enabled),                 
    .pf1_sriov_vf_bar5_mask                     (pf1_sriov_vf_bar5_mask),                    
    .pf1_sriov_vf_bar5_prefetch                 (pf1_sriov_vf_bar5_prefetch),                
    .pf1_sriov_vf_device_id                     (pf1_sriov_vf_device_id),                    
    .pf1_subclass_code                          (pf1_subclass_code),                         
    .pf1_subsys_dev_id                          (pf1_subsys_dev_id),                         
    .pf1_subsys_vendor_id                       (pf1_subsys_vendor_id),                      
    .pf1_tph_cap_enable                         (pf1_tph_cap_enable),                        
    .pf1_tph_req_cap_int_vec                    (pf1_tph_req_cap_int_vec),                   
    .pf1_tph_req_cap_int_vec_vfcomm_cs2         (pf1_tph_req_cap_int_vec_vfcomm_cs2),        
    .pf1_tph_req_cap_st_table_loc_0_vfcomm_cs2  (pf1_tph_req_cap_st_table_loc_0_vfcomm_cs2), 
    .pf1_tph_req_cap_st_table_loc_1             (pf1_tph_req_cap_st_table_loc_1),            
    .pf1_tph_req_cap_st_table_loc_1_vfcomm_cs2  (pf1_tph_req_cap_st_table_loc_1_vfcomm_cs2), 
    .pf1_tph_req_cap_st_table_size              (pf1_tph_req_cap_st_table_size),             
    .pf1_tph_req_cap_st_table_size_vfcomm_cs2   (pf1_tph_req_cap_st_table_size_vfcomm_cs2),  
    .pf1_tph_req_device_spec                    (pf1_tph_req_device_spec),                   
    .pf1_tph_req_device_spec_vfcomm_cs2         (pf1_tph_req_device_spec_vfcomm_cs2),        
    .pf1_user_vsec_cap_enable                   (pf1_user_vsec_cap_enable),                  
    .pf1_user_vsec_offset                       (pf1_user_vsec_offset),                      
    .pf1_virtio_en                              (pf1_virtio_en),                             
    .pf2_acs_cap_acs_at_block                   (pf2_acs_cap_acs_at_block),                  
    .pf2_acs_cap_acs_direct_translated_p2p      (pf2_acs_cap_acs_direct_translated_p2p),     
    .pf2_acs_cap_acs_egress_ctrl_size           (pf2_acs_cap_acs_egress_ctrl_size),          
    .pf2_acs_cap_acs_p2p_cpl_redirect           (pf2_acs_cap_acs_p2p_cpl_redirect),          
    .pf2_acs_cap_acs_p2p_egress_control         (pf2_acs_cap_acs_p2p_egress_control),        
    .pf2_acs_cap_acs_p2p_req_redirect           (pf2_acs_cap_acs_p2p_req_redirect),          
    .pf2_acs_cap_acs_src_valid                  (pf2_acs_cap_acs_src_valid),                 
    .pf2_acs_cap_acs_usp_forwarding             (pf2_acs_cap_acs_usp_forwarding),            
    .pf2_acs_cap_enable                         (pf2_acs_cap_enable),                        
    .pf2_ats_cap_enable                         (pf2_ats_cap_enable),                        
    .pf2_ats_cap_invalidate_q_depth             (pf2_ats_cap_invalidate_q_depth),
    .pf2_ats_exvf_align_request                 (pf2_ats_exvf_align_request),
    .pf2_bar0_prefetch                          (pf2_bar0_prefetch),                         
    .pf2_bar0_type                              (pf2_bar0_type),                             
    .pf2_bar1_prefetch                          (pf2_bar1_prefetch),                         
    .pf2_bar2_prefetch                          (pf2_bar2_prefetch),                         
    .pf2_bar2_type                              (pf2_bar2_type),                             
    .pf2_bar3_prefetch                          (pf2_bar3_prefetch),                         
    .pf2_bar4_prefetch                          (pf2_bar4_prefetch),                         
    .pf2_bar4_type                              (pf2_bar4_type),                             
    .pf2_bar5_prefetch                          (pf2_bar5_prefetch),                         
    .pf2_base_class_code                        (pf2_base_class_code),                       
    .pf2_enable                                 (pf2_enable),                                
    .pf2_exvf_acs_cap_enable                    (pf2_exvf_acs_cap_enable),                   
    .pf2_exvf_ats_cap_enable                    (pf2_exvf_ats_cap_enable),                   
    .pf2_exvf_msix_cap_enable                   (pf2_exvf_msix_cap_enable),                  
    .pf2_exvf_tph_cap_enable                    (pf2_exvf_tph_cap_enable),                   
    .pf2_exvf_virtio_en                         (pf2_exvf_virtio_en),                        
    .pf2_int_pin                                (pf2_int_pin),                               
    .pf2_msi_enable                             (pf2_msi_enable),                            
    .pf2_msix_enable                            (pf2_msix_enable),                           
    .pf2_pasid_cap_enable                       (pf2_pasid_cap_enable),                      
    .pf2_pasid_cap_execute_permission_supported (pf2_pasid_cap_execute_permission_supported),
    .pf2_pasid_cap_max_pasid_width              (pf2_pasid_cap_max_pasid_width),             
    .pf2_pasid_cap_privileged_mode_supported    (pf2_pasid_cap_privileged_mode_supported),   
    .pf2_pci_msi_64_bit_addr_cap                (pf2_pci_msi_64_bit_addr_cap),               
    .pf2_pci_msi_ext_data_cap                   (pf2_pci_msi_ext_data_cap),                  
    .pf2_pci_msi_ext_data_en                    (pf2_pci_msi_ext_data_en),                   
    .pf2_pci_msi_multiple_msg_cap               (pf2_pci_msi_multiple_msg_cap),              
    .pf2_pci_msix_bir                           (pf2_pci_msix_bir),                          
    .pf2_pci_msix_pba                           (pf2_pci_msix_pba),                          
    .pf2_pci_msix_pba_offset                    (pf2_pci_msix_pba_offset),                   
    .pf2_pci_msix_table_offset                  (pf2_pci_msix_table_offset),                 
    .pf2_pci_msix_table_size                    (pf2_pci_msix_table_size),                   
    .pf2_pci_msix_table_size_vfcomm_cs2         (pf2_pci_msix_table_size_vfcomm_cs2),        
    .pf2_pci_type0_bar0_enabled                 (pf2_pci_type0_bar0_enabled),                
    .pf2_pci_type0_bar0_mask_31_1               (pf2_pci_type0_bar0_mask_31_1),              
    .pf2_pci_type0_bar1_enabled                 (pf2_pci_type0_bar1_enabled),                
    .pf2_pci_type0_bar1_mask_31_0               (pf2_pci_type0_bar1_mask_31_0),              
    .pf2_pci_type0_bar2_enabled                 (pf2_pci_type0_bar2_enabled),                
    .pf2_pci_type0_bar2_mask_31_1               (pf2_pci_type0_bar2_mask_31_1),              
    .pf2_pci_type0_bar3_enabled                 (pf2_pci_type0_bar3_enabled),                
    .pf2_pci_type0_bar3_mask_31_0               (pf2_pci_type0_bar3_mask_31_0),              
    .pf2_pci_type0_bar4_enabled                 (pf2_pci_type0_bar4_enabled),                
    .pf2_pci_type0_bar4_mask_31_1               (pf2_pci_type0_bar4_mask_31_1),              
    .pf2_pci_type0_bar5_enabled                 (pf2_pci_type0_bar5_enabled),                
    .pf2_pci_type0_bar5_mask_31_0               (pf2_pci_type0_bar5_mask_31_0),              
    .pf2_pci_type0_device_id                    (pf2_pci_type0_device_id),                   
    .pf2_pci_type0_vendor_id                    (pf2_pci_type0_vendor_id),                   
    .pf2_pcie_cap_ep_l0s_accpt_latency          (pf2_pcie_cap_ep_l0s_accpt_latency),         
    .pf2_pcie_cap_ep_l1_accpt_latency           (pf2_pcie_cap_ep_l1_accpt_latency),          
    .pf2_pcie_cap_ext_tag_en                    (pf2_pcie_cap_ext_tag_en),                   
    .pf2_pcie_cap_flr_cap                       (pf2_pcie_cap_flr_cap),                      
    .pf2_pcie_cap_l0s_exit_latency_commclk_dis  (pf2_pcie_cap_l0s_exit_latency_commclk_dis), 
    .pf2_pcie_cap_l1_exit_latency_commclk_dis   (pf2_pcie_cap_l1_exit_latency_commclk_dis),  
    .pf2_pcie_cap_port_num                      (pf2_pcie_cap_port_num),                     
    .pf2_pcie_cap_slot_clk_config               (pf2_pcie_cap_slot_clk_config),              
    .pf2_program_interface                      (pf2_program_interface),                     
    .pf2_prs_ext_cap_enable                     (pf2_prs_ext_cap_enable),                    
    .pf2_prs_ext_cap_outstanding_capacity       (pf2_prs_ext_cap_outstanding_capacity),
    .pf2_revision_id                            (pf2_revision_id),                           
    .pf2_rom_bar_enable                         (pf2_rom_bar_enable),                        
    .pf2_rom_bar_enabled                        (pf2_rom_bar_enabled),
    .pf2_rom_mask                               (pf2_rom_mask),                              
    .pf2_sn_cap_enable                          (pf2_sn_cap_enable),                         
    .pf2_sn_ser_num_reg_1_dw                    (pf2_sn_ser_num_reg_1_dw),                   
    .pf2_sn_ser_num_reg_2_dw                    (pf2_sn_ser_num_reg_2_dw),                   
    .pf2_sriov_cap_sup_page_size                (pf2_sriov_cap_sup_page_size),
    .pf2_sriov_enable                           (pf2_sriov_enable),
    .pf2_sriov_num_vf                           (pf2_sriov_num_vf),
    .pf2_sriov_vf_bar0_enabled                  (pf2_sriov_vf_bar0_enabled),                 
    .pf2_sriov_vf_bar0_mask                     (pf2_sriov_vf_bar0_mask),                    
    .pf2_sriov_vf_bar0_prefetch                 (pf2_sriov_vf_bar0_prefetch),                
    .pf2_sriov_vf_bar0_type                     (pf2_sriov_vf_bar0_type),                    
    .pf2_sriov_vf_bar1_enabled                  (pf2_sriov_vf_bar1_enabled),                 
    .pf2_sriov_vf_bar1_mask                     (pf2_sriov_vf_bar1_mask),                    
    .pf2_sriov_vf_bar1_prefetch                 (pf2_sriov_vf_bar1_prefetch),                
    .pf2_sriov_vf_bar2_enabled                  (pf2_sriov_vf_bar2_enabled),                 
    .pf2_sriov_vf_bar2_mask                     (pf2_sriov_vf_bar2_mask),                    
    .pf2_sriov_vf_bar2_prefetch                 (pf2_sriov_vf_bar2_prefetch),                
    .pf2_sriov_vf_bar2_type                     (pf2_sriov_vf_bar2_type),                    
    .pf2_sriov_vf_bar3_enabled                  (pf2_sriov_vf_bar3_enabled),                 
    .pf2_sriov_vf_bar3_mask                     (pf2_sriov_vf_bar3_mask),                    
    .pf2_sriov_vf_bar3_prefetch                 (pf2_sriov_vf_bar3_prefetch),                
    .pf2_sriov_vf_bar4_enabled                  (pf2_sriov_vf_bar4_enabled),                 
    .pf2_sriov_vf_bar4_mask                     (pf2_sriov_vf_bar4_mask),                    
    .pf2_sriov_vf_bar4_prefetch                 (pf2_sriov_vf_bar4_prefetch),                
    .pf2_sriov_vf_bar4_type                     (pf2_sriov_vf_bar4_type),                    
    .pf2_sriov_vf_bar5_enabled                  (pf2_sriov_vf_bar5_enabled),                 
    .pf2_sriov_vf_bar5_mask                     (pf2_sriov_vf_bar5_mask),                    
    .pf2_sriov_vf_bar5_prefetch                 (pf2_sriov_vf_bar5_prefetch),                
    .pf2_sriov_vf_device_id                     (pf2_sriov_vf_device_id),                    
    .pf2_subclass_code                          (pf2_subclass_code),                         
    .pf2_subsys_dev_id                          (pf2_subsys_dev_id),                         
    .pf2_subsys_vendor_id                       (pf2_subsys_vendor_id),                      
    .pf2_tph_cap_enable                         (pf2_tph_cap_enable),                        
    .pf2_tph_req_cap_int_vec                    (pf2_tph_req_cap_int_vec),                   
    .pf2_tph_req_cap_int_vec_vfcomm_cs2         (pf2_tph_req_cap_int_vec_vfcomm_cs2),        
    .pf2_tph_req_cap_st_table_loc_0_vfcomm_cs2  (pf2_tph_req_cap_st_table_loc_0_vfcomm_cs2), 
    .pf2_tph_req_cap_st_table_loc_1             (pf2_tph_req_cap_st_table_loc_1),            
    .pf2_tph_req_cap_st_table_loc_1_vfcomm_cs2  (pf2_tph_req_cap_st_table_loc_1_vfcomm_cs2), 
    .pf2_tph_req_cap_st_table_size              (pf2_tph_req_cap_st_table_size),             
    .pf2_tph_req_cap_st_table_size_vfcomm_cs2   (pf2_tph_req_cap_st_table_size_vfcomm_cs2),  
    .pf2_tph_req_device_spec                    (pf2_tph_req_device_spec),                   
    .pf2_tph_req_device_spec_vfcomm_cs2         (pf2_tph_req_device_spec_vfcomm_cs2),        
    .pf2_user_vsec_cap_enable                   (pf2_user_vsec_cap_enable),                  
    .pf2_user_vsec_offset                       (pf2_user_vsec_offset),                      
    .pf2_virtio_en                              (pf2_virtio_en),                             
    .pf3_acs_cap_acs_at_block                   (pf3_acs_cap_acs_at_block),                  
    .pf3_acs_cap_acs_direct_translated_p2p      (pf3_acs_cap_acs_direct_translated_p2p),     
    .pf3_acs_cap_acs_egress_ctrl_size           (pf3_acs_cap_acs_egress_ctrl_size),          
    .pf3_acs_cap_acs_p2p_cpl_redirect           (pf3_acs_cap_acs_p2p_cpl_redirect),          
    .pf3_acs_cap_acs_p2p_egress_control         (pf3_acs_cap_acs_p2p_egress_control),        
    .pf3_acs_cap_acs_p2p_req_redirect           (pf3_acs_cap_acs_p2p_req_redirect),          
    .pf3_acs_cap_acs_src_valid                  (pf3_acs_cap_acs_src_valid),                 
    .pf3_acs_cap_acs_usp_forwarding             (pf3_acs_cap_acs_usp_forwarding),            
    .pf3_acs_cap_enable                         (pf3_acs_cap_enable),                        
    .pf3_ats_cap_enable                         (pf3_ats_cap_enable),                        
    .pf3_ats_cap_invalidate_q_depth             (pf3_ats_cap_invalidate_q_depth),
    .pf3_ats_exvf_align_request                 (pf3_ats_exvf_align_request),
    .pf3_bar0_prefetch                          (pf3_bar0_prefetch),                         
    .pf3_bar0_type                              (pf3_bar0_type),                             
    .pf3_bar1_prefetch                          (pf3_bar1_prefetch),                         
    .pf3_bar2_prefetch                          (pf3_bar2_prefetch),                         
    .pf3_bar2_type                              (pf3_bar2_type),                             
    .pf3_bar3_prefetch                          (pf3_bar3_prefetch),                         
    .pf3_bar4_prefetch                          (pf3_bar4_prefetch),                         
    .pf3_bar4_type                              (pf3_bar4_type),                             
    .pf3_bar5_prefetch                          (pf3_bar5_prefetch),                         
    .pf3_base_class_code                        (pf3_base_class_code),                       
    .pf3_enable                                 (pf3_enable),                                
    .pf3_exvf_acs_cap_enable                    (pf3_exvf_acs_cap_enable),                   
    .pf3_exvf_ats_cap_enable                    (pf3_exvf_ats_cap_enable),                   
    .pf3_exvf_msix_cap_enable                   (pf3_exvf_msix_cap_enable),                  
    .pf3_exvf_tph_cap_enable                    (pf3_exvf_tph_cap_enable),                   
    .pf3_exvf_virtio_en                         (pf3_exvf_virtio_en),                        
    .pf3_int_pin                                (pf3_int_pin),                               
    .pf3_msi_enable                             (pf3_msi_enable),                            
    .pf3_msix_enable                            (pf3_msix_enable),                           
    .pf3_pasid_cap_enable                       (pf3_pasid_cap_enable),                      
    .pf3_pasid_cap_execute_permission_supported (pf3_pasid_cap_execute_permission_supported),
    .pf3_pasid_cap_max_pasid_width              (pf3_pasid_cap_max_pasid_width),             
    .pf3_pasid_cap_privileged_mode_supported    (pf3_pasid_cap_privileged_mode_supported),   
    .pf3_pci_msi_64_bit_addr_cap                (pf3_pci_msi_64_bit_addr_cap),               
    .pf3_pci_msi_ext_data_cap                   (pf3_pci_msi_ext_data_cap),                  
    .pf3_pci_msi_ext_data_en                    (pf3_pci_msi_ext_data_en),                   
    .pf3_pci_msi_multiple_msg_cap               (pf3_pci_msi_multiple_msg_cap),              
    .pf3_pci_msix_bir                           (pf3_pci_msix_bir),                          
    .pf3_pci_msix_pba                           (pf3_pci_msix_pba),                          
    .pf3_pci_msix_pba_offset                    (pf3_pci_msix_pba_offset),                   
    .pf3_pci_msix_table_offset                  (pf3_pci_msix_table_offset),                 
    .pf3_pci_msix_table_size                    (pf3_pci_msix_table_size),                   
    .pf3_pci_msix_table_size_vfcomm_cs2         (pf3_pci_msix_table_size_vfcomm_cs2),        
    .pf3_pci_type0_bar0_enabled                 (pf3_pci_type0_bar0_enabled),                
    .pf3_pci_type0_bar0_mask_31_1               (pf3_pci_type0_bar0_mask_31_1),              
    .pf3_pci_type0_bar1_enabled                 (pf3_pci_type0_bar1_enabled),                
    .pf3_pci_type0_bar1_mask_31_0               (pf3_pci_type0_bar1_mask_31_0),              
    .pf3_pci_type0_bar2_enabled                 (pf3_pci_type0_bar2_enabled),                
    .pf3_pci_type0_bar2_mask_31_1               (pf3_pci_type0_bar2_mask_31_1),              
    .pf3_pci_type0_bar3_enabled                 (pf3_pci_type0_bar3_enabled),                
    .pf3_pci_type0_bar3_mask_31_0               (pf3_pci_type0_bar3_mask_31_0),              
    .pf3_pci_type0_bar4_enabled                 (pf3_pci_type0_bar4_enabled),                
    .pf3_pci_type0_bar4_mask_31_1               (pf3_pci_type0_bar4_mask_31_1),              
    .pf3_pci_type0_bar5_enabled                 (pf3_pci_type0_bar5_enabled),                
    .pf3_pci_type0_bar5_mask_31_0               (pf3_pci_type0_bar5_mask_31_0),              
    .pf3_pci_type0_device_id                    (pf3_pci_type0_device_id),                   
    .pf3_pci_type0_vendor_id                    (pf3_pci_type0_vendor_id),                   
    .pf3_pcie_cap_ep_l0s_accpt_latency          (pf3_pcie_cap_ep_l0s_accpt_latency),         
    .pf3_pcie_cap_ep_l1_accpt_latency           (pf3_pcie_cap_ep_l1_accpt_latency),          
    .pf3_pcie_cap_ext_tag_en                    (pf3_pcie_cap_ext_tag_en),                   
    .pf3_pcie_cap_flr_cap                       (pf3_pcie_cap_flr_cap),                      
    .pf3_pcie_cap_l0s_exit_latency_commclk_dis  (pf3_pcie_cap_l0s_exit_latency_commclk_dis), 
    .pf3_pcie_cap_l1_exit_latency_commclk_dis   (pf3_pcie_cap_l1_exit_latency_commclk_dis),  
    .pf3_pcie_cap_port_num                      (pf3_pcie_cap_port_num),                     
    .pf3_pcie_cap_slot_clk_config               (pf3_pcie_cap_slot_clk_config),              
    .pf3_program_interface                      (pf3_program_interface),                     
    .pf3_prs_ext_cap_enable                     (pf3_prs_ext_cap_enable),                    
    .pf3_prs_ext_cap_outstanding_capacity       (pf3_prs_ext_cap_outstanding_capacity),
    .pf3_revision_id                            (pf3_revision_id),                           
    .pf3_rom_bar_enable                         (pf3_rom_bar_enable),                        
    .pf3_rom_bar_enabled                        (pf3_rom_bar_enabled),
    .pf3_rom_mask                               (pf3_rom_mask),                              
    .pf3_sn_cap_enable                          (pf3_sn_cap_enable),                         
    .pf3_sn_ser_num_reg_1_dw                    (pf3_sn_ser_num_reg_1_dw),                   
    .pf3_sn_ser_num_reg_2_dw                    (pf3_sn_ser_num_reg_2_dw),                   
    .pf3_sriov_cap_sup_page_size                (pf3_sriov_cap_sup_page_size),
    .pf3_sriov_enable                           (pf3_sriov_enable),
    .pf3_sriov_num_vf                           (pf3_sriov_num_vf),
    .pf3_sriov_vf_bar0_enabled                  (pf3_sriov_vf_bar0_enabled),                 
    .pf3_sriov_vf_bar0_mask                     (pf3_sriov_vf_bar0_mask),                    
    .pf3_sriov_vf_bar0_prefetch                 (pf3_sriov_vf_bar0_prefetch),                
    .pf3_sriov_vf_bar0_type                     (pf3_sriov_vf_bar0_type),                    
    .pf3_sriov_vf_bar1_enabled                  (pf3_sriov_vf_bar1_enabled),                 
    .pf3_sriov_vf_bar1_mask                     (pf3_sriov_vf_bar1_mask),                    
    .pf3_sriov_vf_bar1_prefetch                 (pf3_sriov_vf_bar1_prefetch),                
    .pf3_sriov_vf_bar2_enabled                  (pf3_sriov_vf_bar2_enabled),                 
    .pf3_sriov_vf_bar2_mask                     (pf3_sriov_vf_bar2_mask),                    
    .pf3_sriov_vf_bar2_prefetch                 (pf3_sriov_vf_bar2_prefetch),                
    .pf3_sriov_vf_bar2_type                     (pf3_sriov_vf_bar2_type),                    
    .pf3_sriov_vf_bar3_enabled                  (pf3_sriov_vf_bar3_enabled),                 
    .pf3_sriov_vf_bar3_mask                     (pf3_sriov_vf_bar3_mask),                    
    .pf3_sriov_vf_bar3_prefetch                 (pf3_sriov_vf_bar3_prefetch),                
    .pf3_sriov_vf_bar4_enabled                  (pf3_sriov_vf_bar4_enabled),                 
    .pf3_sriov_vf_bar4_mask                     (pf3_sriov_vf_bar4_mask),                    
    .pf3_sriov_vf_bar4_prefetch                 (pf3_sriov_vf_bar4_prefetch),                
    .pf3_sriov_vf_bar4_type                     (pf3_sriov_vf_bar4_type),                    
    .pf3_sriov_vf_bar5_enabled                  (pf3_sriov_vf_bar5_enabled),                 
    .pf3_sriov_vf_bar5_mask                     (pf3_sriov_vf_bar5_mask),                    
    .pf3_sriov_vf_bar5_prefetch                 (pf3_sriov_vf_bar5_prefetch),                
    .pf3_sriov_vf_device_id                     (pf3_sriov_vf_device_id),                    
    .pf3_subclass_code                          (pf3_subclass_code),                         
    .pf3_subsys_dev_id                          (pf3_subsys_dev_id),                         
    .pf3_subsys_vendor_id                       (pf3_subsys_vendor_id),                      
    .pf3_tph_cap_enable                         (pf3_tph_cap_enable),                        
    .pf3_tph_req_cap_int_vec                    (pf3_tph_req_cap_int_vec),                   
    .pf3_tph_req_cap_int_vec_vfcomm_cs2         (pf3_tph_req_cap_int_vec_vfcomm_cs2),        
    .pf3_tph_req_cap_st_table_loc_0_vfcomm_cs2  (pf3_tph_req_cap_st_table_loc_0_vfcomm_cs2), 
    .pf3_tph_req_cap_st_table_loc_1             (pf3_tph_req_cap_st_table_loc_1),            
    .pf3_tph_req_cap_st_table_loc_1_vfcomm_cs2  (pf3_tph_req_cap_st_table_loc_1_vfcomm_cs2), 
    .pf3_tph_req_cap_st_table_size              (pf3_tph_req_cap_st_table_size),             
    .pf3_tph_req_cap_st_table_size_vfcomm_cs2   (pf3_tph_req_cap_st_table_size_vfcomm_cs2),  
    .pf3_tph_req_device_spec                    (pf3_tph_req_device_spec),                   
    .pf3_tph_req_device_spec_vfcomm_cs2         (pf3_tph_req_device_spec_vfcomm_cs2),        
    .pf3_user_vsec_cap_enable                   (pf3_user_vsec_cap_enable),                  
    .pf3_user_vsec_offset                       (pf3_user_vsec_offset),                      
    .pf3_virtio_en                              (pf3_virtio_en),                             
    .pldclk_rate                                (pldclk_rate),                               
    .port_type                                  (port_type),                                 
    .ptm_autoupdate                             (ptm_autoupdate),                            
    .ptm_enable                                 (ptm_enable),
    .rxbuf_limit_bypass                         (rxbuf_limit_bypass),                        
    .sim_mode                                   (sim_mode),                                  
    .sris_enable                                (sris_enable),                               
    .sris_mode                                  (sris_mode),                                 
    .sup_mode                                   (sup_mode),                                  
    .sys_clk_hz                                 (sys_clk_hz),
    .usb_hrc_pulse_sel                          (usb_hrc_pulse_sel),
    .vsec_next_offset                           (vsec_next_offset),                          
    .vsec_select                                (vsec_select)

) pcie_phip_hal_ctrltop_x4 (
    .i_ch0_pcie_ctrl_tx_async                    (i_ch0_pcie_ctrl_tx_async),                   
    .i_ch0_pcie_ctrl_tx_direct                   (i_ch0_pcie_ctrl_tx_direct),                  
    .i_ch0_rst_pld_clrhip                        (i_ch0_rst_pld_clrhip),                       
    .i_ch0_rst_pld_clrpcs                        (i_ch0_rst_pld_clrpcs),                       
    .i_ch0_rst_pld_perstn                        (i_ch0_rst_pld_perstn),                       
    .i_ch0_tx_data                               (i_ch0_tx_data),                              
    .i_ch1_tx_data                               (i_ch1_tx_data),

    .i_ch2_tx_data                               (i_ch2_tx_data),	//PY edit    

    .i_ch3_tx_data                               (i_ch3_tx_data),	//PY edit                              
    .i_ch4_tx_data                               (i_ch4_tx_data),	//PY edit    
                              
//    .i_ch2_tx_data                               (i_ch2_tx_data),                              
//    .i_ch3_tx_data                               (i_ch3_tx_data),                              
//    .i_ch4_tx_data                               (i_ch4_tx_data),                              
//    .i_ch5_tx_data                               (i_ch5_tx_data),                              
//    .i_ch6_tx_data                               (i_ch6_tx_data),                              
//    .i_ch7_tx_data                               (i_ch7_tx_data),                              
//    .i_ch8_tx_data                               (i_ch8_tx_data),                              
    .i_gbl_ctrl_syspll_locked                    (i_gbl_ctrl_syspll_locked),                   
    .i_pcs0_pclk                                 (o_ch0_pcs_pclk),                                
    .i_pin_perst_n                               (i_pin_perst_n),                              
    .i_pld_pcie_clk                              (i_pld_pcie_clk),                             
    .i_rst_ch0_flux0_cpi_cmn_busy                (ss_rst_flux0_cpi_cmn_busy[0]),

    .i_rst_ch1_flux0_cpi_cmn_busy                (ss_rst_flux0_cpi_cmn_busy[1]),	//PY edit    

    .i_rst_ch2_flux0_cpi_cmn_busy                (ss_rst_flux0_cpi_cmn_busy[2]),	//PY edit              
    .i_rst_ch3_flux0_cpi_cmn_busy                (ss_rst_flux0_cpi_cmn_busy[3]),	//PY edit 

    .i_rxpipe0_dirfeedback                       (i_rxpipe0_dirfeedback),                      
    .i_rxpipe0_linkevaluationfeedbackfiguremerit (i_rxpipe0_linkevaluationfeedbackfiguremerit),
    .i_rxpipe0_localfs                           (i_rxpipe0_localfs),                          
    .i_rxpipe0_locallf                           (i_rxpipe0_locallf),                          
    .i_rxpipe0_localtxcoefficientsvalid          (i_rxpipe0_localtxcoefficientsvalid),         
    .i_rxpipe0_localtxpresetcoefficients         (i_rxpipe0_localtxpresetcoefficients),        
    .i_rxpipe0_p2m_bus                           (i_rxpipe0_p2m_bus),                          
    .i_rxpipe0_pclkchangeok                      (i_rxpipe0_pclkchangeok),                     
    .i_rxpipe0_phystatus                         (i_rxpipe0_phystatus),                        
    .i_rxpipe0_rxdata                            (i_rxpipe0_rxdata),                           
    .i_rxpipe0_rxdatak                           (i_rxpipe0_rxdatak),                          
    .i_rxpipe0_rxdatavalid                       (i_rxpipe0_rxdatavalid),                      
    .i_rxpipe0_rxelecidlea                       (i_rxpipe0_rxelecidlea),                      
    .i_rxpipe0_rxstandbystatus                   (i_rxpipe0_rxstandbystatus),                  
    .i_rxpipe0_rxstartblock                      (i_rxpipe0_rxstartblock),                     
    .i_rxpipe0_rxstatus                          (i_rxpipe0_rxstatus),                         
    .i_rxpipe0_rxsyncheader                      (i_rxpipe0_rxsyncheader),                     
    .i_rxpipe0_rxvalid                           (i_rxpipe0_rxvalid),                          
    .i_rxpipe1_dirfeedback                       (i_rxpipe1_dirfeedback),                      
    .i_rxpipe1_linkevaluationfeedbackfiguremerit (i_rxpipe1_linkevaluationfeedbackfiguremerit),
    .i_rxpipe1_localfs                           (i_rxpipe1_localfs),                          
    .i_rxpipe1_locallf                           (i_rxpipe1_locallf),                          
    .i_rxpipe1_localtxcoefficientsvalid          (i_rxpipe1_localtxcoefficientsvalid),         
    .i_rxpipe1_localtxpresetcoefficients         (i_rxpipe1_localtxpresetcoefficients),        
    .i_rxpipe1_p2m_bus                           (i_rxpipe1_p2m_bus),                          
    .i_rxpipe1_pclkchangeok                      (i_rxpipe1_pclkchangeok),                     
    .i_rxpipe1_phystatus                         (i_rxpipe1_phystatus),                        
    .i_rxpipe1_rxdata                            (i_rxpipe1_rxdata),                           
    .i_rxpipe1_rxdatak                           (i_rxpipe1_rxdatak),                          
    .i_rxpipe1_rxdatavalid                       (i_rxpipe1_rxdatavalid),                      
    .i_rxpipe1_rxelecidlea                       (i_rxpipe1_rxelecidlea),                      
    .i_rxpipe1_rxstandbystatus                   (i_rxpipe1_rxstandbystatus),                  
    .i_rxpipe1_rxstartblock                      (i_rxpipe1_rxstartblock),                     
    .i_rxpipe1_rxstatus                          (i_rxpipe1_rxstatus),                         
    .i_rxpipe1_rxsyncheader                      (i_rxpipe1_rxsyncheader),                     
    .i_rxpipe1_rxvalid                           (i_rxpipe1_rxvalid),                          
    .i_rxpipe2_dirfeedback                       (i_rxpipe2_dirfeedback),                      
    .i_rxpipe2_linkevaluationfeedbackfiguremerit (i_rxpipe2_linkevaluationfeedbackfiguremerit),
    .i_rxpipe2_localfs                           (i_rxpipe2_localfs),                          
    .i_rxpipe2_locallf                           (i_rxpipe2_locallf),                          
    .i_rxpipe2_localtxcoefficientsvalid          (i_rxpipe2_localtxcoefficientsvalid),         
    .i_rxpipe2_localtxpresetcoefficients         (i_rxpipe2_localtxpresetcoefficients),        
    .i_rxpipe2_p2m_bus                           (i_rxpipe2_p2m_bus),                          
    .i_rxpipe2_pclkchangeok                      (i_rxpipe2_pclkchangeok),                     
    .i_rxpipe2_phystatus                         (i_rxpipe2_phystatus),                        
    .i_rxpipe2_rxdata                            (i_rxpipe2_rxdata),                           
    .i_rxpipe2_rxdatak                           (i_rxpipe2_rxdatak),                          
    .i_rxpipe2_rxdatavalid                       (i_rxpipe2_rxdatavalid),                      
    .i_rxpipe2_rxelecidlea                       (i_rxpipe2_rxelecidlea),                      
    .i_rxpipe2_rxstandbystatus                   (i_rxpipe2_rxstandbystatus),                  
    .i_rxpipe2_rxstartblock                      (i_rxpipe2_rxstartblock),                     
    .i_rxpipe2_rxstatus                          (i_rxpipe2_rxstatus),                         
    .i_rxpipe2_rxsyncheader                      (i_rxpipe2_rxsyncheader),                     
    .i_rxpipe2_rxvalid                           (i_rxpipe2_rxvalid),                          
    .i_rxpipe3_dirfeedback                       (i_rxpipe3_dirfeedback),                      
    .i_rxpipe3_linkevaluationfeedbackfiguremerit (i_rxpipe3_linkevaluationfeedbackfiguremerit),
    .i_rxpipe3_localfs                           (i_rxpipe3_localfs),                          
    .i_rxpipe3_locallf                           (i_rxpipe3_locallf),                          
    .i_rxpipe3_localtxcoefficientsvalid          (i_rxpipe3_localtxcoefficientsvalid),         
    .i_rxpipe3_localtxpresetcoefficients         (i_rxpipe3_localtxpresetcoefficients),        
    .i_rxpipe3_p2m_bus                           (i_rxpipe3_p2m_bus),                          
    .i_rxpipe3_pclkchangeok                      (i_rxpipe3_pclkchangeok),                     
    .i_rxpipe3_phystatus                         (i_rxpipe3_phystatus),                        
    .i_rxpipe3_rxdata                            (i_rxpipe3_rxdata),                           
    .i_rxpipe3_rxdatak                           (i_rxpipe3_rxdatak),                          
    .i_rxpipe3_rxdatavalid                       (i_rxpipe3_rxdatavalid),                      
    .i_rxpipe3_rxelecidlea                       (i_rxpipe3_rxelecidlea),                      
    .i_rxpipe3_rxstandbystatus                   (i_rxpipe3_rxstandbystatus),                  
    .i_rxpipe3_rxstartblock                      (i_rxpipe3_rxstartblock),                     
    .i_rxpipe3_rxstatus                          (i_rxpipe3_rxstatus),                         
    .i_rxpipe3_rxsyncheader                      (i_rxpipe3_rxsyncheader),                     
    .i_rxpipe3_rxvalid                           (i_rxpipe3_rxvalid),                          
    .i_rxpipe4_dirfeedback                       (i_rxpipe4_dirfeedback),                      
    .i_rxpipe4_linkevaluationfeedbackfiguremerit (i_rxpipe4_linkevaluationfeedbackfiguremerit),
    .i_rxpipe4_localfs                           (i_rxpipe4_localfs),                          
    .i_rxpipe4_locallf                           (i_rxpipe4_locallf),                          
    .i_rxpipe4_localtxcoefficientsvalid          (i_rxpipe4_localtxcoefficientsvalid),         
    .i_rxpipe4_localtxpresetcoefficients         (i_rxpipe4_localtxpresetcoefficients),        
    .i_rxpipe4_p2m_bus                           (i_rxpipe4_p2m_bus),                          
    .i_rxpipe4_pclkchangeok                      (i_rxpipe4_pclkchangeok),                     
    .i_rxpipe4_phystatus                         (i_rxpipe4_phystatus),                        
    .i_rxpipe4_rxdata                            (i_rxpipe4_rxdata),                           
    .i_rxpipe4_rxdatak                           (i_rxpipe4_rxdatak),                          
    .i_rxpipe4_rxdatavalid                       (i_rxpipe4_rxdatavalid),                      
    .i_rxpipe4_rxelecidlea                       (i_rxpipe4_rxelecidlea),                      
    .i_rxpipe4_rxstandbystatus                   (i_rxpipe4_rxstandbystatus),                  
    .i_rxpipe4_rxstartblock                      (i_rxpipe4_rxstartblock),                     
    .i_rxpipe4_rxstatus                          (i_rxpipe4_rxstatus),                         
    .i_rxpipe4_rxsyncheader                      (i_rxpipe4_rxsyncheader),                     
    .i_rxpipe4_rxvalid                           (i_rxpipe4_rxvalid),                          
    .i_rxpipe5_dirfeedback                       (i_rxpipe5_dirfeedback),                      
    .i_rxpipe5_linkevaluationfeedbackfiguremerit (i_rxpipe5_linkevaluationfeedbackfiguremerit),
    .i_rxpipe5_localfs                           (i_rxpipe5_localfs),                          
    .i_rxpipe5_locallf                           (i_rxpipe5_locallf),                          
    .i_rxpipe5_localtxcoefficientsvalid          (i_rxpipe5_localtxcoefficientsvalid),         
    .i_rxpipe5_localtxpresetcoefficients         (i_rxpipe5_localtxpresetcoefficients),        
    .i_rxpipe5_p2m_bus                           (i_rxpipe5_p2m_bus),                          
    .i_rxpipe5_pclkchangeok                      (i_rxpipe5_pclkchangeok),                     
    .i_rxpipe5_phystatus                         (i_rxpipe5_phystatus),                        
    .i_rxpipe5_rxdata                            (i_rxpipe5_rxdata),                           
    .i_rxpipe5_rxdatak                           (i_rxpipe5_rxdatak),                          
    .i_rxpipe5_rxdatavalid                       (i_rxpipe5_rxdatavalid),                      
    .i_rxpipe5_rxelecidlea                       (i_rxpipe5_rxelecidlea),                      
    .i_rxpipe5_rxstandbystatus                   (i_rxpipe5_rxstandbystatus),                  
    .i_rxpipe5_rxstartblock                      (i_rxpipe5_rxstartblock),                     
    .i_rxpipe5_rxstatus                          (i_rxpipe5_rxstatus),                         
    .i_rxpipe5_rxsyncheader                      (i_rxpipe5_rxsyncheader),                     
    .i_rxpipe5_rxvalid                           (i_rxpipe5_rxvalid),                          
    .i_rxpipe6_dirfeedback                       (i_rxpipe6_dirfeedback),                      
    .i_rxpipe6_linkevaluationfeedbackfiguremerit (i_rxpipe6_linkevaluationfeedbackfiguremerit),
    .i_rxpipe6_localfs                           (i_rxpipe6_localfs),                          
    .i_rxpipe6_locallf                           (i_rxpipe6_locallf),                          
    .i_rxpipe6_localtxcoefficientsvalid          (i_rxpipe6_localtxcoefficientsvalid),         
    .i_rxpipe6_localtxpresetcoefficients         (i_rxpipe6_localtxpresetcoefficients),        
    .i_rxpipe6_p2m_bus                           (i_rxpipe6_p2m_bus),                          
    .i_rxpipe6_pclkchangeok                      (i_rxpipe6_pclkchangeok),                     
    .i_rxpipe6_phystatus                         (i_rxpipe6_phystatus),                        
    .i_rxpipe6_rxdata                            (i_rxpipe6_rxdata),                           
    .i_rxpipe6_rxdatak                           (i_rxpipe6_rxdatak),                          
    .i_rxpipe6_rxdatavalid                       (i_rxpipe6_rxdatavalid),                      
    .i_rxpipe6_rxelecidlea                       (i_rxpipe6_rxelecidlea),                      
    .i_rxpipe6_rxstandbystatus                   (i_rxpipe6_rxstandbystatus),                  
    .i_rxpipe6_rxstartblock                      (i_rxpipe6_rxstartblock),                     
    .i_rxpipe6_rxstatus                          (i_rxpipe6_rxstatus),                         
    .i_rxpipe6_rxsyncheader                      (i_rxpipe6_rxsyncheader),                     
    .i_rxpipe6_rxvalid                           (i_rxpipe6_rxvalid),                          
    .i_rxpipe7_dirfeedback                       (i_rxpipe7_dirfeedback),                      
    .i_rxpipe7_linkevaluationfeedbackfiguremerit (i_rxpipe7_linkevaluationfeedbackfiguremerit),
    .i_rxpipe7_localfs                           (i_rxpipe7_localfs),                          
    .i_rxpipe7_locallf                           (i_rxpipe7_locallf),                          
    .i_rxpipe7_localtxcoefficientsvalid          (i_rxpipe7_localtxcoefficientsvalid),         
    .i_rxpipe7_localtxpresetcoefficients         (i_rxpipe7_localtxpresetcoefficients),        
    .i_rxpipe7_p2m_bus                           (i_rxpipe7_p2m_bus),                          
    .i_rxpipe7_pclkchangeok                      (i_rxpipe7_pclkchangeok),                     
    .i_rxpipe7_phystatus                         (i_rxpipe7_phystatus),                        
    .i_rxpipe7_rxdata                            (i_rxpipe7_rxdata),                           
    .i_rxpipe7_rxdatak                           (i_rxpipe7_rxdatak),                          
    .i_rxpipe7_rxdatavalid                       (i_rxpipe7_rxdatavalid),                      
    .i_rxpipe7_rxelecidlea                       (i_rxpipe7_rxelecidlea),                      
    .i_rxpipe7_rxstandbystatus                   (i_rxpipe7_rxstandbystatus),                  
    .i_rxpipe7_rxstartblock                      (i_rxpipe7_rxstartblock),                     
    .i_rxpipe7_rxstatus                          (i_rxpipe7_rxstatus),                         
    .i_rxpipe7_rxsyncheader                      (i_rxpipe7_rxsyncheader),                     
    .i_rxpipe7_rxvalid                           (i_rxpipe7_rxvalid),                          
    .o_ch0_pcie_ctrl_rx_async                    (o_ch0_pcie_ctrl_rx_async),                   
    .o_ch0_pcie_ctrl_rx_direct                   (o_ch0_pcie_ctrl_rx_direct),                  
    .o_ch0_rx_data                               (o_ch0_rx_data),                              
    .o_ch1_rx_data                               (o_ch1_rx_data),

    .o_ch2_rx_data                               (o_ch2_rx_data),//PY edit    

    .o_ch3_rx_data                               (o_ch3_rx_data),	//PY edit                              
    .o_ch4_rx_data                               (o_ch4_rx_data),	//PY edit    
	                              
//    .o_ch2_rx_data                               (o_ch2_rx_data),                              
//    .o_ch3_rx_data                               (o_ch3_rx_data),                              
//    .o_ch4_rx_data                               (o_ch4_rx_data),                              
//    .o_ch5_rx_data                               (o_ch5_rx_data),                              
//    .o_ch6_rx_data                               (o_ch6_rx_data),                              
//    .o_ch7_rx_data                               (o_ch7_rx_data),                              
//    .o_ch8_rx_data                               (o_ch8_rx_data),                              
    .o_pcs0_pipe_rst_n                           (o_pcs0_pipe_rst_n),                          
    .o_pcs1_pipe_rst_n                           (o_pcs1_pipe_rst_n),                          
    .o_pcs2_pipe_rst_n                           (o_pcs2_pipe_rst_n),                          
    .o_pcs3_pipe_rst_n                           (o_pcs3_pipe_rst_n),                          
    .o_pcs4_pipe_rst_n                           (o_pcs4_pipe_rst_n),                          
    .o_pcs5_pipe_rst_n                           (o_pcs5_pipe_rst_n),                          
    .o_pcs6_pipe_rst_n                           (o_pcs6_pipe_rst_n),                          
    .o_pcs7_pipe_rst_n                           (o_pcs7_pipe_rst_n),                          
    .o_txpipe0_asyncpowerchangeack               (o_txpipe0_asyncpowerchangeack),              
    .o_txpipe0_blockaligncontrol                 (o_txpipe0_blockaligncontrol),                
    .o_txpipe0_cfg_hw_auto_sp_dis                (o_txpipe0_cfg_hw_auto_sp_dis),               
    .o_txpipe0_dirchange                         (o_txpipe0_dirchange),                        
    .o_txpipe0_ebuf_mode                         (o_txpipe0_ebuf_mode),                        
    .o_txpipe0_encodedecodebypass                (o_txpipe0_encodedecodebypass),               
    .o_txpipe0_fs                                (o_txpipe0_fs),                               
    .o_txpipe0_getlocalpresetcoefficients        (o_txpipe0_getlocalpresetcoefficients),       
    .o_txpipe0_invalidrequest                    (o_txpipe0_invalidrequest),                   
    .o_txpipe0_lf                                (o_txpipe0_lf),                               
    .o_txpipe0_localpresetindex                  (o_txpipe0_localpresetindex),                 
    .o_txpipe0_lowpin_nt                         (o_txpipe0_lowpin_nt),                        
    .o_txpipe0_m2p_bus                           (o_txpipe0_m2p_bus),                          
    .o_txpipe0_pclk_rate                         (o_txpipe0_pclk_rate),                        
    .o_txpipe0_pclkchangeack                     (o_txpipe0_pclkchangeack),                    
    .o_txpipe0_phy_mode_nt                       (o_txpipe0_phy_mode_nt),                      
    .o_txpipe0_powerdown                         (o_txpipe0_powerdown),                        
    .o_txpipe0_rate                              (o_txpipe0_rate),                             
    .o_txpipe0_rxelecidle_disable_a              (o_txpipe0_rxelecidle_disable_a),             
    .o_txpipe0_rxeqclr                           (o_txpipe0_rxeqclr),                          
    .o_txpipe0_rxeqeval                          (o_txpipe0_rxeqeval),                         
    .o_txpipe0_rxeqinprogress                    (o_txpipe0_rxeqinprogress),                   
    .o_txpipe0_rxeqtraining                      (o_txpipe0_rxeqtraining),                     
    .o_txpipe0_rxpolarity                        (o_txpipe0_rxpolarity),                       
    .o_txpipe0_rxpresethint                      (o_txpipe0_rxpresethint),                     
    .o_txpipe0_rxstandby                         (o_txpipe0_rxstandby),                        
    .o_txpipe0_rxtermination                     (o_txpipe0_rxtermination),                    
    .o_txpipe0_srisenable                        (o_txpipe0_srisenable),                       
    .o_txpipe0_txcmnmode_disable_a               (o_txpipe0_txcmnmode_disable_a),              
    .o_txpipe0_txcompliance                      (o_txpipe0_txcompliance),                     
    .o_txpipe0_txdata                            (o_txpipe0_txdata),                           
    .o_txpipe0_txdatak                           (o_txpipe0_txdatak),                          
    .o_txpipe0_txdatavalid                       (o_txpipe0_txdatavalid),                      
    .o_txpipe0_txdeemph                          (o_txpipe0_txdeemph),                         
    .o_txpipe0_txdtctrx_lb                       (o_txpipe0_txdtctrx_lb),                      
    .o_txpipe0_txelecidle                        (o_txpipe0_txelecidle),                       
    .o_txpipe0_txmargin                          (o_txpipe0_txmargin),                         
    .o_txpipe0_txoneszeros                       (o_txpipe0_txoneszeros),                      
    .o_txpipe0_txstartblock                      (o_txpipe0_txstartblock),                     
    .o_txpipe0_txswing                           (o_txpipe0_txswing),                          
    .o_txpipe0_txsyncheader                      (o_txpipe0_txsyncheader),                     
    .o_txpipe0_width                             (o_txpipe0_width),                            
    .o_txpipe1_asyncpowerchangeack               (o_txpipe1_asyncpowerchangeack),              
    .o_txpipe1_blockaligncontrol                 (o_txpipe1_blockaligncontrol),                
    .o_txpipe1_cfg_hw_auto_sp_dis                (o_txpipe1_cfg_hw_auto_sp_dis),               
    .o_txpipe1_dirchange                         (o_txpipe1_dirchange),                        
    .o_txpipe1_ebuf_mode                         (o_txpipe1_ebuf_mode),                        
    .o_txpipe1_encodedecodebypass                (o_txpipe1_encodedecodebypass),               
    .o_txpipe1_fs                                (o_txpipe1_fs),                               
    .o_txpipe1_getlocalpresetcoefficients        (o_txpipe1_getlocalpresetcoefficients),       
    .o_txpipe1_invalidrequest                    (o_txpipe1_invalidrequest),                   
    .o_txpipe1_lf                                (o_txpipe1_lf),                               
    .o_txpipe1_localpresetindex                  (o_txpipe1_localpresetindex),                 
    .o_txpipe1_lowpin_nt                         (o_txpipe1_lowpin_nt),                        
    .o_txpipe1_m2p_bus                           (o_txpipe1_m2p_bus),                          
    .o_txpipe1_pclk_rate                         (o_txpipe1_pclk_rate),                        
    .o_txpipe1_pclkchangeack                     (o_txpipe1_pclkchangeack),                    
    .o_txpipe1_phy_mode_nt                       (o_txpipe1_phy_mode_nt),                      
    .o_txpipe1_powerdown                         (o_txpipe1_powerdown),                        
    .o_txpipe1_rate                              (o_txpipe1_rate),                             
    .o_txpipe1_rxelecidle_disable_a              (o_txpipe1_rxelecidle_disable_a),             
    .o_txpipe1_rxeqclr                           (o_txpipe1_rxeqclr),                          
    .o_txpipe1_rxeqeval                          (o_txpipe1_rxeqeval),                         
    .o_txpipe1_rxeqinprogress                    (o_txpipe1_rxeqinprogress),                   
    .o_txpipe1_rxeqtraining                      (o_txpipe1_rxeqtraining),                     
    .o_txpipe1_rxpolarity                        (o_txpipe1_rxpolarity),                       
    .o_txpipe1_rxpresethint                      (o_txpipe1_rxpresethint),                     
    .o_txpipe1_rxstandby                         (o_txpipe1_rxstandby),                        
    .o_txpipe1_rxtermination                     (o_txpipe1_rxtermination),                    
    .o_txpipe1_srisenable                        (o_txpipe1_srisenable),                       
    .o_txpipe1_txcmnmode_disable_a               (o_txpipe1_txcmnmode_disable_a),              
    .o_txpipe1_txcompliance                      (o_txpipe1_txcompliance),                     
    .o_txpipe1_txdata                            (o_txpipe1_txdata),                           
    .o_txpipe1_txdatak                           (o_txpipe1_txdatak),                          
    .o_txpipe1_txdatavalid                       (o_txpipe1_txdatavalid),                      
    .o_txpipe1_txdeemph                          (o_txpipe1_txdeemph),                         
    .o_txpipe1_txdtctrx_lb                       (o_txpipe1_txdtctrx_lb),                      
    .o_txpipe1_txelecidle                        (o_txpipe1_txelecidle),                       
    .o_txpipe1_txmargin                          (o_txpipe1_txmargin),                         
    .o_txpipe1_txoneszeros                       (o_txpipe1_txoneszeros),                      
    .o_txpipe1_txstartblock                      (o_txpipe1_txstartblock),                     
    .o_txpipe1_txswing                           (o_txpipe1_txswing),                          
    .o_txpipe1_txsyncheader                      (o_txpipe1_txsyncheader),                     
    .o_txpipe1_width                             (o_txpipe1_width),                            
    .o_txpipe2_asyncpowerchangeack               (o_txpipe2_asyncpowerchangeack),              
    .o_txpipe2_blockaligncontrol                 (o_txpipe2_blockaligncontrol),                
    .o_txpipe2_cfg_hw_auto_sp_dis                (o_txpipe2_cfg_hw_auto_sp_dis),               
    .o_txpipe2_dirchange                         (o_txpipe2_dirchange),                        
    .o_txpipe2_ebuf_mode                         (o_txpipe2_ebuf_mode),                        
    .o_txpipe2_encodedecodebypass                (o_txpipe2_encodedecodebypass),               
    .o_txpipe2_fs                                (o_txpipe2_fs),                               
    .o_txpipe2_getlocalpresetcoefficients        (o_txpipe2_getlocalpresetcoefficients),       
    .o_txpipe2_invalidrequest                    (o_txpipe2_invalidrequest),                   
    .o_txpipe2_lf                                (o_txpipe2_lf),                               
    .o_txpipe2_localpresetindex                  (o_txpipe2_localpresetindex),                 
    .o_txpipe2_lowpin_nt                         (o_txpipe2_lowpin_nt),                        
    .o_txpipe2_m2p_bus                           (o_txpipe2_m2p_bus),                          
    .o_txpipe2_pclk_rate                         (o_txpipe2_pclk_rate),                        
    .o_txpipe2_pclkchangeack                     (o_txpipe2_pclkchangeack),                    
    .o_txpipe2_phy_mode_nt                       (o_txpipe2_phy_mode_nt),                      
    .o_txpipe2_powerdown                         (o_txpipe2_powerdown),                        
    .o_txpipe2_rate                              (o_txpipe2_rate),                             
    .o_txpipe2_rxelecidle_disable_a              (o_txpipe2_rxelecidle_disable_a),             
    .o_txpipe2_rxeqclr                           (o_txpipe2_rxeqclr),                          
    .o_txpipe2_rxeqeval                          (o_txpipe2_rxeqeval),                         
    .o_txpipe2_rxeqinprogress                    (o_txpipe2_rxeqinprogress),                   
    .o_txpipe2_rxeqtraining                      (o_txpipe2_rxeqtraining),                     
    .o_txpipe2_rxpolarity                        (o_txpipe2_rxpolarity),                       
    .o_txpipe2_rxpresethint                      (o_txpipe2_rxpresethint),                     
    .o_txpipe2_rxstandby                         (o_txpipe2_rxstandby),                        
    .o_txpipe2_rxtermination                     (o_txpipe2_rxtermination),                    
    .o_txpipe2_srisenable                        (o_txpipe2_srisenable),                       
    .o_txpipe2_txcmnmode_disable_a               (o_txpipe2_txcmnmode_disable_a),              
    .o_txpipe2_txcompliance                      (o_txpipe2_txcompliance),                     
    .o_txpipe2_txdata                            (o_txpipe2_txdata),                           
    .o_txpipe2_txdatak                           (o_txpipe2_txdatak),                          
    .o_txpipe2_txdatavalid                       (o_txpipe2_txdatavalid),                      
    .o_txpipe2_txdeemph                          (o_txpipe2_txdeemph),                         
    .o_txpipe2_txdtctrx_lb                       (o_txpipe2_txdtctrx_lb),                      
    .o_txpipe2_txelecidle                        (o_txpipe2_txelecidle),                       
    .o_txpipe2_txmargin                          (o_txpipe2_txmargin),                         
    .o_txpipe2_txoneszeros                       (o_txpipe2_txoneszeros),                      
    .o_txpipe2_txstartblock                      (o_txpipe2_txstartblock),                     
    .o_txpipe2_txswing                           (o_txpipe2_txswing),                          
    .o_txpipe2_txsyncheader                      (o_txpipe2_txsyncheader),                     
    .o_txpipe2_width                             (o_txpipe2_width),                            
    .o_txpipe3_asyncpowerchangeack               (o_txpipe3_asyncpowerchangeack),              
    .o_txpipe3_blockaligncontrol                 (o_txpipe3_blockaligncontrol),                
    .o_txpipe3_cfg_hw_auto_sp_dis                (o_txpipe3_cfg_hw_auto_sp_dis),               
    .o_txpipe3_dirchange                         (o_txpipe3_dirchange),                        
    .o_txpipe3_ebuf_mode                         (o_txpipe3_ebuf_mode),                        
    .o_txpipe3_encodedecodebypass                (o_txpipe3_encodedecodebypass),               
    .o_txpipe3_fs                                (o_txpipe3_fs),                               
    .o_txpipe3_getlocalpresetcoefficients        (o_txpipe3_getlocalpresetcoefficients),       
    .o_txpipe3_invalidrequest                    (o_txpipe3_invalidrequest),                   
    .o_txpipe3_lf                                (o_txpipe3_lf),                               
    .o_txpipe3_localpresetindex                  (o_txpipe3_localpresetindex),                 
    .o_txpipe3_lowpin_nt                         (o_txpipe3_lowpin_nt),                        
    .o_txpipe3_m2p_bus                           (o_txpipe3_m2p_bus),                          
    .o_txpipe3_pclk_rate                         (o_txpipe3_pclk_rate),                        
    .o_txpipe3_pclkchangeack                     (o_txpipe3_pclkchangeack),                    
    .o_txpipe3_phy_mode_nt                       (o_txpipe3_phy_mode_nt),                      
    .o_txpipe3_powerdown                         (o_txpipe3_powerdown),                        
    .o_txpipe3_rate                              (o_txpipe3_rate),                             
    .o_txpipe3_rxelecidle_disable_a              (o_txpipe3_rxelecidle_disable_a),             
    .o_txpipe3_rxeqclr                           (o_txpipe3_rxeqclr),                          
    .o_txpipe3_rxeqeval                          (o_txpipe3_rxeqeval),                         
    .o_txpipe3_rxeqinprogress                    (o_txpipe3_rxeqinprogress),                   
    .o_txpipe3_rxeqtraining                      (o_txpipe3_rxeqtraining),                     
    .o_txpipe3_rxpolarity                        (o_txpipe3_rxpolarity),                       
    .o_txpipe3_rxpresethint                      (o_txpipe3_rxpresethint),                     
    .o_txpipe3_rxstandby                         (o_txpipe3_rxstandby),                        
    .o_txpipe3_rxtermination                     (o_txpipe3_rxtermination),                    
    .o_txpipe3_srisenable                        (o_txpipe3_srisenable),                       
    .o_txpipe3_txcmnmode_disable_a               (o_txpipe3_txcmnmode_disable_a),              
    .o_txpipe3_txcompliance                      (o_txpipe3_txcompliance),                     
    .o_txpipe3_txdata                            (o_txpipe3_txdata),                           
    .o_txpipe3_txdatak                           (o_txpipe3_txdatak),                          
    .o_txpipe3_txdatavalid                       (o_txpipe3_txdatavalid),                      
    .o_txpipe3_txdeemph                          (o_txpipe3_txdeemph),                         
    .o_txpipe3_txdtctrx_lb                       (o_txpipe3_txdtctrx_lb),                      
    .o_txpipe3_txelecidle                        (o_txpipe3_txelecidle),                       
    .o_txpipe3_txmargin                          (o_txpipe3_txmargin),                         
    .o_txpipe3_txoneszeros                       (o_txpipe3_txoneszeros),                      
    .o_txpipe3_txstartblock                      (o_txpipe3_txstartblock),                     
    .o_txpipe3_txswing                           (o_txpipe3_txswing),                          
    .o_txpipe3_txsyncheader                      (o_txpipe3_txsyncheader),                     
    .o_txpipe3_width                             (o_txpipe3_width),                            
    .o_txpipe4_asyncpowerchangeack               (o_txpipe4_asyncpowerchangeack),              
    .o_txpipe4_blockaligncontrol                 (o_txpipe4_blockaligncontrol),                
    .o_txpipe4_cfg_hw_auto_sp_dis                (o_txpipe4_cfg_hw_auto_sp_dis),               
    .o_txpipe4_dirchange                         (o_txpipe4_dirchange),                        
    .o_txpipe4_ebuf_mode                         (o_txpipe4_ebuf_mode),                        
    .o_txpipe4_encodedecodebypass                (o_txpipe4_encodedecodebypass),               
    .o_txpipe4_fs                                (o_txpipe4_fs),                               
    .o_txpipe4_getlocalpresetcoefficients        (o_txpipe4_getlocalpresetcoefficients),       
    .o_txpipe4_invalidrequest                    (o_txpipe4_invalidrequest),                   
    .o_txpipe4_lf                                (o_txpipe4_lf),                               
    .o_txpipe4_localpresetindex                  (o_txpipe4_localpresetindex),                 
    .o_txpipe4_lowpin_nt                         (o_txpipe4_lowpin_nt),                        
    .o_txpipe4_m2p_bus                           (o_txpipe4_m2p_bus),                          
    .o_txpipe4_pclk_rate                         (o_txpipe4_pclk_rate),                        
    .o_txpipe4_pclkchangeack                     (o_txpipe4_pclkchangeack),                    
    .o_txpipe4_phy_mode_nt                       (o_txpipe4_phy_mode_nt),                      
    .o_txpipe4_powerdown                         (o_txpipe4_powerdown),                        
    .o_txpipe4_rate                              (o_txpipe4_rate),                             
    .o_txpipe4_rxelecidle_disable_a              (o_txpipe4_rxelecidle_disable_a),             
    .o_txpipe4_rxeqclr                           (o_txpipe4_rxeqclr),                          
    .o_txpipe4_rxeqeval                          (o_txpipe4_rxeqeval),                         
    .o_txpipe4_rxeqinprogress                    (o_txpipe4_rxeqinprogress),                   
    .o_txpipe4_rxeqtraining                      (o_txpipe4_rxeqtraining),                     
    .o_txpipe4_rxpolarity                        (o_txpipe4_rxpolarity),                       
    .o_txpipe4_rxpresethint                      (o_txpipe4_rxpresethint),                     
    .o_txpipe4_rxstandby                         (o_txpipe4_rxstandby),                        
    .o_txpipe4_rxtermination                     (o_txpipe4_rxtermination),                    
    .o_txpipe4_srisenable                        (o_txpipe4_srisenable),                       
    .o_txpipe4_txcmnmode_disable_a               (o_txpipe4_txcmnmode_disable_a),              
    .o_txpipe4_txcompliance                      (o_txpipe4_txcompliance),                     
    .o_txpipe4_txdata                            (o_txpipe4_txdata),                           
    .o_txpipe4_txdatak                           (o_txpipe4_txdatak),                          
    .o_txpipe4_txdatavalid                       (o_txpipe4_txdatavalid),                      
    .o_txpipe4_txdeemph                          (o_txpipe4_txdeemph),                         
    .o_txpipe4_txdtctrx_lb                       (o_txpipe4_txdtctrx_lb),                      
    .o_txpipe4_txelecidle                        (o_txpipe4_txelecidle),                       
    .o_txpipe4_txmargin                          (o_txpipe4_txmargin),                         
    .o_txpipe4_txoneszeros                       (o_txpipe4_txoneszeros),                      
    .o_txpipe4_txstartblock                      (o_txpipe4_txstartblock),                     
    .o_txpipe4_txswing                           (o_txpipe4_txswing),                          
    .o_txpipe4_txsyncheader                      (o_txpipe4_txsyncheader),                     
    .o_txpipe4_width                             (o_txpipe4_width),                            
    .o_txpipe5_asyncpowerchangeack               (o_txpipe5_asyncpowerchangeack),              
    .o_txpipe5_blockaligncontrol                 (o_txpipe5_blockaligncontrol),                
    .o_txpipe5_cfg_hw_auto_sp_dis                (o_txpipe5_cfg_hw_auto_sp_dis),               
    .o_txpipe5_dirchange                         (o_txpipe5_dirchange),                        
    .o_txpipe5_ebuf_mode                         (o_txpipe5_ebuf_mode),                        
    .o_txpipe5_encodedecodebypass                (o_txpipe5_encodedecodebypass),               
    .o_txpipe5_fs                                (o_txpipe5_fs),                               
    .o_txpipe5_getlocalpresetcoefficients        (o_txpipe5_getlocalpresetcoefficients),       
    .o_txpipe5_invalidrequest                    (o_txpipe5_invalidrequest),                   
    .o_txpipe5_lf                                (o_txpipe5_lf),                               
    .o_txpipe5_localpresetindex                  (o_txpipe5_localpresetindex),                 
    .o_txpipe5_lowpin_nt                         (o_txpipe5_lowpin_nt),                        
    .o_txpipe5_m2p_bus                           (o_txpipe5_m2p_bus),                          
    .o_txpipe5_pclk_rate                         (o_txpipe5_pclk_rate),                        
    .o_txpipe5_pclkchangeack                     (o_txpipe5_pclkchangeack),                    
    .o_txpipe5_phy_mode_nt                       (o_txpipe5_phy_mode_nt),                      
    .o_txpipe5_powerdown                         (o_txpipe5_powerdown),                        
    .o_txpipe5_rate                              (o_txpipe5_rate),                             
    .o_txpipe5_rxelecidle_disable_a              (o_txpipe5_rxelecidle_disable_a),             
    .o_txpipe5_rxeqclr                           (o_txpipe5_rxeqclr),                          
    .o_txpipe5_rxeqeval                          (o_txpipe5_rxeqeval),                         
    .o_txpipe5_rxeqinprogress                    (o_txpipe5_rxeqinprogress),                   
    .o_txpipe5_rxeqtraining                      (o_txpipe5_rxeqtraining),                     
    .o_txpipe5_rxpolarity                        (o_txpipe5_rxpolarity),                       
    .o_txpipe5_rxpresethint                      (o_txpipe5_rxpresethint),                     
    .o_txpipe5_rxstandby                         (o_txpipe5_rxstandby),                        
    .o_txpipe5_rxtermination                     (o_txpipe5_rxtermination),                    
    .o_txpipe5_srisenable                        (o_txpipe5_srisenable),                       
    .o_txpipe5_txcmnmode_disable_a               (o_txpipe5_txcmnmode_disable_a),              
    .o_txpipe5_txcompliance                      (o_txpipe5_txcompliance),                     
    .o_txpipe5_txdata                            (o_txpipe5_txdata),                           
    .o_txpipe5_txdatak                           (o_txpipe5_txdatak),                          
    .o_txpipe5_txdatavalid                       (o_txpipe5_txdatavalid),                      
    .o_txpipe5_txdeemph                          (o_txpipe5_txdeemph),                         
    .o_txpipe5_txdtctrx_lb                       (o_txpipe5_txdtctrx_lb),                      
    .o_txpipe5_txelecidle                        (o_txpipe5_txelecidle),                       
    .o_txpipe5_txmargin                          (o_txpipe5_txmargin),                         
    .o_txpipe5_txoneszeros                       (o_txpipe5_txoneszeros),                      
    .o_txpipe5_txstartblock                      (o_txpipe5_txstartblock),                     
    .o_txpipe5_txswing                           (o_txpipe5_txswing),                          
    .o_txpipe5_txsyncheader                      (o_txpipe5_txsyncheader),                     
    .o_txpipe5_width                             (o_txpipe5_width),                            
    .o_txpipe6_asyncpowerchangeack               (o_txpipe6_asyncpowerchangeack),              
    .o_txpipe6_blockaligncontrol                 (o_txpipe6_blockaligncontrol),                
    .o_txpipe6_cfg_hw_auto_sp_dis                (o_txpipe6_cfg_hw_auto_sp_dis),               
    .o_txpipe6_dirchange                         (o_txpipe6_dirchange),                        
    .o_txpipe6_ebuf_mode                         (o_txpipe6_ebuf_mode),                        
    .o_txpipe6_encodedecodebypass                (o_txpipe6_encodedecodebypass),               
    .o_txpipe6_fs                                (o_txpipe6_fs),                               
    .o_txpipe6_getlocalpresetcoefficients        (o_txpipe6_getlocalpresetcoefficients),       
    .o_txpipe6_invalidrequest                    (o_txpipe6_invalidrequest),                   
    .o_txpipe6_lf                                (o_txpipe6_lf),                               
    .o_txpipe6_localpresetindex                  (o_txpipe6_localpresetindex),                 
    .o_txpipe6_lowpin_nt                         (o_txpipe6_lowpin_nt),                        
    .o_txpipe6_m2p_bus                           (o_txpipe6_m2p_bus),                          
    .o_txpipe6_pclk_rate                         (o_txpipe6_pclk_rate),                        
    .o_txpipe6_pclkchangeack                     (o_txpipe6_pclkchangeack),                    
    .o_txpipe6_phy_mode_nt                       (o_txpipe6_phy_mode_nt),                      
    .o_txpipe6_powerdown                         (o_txpipe6_powerdown),                        
    .o_txpipe6_rate                              (o_txpipe6_rate),                             
    .o_txpipe6_rxelecidle_disable_a              (o_txpipe6_rxelecidle_disable_a),             
    .o_txpipe6_rxeqclr                           (o_txpipe6_rxeqclr),                          
    .o_txpipe6_rxeqeval                          (o_txpipe6_rxeqeval),                         
    .o_txpipe6_rxeqinprogress                    (o_txpipe6_rxeqinprogress),                   
    .o_txpipe6_rxeqtraining                      (o_txpipe6_rxeqtraining),                     
    .o_txpipe6_rxpolarity                        (o_txpipe6_rxpolarity),                       
    .o_txpipe6_rxpresethint                      (o_txpipe6_rxpresethint),                     
    .o_txpipe6_rxstandby                         (o_txpipe6_rxstandby),                        
    .o_txpipe6_rxtermination                     (o_txpipe6_rxtermination),                    
    .o_txpipe6_srisenable                        (o_txpipe6_srisenable),                       
    .o_txpipe6_txcmnmode_disable_a               (o_txpipe6_txcmnmode_disable_a),              
    .o_txpipe6_txcompliance                      (o_txpipe6_txcompliance),                     
    .o_txpipe6_txdata                            (o_txpipe6_txdata),                           
    .o_txpipe6_txdatak                           (o_txpipe6_txdatak),                          
    .o_txpipe6_txdatavalid                       (o_txpipe6_txdatavalid),                      
    .o_txpipe6_txdeemph                          (o_txpipe6_txdeemph),                         
    .o_txpipe6_txdtctrx_lb                       (o_txpipe6_txdtctrx_lb),                      
    .o_txpipe6_txelecidle                        (o_txpipe6_txelecidle),                       
    .o_txpipe6_txmargin                          (o_txpipe6_txmargin),                         
    .o_txpipe6_txoneszeros                       (o_txpipe6_txoneszeros),                      
    .o_txpipe6_txstartblock                      (o_txpipe6_txstartblock),                     
    .o_txpipe6_txswing                           (o_txpipe6_txswing),                          
    .o_txpipe6_txsyncheader                      (o_txpipe6_txsyncheader),                     
    .o_txpipe6_width                             (o_txpipe6_width),                            
    .o_txpipe7_asyncpowerchangeack               (o_txpipe7_asyncpowerchangeack),              
    .o_txpipe7_blockaligncontrol                 (o_txpipe7_blockaligncontrol),                
    .o_txpipe7_cfg_hw_auto_sp_dis                (o_txpipe7_cfg_hw_auto_sp_dis),               
    .o_txpipe7_dirchange                         (o_txpipe7_dirchange),                        
    .o_txpipe7_ebuf_mode                         (o_txpipe7_ebuf_mode),                        
    .o_txpipe7_encodedecodebypass                (o_txpipe7_encodedecodebypass),               
    .o_txpipe7_fs                                (o_txpipe7_fs),                               
    .o_txpipe7_getlocalpresetcoefficients        (o_txpipe7_getlocalpresetcoefficients),       
    .o_txpipe7_invalidrequest                    (o_txpipe7_invalidrequest),                   
    .o_txpipe7_lf                                (o_txpipe7_lf),                               
    .o_txpipe7_localpresetindex                  (o_txpipe7_localpresetindex),                 
    .o_txpipe7_lowpin_nt                         (o_txpipe7_lowpin_nt),                        
    .o_txpipe7_m2p_bus                           (o_txpipe7_m2p_bus),                          
    .o_txpipe7_pclk_rate                         (o_txpipe7_pclk_rate),                        
    .o_txpipe7_pclkchangeack                     (o_txpipe7_pclkchangeack),                    
    .o_txpipe7_phy_mode_nt                       (o_txpipe7_phy_mode_nt),                      
    .o_txpipe7_powerdown                         (o_txpipe7_powerdown),                        
    .o_txpipe7_rate                              (o_txpipe7_rate),                             
    .o_txpipe7_rxelecidle_disable_a              (o_txpipe7_rxelecidle_disable_a),             
    .o_txpipe7_rxeqclr                           (o_txpipe7_rxeqclr),                          
    .o_txpipe7_rxeqeval                          (o_txpipe7_rxeqeval),                         
    .o_txpipe7_rxeqinprogress                    (o_txpipe7_rxeqinprogress),                   
    .o_txpipe7_rxeqtraining                      (o_txpipe7_rxeqtraining),                     
    .o_txpipe7_rxpolarity                        (o_txpipe7_rxpolarity),                       
    .o_txpipe7_rxpresethint                      (o_txpipe7_rxpresethint),                     
    .o_txpipe7_rxstandby                         (o_txpipe7_rxstandby),                        
    .o_txpipe7_rxtermination                     (o_txpipe7_rxtermination),                    
    .o_txpipe7_srisenable                        (o_txpipe7_srisenable),                       
    .o_txpipe7_txcmnmode_disable_a               (o_txpipe7_txcmnmode_disable_a),              
    .o_txpipe7_txcompliance                      (o_txpipe7_txcompliance),                     
    .o_txpipe7_txdata                            (o_txpipe7_txdata),                           
    .o_txpipe7_txdatak                           (o_txpipe7_txdatak),                          
    .o_txpipe7_txdatavalid                       (o_txpipe7_txdatavalid),                      
    .o_txpipe7_txdeemph                          (o_txpipe7_txdeemph),                         
    .o_txpipe7_txdtctrx_lb                       (o_txpipe7_txdtctrx_lb),                      
    .o_txpipe7_txelecidle                        (o_txpipe7_txelecidle),                       
    .o_txpipe7_txmargin                          (o_txpipe7_txmargin),                         
    .o_txpipe7_txoneszeros                       (o_txpipe7_txoneszeros),                      
    .o_txpipe7_txstartblock                      (o_txpipe7_txstartblock),                     
    .o_txpipe7_txswing                           (o_txpipe7_txswing),                          
    .o_txpipe7_txsyncheader                      (o_txpipe7_txsyncheader),                     
    .o_txpipe7_width                             (o_txpipe7_width)                             

);

// *************All PIPE Muxes ********************** //

ch4_pipe #(
    .x_mux_sm_hssi_pcie_pcs_clk_mux_0__sel        (sm_hssi_pcie_pcs_clk_mux_0_sel),
    .x_mux_sm_hssi_pcie_pcs_clk_mux_1__sel        (sm_hssi_pcie_pcs_clk_mux_1_sel),
    .x_mux_sm_hssi_pcie_pcs_clk_mux_2__sel        (sm_hssi_pcie_pcs_clk_mux_2_sel),
    .x_mux_sm_hssi_pcie_pcs_clk_mux_3__sel        (sm_hssi_pcie_pcs_clk_mux_3_sel),

    .x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__sel     (sm_hssi_pcie_pcs_hps_clkmux_0_sel),

    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__sel  (sm_hssi_pcie_pcs_hps_demux_0_sel),

    .x_mux_sm_hssi_pcie_pcs_hps_mux_0__sel        (sm_hssi_pcie_pcs_hps_mux_0_sel),

    .x_mux_sm_hssi_pcie_pcs_rst_mux_0__sel        (sm_hssi_pcie_pcs_rst_mux_0_sel),
    .x_mux_sm_hssi_pcie_pcs_rst_mux_1__sel        (sm_hssi_pcie_pcs_rst_mux_1_sel),
    .x_mux_sm_hssi_pcie_pcs_rst_mux_2__sel        (sm_hssi_pcie_pcs_rst_mux_2_sel),
    .x_mux_sm_hssi_pcie_pcs_rst_mux_3__sel        (sm_hssi_pcie_pcs_rst_mux_3_sel),

    .x_mux_sm_hssi_pcie_pcs_rx_demux_0__sel       (sm_hssi_pcie_pcs_rx_demux_0_sel),
    .x_mux_sm_hssi_pcie_pcs_rx_demux_1__sel       (sm_hssi_pcie_pcs_rx_demux_1_sel),
    .x_mux_sm_hssi_pcie_pcs_rx_demux_2__sel       (sm_hssi_pcie_pcs_rx_demux_2_sel),
    .x_mux_sm_hssi_pcie_pcs_rx_demux_3__sel       (sm_hssi_pcie_pcs_rx_demux_3_sel),

    .x_mux_sm_hssi_pcie_pcs_tx_mux_0__sel         (sm_hssi_pcie_pcs_tx_mux_0_sel),
    .x_mux_sm_hssi_pcie_pcs_tx_mux_1__sel         (sm_hssi_pcie_pcs_tx_mux_1_sel),
    .x_mux_sm_hssi_pcie_pcs_tx_mux_2__sel         (sm_hssi_pcie_pcs_tx_mux_2_sel),
    .x_mux_sm_hssi_pcie_pcs_tx_mux_3__sel         (sm_hssi_pcie_pcs_tx_mux_3_sel)
) ch4_pipe_inst (
    .o_pcs_lane0_pclk                                                               (o_ch0_pcs_pclk),
	.o_pcs_lane1_pclk                                                               (o_ch1_pcs_pclk),
	.pcie_pcs_clk_mux_u0__o_clk                                                     (i_ch0_pcs_pclk),
	.pcie_pcs_clk_mux_u1__o_clk                                                     (i_ch1_pcs_pclk),
	.pcie_pcs_clk_mux_u2__o_clk                                                     (i_ch2_pcs_pclk),
	.pcie_pcs_clk_mux_u3__o_clk                                                     (i_ch3_pcs_pclk),

	.x_mux_sm_hssi_pcie_pcs_hps_clkmux_0__o_hps_clk                                 (), //HPS unused. dangling output and tie off input.

    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_ebuf_mode                     ('b0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_powerdown                     ('0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rate                          ('0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxeqtraining                  ('b0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxpolarity                    ('b0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_rxtermination                 ('b0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdata                        ('0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdatak                       ('0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txdtctrx_lb                   ('b0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txelecidle                    ('b0), //HPS unused. dangling output and tie off input.
    .x_decoder_sm_hssi_pcie_pcs_hps_demux_0__i_txpipe_txoneszeros                   ('b0), //HPS unused. dangling output and tie off input.

    .x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_phystatus                           (), //HPS unused. dangling output and tie off input.
    .x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdata                              (), //HPS unused. dangling output and tie off input.
    .x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxdatak                             (), //HPS unused. dangling output and tie off input.
    .x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxelecidle_a                        (), //HPS unused. dangling output and tie off input.
    .x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxstatus                            (), //HPS unused. dangling output and tie off input.
    .x_mux_sm_hssi_pcie_pcs_hps_mux_0__o_rxpipe_rxvalid                             (), //HPS unused. dangling output and tie off input.

    .o_pcs0_pipe_rst_n                                                              (o_pcs0_pipe_rst_n),
    .o_pcs1_pipe_rst_n                                                              (o_pcs1_pipe_rst_n),
    .o_pcs2_pipe_rst_n                                                              (o_pcs2_pipe_rst_n),
    .o_pcs3_pipe_rst_n                                                              (o_pcs3_pipe_rst_n),
    .x_mux_sm_hssi_pcie_pcs_rst_mux_1__i_hps_rst_rstn                               ('b1), //HPS unused. dangling output and tie off input.
    .x_mux_sm_hssi_pcie_pcs_rst_mux_2__i_hps_rst_rstn                               ('b1), //HPS unused. dangling output and tie off input.
	.pcie_pcs_rst_mux_u0__o_rstn                                                    (i_ch0_pcs_pipe_rstn),
	.pcie_pcs_rst_mux_u1__o_rstn                                                    (i_ch1_pcs_pipe_rstn),
	.pcie_pcs_rst_mux_u2__o_rstn                                                    (i_ch2_pcs_pipe_rstn),
	.pcie_pcs_rst_mux_u3__o_rstn                                                    (i_ch3_pcs_pipe_rstn),

    .o_txpipe0_asyncpowerchangeack                                                  (o_txpipe0_asyncpowerchangeack),
    .o_txpipe0_blockaligncontrol                                                    (o_txpipe0_blockaligncontrol),
    .o_txpipe0_cfg_hw_auto_sp_dis                                                   (o_txpipe0_cfg_hw_auto_sp_dis),
    .o_txpipe0_dirchange                                                            (o_txpipe0_dirchange),
    .o_txpipe0_ebuf_mode                                                            (o_txpipe0_ebuf_mode),
    .o_txpipe0_encodedecodebypass                                                   (o_txpipe0_encodedecodebypass),
    .o_txpipe0_fs                                                                   (o_txpipe0_fs),
    .o_txpipe0_getlocalpresetcoefficients                                           (o_txpipe0_getlocalpresetcoefficients),
    .o_txpipe0_invalidrequest                                                       (o_txpipe0_invalidrequest),
    .o_txpipe0_lf                                                                   (o_txpipe0_lf),
    .o_txpipe0_localpresetindex                                                     (o_txpipe0_localpresetindex),
    .o_txpipe0_lowpin_nt                                                            (o_txpipe0_lowpin_nt),
    .o_txpipe0_m2p_bus                                                              (o_txpipe0_m2p_bus),
    .o_txpipe0_pclk_rate                                                            (o_txpipe0_pclk_rate),
    .o_txpipe0_pclkchangeack                                                        (o_txpipe0_pclkchangeack),
    .o_txpipe0_phy_mode_nt                                                          (o_txpipe0_phy_mode_nt),
    .o_txpipe0_powerdown                                                            (o_txpipe0_powerdown),
    .o_txpipe0_rate                                                                 (o_txpipe0_rate),
    .o_txpipe0_rxelecidle_disable_a                                                 (o_txpipe0_rxelecidle_disable_a),
    .o_txpipe0_rxeqclr                                                              (o_txpipe0_rxeqclr),
    .o_txpipe0_rxeqeval                                                             (o_txpipe0_rxeqeval),
    .o_txpipe0_rxeqinprogress                                                       (o_txpipe0_rxeqinprogress),
    .o_txpipe0_rxeqtraining                                                         (o_txpipe0_rxeqtraining),
    .o_txpipe0_rxpolarity                                                           (o_txpipe0_rxpolarity),
    .o_txpipe0_rxpresethint                                                         (o_txpipe0_rxpresethint),
    .o_txpipe0_rxstandby                                                            (o_txpipe0_rxstandby),
    .o_txpipe0_rxtermination                                                        (o_txpipe0_rxtermination),
    .o_txpipe0_srisenable                                                           (o_txpipe0_srisenable),
    .o_txpipe0_txcmnmode_disable_a                                                  (o_txpipe0_txcmnmode_disable_a),
    .o_txpipe0_txcompliance                                                         (o_txpipe0_txcompliance),
    .o_txpipe0_txdata                                                               (o_txpipe0_txdata),
    .o_txpipe0_txdatak                                                              (o_txpipe0_txdatak),
    .o_txpipe0_txdatavalid                                                          (o_txpipe0_txdatavalid),
    .o_txpipe0_txdeemph                                                             (o_txpipe0_txdeemph),
    .o_txpipe0_txdtctrx_lb                                                          (o_txpipe0_txdtctrx_lb),
    .o_txpipe0_txelecidle                                                           (o_txpipe0_txelecidle),
    .o_txpipe0_txmargin                                                             (o_txpipe0_txmargin),
    .o_txpipe0_txoneszeros                                                          (o_txpipe0_txoneszeros),
    .o_txpipe0_txstartblock                                                         (o_txpipe0_txstartblock),
    .o_txpipe0_txswing                                                              (o_txpipe0_txswing),
    .o_txpipe0_txsyncheader                                                         (o_txpipe0_txsyncheader),
    .o_txpipe0_width                                                                (o_txpipe0_width),
    .pcie_pcs_tx_mux_u0__o_txpipe_asyncpowerchangeack                               (i_ch0_txpipe_asyncpowerchangeack),
    .pcie_pcs_tx_mux_u0__o_txpipe_blockaligncontrol                                 (i_ch0_txpipe_blockaligncontrol),
    .pcie_pcs_tx_mux_u0__o_txpipe_cfg_hw_auto_sp_dis                                (i_ch0_txpipe_cfg_hw_auto_sp_dis),
    .pcie_pcs_tx_mux_u0__o_txpipe_dirchange                                         (i_ch0_txpipe_dirchange),
    .pcie_pcs_tx_mux_u0__o_txpipe_ebuf_mode                                         (i_ch0_txpipe_ebuf_mode),
    .pcie_pcs_tx_mux_u0__o_txpipe_encodedecodebypass                                (i_ch0_txpipe_encodedecodebypass),
    .pcie_pcs_tx_mux_u0__o_txpipe_fs                                                (i_ch0_txpipe_fs),
    .pcie_pcs_tx_mux_u0__o_txpipe_getlocalpresetcoefficients                        (i_ch0_txpipe_getlocalpresetcoefficients),
    .pcie_pcs_tx_mux_u0__o_txpipe_invalidrequest                                    (i_ch0_txpipe_invalidrequest),
    .pcie_pcs_tx_mux_u0__o_txpipe_lf                                                (i_ch0_txpipe_lf),
    .pcie_pcs_tx_mux_u0__o_txpipe_localpresetindex                                  (i_ch0_txpipe_localpresetindex),
    .pcie_pcs_tx_mux_u0__o_txpipe_lowpin_nt                                         (i_ch0_txpipe_lowpin_nt),
    .pcie_pcs_tx_mux_u0__o_txpipe_m2p_bus                                           (i_ch0_txpipe_m2p_bus),
    .pcie_pcs_tx_mux_u0__o_txpipe_pclk_rate                                         (i_ch0_txpipe_pclk_rate),
    .pcie_pcs_tx_mux_u0__o_txpipe_pclkchangeack                                     (i_ch0_txpipe_pclkchangeack),
    .pcie_pcs_tx_mux_u0__o_txpipe_phy_mode_nt                                       (i_ch0_txpipe_phy_mode_nt),
    .pcie_pcs_tx_mux_u0__o_txpipe_powerdown                                         (i_ch0_txpipe_powerdown),
    .pcie_pcs_tx_mux_u0__o_txpipe_rate                                              (i_ch0_txpipe_rate),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxelecidle_disable_a                              (i_ch0_txpipe_rxelecidle_disable_a),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxeqclr                                           (i_ch0_txpipe_rxeqclr),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxeqeval                                          (i_ch0_txpipe_rxeqeval),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxeqinprogress                                    (i_ch0_txpipe_rxeqinprogress),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxeqtraining                                      (i_ch0_txpipe_rxeqtraining),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxpolarity                                        (i_ch0_txpipe_rxpolarity),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxpresethint                                      (i_ch0_txpipe_rxpresethint),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxstandby                                         (i_ch0_txpipe_rxstandby),
    .pcie_pcs_tx_mux_u0__o_txpipe_rxtermination                                     (i_ch0_txpipe_rxtermination),
    .pcie_pcs_tx_mux_u0__o_txpipe_srisenable                                        (i_ch0_txpipe_srisenable),
    .pcie_pcs_tx_mux_u0__o_txpipe_txcmnmode_disable_a                               (i_ch0_txpipe_txcmnmode_disable_a),
    .pcie_pcs_tx_mux_u0__o_txpipe_txcompliance                                      (i_ch0_txpipe_txcompliance),
    .pcie_pcs_tx_mux_u0__o_txpipe_txdata                                            (i_ch0_txpipe_txdata),
    .pcie_pcs_tx_mux_u0__o_txpipe_txdatak                                           (i_ch0_txpipe_txdatak),
    .pcie_pcs_tx_mux_u0__o_txpipe_txdatavalid                                       (i_ch0_txpipe_txdatavalid),
    .pcie_pcs_tx_mux_u0__o_txpipe_txdeemph                                          (i_ch0_txpipe_txdeemph),
    .pcie_pcs_tx_mux_u0__o_txpipe_txdtctrx_lb                                       (i_ch0_txpipe_txdtctrx_lb),
    .pcie_pcs_tx_mux_u0__o_txpipe_txelecidle                                        (i_ch0_txpipe_txelecidle),
    .pcie_pcs_tx_mux_u0__o_txpipe_txmargin                                          (i_ch0_txpipe_txmargin),
    .pcie_pcs_tx_mux_u0__o_txpipe_txoneszeros                                       (i_ch0_txpipe_txoneszeros),
    .pcie_pcs_tx_mux_u0__o_txpipe_txstartblock                                      (i_ch0_txpipe_txstartblock),
    .pcie_pcs_tx_mux_u0__o_txpipe_txswing                                           (i_ch0_txpipe_txswing),
    .pcie_pcs_tx_mux_u0__o_txpipe_txsyncheader                                      (i_ch0_txpipe_txsyncheader),
    .pcie_pcs_tx_mux_u0__o_txpipe_width                                             (i_ch0_txpipe_width),
    .o_txpipe1_asyncpowerchangeack                                                  (o_txpipe1_asyncpowerchangeack),
    .o_txpipe1_blockaligncontrol                                                    (o_txpipe1_blockaligncontrol),
    .o_txpipe1_cfg_hw_auto_sp_dis                                                   (o_txpipe1_cfg_hw_auto_sp_dis),
    .o_txpipe1_dirchange                                                            (o_txpipe1_dirchange),
    .o_txpipe1_ebuf_mode                                                            (o_txpipe1_ebuf_mode),
    .o_txpipe1_encodedecodebypass                                                   (o_txpipe1_encodedecodebypass),
    .o_txpipe1_fs                                                                   (o_txpipe1_fs),
    .o_txpipe1_getlocalpresetcoefficients                                           (o_txpipe1_getlocalpresetcoefficients),
    .o_txpipe1_invalidrequest                                                       (o_txpipe1_invalidrequest),
    .o_txpipe1_lf                                                                   (o_txpipe1_lf),
    .o_txpipe1_localpresetindex                                                     (o_txpipe1_localpresetindex),
    .o_txpipe1_lowpin_nt                                                            (o_txpipe1_lowpin_nt),
    .o_txpipe1_m2p_bus                                                              (o_txpipe1_m2p_bus),
    .o_txpipe1_pclk_rate                                                            (o_txpipe1_pclk_rate),
    .o_txpipe1_pclkchangeack                                                        (o_txpipe1_pclkchangeack),
    .o_txpipe1_phy_mode_nt                                                          (o_txpipe1_phy_mode_nt),
    .o_txpipe1_powerdown                                                            (o_txpipe1_powerdown),
    .o_txpipe1_rate                                                                 (o_txpipe1_rate),
    .o_txpipe1_rxelecidle_disable_a                                                 (o_txpipe1_rxelecidle_disable_a),
    .o_txpipe1_rxeqclr                                                              (o_txpipe1_rxeqclr),
    .o_txpipe1_rxeqeval                                                             (o_txpipe1_rxeqeval),
    .o_txpipe1_rxeqinprogress                                                       (o_txpipe1_rxeqinprogress),
    .o_txpipe1_rxeqtraining                                                         (o_txpipe1_rxeqtraining),
    .o_txpipe1_rxpolarity                                                           (o_txpipe1_rxpolarity),
    .o_txpipe1_rxpresethint                                                         (o_txpipe1_rxpresethint),
    .o_txpipe1_rxstandby                                                            (o_txpipe1_rxstandby),
    .o_txpipe1_rxtermination                                                        (o_txpipe1_rxtermination),
    .o_txpipe1_srisenable                                                           (o_txpipe1_srisenable),
    .o_txpipe1_txcmnmode_disable_a                                                  (o_txpipe1_txcmnmode_disable_a),
    .o_txpipe1_txcompliance                                                         (o_txpipe1_txcompliance),
    .o_txpipe1_txdata                                                               (o_txpipe1_txdata),
    .o_txpipe1_txdatak                                                              (o_txpipe1_txdatak),
    .o_txpipe1_txdatavalid                                                          (o_txpipe1_txdatavalid),
    .o_txpipe1_txdeemph                                                             (o_txpipe1_txdeemph),
    .o_txpipe1_txdtctrx_lb                                                          (o_txpipe1_txdtctrx_lb),
    .o_txpipe1_txelecidle                                                           (o_txpipe1_txelecidle),
    .o_txpipe1_txmargin                                                             (o_txpipe1_txmargin),
    .o_txpipe1_txoneszeros                                                          (o_txpipe1_txoneszeros),
    .o_txpipe1_txstartblock                                                         (o_txpipe1_txstartblock),
    .o_txpipe1_txswing                                                              (o_txpipe1_txswing),
    .o_txpipe1_txsyncheader                                                         (o_txpipe1_txsyncheader),
    .o_txpipe1_width                                                                (o_txpipe1_width),
    .pcie_pcs_tx_mux_u1__o_txpipe_asyncpowerchangeack                               (i_ch1_txpipe_asyncpowerchangeack),
    .pcie_pcs_tx_mux_u1__o_txpipe_blockaligncontrol                                 (i_ch1_txpipe_blockaligncontrol),
    .pcie_pcs_tx_mux_u1__o_txpipe_cfg_hw_auto_sp_dis                                (i_ch1_txpipe_cfg_hw_auto_sp_dis),
    .pcie_pcs_tx_mux_u1__o_txpipe_dirchange                                         (i_ch1_txpipe_dirchange),
    .pcie_pcs_tx_mux_u1__o_txpipe_ebuf_mode                                         (i_ch1_txpipe_ebuf_mode),
    .pcie_pcs_tx_mux_u1__o_txpipe_encodedecodebypass                                (i_ch1_txpipe_encodedecodebypass),
    .pcie_pcs_tx_mux_u1__o_txpipe_fs                                                (i_ch1_txpipe_fs),
    .pcie_pcs_tx_mux_u1__o_txpipe_lf                                                (i_ch1_txpipe_lf),
    .pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex                                  (i_ch1_txpipe_localpresetindex),
    .pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus                                           (i_ch1_txpipe_m2p_bus),
    .pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate                                         (i_ch1_txpipe_pclk_rate),
    .pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt                                       (i_ch1_txpipe_phy_mode_nt),
    .pcie_pcs_tx_mux_u1__o_txpipe_powerdown                                         (i_ch1_txpipe_powerdown),
    .pcie_pcs_tx_mux_u1__o_txpipe_rate                                              (i_ch1_txpipe_rate),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint                                      (i_ch1_txpipe_rxpresethint),
    .pcie_pcs_tx_mux_u1__o_txpipe_txdata                                            (i_ch1_txpipe_txdata),
    .pcie_pcs_tx_mux_u1__o_txpipe_txdatak                                           (i_ch1_txpipe_txdatak),
    .pcie_pcs_tx_mux_u1__o_txpipe_txdeemph                                          (i_ch1_txpipe_txdeemph),
    .pcie_pcs_tx_mux_u1__o_txpipe_txmargin                                          (i_ch1_txpipe_txmargin),
    .pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader                                      (i_ch1_txpipe_txsyncheader),
    .pcie_pcs_tx_mux_u1__o_txpipe_width                                             (i_ch1_txpipe_width),
    .pcie_pcs_tx_mux_u2__o_txpipe_fs                                                (i_ch2_txpipe_fs),
    .pcie_pcs_tx_mux_u2__o_txpipe_lf                                                (i_ch2_txpipe_lf),
    .pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex                                  (i_ch2_txpipe_localpresetindex),
    .pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus                                           (i_ch2_txpipe_m2p_bus),
    .pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate                                         (i_ch2_txpipe_pclk_rate),
    .pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt                                       (i_ch2_txpipe_phy_mode_nt),
    .pcie_pcs_tx_mux_u2__o_txpipe_powerdown                                         (i_ch2_txpipe_powerdown),
    .pcie_pcs_tx_mux_u2__o_txpipe_rate                                              (i_ch2_txpipe_rate),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint                                      (i_ch2_txpipe_rxpresethint),
    .pcie_pcs_tx_mux_u2__o_txpipe_txdata                                            (i_ch2_txpipe_txdata),
    .pcie_pcs_tx_mux_u2__o_txpipe_txdatak                                           (i_ch2_txpipe_txdatak),
    .pcie_pcs_tx_mux_u2__o_txpipe_txdeemph                                          (i_ch2_txpipe_txdeemph),
    .pcie_pcs_tx_mux_u2__o_txpipe_txmargin                                          (i_ch2_txpipe_txmargin),
    .pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader                                      (i_ch2_txpipe_txsyncheader),
    .pcie_pcs_tx_mux_u2__o_txpipe_width                                             (i_ch2_txpipe_width),
    .pcie_pcs_tx_mux_u3__o_txpipe_fs                                                (i_ch3_txpipe_fs),
    .pcie_pcs_tx_mux_u3__o_txpipe_lf                                                (i_ch3_txpipe_lf),
    .pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex                                  (i_ch3_txpipe_localpresetindex),
    .pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus                                           (i_ch3_txpipe_m2p_bus),
    .pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate                                         (i_ch3_txpipe_pclk_rate),
    .pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt                                       (i_ch3_txpipe_phy_mode_nt),
    .pcie_pcs_tx_mux_u3__o_txpipe_powerdown                                         (i_ch3_txpipe_powerdown),
    .pcie_pcs_tx_mux_u3__o_txpipe_rate                                              (i_ch3_txpipe_rate),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint                                      (i_ch3_txpipe_rxpresethint),
    .pcie_pcs_tx_mux_u3__o_txpipe_txdata                                            (i_ch3_txpipe_txdata),
    .pcie_pcs_tx_mux_u3__o_txpipe_txdatak                                           (i_ch3_txpipe_txdatak),
    .pcie_pcs_tx_mux_u3__o_txpipe_txdeemph                                          (i_ch3_txpipe_txdeemph),
    .pcie_pcs_tx_mux_u3__o_txpipe_txmargin                                          (i_ch3_txpipe_txmargin),
    .pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader                                      (i_ch3_txpipe_txsyncheader),
    .pcie_pcs_tx_mux_u3__o_txpipe_width                                             (i_ch3_txpipe_width),
    //.pcie_pcs_tx_mux_u1__o_txpipe_fs                                                (i_ch1_txpipe_fs),
    .pcie_pcs_tx_mux_u1__o_txpipe_getlocalpresetcoefficients                        (i_ch1_txpipe_getlocalpresetcoefficients),
    .pcie_pcs_tx_mux_u1__o_txpipe_invalidrequest                                    (i_ch1_txpipe_invalidrequest),
    //.pcie_pcs_tx_mux_u1__o_txpipe_lf                                                (i_ch1_txpipe_lf),
    //.pcie_pcs_tx_mux_u1__o_txpipe_localpresetindex                                  (i_ch1_txpipe_localpresetindex),
    .pcie_pcs_tx_mux_u1__o_txpipe_lowpin_nt                                         (i_ch1_txpipe_lowpin_nt),
    //.pcie_pcs_tx_mux_u1__o_txpipe_m2p_bus                                           (i_ch1_txpipe_m2p_bus),
    //.pcie_pcs_tx_mux_u1__o_txpipe_pclk_rate                                         (i_ch1_txpipe_pclk_rate),
    .pcie_pcs_tx_mux_u1__o_txpipe_pclkchangeack                                     (i_ch1_txpipe_pclkchangeack),
    //.pcie_pcs_tx_mux_u1__o_txpipe_phy_mode_nt                                       (i_ch1_txpipe_phy_mode_nt),
    //.pcie_pcs_tx_mux_u1__o_txpipe_powerdown                                         (i_ch1_txpipe_powerdown),
    //.pcie_pcs_tx_mux_u1__o_txpipe_rate                                              (i_ch1_txpipe_rate),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxelecidle_disable_a                              (i_ch1_txpipe_rxelecidle_disable_a),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxeqclr                                           (i_ch1_txpipe_rxeqclr),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxeqeval                                          (i_ch1_txpipe_rxeqeval),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxeqinprogress                                    (i_ch1_txpipe_rxeqinprogress),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxeqtraining                                      (i_ch1_txpipe_rxeqtraining),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxpolarity                                        (i_ch1_txpipe_rxpolarity),
    //.pcie_pcs_tx_mux_u1__o_txpipe_rxpresethint                                      (i_ch1_txpipe_rxpresethint),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxstandby                                         (i_ch1_txpipe_rxstandby),
    .pcie_pcs_tx_mux_u1__o_txpipe_rxtermination                                     (i_ch1_txpipe_rxtermination),
    .pcie_pcs_tx_mux_u1__o_txpipe_srisenable                                        (i_ch1_txpipe_srisenable),
    .pcie_pcs_tx_mux_u1__o_txpipe_txcmnmode_disable_a                               (i_ch1_txpipe_txcmnmode_disable_a),
    .pcie_pcs_tx_mux_u1__o_txpipe_txcompliance                                      (i_ch1_txpipe_txcompliance),
    //.pcie_pcs_tx_mux_u1__o_txpipe_txdata                                            (i_ch1_txpipe_txdata),
    //.pcie_pcs_tx_mux_u1__o_txpipe_txdatak                                           (i_ch1_txpipe_txdatak),
    .pcie_pcs_tx_mux_u1__o_txpipe_txdatavalid                                       (i_ch1_txpipe_txdatavalid),
    //.pcie_pcs_tx_mux_u1__o_txpipe_txdeemph                                          (i_ch1_txpipe_txdeemph),
    .pcie_pcs_tx_mux_u1__o_txpipe_txdtctrx_lb                                       (i_ch1_txpipe_txdtctrx_lb),
    .pcie_pcs_tx_mux_u1__o_txpipe_txelecidle                                        (i_ch1_txpipe_txelecidle),
    //.pcie_pcs_tx_mux_u1__o_txpipe_txmargin                                          (i_ch1_txpipe_txmargin),
    .pcie_pcs_tx_mux_u1__o_txpipe_txoneszeros                                       (i_ch1_txpipe_txoneszeros),
    .pcie_pcs_tx_mux_u1__o_txpipe_txstartblock                                      (i_ch1_txpipe_txstartblock),
    .pcie_pcs_tx_mux_u1__o_txpipe_txswing                                           (i_ch1_txpipe_txswing),
    //.pcie_pcs_tx_mux_u1__o_txpipe_txsyncheader                                      (i_ch1_txpipe_txsyncheader),
    //.pcie_pcs_tx_mux_u1__o_txpipe_width                                             (i_ch1_txpipe_width),
    .o_txpipe2_asyncpowerchangeack                                                  (o_txpipe2_asyncpowerchangeack),
    .o_txpipe2_blockaligncontrol                                                    (o_txpipe2_blockaligncontrol),
    .o_txpipe2_cfg_hw_auto_sp_dis                                                   (o_txpipe2_cfg_hw_auto_sp_dis),
    .o_txpipe2_dirchange                                                            (o_txpipe2_dirchange),
    .o_txpipe2_ebuf_mode                                                            (o_txpipe2_ebuf_mode),
    .o_txpipe2_encodedecodebypass                                                   (o_txpipe2_encodedecodebypass),
    .o_txpipe2_fs                                                                   (o_txpipe2_fs),
    .o_txpipe2_getlocalpresetcoefficients                                           (o_txpipe2_getlocalpresetcoefficients),
    .o_txpipe2_invalidrequest                                                       (o_txpipe2_invalidrequest),
    .o_txpipe2_lf                                                                   (o_txpipe2_lf),
    .o_txpipe2_localpresetindex                                                     (o_txpipe2_localpresetindex),
    .o_txpipe2_lowpin_nt                                                            (o_txpipe2_lowpin_nt),
    .o_txpipe2_m2p_bus                                                              (o_txpipe2_m2p_bus),
    .o_txpipe2_pclk_rate                                                            (o_txpipe2_pclk_rate),
    .o_txpipe2_pclkchangeack                                                        (o_txpipe2_pclkchangeack),
    .o_txpipe2_phy_mode_nt                                                          (o_txpipe2_phy_mode_nt),
    .o_txpipe2_powerdown                                                            (o_txpipe2_powerdown),
    .o_txpipe2_rate                                                                 (o_txpipe2_rate),
    .o_txpipe2_rxelecidle_disable_a                                                 (o_txpipe2_rxelecidle_disable_a),
    .o_txpipe2_rxeqclr                                                              (o_txpipe2_rxeqclr),
    .o_txpipe2_rxeqeval                                                             (o_txpipe2_rxeqeval),
    .o_txpipe2_rxeqinprogress                                                       (o_txpipe2_rxeqinprogress),
    .o_txpipe2_rxeqtraining                                                         (o_txpipe2_rxeqtraining),
    .o_txpipe2_rxpolarity                                                           (o_txpipe2_rxpolarity),
    .o_txpipe2_rxpresethint                                                         (o_txpipe2_rxpresethint),
    .o_txpipe2_rxstandby                                                            (o_txpipe2_rxstandby),
    .o_txpipe2_rxtermination                                                        (o_txpipe2_rxtermination),
    .o_txpipe2_srisenable                                                           (o_txpipe2_srisenable),
    .o_txpipe2_txcmnmode_disable_a                                                  (o_txpipe2_txcmnmode_disable_a),
    .o_txpipe2_txcompliance                                                         (o_txpipe2_txcompliance),
    .o_txpipe2_txdata                                                               (o_txpipe2_txdata),
    .o_txpipe2_txdatak                                                              (o_txpipe2_txdatak),
    .o_txpipe2_txdatavalid                                                          (o_txpipe2_txdatavalid),
    .o_txpipe2_txdeemph                                                             (o_txpipe2_txdeemph),
    .o_txpipe2_txdtctrx_lb                                                          (o_txpipe2_txdtctrx_lb),
    .o_txpipe2_txelecidle                                                           (o_txpipe2_txelecidle),
    .o_txpipe2_txmargin                                                             (o_txpipe2_txmargin),
    .o_txpipe2_txoneszeros                                                          (o_txpipe2_txoneszeros),
    .o_txpipe2_txstartblock                                                         (o_txpipe2_txstartblock),
    .o_txpipe2_txswing                                                              (o_txpipe2_txswing),
    .o_txpipe2_txsyncheader                                                         (o_txpipe2_txsyncheader),
    .o_txpipe2_width                                                                (o_txpipe2_width),
    .pcie_pcs_tx_mux_u2__o_txpipe_asyncpowerchangeack                               (i_ch2_txpipe_asyncpowerchangeack),
    .pcie_pcs_tx_mux_u2__o_txpipe_blockaligncontrol                                 (i_ch2_txpipe_blockaligncontrol),
    .pcie_pcs_tx_mux_u2__o_txpipe_cfg_hw_auto_sp_dis                                (i_ch2_txpipe_cfg_hw_auto_sp_dis),
    .pcie_pcs_tx_mux_u2__o_txpipe_dirchange                                         (i_ch2_txpipe_dirchange),
    .pcie_pcs_tx_mux_u2__o_txpipe_ebuf_mode                                         (i_ch2_txpipe_ebuf_mode),
    .pcie_pcs_tx_mux_u2__o_txpipe_encodedecodebypass                                (i_ch2_txpipe_encodedecodebypass),
    //.pcie_pcs_tx_mux_u2__o_txpipe_fs                                                (i_ch2_txpipe_fs),
    .pcie_pcs_tx_mux_u2__o_txpipe_getlocalpresetcoefficients                        (i_ch2_txpipe_getlocalpresetcoefficients),
    .pcie_pcs_tx_mux_u2__o_txpipe_invalidrequest                                    (i_ch2_txpipe_invalidrequest),
    //.pcie_pcs_tx_mux_u2__o_txpipe_lf                                                (i_ch2_txpipe_lf),
    //.pcie_pcs_tx_mux_u2__o_txpipe_localpresetindex                                  (i_ch2_txpipe_localpresetindex),
    .pcie_pcs_tx_mux_u2__o_txpipe_lowpin_nt                                         (i_ch2_txpipe_lowpin_nt),
    //.pcie_pcs_tx_mux_u2__o_txpipe_m2p_bus                                           (i_ch2_txpipe_m2p_bus),
    //.pcie_pcs_tx_mux_u2__o_txpipe_pclk_rate                                         (i_ch2_txpipe_pclk_rate),
    .pcie_pcs_tx_mux_u2__o_txpipe_pclkchangeack                                     (i_ch2_txpipe_pclkchangeack),
    //.pcie_pcs_tx_mux_u2__o_txpipe_phy_mode_nt                                       (i_ch2_txpipe_phy_mode_nt),
    //.pcie_pcs_tx_mux_u2__o_txpipe_powerdown                                         (i_ch2_txpipe_powerdown),
    //.pcie_pcs_tx_mux_u2__o_txpipe_rate                                              (i_ch2_txpipe_rate),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxelecidle_disable_a                              (i_ch2_txpipe_rxelecidle_disable_a),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxeqclr                                           (i_ch2_txpipe_rxeqclr),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxeqeval                                          (i_ch2_txpipe_rxeqeval),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxeqinprogress                                    (i_ch2_txpipe_rxeqinprogress),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxeqtraining                                      (i_ch2_txpipe_rxeqtraining),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxpolarity                                        (i_ch2_txpipe_rxpolarity),
    //.pcie_pcs_tx_mux_u2__o_txpipe_rxpresethint                                      (i_ch2_txpipe_rxpresethint),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxstandby                                         (i_ch2_txpipe_rxstandby),
    .pcie_pcs_tx_mux_u2__o_txpipe_rxtermination                                     (i_ch2_txpipe_rxtermination),
    .pcie_pcs_tx_mux_u2__o_txpipe_srisenable                                        (i_ch2_txpipe_srisenable),
    .pcie_pcs_tx_mux_u2__o_txpipe_txcmnmode_disable_a                               (i_ch2_txpipe_txcmnmode_disable_a),
    .pcie_pcs_tx_mux_u2__o_txpipe_txcompliance                                      (i_ch2_txpipe_txcompliance),
    //.pcie_pcs_tx_mux_u2__o_txpipe_txdata                                            (i_ch2_txpipe_txdata),
    //.pcie_pcs_tx_mux_u2__o_txpipe_txdatak                                           (i_ch2_txpipe_txdatak),
    .pcie_pcs_tx_mux_u2__o_txpipe_txdatavalid                                       (i_ch2_txpipe_txdatavalid),
    //.pcie_pcs_tx_mux_u2__o_txpipe_txdeemph                                          (i_ch2_txpipe_txdeemph),
    .pcie_pcs_tx_mux_u2__o_txpipe_txdtctrx_lb                                       (i_ch2_txpipe_txdtctrx_lb),
    .pcie_pcs_tx_mux_u2__o_txpipe_txelecidle                                        (i_ch2_txpipe_txelecidle),
    //.pcie_pcs_tx_mux_u2__o_txpipe_txmargin                                          (i_ch2_txpipe_txmargin),
    .pcie_pcs_tx_mux_u2__o_txpipe_txoneszeros                                       (i_ch2_txpipe_txoneszeros),
    .pcie_pcs_tx_mux_u2__o_txpipe_txstartblock                                      (i_ch2_txpipe_txstartblock),
    .pcie_pcs_tx_mux_u2__o_txpipe_txswing                                           (i_ch2_txpipe_txswing),
    //.pcie_pcs_tx_mux_u2__o_txpipe_txsyncheader                                      (i_ch2_txpipe_txsyncheader),
    //.pcie_pcs_tx_mux_u2__o_txpipe_width                                             (i_ch2_txpipe_width),
    .o_txpipe3_asyncpowerchangeack                                                  (o_txpipe3_asyncpowerchangeack),
    .o_txpipe3_blockaligncontrol                                                    (o_txpipe3_blockaligncontrol),
    .o_txpipe3_cfg_hw_auto_sp_dis                                                   (o_txpipe3_cfg_hw_auto_sp_dis),
    .o_txpipe3_dirchange                                                            (o_txpipe3_dirchange),
    .o_txpipe3_ebuf_mode                                                            (o_txpipe3_ebuf_mode),
    .o_txpipe3_encodedecodebypass                                                   (o_txpipe3_encodedecodebypass),
    .o_txpipe3_fs                                                                   (o_txpipe3_fs),
    .o_txpipe3_getlocalpresetcoefficients                                           (o_txpipe3_getlocalpresetcoefficients),
    .o_txpipe3_invalidrequest                                                       (o_txpipe3_invalidrequest),
    .o_txpipe3_lf                                                                   (o_txpipe3_lf),
    .o_txpipe3_localpresetindex                                                     (o_txpipe3_localpresetindex),
    .o_txpipe3_lowpin_nt                                                            (o_txpipe3_lowpin_nt),
    .o_txpipe3_m2p_bus                                                              (o_txpipe3_m2p_bus),
    .o_txpipe3_pclk_rate                                                            (o_txpipe3_pclk_rate),
    .o_txpipe3_pclkchangeack                                                        (o_txpipe3_pclkchangeack),
    .o_txpipe3_phy_mode_nt                                                          (o_txpipe3_phy_mode_nt),
    .o_txpipe3_powerdown                                                            (o_txpipe3_powerdown),
    .o_txpipe3_rate                                                                 (o_txpipe3_rate),
    .o_txpipe3_rxelecidle_disable_a                                                 (o_txpipe3_rxelecidle_disable_a),
    .o_txpipe3_rxeqclr                                                              (o_txpipe3_rxeqclr),
    .o_txpipe3_rxeqeval                                                             (o_txpipe3_rxeqeval),
    .o_txpipe3_rxeqinprogress                                                       (o_txpipe3_rxeqinprogress),
    .o_txpipe3_rxeqtraining                                                         (o_txpipe3_rxeqtraining),
    .o_txpipe3_rxpolarity                                                           (o_txpipe3_rxpolarity),
    .o_txpipe3_rxpresethint                                                         (o_txpipe3_rxpresethint),
    .o_txpipe3_rxstandby                                                            (o_txpipe3_rxstandby),
    .o_txpipe3_rxtermination                                                        (o_txpipe3_rxtermination),
    .o_txpipe3_srisenable                                                           (o_txpipe3_srisenable),
    .o_txpipe3_txcmnmode_disable_a                                                  (o_txpipe3_txcmnmode_disable_a),
    .o_txpipe3_txcompliance                                                         (o_txpipe3_txcompliance),
    .o_txpipe3_txdata                                                               (o_txpipe3_txdata),
    .o_txpipe3_txdatak                                                              (o_txpipe3_txdatak),
    .o_txpipe3_txdatavalid                                                          (o_txpipe3_txdatavalid),
    .o_txpipe3_txdeemph                                                             (o_txpipe3_txdeemph),
    .o_txpipe3_txdtctrx_lb                                                          (o_txpipe3_txdtctrx_lb),
    .o_txpipe3_txelecidle                                                           (o_txpipe3_txelecidle),
    .o_txpipe3_txmargin                                                             (o_txpipe3_txmargin),
    .o_txpipe3_txoneszeros                                                          (o_txpipe3_txoneszeros),
    .o_txpipe3_txstartblock                                                         (o_txpipe3_txstartblock),
    .o_txpipe3_txswing                                                              (o_txpipe3_txswing),
    .o_txpipe3_txsyncheader                                                         (o_txpipe3_txsyncheader),
    .o_txpipe3_width                                                                (o_txpipe3_width),
    .pcie_pcs_tx_mux_u3__o_txpipe_asyncpowerchangeack                               (i_ch3_txpipe_asyncpowerchangeack),
    .pcie_pcs_tx_mux_u3__o_txpipe_blockaligncontrol                                 (i_ch3_txpipe_blockaligncontrol),
    .pcie_pcs_tx_mux_u3__o_txpipe_cfg_hw_auto_sp_dis                                (i_ch3_txpipe_cfg_hw_auto_sp_dis),
    .pcie_pcs_tx_mux_u3__o_txpipe_dirchange                                         (i_ch3_txpipe_dirchange),
    .pcie_pcs_tx_mux_u3__o_txpipe_ebuf_mode                                         (i_ch3_txpipe_ebuf_mode),
    .pcie_pcs_tx_mux_u3__o_txpipe_encodedecodebypass                                (i_ch3_txpipe_encodedecodebypass),
    //.pcie_pcs_tx_mux_u3__o_txpipe_fs                                                (i_ch3_txpipe_fs),
    .pcie_pcs_tx_mux_u3__o_txpipe_getlocalpresetcoefficients                        (i_ch3_txpipe_getlocalpresetcoefficients),
    .pcie_pcs_tx_mux_u3__o_txpipe_invalidrequest                                    (i_ch3_txpipe_invalidrequest),
    //.pcie_pcs_tx_mux_u3__o_txpipe_lf                                                (i_ch3_txpipe_lf),
    //.pcie_pcs_tx_mux_u3__o_txpipe_localpresetindex                                  (i_ch3_txpipe_localpresetindex),
    .pcie_pcs_tx_mux_u3__o_txpipe_lowpin_nt                                         (i_ch3_txpipe_lowpin_nt),
    //.pcie_pcs_tx_mux_u3__o_txpipe_m2p_bus                                           (i_ch3_txpipe_m2p_bus),
    //.pcie_pcs_tx_mux_u3__o_txpipe_pclk_rate                                         (i_ch3_txpipe_pclk_rate),
    .pcie_pcs_tx_mux_u3__o_txpipe_pclkchangeack                                     (i_ch3_txpipe_pclkchangeack),
    //.pcie_pcs_tx_mux_u3__o_txpipe_phy_mode_nt                                       (i_ch3_txpipe_phy_mode_nt),
    //.pcie_pcs_tx_mux_u3__o_txpipe_powerdown                                         (i_ch3_txpipe_powerdown),
    //.pcie_pcs_tx_mux_u3__o_txpipe_rate                                              (i_ch3_txpipe_rate),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxelecidle_disable_a                              (i_ch3_txpipe_rxelecidle_disable_a),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxeqclr                                           (i_ch3_txpipe_rxeqclr),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxeqeval                                          (i_ch3_txpipe_rxeqeval),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxeqinprogress                                    (i_ch3_txpipe_rxeqinprogress),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxeqtraining                                      (i_ch3_txpipe_rxeqtraining),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxpolarity                                        (i_ch3_txpipe_rxpolarity),
    //.pcie_pcs_tx_mux_u3__o_txpipe_rxpresethint                                      (i_ch3_txpipe_rxpresethint),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxstandby                                         (i_ch3_txpipe_rxstandby),
    .pcie_pcs_tx_mux_u3__o_txpipe_rxtermination                                     (i_ch3_txpipe_rxtermination),
    .pcie_pcs_tx_mux_u3__o_txpipe_srisenable                                        (i_ch3_txpipe_srisenable),
    .pcie_pcs_tx_mux_u3__o_txpipe_txcmnmode_disable_a                               (i_ch3_txpipe_txcmnmode_disable_a),
    .pcie_pcs_tx_mux_u3__o_txpipe_txcompliance                                      (i_ch3_txpipe_txcompliance),
    //.pcie_pcs_tx_mux_u3__o_txpipe_txdata                                            (i_ch3_txpipe_txdata),
    //.pcie_pcs_tx_mux_u3__o_txpipe_txdatak                                           (i_ch3_txpipe_txdatak),
    .pcie_pcs_tx_mux_u3__o_txpipe_txdatavalid                                       (i_ch3_txpipe_txdatavalid),
    //.pcie_pcs_tx_mux_u3__o_txpipe_txdeemph                                          (i_ch3_txpipe_txdeemph),
    .pcie_pcs_tx_mux_u3__o_txpipe_txdtctrx_lb                                       (i_ch3_txpipe_txdtctrx_lb),
    .pcie_pcs_tx_mux_u3__o_txpipe_txelecidle                                        (i_ch3_txpipe_txelecidle),
    //.pcie_pcs_tx_mux_u3__o_txpipe_txmargin                                          (i_ch3_txpipe_txmargin),
    .pcie_pcs_tx_mux_u3__o_txpipe_txoneszeros                                       (i_ch3_txpipe_txoneszeros),
    .pcie_pcs_tx_mux_u3__o_txpipe_txstartblock                                      (i_ch3_txpipe_txstartblock),
    .pcie_pcs_tx_mux_u3__o_txpipe_txswing                                           (i_ch3_txpipe_txswing),
    //.pcie_pcs_tx_mux_u3__o_txpipe_txsyncheader                                      (i_ch3_txpipe_txsyncheader),
    //.pcie_pcs_tx_mux_u3__o_txpipe_width                                             (i_ch3_txpipe_width),

    .pcie_pcs_lane_u0__o_rxpipe_dirfeedback                                         (o_ch0_rxpipe_dirfeedback),
    .pcie_pcs_lane_u0__o_rxpipe_linkevaluationfeedbackfiguremerit                   (o_ch0_rxpipe_linkevaluationfeedbackfiguremerit),
    .pcie_pcs_lane_u0__o_rxpipe_localfs                                             (o_ch0_rxpipe_localfs),
    .pcie_pcs_lane_u0__o_rxpipe_locallf                                             (o_ch0_rxpipe_locallf),
    .pcie_pcs_lane_u0__o_rxpipe_localtxcoefficientsvalid                            (o_ch0_rxpipe_localtxcoefficientsvalid),
    .pcie_pcs_lane_u0__o_rxpipe_localtxpresetcoefficients                           (o_ch0_rxpipe_localtxpresetcoefficients),
    .pcie_pcs_lane_u0__o_rxpipe_p2m_bus                                             (o_ch0_rxpipe_p2m_bus),
    .pcie_pcs_lane_u0__o_rxpipe_pclkchangeok                                        (o_ch0_rxpipe_pclkchangeok),
    .pcie_pcs_lane_u0__o_rxpipe_phystatus                                           (o_ch0_rxpipe_phystatus),
    .pcie_pcs_lane_u0__o_rxpipe_rxdata                                              (o_ch0_rxpipe_rxdata),
    .pcie_pcs_lane_u0__o_rxpipe_rxdatak                                             (o_ch0_rxpipe_rxdatak),
    .pcie_pcs_lane_u0__o_rxpipe_rxdatavalid                                         (o_ch0_rxpipe_rxdatavalid),
    .pcie_pcs_lane_u0__o_rxpipe_rxelecidlea                                         (o_ch0_rxpipe_rxelecidlea),
    .pcie_pcs_lane_u0__o_rxpipe_rxstandbystatus                                     (o_ch0_rxpipe_rxstandbystatus),
    .pcie_pcs_lane_u0__o_rxpipe_rxstartblock                                        (o_ch0_rxpipe_rxstartblock),
    .pcie_pcs_lane_u0__o_rxpipe_rxstatus                                            (o_ch0_rxpipe_rxstatus),
    .pcie_pcs_lane_u0__o_rxpipe_rxsyncheader                                        (o_ch0_rxpipe_rxsyncheader),
    .pcie_pcs_lane_u0__o_rxpipe_rxvalid                                             (o_ch0_rxpipe_rxvalid),
    .o_same_quad_rxpipe0_dirfeedback                                                (i_rxpipe0_dirfeedback),
    .o_same_quad_rxpipe0_linkevaluationfeedbackfiguremerit                          (i_rxpipe0_linkevaluationfeedbackfiguremerit),
    .o_same_quad_rxpipe0_localfs                                                    (i_rxpipe0_localfs),
    .o_same_quad_rxpipe0_locallf                                                    (i_rxpipe0_locallf),
    .o_same_quad_rxpipe0_localtxcoefficientsvalid                                   (i_rxpipe0_localtxcoefficientsvalid),
    .o_same_quad_rxpipe0_localtxpresetcoefficients                                  (i_rxpipe0_localtxpresetcoefficients),
    .o_same_quad_rxpipe0_p2m_bus                                                    (i_rxpipe0_p2m_bus),
    .o_same_quad_rxpipe0_pclkchangeok                                               (i_rxpipe0_pclkchangeok),
    .o_same_quad_rxpipe0_phystatus                                                  (i_rxpipe0_phystatus),
    .o_same_quad_rxpipe0_rxdata                                                     (i_rxpipe0_rxdata),
    .o_same_quad_rxpipe0_rxdatak                                                    (i_rxpipe0_rxdatak),
    .o_same_quad_rxpipe0_rxdatavalid                                                (i_rxpipe0_rxdatavalid),
    .o_same_quad_rxpipe0_rxelecidlea                                                (i_rxpipe0_rxelecidlea),
    .o_same_quad_rxpipe0_rxstandbystatus                                            (i_rxpipe0_rxstandbystatus),
    .o_same_quad_rxpipe0_rxstartblock                                               (i_rxpipe0_rxstartblock),
    .o_same_quad_rxpipe0_rxstatus                                                   (i_rxpipe0_rxstatus),
    .o_same_quad_rxpipe0_rxsyncheader                                               (i_rxpipe0_rxsyncheader),
    .o_same_quad_rxpipe0_rxvalid                                                    (i_rxpipe0_rxvalid),
    .pcie_pcs_lane_u1__o_rxpipe_dirfeedback                                         (o_ch1_rxpipe_dirfeedback),
    .pcie_pcs_lane_u1__o_rxpipe_linkevaluationfeedbackfiguremerit                   (o_ch1_rxpipe_linkevaluationfeedbackfiguremerit),
    .pcie_pcs_lane_u1__o_rxpipe_localfs                                             (o_ch1_rxpipe_localfs),
    .pcie_pcs_lane_u1__o_rxpipe_locallf                                             (o_ch1_rxpipe_locallf),
    .pcie_pcs_lane_u1__o_rxpipe_localtxcoefficientsvalid                            (o_ch1_rxpipe_localtxcoefficientsvalid),
    .pcie_pcs_lane_u1__o_rxpipe_localtxpresetcoefficients                           (o_ch1_rxpipe_localtxpresetcoefficients),
    .pcie_pcs_lane_u1__o_rxpipe_p2m_bus                                             (o_ch1_rxpipe_p2m_bus),
    .pcie_pcs_lane_u1__o_rxpipe_pclkchangeok                                        (o_ch1_rxpipe_pclkchangeok),
    .pcie_pcs_lane_u1__o_rxpipe_phystatus                                           (o_ch1_rxpipe_phystatus),
    .pcie_pcs_lane_u1__o_rxpipe_rxdata                                              (o_ch1_rxpipe_rxdata),
    .pcie_pcs_lane_u1__o_rxpipe_rxdatak                                             (o_ch1_rxpipe_rxdatak),
    .pcie_pcs_lane_u1__o_rxpipe_rxdatavalid                                         (o_ch1_rxpipe_rxdatavalid),
    .pcie_pcs_lane_u1__o_rxpipe_rxelecidlea                                         (o_ch1_rxpipe_rxelecidlea),
    .pcie_pcs_lane_u1__o_rxpipe_rxstandbystatus                                     (o_ch1_rxpipe_rxstandbystatus),
    .pcie_pcs_lane_u1__o_rxpipe_rxstartblock                                        (o_ch1_rxpipe_rxstartblock),
    .pcie_pcs_lane_u1__o_rxpipe_rxstatus                                            (o_ch1_rxpipe_rxstatus),
    .pcie_pcs_lane_u1__o_rxpipe_rxsyncheader                                        (o_ch1_rxpipe_rxsyncheader),
    .pcie_pcs_lane_u1__o_rxpipe_rxvalid                                             (o_ch1_rxpipe_rxvalid),
    .o_same_quad_rxpipe1_dirfeedback                                                (i_rxpipe1_dirfeedback),
    .o_same_quad_rxpipe1_linkevaluationfeedbackfiguremerit                          (i_rxpipe1_linkevaluationfeedbackfiguremerit),
    .o_same_quad_rxpipe1_localfs                                                    (i_rxpipe1_localfs),
    .o_same_quad_rxpipe1_locallf                                                    (i_rxpipe1_locallf),
    .o_same_quad_rxpipe1_localtxcoefficientsvalid                                   (i_rxpipe1_localtxcoefficientsvalid),
    .o_same_quad_rxpipe1_localtxpresetcoefficients                                  (i_rxpipe1_localtxpresetcoefficients),
    .o_same_quad_rxpipe1_p2m_bus                                                    (i_rxpipe1_p2m_bus),
    .o_same_quad_rxpipe1_pclkchangeok                                               (i_rxpipe1_pclkchangeok),
    .o_same_quad_rxpipe1_phystatus                                                  (i_rxpipe1_phystatus),
    .o_same_quad_rxpipe1_rxdata                                                     (i_rxpipe1_rxdata),
    .o_same_quad_rxpipe1_rxdatak                                                    (i_rxpipe1_rxdatak),
    .o_same_quad_rxpipe1_rxdatavalid                                                (i_rxpipe1_rxdatavalid),
    .o_same_quad_rxpipe1_rxelecidlea                                                (i_rxpipe1_rxelecidlea),
    .o_same_quad_rxpipe1_rxstandbystatus                                            (i_rxpipe1_rxstandbystatus),
    .o_same_quad_rxpipe1_rxstartblock                                               (i_rxpipe1_rxstartblock),
    .o_same_quad_rxpipe1_rxstatus                                                   (i_rxpipe1_rxstatus),
    .o_same_quad_rxpipe1_rxsyncheader                                               (i_rxpipe1_rxsyncheader),
    .o_same_quad_rxpipe1_rxvalid                                                    (i_rxpipe1_rxvalid),
    .pcie_pcs_lane_u2__o_rxpipe_dirfeedback                                         (o_ch2_rxpipe_dirfeedback),
    .pcie_pcs_lane_u2__o_rxpipe_linkevaluationfeedbackfiguremerit                   (o_ch2_rxpipe_linkevaluationfeedbackfiguremerit),
    .pcie_pcs_lane_u2__o_rxpipe_localfs                                             (o_ch2_rxpipe_localfs),
    .pcie_pcs_lane_u2__o_rxpipe_locallf                                             (o_ch2_rxpipe_locallf),
    .pcie_pcs_lane_u2__o_rxpipe_localtxcoefficientsvalid                            (o_ch2_rxpipe_localtxcoefficientsvalid),
    .pcie_pcs_lane_u2__o_rxpipe_localtxpresetcoefficients                           (o_ch2_rxpipe_localtxpresetcoefficients),
    .pcie_pcs_lane_u2__o_rxpipe_p2m_bus                                             (o_ch2_rxpipe_p2m_bus),
    .pcie_pcs_lane_u2__o_rxpipe_pclkchangeok                                        (o_ch2_rxpipe_pclkchangeok),
    .pcie_pcs_lane_u2__o_rxpipe_phystatus                                           (o_ch2_rxpipe_phystatus),
    .pcie_pcs_lane_u2__o_rxpipe_rxdata                                              (o_ch2_rxpipe_rxdata),
    .pcie_pcs_lane_u2__o_rxpipe_rxdatak                                             (o_ch2_rxpipe_rxdatak),
    .pcie_pcs_lane_u2__o_rxpipe_rxdatavalid                                         (o_ch2_rxpipe_rxdatavalid),
    .pcie_pcs_lane_u2__o_rxpipe_rxelecidlea                                         (o_ch2_rxpipe_rxelecidlea),
    .pcie_pcs_lane_u2__o_rxpipe_rxstandbystatus                                     (o_ch2_rxpipe_rxstandbystatus),
    .pcie_pcs_lane_u2__o_rxpipe_rxstartblock                                        (o_ch2_rxpipe_rxstartblock),
    .pcie_pcs_lane_u2__o_rxpipe_rxstatus                                            (o_ch2_rxpipe_rxstatus),
    .pcie_pcs_lane_u2__o_rxpipe_rxsyncheader                                        (o_ch2_rxpipe_rxsyncheader),
    .pcie_pcs_lane_u2__o_rxpipe_rxvalid                                             (o_ch2_rxpipe_rxvalid),
    .o_same_quad_rxpipe2_dirfeedback                                                (i_rxpipe2_dirfeedback),
    .o_same_quad_rxpipe2_linkevaluationfeedbackfiguremerit                          (i_rxpipe2_linkevaluationfeedbackfiguremerit),
    .o_same_quad_rxpipe2_localfs                                                    (i_rxpipe2_localfs),
    .o_same_quad_rxpipe2_locallf                                                    (i_rxpipe2_locallf),
    .o_same_quad_rxpipe2_localtxcoefficientsvalid                                   (i_rxpipe2_localtxcoefficientsvalid),
    .o_same_quad_rxpipe2_localtxpresetcoefficients                                  (i_rxpipe2_localtxpresetcoefficients),
    .o_same_quad_rxpipe2_p2m_bus                                                    (i_rxpipe2_p2m_bus),
    .o_same_quad_rxpipe2_pclkchangeok                                               (i_rxpipe2_pclkchangeok),
    .o_same_quad_rxpipe2_phystatus                                                  (i_rxpipe2_phystatus),
    .o_same_quad_rxpipe2_rxdata                                                     (i_rxpipe2_rxdata),
    .o_same_quad_rxpipe2_rxdatak                                                    (i_rxpipe2_rxdatak),
    .o_same_quad_rxpipe2_rxdatavalid                                                (i_rxpipe2_rxdatavalid),
    .o_same_quad_rxpipe2_rxelecidlea                                                (i_rxpipe2_rxelecidlea),
    .o_same_quad_rxpipe2_rxstandbystatus                                            (i_rxpipe2_rxstandbystatus),
    .o_same_quad_rxpipe2_rxstartblock                                               (i_rxpipe2_rxstartblock),
    .o_same_quad_rxpipe2_rxstatus                                                   (i_rxpipe2_rxstatus),
    .o_same_quad_rxpipe2_rxsyncheader                                               (i_rxpipe2_rxsyncheader),
    .o_same_quad_rxpipe2_rxvalid                                                    (i_rxpipe2_rxvalid),
    .pcie_pcs_lane_u3__o_rxpipe_dirfeedback                                         (o_ch3_rxpipe_dirfeedback),
    .pcie_pcs_lane_u3__o_rxpipe_linkevaluationfeedbackfiguremerit                   (o_ch3_rxpipe_linkevaluationfeedbackfiguremerit),
    .pcie_pcs_lane_u3__o_rxpipe_localfs                                             (o_ch3_rxpipe_localfs),
    .pcie_pcs_lane_u3__o_rxpipe_locallf                                             (o_ch3_rxpipe_locallf),
    .pcie_pcs_lane_u3__o_rxpipe_localtxcoefficientsvalid                            (o_ch3_rxpipe_localtxcoefficientsvalid),
    .pcie_pcs_lane_u3__o_rxpipe_localtxpresetcoefficients                           (o_ch3_rxpipe_localtxpresetcoefficients),
    .pcie_pcs_lane_u3__o_rxpipe_p2m_bus                                             (o_ch3_rxpipe_p2m_bus),
    .pcie_pcs_lane_u3__o_rxpipe_pclkchangeok                                        (o_ch3_rxpipe_pclkchangeok),
    .pcie_pcs_lane_u3__o_rxpipe_phystatus                                           (o_ch3_rxpipe_phystatus),
    .pcie_pcs_lane_u3__o_rxpipe_rxdata                                              (o_ch3_rxpipe_rxdata),
    .pcie_pcs_lane_u3__o_rxpipe_rxdatak                                             (o_ch3_rxpipe_rxdatak),
    .pcie_pcs_lane_u3__o_rxpipe_rxdatavalid                                         (o_ch3_rxpipe_rxdatavalid),
    .pcie_pcs_lane_u3__o_rxpipe_rxelecidlea                                         (o_ch3_rxpipe_rxelecidlea),
    .pcie_pcs_lane_u3__o_rxpipe_rxstandbystatus                                     (o_ch3_rxpipe_rxstandbystatus),
    .pcie_pcs_lane_u3__o_rxpipe_rxstartblock                                        (o_ch3_rxpipe_rxstartblock),
    .pcie_pcs_lane_u3__o_rxpipe_rxstatus                                            (o_ch3_rxpipe_rxstatus),
    .pcie_pcs_lane_u3__o_rxpipe_rxsyncheader                                        (o_ch3_rxpipe_rxsyncheader),
    .pcie_pcs_lane_u3__o_rxpipe_rxvalid                                             (o_ch3_rxpipe_rxvalid),
    .o_same_quad_rxpipe3_dirfeedback                                                (i_rxpipe3_dirfeedback),
    .o_same_quad_rxpipe3_linkevaluationfeedbackfiguremerit                          (i_rxpipe3_linkevaluationfeedbackfiguremerit),
    .o_same_quad_rxpipe3_localfs                                                    (i_rxpipe3_localfs),
    .o_same_quad_rxpipe3_locallf                                                    (i_rxpipe3_locallf),
    .o_same_quad_rxpipe3_localtxcoefficientsvalid                                   (i_rxpipe3_localtxcoefficientsvalid),
    .o_same_quad_rxpipe3_localtxpresetcoefficients                                  (i_rxpipe3_localtxpresetcoefficients),
    .o_same_quad_rxpipe3_p2m_bus                                                    (i_rxpipe3_p2m_bus),
    .o_same_quad_rxpipe3_pclkchangeok                                               (i_rxpipe3_pclkchangeok),
    .o_same_quad_rxpipe3_phystatus                                                  (i_rxpipe3_phystatus),
    .o_same_quad_rxpipe3_rxdata                                                     (i_rxpipe3_rxdata),
    .o_same_quad_rxpipe3_rxdatak                                                    (i_rxpipe3_rxdatak),
    .o_same_quad_rxpipe3_rxdatavalid                                                (i_rxpipe3_rxdatavalid),
    .o_same_quad_rxpipe3_rxelecidlea                                                (i_rxpipe3_rxelecidlea),
    .o_same_quad_rxpipe3_rxstandbystatus                                            (i_rxpipe3_rxstandbystatus),
    .o_same_quad_rxpipe3_rxstartblock                                               (i_rxpipe3_rxstartblock),
    .o_same_quad_rxpipe3_rxstatus                                                   (i_rxpipe3_rxstatus),
    .o_same_quad_rxpipe3_rxsyncheader                                               (i_rxpipe3_rxsyncheader),
    .o_same_quad_rxpipe3_rxvalid                                                    (i_rxpipe3_rxvalid)
);


// *************All PHIP Muxes ********************** //

ch4_phip # (
    .x_mux_sm_hssi_pcie_clk_mux_0__sel                                              (sm_hssi_pcie_clk_mux_0_sel),
    .x_mux_sm_hssi_pcie_data_mux_0__sel                                             (sm_hssi_pcie_data_mux_0_sel),
    .x_std_sm_hssi_pld_chnl_dp_0__dr_enabled                                        (sm_hssi_pld_chnl_dp_0_dr_enabled),
    .x_std_sm_hssi_pld_chnl_dp_0__duplex_mode                                       (sm_hssi_pld_chnl_dp_0_duplex_mode),
    .x_std_sm_hssi_pld_chnl_dp_0__pld_channel_identifier                            (sm_hssi_pld_chnl_dp_0_pld_channel_identifier),
    .x_std_sm_hssi_pld_chnl_dp_0__rx_clkout1_divider                                (sm_hssi_pld_chnl_dp_0_rx_clkout1_divider),
    .x_std_sm_hssi_pld_chnl_dp_0__rx_clkout2_divider                                (sm_hssi_pld_chnl_dp_0_rx_clkout2_divider),
    .x_std_sm_hssi_pld_chnl_dp_0__rx_en                                             (sm_hssi_pld_chnl_dp_0_rx_en),
    .x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_mode                                      (sm_hssi_pld_chnl_dp_0_rx_fifo_mode),
    .x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_width                                     (sm_hssi_pld_chnl_dp_0_rx_fifo_width),
    .x_std_sm_hssi_pld_chnl_dp_0__rx_fifo_wr_clk_hz                                 (sm_hssi_pld_chnl_dp_0_rx_fifo_wr_clk_hz),
    .x_std_sm_hssi_pld_chnl_dp_0__rx_user1_clk_dynamic_mux                          (sm_hssi_pld_chnl_dp_0_rx_user1_clk_dynamic_mux),
    .x_std_sm_hssi_pld_chnl_dp_0__rx_user2_clk_dynamic_mux                          (sm_hssi_pld_chnl_dp_0_rx_user2_clk_dynamic_mux),
    .x_std_sm_hssi_pld_chnl_dp_0__sup_mode                                          (sm_hssi_pld_chnl_dp_0_sup_mode),
    .x_std_sm_hssi_pld_chnl_dp_0__tx_clkout1_divider                                (sm_hssi_pld_chnl_dp_0_tx_clkout1_divider),
    .x_std_sm_hssi_pld_chnl_dp_0__tx_clkout2_divider                                (sm_hssi_pld_chnl_dp_0_tx_clkout2_divider),
    .x_std_sm_hssi_pld_chnl_dp_0__tx_en                                             (sm_hssi_pld_chnl_dp_0_tx_en),
    .x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_mode                                      (sm_hssi_pld_chnl_dp_0_tx_fifo_mode),
    .x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_rd_clk_hz                                 (sm_hssi_pld_chnl_dp_0_tx_fifo_rd_clk_hz),
    .x_std_sm_hssi_pld_chnl_dp_0__tx_fifo_width                                     (sm_hssi_pld_chnl_dp_0_tx_fifo_width),
    .x_std_sm_hssi_pld_chnl_dp_0__tx_user1_clk_dynamic_mux                          (sm_hssi_pld_chnl_dp_0_tx_user1_clk_dynamic_mux),
    .x_std_sm_hssi_pld_chnl_dp_0__tx_user2_clk_dynamic_mux                          (sm_hssi_pld_chnl_dp_0_tx_user2_clk_dynamic_mux),
    .x_std_sm_hssi_pld_chnl_dp_0__vc_rx_pldif_wm_en                                 (sm_hssi_pld_chnl_dp_0_vc_rx_pldif_wm_en),
    .x_mux_sm_pld_rx_mux_0__sel                                                     (sm_pld_rx_mux_0_sel),
    .x_decoder_sm_pld_tx_demux_0__sel                                               (sm_pld_tx_demux_0_sel),
    .x_mux_sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0__sel                               (sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0_sel),
    .x_mux_sm_hssi_pld_chnl_tx_fifo_rd_clk_mux_0__sel                               (sm_hssi_pld_chnl_tx_fifo_rd_clk_mux_0_sel)
) ch4_phip_inst (
    .x_mux_sm_hssi_pcie_clk_mux_0__i_bot_clk                                        ('b0),
    .o_local_syspll_c0                                                              (i_syspll_c0_clk),
    .x_mux_sm_hssi_pcie_clk_mux_0__i_top_clk                                        ('b0),
    .o_pld_pcie_clk                                                                 (i_pld_pcie_clk),
    .ss_ctrl_u0__o_pcie_gbl_downward_syspll_locked                                  (),
    .pld_pwr_level_shifter_u0__o_ss_vccl_syspll_locked                              (i_ss_vccl_syspll_locked),
    .pcie_data_mux_u0__o_data                                                       (i_gbl_ctrl_syspll_locked),

    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_addr                                  (i_hio_ch0_lavmm_addr                      ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_wdata                                 (i_hio_ch0_lavmm_wdata                     ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata                             ('0),
    .x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata                             ('0),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_be                                    (i_hio_ch0_lavmm_be                        ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata                                      (i_hio_txdata[0]                           ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async                                (i_hio_uxquad_async[0]                     ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_uxquad_async_pcie_mux                       (i_hio_uxquad_async_pcie_mux[0]            ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_async                                (i_hio_txdata_async [0]                    ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_direct                               (i_hio_txdata_direct[0]                    ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_extra                                (i_hio_txdata_extra[0]                     ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_dl_clk                           (i_hio_ch0_det_lat_rx_dl_clk               ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_mux_select                       (i_hio_ch0_det_lat_rx_mux_select           ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_flop                        (i_hio_ch0_det_lat_rx_sclk_flop            ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_sclk_gen_clk                     (i_hio_ch0_det_lat_rx_sclk_gen_clk         ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_rx_trig_flop                        (i_hio_ch0_det_lat_rx_trig_flop            ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_sampling_clk                        (i_hio_ch0_det_lat_sampling_clk            ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_dl_clk                           (i_hio_ch0_det_lat_tx_dl_clk               ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_mux_select                       (i_hio_ch0_det_lat_tx_mux_select           ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_flop                        (i_hio_ch0_det_lat_tx_sclk_flop            ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_sclk_gen_clk                     (i_hio_ch0_det_lat_tx_sclk_gen_clk         ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_det_lat_tx_trig_flop                        (i_hio_ch0_det_lat_tx_trig_flop            ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_clk                                   (i_hio_ch0_lavmm_clk                       ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_read                                  (i_hio_ch0_lavmm_read                      ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_rstn                                  (i_hio_ch0_lavmm_rstn                      ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_lavmm_write                                 (i_hio_ch0_lavmm_write                     ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_reset_clk_row                           (i_hio_pld_reset_clk_row[0]                ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_rx_clk_in_row_clk                       (i_hio_ch0_pld_rx_clk_in_row_clk           ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_pld_tx_clk_in_row_clk                       (i_hio_ch0_pld_tx_clk_in_row_clk           ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_rx_pld_rst_n                (i_hio_rst_pld_adapter_rx_pld_rst_n[0]     ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_adapter_tx_pld_rst_n                (i_hio_rst_pld_adapter_tx_pld_rst_n[0]     ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrhip                              (i_hio_rst_pld_clrhip[0]                   ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_clrpcs                              (i_hio_rst_pld_clrpcs[0]                   ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_perstn                              (i_hio_rst_pld_perstn[0]                   ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_rst_pld_ready                               (i_hio_rst_pld_ready[0]                    ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_rxdata_fifo_rd_en                           (i_hio_rxdata_fifo_rd_en[0]                ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_hio_txdata_fifo_wr_en                           (i_hio_txdata_fifo_wr_en[0]                ),
    .x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_rdata_valid                       ('b0),
    .x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_ethe_waitreq                           ('b0),
    .x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_rdata_valid                       ('b0),
    .x_std_sm_hssi_pld_chnl_dp_0__i_ss_lavmm_pcie_waitreq                           ('b1),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_addr                              (), //lavmm of phip is not exist,leave dangling.
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_addr                              (),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata                                 (o_hio_ch0_lavmm_rdata                     ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_wdata                             (),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_wdata                             (), //lavmm of phip is not exist,leave dangling.
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_be                                (),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_be                                (), //lavmm of phip is not exist,leave dangling.
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_uxquad_async                                (o_hio_uxquad_async[0]                     ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata                                      (o_hio_rxdata[0]                           ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_async                                (o_hio_rxdata_async[0]                     ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_direct                               (o_hio_rxdata_direct[0]                    ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_extra                                (o_hio_rxdata_extra[0]                     ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_dl_sync                    (o_hio_ch0_det_lat_rx_async_dl_sync        ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_pulse                      (o_hio_ch0_det_lat_rx_async_pulse          ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_async_sample_sync                (o_hio_ch0_det_lat_rx_async_sample_sync    ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_sclk_sample_sync                 (o_hio_ch0_det_lat_rx_sclk_sample_sync     ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_rx_trig_sample_sync                 (o_hio_ch0_det_lat_rx_trig_sample_sync     ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_dl_sync                    (o_hio_ch0_det_lat_tx_async_dl_sync        ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_pulse                      (o_hio_ch0_det_lat_tx_async_pulse          ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_async_sample_sync                (o_hio_ch0_det_lat_tx_async_sample_sync    ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_sclk_sample_sync                 (o_hio_ch0_det_lat_tx_sclk_sample_sync     ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_det_lat_tx_trig_sample_sync                 (o_hio_ch0_det_lat_tx_trig_sample_sync     ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_rdata_valid                           (o_hio_ch0_lavmm_rdata_valid               ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_lavmm_waitreq                               (o_hio_ch0_lavmm_waitreq                   ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_empty                        (o_hio_rxdata_fifo_rd_empty[0]             ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_full                         (o_hio_rxdata_fifo_rd_pempty[0]            ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pempty                       (o_hio_rxdata_fifo_rd_full[0]              ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_rxdata_fifo_rd_pfull                        (o_hio_rxdata_fifo_rd_pfull[0]             ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_empty                        (o_hio_txdata_fifo_wr_empty[0]             ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_full                         (o_hio_txdata_fifo_wr_full[0]              ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pempty                       (o_hio_txdata_fifo_wr_pempty[0]            ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_txdata_fifo_wr_pfull                        (o_hio_txdata_fifo_wr_pfull[0]             ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk1_clk                            (o_hio_pcie_user_rx_clk1_clk                ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_rx_clk2_clk                            (o_hio_pcie_user_rx_clk2_clk                ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk1_clk                            (o_hio_pcie_user_tx_clk1_clk                ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_user_tx_clk2_clk                            (o_hio_pcie_user_tx_clk2_clk                ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_chnl_refclk_mux                          (o_hio_ch0_ux_chnl_refclk_mux              ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_ux_tx_ch_ptr_smpl                           (o_hio_ux_tx_ch_ptr_smpl[0]                ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_rx_latency_pulse                     (o_hio_ch0_xcvrif_rx_latency_pulse         ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_hio_xcvrif_tx_latency_pulse                     (o_hio_ch0_xcvrif_tx_latency_pulse         ),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_clk                               (),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_read                              (),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_rstn                              (),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_ethe_write                             (),
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_clk                               (), //lavmm of phip is not exist,leave dangling.
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_read                              (), //lavmm of phip is not exist,leave dangling.
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_rstn                              (), //lavmm of phip is not exist,leave dangling.
    .x_std_sm_hssi_pld_chnl_dp_0__o_ss_lavmm_pcie_write                             (), //lavmm of phip is not exist,leave dangling.
    .o_ch0_pcie_ctrl_rx_async                                                       (o_ch0_pcie_ctrl_rx_async                  ),
    .o_ch0_pcie_ctrl_rx_direct                                                      (o_ch0_pcie_ctrl_rx_direct                 ),
    .k_user_rx_clk1_c0c1c2_sel                                                      (k_user_rx_clk1_c0c1c2_sel                 ),
    .k_user_rx_clk2_c0c1c2_sel                                                      (k_user_rx_clk2_c0c1c2_sel                 ),
    .k_user_tx_clk1_c0c1c2_sel                                                      (k_user_tx_clk1_c0c1c2_sel                 ),
    .k_user_tx_clk2_c0c1c2_sel                                                      (k_user_tx_clk2_c0c1c2_sel                 ),
    .o_ss_ch0_pcie_ctrl_tx_async                                                    (i_ch0_pcie_ctrl_tx_async                  ),
    .o_ss_ch0_pcie_ctrl_tx_direct                                                   (i_ch0_pcie_ctrl_tx_direct                 ),
    .o_ch0_rx_data                                                                  (o_ch0_rx_data                             ),
    .o_ss_ch0_pcie_tx_data                                                          (i_ch0_tx_data                             ),
//    .o_user_rx_clk1_clk                                                             (ss_user_rx_clk1_clk[0]                    ),
//    .o_user_rx_clk2_clk                                                             (ss_user_rx_clk2_clk[0]                    ),
//    .o_user_tx_clk1_clk                                                             (ss_user_tx_clk1_clk[0]                    ),
//    .o_user_tx_clk2_clk                                                             (ss_user_tx_clk2_clk[0]                    ),
    .o_user_rx_clk1_clk                                                             (ss_user_rx_clk1_clk_w[0]                  ), //KAHUAT_EDIT
    .o_user_rx_clk2_clk                                                             (ss_user_rx_clk2_clk_w[0]                  ), //KAHUAT_EDIT
    .o_user_tx_clk1_clk                                                             (ss_user_tx_clk1_clk_w[0]                  ), //KAHUAT_EDIT
    .o_user_tx_clk2_clk                                                             (ss_user_tx_clk2_clk_w[0]                  ), //KAHUAT_EDIT
    .o_ss_pcie_ch0_rst_pld_clrhip                                                   (i_ch0_rst_pld_clrhip                      ),
    .o_ss_pcie_ch0_rst_pld_clrpcs                                                   (i_ch0_rst_pld_clrpcs                      ),
    .o_ss_pcie_ch0_rst_pld_perstn                                                   (i_ch0_rst_pld_perstn                      ),
    .o_pld_pcie_clk_4                                                               (o_pld_pcie_clk_4                          ),
    .x_mux_sm_hssi_pld_chnl_rx_fifo_wr_clk_mux_0__i_pcie_top                        ('b0)
);

// *************All Muxes taken oustide ********************** //

    tennm_sm_hssi_pld_chnl_user_mux_module x_dynMux_sm_hssi_pld_chnl_user_mux_0 (
        .i_c0               (i_syspll_c0_clk),
        .i_c1               (i_syspll_c1_clk),
        .i_c2               (i_syspll_c2_clk),
        .i_ux               (),
//        .k_dfx_tdr_static_clock_mux(0),                 //0p8 sujoy rtl not available
        .k_c0c1c2_sel       (k_user_rx_clk1_c0c1c2_sel),
        .o_usr_clk          (ss_user_rx_clk1_clk[0])
    );   

    assign ss_user_rx_clk1_clk_w[0] = i_syspll_c0_clk; //KAHUAT_EDIT

    tennm_sm_hssi_pld_chnl_user_mux_module x_dynMux_sm_hssi_pld_chnl_user_mux_1 (
        .i_c0               (i_syspll_c0_clk),
        .i_c1               (i_syspll_c1_clk),
        .i_c2               (i_syspll_c2_clk),
        .i_ux               (),
//        .k_dfx_tdr_static_clock_mux(0),
        .k_c0c1c2_sel       (k_user_rx_clk2_c0c1c2_sel),
        .o_usr_clk          (ss_user_rx_clk2_clk[0])
    );   

    assign ss_user_rx_clk2_clk_w[0] = i_syspll_c0_clk; //KAHUAT_EDIT

    tennm_sm_hssi_pld_chnl_user_mux_module x_dynMux_sm_hssi_pld_chnl_user_mux_2 (
        .i_c0               (i_syspll_c0_clk),
        .i_c1               (i_syspll_c1_clk),
        .i_c2               (i_syspll_c2_clk),
        .i_ux               (),
//        .k_dfx_tdr_static_clock_mux(0),
        .k_c0c1c2_sel       (k_user_tx_clk1_c0c1c2_sel),
        .o_usr_clk          (ss_user_tx_clk1_clk[0])
    );   

    assign ss_user_tx_clk1_clk_w[0] = i_syspll_c0_clk; //KAHUAT_EDIT

    tennm_sm_hssi_pld_chnl_user_mux_module x_dynMux_sm_hssi_pld_chnl_user_mux_3 (
        .i_c0               (i_syspll_c0_clk),
        .i_c1               (i_syspll_c1_clk),
        .i_c2               (i_syspll_c2_clk),
        .i_ux               (),
//        .k_dfx_tdr_static_clock_mux(0),
        .k_c0c1c2_sel       (k_user_tx_clk2_c0c1c2_sel),
        .o_usr_clk          (ss_user_tx_clk2_clk[0])
    );

    assign ss_user_tx_clk2_clk_w[0] = i_syspll_c0_clk; //KAHUAT_EDIT

endmodule


