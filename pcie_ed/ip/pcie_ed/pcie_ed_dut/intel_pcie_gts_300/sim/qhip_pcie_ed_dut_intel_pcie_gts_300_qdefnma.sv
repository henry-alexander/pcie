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



module qhip_pcie_ed_dut_intel_pcie_gts_300_qdefnma  #(

  //SM QHIP sm_pcie_sip_top parameter
  //`include "intel_pcie_sm_qhip_ast_qhip_parameter.iv"

  //HAL TOP phip parameters
  //`include "intel_pcie_hal_top_parameter.iv"
  
   parameter  topology                                                    =   "pcie_x4",

   parameter  core16_tdata_width_integer_hwtcl                            =    256, //new: 256, 128
   //parameter  core16_empty_width_integer_hwtcl                            =    3, //new: tdata_width=256, empty_width=3 .if tdata_width=128, empty_width=2

   parameter  ctop_core16_virtual_rp_ep_mode                               =   "CTOP_CORE4_EP",
   parameter  core16_virtual_tlp_bypass_en_hwtcl                           =     0,
   parameter  core16_total_pf_count_width_hwtcl                            =     1,
   parameter  core16_total_vf_count_width_hwtcl                            =     0,
   //parameter  core16_total_pf_count_hwtcl                                  =     1,
   //parameter  core16_total_vf_count_hwtcl                                  =     1,

   // PCS Reconfig
   parameter  PCS_CONFIG_EN                                               =     0,
   parameter  core16_hip_reconfig_hwtcl                                    =     0,
   parameter  xcvr_reconfig_hwtcl                                         =     0,

   // rx_buffer_limit
   parameter  core16_enable_rx_buffer_limit_ports_hwtcl                  =     1,

   // PTM
   parameter  core16_virtual_ptm_hwtcl                                     =     0,

   // ARI_ACS_FUN_GRP_CAP
   parameter  ctop_core16_pf0_ari_acs_fun_grp_cap                          =     "FALSE", 

   // Debug Toolkit
   parameter  debug_toolkit_hwtcl                                   =   0,
   parameter  enable_pciess_register_access_hwtcl                   =   0,
   parameter  link_insp_en_hwtcl                                    =   0,
   parameter  link_insp_avmm_en_hwtcl                               =   0,
   parameter  core16_perfmon_clk_freq				    =   250,

   //Independent pin perst
   parameter  ctop_virtual_x16_perst_sel                                  =    "CTOP_CMN_HARD_X4",

   // ECC enable
   parameter core16_enable_ecc_hwtcl                                     =     0,

   //USER_MODE_TO_PLD_IN_USE
   parameter  core16_user_mode_to_pld_in_use_hwtcl                       =     0,

   // pld_warm_rst_rdy
   parameter  core16_enable_pld_warm_rst_rdy_hwtcl                       =     0,

   // max payload
   parameter  ctop_core16_virtual_maxpayload_size                        =     "CTOP_CORE16_MAX_PAYLOAD_512",
   
   // ast_parity
   parameter  core16_use_ast_parity_hwtcl                                =     0,
   
   // Power Management
   parameter  core16_enable_power_mgnt_intf_hwtcl                        =     0,

   // Error Interface
   parameter  core16_enable_error_intf_hwtcl                             =     0,
   
   // FLR
   //parameter  core16_flr_cap_hwtcl                                       =     0,
   
   // cpl_timeout
   parameter  core16_enable_cpl_timeout_hwtcl                            =     0,
   
   // multi_func
   parameter  core16_enable_multi_func_hwtcl                               =     0,
   
   // SRIOV
   //parameter  core16_enable_sriov_hwtcl                                    =     0,
   
   // 10-bit tag
   

   // Virtio
   //parameter  core16_enable_virtio_hwtcl                                   =     00,
   parameter  core16_virtio_start_byte_address_hwtcl                       =     8'h48,
   parameter  core16_pf0_virtio_capability_present_hwtcl                   =     00,
   parameter  core16_pf0_virtio_device_specific_cap_present_hwtcl          =     0,
   parameter  core16_pf0_virtio_cmn_config_bar_indicator_hwtcl             =     0,
   parameter  core16_pf0_virtio_cmn_config_bar_offset_hwtcl                =     0,
   parameter  core16_pf0_virtio_cmn_config_structure_length_hwtcl          =     0,
   parameter  core16_pf0_virtio_notification_bar_indicator_hwtcl           =     0,
   parameter  core16_pf0_virtio_notification_bar_offset_hwtcl              =     0,
   parameter  core16_pf0_virtio_notification_structure_length_hwtcl        =     0,
   parameter  core16_pf0_virtio_notify_off_multiplier_hwtcl                =     0,
   parameter  core16_pf0_virtio_isrstatus_bar_indicator_hwtcl              =     0,
   parameter  core16_pf0_virtio_isrstatus_bar_offset_hwtcl                 =     0,
   parameter  core16_pf0_virtio_isrstatus_structure_length_hwtcl           =     0,
   parameter  core16_pf0_virtio_devspecific_bar_indicator_hwtcl            =     0,
   parameter  core16_pf0_virtio_devspecific_bar_offset_hwtcl               =     0,
   parameter  core16_pf0_virtio_devspecific_structure_length_hwtcl         =     0,
   parameter  core16_pf0_virtio_pciconfig_access_bar_indicator_hwtcl       =     0,
   parameter  core16_pf0_virtio_pciconfig_access_bar_offset_hwtcl          =     0,
   parameter  core16_pf0_virtio_pciconfig_access_structure_length_hwtcl    =     0,
   parameter  core16_pf1_virtio_capability_present_hwtcl                   =     0,
   parameter  core16_pf1_virtio_device_specific_cap_present_hwtcl          =     0,
   parameter  core16_pf1_virtio_cmn_config_bar_indicator_hwtcl             =     0,
   parameter  core16_pf1_virtio_cmn_config_bar_offset_hwtcl                =     0,
   parameter  core16_pf1_virtio_cmn_config_structure_length_hwtcl          =     0,
   parameter  core16_pf1_virtio_notification_bar_indicator_hwtcl           =     0,
   parameter  core16_pf1_virtio_notification_bar_offset_hwtcl              =     0,
   parameter  core16_pf1_virtio_notification_structure_length_hwtcl        =     0,
   parameter  core16_pf1_virtio_notify_off_multiplier_hwtcl                =     0,
   parameter  core16_pf1_virtio_isrstatus_bar_indicator_hwtcl              =     0,
   parameter  core16_pf1_virtio_isrstatus_bar_offset_hwtcl                 =     0,
   parameter  core16_pf1_virtio_isrstatus_structure_length_hwtcl           =     0,
   parameter  core16_pf1_virtio_devspecific_bar_indicator_hwtcl            =     0,
   parameter  core16_pf1_virtio_devspecific_bar_offset_hwtcl               =     0,
   parameter  core16_pf1_virtio_devspecific_structure_length_hwtcl         =     0,
   parameter  core16_pf1_virtio_pciconfig_access_bar_indicator_hwtcl       =     0,
   parameter  core16_pf1_virtio_pciconfig_access_bar_offset_hwtcl          =     0,
   parameter  core16_pf1_virtio_pciconfig_access_structure_length_hwtcl    =     0,
   parameter  core16_pf2_virtio_capability_present_hwtcl                   =     0,
   parameter  core16_pf2_virtio_device_specific_cap_present_hwtcl          =     0,
   parameter  core16_pf2_virtio_cmn_config_bar_indicator_hwtcl             =     0,
   parameter  core16_pf2_virtio_cmn_config_bar_offset_hwtcl                =     0,
   parameter  core16_pf2_virtio_cmn_config_structure_length_hwtcl          =     0,
   parameter  core16_pf2_virtio_notification_bar_indicator_hwtcl           =     0,
   parameter  core16_pf2_virtio_notification_bar_offset_hwtcl              =     0,
   parameter  core16_pf2_virtio_notification_structure_length_hwtcl        =     0,
   parameter  core16_pf2_virtio_notify_off_multiplier_hwtcl                =     0,
   parameter  core16_pf2_virtio_isrstatus_bar_indicator_hwtcl              =     0,
   parameter  core16_pf2_virtio_isrstatus_bar_offset_hwtcl                 =     0,
   parameter  core16_pf2_virtio_isrstatus_structure_length_hwtcl           =     0,
   parameter  core16_pf2_virtio_devspecific_bar_indicator_hwtcl            =     0,
   parameter  core16_pf2_virtio_devspecific_bar_offset_hwtcl               =     0,
   parameter  core16_pf2_virtio_devspecific_structure_length_hwtcl         =     0,
   parameter  core16_pf2_virtio_pciconfig_access_bar_indicator_hwtcl       =     0,
   parameter  core16_pf2_virtio_pciconfig_access_bar_offset_hwtcl          =     0,
   parameter  core16_pf2_virtio_pciconfig_access_structure_length_hwtcl    =     0,
   parameter  core16_pf3_virtio_capability_present_hwtcl                   =     0,
   parameter  core16_pf3_virtio_device_specific_cap_present_hwtcl          =     0,
   parameter  core16_pf3_virtio_cmn_config_bar_indicator_hwtcl             =     0,
   parameter  core16_pf3_virtio_cmn_config_bar_offset_hwtcl                =     0,
   parameter  core16_pf3_virtio_cmn_config_structure_length_hwtcl          =     0,
   parameter  core16_pf3_virtio_notification_bar_indicator_hwtcl           =     0,
   parameter  core16_pf3_virtio_notification_bar_offset_hwtcl              =     0,
   parameter  core16_pf3_virtio_notification_structure_length_hwtcl        =     0,
   parameter  core16_pf3_virtio_notify_off_multiplier_hwtcl                =     0,
   parameter  core16_pf3_virtio_isrstatus_bar_indicator_hwtcl              =     0,
   parameter  core16_pf3_virtio_isrstatus_bar_offset_hwtcl                 =     0,
   parameter  core16_pf3_virtio_isrstatus_structure_length_hwtcl           =     0,
   parameter  core16_pf3_virtio_devspecific_bar_indicator_hwtcl            =     0,
   parameter  core16_pf3_virtio_devspecific_bar_offset_hwtcl               =     0,
   parameter  core16_pf3_virtio_devspecific_structure_length_hwtcl         =     0,
   parameter  core16_pf3_virtio_pciconfig_access_bar_indicator_hwtcl       =     0,
   parameter  core16_pf3_virtio_pciconfig_access_bar_offset_hwtcl          =     0,
   parameter  core16_pf3_virtio_pciconfig_access_structure_length_hwtcl    =     0,
   parameter  core16_pf0vf_virtio_capability_present_hwtcl                 =     0,
   parameter  core16_pf0vf_virtio_device_specific_cap_present_hwtcl        =     0,
   parameter  core16_pf0vf_virtio_cmn_config_bar_indicator_hwtcl           =     0,
   parameter  core16_pf0vf_virtio_cmn_config_bar_offset_hwtcl              =     0,
   parameter  core16_pf0vf_virtio_cmn_config_structure_length_hwtcl        =     0,
   parameter  core16_pf0vf_virtio_notification_bar_indicator_hwtcl         =     0,
   parameter  core16_pf0vf_virtio_notification_bar_offset_hwtcl            =     0,
   parameter  core16_pf0vf_virtio_notification_structure_length_hwtcl      =     0,
   parameter  core16_pf0vf_virtio_notify_off_multiplier_hwtcl              =     0,
   parameter  core16_pf0vf_virtio_isrstatus_bar_indicator_hwtcl            =     0,
   parameter  core16_pf0vf_virtio_isrstatus_bar_offset_hwtcl               =     0,
   parameter  core16_pf0vf_virtio_isrstatus_structure_length_hwtcl         =     0,
   parameter  core16_pf0vf_virtio_devspecific_bar_indicator_hwtcl          =     0,
   parameter  core16_pf0vf_virtio_devspecific_bar_offset_hwtcl             =     0,
   parameter  core16_pf0vf_virtio_devspecific_structure_length_hwtcl       =     0,
   parameter  core16_pf0vf_virtio_pciconfig_access_bar_indicator_hwtcl     =     0,
   parameter  core16_pf0vf_virtio_pciconfig_access_bar_offset_hwtcl        =     0,
   parameter  core16_pf0vf_virtio_pciconfig_access_structure_length_hwtcl  =     0,
   parameter  core16_pf1vf_virtio_capability_present_hwtcl                 =     0,
   parameter  core16_pf1vf_virtio_device_specific_cap_present_hwtcl        =     0,
   parameter  core16_pf1vf_virtio_cmn_config_bar_indicator_hwtcl           =     0,
   parameter  core16_pf1vf_virtio_cmn_config_bar_offset_hwtcl              =     0,
   parameter  core16_pf1vf_virtio_cmn_config_structure_length_hwtcl        =     0,
   parameter  core16_pf1vf_virtio_notification_bar_indicator_hwtcl         =     0,
   parameter  core16_pf1vf_virtio_notification_bar_offset_hwtcl            =     0,
   parameter  core16_pf1vf_virtio_notification_structure_length_hwtcl      =     0,
   parameter  core16_pf1vf_virtio_notify_off_multiplier_hwtcl              =     0,
   parameter  core16_pf1vf_virtio_isrstatus_bar_indicator_hwtcl            =     0,
   parameter  core16_pf1vf_virtio_isrstatus_bar_offset_hwtcl               =     0,
   parameter  core16_pf1vf_virtio_isrstatus_structure_length_hwtcl         =     0,
   parameter  core16_pf1vf_virtio_devspecific_bar_indicator_hwtcl          =     0,
   parameter  core16_pf1vf_virtio_devspecific_bar_offset_hwtcl             =     0,
   parameter  core16_pf1vf_virtio_devspecific_structure_length_hwtcl       =     0,
   parameter  core16_pf1vf_virtio_pciconfig_access_bar_indicator_hwtcl     =     0,
   parameter  core16_pf1vf_virtio_pciconfig_access_bar_offset_hwtcl        =     0,
   parameter  core16_pf1vf_virtio_pciconfig_access_structure_length_hwtcl  =     0,
   parameter  core16_pf2vf_virtio_capability_present_hwtcl                 =     0,
   parameter  core16_pf2vf_virtio_device_specific_cap_present_hwtcl        =     0,
   parameter  core16_pf2vf_virtio_cmn_config_bar_indicator_hwtcl           =     0,
   parameter  core16_pf2vf_virtio_cmn_config_bar_offset_hwtcl              =     0,
   parameter  core16_pf2vf_virtio_cmn_config_structure_length_hwtcl        =     0,
   parameter  core16_pf2vf_virtio_notification_bar_indicator_hwtcl         =     0,
   parameter  core16_pf2vf_virtio_notification_bar_offset_hwtcl            =     0,
   parameter  core16_pf2vf_virtio_notification_structure_length_hwtcl      =     0,
   parameter  core16_pf2vf_virtio_notify_off_multiplier_hwtcl              =     0,
   parameter  core16_pf2vf_virtio_isrstatus_bar_indicator_hwtcl            =     0,
   parameter  core16_pf2vf_virtio_isrstatus_bar_offset_hwtcl               =     0,
   parameter  core16_pf2vf_virtio_isrstatus_structure_length_hwtcl         =     0,
   parameter  core16_pf2vf_virtio_devspecific_bar_indicator_hwtcl          =     0,
   parameter  core16_pf2vf_virtio_devspecific_bar_offset_hwtcl             =     0,
   parameter  core16_pf2vf_virtio_devspecific_structure_length_hwtcl       =     0,
   parameter  core16_pf2vf_virtio_pciconfig_access_bar_indicator_hwtcl     =     0,
   parameter  core16_pf2vf_virtio_pciconfig_access_bar_offset_hwtcl        =     0,
   parameter  core16_pf2vf_virtio_pciconfig_access_structure_length_hwtcl  =     0,
   parameter  core16_pf3vf_virtio_capability_present_hwtcl                 =     0,
   parameter  core16_pf3vf_virtio_device_specific_cap_present_hwtcl        =     0,
   parameter  core16_pf3vf_virtio_cmn_config_bar_indicator_hwtcl           =     0,
   parameter  core16_pf3vf_virtio_cmn_config_bar_offset_hwtcl              =     0,
   parameter  core16_pf3vf_virtio_cmn_config_structure_length_hwtcl        =     0,
   parameter  core16_pf3vf_virtio_notification_bar_indicator_hwtcl         =     0,
   parameter  core16_pf3vf_virtio_notification_bar_offset_hwtcl            =     0,
   parameter  core16_pf3vf_virtio_notification_structure_length_hwtcl      =     0,
   parameter  core16_pf3vf_virtio_notify_off_multiplier_hwtcl              =     0,
   parameter  core16_pf3vf_virtio_isrstatus_bar_indicator_hwtcl            =     0,
   parameter  core16_pf3vf_virtio_isrstatus_bar_offset_hwtcl               =     0,
   parameter  core16_pf3vf_virtio_isrstatus_structure_length_hwtcl         =     0,
   parameter  core16_pf3vf_virtio_devspecific_bar_indicator_hwtcl          =     0,
   parameter  core16_pf3vf_virtio_devspecific_bar_offset_hwtcl             =     0,
   parameter  core16_pf3vf_virtio_devspecific_structure_length_hwtcl       =     0,
   parameter  core16_pf3vf_virtio_pciconfig_access_bar_indicator_hwtcl     =     0,
   parameter  core16_pf3vf_virtio_pciconfig_access_bar_offset_hwtcl        =     0,
   parameter  core16_pf3vf_virtio_pciconfig_access_structure_length_hwtcl  =     0,
   //parameter  core16_pf0_vf_count_hwtcl                                    =     0,
   //parameter  core16_pf1_vf_count_hwtcl                                    =     0,
   //parameter  core16_pf2_vf_count_hwtcl                                    =     0,
   //parameter  core16_pf3_vf_count_hwtcl                                    =     0,

   parameter sm_hssi_pcie_ctl_x4_rxbuf_limit_bypass_hwtcl                           =   7,
   parameter sm_hssi_pcie_ctl_x4_maxpayload_size_hwtcl                              =   "MAXPAYLOAD_SIZE_MAX_PAYLOAD_128",
   parameter sm_hssi_pcie_ctl_x4_port_type_hwtcl                                    =   "PORT_TYPE_NATIVE_EP",
   parameter sm_hssi_pcie_ctl_x4_sris_enable_hwtcl                                  =   "SRIS_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_sris_mode_hwtcl                                    =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_sup_mode_hwtcl                                     =   "SUP_MODE_USER_MODE",
   parameter sm_hssi_pcie_ctl_x4_cvp_enable_hwtcl                                   =   "CVP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_cii_monitor_en_hwtcl                               =   "CII_MONITOR_EN_DISABLE",
   parameter sm_hssi_pcie_ctl_x4_pclk_clk_hz_hwtcl                                  =   0,
   parameter sm_hssi_pcie_ctl_x4_sys_clk_hz_hwtcl                                   =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_cap_link_surprise_down_err_cap_hwtcl           =   "PF0_CAP_LINK_SURPRISE_DOWN_ERR_CAP_DISABLE",
   parameter sm_hssi_pcie_ctl_x4_pf0_port_logic_fast_link_mode                      =   "PF0_PORT_LOGIC_FAST_LINK_MODE_ENABLE",
   parameter sm_hssi_pcie_ctl_x4_link_rate_hwtcl				    =   "LINK_RATE_GEN3",
   parameter sm_hssi_pcie_ctl_x4_link_width_hwtcl				    =   "LINK_WIDTH_X4",
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset0_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset1_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset2_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset3_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset4_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset5_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset6_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset7_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset8_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset9_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset10_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset11_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset12_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset13_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset14_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset15_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset0_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset1_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset2_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset3_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset4_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset5_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset6_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset7_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset8_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset9_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset10_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset11_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset12_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset13_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset14_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset15_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset0_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset1_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset2_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset3_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset4_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset5_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset6_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset7_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset8_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset9_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset10_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset11_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset12_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset13_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset14_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset15_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset0_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset1_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset2_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset3_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset4_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset5_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset6_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset7_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset8_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset9_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset10_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset11_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset12_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset13_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset14_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset15_hwtcl			    =	0,
   parameter sm_hssi_pcie_ctl_x4_pf0_virtio_en_hwtcl                                =   "PF0_VIRTIO_EN_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_virtio_en_hwtcl                                =   "PF1_VIRTIO_EN_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_virtio_en_hwtcl                                =   "PF2_VIRTIO_EN_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_virtio_en_hwtcl                                =   "PF3_VIRTIO_EN_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_exvf_virtio_en_hwtcl                           =   "PF0_EXVF_VIRTIO_EN_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_exvf_virtio_en_hwtcl                           =   "PF1_EXVF_VIRTIO_EN_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_exvf_virtio_en_hwtcl                           =   "PF2_EXVF_VIRTIO_EN_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_exvf_virtio_en_hwtcl                           =   "PF3_EXVF_VIRTIO_EN_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_device_id_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_vendor_id_hwtcl                      =   4466,
   parameter sm_hssi_pcie_ctl_x4_pf0_revision_id_hwtcl                              =   1,
   parameter sm_hssi_pcie_ctl_x4_pf0_base_class_code_hwtcl                          =   255,
   parameter sm_hssi_pcie_ctl_x4_pf0_subclass_code_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_program_interface_hwtcl                        =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_subsys_vendor_id_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_subsys_dev_id_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_device_id_hwtcl                       =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_subsysid_pf0_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_vendor_id_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_device_id_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_revision_id_hwtcl                              =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_base_class_code_hwtcl                          =   255,
   parameter sm_hssi_pcie_ctl_x4_pf1_subclass_code_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_program_interface_hwtcl                        =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_subsys_vendor_id_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_subsys_dev_id_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_device_id_hwtcl                       =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_subsysid_pf1_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_vendor_id_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_device_id_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_revision_id_hwtcl                              =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_base_class_code_hwtcl                          =   255,
   parameter sm_hssi_pcie_ctl_x4_pf2_subclass_code_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_program_interface_hwtcl                        =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_subsys_vendor_id_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_subsys_dev_id_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_device_id_hwtcl                       =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_subsysid_pf2_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_vendor_id_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_device_id_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_revision_id_hwtcl                              =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_base_class_code_hwtcl                          =   255,
   parameter sm_hssi_pcie_ctl_x4_pf3_subclass_code_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_program_interface_hwtcl                        =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_subsys_vendor_id_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_subsys_dev_id_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_device_id_hwtcl                       =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_subsysid_pf3_hwtcl                            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_user_vsec_cap_enable_hwtcl                     =   "PF0_USER_VSEC_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_user_vsec_cap_enable_hwtcl                     =   "PF1_USER_VSEC_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_user_vsec_cap_enable_hwtcl                     =   "PF2_USER_VSEC_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_user_vsec_cap_enable_hwtcl                     =   "PF3_USER_VSEC_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_vsec_next_offset_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_user_vsec_offset_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_user_vsec_offset_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_user_vsec_offset_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_cvp_vendor_specific_header_id_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_drop_vendor0_msg_hwtcl                             =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_drop_vendor1_msg_hwtcl                             =   "FALSE",
//   parameter sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl                                 =   4,
   parameter sm_hssi_pcie_ctl_x4_pf0_int_pin_hwtcl                                  =   "PF0_INT_PIN_NO_INT",
   parameter sm_hssi_pcie_ctl_x4_pf1_int_pin_hwtcl                                  =   "PF1_INT_PIN_NO_INT",
   parameter sm_hssi_pcie_ctl_x4_pf2_int_pin_hwtcl                                  =   "PF2_INT_PIN_NO_INT",
   parameter sm_hssi_pcie_ctl_x4_pf3_int_pin_hwtcl                                  =   "PF3_INT_PIN_NO_INT",
   parameter sm_hssi_pcie_ctl_x4_pf0_ats_cap_enable_hwtcl                           =   "PF0_ATS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_ats_cap_enable_hwtcl                           =   "PF1_ATS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_ats_cap_enable_hwtcl                           =   "PF2_ATS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_ats_cap_enable_hwtcl                           =   "PF3_ATS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_exvf_ats_cap_enable_hwtcl                      =   "PF0_EXVF_ATS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_exvf_ats_cap_enable_hwtcl                      =   "PF1_EXVF_ATS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_exvf_ats_cap_enable_hwtcl                      =   "PF2_EXVF_ATS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_exvf_ats_cap_enable_hwtcl                      =   "PF3_EXVF_ATS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_ats_exvf_align_request_hwtcl                   =   "PF0_ATS_EXVF_ALIGN_REQUEST_DISABLE",
   parameter sm_hssi_pcie_ctl_x4_pf1_ats_exvf_align_request_hwtcl                   =   "PF1_ATS_EXVF_ALIGN_REQUEST_DISABLE",
   parameter sm_hssi_pcie_ctl_x4_pf2_ats_exvf_align_request_hwtcl                   =   "PF2_ATS_EXVF_ALIGN_REQUEST_DISABLE",
   parameter sm_hssi_pcie_ctl_x4_pf3_ats_exvf_align_request_hwtcl                   =   "PF3_ATS_EXVF_ALIGN_REQUEST_DISABLE",
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_cap_enable_hwtcl                           =   "PF0_TPH_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_cap_enable_hwtcl                           =   "PF1_TPH_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_cap_enable_hwtcl                           =   "PF2_TPH_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_cap_enable_hwtcl                           =   "PF3_TPH_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_exvf_tph_cap_enable_hwtcl                      =   "PF0_EXVF_TPH_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_exvf_tph_cap_enable_hwtcl                      =   "PF1_EXVF_TPH_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_exvf_tph_cap_enable_hwtcl                      =   "PF2_EXVF_TPH_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_exvf_tph_cap_enable_hwtcl                      =   "PF3_EXVF_TPH_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_int_vec_hwtcl                      =   "PF0_TPH_REQ_CAP_INT_VEC_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_int_vec_hwtcl                      =   "PF1_TPH_REQ_CAP_INT_VEC_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_int_vec_hwtcl                      =   "PF2_TPH_REQ_CAP_INT_VEC_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_int_vec_hwtcl                      =   "PF3_TPH_REQ_CAP_INT_VEC_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_int_vec_vfcomm_cs2_hwtcl           =   "PF0_TPH_REQ_CAP_INT_VEC_VFCOMM_CS2_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_int_vec_vfcomm_cs2_hwtcl           =   "PF1_TPH_REQ_CAP_INT_VEC_VFCOMM_CS2_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_int_vec_vfcomm_cs2_hwtcl           =   "PF2_TPH_REQ_CAP_INT_VEC_VFCOMM_CS2_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_int_vec_vfcomm_cs2_hwtcl           =   "PF3_TPH_REQ_CAP_INT_VEC_VFCOMM_CS2_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl    =   "PF0_TPH_REQ_CAP_ST_TABLE_LOC_0_VFCOMM_CS2_NOT_IN_TPH_STRUCT_VF",
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl    =   "PF1_TPH_REQ_CAP_ST_TABLE_LOC_0_VFCOMM_CS2_NOT_IN_TPH_STRUCT_VF",
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl    =   "PF2_TPH_REQ_CAP_ST_TABLE_LOC_0_VFCOMM_CS2_NOT_IN_TPH_STRUCT_VF",
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl    =   "PF3_TPH_REQ_CAP_ST_TABLE_LOC_0_VFCOMM_CS2_NOT_IN_TPH_STRUCT_VF",
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_1_hwtcl               =   "PF0_TPH_REQ_CAP_ST_TABLE_LOC_1_IN_MSIX_TABLE",
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_1_hwtcl               =   "PF1_TPH_REQ_CAP_ST_TABLE_LOC_1_IN_MSIX_TABLE",
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_1_hwtcl               =   "PF2_TPH_REQ_CAP_ST_TABLE_LOC_1_IN_MSIX_TABLE",
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_1_hwtcl               =   "PF3_TPH_REQ_CAP_ST_TABLE_LOC_1_IN_MSIX_TABLE",
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl    =   "PF0_TPH_REQ_CAP_ST_TABLE_LOC_1_VFCOMM_CS2_NOT_IN_MSIX_TABLE_VF",
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl    =   "PF1_TPH_REQ_CAP_ST_TABLE_LOC_1_VFCOMM_CS2_NOT_IN_MSIX_TABLE_VF",
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl    =   "PF2_TPH_REQ_CAP_ST_TABLE_LOC_1_VFCOMM_CS2_NOT_IN_MSIX_TABLE_VF",
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl    =   "PF3_TPH_REQ_CAP_ST_TABLE_LOC_1_VFCOMM_CS2_NOT_IN_MSIX_TABLE_VF",
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_size_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_size_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_size_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_size_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl     =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl     =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl     =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl     =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_device_spec_hwtcl                      =   "PF0_TPH_REQ_DEVICE_SPEC_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_device_spec_hwtcl                      =   "PF1_TPH_REQ_DEVICE_SPEC_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_device_spec_hwtcl                      =   "PF2_TPH_REQ_DEVICE_SPEC_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_device_spec_hwtcl                      =   "PF3_TPH_REQ_DEVICE_SPEC_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_tph_req_device_spec_vfcomm_cs2_hwtcl           =   "PF0_TPH_REQ_DEVICE_SPEC_VFCOMM_CS2_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_tph_req_device_spec_vfcomm_cs2_hwtcl           =   "PF1_TPH_REQ_DEVICE_SPEC_VFCOMM_CS2_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_tph_req_device_spec_vfcomm_cs2_hwtcl           =   "PF2_TPH_REQ_DEVICE_SPEC_VFCOMM_CS2_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_tph_req_device_spec_vfcomm_cs2_hwtcl           =   "PF3_TPH_REQ_DEVICE_SPEC_VFCOMM_CS2_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_enable_hwtcl                           =   "PF0_ACS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_enable_hwtcl                           =   "PF1_ACS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_enable_hwtcl                           =   "PF2_ACS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_enable_hwtcl                           =   "PF3_ACS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_exvf_acs_cap_enable_hwtcl                      =   "PF0_EXVF_ACS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_exvf_acs_cap_enable_hwtcl                      =   "PF1_EXVF_ACS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_exvf_acs_cap_enable_hwtcl                      =   "PF2_EXVF_ACS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_exvf_acs_cap_enable_hwtcl                      =   "PF3_EXVF_ACS_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_src_valid_hwtcl                    =   "PF0_ACS_CAP_ACS_SRC_VALID_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_src_valid_hwtcl                    =   "PF1_ACS_CAP_ACS_SRC_VALID_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_src_valid_hwtcl                    =   "PF2_ACS_CAP_ACS_SRC_VALID_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_src_valid_hwtcl                    =   "PF3_ACS_CAP_ACS_SRC_VALID_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_at_block_hwtcl                     =   "PF0_ACS_CAP_ACS_AT_BLOCK_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_at_block_hwtcl                     =   "PF1_ACS_CAP_ACS_AT_BLOCK_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_at_block_hwtcl                     =   "PF2_ACS_CAP_ACS_AT_BLOCK_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_at_block_hwtcl                     =   "PF3_ACS_CAP_ACS_AT_BLOCK_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_req_redirect_hwtcl             =   "PF0_ACS_CAP_ACS_P2P_REQ_REDIRECT_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_req_redirect_hwtcl             =   "PF1_ACS_CAP_ACS_P2P_REQ_REDIRECT_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_req_redirect_hwtcl             =   "PF2_ACS_CAP_ACS_P2P_REQ_REDIRECT_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_req_redirect_hwtcl             =   "PF3_ACS_CAP_ACS_P2P_REQ_REDIRECT_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_cpl_redirect_hwtcl             =   "PF0_ACS_CAP_ACS_P2P_CPL_REDIRECT_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_cpl_redirect_hwtcl             =   "PF1_ACS_CAP_ACS_P2P_CPL_REDIRECT_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_cpl_redirect_hwtcl             =   "PF2_ACS_CAP_ACS_P2P_CPL_REDIRECT_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_cpl_redirect_hwtcl             =   "PF3_ACS_CAP_ACS_P2P_CPL_REDIRECT_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_usp_forwarding_hwtcl               =   "PF0_ACS_CAP_ACS_USP_FORWARDING_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_usp_forwarding_hwtcl               =   "PF1_ACS_CAP_ACS_USP_FORWARDING_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_usp_forwarding_hwtcl               =   "PF2_ACS_CAP_ACS_USP_FORWARDING_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_usp_forwarding_hwtcl               =   "PF3_ACS_CAP_ACS_USP_FORWARDING_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_egress_control_hwtcl           =   "PF0_ACS_CAP_ACS_P2P_EGRESS_CONTROL_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_egress_control_hwtcl           =   "PF1_ACS_CAP_ACS_P2P_EGRESS_CONTROL_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_egress_control_hwtcl           =   "PF2_ACS_CAP_ACS_P2P_EGRESS_CONTROL_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_egress_control_hwtcl           =   "PF3_ACS_CAP_ACS_P2P_EGRESS_CONTROL_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_egress_ctrl_size_hwtcl             =   8,
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_egress_ctrl_size_hwtcl             =   8,
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_egress_ctrl_size_hwtcl             =   8,
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_egress_ctrl_size_hwtcl             =   8,
   parameter sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_direct_translated_p2p_hwtcl        =   "PF0_ACS_CAP_ACS_DIRECT_TRANSLATED_P2P_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_direct_translated_p2p_hwtcl        =   "PF1_ACS_CAP_ACS_DIRECT_TRANSLATED_P2P_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_direct_translated_p2p_hwtcl        =   "PF2_ACS_CAP_ACS_DIRECT_TRANSLATED_P2P_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_direct_translated_p2p_hwtcl        =   "PF3_ACS_CAP_ACS_DIRECT_TRANSLATED_P2P_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ext_tag_en_hwtcl                      =   "TRUE",
   parameter sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ext_tag_en_hwtcl                      =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ext_tag_en_hwtcl                      =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ext_tag_en_hwtcl                      =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_flr_cap_hwtcl                         =   "PF0_PCIE_CAP_FLR_CAP_NOT_CAPABLE",
   parameter sm_hssi_pcie_ctl_x4_pf1_pcie_cap_flr_cap_hwtcl                         =   "PF1_PCIE_CAP_FLR_CAP_NOT_CAPABLE",
   parameter sm_hssi_pcie_ctl_x4_pf2_pcie_cap_flr_cap_hwtcl                         =   "PF2_PCIE_CAP_FLR_CAP_NOT_CAPABLE",
   parameter sm_hssi_pcie_ctl_x4_pf3_pcie_cap_flr_cap_hwtcl                         =   "PF3_PCIE_CAP_FLR_CAP_NOT_CAPABLE",
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_port_num_hwtcl                        =   1,
   parameter sm_hssi_pcie_ctl_x4_pf1_pcie_cap_port_num_hwtcl                        =   1,
   parameter sm_hssi_pcie_ctl_x4_pf2_pcie_cap_port_num_hwtcl                        =   1,
   parameter sm_hssi_pcie_ctl_x4_pf3_pcie_cap_port_num_hwtcl                        =   1,
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_clk_config_hwtcl                 =   "TRUE",
   parameter sm_hssi_pcie_ctl_x4_pf1_pcie_cap_slot_clk_config_hwtcl                 =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_pcie_cap_slot_clk_config_hwtcl                 =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_pcie_cap_slot_clk_config_hwtcl                 =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_msi_enable_hwtcl                               =   "PF0_MSI_ENABLE_ENABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_msi_enable_hwtcl                               =   "PF1_MSI_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_msi_enable_hwtcl                               =   "PF2_MSI_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_msi_enable_hwtcl                               =   "PF3_MSI_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msi_ext_data_cap_hwtcl                     =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msi_ext_data_cap_hwtcl                     =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msi_ext_data_cap_hwtcl                     =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msi_ext_data_cap_hwtcl                     =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msi_64_bit_addr_cap_hwtcl                  =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msi_64_bit_addr_cap_hwtcl                  =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msi_64_bit_addr_cap_hwtcl                  =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msi_64_bit_addr_cap_hwtcl                  =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msi_multiple_msg_cap_hwtcl                 =   "PF0_PCI_MSI_MULTIPLE_MSG_CAP_MSI_VEC_1",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msi_multiple_msg_cap_hwtcl                 =   "PF1_PCI_MSI_MULTIPLE_MSG_CAP_MSI_VEC_1",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msi_multiple_msg_cap_hwtcl                 =   "PF2_PCI_MSI_MULTIPLE_MSG_CAP_MSI_VEC_1",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msi_multiple_msg_cap_hwtcl                 =   "PF3_PCI_MSI_MULTIPLE_MSG_CAP_MSI_VEC_1",
   parameter sm_hssi_pcie_ctl_x4_pf0_msix_enable_hwtcl                              =   "PF0_MSIX_ENABLE_ENABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_msix_enable_hwtcl                              =   "PF1_MSIX_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_msix_enable_hwtcl                              =   "PF2_MSIX_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_msix_enable_hwtcl                              =   "PF3_MSIX_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_size_hwtcl                      =   3,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_size_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_size_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_size_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_offset_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_offset_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_offset_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_offset_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msix_bir_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msix_bir_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msix_bir_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msix_bir_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msix_pba_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msix_pba_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msix_pba_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msix_pba_hwtcl                             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msix_pba_offset_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msix_pba_offset_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msix_pba_offset_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msix_pba_offset_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_size_vfcomm_cs2_hwtcl           =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_size_vfcomm_cs2_hwtcl           =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_size_vfcomm_cs2_hwtcl           =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_size_vfcomm_cs2_hwtcl           =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_exvf_msix_cap_enable_hwtcl                     =   "PF0_EXVF_MSIX_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_exvf_msix_cap_enable_hwtcl                     =   "PF1_EXVF_MSIX_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_exvf_msix_cap_enable_hwtcl                     =   "PF2_EXVF_MSIX_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_exvf_msix_cap_enable_hwtcl                     =   "PF3_EXVF_MSIX_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf0_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf1_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf2_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf3_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf0_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf1_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf2_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf3_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf0_hwtcl                       =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf1_hwtcl                       =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf2_hwtcl                       =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf3_hwtcl                       =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf0_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf1_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf2_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf3_hwtcl                      =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf0_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf1_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf2_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf3_hwtcl                         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_slot_imp_hwtcl                            =   "PF0_PCIE_SLOT_IMP_NOT_IMPLEMENTED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_power_limit_scale_hwtcl          =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_power_limit_value_hwtcl          =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_phy_slot_num_hwtcl                    =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_hot_plug_capable_hwtcl                =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ep_l0s_accpt_latency_hwtcl            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ep_l1_accpt_latency_hwtcl             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ep_l0s_accpt_latency_hwtcl            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ep_l1_accpt_latency_hwtcl             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ep_l0s_accpt_latency_hwtcl            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ep_l1_accpt_latency_hwtcl             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ep_l0s_accpt_latency_hwtcl            =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ep_l1_accpt_latency_hwtcl             =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_prs_ext_cap_enable_hwtcl                       =   "PF0_PRS_EXT_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_prs_ext_cap_enable_hwtcl                       =   "PF1_PRS_EXT_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_prs_ext_cap_enable_hwtcl                       =   "PF2_PRS_EXT_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_prs_ext_cap_enable_hwtcl                       =   "PF3_PRS_EXT_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_prs_ext_cap_outstanding_capacity_hwtcl         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_prs_ext_cap_outstanding_capacity_hwtcl         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_prs_ext_cap_outstanding_capacity_hwtcl         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_prs_ext_cap_outstanding_capacity_hwtcl         =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sn_cap_enable_hwtcl                            =   "PF0_SN_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sn_cap_enable_hwtcl                            =   "PF1_SN_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sn_cap_enable_hwtcl                            =   "PF2_SN_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sn_cap_enable_hwtcl                            =   "PF3_SN_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sn_ser_num_reg_1_dw_hwtcl                      =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sn_ser_num_reg_1_dw_hwtcl                      =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sn_ser_num_reg_1_dw_hwtcl                      =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sn_ser_num_reg_1_dw_hwtcl                      =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sn_ser_num_reg_2_dw_hwtcl                      =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sn_ser_num_reg_2_dw_hwtcl                      =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sn_ser_num_reg_2_dw_hwtcl                      =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sn_ser_num_reg_2_dw_hwtcl                      =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pasid_cap_enable_hwtcl                         =   "PF0_PASID_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pasid_cap_enable_hwtcl                         =   "PF1_PASID_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pasid_cap_enable_hwtcl                         =   "PF2_PASID_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pasid_cap_enable_hwtcl                         =   "PF3_PASID_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pasid_cap_execute_permission_supported_hwtcl   =   "PF0_PASID_CAP_EXECUTE_PERMISSION_SUPPORTED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pasid_cap_execute_permission_supported_hwtcl   =   "PF1_PASID_CAP_EXECUTE_PERMISSION_SUPPORTED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pasid_cap_execute_permission_supported_hwtcl   =   "PF2_PASID_CAP_EXECUTE_PERMISSION_SUPPORTED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pasid_cap_execute_permission_supported_hwtcl   =   "PF3_PASID_CAP_EXECUTE_PERMISSION_SUPPORTED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pasid_cap_max_pasid_width_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pasid_cap_max_pasid_width_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pasid_cap_max_pasid_width_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pasid_cap_max_pasid_width_hwtcl                =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pasid_cap_privileged_mode_supported_hwtcl      =   "PF0_PASID_CAP_PRIVILEGED_MODE_SUPPORTED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pasid_cap_privileged_mode_supported_hwtcl      =   "PF1_PASID_CAP_PRIVILEGED_MODE_SUPPORTED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pasid_cap_privileged_mode_supported_hwtcl      =   "PF2_PASID_CAP_PRIVILEGED_MODE_SUPPORTED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pasid_cap_privileged_mode_supported_hwtcl      =   "PF3_PASID_CAP_PRIVILEGED_MODE_SUPPORTED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_ltr_cap_enable_hwtcl                           =   "PF0_LTR_CAP_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_virtual_ptm_hwtcl                                  =   "PTM_ENABLE_DISABLE",
   parameter sm_hssi_pcie_ctl_x4_ptm_autoupdate_hwtcl                               =   "PTM_AUTOUPDATE_AUTOUPDATE_DISABLE",
   parameter sm_hssi_pcie_ctl_x4_pf1_enable_hwtcl                                   =   "PF1_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_enable_hwtcl                                   =   "PF2_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_enable_hwtcl                                   =   "PF3_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_enable_hwtcl                             =   "PF0_SRIOV_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_enable_hwtcl                             =   "PF1_SRIOV_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_enable_hwtcl                             =   "PF2_SRIOV_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_enable_hwtcl                             =   "PF3_SRIOV_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_cap_sup_page_size_hwtcl                  =   0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_cap_sup_page_size_hwtcl                  =   0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_cap_sup_page_size_hwtcl                  =   0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_cap_sup_page_size_hwtcl                  =   0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar0_enabled_hwtcl                   =   "PF0_PCI_TYPE0_BAR0_ENABLED_ENABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar1_enabled_hwtcl                   =   "PF0_PCI_TYPE0_BAR1_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar2_enabled_hwtcl                   =   "PF0_PCI_TYPE0_BAR2_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar3_enabled_hwtcl                   =   "PF0_PCI_TYPE0_BAR3_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar4_enabled_hwtcl                   =   "PF0_PCI_TYPE0_BAR4_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar5_enabled_hwtcl                   =   "PF0_PCI_TYPE0_BAR5_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar0_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar1_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar2_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar3_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar4_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar5_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_bar0_prefetch_hwtcl                            =   "TRUE",
   parameter sm_hssi_pcie_ctl_x4_pf0_bar1_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_bar2_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_bar3_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_bar4_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_bar5_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_rom_bar_enable_hwtcl                           =   "PF0_ROM_BAR_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_rp_rom_bar_enabled_hwtcl                       =   "PF0_RP_ROM_BAR_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_enabled_hwtcl                    =   "PF0_SRIOV_VF_BAR0_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_enabled_hwtcl                    =   "PF0_SRIOV_VF_BAR1_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_enabled_hwtcl                    =   "PF0_SRIOV_VF_BAR2_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_enabled_hwtcl                    =   "PF0_SRIOV_VF_BAR3_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_enabled_hwtcl                    =   "PF0_SRIOV_VF_BAR4_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_enabled_hwtcl                    =   "PF0_SRIOV_VF_BAR5_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf0_bar0_type_hwtcl                                =   "PF0_BAR0_TYPE_BAR_MEM64",
   parameter sm_hssi_pcie_ctl_x4_pf0_bar2_type_hwtcl                                =   "PF0_BAR2_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf0_bar4_type_hwtcl                                =   "PF0_BAR4_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_type_hwtcl                       =   "PF0_SRIOV_VF_BAR0_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_type_hwtcl                       =   "PF0_SRIOV_VF_BAR2_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_type_hwtcl                       =   "PF0_SRIOV_VF_BAR4_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar0_enabled_hwtcl                   =   "PF1_PCI_TYPE0_BAR0_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar1_enabled_hwtcl                   =   "PF1_PCI_TYPE0_BAR1_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar2_enabled_hwtcl                   =   "PF1_PCI_TYPE0_BAR2_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar3_enabled_hwtcl                   =   "PF1_PCI_TYPE0_BAR3_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar4_enabled_hwtcl                   =   "PF1_PCI_TYPE0_BAR4_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar5_enabled_hwtcl                   =   "PF1_PCI_TYPE0_BAR5_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar0_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar1_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar2_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar3_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar4_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar5_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_bar0_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_bar1_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_bar2_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_bar3_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_bar4_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_bar5_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_rom_bar_enable_hwtcl                           =   "PF1_ROM_BAR_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_enabled_hwtcl                    =   "PF1_SRIOV_VF_BAR0_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_enabled_hwtcl                    =   "PF1_SRIOV_VF_BAR1_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_enabled_hwtcl                    =   "PF1_SRIOV_VF_BAR2_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_enabled_hwtcl                    =   "PF1_SRIOV_VF_BAR3_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_enabled_hwtcl                    =   "PF1_SRIOV_VF_BAR4_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_enabled_hwtcl                    =   "PF1_SRIOV_VF_BAR5_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf1_bar0_type_hwtcl                                =   "PF1_BAR0_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf1_bar2_type_hwtcl                                =   "PF1_BAR2_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf1_bar4_type_hwtcl                                =   "PF1_BAR4_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_type_hwtcl                       =   "PF1_SRIOV_VF_BAR0_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_type_hwtcl                       =   "PF1_SRIOV_VF_BAR2_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_type_hwtcl                       =   "PF1_SRIOV_VF_BAR4_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar0_enabled_hwtcl                   =   "PF2_PCI_TYPE0_BAR0_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar1_enabled_hwtcl                   =   "PF2_PCI_TYPE0_BAR1_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar2_enabled_hwtcl                   =   "PF2_PCI_TYPE0_BAR2_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar3_enabled_hwtcl                   =   "PF2_PCI_TYPE0_BAR3_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar4_enabled_hwtcl                   =   "PF2_PCI_TYPE0_BAR4_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar5_enabled_hwtcl                   =   "PF2_PCI_TYPE0_BAR5_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar0_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar1_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar2_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar3_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar4_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar5_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_bar0_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_bar1_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_bar2_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_bar3_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_bar4_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_bar5_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_rom_bar_enable_hwtcl                           =   "PF2_ROM_BAR_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_enabled_hwtcl                    =   "PF2_SRIOV_VF_BAR0_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_enabled_hwtcl                    =   "PF2_SRIOV_VF_BAR1_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_enabled_hwtcl                    =   "PF2_SRIOV_VF_BAR2_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_enabled_hwtcl                    =   "PF2_SRIOV_VF_BAR3_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_enabled_hwtcl                    =   "PF2_SRIOV_VF_BAR4_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_enabled_hwtcl                    =   "PF2_SRIOV_VF_BAR5_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf2_bar0_type_hwtcl                                =   "PF2_BAR0_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf2_bar2_type_hwtcl                                =   "PF2_BAR2_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf2_bar4_type_hwtcl                                =   "PF2_BAR4_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_type_hwtcl                       =   "PF2_SRIOV_VF_BAR0_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_type_hwtcl                       =   "PF2_SRIOV_VF_BAR2_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_type_hwtcl                       =   "PF2_SRIOV_VF_BAR4_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar0_enabled_hwtcl                   =   "PF3_PCI_TYPE0_BAR0_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar1_enabled_hwtcl                   =   "PF3_PCI_TYPE0_BAR1_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar2_enabled_hwtcl                   =   "PF3_PCI_TYPE0_BAR2_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar3_enabled_hwtcl                   =   "PF3_PCI_TYPE0_BAR3_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar4_enabled_hwtcl                   =   "PF3_PCI_TYPE0_BAR4_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar5_enabled_hwtcl                   =   "PF3_PCI_TYPE0_BAR5_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar0_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar1_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar2_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar3_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar4_mask_31_1_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar5_mask_31_0_hwtcl		    =	32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_bar0_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_bar1_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_bar2_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_bar3_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_bar4_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_bar5_prefetch_hwtcl                            =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_rom_bar_enable_hwtcl                           =   "PF3_ROM_BAR_ENABLE_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_enabled_hwtcl                    =   "PF3_SRIOV_VF_BAR0_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_enabled_hwtcl                    =   "PF3_SRIOV_VF_BAR1_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_enabled_hwtcl                    =   "PF3_SRIOV_VF_BAR2_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_enabled_hwtcl                    =   "PF3_SRIOV_VF_BAR3_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_enabled_hwtcl                    =   "PF3_SRIOV_VF_BAR4_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_enabled_hwtcl                    =   "PF3_SRIOV_VF_BAR5_ENABLED_DISABLED",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_mask_hwtcl                       =   32'h0,
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_prefetch_hwtcl                   =   "FALSE",
   parameter sm_hssi_pcie_ctl_x4_pf3_bar0_type_hwtcl                                =   "PF3_BAR0_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf3_bar2_type_hwtcl                                =   "PF3_BAR2_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf3_bar4_type_hwtcl                                =   "PF3_BAR4_TYPE_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_type_hwtcl                       =   "PF3_SRIOV_VF_BAR0_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_type_hwtcl                       =   "PF3_SRIOV_VF_BAR2_TYPE_SRIOV_VF_BAR_MEM32",
   parameter sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_type_hwtcl                       =   "PF3_SRIOV_VF_BAR4_TYPE_SRIOV_VF_BAR_MEM32",
   parameter ch0_xcvr_rx_protocol_hint_hwtcl                                        =   "PCIE_GEN3",
   parameter ch1_xcvr_rx_protocol_hint_hwtcl                                        =   "PCIE_GEN3",
   parameter ch2_xcvr_rx_protocol_hint_hwtcl                                        =   "PCIE_GEN3",
   parameter ch3_xcvr_rx_protocol_hint_hwtcl                                        =   "PCIE_GEN3",
   parameter ch0_xcvr_tx_protocol_hint_hwtcl                                        =   "PCIE_GEN3",
   parameter ch1_xcvr_tx_protocol_hint_hwtcl                                        =   "PCIE_GEN3",
   parameter ch2_xcvr_tx_protocol_hint_hwtcl                                        =   "PCIE_GEN3",
   parameter ch3_xcvr_tx_protocol_hint_hwtcl                                        =   "PCIE_GEN3",
   parameter ch0_sim_mode_hwtcl                                                     =   "DISABLE",
   parameter ch1_sim_mode_hwtcl                                                     =   "DISABLE",
   parameter ch2_sim_mode_hwtcl                                                     =   "DISABLE",
   parameter ch3_sim_mode_hwtcl                                                     =   "DISABLE",

  

parameter   sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl = "NUM_OF_LANES_NUM_1",

parameter   core16_total_pf_count_hwtcl    =     1,
parameter   core16_total_vf_count_hwtcl    =     1,
parameter   core16_empty_width_integer_hwtcl  =    3, //new: tdata_width=256, empty_width=3 .if tdata_width=128, empty_width=2
parameter   core16_flr_cap_hwtcl   =     0,
parameter   core16_enable_sriov_hwtcl  =     0,
parameter   core16_enable_virtio_hwtcl  =     0,
parameter   core16_func_mode_hwtcl = "Enable",
parameter   core16_pf0_bar0_address_width_hwtcl = 16,
parameter   core16_pf0_bar1_address_width_hwtcl = 16,
parameter   core16_pf0_bar2_address_width_hwtcl = 16,
parameter   core16_pf0_bar3_address_width_hwtcl = 16,
parameter   core16_pf0_bar4_address_width_hwtcl = 16,
parameter   core16_pf0_bar5_address_width_hwtcl = 16,
parameter   core16_pf0_vf_count_hwtcl  =     0,
parameter   core16_pf1_vf_count_hwtcl  =     0,
parameter   core16_pf2_vf_count_hwtcl  =     0,
parameter   core16_pf3_vf_count_hwtcl  =     0


)(
   // Clocks
   (* tile_ip_find_net *) input                        refclk0,
//   (* tile_ip_find_net *) input                        refclk0_n,

   output                                              coreclkout_hip,

   input  rx_n_in0,
   input  rx_p_in0,
   output tx_n_out0,
   output tx_p_out0,
   input  rx_n_in1,
   input  rx_p_in1,
   output tx_n_out1,
   output tx_p_out1,
   input  rx_n_in2,
   input  rx_p_in2,
   output tx_n_out2,
   output tx_p_out2,
   input  rx_n_in3,
   input  rx_p_in3,
   output tx_n_out3,
   output tx_p_out3,

   input                                               p0_axi_lite_clk,
   input                                               p0_axi_st_clk,

   // Reset
   input                                               pin_perst_n,
   input                                               ninit_done,
   input                                               i_gpio_perst0_n,

   output                                              p0_pin_perst_n,


   output                                              p0_reset_status_n,

   input                                               p0_axi_st_areset_n,
   input                                               p0_axi_lite_areset_n,

   output                                              p0_rst_req_o,
   input                                               p0_rst_rdy_i,

   input   [2:0]                                       p0_rx_tuser_halt,

   output                                              p0_st_rx_tvalid_o,
   input                                               p0_st_rx_tready_i,
   output  [core16_tdata_width_integer_hwtcl-1:0]      p0_st_rx_tdata_o,
   output  [(core16_tdata_width_integer_hwtcl/8)-1:0]      p0_st_rx_tkeep_o,
   output                                              p0_st_rx_tlast_o,
   output                                              p0_st_rx_tuser_last_segment,

   output                                              pcie_pld_rx_fbk_tready,


   input                                               p0_st_tx_tvalid_i,
   output                                              p0_st_tx_tready_o,
   input   [core16_tdata_width_integer_hwtcl-1:0]      p0_st_tx_tdata_i,
   input   [(core16_tdata_width_integer_hwtcl/8)-1:0]      p0_st_tx_tkeep_i,
   input                                               p0_st_tx_tlast_i,
   input                                          p0_st_tx_tuser_last_segment,

   output                                              p0_st_txcrdt_tvalid_o,
   output  [18:0]                                      p0_st_txcrdt_tvdata_o,
   input					       p0_st_txcrdt_tldrdy_i,

   //p0 _int_ ports
   input  [7:0]                                        p0_app_int_i,
   output [7:0]                                        p0_app_int_ready_o,
   output                                              p0_int_status_o,



   //p0 msi ports (EP only)
   //soft logic to allign with 32bit data width
   input   [2:0]                                       p0_msi_pnd_func_i,
   input   [1:0]                                       p0_msi_pnd_addr_i,
   input   [7:0]                                       p0_msi_pnd_byte_i,    //need soft logic to convert 32 bit data to 8bit bytedata and 2bit addr
   input   [10:0]                                      p0_msi_pnd_vf_num_i,
   input                                               p0_msi_pnd_vfa_i,
   output                                              p0_msi_pnd_ready_o,

   //export output
   //soft logic needs to control input
   input                                               p0_app_xfer_pending_i,
   input                                               p0_apps_ready_entr_l23_i,
   input   [7:0]                                       p0_apps_pm_xmt_pme_i,
   input                                               p0_app_init_rst_i,
   input                                               p0_apps_pm_xmt_turnoff_i,
   output  [9:0]                                       p0_apps_pm_ready_o,

   output                                              p0_surprise_down_err_o,
   output                                              p0_link_up_o,
   output                                              p0_dl_up_o,
   output  [2:0]                                       p0_pm_state_o,
   output  [31:0]                                       p0_pm_dstate_o,
   output  [5:0]                                       p0_ltssm_state_o,
   input   [7:0]                                       p0_pld_gp_status_i,
   output  [7:0]                                       p0_pld_gp_ctrl_o,
   input   [7:0]                                       p0_app_req_retry_en_i, //KAHUAT_EDIT
   output                                               p0_app_retry_en_ready_o, //KLAI4 EDIT
   input                                               p0_sys_aux_pwr_det_i,


   //p0 err_ ports
   //requires 5 cycles
   //need soft logic to ease user effort
   input                                               p0_app_err_valid_i,
   input   [2:0]                                       p0_app_err_func_num_i,
   input   [31:0]                                      p0_app_err_hdr_i,        //add soft logic to convert hdr+prfx to 5 cycles of 32bit
   input   [12:0]                                      p0_app_err_info_i,
   output                                              p0_app_err_ready_o,
   output                                              p0_serr_out_o,
   output                                              p0_hip_enter_err_mode_o,


   //confirm whether or not to support
   //p0 hot plug ports
   //terminate in QSYS
   input                                               p0_sys_pwr_fault_det_i,
   input                                               p0_sys_mrl_sensor_state_i,
   input                                               p0_sys_mrl_sensor_chged_i,
   input                                               p0_sys_pre_det_state_i,
   input                                               p0_sys_pre_det_chged_i,
   input                                               p0_sys_cmd_cpled_int_i,
   input                                               p0_sys_atten_button_pressed_i,
   input                                               p0_sys_eml_interlock_engaged_i,
   output  [7:0]                                       p0_sys_hotplug_ready_o,


   output                                              p0_flrrcvd_tvalid_o,
   output  [19:0]                                      p0_flrrcvd_tvdata_o,


   input                                               p0_flrcmpl_tvalid_i,
   input   [19:0]                                      p0_flrcmpl_tvdata_i,




   output                                              p0_virtio_pcicfgreq_tvalid_o,
   output  [95:0]                                      p0_virtio_pcicfgreq_tdata_o,
   input                                               p0_virtio_pcicfgcmpl_tvalid_i,
   input   [31:0]                                      p0_virtio_pcicfgcmpl_tdata_i,


   output  [4:0]                                       p0_tl_cfg_add_o,
   output  [2:0]                                       p0_tl_cfg_func_o,
   output  [15:0]                                      p0_tl_cfg_ctl_o,
   output                                              p0_dl_timer_update_o,


// nwai: Should not exist:   output                                              p0_st_ciireq_tvalid_o,
// nwai: Should not exist:   input                                               p0_st_cciireq_tready_i,
   output  [67:0]                                      p0_st_ciireq_tdata_o,

   input                                               p0_st_cii_halt_i,
   output                                              p0_st_cii_req_o,

// nwai: Should not exist:   input                                               p0_st_ciiresp_tvalid_i,
   input   [32:0]                                      p0_st_ciiresp_tdata_i,



   //p0 vf_err_ ports
   input                                               p0_user_sent_vfnonfatalmsg_i,
   input   [2:0]                                       p0_user_vfnonfatalmsg_func_num_i,
   input   [10:0]                                      p0_user_vfnonfatalmsg_vfnum_i,
   output                                              p0_vf_err_ur_posted_s0_o,
   output                                              p0_vf_err_ca_postedreq_s0_o,
   output                                              p0_vf_err_poisonedwrreq_s0_o,
   output                                              p0_vf_err_poisonedcompl_s0_o,
   output  [2:0]                                       p0_vf_err_func_num_s0_o,
   output  [10:0]                                      p0_vf_err_vf_num_s0_o,
   output                                              p0_vf_err_ur_posted_s1_o,
   output                                              p0_vf_err_ca_postedreq_s1_o,
   output                                              p0_vf_err_poisonedwrreq_s1_o,
   output                                              p0_vf_err_poisonedcompl_s1_o,
   output  [2:0]                                       p0_vf_err_func_num_s1_o,
   output  [10:0]                                      p0_vf_err_vf_num_s1_o,
   output                                              p0_vf_err_overflow_o,




   output                                              p0_st_cplto_tvalid_o,
   output  [43:0]                                      p0_st_cplto_tdata_o,


   input   [1:0]                                       p0_qhip_prs_event_i,
   input   [2:0]                                       p0_qhip_prs_event_func_i,
   input                                               p0_qhip_prs_event_valid_i,
   output                                              p0_qhip_prs_event_ready_o,


   //p0 test_ ports
   input                                               p0_test_in_i,
   output  [34:0]                                      p0_test_out_o,

   //PTM
  input          ptm_manual_update,               //QHIP PTM    Check User Guide for details
  output         ptm_context_valid,               //QHIP PTM    Check User Guide for details
  output         start_ptm_newclk_value,          //PTM    Check User Guide for details
  output         ptm_newclk_value,                //PTM    Check User Guide for details
  output         ptm_clock_correction,             //PTM    Check User Guide for details

   // User AVMM ports
   //p0 user_avmm ports
   input                                               p0_hip_reconfig_clk,
   input   [23:0]                                      p0_hip_reconfig_address,
   input                                               p0_hip_reconfig_write,
   input   [31:0]                                      p0_hip_reconfig_writedata,
   input                                               p0_hip_reconfig_read,
   output                                              p0_hip_reconfig_readdatavalid,
   output  [31:0]                                      p0_hip_reconfig_readdata,
   output                                              p0_hip_reconfig_waitrequest,
   input   [3:0]                                       p0_hip_reconfig_byteen,
   output  [1:0]                                       p0_hip_reconfig_resp,
   
   output 	[20:0]					pciess_reconfig_address,
   output						pciess_reconfig_write,
   output 	[31:0]					pciess_reconfig_writedata,
   output						pciess_reconfig_read,
   input  	[31:0]					pciess_reconfig_readdata,
   input						pciess_reconfig_readdatavalid,
   input						pciess_reconfig_waitrequest,

   output        p0_pld_in_use_o,

   input         i_syspll_c0_clk,
   input         i_syspll_c1_clk,
   input         i_syspll_c2_clk,
   input         i_flux_clk,
   input         i_ss_vccl_syspll_locked,

   output	 p0_user_mode_to_pld_o


);

  localparam num_of_lanes = (sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl == "NUM_OF_LANES_NUM_4")? 4 : (sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl == "NUM_OF_LANES_NUM_2")? 2 : 1;

  logic i_gpio_perst0_n_sync;
  logic i_gpio_perst0_n_db;
  
  wire  coreclkout_hip_w;
  assign coreclkout_hip = coreclkout_hip_w;


  //wire [99:0] o_hio_rxdata_async;
  wire [((num_of_lanes+1)*100)-1:0] o_hio_rxdata_async;

  wire   hip_pin_perst_n;
  assign hip_pin_perst_n = o_hio_rxdata_async[30];

  wire   core_pll_lock;
  assign core_pll_lock = o_hio_rxdata_async[31];

  wire   tx_dsk_done;
  assign tx_dsk_done = o_hio_rxdata_async[64];

  wire   user_mode_to_pld;
  assign user_mode_to_pld = o_hio_rxdata_async[66]; 

  wire   pld_in_use;
  assign pld_in_use = o_hio_rxdata_async[67];

  wire  pld_link_req_rst;
  assign pld_link_req_rst = o_hio_rxdata_async[70]; 

  wire   pld_core_rst_n;
  assign pld_core_rst_n = o_hio_rxdata_async[68];


  wire   pld_ready ;
  wire pld_warm_rst_rdy ;
  //wire [99:0] i_hio_txdata_async;
  wire [((num_of_lanes+1)*100)-1:0] i_hio_txdata_async;

  //assign i_hio_txdata_async[24:12] = '0;
  assign i_hio_txdata_async[24:0] = '0;
  assign i_hio_txdata_async[36:25] = '1;
  assign i_hio_txdata_async[37] = pld_warm_rst_rdy; 
  assign i_hio_txdata_async[38] = pld_ready;
  assign i_hio_txdata_async[42:39] = p0_app_req_retry_en_i[3:0];
  assign i_hio_txdata_async[99:43] = '0;

  assign i_hio_txdata_async[((num_of_lanes+1)*100)-1:100] = '0;

//RX synchronous datapath
   wire   [79:0]  ch0_rx_data;
   wire   [79:0]  ch1_rx_data;
   wire   [79:0]  ch2_rx_data;
   wire   [79:0]  ch3_rx_data;
   wire   [79:0]  ch4_rx_data; //KAHUAT_EDIT


//TX synchronous datapath
   wire   [79:0]  ch0_tx_data;
   wire   [79:0]  ch1_tx_data;
   wire   [79:0]  ch2_tx_data;
   wire   [79:0]  ch3_tx_data;
   wire   [79:0]  ch4_tx_data; //KAHUAT_EDIT


//KAHUAT_EDIT //TODO for future x8
   localparam num_of_chnl_w = (topology=="pcie_x4") ? 5 : (topology=="pcie_x2") ? 3 : (topology=="pcie_x1") ? 2 : 5; 
   wire   [num_of_chnl_w-1:0] pld_adapter_tx_pld_rst_n;
   wire   [num_of_chnl_w-1:0] pld_adapter_rx_pld_rst_n;


//KLAI4 EDIT for temporary DEF PARAM include 
   `ifndef PCIE_QHIP
      `define PCIE_QHIP `TEST_TOP.sm_inst.intel_pcie_gts_inst.gen_sm_qhip.u_sm_qhip
   `endif //SM QHIP

   `ifndef TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0
      `define TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_0.one_lane_pcie_hal_top_p0.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_ipfluxtop_uxtop_wrap_0
   `endif
   `ifndef TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1
      `define TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_1.one_lane_pcie_hal_top_p1.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_ipfluxtop_uxtop_wrap_0
   `endif
   `ifndef TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2
      `define TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_2.one_lane_pcie_hal_top_p2.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_ipfluxtop_uxtop_wrap_0
   `endif
   `ifndef TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3
      `define TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_3.one_lane_pcie_hal_top_p3.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_ipfluxtop_uxtop_wrap_0
   `endif
/*   `ifndef TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U0
      `define TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U0 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_0.one_lane_pcie_hal_top_p0.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_sm_xcvrif_1ch_0
   `endif
   `ifndef TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U1
      `define TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U1 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_1.one_lane_pcie_hal_top_p1.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_sm_xcvrif_1ch_0
   `endif
   `ifndef TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U2
      `define TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U2 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_2.one_lane_pcie_hal_top_p2.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_sm_xcvrif_1ch_0
   `endif
   `ifndef TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U3
      `define TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U3 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_3.one_lane_pcie_hal_top_p3.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_sm_xcvrif_1ch_0
   `endif
   `ifndef TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U0
      `define TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U0 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_0.one_lane_pcie_hal_top_p0.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_sm_flux_ingress_0
   `endif
   `ifndef TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U1
      `define TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U1 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_1.one_lane_pcie_hal_top_p1.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_sm_flux_ingress_0
   `endif
   `ifndef TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U2
      `define TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U2 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_2.one_lane_pcie_hal_top_p2.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_sm_flux_ingress_0
   `endif
   `ifndef TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U3
      `define TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U3 sm_pcie_hal_top_inst.pcie_hal_top.one_lane_pcie_inst_3.one_lane_pcie_hal_top_p3.phy_hal_top_inst.phy_hal_top.phy_hal_coreip_inst.ch4_phy_inst.x_std_sm_flux_ingress_0
   `endif
*/

//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.cdr_f_out_hz = 36'h4a817c80;//1.25Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.cdr_f_pfd_hz = 36'h5f5e100;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.cdr_f_ref_hz = 36'h5f5e100;//100MHz
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.cdr_f_vco_hz = 36'h2540be400;//10Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.cdr_l_counter = 6'h8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.cdr_m_counter = 9'h32;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.cdr_n_counter = 6'h1;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.rx_datarate_bps = 37'h9502f900;//2.5Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_datarate_bps = 37'h9502f900;//2.5Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_f_out_hz = 36'h4a817c80;//1.25Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_f_pfd_hz = 36'h5f5e100;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_f_ref_hz = 36'h5f5e100;//100MHz
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_f_vco_hz = 36'h2540be400;//10Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_k_counter = 22'h0;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_l_counter = 6'h8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_m_counter = 9'h64;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_n_counter = 6'h1;

//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.rx_word_clk_hz = 36'h6b61f3534;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_pll_postdiv_sel = "TX_PLL_POSTDIV_SEL_SYNTH2";
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_postdiv_cdr_refclk_divider = 8'h5a;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_postdiv_cdr_refclk_hz = 36'h63f82fa00;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_postdiv_clk_hz = 36'h88c9543;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_synthdiv_out_divider = 8'hb;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_synthdiv_out_hz = 36'h8f05e2c00;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE0.tx_word_clk_hz = 36'hf1967516a;


//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.cdr_f_out_hz = 36'h4a817c80;//1.25Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.cdr_f_pfd_hz = 36'h5f5e100;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.cdr_f_ref_hz = 36'h5f5e100;//100MHz
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.cdr_f_vco_hz = 36'h2540be400;//10Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.cdr_l_counter = 6'h8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.cdr_m_counter = 9'h32;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.cdr_n_counter = 6'h1;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.rx_datarate_bps = 37'h9502f900;//2.5Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_datarate_bps = 37'h9502f900;//2.5Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_f_out_hz = 36'h4a817c80;//1.25Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_f_pfd_hz = 36'h5f5e100;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_f_ref_hz = 36'h5f5e100;//100MHz
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_f_vco_hz = 36'h2540be400;//10Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_k_counter = 22'h0;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_l_counter = 6'h8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_m_counter = 9'h64;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_n_counter = 6'h1;

//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.rx_word_clk_hz = 36'h52e8e8c8a;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_pll_postdiv_sel = "TX_PLL_POSTDIV_SEL_SYNTH2";
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_postdiv_cdr_refclk_divider = 8'h15;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_postdiv_cdr_refclk_hz = 36'h0;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_postdiv_clk_hz = 36'h18860a26;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_synthdiv_out_divider = 8'h48;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_synthdiv_out_hz = 36'h7cf63b880;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE1.tx_word_clk_hz = 36'h9d89613fb;

//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.cdr_f_out_hz = 36'h4a817c80;//1.25Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.cdr_f_pfd_hz = 36'h5f5e100;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.cdr_f_ref_hz = 36'h5f5e100;//100MHz
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.cdr_f_vco_hz = 36'h2540be400;//10Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.cdr_l_counter = 6'h8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.cdr_m_counter = 9'h32;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.cdr_n_counter = 6'h1;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.rx_datarate_bps = 37'h9502f900;//2.5Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_datarate_bps = 37'h9502f900;//2.5Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_f_out_hz = 36'h4a817c80;//1.25Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_f_pfd_hz = 36'h5f5e100;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_f_ref_hz = 36'h5f5e100;//100MHz
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_f_vco_hz = 36'h2540be400;//10Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_k_counter = 22'h0;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_l_counter = 6'h8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_m_counter = 9'h64;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_n_counter = 6'h1;

//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.rx_word_clk_hz = 36'h2c97f232;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_pll_postdiv_sel = "TX_PLL_POSTDIV_SEL_SYNTH2";
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_postdiv_cdr_refclk_divider = 8'hbe;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_postdiv_cdr_refclk_hz = 36'hdab74e00;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_postdiv_clk_hz = 36'h44e2d89;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_synthdiv_out_divider = 8'h14;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_synthdiv_out_hz = 36'h1dcd6500;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE2.tx_word_clk_hz = 36'h2214879a2;



//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.cdr_f_out_hz = 36'h4a817c80;//1.25Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.cdr_f_pfd_hz = 36'h5f5e100;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.cdr_f_ref_hz = 36'h5f5e100;//100MHz
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.cdr_f_vco_hz = 36'h2540be400;//10Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.cdr_l_counter = 6'h8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.cdr_m_counter = 9'h32;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.cdr_n_counter = 6'h1;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.rx_datarate_bps = 37'h9502f900;//2.5Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_datarate_bps = 37'h9502f900;//2.5Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_f_out_hz = 36'h4a817c80;//1.25Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_f_pfd_hz = 36'h5f5e100;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_f_ref_hz = 36'h5f5e100;//100MHz
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_f_vco_hz = 36'h2540be400;//10Gbps
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_k_counter = 22'h0;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_l_counter = 6'h8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_m_counter = 9'h64;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_n_counter = 6'h1;

//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.rx_word_clk_hz = 36'haa1fbb5d9;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_pll_postdiv_sel = "TX_PLL_POSTDIV_SEL_SYNTH2";
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_postdiv_cdr_refclk_divider = 8'he6;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_postdiv_cdr_refclk_hz = 36'he455fc600;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_postdiv_clk_hz = 36'h347065c8;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_synthdiv_out_divider = 8'h5b;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_synthdiv_out_hz = 36'h1c8a8ec00;
//defparam `TENNM_IPFLUXTOP_UXTOP_WRAP__HSSI_SS_U0__UX_QUAD_U0__IPFLUXTOP_U0__FLUX_CORE_INS__FLUX_4UX_WRAP_INS__I_UXTOP_WRAP_LANE3.tx_word_clk_hz = 36'h2e32b3c8c;



/*
defparam `TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U0.tx_bond_size = "TX_BOND_SIZE_UNUSED";
defparam `TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U1.tx_bond_size = "TX_BOND_SIZE_UNUSED";
defparam `TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U2.tx_bond_size = "TX_BOND_SIZE_UNUSED";
defparam `TENNM_SM_HSSI_FEC__HSSI_U0__XCVRIF_TOP_U0__XCVRIF_1CH_U3.tx_bond_size = "TX_BOND_SIZE_UNUSED";

defparam `TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U0.tx_bond_size = "TX_BOND_SIZE_X4";
defparam `TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U1.tx_bond_size = "TX_BOND_SIZE_X4";
defparam `TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U2.tx_bond_size = "TX_BOND_SIZE_X4";
defparam `TENNM_SM_FLUX_INGRESS__HSSI_SS_U0__UX_QUAD_U0__UX_TOOLBOX_TOP_U0__FLUX_INGRESS_U3.tx_bond_size = "TX_BOND_SIZE_X4";
*/

//KLAI4 EDIT end

/*
//KAHUAT_EDIT
   // start of BAR mask localparam
   function [63:0] get_bar_size_mask;
   // Compute bar size mask based on BAR size 
      input integer bara_64bit_mem_space ;// Integer 1 or 0 
      input integer bara_size            ;// Integer number of bits 
      input integer barb_size            ;// Integer number of bits 
      reg [63:0] barab_size_mask64;
      reg [31:0] bara_size_mask31_0;
      reg [31:0] barb_size_mask31_0;
      begin
         barab_size_mask64   = ~{64'hffff_ffff_ffff_ffff << (bara_size )   };   
         bara_size_mask31_0  = ~{32'hffff_ffff           << (bara_size )};
         barb_size_mask31_0  = ~{32'hffff_ffff           << (barb_size  )};  
         get_bar_size_mask   = (bara_64bit_mem_space == 1)? barab_size_mask64[63:0]:
                               {barb_size_mask31_0[31:0]  , bara_size_mask31_0[31:0]};
      end  
   endfunction

   function [20:00] get_expansion_base_addr_mask;
      // Compute expansion ROM size mask based on expansion ROM size 
      input integer expansion_base_address_size;
      reg [31:0] mask31_0;
      begin
         mask31_0 = ~{32'hffff_ffff << (expansion_base_address_size)};
         get_expansion_base_addr_mask = mask31_0[31:11];
      end  
   endfunction

   // -------------------------- core16 BAR mask localparam --------------------------
   // PF0 BAR0-5 mask & ROM BAR mask
   localparam [63:0] core16_pf0_bar01_size_mask                                      = (core16_func_mode_hwtcl=="Enable")?(get_bar_size_mask((sm_hssi_pcie_ctl_x4_pf0_bar0_type_hwtcl=="PF0_BAR0_TYPE_BAR_MEM64")?1:0,core16_pf0_bar0_address_width_hwtcl, core16_pf0_bar1_address_width_hwtcl)):64'b0;
   localparam [30:0] sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar0_mask_31_1_hwtcl          = (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar0_enabled_hwtcl=="PF0_PCI_TYPE0_BAR0_ENABLED_ENABLED")?(core16_pf0_bar01_size_mask[31:1]):32'b0;
   localparam [30:0] sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar1_mask_31_0_hwtcl          = (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar1_enabled_hwtcl=="PF0_PCI_TYPE0_BAR1_ENABLED_ENABLED" || sm_hssi_pcie_ctl_x4_pf0_bar0_type_hwtcl=="PF0_BAR0_TYPE_BAR_MEM64")?(core16_pf0_bar01_size_mask[63:33]):32'b0;
//   localparam        ctop_core16_virtual_pf0_bar1_mask_bit0            = (ctop_core16_pf0_bar0_type=="CTOP_CORE16_PF0_BAR0_MEM64")? ((ctop_core16_pf0_bar01_size_mask[32]==1'b1) ?"TRUE":"FALSE"):"FALSE";

   localparam [63:0] core16_pf0_bar23_size_mask                                      = (core16_func_mode_hwtcl=="Enable")?(get_bar_size_mask((sm_hssi_pcie_ctl_x4_pf0_bar2_type_hwtcl=="PF0_BAR2_TYPE_BAR_MEM64")?1:0,core16_pf0_bar2_address_width_hwtcl, core16_pf0_bar3_address_width_hwtcl)):64'b0;
   localparam [30:0] sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar2_mask_31_1_hwtcl          = (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar2_enabled_hwtcl=="PF0_PCI_TYPE0_BAR2_ENABLED_ENABLED")?(core16_pf0_bar23_size_mask[31:1]):32'b0;
   localparam [30:0] sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar3_mask_31_0_hwtcl          = (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar3_enabled_hwtcl=="PF0_PCI_TYPE0_BAR3_ENABLED_ENABLED" || sm_hssi_pcie_ctl_x4_pf0_bar2_type_hwtcl=="PF0_BAR2_TYPE_BAR_MEM64")?(core16_pf0_bar23_size_mask[63:33]):32'b0;
//   localparam        ctop_core16_virtual_pf0_bar3_mask_bit0            = (ctop_core16_pf0_bar2_type=="CTOP_CORE16_PF0_BAR2_MEM64")?((ctop_core16_pf0_bar23_size_mask[32]==1'b1) ?"TRUE":"FALSE"):"FALSE";

   localparam [63:0] core16_pf0_bar45_size_mask                                      = (core16_func_mode_hwtcl=="Enable")?(get_bar_size_mask((sm_hssi_pcie_ctl_x4_pf0_bar4_type_hwtcl=="PF0_BAR4_TYPE_BAR_MEM64")?1:0,core16_pf0_bar4_address_width_hwtcl, core16_pf0_bar5_address_width_hwtcl)):64'b0;
   localparam [30:0] sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar4_mask_31_1_hwtcl          = (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar4_enabled_hwtcl=="PF0_PCI_TYPE0_BAR4_ENABLED_ENABLED")?(core16_pf0_bar45_size_mask[31:1]):32'b0;
   localparam [30:0] sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar5_mask_31_0_hwtcl          = (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar5_enabled_hwtcl=="PF0_PCI_TYPE0_BAR5_ENABLED_ENABLED" || sm_hssi_pcie_ctl_x4_pf0_bar4_type_hwtcl=="PF0_BAR4_TYPE_BAR_MEM64")?(core16_pf0_bar45_size_mask[63:33]):32'b0;
//   localparam        ctop_core16_virtual_pf0_bar5_mask_bit0            = (ctop_core16_pf0_bar4_type=="CTOP_CORE16_PF0_BAR4_MEM64")?((ctop_core16_pf0_bar45_size_mask[32]==1'b1) ?"TRUE":"FALSE"):"FALSE";
*/

// DTK Mode
	wire		toolkit_mode;
	wire [23:0]	p0_hip_reconfig_address_w;
	wire 		p0_hip_reconfig_write_w;
	wire [31:0]	p0_hip_reconfig_writedata_w;
	wire 		p0_hip_reconfig_read_w;
	wire [31:0]	p0_hip_reconfig_readdata_w;
	wire		p0_hip_reconfig_readdatavalid_w;
	wire		p0_hip_reconfig_waitrequest_w;
	wire [3:0]	p0_hip_reconfig_byteen_w;
	wire [31:0]	dtk_ss_avmm_readdata;
	wire		dtk_ss_avmm_readdatavalid;
	wire		dtk_ss_avmm_waitrequest;
	wire [20:0]	dtk_ss_avmm_address;
	wire		dtk_ss_avmm_write;
	wire [31:0]	dtk_ss_avmm_writedata;
	wire		dtk_ss_avmm_read;
	wire [20:0]	dtk_p0_avmm_address;
	wire		dtk_p0_avmm_write;
	wire [31:0]	dtk_p0_avmm_writedata;
	wire		dtk_p0_avmm_read;
	wire [31:0]	dtk_p0_avmm_readdata;
	wire		dtk_p0_avmm_readdatavalid;
	wire		dtk_p0_avmm_waitrequest;
	wire		phy_avmm_read;
	wire		phy_avmm_write;
	wire [23:0]	phy_avmm_address;
	wire [31:0]	phy_avmm_writedata;
	wire		phy_avmm_readdatavalid;
	wire [31:0]	phy_avmm_readdata;
	wire		phy_avmm_waitrequest;
	
	wire        	phy0_avmm_read;
    wire         	phy0_avmm_write;
    wire 	[20:0]  phy0_avmm_address;
    wire 	[31:0]  phy0_avmm_writedata;
    wire          	phy0_avmm_readdatavalid;
    wire  	[31:0]  phy0_avmm_readdata;
    wire          	phy0_avmm_waitrequest;
	
	wire         	phy1_avmm_read;
    wire         	phy1_avmm_write;
    wire 	[20:0]  phy1_avmm_address;
    wire 	[31:0]  phy1_avmm_writedata;
    wire          	phy1_avmm_readdatavalid;
    wire  	[31:0]  phy1_avmm_readdata;
    wire          	phy1_avmm_waitrequest;
	
	wire         	phy2_avmm_read;
    wire         	phy2_avmm_write;
    wire 	[20:0]  phy2_avmm_address;
    wire 	[31:0]  phy2_avmm_writedata;
    wire          	phy2_avmm_readdatavalid;
    wire  	[31:0]  phy2_avmm_readdata;
    wire          	phy2_avmm_waitrequest;
	
	wire         	phy3_avmm_read;
    wire         	phy3_avmm_write;
    wire 	[20:0]  phy3_avmm_address;
    wire 	[31:0]  phy3_avmm_writedata;
    wire          	phy3_avmm_readdatavalid;
    wire  	[31:0]  phy3_avmm_readdata;
    wire          	phy3_avmm_waitrequest;

	
	assign p0_hip_reconfig_address_w 	= toolkit_mode? {3'b0, dtk_p0_avmm_address} : p0_hip_reconfig_address;
	assign p0_hip_reconfig_write_w 		= toolkit_mode? dtk_p0_avmm_write : p0_hip_reconfig_write;
	assign p0_hip_reconfig_writedata_w 	= toolkit_mode? dtk_p0_avmm_writedata : p0_hip_reconfig_writedata;
	assign p0_hip_reconfig_read_w 		= toolkit_mode? dtk_p0_avmm_read : p0_hip_reconfig_read;
	assign p0_hip_reconfig_byteen_w		= toolkit_mode? 4'hf : p0_hip_reconfig_byteen;
	assign p0_hip_reconfig_readdata 	= toolkit_mode? 32'h0 : p0_hip_reconfig_readdata_w;
	assign p0_hip_reconfig_readdatavalid 	= toolkit_mode? 1'h0 : p0_hip_reconfig_readdatavalid_w;
	assign p0_hip_reconfig_waitrequest	= toolkit_mode? 1'h1 : p0_hip_reconfig_waitrequest_w;
	assign dtk_p0_avmm_readdata             = toolkit_mode? p0_hip_reconfig_readdata_w      : 32'h0;
	assign dtk_p0_avmm_readdatavalid        = toolkit_mode? p0_hip_reconfig_readdatavalid_w : 1'h0;
	assign dtk_p0_avmm_waitrequest          = toolkit_mode? p0_hip_reconfig_waitrequest_w   : 1'h0;

	generate 
	if (enable_pciess_register_access_hwtcl) begin
		assign pciess_reconfig_address        = toolkit_mode? dtk_ss_avmm_address   : 21'b0;
		assign pciess_reconfig_write          = toolkit_mode? dtk_ss_avmm_write     : 1'b0;
		assign pciess_reconfig_writedata      = toolkit_mode? dtk_ss_avmm_writedata : 32'b0;
		assign pciess_reconfig_read           = toolkit_mode? dtk_ss_avmm_read      : 1'b0;
		assign dtk_ss_avmm_readdata           = toolkit_mode? pciess_reconfig_readdata      : 32'b0;
		assign dtk_ss_avmm_readdatavalid      = toolkit_mode? pciess_reconfig_readdatavalid : 1'b0;
		assign dtk_ss_avmm_waitrequest        = toolkit_mode? pciess_reconfig_waitrequest   : 1'b0;
	end
	else begin
	   	assign dtk_ss_avmm_readdata           = '0;
		assign dtk_ss_avmm_readdatavalid      = '0;
		assign dtk_ss_avmm_waitrequest        = '0;
		assign pciess_reconfig_address        = '0;
		assign pciess_reconfig_write          = '0;
		assign pciess_reconfig_writedata      = '0;
		assign pciess_reconfig_read           = '0;
		
	end
	endgenerate




   //# SM HAL_TOP
//   pcie_hal_top #(
//KAHUAT_EDIT
//   `include "intel_pcie_qhip_hal_top_parameter_connection.iv"
//
//   . num_of_lanes                    ( sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl )
//
//   ) sm_pcie_hal_top_inst( 
   pcie_ed_dut_intel_pcie_gts_pcie_hal_top_300_un6p7py sm_pcie_hal_top_inst(
   // ----------------------------- hwtcl params -----------------------------
   // core16


    .        i_hio_txdata                                 ({ch4_tx_data,ch3_tx_data,ch2_tx_data,ch1_tx_data,ch0_tx_data}),
    .        i_hio_pld_reset_clk_row                      ({p0_hip_reconfig_clk,p0_hip_reconfig_clk,p0_hip_reconfig_clk,p0_hip_reconfig_clk,p0_hip_reconfig_clk}),
    .        o_hio_rxdata                                 ({ch4_rx_data,ch3_rx_data,ch2_rx_data,ch1_rx_data,ch0_rx_data}),
    .        i_hio_txdata_extra                           ('0),
    .        i_hio_txdata_fifo_wr_en                      ('0),
    .        i_hio_rxdata_fifo_rd_en                      ('0),
    .        o_hio_pcie_user_rx_clk1_clk                  (coreclkout_hip_w),
    .        o_hio_pcie_user_rx_clk2_clk                  (),
    .        o_hio_pcie_user_tx_clk1_clk                  (),
    .        o_hio_pcie_user_tx_clk2_clk                  (),
    .        o_hio_ch0_user_rx_clk1_clk                   (),
    .        o_hio_ch0_user_rx_clk2_clk                   (),
    .        o_hio_ch0_user_tx_clk1_clk                   (),
    .        o_hio_ch0_user_tx_clk2_clk                   (),
    
    .        o_hio_ch1_user_rx_clk1_clk                   (),
    .        o_hio_ch1_user_rx_clk2_clk                   (),
    .        o_hio_ch1_user_tx_clk1_clk                   (),
    .        o_hio_ch1_user_tx_clk2_clk                   (), 

    .        o_hio_ch2_user_rx_clk1_clk                   (),
    .        o_hio_ch2_user_rx_clk2_clk                   (),
    .        o_hio_ch2_user_tx_clk1_clk                   (),
    .        o_hio_ch2_user_tx_clk2_clk                   (),
    .        o_hio_ch3_user_rx_clk1_clk                   (),
    .        o_hio_ch3_user_rx_clk2_clk                   (),
    .        o_hio_ch3_user_tx_clk1_clk                   (),
    .        o_hio_ch3_user_tx_clk2_clk                   (),
    
    .        i_hio_ch0_lavmm_addr                         ('0),
    .        i_hio_ch0_lavmm_be                           ('0),
    .        i_hio_ch0_lavmm_read                         ('0),
    .        i_hio_ch0_lavmm_write                        ('0),
    .        i_hio_ch0_lavmm_wdata                        ('0),
    .        o_hio_ch0_lavmm_rdata                        (),
    .        o_hio_ch0_lavmm_rdata_valid                  (),
    .        o_hio_ch0_lavmm_waitreq                      (),
    .        i_hio_ch0_lavmm_rstn                         ('1),
    .        i_hio_ch0_lavmm_clk                          ('0),
    .        i_hio_ch0_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch0_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch0_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch0_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
 //   .        o_hio_ch0_user_rx_clk1_clk                   (coreclkout_hip_w),
 //   .        o_hio_ch0_user_rx_clk2_clk                   (),
 //   .        o_hio_ch0_user_tx_clk1_clk                   (),
 //   .        o_hio_ch0_user_tx_clk2_clk                   (),
    .        o_hio_ch0_ux_chnl_refclk_mux                 (),
    .        o_hio_ch0_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch0_xcvrif_tx_latency_pulse            (),
    .        i_hio_ch1_lavmm_addr                         (phy0_avmm_address),
    .        i_hio_ch1_lavmm_be                           (4'hF),
    .        i_hio_ch1_lavmm_read                         (phy0_avmm_read),
    .        i_hio_ch1_lavmm_write                        (phy0_avmm_write),
    .        i_hio_ch1_lavmm_wdata                        (phy0_avmm_writedata),
    .        o_hio_ch1_lavmm_rdata                        (phy0_avmm_readdata),
    .        o_hio_ch1_lavmm_rdata_valid                  (phy0_avmm_readdatavalid),
    .        o_hio_ch1_lavmm_waitreq                      (phy0_avmm_waitrequest),
    .        i_hio_ch1_lavmm_rstn                         (~ninit_done),
    .        i_hio_ch1_lavmm_clk                          (p0_hip_reconfig_clk),
    .        i_hio_ch1_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch1_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch1_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
 //   .        o_hio_ch1_user_rx_clk1_clk                   (coreclkout_hip_w),
 //   .        o_hio_ch1_user_rx_clk2_clk                   (),
 //   .        o_hio_ch1_user_tx_clk1_clk                   (),
 //   .        o_hio_ch1_user_tx_clk2_clk                   (),
    .        o_hio_ch1_ux_chnl_refclk_mux                 (),
    .        o_hio_ch1_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch1_xcvrif_tx_latency_pulse            (),
    .        i_hio_ch2_lavmm_addr                         (phy1_avmm_address),
    .        i_hio_ch2_lavmm_be                           (4'hF),
    .        i_hio_ch2_lavmm_read                         (phy1_avmm_read),
    .        i_hio_ch2_lavmm_write                        (phy1_avmm_write),
    .        i_hio_ch2_lavmm_wdata                        (phy1_avmm_writedata),
    .        o_hio_ch2_lavmm_rdata                        (phy1_avmm_readdata),
    .        o_hio_ch2_lavmm_rdata_valid                  (phy1_avmm_readdatavalid),
    .        o_hio_ch2_lavmm_waitreq                      (phy1_avmm_waitrequest),
    .        i_hio_ch2_lavmm_rstn                         (~ninit_done),
    .        i_hio_ch2_lavmm_clk                          (p0_hip_reconfig_clk),
    .        i_hio_ch2_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch2_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch2_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
 //   .        o_hio_ch2_user_rx_clk1_clk                   (coreclkout_hip_w),
 //   .        o_hio_ch2_user_rx_clk2_clk                   (),
 //   .        o_hio_ch2_user_tx_clk1_clk                   (),
 //   .        o_hio_ch2_user_tx_clk2_clk                   (),
    .        o_hio_ch2_ux_chnl_refclk_mux                 (),
    .        o_hio_ch2_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch2_xcvrif_tx_latency_pulse            (),
    .        i_hio_ch3_lavmm_addr                         (phy2_avmm_address),
    .        i_hio_ch3_lavmm_be                           (4'hF),
    .        i_hio_ch3_lavmm_read                         (phy2_avmm_read),
    .        i_hio_ch3_lavmm_write                        (phy2_avmm_write),
    .        i_hio_ch3_lavmm_wdata                        (phy2_avmm_writedata),
    .        o_hio_ch3_lavmm_rdata                        (phy2_avmm_readdata),
    .        o_hio_ch3_lavmm_rdata_valid                  (phy2_avmm_readdatavalid),
    .        o_hio_ch3_lavmm_waitreq                      (phy2_avmm_waitrequest),
    .        i_hio_ch3_lavmm_rstn                         (~ninit_done),
    .        i_hio_ch3_lavmm_clk                          (p0_hip_reconfig_clk),
    .        i_hio_ch3_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch3_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch3_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
 //   .        o_hio_ch3_user_rx_clk1_clk                   (coreclkout_hip_w),
 //   .        o_hio_ch3_user_rx_clk2_clk                   (),
 //   .        o_hio_ch3_user_tx_clk1_clk                   (),
 //   .        o_hio_ch3_user_tx_clk2_clk                   (),
    .        o_hio_ch3_ux_chnl_refclk_mux                 (),
    .        o_hio_ch3_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch3_xcvrif_tx_latency_pulse            (),
    .        i_hio_ch4_lavmm_addr                         (phy3_avmm_address),
    .        i_hio_ch4_lavmm_be                           (4'hF),
    .        i_hio_ch4_lavmm_read                         (phy3_avmm_read),
    .        i_hio_ch4_lavmm_write                        (phy3_avmm_write),
    .        i_hio_ch4_lavmm_wdata                        (phy3_avmm_writedata),
    .        o_hio_ch4_lavmm_rdata                        (phy3_avmm_readdata),
    .        o_hio_ch4_lavmm_rdata_valid                  (phy3_avmm_readdatavalid),
    .        o_hio_ch4_lavmm_waitreq                      (phy3_avmm_waitrequest),
    .        i_hio_ch4_lavmm_rstn                         (~ninit_done),
    .        i_hio_ch4_lavmm_clk                          (p0_hip_reconfig_clk),
    .        i_hio_ch4_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch4_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch4_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
 //   .        o_hio_ch4_user_rx_clk1_clk                   (coreclkout_hip_w),
 //   .        o_hio_ch4_user_rx_clk2_clk                   (),
 //   .        o_hio_ch4_user_tx_clk1_clk                   (),
 //   .        o_hio_ch4_user_tx_clk2_clk                   (),
    .        o_hio_ch4_ux_chnl_refclk_mux                 (),
    .        o_hio_ch4_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch4_xcvrif_tx_latency_pulse            (),

 /*   .        i_hio_ch1_lavmm_addr                         ('0),
    .        i_hio_ch1_lavmm_be                           ('0),
    .        i_hio_ch1_lavmm_read                         ('0),
    .        i_hio_ch1_lavmm_write                        ('0),
    .        i_hio_ch1_lavmm_wdata                        ('0),
    .        o_hio_ch1_lavmm_rdata                        (),
    .        o_hio_ch1_lavmm_rdata_valid                  (),
    .        o_hio_ch1_lavmm_waitreq                      (),
    .        i_hio_ch1_lavmm_rstn                         ('1),
    .        i_hio_ch1_lavmm_clk                          ('0),
    .        i_hio_ch1_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch1_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch1_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch1_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch0_user_rx_clk1_clk                   (),
    .        o_hio_ch0_user_rx_clk2_clk                   (),
    .        o_hio_ch0_user_tx_clk1_clk                   (),
    .        o_hio_ch0_user_tx_clk2_clk                   (),
    .        o_hio_ch1_ux_chnl_refclk_mux                 (),
    .        o_hio_ch1_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch1_xcvrif_tx_latency_pulse            (),*/

 /*   .        i_hio_ch2_lavmm_addr                         ('0),
    .        i_hio_ch2_lavmm_be                           ('0),
    .        i_hio_ch2_lavmm_read                         ('0),
    .        i_hio_ch2_lavmm_write                        ('0),
    .        i_hio_ch2_lavmm_wdata                        ('0),
    .        o_hio_ch2_lavmm_rdata                        (),
    .        o_hio_ch2_lavmm_rdata_valid                  (),
    .        o_hio_ch2_lavmm_waitreq                      (),
    .        i_hio_ch2_lavmm_rstn                         ('1),
    .        i_hio_ch2_lavmm_clk                          ('0),
    .        i_hio_ch2_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch2_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch2_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch2_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch1_user_rx_clk1_clk                   (),
    .        o_hio_ch1_user_rx_clk2_clk                   (),
    .        o_hio_ch1_user_tx_clk1_clk                   (),
    .        o_hio_ch1_user_tx_clk2_clk                   (),
    .        o_hio_ch2_ux_chnl_refclk_mux                 (),
    .        o_hio_ch2_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch2_xcvrif_tx_latency_pulse            (),*/

 /*   .        i_hio_ch3_lavmm_addr                         ('0),
    .        i_hio_ch3_lavmm_be                           ('0),
    .        i_hio_ch3_lavmm_read                         ('0),
    .        i_hio_ch3_lavmm_write                        ('0),
    .        i_hio_ch3_lavmm_wdata                        ('0),
    .        o_hio_ch3_lavmm_rdata                        (),
    .        o_hio_ch3_lavmm_rdata_valid                  (),
    .        o_hio_ch3_lavmm_waitreq                      (),
    .        i_hio_ch3_lavmm_rstn                         ('1),
    .        i_hio_ch3_lavmm_clk                          ('0),
    .        i_hio_ch3_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch3_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch3_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch3_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch2_user_rx_clk1_clk                   (),
    .        o_hio_ch2_user_rx_clk2_clk                   (),
    .        o_hio_ch2_user_tx_clk1_clk                   (),
    .        o_hio_ch2_user_tx_clk2_clk                   (),
    .        o_hio_ch3_ux_chnl_refclk_mux                 (),
    .        o_hio_ch3_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch3_xcvrif_tx_latency_pulse            (),*/

 /*   .        i_hio_ch4_lavmm_addr                         ('0),
    .        i_hio_ch4_lavmm_be                           ('0),
    .        i_hio_ch4_lavmm_read                         ('0),
    .        i_hio_ch4_lavmm_write                        ('0),
    .        i_hio_ch4_lavmm_wdata                        ('0),
    .        o_hio_ch4_lavmm_rdata                        (),
    .        o_hio_ch4_lavmm_rdata_valid                  (),
    .        o_hio_ch4_lavmm_waitreq                      (),
    .        i_hio_ch4_lavmm_rstn                         ('1),
    .        i_hio_ch4_lavmm_clk                          ('0),
    .        i_hio_ch4_pld_rx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch4_pld_tx_clk_in_row_clk              (coreclkout_hip_w),
    .        i_hio_ch4_det_lat_rx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_rx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_rx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_rx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_rx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_sampling_clk               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_dl_clk                  ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_mux_select              ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_sclk_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_sclk_gen_clk            ('0), //REVIEWED AND NOT REQUIRE.
    .        i_hio_ch4_det_lat_tx_trig_flop               ('0), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch3_user_rx_clk1_clk                   (),
    .        o_hio_ch3_user_rx_clk2_clk                   (),
    .        o_hio_ch3_user_tx_clk1_clk                   (),
    .        o_hio_ch3_user_tx_clk2_clk                   (),
    .        o_hio_ch4_ux_chnl_refclk_mux                 (),
    .        o_hio_ch4_det_lat_rx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_rx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_rx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_rx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_rx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_async_dl_sync           (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_async_pulse             (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_async_sample_sync       (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_sclk_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_det_lat_tx_trig_sample_sync        (), //REVIEWED AND NOT REQUIRE.
    .        o_hio_ch4_xcvrif_rx_latency_pulse            (),
    .        o_hio_ch4_xcvrif_tx_latency_pulse            (),*/

    .        i_hio_ptp_rst_n                              ('1), //REVIEWED.
    .        i_hio_ehip_rx_rst_n                          ('1), //REVIEWED.
    .        i_hio_ehip_tx_rst_n                          ('1), //REVIEWED.
    .        i_hio_ehip_signal_ok                         ('0), //REVIEWED.
    .        i_hio_sfreeze_2_r03f_rx_mac_srfz_n           ('0),
    .        i_hio_sfreeze_3_c2f_tx_deskew_srfz_n         ('0),
    .        i_hio_t03f_sfreeze_1_tx_pcs_sfrz_n           ('0),
    .        i_hio_rstfec_fec_rx_rst_n                    ('1),
    .        i_hio_rstfec_fec_tx_rst_n                    ('1),
    .        i_hio_rstfec_fec_csr_ret                     ('0),
    .        i_hio_rstfec_rx_fec_sfrz_n                   ('1),
    .        i_hio_rstfec_tx_fec_sfrz_n                   ('1),
    .        i_hio_rstxcvrif_xcvrif_rx_rst_n              ('1),
    .        i_hio_rstxcvrif_xcvrif_tx_rst_n              ('1),
    .        i_hio_rstxcvrif_xcvrif_signal_ok             ('0),
    .        i_hio_rstxcvrif_rx_xcvrif_sfrz_n             ('1),
    .        i_hio_rstxcvrif_tx_xcvrif_sfrz_n             ('1),
    .        i_hio_rst_pld_clrhip                         ('0),
    .        i_hio_rst_pld_clrpcs                         ('0),
    .        i_hio_rst_pld_perstn                         (i_gpio_perst0_n_db),
    .        i_hio_rst_pld_ready                          ('0),
    .        i_hio_rst_pld_adapter_rx_pld_rst_n           (pld_adapter_rx_pld_rst_n),
    .        i_hio_rst_pld_adapter_tx_pld_rst_n           (pld_adapter_tx_pld_rst_n),
    .        i_hio_rst_ux_rx_pma_rst_n                    ('1),
    .        i_hio_rst_ux_rx_sfrz                         ('0),
    .        i_hio_rst_ux_tx_pma_rst_n                    ('1),
    //.        i_hio_pld_reset_clk_row                      ({coreclkout_hip_w,coreclkout_hip_w,coreclkout_hip_w,coreclkout_hip_w,coreclkout_hip_w}),
    .        i_hio_uxquad_async                           ('0),
    .        i_hio_uxquad_async_pcie_mux                  ('0),
    //.        i_hio_lavmm_addr                             (),
    //.        i_hio_lavmm_be                               (),
    //.        i_hio_lavmm_clk                              (),
    //.        i_hio_lavmm_read                             (),
    //.        i_hio_lavmm_rstn                             (),
    //.        i_hio_lavmm_wdata                            (),
    //.        i_hio_lavmm_write                            (),
    //.        i_hio_pld_rx_clk_in_row_clk                  (),
    //.        i_hio_pld_tx_clk_in_row_clk                  (),
    //.        i_hio_det_lat_rx_dl_clk                      (),
    //.        i_hio_det_lat_rx_mux_select                  (),
    //.        i_hio_det_lat_rx_sclk_flop                   (),
    //.        i_hio_det_lat_rx_sclk_gen_clk                (),
    //.        i_hio_det_lat_rx_trig_flop                   (),
    //.        i_hio_det_lat_sampling_clk                   (),
    //.        i_hio_det_lat_tx_dl_clk                      (),
    //.        i_hio_det_lat_tx_mux_select                  (),
    //.        i_hio_det_lat_tx_sclk_flop                   (),
    //.        i_hio_det_lat_tx_sclk_gen_clk                (),
    //.        i_hio_det_lat_tx_trig_flop                   (),
    .        rx_serial_n                                  ({rx_n_in3,rx_n_in2,rx_n_in1,rx_n_in0}),
    .        rx_serial_p                                  ({rx_p_in3,rx_p_in2,rx_p_in1,rx_p_in0}), 
    //.        i_hio_tx_pfc                                 ()     (),//bits defined
    //.        i_hio_tx_pause                               ()     (),//bits defined
    //.        i_hio_clear_internal                         ()     (),//bits defined
    //.        i_hio_signal_ok                              ()     (),//bits defined
    //.        i_hio_pld_ready                              ()     (),//bits defined
    //.        i_hio_pma_rx_sf                              ()     (),//bits defined
    //.        i_hio_ch_rstxcvrif_lphy_signal_ok            ()     (),//bits defined
    //.        i_clear_tx_internal_err                      ()     (),//bits defined 
    .        o_hio_txdata_fifo_wr_empty                   (),
    .        o_hio_txdata_fifo_wr_pempty                  (),
    .        o_hio_txdata_fifo_wr_full                    (),
    .        o_hio_txdata_fifo_wr_pfull                   (),
    //.        o_hio_rxdata                                 ({ch4_rx_data,ch3_rx_data,ch2_rx_data,ch1_rx_data,ch0_rx_data}),    
    .        o_hio_rxdata_extra                           (),
    .        o_hio_rxdata_fifo_rd_empty                   (),
    .        o_hio_rxdata_fifo_rd_pempty                  (),
    .        o_hio_rxdata_fifo_rd_full                    (),
    .        o_hio_rxdata_fifo_rd_pfull                   (),
    .        o_hio_rstepcs_rx_pcs_fully_aligned           (),
    .        o_hio_rstfec_fec_rx_rdy_n                    (),
    .        o_hio_rst_flux0_cpi_cmn_busy                 (),
    .        o_hio_rst_oflux_rx_srds_rdy                  (),
    .        o_hio_rst_ux_all_synthlockstatus             (),
    .        o_hio_rst_ux_octl_pcs_rxstatus               (),
    .        o_hio_rst_ux_octl_pcs_txstatus               (),
    .        o_hio_rst_ux_rxcdrlock2data                  (),
    .        o_hio_rst_ux_rxcdrlockstatus                 (),
    .        o_hio_uxquad_async                           (),
    //.      o_hio_lavmm_rdata                              (),
    //.      o_hio_lavmm_rdata_valid                        (),
    //.      o_hio_lavmm_waitreq                            (),
    //.      k_user_rx_clk1_c0c1c2_sel                      (),
    //.      k_user_rx_clk2_c0c1c2_sel                      (),
    //.      k_user_tx_clk1_c0c1c2_sel                      (),
    //.      k_user_tx_clk2_c0c1c2_sel                      (),
    //.      o_hio_user_rx_clk1_clk                         (),
    //.      o_hio_user_rx_clk2_clk                         (),
    //.      o_hio_user_tx_clk1_clk                         (),
    //.      o_hio_user_tx_clk2_clk                         (),
    //.      o_hio_ux_chnl_refclk_mux                       (),
    //.      o_hio_det_lat_rx_async_dl_sync                 (),
    //.      o_hio_det_lat_rx_async_pulse                   (),
    //.      o_hio_det_lat_rx_async_sample_sync             (),
    //.      o_hio_det_lat_rx_sclk_sample_sync              (),
    //.      o_hio_det_lat_rx_trig_sample_sync              (),
    //.      o_hio_det_lat_tx_async_dl_sync                 (),
    //.      o_hio_det_lat_tx_async_pulse                   (),
    //.      o_hio_det_lat_tx_async_sample_sync             (),
    //.      o_hio_det_lat_tx_sclk_sample_sync              (),
    //.      o_hio_det_lat_tx_trig_sample_sync              (),
    //.      o_hio_xcvrif_rx_latency_pulse                  (),
    //.      o_hio_xcvrif_tx_latency_pulse                  (),
    .      tx_serial_p                                    ({tx_p_out3,tx_p_out2,tx_p_out1,tx_p_out0}),
    .      tx_serial_n                                    ({tx_n_out3,tx_n_out2,tx_n_out1,tx_n_out0}),
    //.      o_hio_local_fault                              ()     (),//bits defined
    //.      o_hio_remote_fault                             ()     (),//bits defined
    //.      o_hio_rx_pause                                 ()     (),//bits defined
    //.      o_hio_rx_pfc                                   ()     (),//bits defined
    //.      o_hio_txfifo_pfull                             ()     (),//bits defined
    //.      o_hio_dsk_err                                  ()     (),//bits defined
    //.      o_hio_dsk_mon_err                              ()     (),//bits defined
    //.      o_hio_hip_ready                                ()     (),//bits defined
    //.      o_hio_rx_block_lock                            ()     (),//bits defined
    //.      o_hio_rx_dsk_done                              ()     (),//bits defined
    //.      o_hio_rx_am_lock                               ()     (),//bits defined
    //.      o_hio_rx_pcs_fully_aligned                     ()     (),//bits defined
    //.      o_hio_hi_ber                                   ()     (),//bits defined
    //.      o_hio_rx_pcs_internal_err                      ()     (),//bits defined
    //.      o_hio_tx_fifo_status_fifo_wr_pfull             ()     (),//bits defined
    //.      o_hio_tx_fifo_status_fifo_pempty               ()     (),//bits defined
    //.      o_hio_rx_fifo_status_fifo_pempty               ()     (),//bits defined
    //.      o_hio_rx_fifo_status_fifo_wr_pfull             ()     (),//bits defined
    //.      o_hio_rx_fifo_status_fifo_empty                ()     (),//bits defined
    //.      o_hio_tx_fifo_status_fifo_empty                ()     (),//bits defined
    //.      o_hio_rx_fifo_status_gb_restarted              ()     (),//bits defined
    //.      o_hio_tx_fifo_status_gb_restarted                        //bits defined 

    .    i_hio_txdata_async                               (i_hio_txdata_async),   
    .    i_hio_txdata_direct                              ('0),   
    .    o_hio_rxdata_async                               (o_hio_rxdata_async),    
    .    o_hio_rxdata_direct                              (),

    
//KAHUAT_EDIT
//    .    i_ch0_tx_data   ('0),                             
//    .    i_ch1_tx_data   ('0),                             
//    .    i_ch2_tx_data   ('0),                             
//    .    i_ch3_tx_data   ('0),                             
//    .    i_ch4_tx_data   ('0),                             
//    .    i_ch5_tx_data   ('0),                             //KAHUAT_EDIT
//    .    i_ch6_tx_data   ('0),                             //KAHUAT_EDIT
//    .    i_ch7_tx_data   ('0),                             //KAHUAT_EDIT
//    .    i_ch8_tx_data   ('0),                             //KAHUAT_EDIT
    .     i_pin_perst_n    (pin_perst_n),                             
    .     i_rxpipe4_dirfeedback    ('0),                     
    .     i_rxpipe4_linkevaluationfeedbackfiguremerit        ('0),
    .     i_rxpipe4_localfs    ('0),                         
    .     i_rxpipe4_locallf    ('0),                         
    .     i_rxpipe4_localtxcoefficientsvalid    ('0),        
    .     i_rxpipe4_localtxpresetcoefficients    ('0),       
    .     i_rxpipe4_p2m_bus    ('0),                         
    .     i_rxpipe4_pclkchangeok    ('0),                    
    .     i_rxpipe4_phystatus    ('0),                       
    .     i_rxpipe4_rxdata    ('0),                          
    .     i_rxpipe4_rxdatak    ('0),                         
    .     i_rxpipe4_rxdatavalid    ('0),                     
    .     i_rxpipe4_rxelecidlea    ('0),                     
    .     i_rxpipe4_rxstandbystatus    ('0),                 
    .     i_rxpipe4_rxstartblock    ('0),                    
    .     i_rxpipe4_rxstatus    ('0),                        
    .     i_rxpipe4_rxsyncheader    ('0),                    
    .     i_rxpipe4_rxvalid    ('0),                         
    .     i_rxpipe5_dirfeedback    ('0),                     
    .     i_rxpipe5_linkevaluationfeedbackfiguremerit     ('0),
    .     i_rxpipe5_localfs    ('0),                         
    .     i_rxpipe5_locallf    ('0),                         
    .     i_rxpipe5_localtxcoefficientsvalid    ('0),        
    .     i_rxpipe5_localtxpresetcoefficients    ('0),       
    .     i_rxpipe5_p2m_bus    ('0),                         
    .     i_rxpipe5_pclkchangeok    ('0),                    
    .     i_rxpipe5_phystatus    ('0),                       
    .     i_rxpipe5_rxdata    ('0),                          
    .     i_rxpipe5_rxdatak    ('0),                         
    .     i_rxpipe5_rxdatavalid    ('0),                     
    .     i_rxpipe5_rxelecidlea    ('0),                     
    .     i_rxpipe5_rxstandbystatus    ('0),                 
    .     i_rxpipe5_rxstartblock    ('0),                    
    .     i_rxpipe5_rxstatus    ('0),                        
    .     i_rxpipe5_rxsyncheader    ('0),                    
    .     i_rxpipe5_rxvalid    ('0),                         
    .     i_rxpipe6_dirfeedback    ('0),                     
    .     i_rxpipe6_linkevaluationfeedbackfiguremerit          ('0),
    .     i_rxpipe6_localfs    ('0),                         
    .     i_rxpipe6_locallf    ('0),                         
    .     i_rxpipe6_localtxcoefficientsvalid    ('0),        
    .     i_rxpipe6_localtxpresetcoefficients    ('0),       
    .     i_rxpipe6_p2m_bus    ('0),                         
    .     i_rxpipe6_pclkchangeok    ('0),                    
    .     i_rxpipe6_phystatus    ('0),                       
    .     i_rxpipe6_rxdata    ('0),                          
    .     i_rxpipe6_rxdatak    ('0),                         
    .     i_rxpipe6_rxdatavalid    ('0),                     
    .     i_rxpipe6_rxelecidlea    ('0),                     
    .     i_rxpipe6_rxstandbystatus    ('0),                 
    .     i_rxpipe6_rxstartblock    ('0),                    
    .     i_rxpipe6_rxstatus    ('0),                        
    .     i_rxpipe6_rxsyncheader    ('0),                    
    .     i_rxpipe6_rxvalid    ('0),                         
    .     i_rxpipe7_dirfeedback    ('0),                     
    .     i_rxpipe7_linkevaluationfeedbackfiguremerit   ('0),
    .     i_rxpipe7_localfs    ('0),                         
    .     i_rxpipe7_locallf    ('0),                         
    .     i_rxpipe7_localtxcoefficientsvalid    ('0),        
    .     i_rxpipe7_localtxpresetcoefficients    ('0),       
    .     i_rxpipe7_p2m_bus    ('0),                         
    .     i_rxpipe7_pclkchangeok    ('0),                    
    .     i_rxpipe7_phystatus    ('0),                       
    .     i_rxpipe7_rxdata    ('0),                          
    .     i_rxpipe7_rxdatak    ('0),                         
    .     i_rxpipe7_rxdatavalid    ('0),                     
    .     i_rxpipe7_rxelecidlea    ('0),                     
    .     i_rxpipe7_rxstandbystatus    ('0),                 
    .     i_rxpipe7_rxstartblock    ('0),                    
    .     i_rxpipe7_rxstatus    ('0),                        
    .     i_rxpipe7_rxsyncheader    ('0),                    
    .     i_rxpipe7_rxvalid    ('0),                         
//    .     o_ch0_rx_data    (),                             
//    .     o_ch1_rx_data    (),                             
//    .     o_ch2_rx_data    (),                             
//    .     o_ch3_rx_data    (),                             
//    .     o_ch4_rx_data    (),                             
//    .     o_ch5_rx_data    (),                             //KAHUAT_EDIT
//    .     o_ch6_rx_data    (),                             //KAHUAT_EDIT
//    .     o_ch7_rx_data    (),                             //KAHUAT_EDIT
//    .     o_ch8_rx_data    (),                             //KAHUAT_EDIT
    .     o_pcs4_pipe_rst_n    (),                         
    .     o_pcs5_pipe_rst_n    (),                         
    .     o_pcs6_pipe_rst_n    (),                         
    .     o_pcs7_pipe_rst_n    (),                         
    .     o_txpipe4_asyncpowerchangeack    (),             
    .     o_txpipe4_blockaligncontrol    (),               
    .     o_txpipe4_cfg_hw_auto_sp_dis    (),              
    .     o_txpipe4_dirchange    (),                       
    .     o_txpipe4_ebuf_mode    (),                       
    .     o_txpipe4_encodedecodebypass    (),              
    .     o_txpipe4_fs    (),                              
    .     o_txpipe4_getlocalpresetcoefficients    (),      
    .     o_txpipe4_invalidrequest    (),                  
    .     o_txpipe4_lf    (),                              
    .     o_txpipe4_localpresetindex    (),                
    .     o_txpipe4_lowpin_nt    (),                       
    .     o_txpipe4_m2p_bus    (),                         
    .     o_txpipe4_pclk_rate    (),                       
    .     o_txpipe4_pclkchangeack    (),                   
    .     o_txpipe4_phy_mode_nt    (),                     
    .     o_txpipe4_powerdown    (),                       
    .     o_txpipe4_rate    (),                            
    .     o_txpipe4_rxelecidle_disable_a    (),            
    .     o_txpipe4_rxeqclr    (),                         
    .     o_txpipe4_rxeqeval    (),                        
    .     o_txpipe4_rxeqinprogress    (),                  
    .     o_txpipe4_rxeqtraining    (),                    
    .     o_txpipe4_rxpolarity    (),                      
    .     o_txpipe4_rxpresethint    (),                    
    .     o_txpipe4_rxstandby    (),                       
    .     o_txpipe4_rxtermination    (),                   
    .     o_txpipe4_srisenable    (),                      
    .     o_txpipe4_txcmnmode_disable_a    (),             
    .     o_txpipe4_txcompliance    (),                    
    .     o_txpipe4_txdata    (),                          
    .     o_txpipe4_txdatak    (),                         
    .     o_txpipe4_txdatavalid    (),                     
    .     o_txpipe4_txdeemph    (),                        
    .     o_txpipe4_txdtctrx_lb    (),                     
    .     o_txpipe4_txelecidle    (),                      
    .     o_txpipe4_txmargin    (),                        
    .     o_txpipe4_txoneszeros    (),                     
    .     o_txpipe4_txstartblock    (),                    
    .     o_txpipe4_txswing    (),                         
    .     o_txpipe4_txsyncheader    (),                    
    .     o_txpipe4_width    (),                           
    .     o_txpipe5_asyncpowerchangeack    (),             
    .     o_txpipe5_blockaligncontrol    (),               
    .     o_txpipe5_cfg_hw_auto_sp_dis    (),              
    .     o_txpipe5_dirchange    (),                       
    .     o_txpipe5_ebuf_mode    (),                       
    .     o_txpipe5_encodedecodebypass    (),              
    .     o_txpipe5_fs    (),                              
    .     o_txpipe5_getlocalpresetcoefficients    (),      
    .     o_txpipe5_invalidrequest    (),                  
    .     o_txpipe5_lf    (),                              
    .     o_txpipe5_localpresetindex    (),                
    .     o_txpipe5_lowpin_nt    (),                       
    .     o_txpipe5_m2p_bus    (),                         
    .     o_txpipe5_pclk_rate    (),                       
    .     o_txpipe5_pclkchangeack    (),                   
    .     o_txpipe5_phy_mode_nt    (),                     
    .     o_txpipe5_powerdown    (),                       
    .     o_txpipe5_rate    (),                            
    .     o_txpipe5_rxelecidle_disable_a    (),            
    .     o_txpipe5_rxeqclr    (),                         
    .     o_txpipe5_rxeqeval    (),                        
    .     o_txpipe5_rxeqinprogress    (),                  
    .     o_txpipe5_rxeqtraining    (),                    
    .     o_txpipe5_rxpolarity    (),                      
    .     o_txpipe5_rxpresethint    (),                    
    .     o_txpipe5_rxstandby    (),                       
    .     o_txpipe5_rxtermination    (),                   
    .     o_txpipe5_srisenable    (),                      
    .     o_txpipe5_txcmnmode_disable_a    (),             
    .     o_txpipe5_txcompliance    (),                    
    .     o_txpipe5_txdata    (),                          
    .     o_txpipe5_txdatak    (),                         
    .     o_txpipe5_txdatavalid    (),                     
    .     o_txpipe5_txdeemph    (),                        
    .     o_txpipe5_txdtctrx_lb    (),                     
    .     o_txpipe5_txelecidle    (),                      
    .     o_txpipe5_txmargin    (),                        
    .     o_txpipe5_txoneszeros    (),                     
    .     o_txpipe5_txstartblock    (),                    
    .     o_txpipe5_txswing    (),                         
    .     o_txpipe5_txsyncheader    (),                    
    .     o_txpipe5_width    (),                           
    .     o_txpipe6_asyncpowerchangeack    (),             
    .     o_txpipe6_blockaligncontrol    (),               
    .     o_txpipe6_cfg_hw_auto_sp_dis    (),              
    .     o_txpipe6_dirchange    (),                       
    .     o_txpipe6_ebuf_mode    (),                       
    .     o_txpipe6_encodedecodebypass    (),              
    .     o_txpipe6_fs    (),                              
    .     o_txpipe6_getlocalpresetcoefficients    (),      
    .     o_txpipe6_invalidrequest    (),                  
    .     o_txpipe6_lf    (),                              
    .     o_txpipe6_localpresetindex    (),                
    .     o_txpipe6_lowpin_nt    (),                       
    .     o_txpipe6_m2p_bus    (),                         
    .     o_txpipe6_pclk_rate    (),                       
    .     o_txpipe6_pclkchangeack    (),                   
    .     o_txpipe6_phy_mode_nt    (),                     
    .     o_txpipe6_powerdown    (),                       
    .     o_txpipe6_rate    (),                            
    .     o_txpipe6_rxelecidle_disable_a    (),            
    .     o_txpipe6_rxeqclr    (),                         
    .     o_txpipe6_rxeqeval    (),                        
    .     o_txpipe6_rxeqinprogress    (),                  
    .     o_txpipe6_rxeqtraining    (),                    
    .     o_txpipe6_rxpolarity    (),                      
    .     o_txpipe6_rxpresethint    (),                    
    .     o_txpipe6_rxstandby    (),                       
    .     o_txpipe6_rxtermination    (),                   
    .     o_txpipe6_srisenable    (),                      
    .     o_txpipe6_txcmnmode_disable_a    (),             
    .     o_txpipe6_txcompliance    (),                    
    .     o_txpipe6_txdata    (),                          
    .     o_txpipe6_txdatak    (),                         
    .     o_txpipe6_txdatavalid    (),                     
    .     o_txpipe6_txdeemph    (),                        
    .     o_txpipe6_txdtctrx_lb    (),                     
    .     o_txpipe6_txelecidle    (),                      
    .     o_txpipe6_txmargin    (),                        
    .     o_txpipe6_txoneszeros    (),                     
    .     o_txpipe6_txstartblock    (),                    
    .     o_txpipe6_txswing    (),                         
    .     o_txpipe6_txsyncheader    (),                    
    .     o_txpipe6_width    (),                           
    .     o_txpipe7_asyncpowerchangeack    (),             
    .     o_txpipe7_blockaligncontrol    (),               
    .     o_txpipe7_cfg_hw_auto_sp_dis    (),              
    .     o_txpipe7_dirchange    (),                       
    .     o_txpipe7_ebuf_mode    (),                       
    .     o_txpipe7_encodedecodebypass    (),              
    .     o_txpipe7_fs    (),                              
    .     o_txpipe7_getlocalpresetcoefficients    (),      
    .     o_txpipe7_invalidrequest    (),                  
    .     o_txpipe7_lf    (),                              
    .     o_txpipe7_localpresetindex    (),                
    .     o_txpipe7_lowpin_nt    (),                       
    .     o_txpipe7_m2p_bus    (),                         
    .     o_txpipe7_pclk_rate    (),                       
    .     o_txpipe7_pclkchangeack    (),                   
    .     o_txpipe7_phy_mode_nt    (),                     
    .     o_txpipe7_powerdown    (),                       
    .     o_txpipe7_rate    (),                            
    .     o_txpipe7_rxelecidle_disable_a    (),            
    .     o_txpipe7_rxeqclr    (),                         
    .     o_txpipe7_rxeqeval    (),                        
    .     o_txpipe7_rxeqinprogress    (),                  
    .     o_txpipe7_rxeqtraining    (),                    
    .     o_txpipe7_rxpolarity    (),                      
    .     o_txpipe7_rxpresethint    (),                    
    .     o_txpipe7_rxstandby    (),                       
    .     o_txpipe7_rxtermination    (),                   
    .     o_txpipe7_srisenable    (),                      
    .     o_txpipe7_txcmnmode_disable_a    (),             
    .     o_txpipe7_txcompliance    (),                    
    .     o_txpipe7_txdata    (),                          
    .     o_txpipe7_txdatak    (),                         
    .     o_txpipe7_txdatavalid    (),                     
    .     o_txpipe7_txdeemph    (),                        
    .     o_txpipe7_txdtctrx_lb    (),                     
    .     o_txpipe7_txelecidle    (),                      
    .     o_txpipe7_txmargin    (),                        
    .     o_txpipe7_txoneszeros    (),                     
    .     o_txpipe7_txstartblock    (),                    
    .     o_txpipe7_txswing    (),                         
    .     o_txpipe7_txsyncheader    (),                    
    .     o_txpipe7_width    (),                            

    .     i_refclk_tx_p           (refclk0),
//    .     i_refclk_tx_n           (refclk0_n),//can derive as negated i_refclk_tx_p
    .     i_syspll_c0_clk         (i_syspll_c0_clk),//connect to output of syspll
    .     i_syspll_c1_clk         ('0),
    .     i_syspll_c2_clk         ('0),
    .     i_flux_clk              (i_flux_clk),
    .     i_refclk_rx_p           (refclk0),
//    .     i_refclk_rx_n           (refclk0_n),
    .     i_ss_vccl_syspll_locked (i_ss_vccl_syspll_locked)  //connect to locked signal of syspll output

    );//hal_top instantion end

  altera_std_synchronizer_nocut i_gpio_perst0_n_sync_inst ( .clk (coreclkout_hip_w), .reset_n (~ninit_done), .din (i_gpio_perst0_n), .dout (i_gpio_perst0_n_sync));

  altera_std_synchronizer u_axi_st_areset_n_axi_st_clk_sync
  (
     .clk      (p0_axi_st_clk),
     .reset_n  (p0_axi_st_areset_n),
     .din      (1'b1),
     .dout     (p0_axi_st_areset_n_axi_clk_sync)
  );

  altera_std_synchronizer u_axi_lite_areset_n_axi_lite_clk_sync
  (
     .clk      (p0_axi_lite_clk),
     .reset_n  (p0_axi_lite_areset_n),
     .din      (1'b1),
     .dout     (p0_axi_lite_areset_n_axi_clk_sync)
  );

sm_pcie_sip_top # ( 
  //SM QHIP sm_pcie_sip_top parameter 
  //`include "intel_pcie_sm_qhip_ast_qhip_parameter_connection.iv"
  
   
   //.topology                                                    (topology),

   .core16_tdata_width_integer_hwtcl	                        (core16_tdata_width_integer_hwtcl),
   .core16_empty_width_integer_hwtcl                            (core16_empty_width_integer_hwtcl),

   .ctop_core16_virtual_rp_ep_mode                               (ctop_core16_virtual_rp_ep_mode),
   .core16_virtual_tlp_bypass_en_hwtcl                           (core16_virtual_tlp_bypass_en_hwtcl),
   .core16_total_pf_count_width_hwtcl                            (core16_total_pf_count_width_hwtcl),
   .core16_total_vf_count_width_hwtcl                            (core16_total_vf_count_width_hwtcl),
   .core16_total_pf_count_hwtcl                                  (core16_total_pf_count_hwtcl),
   .core16_total_vf_count_hwtcl                                  (core16_total_vf_count_hwtcl),

   // PCS Reconfig
   .PCS_CONFIG_EN                                               (PCS_CONFIG_EN),
   .core16_hip_reconfig_hwtcl                                    (core16_hip_reconfig_hwtcl),
   .xcvr_reconfig_hwtcl                                         (xcvr_reconfig_hwtcl),

   // rx_buffer_limit
   .core16_enable_rx_buffer_limit_ports_hwtcl                  (core16_enable_rx_buffer_limit_ports_hwtcl),

   // PTM
   .core16_virtual_ptm_hwtcl                                     (core16_virtual_ptm_hwtcl),

   // ARI_ACS_FUN_GRP_CAP
   .ctop_core16_pf0_ari_acs_fun_grp_cap                          (ctop_core16_pf0_ari_acs_fun_grp_cap), 

   // Debug Toolkit
   .debug_toolkit_hwtcl                                   (debug_toolkit_hwtcl),
   .enable_pciess_register_access_hwtcl                   (enable_pciess_register_access_hwtcl),
   .link_insp_en_hwtcl                                    (link_insp_en_hwtcl),
   .link_insp_avmm_en_hwtcl                               (link_insp_avmm_en_hwtcl),

   //Independent pin perst
   .ctop_virtual_x16_perst_sel                                  (ctop_virtual_x16_perst_sel),

   // ECC enable	   
   .core16_enable_ecc_hwtcl                                    (core16_enable_ecc_hwtcl),

   //USER_MODE_TO_PLD_IN_USE
   .core16_user_mode_to_pld_in_use_hwtcl                       (core16_user_mode_to_pld_in_use_hwtcl),

   // pld_warm_rst_rdy
   .core16_enable_pld_warm_rst_rdy_hwtcl                       (core16_enable_pld_warm_rst_rdy_hwtcl),

   // max payload
   .ctop_core16_virtual_maxpayload_size                        (ctop_core16_virtual_maxpayload_size ),
   
   // ast_parity
   .core16_use_ast_parity_hwtcl                                (core16_use_ast_parity_hwtcl         ),
   
   // Power Management
   .core16_enable_power_mgnt_intf_hwtcl                        (core16_enable_power_mgnt_intf_hwtcl ),

   // Error Interface
   .core16_enable_error_intf_hwtcl                             (core16_enable_error_intf_hwtcl      ),
   
   // FLR
   .core16_flr_cap_hwtcl                                       (core16_flr_cap_hwtcl                ),
   
   // cpl_timeout
   .core16_enable_cpl_timeout_hwtcl                            (core16_enable_cpl_timeout_hwtcl     ),
   
   // multi_func
   .core16_enable_multi_func_hwtcl                               (core16_enable_multi_func_hwtcl        ),
   
   // SRIOV
   .core16_enable_sriov_hwtcl                                    (core16_enable_sriov_hwtcl             ),
   
   // 10-bit tag
   

   // Virtio
   .core16_enable_virtio_hwtcl                                   (core16_enable_virtio_hwtcl),
   .core16_virtio_start_byte_address_hwtcl                       (core16_virtio_start_byte_address_hwtcl),
   .core16_pf0_virtio_capability_present_hwtcl                   (core16_pf0_virtio_capability_present_hwtcl),
   .core16_pf0_virtio_device_specific_cap_present_hwtcl          (core16_pf0_virtio_device_specific_cap_present_hwtcl),
   .core16_pf0_virtio_cmn_config_bar_indicator_hwtcl             (core16_pf0_virtio_cmn_config_bar_indicator_hwtcl),
   .core16_pf0_virtio_cmn_config_bar_offset_hwtcl                (core16_pf0_virtio_cmn_config_bar_offset_hwtcl),
   .core16_pf0_virtio_cmn_config_structure_length_hwtcl          (core16_pf0_virtio_cmn_config_structure_length_hwtcl),
   .core16_pf0_virtio_notification_bar_indicator_hwtcl           (core16_pf0_virtio_notification_bar_indicator_hwtcl),
   .core16_pf0_virtio_notification_bar_offset_hwtcl              (core16_pf0_virtio_notification_bar_offset_hwtcl),
   .core16_pf0_virtio_notification_structure_length_hwtcl        (core16_pf0_virtio_notification_structure_length_hwtcl),
   .core16_pf0_virtio_notify_off_multiplier_hwtcl                (core16_pf0_virtio_notify_off_multiplier_hwtcl),
   .core16_pf0_virtio_isrstatus_bar_indicator_hwtcl              (core16_pf0_virtio_isrstatus_bar_indicator_hwtcl),
   .core16_pf0_virtio_isrstatus_bar_offset_hwtcl                 (core16_pf0_virtio_isrstatus_bar_offset_hwtcl),
   .core16_pf0_virtio_isrstatus_structure_length_hwtcl           (core16_pf0_virtio_isrstatus_structure_length_hwtcl),
   .core16_pf0_virtio_devspecific_bar_indicator_hwtcl            (core16_pf0_virtio_devspecific_bar_indicator_hwtcl),
   .core16_pf0_virtio_devspecific_bar_offset_hwtcl               (core16_pf0_virtio_devspecific_bar_offset_hwtcl),
   .core16_pf0_virtio_devspecific_structure_length_hwtcl         (core16_pf0_virtio_devspecific_structure_length_hwtcl),
   .core16_pf0_virtio_pciconfig_access_bar_indicator_hwtcl       (core16_pf0_virtio_pciconfig_access_bar_indicator_hwtcl),
   .core16_pf0_virtio_pciconfig_access_bar_offset_hwtcl          (core16_pf0_virtio_pciconfig_access_bar_offset_hwtcl),
   .core16_pf0_virtio_pciconfig_access_structure_length_hwtcl    (core16_pf0_virtio_pciconfig_access_structure_length_hwtcl),
   .core16_pf1_virtio_capability_present_hwtcl                   (core16_pf1_virtio_capability_present_hwtcl),
   .core16_pf1_virtio_device_specific_cap_present_hwtcl          (core16_pf1_virtio_device_specific_cap_present_hwtcl),
   .core16_pf1_virtio_cmn_config_bar_indicator_hwtcl             (core16_pf1_virtio_cmn_config_bar_indicator_hwtcl),
   .core16_pf1_virtio_cmn_config_bar_offset_hwtcl                (core16_pf1_virtio_cmn_config_bar_offset_hwtcl),
   .core16_pf1_virtio_cmn_config_structure_length_hwtcl          (core16_pf1_virtio_cmn_config_structure_length_hwtcl),
   .core16_pf1_virtio_notification_bar_indicator_hwtcl           (core16_pf1_virtio_notification_bar_indicator_hwtcl),
   .core16_pf1_virtio_notification_bar_offset_hwtcl              (core16_pf1_virtio_notification_bar_offset_hwtcl),
   .core16_pf1_virtio_notification_structure_length_hwtcl        (core16_pf1_virtio_notification_structure_length_hwtcl),
   .core16_pf1_virtio_notify_off_multiplier_hwtcl                (core16_pf1_virtio_notify_off_multiplier_hwtcl),
   .core16_pf1_virtio_isrstatus_bar_indicator_hwtcl              (core16_pf1_virtio_isrstatus_bar_indicator_hwtcl),
   .core16_pf1_virtio_isrstatus_bar_offset_hwtcl                 (core16_pf1_virtio_isrstatus_bar_offset_hwtcl),
   .core16_pf1_virtio_isrstatus_structure_length_hwtcl           (core16_pf1_virtio_isrstatus_structure_length_hwtcl),
   .core16_pf1_virtio_devspecific_bar_indicator_hwtcl            (core16_pf1_virtio_devspecific_bar_indicator_hwtcl),
   .core16_pf1_virtio_devspecific_bar_offset_hwtcl               (core16_pf1_virtio_devspecific_bar_offset_hwtcl),
   .core16_pf1_virtio_devspecific_structure_length_hwtcl         (core16_pf1_virtio_devspecific_structure_length_hwtcl),
   .core16_pf1_virtio_pciconfig_access_bar_indicator_hwtcl       (core16_pf1_virtio_pciconfig_access_bar_indicator_hwtcl),
   .core16_pf1_virtio_pciconfig_access_bar_offset_hwtcl          (core16_pf1_virtio_pciconfig_access_bar_offset_hwtcl),
   .core16_pf1_virtio_pciconfig_access_structure_length_hwtcl    (core16_pf1_virtio_pciconfig_access_structure_length_hwtcl),
   .core16_pf2_virtio_capability_present_hwtcl                   (core16_pf2_virtio_capability_present_hwtcl),
   .core16_pf2_virtio_device_specific_cap_present_hwtcl          (core16_pf2_virtio_device_specific_cap_present_hwtcl),
   .core16_pf2_virtio_cmn_config_bar_indicator_hwtcl             (core16_pf2_virtio_cmn_config_bar_indicator_hwtcl),
   .core16_pf2_virtio_cmn_config_bar_offset_hwtcl                (core16_pf2_virtio_cmn_config_bar_offset_hwtcl),
   .core16_pf2_virtio_cmn_config_structure_length_hwtcl          (core16_pf2_virtio_cmn_config_structure_length_hwtcl),
   .core16_pf2_virtio_notification_bar_indicator_hwtcl           (core16_pf2_virtio_notification_bar_indicator_hwtcl),
   .core16_pf2_virtio_notification_bar_offset_hwtcl              (core16_pf2_virtio_notification_bar_offset_hwtcl),
   .core16_pf2_virtio_notification_structure_length_hwtcl        (core16_pf2_virtio_notification_structure_length_hwtcl),
   .core16_pf2_virtio_notify_off_multiplier_hwtcl                (core16_pf2_virtio_notify_off_multiplier_hwtcl),
   .core16_pf2_virtio_isrstatus_bar_indicator_hwtcl              (core16_pf2_virtio_isrstatus_bar_indicator_hwtcl),
   .core16_pf2_virtio_isrstatus_bar_offset_hwtcl                 (core16_pf2_virtio_isrstatus_bar_offset_hwtcl),
   .core16_pf2_virtio_isrstatus_structure_length_hwtcl           (core16_pf2_virtio_isrstatus_structure_length_hwtcl),
   .core16_pf2_virtio_devspecific_bar_indicator_hwtcl            (core16_pf2_virtio_devspecific_bar_indicator_hwtcl),
   .core16_pf2_virtio_devspecific_bar_offset_hwtcl               (core16_pf2_virtio_devspecific_bar_offset_hwtcl),
   .core16_pf2_virtio_devspecific_structure_length_hwtcl         (core16_pf2_virtio_devspecific_structure_length_hwtcl),
   .core16_pf2_virtio_pciconfig_access_bar_indicator_hwtcl       (core16_pf2_virtio_pciconfig_access_bar_indicator_hwtcl),
   .core16_pf2_virtio_pciconfig_access_bar_offset_hwtcl          (core16_pf2_virtio_pciconfig_access_bar_offset_hwtcl),
   .core16_pf2_virtio_pciconfig_access_structure_length_hwtcl    (core16_pf2_virtio_pciconfig_access_structure_length_hwtcl),
   .core16_pf3_virtio_capability_present_hwtcl                   (core16_pf3_virtio_capability_present_hwtcl),
   .core16_pf3_virtio_device_specific_cap_present_hwtcl          (core16_pf3_virtio_device_specific_cap_present_hwtcl),
   .core16_pf3_virtio_cmn_config_bar_indicator_hwtcl             (core16_pf3_virtio_cmn_config_bar_indicator_hwtcl),
   .core16_pf3_virtio_cmn_config_bar_offset_hwtcl                (core16_pf3_virtio_cmn_config_bar_offset_hwtcl),
   .core16_pf3_virtio_cmn_config_structure_length_hwtcl          (core16_pf3_virtio_cmn_config_structure_length_hwtcl),
   .core16_pf3_virtio_notification_bar_indicator_hwtcl           (core16_pf3_virtio_notification_bar_indicator_hwtcl),
   .core16_pf3_virtio_notification_bar_offset_hwtcl              (core16_pf3_virtio_notification_bar_offset_hwtcl),
   .core16_pf3_virtio_notification_structure_length_hwtcl        (core16_pf3_virtio_notification_structure_length_hwtcl),
   .core16_pf3_virtio_notify_off_multiplier_hwtcl                (core16_pf3_virtio_notify_off_multiplier_hwtcl),
   .core16_pf3_virtio_isrstatus_bar_indicator_hwtcl              (core16_pf3_virtio_isrstatus_bar_indicator_hwtcl),
   .core16_pf3_virtio_isrstatus_bar_offset_hwtcl                 (core16_pf3_virtio_isrstatus_bar_offset_hwtcl),
   .core16_pf3_virtio_isrstatus_structure_length_hwtcl           (core16_pf3_virtio_isrstatus_structure_length_hwtcl),
   .core16_pf3_virtio_devspecific_bar_indicator_hwtcl            (core16_pf3_virtio_devspecific_bar_indicator_hwtcl),
   .core16_pf3_virtio_devspecific_bar_offset_hwtcl               (core16_pf3_virtio_devspecific_bar_offset_hwtcl),
   .core16_pf3_virtio_devspecific_structure_length_hwtcl         (core16_pf3_virtio_devspecific_structure_length_hwtcl),
   .core16_pf3_virtio_pciconfig_access_bar_indicator_hwtcl       (core16_pf3_virtio_pciconfig_access_bar_indicator_hwtcl),
   .core16_pf3_virtio_pciconfig_access_bar_offset_hwtcl          (core16_pf3_virtio_pciconfig_access_bar_offset_hwtcl),
   .core16_pf3_virtio_pciconfig_access_structure_length_hwtcl    (core16_pf3_virtio_pciconfig_access_structure_length_hwtcl),
   .core16_pf0vf_virtio_capability_present_hwtcl                 (core16_pf0vf_virtio_capability_present_hwtcl),
   .core16_pf0vf_virtio_device_specific_cap_present_hwtcl        (core16_pf0vf_virtio_device_specific_cap_present_hwtcl),
   .core16_pf0vf_virtio_cmn_config_bar_indicator_hwtcl           (core16_pf0vf_virtio_cmn_config_bar_indicator_hwtcl),
   .core16_pf0vf_virtio_cmn_config_bar_offset_hwtcl              (core16_pf0vf_virtio_cmn_config_bar_offset_hwtcl),
   .core16_pf0vf_virtio_cmn_config_structure_length_hwtcl        (core16_pf0vf_virtio_cmn_config_structure_length_hwtcl),
   .core16_pf0vf_virtio_notification_bar_indicator_hwtcl         (core16_pf0vf_virtio_notification_bar_indicator_hwtcl),
   .core16_pf0vf_virtio_notification_bar_offset_hwtcl            (core16_pf0vf_virtio_notification_bar_offset_hwtcl),
   .core16_pf0vf_virtio_notification_structure_length_hwtcl      (core16_pf0vf_virtio_notification_structure_length_hwtcl),
   .core16_pf0vf_virtio_notify_off_multiplier_hwtcl              (core16_pf0vf_virtio_notify_off_multiplier_hwtcl),
   .core16_pf0vf_virtio_isrstatus_bar_indicator_hwtcl            (core16_pf0vf_virtio_isrstatus_bar_indicator_hwtcl),
   .core16_pf0vf_virtio_isrstatus_bar_offset_hwtcl               (core16_pf0vf_virtio_isrstatus_bar_offset_hwtcl),
   .core16_pf0vf_virtio_isrstatus_structure_length_hwtcl         (core16_pf0vf_virtio_isrstatus_structure_length_hwtcl),
   .core16_pf0vf_virtio_devspecific_bar_indicator_hwtcl          (core16_pf0vf_virtio_devspecific_bar_indicator_hwtcl),
   .core16_pf0vf_virtio_devspecific_bar_offset_hwtcl             (core16_pf0vf_virtio_devspecific_bar_offset_hwtcl),
   .core16_pf0vf_virtio_devspecific_structure_length_hwtcl       (core16_pf0vf_virtio_devspecific_structure_length_hwtcl),
   .core16_pf0vf_virtio_pciconfig_access_bar_indicator_hwtcl     (core16_pf0vf_virtio_pciconfig_access_bar_indicator_hwtcl),
   .core16_pf0vf_virtio_pciconfig_access_bar_offset_hwtcl        (core16_pf0vf_virtio_pciconfig_access_bar_offset_hwtcl),
   .core16_pf0vf_virtio_pciconfig_access_structure_length_hwtcl  (core16_pf0vf_virtio_pciconfig_access_structure_length_hwtcl),
   .core16_pf1vf_virtio_capability_present_hwtcl                 (core16_pf1vf_virtio_capability_present_hwtcl),
   .core16_pf1vf_virtio_device_specific_cap_present_hwtcl        (core16_pf1vf_virtio_device_specific_cap_present_hwtcl),
   .core16_pf1vf_virtio_cmn_config_bar_indicator_hwtcl           (core16_pf1vf_virtio_cmn_config_bar_indicator_hwtcl),
   .core16_pf1vf_virtio_cmn_config_bar_offset_hwtcl              (core16_pf1vf_virtio_cmn_config_bar_offset_hwtcl),
   .core16_pf1vf_virtio_cmn_config_structure_length_hwtcl        (core16_pf1vf_virtio_cmn_config_structure_length_hwtcl),
   .core16_pf1vf_virtio_notification_bar_indicator_hwtcl         (core16_pf1vf_virtio_notification_bar_indicator_hwtcl),
   .core16_pf1vf_virtio_notification_bar_offset_hwtcl            (core16_pf1vf_virtio_notification_bar_offset_hwtcl),
   .core16_pf1vf_virtio_notification_structure_length_hwtcl      (core16_pf1vf_virtio_notification_structure_length_hwtcl),
   .core16_pf1vf_virtio_notify_off_multiplier_hwtcl              (core16_pf1vf_virtio_notify_off_multiplier_hwtcl),
   .core16_pf1vf_virtio_isrstatus_bar_indicator_hwtcl            (core16_pf1vf_virtio_isrstatus_bar_indicator_hwtcl),
   .core16_pf1vf_virtio_isrstatus_bar_offset_hwtcl               (core16_pf1vf_virtio_isrstatus_bar_offset_hwtcl),
   .core16_pf1vf_virtio_isrstatus_structure_length_hwtcl         (core16_pf1vf_virtio_isrstatus_structure_length_hwtcl),
   .core16_pf1vf_virtio_devspecific_bar_indicator_hwtcl          (core16_pf1vf_virtio_devspecific_bar_indicator_hwtcl),
   .core16_pf1vf_virtio_devspecific_bar_offset_hwtcl             (core16_pf1vf_virtio_devspecific_bar_offset_hwtcl),
   .core16_pf1vf_virtio_devspecific_structure_length_hwtcl       (core16_pf1vf_virtio_devspecific_structure_length_hwtcl),
   .core16_pf1vf_virtio_pciconfig_access_bar_indicator_hwtcl     (core16_pf1vf_virtio_pciconfig_access_bar_indicator_hwtcl),
   .core16_pf1vf_virtio_pciconfig_access_bar_offset_hwtcl        (core16_pf1vf_virtio_pciconfig_access_bar_offset_hwtcl),
   .core16_pf1vf_virtio_pciconfig_access_structure_length_hwtcl  (core16_pf1vf_virtio_pciconfig_access_structure_length_hwtcl),
   .core16_pf2vf_virtio_capability_present_hwtcl                 (core16_pf2vf_virtio_capability_present_hwtcl),
   .core16_pf2vf_virtio_device_specific_cap_present_hwtcl        (core16_pf2vf_virtio_device_specific_cap_present_hwtcl),
   .core16_pf2vf_virtio_cmn_config_bar_indicator_hwtcl           (core16_pf2vf_virtio_cmn_config_bar_indicator_hwtcl),
   .core16_pf2vf_virtio_cmn_config_bar_offset_hwtcl              (core16_pf2vf_virtio_cmn_config_bar_offset_hwtcl),
   .core16_pf2vf_virtio_cmn_config_structure_length_hwtcl        (core16_pf2vf_virtio_cmn_config_structure_length_hwtcl),
   .core16_pf2vf_virtio_notification_bar_indicator_hwtcl         (core16_pf2vf_virtio_notification_bar_indicator_hwtcl),
   .core16_pf2vf_virtio_notification_bar_offset_hwtcl            (core16_pf2vf_virtio_notification_bar_offset_hwtcl),
   .core16_pf2vf_virtio_notification_structure_length_hwtcl      (core16_pf2vf_virtio_notification_structure_length_hwtcl),
   .core16_pf2vf_virtio_notify_off_multiplier_hwtcl              (core16_pf2vf_virtio_notify_off_multiplier_hwtcl),
   .core16_pf2vf_virtio_isrstatus_bar_indicator_hwtcl            (core16_pf2vf_virtio_isrstatus_bar_indicator_hwtcl),
   .core16_pf2vf_virtio_isrstatus_bar_offset_hwtcl               (core16_pf2vf_virtio_isrstatus_bar_offset_hwtcl),
   .core16_pf2vf_virtio_isrstatus_structure_length_hwtcl         (core16_pf2vf_virtio_isrstatus_structure_length_hwtcl),
   .core16_pf2vf_virtio_devspecific_bar_indicator_hwtcl          (core16_pf2vf_virtio_devspecific_bar_indicator_hwtcl),
   .core16_pf2vf_virtio_devspecific_bar_offset_hwtcl             (core16_pf2vf_virtio_devspecific_bar_offset_hwtcl),
   .core16_pf2vf_virtio_devspecific_structure_length_hwtcl       (core16_pf2vf_virtio_devspecific_structure_length_hwtcl),
   .core16_pf2vf_virtio_pciconfig_access_bar_indicator_hwtcl     (core16_pf2vf_virtio_pciconfig_access_bar_indicator_hwtcl),
   .core16_pf2vf_virtio_pciconfig_access_bar_offset_hwtcl        (core16_pf2vf_virtio_pciconfig_access_bar_offset_hwtcl),
   .core16_pf2vf_virtio_pciconfig_access_structure_length_hwtcl  (core16_pf2vf_virtio_pciconfig_access_structure_length_hwtcl),
   .core16_pf3vf_virtio_capability_present_hwtcl                 (core16_pf3vf_virtio_capability_present_hwtcl),
   .core16_pf3vf_virtio_device_specific_cap_present_hwtcl        (core16_pf3vf_virtio_device_specific_cap_present_hwtcl),
   .core16_pf3vf_virtio_cmn_config_bar_indicator_hwtcl           (core16_pf3vf_virtio_cmn_config_bar_indicator_hwtcl),
   .core16_pf3vf_virtio_cmn_config_bar_offset_hwtcl              (core16_pf3vf_virtio_cmn_config_bar_offset_hwtcl),
   .core16_pf3vf_virtio_cmn_config_structure_length_hwtcl        (core16_pf3vf_virtio_cmn_config_structure_length_hwtcl),
   .core16_pf3vf_virtio_notification_bar_indicator_hwtcl         (core16_pf3vf_virtio_notification_bar_indicator_hwtcl),
   .core16_pf3vf_virtio_notification_bar_offset_hwtcl            (core16_pf3vf_virtio_notification_bar_offset_hwtcl),
   .core16_pf3vf_virtio_notification_structure_length_hwtcl      (core16_pf3vf_virtio_notification_structure_length_hwtcl),
   .core16_pf3vf_virtio_notify_off_multiplier_hwtcl              (core16_pf3vf_virtio_notify_off_multiplier_hwtcl),
   .core16_pf3vf_virtio_isrstatus_bar_indicator_hwtcl            (core16_pf3vf_virtio_isrstatus_bar_indicator_hwtcl),
   .core16_pf3vf_virtio_isrstatus_bar_offset_hwtcl               (core16_pf3vf_virtio_isrstatus_bar_offset_hwtcl),
   .core16_pf3vf_virtio_isrstatus_structure_length_hwtcl         (core16_pf3vf_virtio_isrstatus_structure_length_hwtcl),
   .core16_pf3vf_virtio_devspecific_bar_indicator_hwtcl          (core16_pf3vf_virtio_devspecific_bar_indicator_hwtcl),
   .core16_pf3vf_virtio_devspecific_bar_offset_hwtcl             (core16_pf3vf_virtio_devspecific_bar_offset_hwtcl),
   .core16_pf3vf_virtio_devspecific_structure_length_hwtcl       (core16_pf3vf_virtio_devspecific_structure_length_hwtcl),
   .core16_pf3vf_virtio_pciconfig_access_bar_indicator_hwtcl     (core16_pf3vf_virtio_pciconfig_access_bar_indicator_hwtcl),
   .core16_pf3vf_virtio_pciconfig_access_bar_offset_hwtcl        (core16_pf3vf_virtio_pciconfig_access_bar_offset_hwtcl),
   .core16_pf3vf_virtio_pciconfig_access_structure_length_hwtcl  (core16_pf3vf_virtio_pciconfig_access_structure_length_hwtcl),
   .core16_pf0_vf_count_hwtcl                                    (core16_pf0_vf_count_hwtcl),
   .core16_pf1_vf_count_hwtcl                                    (core16_pf1_vf_count_hwtcl),
   .core16_pf2_vf_count_hwtcl                                    (core16_pf2_vf_count_hwtcl),
   .core16_pf3_vf_count_hwtcl                                    (core16_pf3_vf_count_hwtcl),


   .topology                         (topology),
//KAHUAT_EDIT
   .num_of_chnl_w                   (num_of_chnl_w)

) pcie_sip_top_inst (
   .ninit_done                              (ninit_done),
   .coreclkout_hip                          (coreclkout_hip_w),
   .p0_axi_lite_clk                         (p0_axi_lite_clk),
   .p0_axi_st_clk                           (p0_axi_st_clk),

   .p0_pin_perst_n                          (p0_pin_perst_n),
   .p0_reset_status_n                       (p0_reset_status_n),

   .p0_axi_st_areset_n                      (p0_axi_st_areset_n_axi_clk_sync),
   .p0_axi_lite_areset_n                    (p0_axi_lite_areset_n_axi_clk_sync),
   .p0_rst_req_o                            (p0_rst_req_o),
   .p0_rst_rdy_i                            (p0_rst_rdy_i),
   
   .i_gpio_perst0_n_sync                    (i_gpio_perst0_n_sync),
   .i_gpio_perst0_n_db                      (i_gpio_perst0_n_db),
   
   .i_pin_perst_n                           (hip_pin_perst_n),
   .i_core_pll_lock                         (core_pll_lock),

  .  i_p0_tx_dsk_done(tx_dsk_done   ),
  .  i_pld_core_rst_n(pld_core_rst_n   ),
  .   i_user_mode_to_pld(user_mode_to_pld   ),
  .   i_pld_in_use( pld_in_use  ),
  . i_pld_link_req_rst ( pld_link_req_rst ), 
  . o_pld_in_use(p0_pld_in_use_o),
  . o_user_mode_to_pld(p0_user_mode_to_pld_o),
  . o_pld_warm_rst_rdy(pld_warm_rst_rdy   ),
  . o_pld_ready(pld_ready ),
 

   .o_pld_adapter_tx_pld_rst_n      ( pld_adapter_tx_pld_rst_n   ),
   .o_pld_adapter_rx_pld_rst_n      ( pld_adapter_rx_pld_rst_n  ),

   .ch0_rx_data_i                           (ch0_rx_data),//wire connection to haltop
   .ch1_rx_data_i                           (ch1_rx_data), 
   .ch2_rx_data_i                           (ch2_rx_data), 
   .ch3_rx_data_i                           (ch3_rx_data), 
   .ch4_rx_data_i                           (ch4_rx_data), 
   .ch0_tx_data_o                           (ch0_tx_data), 
   .ch1_tx_data_o                           (ch1_tx_data), 
   .ch2_tx_data_o                           (ch2_tx_data), 
   .ch3_tx_data_o                           (ch3_tx_data),
   .ch4_tx_data_o			    (ch4_tx_data),//shunxiong-fix lint_23ww2501 

   .p0_rx_tuser_halt                        (p0_rx_tuser_halt),   

   //AXI-S Interface
   .p0_st_rx_tready_i                         (p0_st_rx_tready_i), //bring up to top
   .p0_st_rx_tvalid_o                         (p0_st_rx_tvalid_o),
   .p0_st_rx_tlast_o                          (p0_st_rx_tlast_o),
   .p0_st_rx_tdata_o                          (p0_st_rx_tdata_o),
   .p0_st_rx_tkeep_o                          (p0_st_rx_tkeep_o),
   .p0_st_rx_tuser_last_segment               (p0_st_rx_tuser_last_segment),

   .pcie_pld_rx_fbk_tready                     (pcie_pld_rx_fbk_tready),


   .p0_st_tx_tvalid_i                          (p0_st_tx_tvalid_i),
   .p0_st_tx_tlast_i                           (p0_st_tx_tlast_i),
   .p0_st_tx_tdata_i                           (p0_st_tx_tdata_i),
   .p0_st_tx_tkeep_i                           (p0_st_tx_tkeep_i),
   .p0_st_tx_tuser_last_segment                (p0_st_tx_tuser_last_segment),  
   .p0_st_tx_tready_o                          (p0_st_tx_tready_o),
   
   .p0_st_txcrdt_tvalid_o                   (p0_st_txcrdt_tvalid_o),
   .p0_st_txcrdt_tvdata_o                   (p0_st_txcrdt_tvdata_o),
   .p0_st_txcrdt_tldrdy_i		    (p0_st_txcrdt_tldrdy_i),

   .p0_app_int_i                            (p0_app_int_i),
   .p0_app_int_ready_o                      (p0_app_int_ready_o),
   .p0_int_status_o                         (p0_int_status_o),

   .p0_msi_pnd_func_i                       (p0_msi_pnd_func_i),
   .p0_msi_pnd_addr_i                       (p0_msi_pnd_addr_i),
   .p0_msi_pnd_byte_i                       (p0_msi_pnd_byte_i),
   .p0_msi_pnd_vf_num_i                     (p0_msi_pnd_vf_num_i),
   .p0_msi_pnd_vfa_i                        (p0_msi_pnd_vfa_i),
   .p0_msi_pnd_ready_o                      (p0_msi_pnd_ready_o),  
   .p0_sys_hotplug_ready_o                  (p0_sys_hotplug_ready_o),
   .p0_apps_pm_ready_o                      (p0_apps_pm_ready_o),
   .p0_qhip_prs_event_ready_o               (p0_qhip_prs_event_ready_o),

   .p0_app_xfer_pending_i                   (p0_app_xfer_pending_i),
   .p0_app_ready_entr_l23_i                 (p0_apps_ready_entr_l23_i),
   .p0_apps_pm_xmt_pme_i                    (p0_apps_pm_xmt_pme_i),
   .p0_app_init_rst_i                       (p0_app_init_rst_i),
   .p0_apps_pm_xmt_turnoff_i                (p0_apps_pm_xmt_turnoff_i),
   .p0_surprise_down_err_o                  (p0_surprise_down_err_o),
   .p0_link_up_o                            (p0_link_up_o),
   .p0_dl_up_o                              (p0_dl_up_o),
   .p0_pm_state_o                           (p0_pm_state_o),
   .p0_pm_dstate_o                          (p0_pm_dstate_o),
   .p0_ltssm_state_o                        (p0_ltssm_state_o),
   .p0_pld_gp_status_i                      (p0_pld_gp_status_i),
   .p0_pld_gp_ctrl_o                        (p0_pld_gp_ctrl_o),
   .p0_app_retry_en_i                       (8'b0), // taken out  22018718117
   .p0_app_retry_en_ready_o                 (p0_app_retry_en_ready_o),
   .p0_sys_aux_pwr_det_i                    (p0_sys_aux_pwr_det_i),


   .p0_app_err_valid_i                      (p0_app_err_valid_i),
   .p0_app_err_func_num_i                   (p0_app_err_func_num_i),
   .p0_app_err_hdr_i                        (p0_app_err_hdr_i),
   .p0_app_err_info_i                       (p0_app_err_info_i),
   .p0_app_err_ready_o                      (p0_app_err_ready_o),
   .p0_serr_out_o                           (p0_serr_out_o),
   .p0_hip_enter_err_mode_o                 (p0_hip_enter_err_mode_o),


   .p0_sys_pwr_fault_det_i                  (p0_sys_pwr_fault_det_i),
   .p0_sys_mrl_sensor_state_i               (p0_sys_mrl_sensor_state_i),
   .p0_sys_mrl_sensor_chged_i               (p0_sys_mrl_sensor_chged_i),
   .p0_sys_pre_det_state_i                  (p0_sys_pre_det_state_i),
   .p0_sys_pre_det_chged_i                  (p0_sys_pre_det_chged_i),
   .p0_sys_cmd_cpled_int_i                  (p0_sys_cmd_cpled_int_i),
   .p0_sys_atten_button_pressed_i           (p0_sys_atten_button_pressed_i),
   .p0_sys_eml_interlock_engaged_i          (p0_sys_eml_interlock_engaged_i),

   .p0_flrrcvd_tvalid_o                     (p0_flrrcvd_tvalid_o),
   .p0_flrrcvd_tvdata_o                     (p0_flrrcvd_tvdata_o),
   .p0_flrcmpl_tvalid_i                     (p0_flrcmpl_tvalid_i),
   .p0_flrcmpl_tvdata_i                     (p0_flrcmpl_tvdata_i),


   .p0_virtio_pcicfgreq_tvalid_o            (p0_virtio_pcicfgreq_tvalid_o),
   .p0_virtio_pcicfgreq_tdata_o             (p0_virtio_pcicfgreq_tdata_o),
   .p0_virtio_pcicfgcmpl_tvalid_i           (p0_virtio_pcicfgcmpl_tvalid_i),
   .p0_virtio_pcicfgcmpl_tdata_i            (p0_virtio_pcicfgcmpl_tdata_i),


   .p0_tl_cfg_add_o                         (p0_tl_cfg_add_o),
   .p0_tl_cfg_func_o                        (p0_tl_cfg_func_o),
   .p0_tl_cfg_ctl_o                         (p0_tl_cfg_ctl_o),
   .p0_dl_timer_update_o                    (p0_dl_timer_update_o),

   //Configuration Intercept Interface Signals

//nwai   .p0_st_ciireq_tvalid_o                   (p0_st_ciireq_tvalid_o),
//nwai   .p0_st_cciireq_tready_i                  (p0_st_cciireq_tready_i),
   .p0_st_ciireq_tdata_o                    (p0_st_ciireq_tdata_o),

   .p0_st_cii_halt_i                        (p0_st_cii_halt_i),
   .p0_st_cii_req_o                         (p0_st_cii_req_o),
 
   //Configuration Intercept Response Interface
//nwai   .p0_st_ciiresp_tvalid_i                  (p0_st_ciiresp_tvalid_i),
   .p0_st_ciiresp_tdata_i                   (p0_st_ciiresp_tdata_i),


   .p0_user_sent_vfnonfatalmsg_i            (p0_user_sent_vfnonfatalmsg_i),
   .p0_user_vfnonfatalmsg_func_num_i        (p0_user_vfnonfatalmsg_func_num_i),
   .p0_user_vfnonfatalmsg_vfnum_i           (p0_user_vfnonfatalmsg_vfnum_i),
   .p0_vf_err_ur_posted_s0_o                (p0_vf_err_ur_posted_s0_o),
   .p0_vf_err_ca_postedreq_s0_o             (p0_vf_err_ca_postedreq_s0_o),
   .p0_vf_err_poisonedwrreq_s0_o            (p0_vf_err_poisonedwrreq_s0_o),
   .p0_vf_err_poisonedcompl_s0_o            (p0_vf_err_poisonedcompl_s0_o),
   .p0_vf_err_func_num_s0_o                 (p0_vf_err_func_num_s0_o),
   .p0_vf_err_vf_num_s0_o                   (p0_vf_err_vf_num_s0_o),
   .p0_vf_err_ur_posted_s1_o                (p0_vf_err_ur_posted_s1_o),
   .p0_vf_err_ca_postedreq_s1_o             (p0_vf_err_ca_postedreq_s1_o),
   .p0_vf_err_poisonedwrreq_s1_o            (p0_vf_err_poisonedwrreq_s1_o),
   .p0_vf_err_poisonedcompl_s1_o            (p0_vf_err_poisonedcompl_s1_o),
   .p0_vf_err_func_num_s1_o                 (p0_vf_err_func_num_s1_o),
   .p0_vf_err_vf_num_s1_o                   (p0_vf_err_vf_num_s1_o),
   .p0_vf_err_overflow_o                    (p0_vf_err_overflow_o),

   .p0_st_cplto_tvalid_o                    (p0_st_cplto_tvalid_o),
   .p0_st_cplto_tdata_o                     (p0_st_cplto_tdata_o),
   
   .p0_qhip_prs_event_i                     (p0_qhip_prs_event_i),
   .p0_qhip_prs_event_func_i                (p0_qhip_prs_event_func_i),
   .p0_qhip_prs_event_valid_i               (p0_qhip_prs_event_valid_i),

   .p0_test_in_i                            (p0_test_in_i),
   .p0_test_out_o                           (p0_test_out_o),

   .toolkit_mode                            (toolkit_mode),

   .ptm_manual_update_i                     (ptm_manual_update),
   .ptm_context_valid_o                     (ptm_context_valid),
   .start_ptm_newclk_value_o                (start_ptm_newclk_value),
   .ptm_newclk_value_o                      (ptm_newclk_value),
   .ptm_clock_correction_o                  (ptm_clock_correction),

   .p0_hip_reconfig_clk                     (p0_hip_reconfig_clk),
   .p0_hip_reconfig_address                 (p0_hip_reconfig_address_w),
   .p0_hip_reconfig_write                   (p0_hip_reconfig_write_w),
   .p0_hip_reconfig_writedata               (p0_hip_reconfig_writedata_w),
   .p0_hip_reconfig_read                    (p0_hip_reconfig_read_w),
   .p0_hip_reconfig_readdatavalid           (p0_hip_reconfig_readdatavalid_w),
   .p0_hip_reconfig_readdata                (p0_hip_reconfig_readdata_w),
   .p0_hip_reconfig_waitrequest             (p0_hip_reconfig_waitrequest_w),
   .p0_hip_reconfig_byteen                  (p0_hip_reconfig_byteen_w),
   .p0_hip_reconfig_resp                    (p0_hip_reconfig_resp)

);

generate
    if (debug_toolkit_hwtcl) begin : gen_dtk
		sm_pcie_debug_toolkit # (
			.topology                           	(topology), 
			.hard_dtk_en_hwtcl                 	(1'b0), //0 for A0; 1 for B0
			.sm_enable_pciess_register_access_hwtcl	(enable_pciess_register_access_hwtcl),  
			.sm_link_insp_en_hwtcl			(link_insp_en_hwtcl),
			.core16_perfmon_clk_freq		(core16_perfmon_clk_freq)
		) sm_pcie_debug_toolkit_inst (
			.p0_ltssm			(p0_ltssm_state_o), 
			.p1_ltssm			(6'h0), //TODO for x8
			.core_pll_lock			(core_pll_lock),  
			.hip_coreclk			(coreclkout_hip_w), 
			.avmm_clk			(p0_hip_reconfig_clk), 
			.ninit_done			(ninit_done), 
			.toolkit_mode			(toolkit_mode),
			.phy_avmm_read_o		(phy_avmm_read),
			.phy_avmm_write_o		(phy_avmm_write),
			.phy_avmm_address_o		(phy_avmm_address),
			.phy_avmm_writedata_o		(phy_avmm_writedata),
			.phy_avmm_readdatavalid_i	(phy_avmm_readdatavalid),
			.phy_avmm_readdata_i		(phy_avmm_readdata),
			.phy_avmm_waitrequest_i		(phy_avmm_waitrequest),
			.p0_avmm_read_o			(dtk_p0_avmm_read),
			.p0_avmm_write_o		(dtk_p0_avmm_write),
			.p0_avmm_address_o		(dtk_p0_avmm_address),
			.p0_avmm_writedata_o		(dtk_p0_avmm_writedata),
			.p0_avmm_readdatavalid_i	(dtk_p0_avmm_readdatavalid),
			.p0_avmm_readdata_i		(dtk_p0_avmm_readdata),
			.p0_avmm_waitrequest_i		(dtk_p0_avmm_waitrequest),
			.p1_avmm_read_o			(), //TODO for x8
			.p1_avmm_write_o		(),
			.p1_avmm_address_o		(),
			.p1_avmm_writedata_o		(),
			.p1_avmm_readdatavalid_i	('0),
			.p1_avmm_readdata_i		('0),
			.p1_avmm_waitrequest_i		('0),
			.ss_avmm_read_o			(dtk_ss_avmm_read), 
			.ss_avmm_write_o		(dtk_ss_avmm_write),
			.ss_avmm_address_o		(dtk_ss_avmm_address),
			.ss_avmm_writedata_o		(dtk_ss_avmm_writedata),
			.ss_avmm_readdatavalid_i	(dtk_ss_avmm_readdatavalid),
			.ss_avmm_readdata_i		(dtk_ss_avmm_readdata),
			.ss_avmm_waitrequest_i		(dtk_ss_avmm_waitrequest)
	);
	
	end else begin : gen_no_dtk
	
	assign toolkit_mode = 1'b0;
	
	assign phy_avmm_read 			= '0;
	assign phy_avmm_write 			= '0;
	assign phy_avmm_address 		= '0;
	assign phy_avmm_writedata 		= '0;
		
	assign dtk_p0_avmm_read 		= '0;
	assign dtk_p0_avmm_write 		= '0;
	assign dtk_p0_avmm_address 		= '0;
	assign dtk_p0_avmm_writedata 	= '0;
	
	assign dtk_ss_avmm_read 		= '0;
	assign dtk_ss_avmm_write 		= '0;
	assign dtk_ss_avmm_address 		= '0;
	assign dtk_ss_avmm_writedata	= '0;
	
	end
endgenerate

	// PHY Local AVMM Arbiter
	pcie_phy_user_avmm_arb pcie_phy_user_avmm_arb_inst(
		.phy_avmm_read,
		.phy_avmm_write,
		.phy_avmm_address,
		.phy_avmm_writedata,
		.phy_avmm_readdatavalid,
		.phy_avmm_readdata,
		.phy_avmm_waitrequest,
		.phy0_avmm_read,
		.phy0_avmm_write,
		.phy0_avmm_address,
		.phy0_avmm_writedata,
		.phy0_avmm_readdatavalid,
		.phy0_avmm_readdata,
		.phy0_avmm_waitrequest,
		.phy1_avmm_read,
		.phy1_avmm_write,
		.phy1_avmm_address,
		.phy1_avmm_writedata,
		.phy1_avmm_readdatavalid,
		.phy1_avmm_readdata,
		.phy1_avmm_waitrequest,
		.phy2_avmm_read,
		.phy2_avmm_write,
		.phy2_avmm_address,
		.phy2_avmm_writedata,
		.phy2_avmm_readdatavalid,
		.phy2_avmm_readdata,
		.phy2_avmm_waitrequest,
		.phy3_avmm_read,
		.phy3_avmm_write,
		.phy3_avmm_address,
		.phy3_avmm_writedata,
		.phy3_avmm_readdatavalid,
		.phy3_avmm_readdata,
		.phy3_avmm_waitrequest
	);
		
	//Lint fix for WW32

endmodule


