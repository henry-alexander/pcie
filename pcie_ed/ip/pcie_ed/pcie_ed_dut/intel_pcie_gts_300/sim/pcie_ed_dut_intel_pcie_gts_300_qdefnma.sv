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


//----------------------------------------------------------------------------- 
// This confidential and proprietary software may be used only as authorized by 
// a licensing agreement from Intel                                            
// copyright notice must be reproduced on all authorized copies.                
//----------------------------------------------------------------------------- 
// Copyright (C) 2020 Intel Corporation. All rights reserved.  Intel products are 
// protected under numerous U.S. and foreign patents, maskwork rights, copyrights and 
// other intellectual property laws.                                                  
//----------------------------------------------------------------------------- 

package pcie_ed_dut_intel_pcie_gts_300_qdefnma_pkg;
typedef struct packed {
  logic last_segment0;
} tuser;
endpackage

module pcie_ed_dut_intel_pcie_gts_300_qdefnma
import pcie_ed_dut_intel_pcie_gts_300_qdefnma_pkg::*;
#(
  parameter   device_family                         = "Agilex",       //Arria 10, Stratix 10, Agilex
  parameter   TILE                                  = "SM",       //None, P-Tile, F-TIle, R-Tile
  parameter   device_type                           = "EP",           //EP, RP, TLP Bypass, Switch
  parameter   HIGH_SPEED                            = "BOTH_CLK",
  parameter   high_speed_freq_hwtcl                 = "Disable",
  

  parameter   core16_FUNC_MODE                      = "AXIST_DM",   //POWER_USER, AXIST_DM, AXIMM_DM, POWER_SEP, DM_SEP, MM_SEP
  parameter   core16_Header_Packing_scheme          = "Simple",       //Simple, Variable, Compact
  parameter   core16_DWIDTH                         = 512,            //256,512,1024
  parameter   core16_NUM_OF_SEG                     = 4,              //(DWIDTH/8)/16, (DWIDTH/8)/32
  parameter   core16_ST_readyLatency                = 0,              //0-4
  parameter   core16_LiteSlvAWD                     = 20,             //Up to 64
  parameter   core16_LiteSlvDWD                     = 32,             //32
  parameter   core16_LiteMstrAWD                    = 32,             //Up to 64
  parameter   core16_LiteMstrDWD                    = 32,             //32
  parameter   core16_LiteMstr_readyLatency          = 0,              //TODO - defined for responder only in AXI HAS
  parameter   core16_MMAWD                          = 64,             //Up to 64
  parameter   core16_MMBLWD                         = 8, 
  parameter   core16_MMDWD                          = 512,            //256,512,1024
  parameter   core16_MM_readyLatency                = 0,              //TODO - defined for responder only in AXI HAS
  parameter   core16_CPL_REORDERING                 = "Disable",      //Enable, Disable
  parameter   core16_DEVATT_TX_ROUTING              = "Disable",      //Enable, Disable
  parameter   core16_DOWNSTREAM_MSG_FWD             = "Disable",      //Enable, Disable
  parameter   core16_MSI_MSG_GEN                    = "Disable",      //Enable, Disable
  parameter   core16_FLR_REQ_DROP                   = "Disable",      //Enable, Disable
  parameter   core16_REORDER_BUFF_SIZE              = 64,             //32,64,128,256
  parameter   core16_CPLTO_THRU_AXI_ST              = "Disable",      //Enable, Disable
  parameter   core16_DM_ADR_ALIGN                   = "Disable",      //Enable, Disable
  parameter   core16_MMIO_ADR_ALIGN                 = "Disable", 
  parameter   core16_MSIX_TABLE                     = "Disable",      //Enable, Disable
  parameter   core16_MSIX_TABLE_SIZE                = 4096,           //Up to 4096
  parameter   core16_MSIX_BIR                       = 5,
  parameter   core16_MSIX_BAR_OFFSET                = 0,              //
  parameter   core16_MSIX_VECTOR_ALLOC              = "Static",
  parameter   core16_autonomous_pm_enter_l23        = 0,              //0,1
  parameter   core16_device_att                     = "Enable",      //Enable, Disable
  parameter   core16_perfmon_clk_freq               = 250,            //All supported AXI Lite freq

  //Derived from QHIP params in HWTCL
  parameter   core16_pf0_bar01_size_mask            = 0,
  parameter   core16_pf0_bar23_size_mask            = 0,
  parameter   core16_pf0_bar45_size_mask            = 0,
  parameter   core16_pf0_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf0_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf0_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf1_bar01_size_mask            = 0,
  parameter   core16_pf1_bar23_size_mask            = 0,
  parameter   core16_pf1_bar45_size_mask            = 0,
  parameter   core16_pf1_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf1_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf1_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf2_bar01_size_mask            = 0,
  parameter   core16_pf2_bar23_size_mask            = 0,
  parameter   core16_pf2_bar45_size_mask            = 0,
  parameter   core16_pf2_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf2_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf2_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf3_bar01_size_mask            = 0,
  parameter   core16_pf3_bar23_size_mask            = 0,
  parameter   core16_pf3_bar45_size_mask            = 0,
  parameter   core16_pf3_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf3_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf3_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf4_bar01_size_mask            = 0,
  parameter   core16_pf4_bar23_size_mask            = 0,
  parameter   core16_pf4_bar45_size_mask            = 0,
  parameter   core16_pf4_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf4_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf4_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf5_bar01_size_mask            = 0,
  parameter   core16_pf5_bar23_size_mask            = 0,
  parameter   core16_pf5_bar45_size_mask            = 0,
  parameter   core16_pf5_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf5_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf5_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf6_bar01_size_mask            = 0,
  parameter   core16_pf6_bar23_size_mask            = 0,
  parameter   core16_pf6_bar45_size_mask            = 0,
  parameter   core16_pf6_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf6_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf6_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf7_bar01_size_mask            = 0,
  parameter   core16_pf7_bar23_size_mask            = 0,
  parameter   core16_pf7_bar45_size_mask            = 0,
  parameter   core16_pf7_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf7_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf7_sriov_vf_bar45_size_mask   = 0,

  parameter   pciess_topology                       = "pcie_x8",
  //QHIP params
  parameter   hssi_ctp_func_mode                    = "pcie_g4_x16_ep",
  parameter   hssi_ctp_topology                     = "pcie_x4",  //pcie_x16, pcie_x8x8, pcie_x4x4x4x4

  parameter   core16_payload_width_integer_hwtcl    = 512,
  parameter   core16_hdr_width_integer_hwtcl        = 256,
  parameter   core16_pfx_width_integer_hwtcl        = 64,
  parameter   core16_double_width_integer_hwtcl     = 2,
  parameter   core16_empty_width_integer_hwtcl      = 2,
  parameter   core16_enable_sriov_hwtcl             = 0,
  parameter   core16_total_pf_count_hwtcl           = 1,
  parameter   core16_total_vf_count_hwtcl           = 1,
  parameter   core16_pf0_vf_count_hwtcl             = 0,
  parameter   core16_pf1_vf_count_hwtcl             = 0,
  parameter   core16_pf2_vf_count_hwtcl             = 0,
  parameter   core16_pf3_vf_count_hwtcl             = 0,
  parameter   core16_pf4_vf_count_hwtcl             = 0,
  parameter   core16_pf5_vf_count_hwtcl             = 0,
  parameter   core16_pf6_vf_count_hwtcl             = 0,
  parameter   core16_pf7_vf_count_hwtcl             = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar0_type          = "pf0_bar0_mem32",          //pf0_bar0_mem32, pf0_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar1_type          = "pf0_bar1_mem32",          //pf0_bar0_mem32, pf0_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar2_type          = "pf0_bar2_mem32",          //pf0_bar2_mem32, pf0_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar3_type          = "pf0_bar3_mem32",          //pf0_bar0_mem32, pf0_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar4_type          = "pf0_bar4_mem32",          //pf0_bar4_mem32, pf0_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar5_type          = "pf0_bar5_mem32",          //pf0_bar0_mem32, pf0_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar0_type = "pf0_sriov_vf_bar0_mem64", //pf0_sriov_vf_bar0_mem32, pf0_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar1_type = "pf0_sriov_vf_bar1_mem64", //pf0_sriov_vf_bar0_mem32, pf0_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar2_type = "pf0_sriov_vf_bar2_mem64", //pf0_sriov_vf_bar2_mem32, pf0_sriov_vf_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar3_type = "pf0_sriov_vf_bar3_mem64", //pf0_sriov_vf_bar0_mem32, pf0_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar4_type = "pf0_sriov_vf_bar4_mem64", //pf0_sriov_vf_bar4_mem32, pf0_sriov_vf_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar5_type = "pf0_sriov_vf_bar5_mem64", //pf0_sriov_vf_bar0_mem32, pf0_sriov_vf_bar0_mem64

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar0_type          = "pf1_bar0_mem32",          //pf1_bar0_mem32, pf1_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar1_type          = "pf1_bar1_mem32",          //pf1_bar0_mem32, pf1_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar2_type          = "pf1_bar2_mem32",          //pf1_bar2_mem32, pf1_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar3_type          = "pf1_bar3_mem32",          //pf1_bar0_mem32, pf1_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar4_type          = "pf1_bar4_mem32",          //pf1_bar4_mem32, pf1_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar5_type          = "pf1_bar5_mem32",          //pf1_bar0_mem32, pf1_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar0_type = "pf1_sriov_vf_bar0_mem64", //pf1_sriov_vf_bar0_mem32, pf1_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar1_type = "pf1_sriov_vf_bar1_mem64", //pf1_sriov_vf_bar0_mem32, pf1_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar2_type = "pf1_sriov_vf_bar2_mem64", //pf1_sriov_vf_bar2_mem32, pf1_sriov_vf_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar3_type = "pf1_sriov_vf_bar3_mem64", //pf1_sriov_vf_bar0_mem32, pf1_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar4_type = "pf1_sriov_vf_bar4_mem64", //pf1_sriov_vf_bar4_mem32, pf1_sriov_vf_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar5_type = "pf1_sriov_vf_bar5_mem64", //pf1_sriov_vf_bar0_mem32, pf1_sriov_vf_bar0_mem64

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar0_type          = "pf2_bar0_mem32",          //pf2_bar0_mem32, pf2_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar1_type          = "pf2_bar1_mem32",          //pf2_bar0_mem32, pf2_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar2_type          = "pf2_bar2_mem32",          //pf2_bar2_mem32, pf2_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar3_type          = "pf2_bar3_mem32",          //pf2_bar0_mem32, pf2_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar4_type          = "pf2_bar4_mem32",          //pf2_bar4_mem32, pf2_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar5_type          = "pf2_bar5_mem32",          //pf2_bar0_mem32, pf2_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar0_type = "pf2_sriov_vf_bar0_mem64", //pf2_sriov_vf_bar0_mem32, pf2_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar1_type = "pf2_sriov_vf_bar1_mem64", //pf2_sriov_vf_bar0_mem32, pf2_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar2_type = "pf2_sriov_vf_bar2_mem64", //pf2_sriov_vf_bar2_mem32, pf2_sriov_vf_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar3_type = "pf2_sriov_vf_bar3_mem64", //pf2_sriov_vf_bar0_mem32, pf2_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar4_type = "pf2_sriov_vf_bar4_mem64", //pf2_sriov_vf_bar4_mem32, pf2_sriov_vf_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar5_type = "pf2_sriov_vf_bar5_mem64", //pf2_sriov_vf_bar0_mem32, pf2_sriov_vf_bar0_mem64

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar0_type          = "pf3_bar0_mem32",          //pf3_bar0_mem32, pf3_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar1_type          = "pf3_bar1_mem32",          //pf3_bar0_mem32, pf3_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar2_type          = "pf3_bar2_mem32",          //pf3_bar2_mem32, pf3_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar3_type          = "pf3_bar3_mem32",          //pf3_bar0_mem32, pf3_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar4_type          = "pf3_bar4_mem32",          //pf3_bar4_mem32, pf3_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar5_type          = "pf3_bar5_mem32",          //pf3_bar0_mem32, pf3_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar0_type = "pf3_sriov_vf_bar0_mem64", //pf3_sriov_vf_bar0_mem32, pf3_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar1_type = "pf3_sriov_vf_bar1_mem64", //pf3_sriov_vf_bar0_mem32, pf3_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar2_type = "pf3_sriov_vf_bar2_mem64", //pf3_sriov_vf_bar2_mem32, pf3_sriov_vf_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar3_type = "pf3_sriov_vf_bar3_mem64", //pf3_sriov_vf_bar0_mem32, pf3_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar4_type = "pf3_sriov_vf_bar4_mem64", //pf3_sriov_vf_bar4_mem32, pf3_sriov_vf_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar5_type = "pf3_sriov_vf_bar5_mem64", //pf3_sriov_vf_bar0_mem32, pf3_sriov_vf_bar0_mem64

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar0_type          = "pf4_bar0_mem32",          //pf4_bar0_mem32, pf4_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar1_type          = "pf4_bar1_mem32",          //pf4_bar0_mem32, pf4_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar2_type          = "pf4_bar2_mem32",          //pf4_bar2_mem32, pf4_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar3_type          = "pf4_bar3_mem32",          //pf4_bar0_mem32, pf4_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar4_type          = "pf4_bar4_mem32",          //pf4_bar4_mem32, pf4_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar5_type          = "pf4_bar5_mem32",          //pf4_bar0_mem32, pf4_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar0_type = "pf4_sriov_vf_bar0_mem64", //pf4_sriov_vf_bar0_mem32, pf4_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar1_type = "pf4_sriov_vf_bar1_mem64", //pf4_sriov_vf_bar0_mem32, pf4_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar2_type = "pf4_sriov_vf_bar2_mem64", //pf4_sriov_vf_bar2_mem32, pf4_sriov_vf_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar3_type = "pf4_sriov_vf_bar3_mem64", //pf4_sriov_vf_bar0_mem32, pf4_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar4_type = "pf4_sriov_vf_bar4_mem64", //pf4_sriov_vf_bar4_mem32, pf4_sriov_vf_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar5_type = "pf4_sriov_vf_bar5_mem64", //pf4_sriov_vf_bar0_mem32, pf4_sriov_vf_bar0_mem64

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar0_type          = "pf5_bar0_mem32",          //pf5_bar0_mem32, pf5_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar1_type          = "pf5_bar1_mem32",          //pf5_bar0_mem32, pf5_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar2_type          = "pf5_bar2_mem32",          //pf5_bar2_mem32, pf5_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar3_type          = "pf5_bar3_mem32",          //pf5_bar0_mem32, pf5_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar4_type          = "pf5_bar4_mem32",          //pf5_bar4_mem32, pf5_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar5_type          = "pf5_bar5_mem32",          //pf5_bar0_mem32, pf5_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar0_type = "pf5_sriov_vf_bar0_mem64", //pf5_sriov_vf_bar0_mem32, pf5_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar1_type = "pf5_sriov_vf_bar1_mem64", //pf5_sriov_vf_bar0_mem32, pf5_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar2_type = "pf5_sriov_vf_bar2_mem64", //pf5_sriov_vf_bar2_mem32, pf5_sriov_vf_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar3_type = "pf5_sriov_vf_bar3_mem64", //pf5_sriov_vf_bar0_mem32, pf5_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar4_type = "pf5_sriov_vf_bar4_mem64", //pf5_sriov_vf_bar4_mem32, pf5_sriov_vf_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar5_type = "pf5_sriov_vf_bar5_mem64", //pf5_sriov_vf_bar0_mem32, pf5_sriov_vf_bar0_mem64

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar0_type          = "pf6_bar0_mem32",          //pf6_bar0_mem32, pf6_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar1_type          = "pf6_bar1_mem32",          //pf6_bar0_mem32, pf6_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar2_type          = "pf6_bar2_mem32",          //pf6_bar2_mem32, pf6_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar3_type          = "pf6_bar3_mem32",          //pf6_bar0_mem32, pf6_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar4_type          = "pf6_bar4_mem32",          //pf6_bar4_mem32, pf6_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar5_type          = "pf6_bar5_mem32",          //pf6_bar0_mem32, pf6_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar0_type = "pf6_sriov_vf_bar0_mem64", //pf6_sriov_vf_bar0_mem32, pf6_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar1_type = "pf6_sriov_vf_bar1_mem64", //pf6_sriov_vf_bar0_mem32, pf6_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar2_type = "pf6_sriov_vf_bar2_mem64", //pf6_sriov_vf_bar2_mem32, pf6_sriov_vf_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar3_type = "pf6_sriov_vf_bar3_mem64", //pf6_sriov_vf_bar0_mem32, pf6_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar4_type = "pf6_sriov_vf_bar4_mem64", //pf6_sriov_vf_bar4_mem32, pf6_sriov_vf_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar5_type = "pf6_sriov_vf_bar5_mem64", //pf6_sriov_vf_bar0_mem32, pf6_sriov_vf_bar0_mem64

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar0_type          = "pf7_bar0_mem32",          //pf7_bar0_mem32, pf7_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar1_type          = "pf7_bar1_mem32",          //pf7_bar0_mem32, pf7_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar2_type          = "pf7_bar2_mem32",          //pf7_bar2_mem32, pf7_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar3_type          = "pf7_bar3_mem32",          //pf7_bar0_mem32, pf7_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar4_type          = "pf7_bar4_mem32",          //pf7_bar4_mem32, pf7_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar5_type          = "pf7_bar5_mem32",          //pf7_bar0_mem32, pf7_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar0_type = "pf7_sriov_vf_bar0_mem64", //pf7_sriov_vf_bar0_mem32, pf7_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar1_type = "pf7_sriov_vf_bar1_mem64", //pf7_sriov_vf_bar0_mem32, pf7_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar2_type = "pf7_sriov_vf_bar2_mem64", //pf7_sriov_vf_bar2_mem32, pf7_sriov_vf_bar2_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar3_type = "pf7_sriov_vf_bar3_mem64", //pf7_sriov_vf_bar0_mem32, pf7_sriov_vf_bar0_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar4_type = "pf7_sriov_vf_bar4_mem64", //pf7_sriov_vf_bar4_mem32, pf7_sriov_vf_bar4_mem64
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar5_type = "pf7_sriov_vf_bar5_mem64", //pf7_sriov_vf_bar0_mem32, pf7_sriov_vf_bar0_mem64

  parameter   core16_pf0_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf0_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf1_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf2_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf3_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf4_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf5_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf6_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf7_expansion_base_address_register_hwtcl  =    0,
  
  parameter   core16_pf0_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar5_address_width_int_hwtcl  =    16,

  parameter   core16_virtio_pci_cfg_acc_intf_en_hwtcl                  = 0,

  parameter   core16_enable_virtio_hwtcl                        = 0,
  parameter   core16_ceb_en_hwtcl                               = 0,  
  parameter   core16_ceb_ack_latency_hwtcl                      = 100,
  parameter   core16_ceb_pf_std_cap_last_ptr                    = 0,     // 0x000 to 0x03F
  parameter   core16_ceb_pf_ext_cap_last_ptr                    = 64,   // 0x040 to 0x3FF
  parameter   core16_ceb_vf_std_cap_last_ptr                    = 0,     // 0x000 to 0x03F
  parameter   core16_ceb_vf_ext_cap_last_ptr                    = 64,   // 0x040 to 0x3FF
  
  parameter   core16_cii_en_hwtcl                                       = 0,
  parameter   core16_cii_ack_latency_hwtcl                              = 100,

  parameter   core16_dfl_en_hwtcl                                       = 0,
  parameter   core16_dfl_total                                   = 1,
  parameter   core16_dfl_next_cap_offset                         = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_virtio_en            = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_virtio_en       = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_msix_enable          = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_pci_msix_table_size        = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_msix_cap_enable = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf0        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf1        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf2        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf3        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf4        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf5        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf6        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf7        = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_pcie_slot_imp                = 0,
 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_ats_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_tph_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_acs_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_maxpayload_size  =   "max_payload_1024",

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_link_width       =   "x16",

  parameter   core16_flr_cap_hwtcl                                    = 0,

  parameter   core16_dfh_fid_hwtcl                = 0,
  parameter   core16_dfh_major_ver_hwtcl          = 0,
  parameter   core16_dfh_next_byte_offset_hwtcl   = 0,
  parameter   core16_dfh_end_hwtcl                = 0,
  parameter   core16_dfh_minor_rev_hwtcl          = 0,
  parameter   core16_dfh_ver_hwtcl                = 0,
  parameter   core16_dfh_feature_type_hwtcl       = 0,
  parameter   core16_inst_id_hwtcl                = 0,
  
  parameter   qhip_mode_hwtcl                                         = 1,
  parameter   virtual_tlp_bypass_en_user_hwtcl                        = 0, //TLP Bypass Parameter
  parameter   MIF_DIRECTORY                                           = "../mif",
  parameter   DFL_MIF_DIRECTORY                                       = "../mif",
  parameter   PERFMON_EN                          = 0,
  parameter   BP_DEBUG_MON_EN                     = 0,

 //SM QHIP sm_pcie_sip_top parameter
 //`include "intel_pcie_sm_qhip_ast_qhip_parameter.iv"

 //SM HAL phip parameter
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

// (C) 2001-2023 Intel Corporation. All rights reserved.
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
   parameter sm_hssi_pcie_ctl_x4_pf0_port_logic_fast_link_mode                      =   "PF0_PORT_LOGIC_FAST_LINK_MODE_ENABLE",
   parameter sm_hssi_pcie_ctl_x4_pf0_cap_link_surprise_down_err_cap_hwtcl           =   "PF0_CAP_LINK_SURPRISE_DOWN_ERR_CAP_DISABLE",
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

  parameter   core16_func_mode_hwtcl = "Enable",
  parameter   sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl = "NUM_OF_LANES_NUM_1"
)(

  // QHIP refclk and reset
  input                              refclk0,
//  input                              refclk0_n,
  input                              i_syspll_c0_clk,
  input                              i_syspll_c1_clk,
  input                              i_syspll_c2_clk,
  input                              i_ss_vccl_syspll_locked,
  input                              i_flux_clk,
  input                              refclk1, //two independent refclk for each x8 core in 2x8 
  input                              dummy_user_avmm_rst, //dummy AVMM reset, terminated when xcvr_reconfig, cpl_timeout, hip_reconfig are disabled, associated reset for xcvr_reconfig interface 
  input                              pin_perst_n,
  input                              i_gpio_perst0_n,
  output                             coreclkout_hip_toapp,
  output                             p0_pin_perst_n, 
  output                             p0_reset_status_n,

  //Changes from ww42
  input                              ninit_done,            //user connect to FPGA reset release IP

  // PCIe SS Clock and reset
  input                              p0_axi_st_clk,
  input                              p0_axi_lite_clk,

  input                              p0_axi_st_areset_n,
  input                              p0_axi_lite_areset_n,

  input                              p0_subsystem_cold_rst_n,
  input                              p0_subsystem_warm_rst_n,
  output                             p0_subsystem_cold_rst_ack_n,
  output                             p0_subsystem_warm_rst_ack_n,
  input                              p0_subsystem_rst_req,
  output                             p0_subsystem_rst_rdy,
  output                             p0_initiate_warmrst_req,
  input                              p0_initiate_rst_req_rdy,

  // AXI-MM clock and reset
  input                              p0_axi_mm_clk,
  input                              p0_axi_mm_areset_n,

  input   [2:0]                      p0_app_ss_st_rx_tuser_halt,//SM

  // Application Packet Receive Interface
  output                             p0_ss_app_st_rx_tvalid,
  input                              p0_app_ss_st_rx_tready,
  output [core16_DWIDTH-1:0]         p0_ss_app_st_rx_tdata,
  output [(core16_DWIDTH/8)-1:0]     p0_ss_app_st_rx_tkeep,
  output                             p0_ss_app_st_rx_tlast,
  output [2:0]                       p0_ss_app_st_rx_tuser_vendor,
  output                             p0_ss_app_st_rx_tuser,
  
    // Application Packet Receive Interface ST2
  output                             p0_ss_app_st_rxreq_tvalid,
  input                              p0_app_ss_st_rxreq_tready,
  output [core16_DWIDTH-1:0]         p0_ss_app_st_rxreq_tdata,
  output [(core16_DWIDTH/8)-1:0]     p0_ss_app_st_rxreq_tkeep,
  output                             p0_ss_app_st_rxreq_tlast,
  output [2:0]                       p0_ss_app_st_rxreq_tuser_vendor,
  output [7:0]                       p0_ss_app_st_rxreq_tuser_last_segment, //KAHUAT_EDIT
  
  // Application Packet Transmit Interface
  input                              p0_app_ss_st_tx_tvalid,
  output                             p0_ss_app_st_tx_tready,
  input  [core16_DWIDTH-1:0]         p0_app_ss_st_tx_tdata,
  input  [(core16_DWIDTH/8)-1:0]     p0_app_ss_st_tx_tkeep,
  input                              p0_app_ss_st_tx_tlast,
  input  [1:0]                       p0_app_ss_st_tx_tuser_vendor,
  input                              p0_app_ss_st_tx_tuser,

  // Application Request Interface
  input                              p0_app_ss_st_txreq_tvalid,
  output                             p0_ss_app_st_txreq_tready,
  input  [255:0]                     p0_app_ss_st_txreq_tdata,
  input                              p0_app_ss_st_txreq_tlast,

  // Configuration intercept interface
  output                             p0_ss_app_st_ciireq_tvalid,
  input                              p0_app_ss_st_ciireq_tready,
  output [71:0]                      p0_ss_app_st_ciireq_tdata,
  input                              p0_app_ss_st_ciiresp_tvalid,
  input  [32:0]                      p0_app_ss_st_ciiresp_tdata,

  // Configuration Extension Bus Request Interface
  output                             p0_ss_app_st_cebreq_tvalid,
  input                              p0_app_ss_st_cebreq_tready,
  output [67:0]                      p0_ss_app_st_cebreq_tdata,

  // Configuration Extension Bus Response Interface
  input                              p0_app_ss_st_cebresp_tvalid,
  input  [31:0]                      p0_app_ss_st_cebresp_tdata,

  // Function Level Reset Received Interface
  output                             p0_ss_app_st_flrrcvd_tvalid,
  output [19:0]                      p0_ss_app_st_flrrcvd_tdata,

  // Function Level Reset Completion Interface
  input                              p0_app_ss_st_flrcmpl_tvalid,
  input  [19:0]                      p0_app_ss_st_flrcmpl_tdata,

  // Control Shadow Interface
  output                             p0_ss_app_st_ctrlshadow_tvalid,
  output [39:0]                      p0_ss_app_st_ctrlshadow_tdata,

  // Transmit Flow Control Credit Interface
  output                             p0_ss_app_st_txcrdt_tvalid,
  output [18:0]                      p0_ss_app_st_txcrdt_tdata,

  // Completion Timeout Interface
  output                             p0_ss_app_st_cplto_tvalid,
  output [29:0]                      p0_ss_app_st_cplto_tdata,

  // VF Error Flag Interface
  output                             p0_ss_app_vf_err_poisonedwrreq_s0,
  output                             p0_ss_app_vf_err_poisonedwrreq_s1,
  output                             p0_ss_app_vf_err_poisonedwrreq_s2,
  output                             p0_ss_app_vf_err_poisonedwrreq_s3,

  output                             p0_ss_app_vf_err_poisonedcompl_s0,
  output                             p0_ss_app_vf_err_poisonedcompl_s1,
  output                             p0_ss_app_vf_err_poisonedcompl_s2,
  output                             p0_ss_app_vf_err_poisonedcompl_s3,

  output                             p0_ss_app_vf_err_ur_postedreq_s0,
  output                             p0_ss_app_vf_err_ur_postedreq_s1,
  output                             p0_ss_app_vf_err_ur_postedreq_s2,
  output                             p0_ss_app_vf_err_ur_postedreq_s3,

  output                             p0_ss_app_vf_err_ca_postedreq_s0,
  output                             p0_ss_app_vf_err_ca_postedreq_s1,
  output                             p0_ss_app_vf_err_ca_postedreq_s2,
  output                             p0_ss_app_vf_err_ca_postedreq_s3,

  output [10:0]                      p0_ss_app_vf_err_vf_num_s0,
  output [10:0]                      p0_ss_app_vf_err_vf_num_s1,
  output [10:0]                      p0_ss_app_vf_err_vf_num_s2,
  output [10:0]                      p0_ss_app_vf_err_vf_num_s3,

  output [2:0]                       p0_ss_app_vf_err_func_num_s0,
  output [2:0]                       p0_ss_app_vf_err_func_num_s1,
  output [2:0]                       p0_ss_app_vf_err_func_num_s2,
  output [2:0]                       p0_ss_app_vf_err_func_num_s3,

  output                             p0_ss_app_vf_err_overflow,
  input                              p0_app_ss_sent_vfnonfatalmsg,
  input  [10:0]                      p0_app_ss_vfnonfatalmsg_vf_num,
  input  [2:0]                       p0_app_ss_vfnonfatalmsg_func_num,

  // Control and Status Register Responder Interface
  input                              p0_app_ss_lite_csr_awvalid,
  output                             p0_ss_app_lite_csr_awready,
  input  [core16_LiteSlvAWD-1:0]     p0_app_ss_lite_csr_awaddr,

  input                              p0_app_ss_lite_csr_wvalid,
  output                             p0_ss_app_lite_csr_wready,
  input  [core16_LiteSlvDWD-1:0]     p0_app_ss_lite_csr_wdata,
  input  [core16_LiteSlvDWD/8 -1:0]  p0_app_ss_lite_csr_wstrb,

  output                             p0_ss_app_lite_csr_bvalid,
  input                              p0_app_ss_lite_csr_bready,
  output [1:0]                       p0_ss_app_lite_csr_bresp,

  input                              p0_app_ss_lite_csr_arvalid,
  output                             p0_ss_app_lite_csr_arready,
  input  [core16_LiteSlvAWD-1:0]     p0_app_ss_lite_csr_araddr,

  output                             p0_ss_app_lite_csr_rvalid,
  input                              p0_app_ss_lite_csr_rready,
  output [core16_LiteSlvDWD-1:0]     p0_ss_app_lite_csr_rdata,
  output [1:0]                       p0_ss_app_lite_csr_rresp,

  // Application AXI Lite Initiator Interface
  output                             p0_ss_app_lite_initatr_awvalid,
  input                              p0_app_ss_lite_initatr_awready,
  output [core16_LiteMstrAWD-1:0]    p0_ss_app_lite_initatr_awaddr,

  output                             p0_ss_app_lite_initatr_wvalid,
  input                              p0_app_ss_lite_initatr_wready,
  output [core16_LiteMstrDWD-1:0]    p0_ss_app_lite_initatr_wdata,
  output [core16_LiteMstrDWD/8 -1:0] p0_ss_app_lite_initatr_wstrb,

  input                              p0_app_ss_lite_initatr_bvalid,
  output                             p0_ss_app_lite_initatr_bready,
  input  [1:0]                       p0_app_ss_lite_initatr_bresp,

  output                             p0_ss_app_lite_initatr_arvalid,
  input                              p0_app_ss_lite_initatr_arready,
  output [core16_LiteMstrAWD-1:0]    p0_ss_app_lite_initatr_araddr,

  input                              p0_app_ss_lite_initatr_rvalid,
  output                             p0_ss_app_lite_initatr_rready,
  input  [core16_LiteMstrDWD-1:0]    p0_app_ss_lite_initatr_rdata,
  input  [1:0]                       p0_app_ss_lite_initatr_rresp,

  // Application AXI MM Initiator Interface 
  output                             p0_ss_app_mm_initatr_awvalid,
  input                              p0_app_ss_mm_initatr_awready,
  output [core16_MMAWD-1:0]          p0_ss_app_mm_initatr_awaddr,
  output [core16_MMBLWD-1:0]         p0_ss_app_mm_initatr_awlen,
  output [2:0]                       p0_ss_app_mm_initatr_awsize,
  output                             p0_ss_app_mm_initatr_awprot,

  output                             p0_ss_app_mm_initatr_wvalid,
  output                             p0_ss_app_mm_initatr_wlast,
  input                              p0_app_ss_mm_initatr_wready,
  output [core16_MMDWD-1:0]          p0_ss_app_mm_initatr_wdata,
  output [core16_MMDWD/8 -1:0]       p0_ss_app_mm_initatr_wstrb,

  input                              p0_app_ss_mm_initatr_bvalid,
  output                             p0_ss_app_mm_initatr_bready,
  input  [1:0]                       p0_app_ss_mm_initatr_bresp,

  output                             p0_ss_app_mm_initatr_arvalid,
  input                              p0_app_ss_mm_initatr_arready,
  output [core16_MMAWD-1:0]          p0_ss_app_mm_initatr_araddr,
  output [core16_MMBLWD-1:0]         p0_ss_app_mm_initatr_arlen,
  output [2:0]                       p0_ss_app_mm_initatr_arsize,
  output                             p0_ss_app_mm_initatr_arprot,

  input                              p0_app_ss_mm_initatr_rvalid,
  input                              p0_app_ss_mm_initatr_rlast,
  output                             p0_ss_app_mm_initatr_rready,
  input  [core16_MMDWD-1:0]          p0_app_ss_mm_initatr_rdata,
  input  [1:0]                       p0_app_ss_mm_initatr_rresp,

  // SS-APP VirtIO interface
  output                             p0_ss_app_virtio_pcicfgreq_tvalid,
  output [95:0]                      p0_ss_app_virtio_pcicfgreq_tdata,
  input  [31:0]                      p0_app_ss_virtio_pcicfgcmpl_tdata,
  input                              p0_app_ss_virtio_pcicfgcmpl_tvalid,

  //Misc signals
  output                             p0_ss_app_serr,

  output                             p0_ss_app_linkup,

  output                             p0_ss_app_dlup,

  output                             p0_ss_app_surprise_down_err,

  output [5:0]                            p0_ss_app_ltssmstate,

  output                             p0_ss_app_rx_par_err,

  output                             p0_ss_app_tx_par_err,

  output [31:0]                      p0_ss_app_bus_number, //axi lite clk

  // Misc signals: Root Port Only
  output                             p0_ss_app_int_status,

  //Serial Interface Sgnals - For ED
  input  			     rx_n_in0,
  input  			     rx_p_in0,
  output 			     tx_n_out0,
  output 			     tx_p_out0,
  input  			     rx_n_in1,
  input  			     rx_p_in1,
  output 			     tx_n_out1,
  output 			     tx_p_out1,
  input  			     rx_n_in2,
  input  			     rx_p_in2,
  output 			     tx_n_out2,
  output 			     tx_p_out2,
  input  			     rx_n_in3,
  input  			     rx_p_in3,
  output 			     tx_n_out3,
  output 			     tx_p_out3,

  //test ports - use hwtcl to hide when not in debug mode
  input                              p0_test_in_i,
  output [34:0]                      p0_test_out_o,

  //SM 
  input                          ptm_manual_update,               //PTM    Check User Guide for details
  output                         ptm_context_valid,               //QHIP PTM    Check User Guide for details
  output                         start_ptm_newclk_value,          //PTM    Check User Guide for details
  output                         ptm_newclk_value,                //PTM    Check User Guide for details
  output                         ptm_clock_correction             //PTM    Check User Guide for details

);
  
 `define BAR_SIZE_LOCALPARAM(PF_INDEX) localparam  core16_pf``PF_INDEX``_clog2_bar0_size             = core16_pf``PF_INDEX``_bar0_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar1_size             = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_bar0_type == "pf``PF_INDEX``_bar0_mem64")? core16_pf``PF_INDEX``_bar0_address_width_hwtcl : core16_pf``PF_INDEX``_bar1_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar2_size             = core16_pf``PF_INDEX``_bar2_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar3_size             = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_bar2_type == "pf``PF_INDEX``_bar2_mem64")? core16_pf``PF_INDEX``_bar2_address_width_hwtcl : core16_pf``PF_INDEX``_bar3_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar4_size             = core16_pf``PF_INDEX``_bar4_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar5_size             = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_bar4_type == "pf``PF_INDEX``_bar4_mem64")? core16_pf``PF_INDEX``_bar4_address_width_hwtcl : core16_pf``PF_INDEX``_bar5_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar7_size             = core16_pf``PF_INDEX``_expansion_base_address_register_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar0_size    = core16_pf``PF_INDEX``_sriov_vf_bar0_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar1_size    = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_sriov_vf_bar0_type == "pf``PF_INDEX``_sriov_vf_bar0_mem64")? core16_pf``PF_INDEX``_sriov_vf_bar0_address_width_int_hwtcl : core16_pf``PF_INDEX``_sriov_vf_bar1_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar2_size    = core16_pf``PF_INDEX``_sriov_vf_bar2_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar3_size    = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_sriov_vf_bar2_type == "pf``PF_INDEX``_sriov_vf_bar2_mem64")? core16_pf``PF_INDEX``_sriov_vf_bar2_address_width_int_hwtcl : core16_pf``PF_INDEX``_sriov_vf_bar3_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar4_size    = core16_pf``PF_INDEX``_sriov_vf_bar4_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar5_size    = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_sriov_vf_bar4_type == "pf``PF_INDEX``_sriov_vf_bar4_mem64")? core16_pf``PF_INDEX``_sriov_vf_bar4_address_width_int_hwtcl : core16_pf``PF_INDEX``_sriov_vf_bar5_address_width_int_hwtcl;
  `BAR_SIZE_LOCALPARAM(0)
  `BAR_SIZE_LOCALPARAM(1)
  `BAR_SIZE_LOCALPARAM(2)
  `BAR_SIZE_LOCALPARAM(3)
  `BAR_SIZE_LOCALPARAM(4)
  `BAR_SIZE_LOCALPARAM(5)
  `BAR_SIZE_LOCALPARAM(6)
  `BAR_SIZE_LOCALPARAM(7)

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

  localparam SS_PWIDTH = 32; //1DW

  //Wires

  //Debug toolkit interface - no need to expose - TODO
  wire                                   pli_avmm_master_write = 0;
  wire                                   pli_avmm_master_read = 0;
  wire [23:0]                            pli_avmm_master_address = 0;
  wire [31:0]                            pli_avmm_master_writedata = 0;
  wire [31:0]                            pli_avmm_master_readdata;
  wire                                   pli_avmm_master_readdatavalid;
  wire                                   pli_avmm_master_waitrequest;

  //tuser.last_segment
  wire                              p0_app_ss_st_tx_tuser_last_segment;
  //wire                              p0_ss_app_st_rx_tuser_last_segment;
  wire [7:0]                        p0_ss_app_st_rx_tuser_last_segment;
  wire [6:0]                        p0_ss_app_st_rx_tuser_last_segment_nc;

  //Wires for lint
  //wire                                   user_mode_to_pld;

  //wires for qhip_mode_hwtcl
  wire [core16_payload_width_integer_hwtcl-1:0]    p0_rx_st_data_o;
  wire [core16_hdr_width_integer_hwtcl-1:0]        p0_rx_st_hdr_o;
  wire [core16_pfx_width_integer_hwtcl-1:0]        p0_rx_st_tlp_prfx_o;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_rx_st_eop_o;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_rx_st_sop_o;
  wire [core16_double_width_integer_hwtcl*11-1:0]  p0_rx_st_vf_num_o;
  wire [core16_double_width_integer_hwtcl*3-1:0]   p0_rx_st_func_num_o;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_rx_st_valid_o;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_rx_st_vf_active_o;
  wire [core16_double_width_integer_hwtcl*16-1:0]  p0_rx_st_hdr_par_o;
  wire [core16_empty_width_integer_hwtcl-1:0]      p0_rx_st_empty_o;
  wire [core16_double_width_integer_hwtcl*4-1:0]   p0_rx_st_tlp_prfx_par_o;
  wire [core16_double_width_integer_hwtcl*32-1:0]  p0_rx_st_data_par_o;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_rx_st_tlp_abort_o;
  wire                                             p0_rx_st_ready_i;
  wire [core16_double_width_integer_hwtcl*3-1:0]   p0_rx_st_bar_range_o;
  wire                                             p0_rx_par_err_o;
  
  wire [1:0]                                       p0_rx_buffer_limit_tdm_idx_i;
  wire [11:0]                                      p0_rx_buffer_limit_i;

  wire [core16_payload_width_integer_hwtcl-1:0]    p0_tx_st_data_i;
  wire [core16_hdr_width_integer_hwtcl-1:0]        p0_tx_st_hdr_i;
  wire [core16_pfx_width_integer_hwtcl-1:0]        p0_tx_st_tlp_prfx_i;
  wire [core16_payload_width_integer_hwtcl/8-1:0]  p0_tx_st_data_par_i;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_tx_st_valid_i;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_tx_st_sop_i;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_tx_st_err_i;
  wire [core16_double_width_integer_hwtcl*16-1:0]  p0_tx_st_hdr_par_i;
  wire [core16_double_width_integer_hwtcl-1:0]     p0_tx_st_eop_i;
  wire                                             p0_tx_st_ready_o;
  wire [core16_double_width_integer_hwtcl*4-1:0]   p0_tx_st_tlp_prfx_par_i;
  wire                                             p0_tx_par_err_o;

  wire [15:0]                                      p0_tx_cdts_limit_o;
  wire [2:0]                                       p0_tx_cdts_limit_tdm_idx_o;

  wire [7:0]                                       p0_app_int_i;
  wire [7:0]                                       p0_app_int_ready_o;
  wire                                             p0_int_status_o;

  wire [2:0]                                       p0_msi_pnd_func_i;
  wire [7:0]                                       p0_msi_pnd_byte_i;
  wire [1:0]                                       p0_msi_pnd_addr_i;
  wire [10:0]                                      p0_msi_pnd_vf_num_i; 
  wire                                             p0_msi_pnd_vfa_i;
  wire                                             p0_msi_pnd_ready_o;
  wire                                             p0_surprise_down_err_o;
  wire [7:0]                                       p0_apps_pm_xmt_pme_i;
  wire                                             p0_dl_up_o;
  wire                                             p0_app_xfer_pending_i;
  wire                                             p0_app_init_rst_i;
  wire                                             p0_apps_pm_xmt_turnoff_i;
  wire                                             p0_apps_ready_entr_l23_i;
  wire [9:0]                                       p0_apps_pm_ready_o;

  wire [2:0]                                       p0_pm_state_o;
  wire [31:0]                                      p0_pm_dstate_o;
  wire [5:0]                                       p0_ltssm_state_o;
  wire                                             p0_link_up_o;

  wire [2:0]                                       p0_app_err_func_num_i;
  wire                                             p0_app_err_valid_i;
  wire [31:0]                                      p0_app_err_hdr_i;
  wire                                             p0_serr_out_o;
  wire [12:0]                                      p0_app_err_info_i;
  wire                                             p0_app_err_ready_o;
  wire                                             p0_hip_enter_err_mode_o;

  wire                                             p0_sys_pwr_fault_det_i;
  wire                                             p0_sys_pre_det_chged_i;
  wire                                             p0_sys_mrl_sensor_chged_i;
  wire                                             p0_sys_aux_pwr_det_i;
  wire                                             p0_sys_cmd_cpled_int_i;
  wire                                             p0_sys_mrl_sensor_state_i;
  wire                                             p0_sys_pre_det_state_i;
  wire                                             p0_sys_atten_button_pressed_i;
  wire                                             p0_sys_eml_interlock_engaged_i;
  wire [7:0]                                       p0_sys_hotplug_ready_o;

  wire [10:0]                                      p0_flr_rcvd_vf_num_o;
  wire                                             p0_flr_rcvd_vf_o;
  wire [2:0]                                       p0_flr_rcvd_pf_num_o;
  wire [7:0]                                       p0_flr_rcvd_pf_o;
  wire [2:0]                                       p0_flr_completed_pf_num_i;
  wire [10:0]                                      p0_flr_completed_vf_num_i;
  wire                                             p0_flr_completed_vf_i;
  wire [7:0]                                       p0_flr_completed_pf_i;

  wire                                             p0_virtio_pcicfg_vfaccess_o;
  wire [10:0]                                      p0_virtio_pcicfg_vfnum_o;
  wire [2:0]                                       p0_virtio_pcicfg_pfnum_o;
  wire [7:0]                                       p0_virtio_pcicfg_bar_o;
  wire [31:0]                                      p0_virtio_pcicfg_length_o;
  wire [31:0]                                      p0_virtio_pcicfg_baroffset_o;
  wire [31:0]                                      p0_virtio_pcicfg_cfgdata_o;
  wire                                             p0_virtio_pcicfg_cfgwr_o;
  wire                                             p0_virtio_pcicfg_cfgrd_o;
  wire [10:0]                                      p0_virtio_pcicfg_appvfnum_i;
  wire [2:0]                                       p0_virtio_pcicfg_apppfnum_i;
  wire                                             p0_virtio_pcicfg_rdack_i;
  wire [3:0]                                       p0_virtio_pcicfg_rdbe_i;
  wire [31:0]                                      p0_virtio_pcicfg_data_i;
  wire                                             p0_cpl_timeout_o;
  wire                                             p0_cpl_timeout_waitrequest_o;
  wire                                             p0_cpl_timeout_avmm_read_i;
  wire [2:0]                                       p0_cpl_timeout_avmm_address_i;
  wire                                             p0_cpl_timeout_avmm_write_i;
  wire [7:0]                                       p0_cpl_timeout_avmm_writedata_i;
  wire                                             p0_cpl_timeout_avmm_clk_i;
  wire                                             p0_cpl_timeout_avmm_readdatavalid_o;
  wire [7:0]                                       p0_cpl_timeout_avmm_readdata_o;

  wire [4:0]                                       p0_tl_cfg_add_o;
  wire [2:0]                                       p0_tl_cfg_func_o;
  wire [15:0]                                      p0_tl_cfg_ctl_o;
  wire                                             p0_cii_hdr_poisoned_o;
  wire                                             p0_cii_override_en_i;
  wire [3:0]                                       p0_cii_hdr_first_be_o;
  wire [2:0]                                       p0_cii_func_num_o;
  wire [31:0]                                      p0_cii_dout_o;
  wire                                             p0_cii_halt_i;
  wire                                             p0_cii_wr_vf_active_o;
  wire                                             p0_cii_req_o;
  wire [9:0]                                       p0_cii_addr_o;
  wire [10:0]                                      p0_cii_vf_num_o;
  wire                                             p0_cii_wr_o;
  wire [31:0]                                      p0_cii_override_din_i;
  wire [7:0]                                       p0_pld_gp_status_i;
  wire [7:0]                                       p0_pld_gp_ctrl_o;
  wire                                             p0_vf_err_ur_posted_s0_o;
  wire                                             p0_vf_err_ur_posted_s1_o;
  wire                                             p0_vf_err_ur_posted_s2_o;
  wire                                             p0_vf_err_ur_posted_s3_o;
  wire [2:0]                                       p0_vf_err_func_num_s0_o;
  wire [2:0]                                       p0_vf_err_func_num_s1_o;
  wire [2:0]                                       p0_vf_err_func_num_s2_o;
  wire [2:0]                                       p0_vf_err_func_num_s3_o;
  wire                                             p0_vf_err_ca_postedreq_s0_o;
  wire                                             p0_vf_err_ca_postedreq_s1_o;
  wire                                             p0_vf_err_ca_postedreq_s3_o;
  wire                                             p0_vf_err_ca_postedreq_s2_o;
  wire [10:0]                                      p0_vf_err_vf_num_s0_o;
  wire [10:0]                                      p0_vf_err_vf_num_s1_o;
  wire [10:0]                                      p0_vf_err_vf_num_s2_o;
  wire [10:0]                                      p0_vf_err_vf_num_s3_o;
  wire                                             p0_vf_err_poisonedwrreq_s0_o;
  wire                                             p0_vf_err_poisonedwrreq_s1_o;
  wire                                             p0_vf_err_poisonedwrreq_s2_o;
  wire                                             p0_vf_err_poisonedwrreq_s3_o;
  wire                                             p0_vf_err_poisonedcompl_s0_o;
  wire                                             p0_vf_err_poisonedcompl_s1_o;
  wire                                             p0_vf_err_poisonedcompl_s2_o;
  wire                                             p0_vf_err_poisonedcompl_s3_o;
  wire [2:0]                                       p0_user_vfnonfatalmsg_func_num_i;
  wire [10:0]                                      p0_user_vfnonfatalmsg_vfnum_i;
  wire                                             p0_user_sent_vfnonfatalmsg_i;
  wire                                             p0_vf_err_overflow_o;
  wire [7:0]                                       p0_app_req_retry_en_i;
  wire                                             p0_app_retry_en_ready_o;
  wire                                             p0_hip_reconfig_clk;
  wire [23:0]                                      p0_hip_reconfig_address;  // KLAI4 for FunctionType MISC REG to resolve RP interrupt access
  wire                                             p0_hip_reconfig_read;
  wire [31:0]                                       p0_hip_reconfig_readdata;
  wire                                             p0_hip_reconfig_readdatavalid;
  wire [31:0]                                       p0_hip_reconfig_writedata;
  wire                                             p0_hip_reconfig_waitrequest;
  wire [3:0]                                       p0_hip_reconfig_byteen; //KAHUAT_EDIT
  wire [1:0]                                       p0_hip_reconfig_resp; //KAHUAT_EDIT
  wire                                             p0_hip_reconfig_write;
  wire                                             p0_dl_timer_update_o;
  wire                                             p0_prs_event_valid_i;
  wire [2:0]                                       p0_prs_event_func_i;
  wire [1:0]                                       p0_prs_event_i;
  wire                                             pin_perst_2_n;
  wire                                             p0_pld_in_use_o;
  wire                                             p0_user_mode_to_pld_o;
  wire                                             p0_pld_link_req_rst_o;
  wire                                             p0_pld_warm_rst_rdy_i;    
  wire [7:0]                                       p0_10bits_tag_req_en_o;

//SM
  wire                                pcie_pld_rx_fbk_tready;

  wire                                   p0_rst_rdy_i;
  wire                                   p0_rst_req_o;

  wire                                   p0_st_tx_tvalid_i;
  wire                                   p0_st_tx_tlast_i;
  wire  [core16_DWIDTH-1:0]               p0_st_tx_tdata_i;
  wire  [(core16_DWIDTH/8)-1:0]           p0_st_tx_tkeep_i;
  wire                                   p0_st_tx_tuser_last_segment;
  wire                                   p0_st_tx_tready_o;

  wire                                   p0_st_rx_tready_i;
  wire                                   p0_st_rx_tvalid_o;
  wire                                   p0_st_rx_tlast_o;
  wire [core16_DWIDTH-1:0]                p0_st_rx_tdata_o;
  wire [(core16_DWIDTH/8)-1:0]            p0_st_rx_tkeep_o;
  wire                                   p0_st_rx_tuser_last_segment;

  wire [7:0]                             p0_app_retry_en_i;

  wire                                  p0_flrcmpl_tvalid_i;
  wire [19:0]                           p0_flrcmpl_tvdata_i;

  wire                                  p0_virtio_pcicfgcmpl_tvalid_i;
  wire [31:0]                           p0_virtio_pcicfgcmpl_tdata_i;

  wire                                        p0_qhip_prs_event_valid_i;
  wire  [2:0]                                 p0_qhip_prs_event_func_i;
  wire  [1:0]                                 p0_qhip_prs_event_i;
  wire                                        p0_qhip_prs_event_ready_o;

  wire                                           p0_st_txcrdt_tvalid_o;
  wire  [18:0]                                   p0_st_txcrdt_tvdata_o;
  wire						 p0_st_txcrdt_tldrdy_i;

  wire                                           p0_flrrcvd_tvalid_o;
  wire  [19:0]                                   p0_flrrcvd_tvdata_o;

  wire                                           p0_virtio_pcicfgreq_tvalid_o;
  wire  [95:0]                                   p0_virtio_pcicfgreq_tdata_o; 

  wire                                           p0_st_cplto_tvalid_o;
  wire  [43:0]                                   p0_st_cplto_tdata_o; 

  wire  [67:0]                                   p0_st_ciireq_tdata_o;
  wire  [32:0]                                   p0_st_ciiresp_tdata_i; 
  wire                                           p0_st_cii_halt_i;
  wire                                           p0_st_cii_req_o;


  //Debug toolkit avmm wires
  wire [20:0]                                      pciess_reconfig_address;
  wire                                             pciess_reconfig_waitrequest;
  wire                                             pciess_reconfig_read;
  wire [31:0]                                      pciess_reconfig_readdata;
  wire                                             pciess_reconfig_readdatavalid;
  wire                                             pciess_reconfig_write;
  wire [31:0]                                      pciess_reconfig_writedata; 
  
  //AVMM2AXILite wires for debug toolkit mode
  wire [19:0]                                      p0_dbg_lite_csr_awaddr;
  wire                                             p0_dbg_lite_csr_awvalid;
  wire                                             p0_dbg_lite_csr_awready;
  wire [31:0]                                      p0_dbg_lite_csr_wdata;
  wire [3:0]                                       p0_dbg_lite_csr_wstrb;
  wire                                             p0_dbg_lite_csr_wvalid;
  wire                                             p0_dbg_lite_csr_wready;
  wire [1:0]                                       p0_dbg_lite_csr_bresp;
  wire                                             p0_dbg_lite_csr_bvalid;
  wire                                             p0_dbg_lite_csr_bready;
  wire [19:0]                                      p0_dbg_lite_csr_araddr;
  wire                                             p0_dbg_lite_csr_arvalid;
  wire                                             p0_dbg_lite_csr_arready;
  wire [31:0]                                      p0_dbg_lite_csr_rdata;
  wire [1:0]                                       p0_dbg_lite_csr_rresp;
  wire                                             p0_dbg_lite_csr_rvalid;
  wire                                             p0_dbg_lite_csr_rready;

  //Func vs Dbg toolkit muxed wires
  wire [core16_LiteSlvAWD-1:0]                     p0_lite_csr_awaddr;
  wire                                             p0_lite_csr_awvalid;
  wire                                             p0_lite_csr_awready;
  wire [core16_LiteSlvDWD-1:0]                     p0_lite_csr_wdata;
  wire [core16_LiteSlvDWD/8-1:0]                   p0_lite_csr_wstrb;
  wire                                             p0_lite_csr_wvalid;
  wire                                             p0_lite_csr_wready;
  wire [1:0]                                       p0_lite_csr_bresp;
  wire                                             p0_lite_csr_bvalid;
  wire                                             p0_lite_csr_bready;
  wire [core16_LiteSlvAWD-1:0]                     p0_lite_csr_araddr;
  wire                                             p0_lite_csr_arvalid;
  wire                                             p0_lite_csr_arready;
  wire [core16_LiteSlvDWD-1:0]                     p0_lite_csr_rdata;
  wire [1:0]                                       p0_lite_csr_rresp;
  wire                                             p0_lite_csr_rvalid;
  wire                                             p0_lite_csr_rready;

  wire                                             p0_warm_rst_coreclk_n;
  wire                                             p0_warm_rst_stclk_n;
  wire                                             p0_ss_app_serr_sync;
  wire                                             p0_ss_app_linkup_sync;
  wire                                             p0_ss_app_dlup_sync;

  wire                                             p0_ss_app_surprise_down_err_sync;
  wire [5:0]                                       p0_ss_app_ltssmstate_sync;
  wire                                             p0_ss_app_rx_par_err_sync;
  wire                                             p0_ss_app_tx_par_err_sync;
  wire                                             p0_ss_app_int_status_sync;


  tile_if #(.payload_width   (core16_payload_width_integer_hwtcl),
            .hdr_width       (core16_hdr_width_integer_hwtcl),
            .pfx_width       (core16_pfx_width_integer_hwtcl),
            .double_width    (core16_double_width_integer_hwtcl),
            .empty_width     (core16_empty_width_integer_hwtcl)) p0_tileif();

  tile_if #(.DWIDTH          (core16_DWIDTH),
	    .payload_width   (core16_payload_width_integer_hwtcl),
	    .pfx_width       (core16_pfx_width_integer_hwtcl),
	    .empty_width     (core16_empty_width_integer_hwtcl),
            .hdr_width       (core16_hdr_width_integer_hwtcl),
	    .double_width    (core16_double_width_integer_hwtcl)) sm_p0_tileif();



  assign p0_tileif.coreclkout_hip_toapp = coreclkout_hip_toapp;

  assign p0_tileif.pin_perst_n = p0_pin_perst_n;

  assign p0_tileif.reset_status_n = p0_reset_status_n;

  assign p0_tileif.user_mode_to_pld = p0_user_mode_to_pld_o;

  assign p0_tileif.pld_in_use = p0_pld_in_use_o;  

  assign p0_app_ss_st_tx_tuser_last_segment = p0_app_ss_st_tx_tuser;

  assign p0_ss_app_st_rx_tuser = p0_ss_app_st_rx_tuser_last_segment[0];
  assign p0_ss_app_st_rx_tuser_last_segment_nc[6:0] =  p0_ss_app_st_rx_tuser_last_segment[7:1];

  assign p0_ss_app_vf_err_poisonedwrreq_s0          = p0_tileif.ss_app_vf_err_poisonedwrreq_s0;
  assign p0_ss_app_vf_err_poisonedwrreq_s1          = p0_tileif.ss_app_vf_err_poisonedwrreq_s1;
  assign p0_ss_app_vf_err_poisonedwrreq_s2          = p0_tileif.ss_app_vf_err_poisonedwrreq_s2;
  assign p0_ss_app_vf_err_poisonedwrreq_s3          = p0_tileif.ss_app_vf_err_poisonedwrreq_s3;
  assign p0_ss_app_vf_err_poisonedcompl_s0          = p0_tileif.ss_app_vf_err_poisonedcompl_s0;
  assign p0_ss_app_vf_err_poisonedcompl_s1          = p0_tileif.ss_app_vf_err_poisonedcompl_s1;
  assign p0_ss_app_vf_err_poisonedcompl_s2          = p0_tileif.ss_app_vf_err_poisonedcompl_s2;
  assign p0_ss_app_vf_err_poisonedcompl_s3          = p0_tileif.ss_app_vf_err_poisonedcompl_s3;
  assign p0_ss_app_vf_err_ur_postedreq_s0           = p0_tileif.ss_app_vf_err_ur_postedreq_s0;
  assign p0_ss_app_vf_err_ur_postedreq_s1           = p0_tileif.ss_app_vf_err_ur_postedreq_s1;
  assign p0_ss_app_vf_err_ur_postedreq_s2           = p0_tileif.ss_app_vf_err_ur_postedreq_s2;
  assign p0_ss_app_vf_err_ur_postedreq_s3           = p0_tileif.ss_app_vf_err_ur_postedreq_s3;
  assign p0_ss_app_vf_err_ca_postedreq_s0           = p0_tileif.ss_app_vf_err_ca_postedreq_s0;
  assign p0_ss_app_vf_err_ca_postedreq_s1           = p0_tileif.ss_app_vf_err_ca_postedreq_s1;
  assign p0_ss_app_vf_err_ca_postedreq_s2           = p0_tileif.ss_app_vf_err_ca_postedreq_s2;
  assign p0_ss_app_vf_err_ca_postedreq_s3           = p0_tileif.ss_app_vf_err_ca_postedreq_s3;
  assign p0_ss_app_vf_err_vf_num_s0                 = p0_tileif.ss_app_vf_err_vf_num_s0;
  assign p0_ss_app_vf_err_vf_num_s1                 = p0_tileif.ss_app_vf_err_vf_num_s1;
  assign p0_ss_app_vf_err_vf_num_s2                 = p0_tileif.ss_app_vf_err_vf_num_s2;
  assign p0_ss_app_vf_err_vf_num_s3                 = p0_tileif.ss_app_vf_err_vf_num_s3;
  assign p0_ss_app_vf_err_func_num_s0               = p0_tileif.ss_app_vf_err_func_num_s0;
  assign p0_ss_app_vf_err_func_num_s1               = p0_tileif.ss_app_vf_err_func_num_s1;
  assign p0_ss_app_vf_err_func_num_s2               = p0_tileif.ss_app_vf_err_func_num_s2;
  assign p0_ss_app_vf_err_func_num_s3               = p0_tileif.ss_app_vf_err_func_num_s3;
  assign p0_ss_app_vf_err_overflow                  = p0_tileif.ss_app_vf_err_overflow;
  assign p0_tileif.app_ss_sent_vfnonfatalmsg        = p0_app_ss_sent_vfnonfatalmsg;
  assign p0_tileif.app_ss_vfnonfatalmsg_vf_num      = p0_app_ss_vfnonfatalmsg_vf_num;
  assign p0_tileif.app_ss_vfnonfatalmsg_func_num    = p0_app_ss_vfnonfatalmsg_func_num;


  sm_qhip_tie_off    u_sm_qhip_tie_off (
  .sm_p0_tileif    (sm_p0_tileif.sm_qhip)
  );


  //AVMM2AXILite for debug toolkit mode 
  generate
  if (debug_toolkit_hwtcl) begin : gen_avmm2axilite
    altera_std_synchronizer u_axi_lite_areset_n_axi_lite_clk_sync
    (
       .clk      (p0_axi_lite_clk),
       .reset_n  (p0_axi_lite_areset_n),
       .din      (1'b1),
       .dout     (p0_axi_lite_areset_n_axi_clk_sync)
    );
    avmm2axi4lite #(
	.TILE (TILE)
    ) u_avmm2axi4lite (
    .reset                                              (~p0_axi_lite_areset_n_axi_clk_sync),
    .clk                                                (p0_axi_lite_clk),

    .avm_address                                        (pciess_reconfig_address), //21, 2 bits for selecting channel
    .avm_waitrequest                                    (pciess_reconfig_waitrequest),
    .avm_read                                           (pciess_reconfig_read),
    .avm_readdata                                       (pciess_reconfig_readdata),
    .avm_readdatavalid                                  (pciess_reconfig_readdatavalid),
    .avm_write                                          (pciess_reconfig_write),
    .avm_writedata                                      (pciess_reconfig_writedata),

    .mgc_axi4lite_slave_0_altera_axi4lite_slave_awaddr  (p0_dbg_lite_csr_awaddr), 
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_awprot  (),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_awvalid (p0_dbg_lite_csr_awvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_awready (p0_dbg_lite_csr_awready),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_wdata   (p0_dbg_lite_csr_wdata),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_wstrb   (p0_dbg_lite_csr_wstrb),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_wvalid  (p0_dbg_lite_csr_wvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_wready  (p0_dbg_lite_csr_wready),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_bresp   (p0_dbg_lite_csr_bresp),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_bvalid  (p0_dbg_lite_csr_bvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_bready  (p0_dbg_lite_csr_bready),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_araddr  (p0_dbg_lite_csr_araddr),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_arprot  (),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_arvalid (p0_dbg_lite_csr_arvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_arready (p0_dbg_lite_csr_arready),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_rdata   (p0_dbg_lite_csr_rdata),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_rresp   (p0_dbg_lite_csr_rresp),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_rvalid  (p0_dbg_lite_csr_rvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_rready  (p0_dbg_lite_csr_rready)
  
    );

    assign p0_lite_csr_awvalid     = p0_dbg_lite_csr_awvalid;
    assign p0_dbg_lite_csr_awready = p0_lite_csr_awready;
    assign p0_lite_csr_awaddr      = p0_dbg_lite_csr_awaddr;
    assign p0_lite_csr_wvalid      = p0_dbg_lite_csr_wvalid;
    assign p0_dbg_lite_csr_wready  = p0_lite_csr_wready;
    assign p0_lite_csr_wdata       = p0_dbg_lite_csr_wdata;
    assign p0_lite_csr_wstrb       = p0_dbg_lite_csr_wstrb;
    assign p0_dbg_lite_csr_bvalid  = p0_lite_csr_bvalid;
    assign p0_lite_csr_bready      = p0_dbg_lite_csr_bready;
    assign p0_dbg_lite_csr_bresp   = p0_lite_csr_bresp;
    assign p0_lite_csr_arvalid     = p0_dbg_lite_csr_arvalid;
    assign p0_dbg_lite_csr_arready = p0_lite_csr_arready;
    assign p0_lite_csr_araddr      = p0_dbg_lite_csr_araddr;
    assign p0_dbg_lite_csr_rvalid  = p0_lite_csr_rvalid;
    assign p0_lite_csr_rready      = p0_dbg_lite_csr_rready;
    assign p0_dbg_lite_csr_rdata   = p0_lite_csr_rdata;
    assign p0_dbg_lite_csr_rresp   = p0_lite_csr_rresp;

    assign p0_ss_app_lite_csr_awready = '0;
    assign p0_ss_app_lite_csr_wready = '0;
    assign p0_ss_app_lite_csr_bvalid = '0;
    assign p0_ss_app_lite_csr_bresp = '0;
    assign p0_ss_app_lite_csr_arready = '0;
    assign p0_ss_app_lite_csr_rvalid = '0;
    assign p0_ss_app_lite_csr_rdata = '0;
    assign p0_ss_app_lite_csr_rresp = '0;

  end
  else begin : gen_avmm2axilite
    assign p0_lite_csr_awvalid        = p0_app_ss_lite_csr_awvalid;
    assign p0_ss_app_lite_csr_awready = p0_lite_csr_awready;
    assign p0_lite_csr_awaddr         = p0_app_ss_lite_csr_awaddr;
    assign p0_lite_csr_wvalid         = p0_app_ss_lite_csr_wvalid;
    assign p0_ss_app_lite_csr_wready  = p0_lite_csr_wready;
    assign p0_lite_csr_wdata          = p0_app_ss_lite_csr_wdata;
    assign p0_lite_csr_wstrb          = p0_app_ss_lite_csr_wstrb;
    assign p0_ss_app_lite_csr_bvalid  = p0_lite_csr_bvalid;
    assign p0_lite_csr_bready         = p0_app_ss_lite_csr_bready;
    assign p0_ss_app_lite_csr_bresp   = p0_lite_csr_bresp;
    assign p0_lite_csr_arvalid        = p0_app_ss_lite_csr_arvalid;
    assign p0_ss_app_lite_csr_arready = p0_lite_csr_arready;
    assign p0_lite_csr_araddr         = p0_app_ss_lite_csr_araddr;
    assign p0_ss_app_lite_csr_rvalid  = p0_lite_csr_rvalid;
    assign p0_lite_csr_rready         = p0_app_ss_lite_csr_rready;
    assign p0_ss_app_lite_csr_rdata   = p0_lite_csr_rdata;
    assign p0_ss_app_lite_csr_rresp   = p0_lite_csr_rresp;
    assign pciess_reconfig_readdatavalid = '0;
    assign pciess_reconfig_readdata = '0;
    assign pciess_reconfig_waitrequest = '0;

  end
  endgenerate

  generate
    pciess #(
    .device_family                   (device_family),
    .TILE                            (TILE),
    .HIGH_SPEED                      (HIGH_SPEED),
    .NUM_OF_SEG                      (core16_NUM_OF_SEG),
    .FUNC_MODE                       (core16_FUNC_MODE),
    .Header_Packing_scheme           (core16_Header_Packing_scheme),
    .DWIDTH                          (core16_DWIDTH),
    .ST_readyLatency                 (core16_ST_readyLatency),
    .LiteSlvAWD                      (core16_LiteSlvAWD),
    .LiteSlvDWD                      (core16_LiteSlvDWD),
    .LiteMstrAWD                     (core16_LiteMstrAWD),
    .LiteMstrDWD                     (core16_LiteMstrDWD),
    .LiteMstr_readyLatency           (core16_LiteMstr_readyLatency),
    .MMAWD                           (core16_MMAWD),
    .MMBLWD                          (core16_MMBLWD),
    .MMDWD                           (core16_MMDWD),
    .MM_readyLatency                 (core16_MM_readyLatency),
    .CPL_REORDERING                  (core16_CPL_REORDERING),
    .DEVATT_TX_ROUTING		         (core16_DEVATT_TX_ROUTING),
    .DOWNSTREAM_MSG_FWD              (core16_DOWNSTREAM_MSG_FWD),  
    .MSI_MSG_GEN                     (core16_MSI_MSG_GEN),
    .FLR_REQ_DROP                    (core16_FLR_REQ_DROP),     
    .REORDER_BUFF_SIZE               (core16_REORDER_BUFF_SIZE),
    .CPLTO_THRU_AXI_ST               (core16_CPLTO_THRU_AXI_ST),
    .DM_ADR_ALIGN                    (core16_DM_ADR_ALIGN),
    .MMIO_ADR_ALIGN                  (core16_MMIO_ADR_ALIGN),
    .MSIX_TABLE                      (core16_MSIX_TABLE),
    .MSIX_TABLE_SIZE                 (core16_MSIX_TABLE_SIZE),
    .MSIX_BIR                        (core16_MSIX_BIR),
    .MSIX_BAR_OFFSET                 (core16_MSIX_BAR_OFFSET),
    .MSIX_VECTOR_ALLOC               (core16_MSIX_VECTOR_ALLOC),
    .autonomous_pm_enter_l23         (core16_autonomous_pm_enter_l23),
    .debug_toolkit_mode              (debug_toolkit_hwtcl),
    .device_att                      (core16_device_att),
    .perfmon_clk_freq                (core16_perfmon_clk_freq),
    .SS_PWIDTH                       (SS_PWIDTH),
    .pf0_bar01_size_mask             (core16_pf0_bar01_size_mask),
    .pf0_bar23_size_mask             (core16_pf0_bar23_size_mask),
    .pf0_bar45_size_mask             (core16_pf0_bar45_size_mask),
    .pf0_sriov_vf_bar01_size_mask    (core16_pf0_sriov_vf_bar01_size_mask),
    .pf0_sriov_vf_bar23_size_mask    (core16_pf0_sriov_vf_bar23_size_mask),
    .pf0_sriov_vf_bar45_size_mask    (core16_pf0_sriov_vf_bar45_size_mask),
    .pf1_bar01_size_mask             (core16_pf1_bar01_size_mask),
    .pf1_bar23_size_mask             (core16_pf1_bar23_size_mask),
    .pf1_bar45_size_mask             (core16_pf1_bar45_size_mask),
    .pf1_sriov_vf_bar01_size_mask    (core16_pf1_sriov_vf_bar01_size_mask),
    .pf1_sriov_vf_bar23_size_mask    (core16_pf1_sriov_vf_bar23_size_mask),
    .pf1_sriov_vf_bar45_size_mask    (core16_pf1_sriov_vf_bar45_size_mask),
    .pf2_bar01_size_mask             (core16_pf2_bar01_size_mask),
    .pf2_bar23_size_mask             (core16_pf2_bar23_size_mask),
    .pf2_bar45_size_mask             (core16_pf2_bar45_size_mask),
    .pf2_sriov_vf_bar01_size_mask    (core16_pf2_sriov_vf_bar01_size_mask),
    .pf2_sriov_vf_bar23_size_mask    (core16_pf2_sriov_vf_bar23_size_mask),
    .pf2_sriov_vf_bar45_size_mask    (core16_pf2_sriov_vf_bar45_size_mask),
    .pf3_bar01_size_mask             (core16_pf3_bar01_size_mask),
    .pf3_bar23_size_mask             (core16_pf3_bar23_size_mask),
    .pf3_bar45_size_mask             (core16_pf3_bar45_size_mask),
    .pf3_sriov_vf_bar01_size_mask    (core16_pf3_sriov_vf_bar01_size_mask),
    .pf3_sriov_vf_bar23_size_mask    (core16_pf3_sriov_vf_bar23_size_mask),
    .pf3_sriov_vf_bar45_size_mask    (core16_pf3_sriov_vf_bar45_size_mask),
    .pf4_bar01_size_mask             (core16_pf4_bar01_size_mask),
    .pf4_bar23_size_mask             (core16_pf4_bar23_size_mask),
    .pf4_bar45_size_mask             (core16_pf4_bar45_size_mask),
    .pf4_sriov_vf_bar01_size_mask    (core16_pf4_sriov_vf_bar01_size_mask),
    .pf4_sriov_vf_bar23_size_mask    (core16_pf4_sriov_vf_bar23_size_mask),
    .pf4_sriov_vf_bar45_size_mask    (core16_pf4_sriov_vf_bar45_size_mask),
    .pf5_bar01_size_mask             (core16_pf5_bar01_size_mask),
    .pf5_bar23_size_mask             (core16_pf5_bar23_size_mask),
    .pf5_bar45_size_mask             (core16_pf5_bar45_size_mask),
    .pf5_sriov_vf_bar01_size_mask    (core16_pf5_sriov_vf_bar01_size_mask),
    .pf5_sriov_vf_bar23_size_mask    (core16_pf5_sriov_vf_bar23_size_mask),
    .pf5_sriov_vf_bar45_size_mask    (core16_pf5_sriov_vf_bar45_size_mask),
    .pf6_bar01_size_mask             (core16_pf6_bar01_size_mask),
    .pf6_bar23_size_mask             (core16_pf6_bar23_size_mask),
    .pf6_bar45_size_mask             (core16_pf6_bar45_size_mask),
    .pf6_sriov_vf_bar01_size_mask    (core16_pf6_sriov_vf_bar01_size_mask),
    .pf6_sriov_vf_bar23_size_mask    (core16_pf6_sriov_vf_bar23_size_mask),
    .pf6_sriov_vf_bar45_size_mask    (core16_pf6_sriov_vf_bar45_size_mask),
    .pf7_bar01_size_mask             (core16_pf7_bar01_size_mask),
    .pf7_bar23_size_mask             (core16_pf7_bar23_size_mask),
    .pf7_bar45_size_mask             (core16_pf7_bar45_size_mask),
    .pf7_sriov_vf_bar01_size_mask    (core16_pf7_sriov_vf_bar01_size_mask),
    .pf7_sriov_vf_bar23_size_mask    (core16_pf7_sriov_vf_bar23_size_mask),
    .pf7_sriov_vf_bar45_size_mask    (core16_pf7_sriov_vf_bar45_size_mask),
    .hssi_ctp_func_mode              (hssi_ctp_func_mode),
    .hssi_ctp_topology               (hssi_ctp_topology),
    .payload_width                   (core16_payload_width_integer_hwtcl),
    .hdr_width                       (core16_hdr_width_integer_hwtcl),
    .pfx_width                       (core16_pfx_width_integer_hwtcl),
    .double_width                    (core16_double_width_integer_hwtcl),
    .empty_width                     (core16_empty_width_integer_hwtcl),
    .enable_sriov                    (core16_enable_sriov_hwtcl),
    .total_pf_count                  (core16_total_pf_count_hwtcl),
    .total_vf_count                  (core16_total_vf_count_hwtcl),
    .pf0_vf_count                    (core16_pf0_vf_count_hwtcl),
    .pf1_vf_count                    (core16_pf1_vf_count_hwtcl),
    .pf2_vf_count                    (core16_pf2_vf_count_hwtcl),
    .pf3_vf_count                    (core16_pf3_vf_count_hwtcl),
    .pf4_vf_count                    (core16_pf4_vf_count_hwtcl),
    .pf5_vf_count                    (core16_pf5_vf_count_hwtcl),
    .pf6_vf_count                    (core16_pf6_vf_count_hwtcl),
    .pf7_vf_count                    (core16_pf7_vf_count_hwtcl),
    .pf0_clog2_bar0_size             (core16_pf0_clog2_bar0_size),
    .pf0_clog2_bar1_size             (core16_pf0_clog2_bar1_size),
    .pf0_clog2_bar2_size             (core16_pf0_clog2_bar2_size),
    .pf0_clog2_bar3_size             (core16_pf0_clog2_bar3_size),
    .pf0_clog2_bar4_size             (core16_pf0_clog2_bar4_size),
    .pf0_clog2_bar5_size             (core16_pf0_clog2_bar5_size),
    .pf0_clog2_bar7_size             (core16_pf0_clog2_bar7_size),
    .pf1_clog2_bar0_size             (core16_pf1_clog2_bar0_size),
    .pf1_clog2_bar1_size             (core16_pf1_clog2_bar1_size),
    .pf1_clog2_bar2_size             (core16_pf1_clog2_bar2_size),
    .pf1_clog2_bar3_size             (core16_pf1_clog2_bar3_size),
    .pf1_clog2_bar4_size             (core16_pf1_clog2_bar4_size),
    .pf1_clog2_bar5_size             (core16_pf1_clog2_bar5_size),
    .pf1_clog2_bar7_size             (core16_pf1_clog2_bar7_size),
    .pf2_clog2_bar0_size             (core16_pf2_clog2_bar0_size),
    .pf2_clog2_bar1_size             (core16_pf2_clog2_bar1_size),
    .pf2_clog2_bar2_size             (core16_pf2_clog2_bar2_size),
    .pf2_clog2_bar3_size             (core16_pf2_clog2_bar3_size),
    .pf2_clog2_bar4_size             (core16_pf2_clog2_bar4_size),
    .pf2_clog2_bar5_size             (core16_pf2_clog2_bar5_size),
    .pf2_clog2_bar7_size             (core16_pf2_clog2_bar7_size),
    .pf3_clog2_bar0_size             (core16_pf3_clog2_bar0_size),
    .pf3_clog2_bar1_size             (core16_pf3_clog2_bar1_size),
    .pf3_clog2_bar2_size             (core16_pf3_clog2_bar2_size),
    .pf3_clog2_bar3_size             (core16_pf3_clog2_bar3_size),
    .pf3_clog2_bar4_size             (core16_pf3_clog2_bar4_size),
    .pf3_clog2_bar5_size             (core16_pf3_clog2_bar5_size),
    .pf3_clog2_bar7_size             (core16_pf3_clog2_bar7_size),
    .pf4_clog2_bar0_size             (core16_pf4_clog2_bar0_size),
    .pf4_clog2_bar1_size             (core16_pf4_clog2_bar1_size),
    .pf4_clog2_bar2_size             (core16_pf4_clog2_bar2_size),
    .pf4_clog2_bar3_size             (core16_pf4_clog2_bar3_size),
    .pf4_clog2_bar4_size             (core16_pf4_clog2_bar4_size),
    .pf4_clog2_bar5_size             (core16_pf4_clog2_bar5_size),
    .pf4_clog2_bar7_size             (core16_pf4_clog2_bar7_size),
    .pf5_clog2_bar0_size             (core16_pf5_clog2_bar0_size),
    .pf5_clog2_bar1_size             (core16_pf5_clog2_bar1_size),
    .pf5_clog2_bar2_size             (core16_pf5_clog2_bar2_size),
    .pf5_clog2_bar3_size             (core16_pf5_clog2_bar3_size),
    .pf5_clog2_bar4_size             (core16_pf5_clog2_bar4_size),
    .pf5_clog2_bar5_size             (core16_pf5_clog2_bar5_size),
    .pf5_clog2_bar7_size             (core16_pf5_clog2_bar7_size),
    .pf6_clog2_bar0_size             (core16_pf6_clog2_bar0_size),
    .pf6_clog2_bar1_size             (core16_pf6_clog2_bar1_size),
    .pf6_clog2_bar2_size             (core16_pf6_clog2_bar2_size),
    .pf6_clog2_bar3_size             (core16_pf6_clog2_bar3_size),
    .pf6_clog2_bar4_size             (core16_pf6_clog2_bar4_size),
    .pf6_clog2_bar5_size             (core16_pf6_clog2_bar5_size),
    .pf6_clog2_bar7_size             (core16_pf6_clog2_bar7_size),
    .pf7_clog2_bar0_size             (core16_pf7_clog2_bar0_size),
    .pf7_clog2_bar1_size             (core16_pf7_clog2_bar1_size),
    .pf7_clog2_bar2_size             (core16_pf7_clog2_bar2_size),
    .pf7_clog2_bar3_size             (core16_pf7_clog2_bar3_size),
    .pf7_clog2_bar4_size             (core16_pf7_clog2_bar4_size),
    .pf7_clog2_bar5_size             (core16_pf7_clog2_bar5_size),
    .pf7_clog2_bar7_size             (core16_pf7_clog2_bar7_size), 
    .pf0_sriov_vf_clog2_bar0_size    (core16_pf0_sriov_vf_clog2_bar0_size),
    .pf0_sriov_vf_clog2_bar1_size    (core16_pf0_sriov_vf_clog2_bar1_size),
    .pf0_sriov_vf_clog2_bar2_size    (core16_pf0_sriov_vf_clog2_bar2_size),
    .pf0_sriov_vf_clog2_bar3_size    (core16_pf0_sriov_vf_clog2_bar3_size),
    .pf0_sriov_vf_clog2_bar4_size    (core16_pf0_sriov_vf_clog2_bar4_size),
    .pf0_sriov_vf_clog2_bar5_size    (core16_pf0_sriov_vf_clog2_bar5_size),
    .pf1_sriov_vf_clog2_bar0_size    (core16_pf1_sriov_vf_clog2_bar0_size),
    .pf1_sriov_vf_clog2_bar1_size    (core16_pf1_sriov_vf_clog2_bar1_size),
    .pf1_sriov_vf_clog2_bar2_size    (core16_pf1_sriov_vf_clog2_bar2_size),
    .pf1_sriov_vf_clog2_bar3_size    (core16_pf1_sriov_vf_clog2_bar3_size),
    .pf1_sriov_vf_clog2_bar4_size    (core16_pf1_sriov_vf_clog2_bar4_size),
    .pf1_sriov_vf_clog2_bar5_size    (core16_pf1_sriov_vf_clog2_bar5_size),
    .pf2_sriov_vf_clog2_bar0_size    (core16_pf2_sriov_vf_clog2_bar0_size),
    .pf2_sriov_vf_clog2_bar1_size    (core16_pf2_sriov_vf_clog2_bar1_size),
    .pf2_sriov_vf_clog2_bar2_size    (core16_pf2_sriov_vf_clog2_bar2_size),
    .pf2_sriov_vf_clog2_bar3_size    (core16_pf2_sriov_vf_clog2_bar3_size),
    .pf2_sriov_vf_clog2_bar4_size    (core16_pf2_sriov_vf_clog2_bar4_size),
    .pf2_sriov_vf_clog2_bar5_size    (core16_pf2_sriov_vf_clog2_bar5_size),
    .pf3_sriov_vf_clog2_bar0_size    (core16_pf3_sriov_vf_clog2_bar0_size),
    .pf3_sriov_vf_clog2_bar1_size    (core16_pf3_sriov_vf_clog2_bar1_size),
    .pf3_sriov_vf_clog2_bar2_size    (core16_pf3_sriov_vf_clog2_bar2_size),
    .pf3_sriov_vf_clog2_bar3_size    (core16_pf3_sriov_vf_clog2_bar3_size),
    .pf3_sriov_vf_clog2_bar4_size    (core16_pf3_sriov_vf_clog2_bar4_size),
    .pf3_sriov_vf_clog2_bar5_size    (core16_pf3_sriov_vf_clog2_bar5_size),
    .pf4_sriov_vf_clog2_bar0_size    (core16_pf4_sriov_vf_clog2_bar0_size),
    .pf4_sriov_vf_clog2_bar1_size    (core16_pf4_sriov_vf_clog2_bar1_size),
    .pf4_sriov_vf_clog2_bar2_size    (core16_pf4_sriov_vf_clog2_bar2_size),
    .pf4_sriov_vf_clog2_bar3_size    (core16_pf4_sriov_vf_clog2_bar3_size),
    .pf4_sriov_vf_clog2_bar4_size    (core16_pf4_sriov_vf_clog2_bar4_size),
    .pf4_sriov_vf_clog2_bar5_size    (core16_pf4_sriov_vf_clog2_bar5_size),
    .pf5_sriov_vf_clog2_bar0_size    (core16_pf5_sriov_vf_clog2_bar0_size),
    .pf5_sriov_vf_clog2_bar1_size    (core16_pf5_sriov_vf_clog2_bar1_size),
    .pf5_sriov_vf_clog2_bar2_size    (core16_pf5_sriov_vf_clog2_bar2_size),
    .pf5_sriov_vf_clog2_bar3_size    (core16_pf5_sriov_vf_clog2_bar3_size),
    .pf5_sriov_vf_clog2_bar4_size    (core16_pf5_sriov_vf_clog2_bar4_size),
    .pf5_sriov_vf_clog2_bar5_size    (core16_pf5_sriov_vf_clog2_bar5_size),
    .pf6_sriov_vf_clog2_bar0_size    (core16_pf6_sriov_vf_clog2_bar0_size),
    .pf6_sriov_vf_clog2_bar1_size    (core16_pf6_sriov_vf_clog2_bar1_size),
    .pf6_sriov_vf_clog2_bar2_size    (core16_pf6_sriov_vf_clog2_bar2_size),
    .pf6_sriov_vf_clog2_bar3_size    (core16_pf6_sriov_vf_clog2_bar3_size),
    .pf6_sriov_vf_clog2_bar4_size    (core16_pf6_sriov_vf_clog2_bar4_size),
    .pf6_sriov_vf_clog2_bar5_size    (core16_pf6_sriov_vf_clog2_bar5_size),
    .pf7_sriov_vf_clog2_bar0_size    (core16_pf7_sriov_vf_clog2_bar0_size),
    .pf7_sriov_vf_clog2_bar1_size    (core16_pf7_sriov_vf_clog2_bar1_size),
    .pf7_sriov_vf_clog2_bar2_size    (core16_pf7_sriov_vf_clog2_bar2_size),
    .pf7_sriov_vf_clog2_bar3_size    (core16_pf7_sriov_vf_clog2_bar3_size),
    .pf7_sriov_vf_clog2_bar4_size    (core16_pf7_sriov_vf_clog2_bar4_size),
    .pf7_sriov_vf_clog2_bar5_size    (core16_pf7_sriov_vf_clog2_bar5_size),
    .pf0_bar0_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf0_bar0_type),
    .pf0_bar2_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf0_bar2_type),
    .pf0_bar4_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf0_bar4_type),
    .pf0_sriov_vf_bar0_type          (hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar0_type),
    .pf0_sriov_vf_bar2_type          (hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar2_type),
    .pf0_sriov_vf_bar4_type          (hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar4_type),
    .pf1_bar0_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf1_bar0_type),
    .pf1_bar2_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf1_bar2_type),
    .pf1_bar4_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf1_bar4_type),
    .pf1_sriov_vf_bar0_type          (hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar0_type),
    .pf1_sriov_vf_bar2_type          (hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar2_type),
    .pf1_sriov_vf_bar4_type          (hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar4_type),
    .pf2_bar0_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf2_bar0_type),
    .pf2_bar2_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf2_bar2_type),
    .pf2_bar4_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf2_bar4_type),
    .pf2_sriov_vf_bar0_type          (hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar0_type),
    .pf2_sriov_vf_bar2_type          (hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar2_type),
    .pf2_sriov_vf_bar4_type          (hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar4_type),
    .pf3_bar0_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf3_bar0_type),
    .pf3_bar2_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf3_bar2_type),
    .pf3_bar4_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf3_bar4_type),
    .pf3_sriov_vf_bar0_type          (hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar0_type),
    .pf3_sriov_vf_bar2_type          (hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar2_type),
    .pf3_sriov_vf_bar4_type          (hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar4_type),
    .pf4_bar0_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf4_bar0_type),
    .pf4_bar2_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf4_bar2_type),
    .pf4_bar4_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf4_bar4_type),
    .pf4_sriov_vf_bar0_type          (hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar0_type),
    .pf4_sriov_vf_bar2_type          (hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar2_type),
    .pf4_sriov_vf_bar4_type          (hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar4_type),
    .pf5_bar0_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf5_bar0_type),
    .pf5_bar2_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf5_bar2_type),
    .pf5_bar4_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf5_bar4_type),
    .pf5_sriov_vf_bar0_type          (hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar0_type),
    .pf5_sriov_vf_bar2_type          (hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar2_type),
    .pf5_sriov_vf_bar4_type          (hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar4_type),
    .pf6_bar0_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf6_bar0_type),
    .pf6_bar2_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf6_bar2_type),
    .pf6_bar4_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf6_bar4_type),
    .pf6_sriov_vf_bar0_type          (hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar0_type),
    .pf6_sriov_vf_bar2_type          (hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar2_type),
    .pf6_sriov_vf_bar4_type          (hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar4_type),
    .pf7_bar0_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf7_bar0_type),
    .pf7_bar2_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf7_bar2_type),
    .pf7_bar4_type                   (hssi_ctp_u_wrpcie_top_u_core16_pf7_bar4_type),
    .pf7_sriov_vf_bar0_type          (hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar0_type),
    .pf7_sriov_vf_bar2_type          (hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar2_type),
    .pf7_sriov_vf_bar4_type          (hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar4_type),
    .maxpayload_size                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_maxpayload_size),
    .link_width                      (hssi_ctp_u_wrpcie_top_u_core16_virtual_link_width),
    .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
    .PF0_VIRTIO_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_virtio_en),
    .PF1_VIRTIO_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_virtio_en),
    .PF2_VIRTIO_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_virtio_en),
    .PF3_VIRTIO_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_virtio_en),
    .PF4_VIRTIO_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_virtio_en),
    .PF5_VIRTIO_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_virtio_en),
    .PF6_VIRTIO_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_virtio_en),
    .PF7_VIRTIO_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_virtio_en),
    .PF0_VF_VIRTIO_CAP_EN            (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_virtio_en),
    .PF1_VF_VIRTIO_CAP_EN            (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_virtio_en),
    .PF2_VF_VIRTIO_CAP_EN            (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_virtio_en),
    .PF3_VF_VIRTIO_CAP_EN            (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_virtio_en),
    .PF4_VF_VIRTIO_CAP_EN            (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_virtio_en),
    .PF5_VF_VIRTIO_CAP_EN            (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_virtio_en),
    .PF6_VF_VIRTIO_CAP_EN            (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_virtio_en),
    .PF7_VF_VIRTIO_CAP_EN            (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_virtio_en),
    .PF0_PCI_MSIX_EN                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_msix_enable),
    .PF1_PCI_MSIX_EN                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_msix_enable),
    .PF2_PCI_MSIX_EN                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_msix_enable),
    .PF3_PCI_MSIX_EN                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_msix_enable),
    .PF4_PCI_MSIX_EN                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_msix_enable),
    .PF5_PCI_MSIX_EN                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_msix_enable),
    .PF6_PCI_MSIX_EN                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_msix_enable),
    .PF7_PCI_MSIX_EN                 (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_msix_enable),
    .PF0_PCI_MSIX_TABLE_SIZE         (hssi_ctp_u_wrpcie_top_u_core16_pf0_pci_msix_table_size),
    .PF1_PCI_MSIX_TABLE_SIZE         (hssi_ctp_u_wrpcie_top_u_core16_pf1_pci_msix_table_size),
    .PF2_PCI_MSIX_TABLE_SIZE         (hssi_ctp_u_wrpcie_top_u_core16_pf2_pci_msix_table_size),
    .PF3_PCI_MSIX_TABLE_SIZE         (hssi_ctp_u_wrpcie_top_u_core16_pf3_pci_msix_table_size),
    .PF4_PCI_MSIX_TABLE_SIZE         (hssi_ctp_u_wrpcie_top_u_core16_pf4_pci_msix_table_size),
    .PF5_PCI_MSIX_TABLE_SIZE         (hssi_ctp_u_wrpcie_top_u_core16_pf5_pci_msix_table_size),
    .PF6_PCI_MSIX_TABLE_SIZE         (hssi_ctp_u_wrpcie_top_u_core16_pf6_pci_msix_table_size),
    .PF7_PCI_MSIX_TABLE_SIZE         (hssi_ctp_u_wrpcie_top_u_core16_pf7_pci_msix_table_size),
    .PF0_VF_PCI_MSIX_EN              (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_msix_cap_enable),
    .PF1_VF_PCI_MSIX_EN              (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_msix_cap_enable),
    .PF2_VF_PCI_MSIX_EN              (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_msix_cap_enable),
    .PF3_VF_PCI_MSIX_EN              (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_msix_cap_enable),
    .PF4_VF_PCI_MSIX_EN              (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_msix_cap_enable),
    .PF5_VF_PCI_MSIX_EN              (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_msix_cap_enable),
    .PF6_VF_PCI_MSIX_EN              (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_msix_cap_enable),
    .PF7_VF_PCI_MSIX_EN              (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_msix_cap_enable),
    .PF0_VF_PCI_MSIX_TABLE_SIZE      (hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf0),
    .PF1_VF_PCI_MSIX_TABLE_SIZE      (hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf1),
    .PF2_VF_PCI_MSIX_TABLE_SIZE      (hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf2),
    .PF3_VF_PCI_MSIX_TABLE_SIZE      (hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf3),
    .PF4_VF_PCI_MSIX_TABLE_SIZE      (hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf4),
    .PF5_VF_PCI_MSIX_TABLE_SIZE      (hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf5),
    .PF6_VF_PCI_MSIX_TABLE_SIZE      (hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf6),
    .PF7_VF_PCI_MSIX_TABLE_SIZE      (hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf7),
    .PF0_SLOT_IMP                    (hssi_ctp_u_wrpcie_top_u_core16_pf0_pcie_slot_imp),
    .PF0_VF_ATS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_ats_cap_enable),
    .PF1_VF_ATS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_ats_cap_enable),
    .PF2_VF_ATS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_ats_cap_enable),
    .PF3_VF_ATS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_ats_cap_enable),
    .PF4_VF_ATS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_ats_cap_enable),
    .PF5_VF_ATS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_ats_cap_enable),
    .PF6_VF_ATS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_ats_cap_enable),
    .PF7_VF_ATS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_ats_cap_enable),
    .PF0_VF_TPH_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_tph_cap_enable),
    .PF1_VF_TPH_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_tph_cap_enable),
    .PF2_VF_TPH_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_tph_cap_enable),
    .PF3_VF_TPH_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_tph_cap_enable),
    .PF4_VF_TPH_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_tph_cap_enable),
    .PF5_VF_TPH_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_tph_cap_enable),
    .PF6_VF_TPH_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_tph_cap_enable),
    .PF7_VF_TPH_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_tph_cap_enable),
    .PF0_VF_ACS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_acs_cap_enable),
    .PF1_VF_ACS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_acs_cap_enable),
    .PF2_VF_ACS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_acs_cap_enable),
    .PF3_VF_ACS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_acs_cap_enable),
    .PF4_VF_ACS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_acs_cap_enable),
    .PF5_VF_ACS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_acs_cap_enable),
    .PF6_VF_ACS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_acs_cap_enable),
    .PF7_VF_ACS_CAP_EN               (hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_acs_cap_enable),  
    .PORT_ID                         (0),
    .virtio_pci_cfg_acc_intf_en_hwtcl(core16_virtio_pci_cfg_acc_intf_en_hwtcl),
    .ENABLE_VIRTIO                   (core16_enable_virtio_hwtcl),
    .ENABLE_CEB                      (core16_ceb_en_hwtcl),
    .PF_STD_NEXT_ADDR_PTR            (core16_ceb_pf_std_cap_last_ptr),
    .PF_EXT_NEXT_ADDR_PTR            (core16_ceb_pf_ext_cap_last_ptr),
    .VF_STD_NEXT_ADDR_PTR            (core16_ceb_vf_std_cap_last_ptr),
    .VF_EXT_NEXT_ADDR_PTR            (core16_ceb_vf_ext_cap_last_ptr),
    .CEB_TIMEOUT                     (core16_ceb_ack_latency_hwtcl),
    .ENABLE_CII                      (core16_cii_en_hwtcl),
    .CII_TIMEOUT                     (core16_cii_ack_latency_hwtcl),
    .ENABLE_DFL                      (core16_dfl_en_hwtcl),
    .dfl_next_cap_offset             (core16_dfl_next_cap_offset),
    .dfl_total                       (core16_dfl_total),
    .dfh_fid_hwtcl                   (core16_dfh_fid_hwtcl),
    .dfh_major_ver_hwtcl             (core16_dfh_major_ver_hwtcl),
    .dfh_next_byte_offset_hwtcl      (core16_dfh_next_byte_offset_hwtcl),
    .dfh_end_hwtcl                   (core16_dfh_end_hwtcl),
    .dfh_minor_rev_hwtcl             (core16_dfh_minor_rev_hwtcl),
    .dfh_ver_hwtcl                   (core16_dfh_ver_hwtcl),
    .dfh_feature_type_hwtcl          (core16_dfh_feature_type_hwtcl),
    .inst_id_hwtcl                   (core16_inst_id_hwtcl),    
    .MIF_DIRECTORY					         (MIF_DIRECTORY),
    .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
    .PERFMON_EN                      (PERFMON_EN),
    .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN)
    ) u_pciess_p0 (
    .tileif                          (p0_tileif.ss),
    .sm_tileif                       (sm_p0_tileif.sm_ss),
    //.sm_qhip_tileif		     (sm_p0_tileif.sm_qhip),//tie off in sm_qhip_tie_off
    .axi_st_clk                      (p0_axi_st_clk),
    .axi_lite_clk                    (p0_axi_lite_clk),
    .axi_st_areset_n                 (p0_axi_st_areset_n),
    .axi_lite_areset_n               (p0_axi_lite_areset_n),
    .subsystem_cold_rst_n            (p0_subsystem_cold_rst_n),
    .subsystem_warm_rst_n            (p0_subsystem_warm_rst_n),
    .subsystem_cold_rst_ack_n        (p0_subsystem_cold_rst_ack_n),
    .subsystem_warm_rst_ack_n        (p0_subsystem_warm_rst_ack_n),
    .subsystem_rst_req               (p0_subsystem_rst_req),
    .subsystem_rst_rdy               (p0_subsystem_rst_rdy),
    .initiate_warmrst_req            (p0_initiate_warmrst_req),
    .initiate_rst_req_rdy            (p0_initiate_rst_req_rdy),
    .axi_mm_clk                      (p0_axi_mm_clk),
    .axi_mm_areset_n                 (p0_axi_mm_areset_n),
	
    .ss_app_st_rx_tvalid             (p0_ss_app_st_rx_tvalid),
    .app_ss_st_rx_tready             (p0_app_ss_st_rx_tready),
    .ss_app_st_rx_tdata              (p0_ss_app_st_rx_tdata),
    .ss_app_st_rx_tkeep              (p0_ss_app_st_rx_tkeep),
    .ss_app_st_rx_tlast              (p0_ss_app_st_rx_tlast),
    .ss_app_st_rx_tuser_vendor       (p0_ss_app_st_rx_tuser_vendor),
    .ss_app_st_rx_tuser_last_segment (p0_ss_app_st_rx_tuser_last_segment),	
	.ss_app_st_rxreq_tvalid             (p0_ss_app_st_rxreq_tvalid),
    .app_ss_st_rxreq_tready             (p0_app_ss_st_rxreq_tready),
    .ss_app_st_rxreq_tdata              (p0_ss_app_st_rxreq_tdata),
    .ss_app_st_rxreq_tkeep              (p0_ss_app_st_rxreq_tkeep),
    .ss_app_st_rxreq_tlast              (p0_ss_app_st_rxreq_tlast),
    .ss_app_st_rxreq_tuser_vendor       (p0_ss_app_st_rxreq_tuser_vendor),
    .ss_app_st_rxreq_tuser_last_segment (p0_ss_app_st_rxreq_tuser_last_segment),	
    .app_ss_st_tx_tvalid             (p0_app_ss_st_tx_tvalid),
    .ss_app_st_tx_tready             (p0_ss_app_st_tx_tready),
    .app_ss_st_tx_tdata              (p0_app_ss_st_tx_tdata),
    .app_ss_st_tx_tkeep              (p0_app_ss_st_tx_tkeep),
    .app_ss_st_tx_tlast              (p0_app_ss_st_tx_tlast),
    .app_ss_st_tx_tuser_vendor       (p0_app_ss_st_tx_tuser_vendor),
    .app_ss_st_tx_tuser_last_segment ({7'b0,p0_app_ss_st_tx_tuser_last_segment}),
    .app_ss_st_txreq_tvalid          (p0_app_ss_st_txreq_tvalid),
    .ss_app_st_txreq_tready          (p0_ss_app_st_txreq_tready),
    .app_ss_st_txreq_tdata           (p0_app_ss_st_txreq_tdata),
    .app_ss_st_txreq_tlast           (p0_app_ss_st_txreq_tlast),
    .ss_app_st_ciireq_tvalid	       (p0_ss_app_st_ciireq_tvalid),
    .app_ss_st_ciireq_tready	       (p0_app_ss_st_ciireq_tready),
    .ss_app_st_ciireq_tdata	         (p0_ss_app_st_ciireq_tdata),
    .app_ss_st_ciiresp_tvalid	       (p0_app_ss_st_ciiresp_tvalid),
    .app_ss_st_ciiresp_tdata	       (p0_app_ss_st_ciiresp_tdata),
    .ss_app_st_cebreq_tvalid         (p0_ss_app_st_cebreq_tvalid),
    .app_ss_st_cebreq_tready         (p0_app_ss_st_cebreq_tready),
    .ss_app_st_cebreq_tdata          (p0_ss_app_st_cebreq_tdata),
    .app_ss_st_cebresp_tvalid        (p0_app_ss_st_cebresp_tvalid),
    .app_ss_st_cebresp_tdata         (p0_app_ss_st_cebresp_tdata),
    .ss_app_st_flrrcvd_tvalid        (p0_ss_app_st_flrrcvd_tvalid),
    .ss_app_st_flrrcvd_tdata         (p0_ss_app_st_flrrcvd_tdata),
    .app_ss_st_flrcmpl_tvalid        (p0_app_ss_st_flrcmpl_tvalid),
    .app_ss_st_flrcmpl_tdata         (p0_app_ss_st_flrcmpl_tdata),
    .ss_app_st_ctrlshadow_tvalid     (p0_ss_app_st_ctrlshadow_tvalid),
    .ss_app_st_ctrlshadow_tdata      (p0_ss_app_st_ctrlshadow_tdata),
    .ss_app_st_txcrdt_tvalid         (p0_ss_app_st_txcrdt_tvalid),
    .ss_app_st_txcrdt_tdata          (p0_ss_app_st_txcrdt_tdata),
    .ss_app_st_cplto_tvalid          (p0_ss_app_st_cplto_tvalid),
    .ss_app_st_cplto_tdata           (p0_ss_app_st_cplto_tdata),
    .app_ss_lite_csr_awvalid         (p0_lite_csr_awvalid),
    .ss_app_lite_csr_awready         (p0_lite_csr_awready),
    .app_ss_lite_csr_awaddr          (p0_lite_csr_awaddr),
    .app_ss_lite_csr_wvalid          (p0_lite_csr_wvalid),
    .ss_app_lite_csr_wready          (p0_lite_csr_wready),
    .app_ss_lite_csr_wdata           (p0_lite_csr_wdata),
    .app_ss_lite_csr_wstrb           (p0_lite_csr_wstrb),
    .ss_app_lite_csr_bvalid          (p0_lite_csr_bvalid),
    .app_ss_lite_csr_bready          (p0_lite_csr_bready),
    .ss_app_lite_csr_bresp           (p0_lite_csr_bresp),
    .app_ss_lite_csr_arvalid         (p0_lite_csr_arvalid),
    .ss_app_lite_csr_arready         (p0_lite_csr_arready),
    .app_ss_lite_csr_araddr          (p0_lite_csr_araddr),
    .ss_app_lite_csr_rvalid          (p0_lite_csr_rvalid),
    .app_ss_lite_csr_rready          (p0_lite_csr_rready),
    .ss_app_lite_csr_rdata           (p0_lite_csr_rdata),
    .ss_app_lite_csr_rresp           (p0_lite_csr_rresp),
    .ss_app_lite_initatr_awvalid     (p0_ss_app_lite_initatr_awvalid),
    .app_ss_lite_initatr_awready     (p0_app_ss_lite_initatr_awready),
    .ss_app_lite_initatr_awaddr      (p0_ss_app_lite_initatr_awaddr),
    .ss_app_lite_initatr_wvalid      (p0_ss_app_lite_initatr_wvalid),
    .app_ss_lite_initatr_wready      (p0_app_ss_lite_initatr_wready),
    .ss_app_lite_initatr_wdata       (p0_ss_app_lite_initatr_wdata),
    .ss_app_lite_initatr_wstrb       (p0_ss_app_lite_initatr_wstrb),
    .app_ss_lite_initatr_bvalid      (p0_app_ss_lite_initatr_bvalid),
    .ss_app_lite_initatr_bready      (p0_ss_app_lite_initatr_bready),
    .app_ss_lite_initatr_bresp       (p0_app_ss_lite_initatr_bresp),
    .ss_app_lite_initatr_arvalid     (p0_ss_app_lite_initatr_arvalid),
    .app_ss_lite_initatr_arready     (p0_app_ss_lite_initatr_arready),
    .ss_app_lite_initatr_araddr      (p0_ss_app_lite_initatr_araddr),
    .app_ss_lite_initatr_rvalid      (p0_app_ss_lite_initatr_rvalid),
    .ss_app_lite_initatr_rready      (p0_ss_app_lite_initatr_rready),
    .app_ss_lite_initatr_rdata       (p0_app_ss_lite_initatr_rdata),
    .app_ss_lite_initatr_rresp       (p0_app_ss_lite_initatr_rresp),
    .ss_app_mm_initatr_awvalid       (p0_ss_app_mm_initatr_awvalid),
    .app_ss_mm_initatr_awready       (p0_app_ss_mm_initatr_awready),
    .ss_app_mm_initatr_awaddr        (p0_ss_app_mm_initatr_awaddr),
    .ss_app_mm_initatr_awlen         (p0_ss_app_mm_initatr_awlen),
    .ss_app_mm_initatr_awsize        (p0_ss_app_mm_initatr_awsize),
    .ss_app_mm_initatr_awprot        (p0_ss_app_mm_initatr_awprot),
    .ss_app_mm_initatr_wvalid        (p0_ss_app_mm_initatr_wvalid),
    .ss_app_mm_initatr_wlast         (p0_ss_app_mm_initatr_wlast),
    .app_ss_mm_initatr_wready        (p0_app_ss_mm_initatr_wready),
    .ss_app_mm_initatr_wdata         (p0_ss_app_mm_initatr_wdata),
    .ss_app_mm_initatr_wstrb         (p0_ss_app_mm_initatr_wstrb),
    .app_ss_mm_initatr_bvalid        (p0_app_ss_mm_initatr_bvalid),
    .ss_app_mm_initatr_bready        (p0_ss_app_mm_initatr_bready),
    .app_ss_mm_initatr_bresp         (p0_app_ss_mm_initatr_bresp),
    .ss_app_mm_initatr_arvalid       (p0_ss_app_mm_initatr_arvalid),
    .app_ss_mm_initatr_arready       (p0_app_ss_mm_initatr_arready),
    .ss_app_mm_initatr_araddr        (p0_ss_app_mm_initatr_araddr),
    .ss_app_mm_initatr_arlen         (p0_ss_app_mm_initatr_arlen),
    .ss_app_mm_initatr_arsize        (p0_ss_app_mm_initatr_arsize),
    .ss_app_mm_initatr_arprot        (p0_ss_app_mm_initatr_arprot),
    .app_ss_mm_initatr_rvalid        (p0_app_ss_mm_initatr_rvalid),
    .app_ss_mm_initatr_rlast         (p0_app_ss_mm_initatr_rlast),
    .ss_app_mm_initatr_rready        (p0_ss_app_mm_initatr_rready),
    .app_ss_mm_initatr_rdata         (p0_app_ss_mm_initatr_rdata),
    .app_ss_mm_initatr_rresp         (p0_app_ss_mm_initatr_rresp),
    .ss_app_virtio_pcicfgreq_tvalid  (p0_ss_app_virtio_pcicfgreq_tvalid),
    .ss_app_virtio_pcicfgreq_tdata   (p0_ss_app_virtio_pcicfgreq_tdata),
    .app_ss_virtio_pcicfgcmpl_tdata  (p0_app_ss_virtio_pcicfgcmpl_tdata),
    .app_ss_virtio_pcicfgcmpl_tvalid (p0_app_ss_virtio_pcicfgcmpl_tvalid),
    .ss_app_bus_number_o             (p0_ss_app_bus_number),
    .*
    );


    if ( (hssi_ctp_topology=="pcie_x16" || hssi_ctp_topology=="pcie_x4") && TILE=="SM") begin : gen_sync

      //sync serr & dlup outputs to axi_st_clk
      altera_std_synchronizer u_p0_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_coreclk_n                )
      );
      
      altera_std_synchronizer u_p0_warm_rst_stclk_n_sync
      (
        .clk      ( p0_axi_st_clk                        ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_stclk_n                  )
      );
      
      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tileif.serr_out                  ),
        .data_out  ( p0_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tileif.link_up                     ),
        .data_out  ( p0_ss_app_linkup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tileif.dl_up                     ),
        .data_out  ( p0_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tileif.surprise_down_err         ),
        .data_out  ( p0_ss_app_surprise_down_err_sync    )
      );
     
      pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p0_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tileif.ltssm_state                     ),
        .data_out  ( p0_ss_app_ltssmstate_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( sm_p0_tileif.rx_par_err             ),
        .data_out  ( p0_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( sm_p0_tileif.tx_par_err             ),
        .data_out  ( p0_ss_app_tx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_int_status_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tileif.int_status                ),
        .data_out  ( p0_ss_app_int_status_sync           )
      );

      assign p0_ss_app_serr = p0_ss_app_serr_sync;

      assign p0_ss_app_linkup = p0_ss_app_linkup_sync;

      assign p0_ss_app_dlup = p0_ss_app_dlup_sync;

      assign p0_ss_app_surprise_down_err = p0_ss_app_surprise_down_err_sync;
      
      assign p0_ss_app_ltssmstate = p0_ss_app_ltssmstate_sync;

      assign p0_ss_app_rx_par_err = p0_ss_app_rx_par_err_sync;

      assign p0_ss_app_tx_par_err = p0_ss_app_tx_par_err_sync;

      assign p0_ss_app_int_status = p0_ss_app_int_status_sync;
    end
  endgenerate

  //PTILE
  generate
  if (qhip_mode_hwtcl == 1) begin : gen_tileif
    if (device_type=="EP") begin : gen_tileif_qhip
      assign p0_tileif.int_status                                = 0;
    end
    else begin : gen_tileif_qhip
      assign p0_tileif.int_status                                = p0_int_status_o;
    end
  end
  endgenerate

  generate
  if (qhip_mode_hwtcl == 1 && TILE=="SM") begin : gen_sm_qhip 
  
    assign  p0_st_tx_tvalid_i                                   = sm_p0_tileif.st_tx_tvalid;
    assign  p0_st_tx_tlast_i                                    = sm_p0_tileif.st_tx_tlast;
    assign  p0_st_tx_tdata_i                                    = sm_p0_tileif.st_tx_tdata;
    assign  p0_st_tx_tkeep_i                                    = sm_p0_tileif.st_tx_tkeep;
    assign  p0_st_tx_tuser_last_segment                         = sm_p0_tileif.st_tx_tuser_last_segment; 

    assign  sm_p0_tileif.st_tx_tready                           = p0_st_tx_tready_o;
/*
    assign  p0_st_tx_tvalid_i                                   = p0_app_ss_st_tx_tvalid;
    assign  p0_st_tx_tlast_i                                    = p0_app_ss_st_tx_tlast;
    assign  p0_st_tx_tdata_i                                    = p0_app_ss_st_tx_tdata;
    assign  p0_st_tx_tkeep_i                                    = p0_app_ss_st_tx_tkeep;
    assign  p0_st_tx_tuser_last_segment                         = p0_app_ss_st_tx_tuser_last_segment; 

    assign  p0_st_tx_tready_o                                   = p0_ss_app_st_tx_tready;
*/

    assign  p0_st_rx_tready_i                                      = sm_p0_tileif.st_rx_tready;

    assign  sm_p0_tileif.st_rx_tvalid                              = p0_st_rx_tvalid_o;
    assign  sm_p0_tileif.st_rx_tlast                               = p0_st_rx_tlast_o;
    assign  sm_p0_tileif.st_rx_tdata                               = p0_st_rx_tdata_o;
    assign  sm_p0_tileif.st_rx_tkeep                               = p0_st_rx_tkeep_o;
    //tuser_last_segment
    assign  sm_p0_tileif.st_rx_tuser_last_segment                  = p0_st_rx_tuser_last_segment;

    assign  sm_p0_tileif.pcie_pld_rx_fbk_tready                    = pcie_pld_rx_fbk_tready;

    assign sm_p0_tileif.st_txcrdt_tvalid                           = p0_st_txcrdt_tvalid_o;
    assign sm_p0_tileif.st_txcrdt_tvdata                           = p0_st_txcrdt_tvdata_o;
    assign p0_st_txcrdt_tldrdy_i				   = sm_p0_tileif.st_txcrdt_tldrdy;

    assign p0_app_int_i                                          = sm_p0_tileif.app_int;
    assign p0_msi_pnd_func_i                                     = sm_p0_tileif.msi_pnd_func;
    assign p0_msi_pnd_byte_i                                     = sm_p0_tileif.msi_pnd_byte;
    assign p0_msi_pnd_addr_i                                     = sm_p0_tileif.msi_pnd_addr;
    assign p0_msi_pnd_vf_num_i                                   = sm_p0_tileif.msi_pnd_vf_num;
    assign p0_msi_pnd_vfa_i                                      = sm_p0_tileif.msi_pnd_vfa;

    assign sm_p0_tileif.msi_pnd_ready                            = p0_msi_pnd_ready_o;
    assign sm_p0_tileif.app_int_ready                            = p0_app_int_ready_o;
    assign sm_p0_tileif.hotplug_ready                            = p0_sys_hotplug_ready_o;
    assign sm_p0_tileif.pm_ready                                 = p0_apps_pm_ready_o;
    assign sm_p0_tileif.prs_event_ready                          = p0_qhip_prs_event_ready_o;
 
    //shunxiong fix-lint_23ww2501
    //assign p0_msi_pnd_vf_num_i                                   = sm_p0_tileif.msi_pnd_vf_num;
    //assign p0_msi_pnd_vfa_i                                      = sm_p0_tileif.msi_pnd_vfa;
    assign p0_tileif.surprise_down_err                           = p0_surprise_down_err_o;
    assign p0_apps_pm_xmt_pme_i                                  = p0_tileif.apps_pm_xmt_pme;
    assign p0_tileif.dl_up                                       = p0_dl_up_o;
    assign p0_app_xfer_pending_i                                 = p0_tileif.app_xfer_pending;
    assign p0_app_init_rst_i                                     = (device_type=="EP")? 1'b0 : p0_tileif.app_init_rst;
    assign p0_apps_pm_xmt_turnoff_i                              = (device_type=="EP")? 1'b0 : p0_tileif.apps_pm_xmt_turnoff;
    assign p0_apps_ready_entr_l23_i                              = p0_tileif.app_ready_entr_l23;
    assign p0_tileif.pm_state                                    = p0_pm_state_o;
    assign {p0_tileif.pm_dstate1,p0_tileif.pm_dstate0}           = p0_pm_dstate_o;
    assign p0_tileif.ltssm_state                                 = p0_ltssm_state_o;
    assign p0_pld_gp_status_i                                    = p0_tileif.pld_gp_status;
    //assign p0_tileif.pld_gp_ctrl                                 = p0_pld_gp_ctrl_o;
    assign sm_p0_tileif.pld_gp_ctrl                                 = p0_pld_gp_ctrl_o;
    assign p0_tileif.link_up                                     = p0_link_up_o;

    assign p0_app_err_func_num_i                                 = p0_tileif.app_err_func_num;
    assign p0_app_err_valid_i                                    = p0_tileif.app_err_valid;
    assign p0_app_err_hdr_i                                      = p0_tileif.app_err_hdr;
    assign p0_tileif.serr_out                                    = p0_serr_out_o;
    assign p0_app_err_info_i                                     = p0_tileif.app_err_info;
    assign sm_p0_tileif.app_err_ready                            = p0_app_err_ready_o;  //KLAI4 EDIT 
    assign p0_tileif.hip_enter_err_mode                          = p0_hip_enter_err_mode_o;

    assign p0_sys_pwr_fault_det_i                                = p0_tileif.sys_pwr_fault_det;
    assign p0_sys_pre_det_chged_i                                = p0_tileif.sys_pre_det_chged;
    assign p0_sys_mrl_sensor_chged_i                             = p0_tileif.sys_mrl_sensor_chged;
    assign p0_sys_aux_pwr_det_i                                  = p0_tileif.sys_aux_pwr_det;
    assign p0_sys_cmd_cpled_int_i                                = p0_tileif.sys_cmd_cpled_int;
    assign p0_sys_mrl_sensor_state_i                             = p0_tileif.sys_mrl_sensor_state;
    assign p0_sys_pre_det_state_i                                = p0_tileif.sys_pre_det_state;
    assign p0_sys_atten_button_pressed_i                         = p0_tileif.sys_atten_button_pressed;
    assign p0_sys_eml_interlock_engaged_i                        = p0_tileif.sys_eml_interlock_engaged;

    assign sm_p0_tileif.flrrcvd_tvalid                              = p0_flrrcvd_tvalid_o;
    assign sm_p0_tileif.flrrcvd_tvdata                              = p0_flrrcvd_tvdata_o;

    assign p0_flrcmpl_tvalid_i                                   = sm_p0_tileif.flrcmpl_tvalid;
    assign p0_flrcmpl_tvdata_i                                   = sm_p0_tileif.flrcmpl_tvdata;

    assign p0_rst_rdy_i                                 = p0_tileif.pld_warm_rst_rdy;
    assign p0_tileif.pld_link_req_rst                            = p0_rst_req_o;    

    if (core16_enable_virtio_hwtcl) begin
      assign sm_p0_tileif.virtio_pcicfgreq_tvalid                   = p0_virtio_pcicfgreq_tvalid_o;
      assign sm_p0_tileif.virtio_pcicfgreq_tdata                    = p0_virtio_pcicfgreq_tdata_o;
/*tmp tie off
      assign p0_virtio_pcicfgcmpl_tvalid_i                       = sm_p0_tileif.virtio_pcicfgcmpl_tvalid;
      assign p0_virtio_pcicfgcmpl_tdata_i                        = sm_p0_tileif.virtio_pcicfgcmpl_tdata; 
*/
    end
    else begin
      assign sm_p0_tileif.virtio_pcicfgreq_tvalid                   = '0;
      assign sm_p0_tileif.virtio_pcicfgreq_tdata                    = '0;
    end

    assign p0_virtio_pcicfgcmpl_tvalid_i                       = 0; //KAHUAT_EDIT
    assign p0_virtio_pcicfgcmpl_tdata_i                        = '0; //KAHUAT_EDIT
 
    assign sm_p0_tileif.st_cplto_tvalid                             = p0_st_cplto_tvalid_o;
    assign sm_p0_tileif.st_cplto_tdata                              = p0_st_cplto_tdata_o[29:0];

    assign p0_tileif.tl_cfg_add                                  = p0_tl_cfg_add_o;
    assign p0_tileif.tl_cfg_func                                 = p0_tl_cfg_func_o;
    assign p0_tileif.tl_cfg_ctl                                  = p0_tl_cfg_ctl_o;

    assign p0_tileif.cii_hdr_poisoned                            = p0_st_ciireq_tdata_o[0];
    assign p0_tileif.cii_hdr_first_be                            = p0_st_ciireq_tdata_o[4:1];
    assign p0_tileif.cii_func_num                                = p0_st_ciireq_tdata_o[12:10];
    assign p0_tileif.cii_dout                                    = p0_st_ciireq_tdata_o[67:36];
    assign p0_tileif.cii_wr_vf_active                            = p0_st_ciireq_tdata_o[24];
    assign p0_tileif.cii_req                                     = p0_st_cii_req_o;
    assign p0_tileif.cii_addr                                    = p0_st_ciireq_tdata_o[35:26];
    assign p0_tileif.cii_vf_num                                  = p0_st_ciireq_tdata_o[23:13];
    assign p0_tileif.cii_wr                                      = p0_st_ciireq_tdata_o[25];

    assign p0_st_cii_halt_i                                      = p0_tileif.cii_halt;
    assign p0_st_ciiresp_tdata_i[32:0]                           = {p0_tileif.cii_override_en, p0_tileif.cii_override_din};

    assign p0_user_vfnonfatalmsg_func_num_i                      = p0_tileif.user_vfnonfatalmsg_func_num;
    assign p0_user_vfnonfatalmsg_vfnum_i                         = p0_tileif.user_vfnonfatalmsg_vfnum;
    assign p0_user_sent_vfnonfatalmsg_i                          = p0_tileif.user_sent_vfnonfatalmsg;
    assign p0_app_req_retry_en_i                                 = p0_tileif.app_req_retry_en;
    assign sm_p0_tileif.app_req_retry_en_ready                   = p0_app_retry_en_ready_o;

    assign p0_hip_reconfig_clk                                   = p0_tileif.hip_reconfig_clk;
    assign p0_hip_reconfig_address                               = p0_tileif.hip_reconfig_address;
    assign p0_hip_reconfig_read                                  = p0_tileif.hip_reconfig_read;
    assign p0_tileif.hip_reconfig_readdata                       = p0_hip_reconfig_readdata;
    assign p0_tileif.hip_reconfig_readdatavalid                  = p0_hip_reconfig_readdatavalid;
    assign p0_hip_reconfig_writedata                             = p0_tileif.hip_reconfig_writedata;
    assign p0_tileif.hip_reconfig_waitrequest                    = p0_hip_reconfig_waitrequest;
    assign p0_hip_reconfig_write                                 = p0_tileif.hip_reconfig_write;
    assign p0_hip_reconfig_byteen                                = sm_p0_tileif.hip_reconfig_byteen; // KLAI4 EDIT enable hip reconfig
    assign p0_tileif.hip_reconfig_resp                           = p0_hip_reconfig_resp; //KAHUAT_EDIT

    assign p0_tileif.dl_timer_update                             = p0_dl_timer_update_o;

/*
    assign p0_qhip_prs_event_valid_i                                  = sm_p0_tileif.qhip_prs_event_valid;
    assign p0_qhip_prs_event_func_i                                   = sm_p0_tileif.qhip_prs_event_func;
    assign p0_qhip_prs_event_i                                        = sm_p0_tileif.qhip_prs_event;
*/

    assign p0_qhip_prs_event_valid_i                                  = p0_tileif.prs_event_valid;
    assign p0_qhip_prs_event_func_i                                   = p0_tileif.prs_event_func;
    assign p0_qhip_prs_event_i                                        = p0_tileif.prs_event;

    if (core16_total_vf_count_hwtcl!=0) begin

      assign p0_tileif.vf_err_ur_posted_s0                       = p0_vf_err_ur_posted_s0_o;
      assign p0_tileif.vf_err_func_num_s0                        = p0_vf_err_func_num_s0_o;
      assign p0_tileif.vf_err_ca_postedreq_s0                    = p0_vf_err_ca_postedreq_s0_o;
      assign p0_tileif.vf_err_vf_num_s0                          = p0_vf_err_vf_num_s0_o;
      assign p0_tileif.vf_err_poisonedwrreq_s0                   = p0_vf_err_poisonedwrreq_s0_o;
      assign p0_tileif.vf_err_poisonedcompl_s0                   = p0_vf_err_poisonedcompl_s0_o;
      assign p0_tileif.vf_err_ur_posted_s1                       = p0_vf_err_ur_posted_s1_o;
      assign p0_tileif.vf_err_func_num_s1                        = p0_vf_err_func_num_s1_o;
      assign p0_tileif.vf_err_ca_postedreq_s1                    = p0_vf_err_ca_postedreq_s1_o;
      assign p0_tileif.vf_err_vf_num_s1                          = p0_vf_err_vf_num_s1_o;
      assign p0_tileif.vf_err_poisonedwrreq_s1                   = p0_vf_err_poisonedwrreq_s1_o;
      assign p0_tileif.vf_err_poisonedcompl_s1                   = p0_vf_err_poisonedcompl_s1_o;
      assign p0_tileif.vf_err_overflow                           = p0_vf_err_overflow_o;

    end
    else begin
      assign p0_tileif.vf_err_ur_posted_s0                       = 0;
      assign p0_tileif.vf_err_func_num_s0                        = 0;
      assign p0_tileif.vf_err_ca_postedreq_s0                    = 0;
      assign p0_tileif.vf_err_vf_num_s0                          = 0;
      assign p0_tileif.vf_err_poisonedwrreq_s0                   = 0;
      assign p0_tileif.vf_err_poisonedcompl_s0                   = 0;
      assign p0_tileif.vf_err_ur_posted_s1                       = 0;
      assign p0_tileif.vf_err_func_num_s1                        = 0;
      assign p0_tileif.vf_err_ca_postedreq_s1                    = 0;
      assign p0_tileif.vf_err_vf_num_s1                          = 0;
      assign p0_tileif.vf_err_poisonedwrreq_s1                   = 0;
      assign p0_tileif.vf_err_poisonedcompl_s1                   = 0;
      assign p0_tileif.vf_err_overflow                           = 0;
    end

    //lint ww32
    assign p0_tileif.vf_err_poisonedcompl_s3       = '0;
    assign p0_tileif.vf_err_poisonedcompl_s2       = '0;
    assign p0_tileif.vf_err_poisonedwrreq_s3       = '0;
    assign p0_tileif.vf_err_poisonedwrreq_s2       = '0;
    assign p0_tileif.vf_err_ca_postedreq_s3    = '0;
    assign p0_tileif.vf_err_ca_postedreq_s2    = '0;
    assign p0_tileif.vf_err_ur_posted_s3       = '0;
    assign p0_tileif.vf_err_ur_posted_s2       = '0;
    assign p0_tileif.cpl_timeout_avmm_readdatavalid    = '0;
    assign p0_tileif.cpl_timeout_waitrequest       = '0;
    assign p0_tileif.cpl_timeout       = '0;
    assign p0_tileif.virtio_pcicfg_cfgrd       = '0;
    assign p0_tileif.virtio_pcicfg_cfgwr       = '0;
    assign p0_tileif.virtio_pcicfg_vfaccess    = '0;
    assign p0_tileif.flr_rcvd_vf       = '0;
    assign p0_tileif.tx_par_err    = '0;
    assign p0_tileif.tx_st_ready       = '0;
    assign p0_tileif.rx_par_err    = '0;
    assign p0_tileif.rx_st_data     = '0;
    assign p0_tileif.rx_st_hdr      = '0;
    assign p0_tileif.rx_st_tlp_prfx      = '0;
    assign p0_tileif.rx_st_eop    = '0;
    assign p0_tileif.rx_st_sop    = '0;
    assign p0_tileif.rx_st_vf_num    = '0;
    assign p0_tileif.rx_st_func_num       = '0;
    assign p0_tileif.rx_st_valid      = '0;
    assign p0_tileif.rx_st_vf_active      = '0;
    assign p0_tileif.rx_st_hdr_par       = '0;
    assign p0_tileif.rx_st_empty      = '0;
    assign p0_tileif.rx_st_tlp_prfx_par       = '0;
    assign p0_tileif.rx_st_data_par0     = '0;
    assign p0_tileif.rx_st_data_par1     = '0;
    assign p0_tileif.rx_st_tlp_abort      = '0;
    assign p0_tileif.rx_st_bar_range      = '0;
    assign p0_tileif.tx_cdts_limit       = '0;
    assign p0_tileif.tx_cdts_limit_tdm_idx    = '0;
    assign p0_tileif.flr_rcvd_vf_num     = '0;
    assign p0_tileif.flr_rcvd_pf_num      = '0;
    assign p0_tileif.flr_rcvd_pf      = '0;
    assign p0_tileif.virtio_pcicfg_vfnum     = '0;
    assign p0_tileif.virtio_pcicfg_pfnum      = '0;
    assign p0_tileif.virtio_pcicfg_bar    = '0;
    assign p0_tileif.virtio_pcicfg_length    = '0;
    assign p0_tileif.virtio_pcicfg_baroffset     = '0;
    assign p0_tileif.virtio_pcicfg_cfgdata       = '0;
    assign p0_tileif.cpl_timeout_avmm_readdata    = '0;
    assign p0_tileif.pld_gp_ctrl      = '0;
    assign p0_tileif.vf_err_func_num_s2       = '0;
    assign p0_tileif.vf_err_func_num_s3       = '0;
    assign p0_tileif.vf_err_vf_num_s2    = '0;
    assign p0_tileif.vf_err_vf_num_s3    = '0;
  
    qhip_pcie_ed_dut_intel_pcie_gts_300_qdefnma #(
    //SM HAL TOP parameter
    //`include "intel_pcie_hal_top_parameter_connection.iv"

   .sm_hssi_pcie_ctl_x4_rxbuf_limit_bypass_hwtcl                          (sm_hssi_pcie_ctl_x4_rxbuf_limit_bypass_hwtcl),
   .sm_hssi_pcie_ctl_x4_maxpayload_size_hwtcl                             (sm_hssi_pcie_ctl_x4_maxpayload_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_port_type_hwtcl                                   (sm_hssi_pcie_ctl_x4_port_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_sris_enable_hwtcl                                 (sm_hssi_pcie_ctl_x4_sris_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_sris_mode_hwtcl                                   (sm_hssi_pcie_ctl_x4_sris_mode_hwtcl),
   .sm_hssi_pcie_ctl_x4_sup_mode_hwtcl                                    (sm_hssi_pcie_ctl_x4_sup_mode_hwtcl),
   .sm_hssi_pcie_ctl_x4_cvp_enable_hwtcl                                  (sm_hssi_pcie_ctl_x4_cvp_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_cii_monitor_en_hwtcl                              (sm_hssi_pcie_ctl_x4_cii_monitor_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pclk_clk_hz_hwtcl                                 (sm_hssi_pcie_ctl_x4_pclk_clk_hz_hwtcl),
   .sm_hssi_pcie_ctl_x4_sys_clk_hz_hwtcl                                  (sm_hssi_pcie_ctl_x4_sys_clk_hz_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_cap_link_surprise_down_err_cap_hwtcl          (sm_hssi_pcie_ctl_x4_pf0_cap_link_surprise_down_err_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_port_logic_fast_link_mode                     (sm_hssi_pcie_ctl_x4_pf0_port_logic_fast_link_mode),
   .sm_hssi_pcie_ctl_x4_link_rate_hwtcl					  (sm_hssi_pcie_ctl_x4_link_rate_hwtcl),
   .sm_hssi_pcie_ctl_x4_link_width_hwtcl				  (sm_hssi_pcie_ctl_x4_link_width_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset0_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset1_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset2_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset3_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset3_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset4_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset4_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset5_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset5_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset6_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset6_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset7_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset7_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset8_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset8_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset9_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset9_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset10_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset10_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset11_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset11_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset12_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset12_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset13_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset13_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset14_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset14_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset15_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_16g_tx_preset15_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset0_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset1_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset2_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset3_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset3_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset4_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset4_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset5_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset5_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset6_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset6_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset7_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset7_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset8_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset8_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset9_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset9_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset10_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset10_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset11_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset11_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset12_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset12_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset13_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset13_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset14_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset14_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset15_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_dsp_tx_preset15_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset0_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset1_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset2_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset3_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset3_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset4_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset4_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset5_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset5_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset6_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset6_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset7_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset7_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset8_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset8_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset9_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset9_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset10_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset10_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset11_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset11_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset12_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset12_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset13_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset13_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset14_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset14_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset15_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_16g_tx_preset15_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset0_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset1_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset2_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset3_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset3_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset4_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset4_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset5_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset5_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset6_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset6_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset7_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset7_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset8_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset8_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset9_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset9_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset10_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset10_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset11_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset11_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset12_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset12_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset13_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset13_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset14_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset14_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset15_hwtcl			  (sm_hssi_pcie_ctl_x4_pf0_usp_tx_preset15_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_virtio_en_hwtcl                               (sm_hssi_pcie_ctl_x4_pf0_virtio_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_virtio_en_hwtcl                               (sm_hssi_pcie_ctl_x4_pf1_virtio_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_virtio_en_hwtcl                               (sm_hssi_pcie_ctl_x4_pf2_virtio_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_virtio_en_hwtcl                               (sm_hssi_pcie_ctl_x4_pf3_virtio_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_exvf_virtio_en_hwtcl                          (sm_hssi_pcie_ctl_x4_pf0_exvf_virtio_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_exvf_virtio_en_hwtcl                          (sm_hssi_pcie_ctl_x4_pf1_exvf_virtio_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_exvf_virtio_en_hwtcl                          (sm_hssi_pcie_ctl_x4_pf2_exvf_virtio_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_exvf_virtio_en_hwtcl                          (sm_hssi_pcie_ctl_x4_pf3_exvf_virtio_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_device_id_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_pci_type0_device_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_vendor_id_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_pci_type0_vendor_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_revision_id_hwtcl                             (sm_hssi_pcie_ctl_x4_pf0_revision_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_base_class_code_hwtcl                         (sm_hssi_pcie_ctl_x4_pf0_base_class_code_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_subclass_code_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_subclass_code_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_program_interface_hwtcl                       (sm_hssi_pcie_ctl_x4_pf0_program_interface_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_subsys_vendor_id_hwtcl                        (sm_hssi_pcie_ctl_x4_pf0_subsys_vendor_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_subsys_dev_id_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_subsys_dev_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_device_id_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_device_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_subsysid_pf0_hwtcl                           (sm_hssi_pcie_ctl_x4_exvf_subsysid_pf0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_vendor_id_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_pci_type0_vendor_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_device_id_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_pci_type0_device_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_revision_id_hwtcl                             (sm_hssi_pcie_ctl_x4_pf1_revision_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_base_class_code_hwtcl                         (sm_hssi_pcie_ctl_x4_pf1_base_class_code_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_subclass_code_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_subclass_code_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_program_interface_hwtcl                       (sm_hssi_pcie_ctl_x4_pf1_program_interface_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_subsys_vendor_id_hwtcl                        (sm_hssi_pcie_ctl_x4_pf1_subsys_vendor_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_subsys_dev_id_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_subsys_dev_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_device_id_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_device_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_subsysid_pf1_hwtcl                           (sm_hssi_pcie_ctl_x4_exvf_subsysid_pf1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_vendor_id_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_pci_type0_vendor_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_device_id_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_pci_type0_device_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_revision_id_hwtcl                             (sm_hssi_pcie_ctl_x4_pf2_revision_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_base_class_code_hwtcl                         (sm_hssi_pcie_ctl_x4_pf2_base_class_code_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_subclass_code_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_subclass_code_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_program_interface_hwtcl                       (sm_hssi_pcie_ctl_x4_pf2_program_interface_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_subsys_vendor_id_hwtcl                        (sm_hssi_pcie_ctl_x4_pf2_subsys_vendor_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_subsys_dev_id_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_subsys_dev_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_device_id_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_device_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_subsysid_pf2_hwtcl                           (sm_hssi_pcie_ctl_x4_exvf_subsysid_pf2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_vendor_id_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_pci_type0_vendor_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_device_id_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_pci_type0_device_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_revision_id_hwtcl                             (sm_hssi_pcie_ctl_x4_pf3_revision_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_base_class_code_hwtcl                         (sm_hssi_pcie_ctl_x4_pf3_base_class_code_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_subclass_code_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_subclass_code_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_program_interface_hwtcl                       (sm_hssi_pcie_ctl_x4_pf3_program_interface_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_subsys_vendor_id_hwtcl                        (sm_hssi_pcie_ctl_x4_pf3_subsys_vendor_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_subsys_dev_id_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_subsys_dev_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_device_id_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_device_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_subsysid_pf3_hwtcl                           (sm_hssi_pcie_ctl_x4_exvf_subsysid_pf3_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_user_vsec_cap_enable_hwtcl                    (sm_hssi_pcie_ctl_x4_pf0_user_vsec_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_user_vsec_cap_enable_hwtcl                    (sm_hssi_pcie_ctl_x4_pf1_user_vsec_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_user_vsec_cap_enable_hwtcl                    (sm_hssi_pcie_ctl_x4_pf2_user_vsec_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_user_vsec_cap_enable_hwtcl                    (sm_hssi_pcie_ctl_x4_pf3_user_vsec_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_vsec_next_offset_hwtcl                            (sm_hssi_pcie_ctl_x4_vsec_next_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_user_vsec_offset_hwtcl                        (sm_hssi_pcie_ctl_x4_pf1_user_vsec_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_user_vsec_offset_hwtcl                        (sm_hssi_pcie_ctl_x4_pf2_user_vsec_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_user_vsec_offset_hwtcl                        (sm_hssi_pcie_ctl_x4_pf3_user_vsec_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_cvp_vendor_specific_header_id_hwtcl               (sm_hssi_pcie_ctl_x4_cvp_vendor_specific_header_id_hwtcl),
   .sm_hssi_pcie_ctl_x4_drop_vendor0_msg_hwtcl                            (sm_hssi_pcie_ctl_x4_drop_vendor0_msg_hwtcl),
   .sm_hssi_pcie_ctl_x4_drop_vendor1_msg_hwtcl                            (sm_hssi_pcie_ctl_x4_drop_vendor1_msg_hwtcl),
//   .sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl                                (sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_int_pin_hwtcl                                 (sm_hssi_pcie_ctl_x4_pf0_int_pin_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_int_pin_hwtcl                                 (sm_hssi_pcie_ctl_x4_pf1_int_pin_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_int_pin_hwtcl                                 (sm_hssi_pcie_ctl_x4_pf2_int_pin_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_int_pin_hwtcl                                 (sm_hssi_pcie_ctl_x4_pf3_int_pin_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_ats_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf0_ats_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_ats_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf1_ats_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_ats_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf2_ats_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_ats_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf3_ats_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_exvf_ats_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_exvf_ats_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_exvf_ats_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_exvf_ats_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_exvf_ats_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_exvf_ats_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_exvf_ats_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_exvf_ats_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_ats_exvf_align_request_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_ats_exvf_align_request_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_ats_exvf_align_request_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_ats_exvf_align_request_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_ats_exvf_align_request_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_ats_exvf_align_request_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_ats_exvf_align_request_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_ats_exvf_align_request_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf0_tph_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf1_tph_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf2_tph_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf3_tph_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_exvf_tph_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_exvf_tph_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_exvf_tph_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_exvf_tph_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_exvf_tph_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_exvf_tph_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_exvf_tph_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_exvf_tph_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_int_vec_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_int_vec_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_int_vec_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_int_vec_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_int_vec_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_int_vec_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_int_vec_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_int_vec_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_int_vec_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_int_vec_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_int_vec_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_int_vec_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_int_vec_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_int_vec_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_int_vec_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_int_vec_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl   (sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl   (sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl   (sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl   (sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_0_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_1_hwtcl              (sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_1_hwtcl              (sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_1_hwtcl              (sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_1_hwtcl              (sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl   (sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl   (sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl   (sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl   (sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_loc_1_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_size_hwtcl               (sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_size_hwtcl               (sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_size_hwtcl               (sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_size_hwtcl               (sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl    (sm_hssi_pcie_ctl_x4_pf0_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl    (sm_hssi_pcie_ctl_x4_pf1_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl    (sm_hssi_pcie_ctl_x4_pf2_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl    (sm_hssi_pcie_ctl_x4_pf3_tph_req_cap_st_table_size_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_device_spec_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_tph_req_device_spec_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_device_spec_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_tph_req_device_spec_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_device_spec_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_tph_req_device_spec_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_device_spec_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_tph_req_device_spec_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_tph_req_device_spec_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf0_tph_req_device_spec_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_tph_req_device_spec_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf1_tph_req_device_spec_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_tph_req_device_spec_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf2_tph_req_device_spec_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_tph_req_device_spec_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf3_tph_req_device_spec_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf0_acs_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf1_acs_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf2_acs_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf3_acs_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_exvf_acs_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_exvf_acs_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_exvf_acs_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_exvf_acs_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_exvf_acs_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_exvf_acs_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_exvf_acs_cap_enable_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_exvf_acs_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_src_valid_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_src_valid_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_src_valid_hwtcl                   (sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_src_valid_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_src_valid_hwtcl                   (sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_src_valid_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_src_valid_hwtcl                   (sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_src_valid_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_at_block_hwtcl                    (sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_at_block_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_at_block_hwtcl                    (sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_at_block_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_at_block_hwtcl                    (sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_at_block_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_at_block_hwtcl                    (sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_at_block_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_req_redirect_hwtcl            (sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_req_redirect_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_req_redirect_hwtcl            (sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_req_redirect_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_req_redirect_hwtcl            (sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_req_redirect_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_req_redirect_hwtcl            (sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_req_redirect_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_cpl_redirect_hwtcl            (sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_cpl_redirect_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_cpl_redirect_hwtcl            (sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_cpl_redirect_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_cpl_redirect_hwtcl            (sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_cpl_redirect_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_cpl_redirect_hwtcl            (sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_cpl_redirect_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_usp_forwarding_hwtcl              (sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_usp_forwarding_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_usp_forwarding_hwtcl              (sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_usp_forwarding_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_usp_forwarding_hwtcl              (sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_usp_forwarding_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_usp_forwarding_hwtcl              (sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_usp_forwarding_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_egress_control_hwtcl          (sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_p2p_egress_control_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_egress_control_hwtcl          (sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_p2p_egress_control_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_egress_control_hwtcl          (sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_p2p_egress_control_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_egress_control_hwtcl          (sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_p2p_egress_control_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_egress_ctrl_size_hwtcl            (sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_egress_ctrl_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_egress_ctrl_size_hwtcl            (sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_egress_ctrl_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_egress_ctrl_size_hwtcl            (sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_egress_ctrl_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_egress_ctrl_size_hwtcl            (sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_egress_ctrl_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_direct_translated_p2p_hwtcl       (sm_hssi_pcie_ctl_x4_pf0_acs_cap_acs_direct_translated_p2p_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_direct_translated_p2p_hwtcl       (sm_hssi_pcie_ctl_x4_pf1_acs_cap_acs_direct_translated_p2p_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_direct_translated_p2p_hwtcl       (sm_hssi_pcie_ctl_x4_pf2_acs_cap_acs_direct_translated_p2p_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_direct_translated_p2p_hwtcl       (sm_hssi_pcie_ctl_x4_pf3_acs_cap_acs_direct_translated_p2p_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ext_tag_en_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ext_tag_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ext_tag_en_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ext_tag_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ext_tag_en_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ext_tag_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ext_tag_en_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ext_tag_en_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_flr_cap_hwtcl                        (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_flr_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pcie_cap_flr_cap_hwtcl                        (sm_hssi_pcie_ctl_x4_pf1_pcie_cap_flr_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pcie_cap_flr_cap_hwtcl                        (sm_hssi_pcie_ctl_x4_pf2_pcie_cap_flr_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pcie_cap_flr_cap_hwtcl                        (sm_hssi_pcie_ctl_x4_pf3_pcie_cap_flr_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_port_num_hwtcl                       (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_port_num_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pcie_cap_port_num_hwtcl                       (sm_hssi_pcie_ctl_x4_pf1_pcie_cap_port_num_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pcie_cap_port_num_hwtcl                       (sm_hssi_pcie_ctl_x4_pf2_pcie_cap_port_num_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pcie_cap_port_num_hwtcl                       (sm_hssi_pcie_ctl_x4_pf3_pcie_cap_port_num_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_clk_config_hwtcl                (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_clk_config_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pcie_cap_slot_clk_config_hwtcl                (sm_hssi_pcie_ctl_x4_pf1_pcie_cap_slot_clk_config_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pcie_cap_slot_clk_config_hwtcl                (sm_hssi_pcie_ctl_x4_pf2_pcie_cap_slot_clk_config_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pcie_cap_slot_clk_config_hwtcl                (sm_hssi_pcie_ctl_x4_pf3_pcie_cap_slot_clk_config_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_msi_enable_hwtcl                              (sm_hssi_pcie_ctl_x4_pf0_msi_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_msi_enable_hwtcl                              (sm_hssi_pcie_ctl_x4_pf1_msi_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_msi_enable_hwtcl                              (sm_hssi_pcie_ctl_x4_pf2_msi_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_msi_enable_hwtcl                              (sm_hssi_pcie_ctl_x4_pf3_msi_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msi_ext_data_cap_hwtcl                    (sm_hssi_pcie_ctl_x4_pf0_pci_msi_ext_data_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msi_ext_data_cap_hwtcl                    (sm_hssi_pcie_ctl_x4_pf1_pci_msi_ext_data_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msi_ext_data_cap_hwtcl                    (sm_hssi_pcie_ctl_x4_pf2_pci_msi_ext_data_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msi_ext_data_cap_hwtcl                    (sm_hssi_pcie_ctl_x4_pf3_pci_msi_ext_data_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msi_64_bit_addr_cap_hwtcl                 (sm_hssi_pcie_ctl_x4_pf0_pci_msi_64_bit_addr_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msi_64_bit_addr_cap_hwtcl                 (sm_hssi_pcie_ctl_x4_pf1_pci_msi_64_bit_addr_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msi_64_bit_addr_cap_hwtcl                 (sm_hssi_pcie_ctl_x4_pf2_pci_msi_64_bit_addr_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msi_64_bit_addr_cap_hwtcl                 (sm_hssi_pcie_ctl_x4_pf3_pci_msi_64_bit_addr_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msi_multiple_msg_cap_hwtcl                (sm_hssi_pcie_ctl_x4_pf0_pci_msi_multiple_msg_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msi_multiple_msg_cap_hwtcl                (sm_hssi_pcie_ctl_x4_pf1_pci_msi_multiple_msg_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msi_multiple_msg_cap_hwtcl                (sm_hssi_pcie_ctl_x4_pf2_pci_msi_multiple_msg_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msi_multiple_msg_cap_hwtcl                (sm_hssi_pcie_ctl_x4_pf3_pci_msi_multiple_msg_cap_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_msix_enable_hwtcl                             (sm_hssi_pcie_ctl_x4_pf0_msix_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_msix_enable_hwtcl                             (sm_hssi_pcie_ctl_x4_pf1_msix_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_msix_enable_hwtcl                             (sm_hssi_pcie_ctl_x4_pf2_msix_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_msix_enable_hwtcl                             (sm_hssi_pcie_ctl_x4_pf3_msix_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_size_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_size_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_size_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_size_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_size_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_offset_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_offset_hwtcl                   (sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_offset_hwtcl                   (sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_offset_hwtcl                   (sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msix_bir_hwtcl                            (sm_hssi_pcie_ctl_x4_pf0_pci_msix_bir_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msix_bir_hwtcl                            (sm_hssi_pcie_ctl_x4_pf1_pci_msix_bir_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msix_bir_hwtcl                            (sm_hssi_pcie_ctl_x4_pf2_pci_msix_bir_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msix_bir_hwtcl                            (sm_hssi_pcie_ctl_x4_pf3_pci_msix_bir_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msix_pba_hwtcl                            (sm_hssi_pcie_ctl_x4_pf0_pci_msix_pba_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msix_pba_hwtcl                            (sm_hssi_pcie_ctl_x4_pf1_pci_msix_pba_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msix_pba_hwtcl                            (sm_hssi_pcie_ctl_x4_pf2_pci_msix_pba_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msix_pba_hwtcl                            (sm_hssi_pcie_ctl_x4_pf3_pci_msix_pba_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msix_pba_offset_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_pci_msix_pba_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msix_pba_offset_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_pci_msix_pba_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msix_pba_offset_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_pci_msix_pba_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msix_pba_offset_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_pci_msix_pba_offset_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_size_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf0_pci_msix_table_size_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_size_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf1_pci_msix_table_size_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_size_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf2_pci_msix_table_size_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_size_vfcomm_cs2_hwtcl          (sm_hssi_pcie_ctl_x4_pf3_pci_msix_table_size_vfcomm_cs2_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_exvf_msix_cap_enable_hwtcl                    (sm_hssi_pcie_ctl_x4_pf0_exvf_msix_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_exvf_msix_cap_enable_hwtcl                    (sm_hssi_pcie_ctl_x4_pf1_exvf_msix_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_exvf_msix_cap_enable_hwtcl                    (sm_hssi_pcie_ctl_x4_pf2_exvf_msix_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_exvf_msix_cap_enable_hwtcl                    (sm_hssi_pcie_ctl_x4_pf3_exvf_msix_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf0_hwtcl                     (sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf0_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf1_hwtcl                     (sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf1_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf2_hwtcl                     (sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf2_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf3_hwtcl                     (sm_hssi_pcie_ctl_x4_exvf_msix_tablesize_pf3_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf0_hwtcl                   (sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf0_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf1_hwtcl                   (sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf1_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf2_hwtcl                   (sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf2_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf3_hwtcl                   (sm_hssi_pcie_ctl_x4_exvf_msixtable_offset_pf3_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf0_hwtcl                      (sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf0_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf1_hwtcl                      (sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf1_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf2_hwtcl                      (sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf2_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf3_hwtcl                      (sm_hssi_pcie_ctl_x4_exvf_msixtable_bir_pf3_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf0_hwtcl                     (sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf0_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf1_hwtcl                     (sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf1_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf2_hwtcl                     (sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf2_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf3_hwtcl                     (sm_hssi_pcie_ctl_x4_exvf_msixpba_offset_pf3_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf0_hwtcl                        (sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf0_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf1_hwtcl                        (sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf1_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf2_hwtcl                        (sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf2_hwtcl),
   .sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf3_hwtcl                        (sm_hssi_pcie_ctl_x4_exvf_msixpba_bir_pf3_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_slot_imp_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_pcie_slot_imp_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_power_limit_scale_hwtcl         (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_power_limit_scale_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_power_limit_value_hwtcl         (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_slot_power_limit_value_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_phy_slot_num_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_phy_slot_num_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_hot_plug_capable_hwtcl               (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_hot_plug_capable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ep_l0s_accpt_latency_hwtcl           (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ep_l0s_accpt_latency_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ep_l1_accpt_latency_hwtcl            (sm_hssi_pcie_ctl_x4_pf0_pcie_cap_ep_l1_accpt_latency_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ep_l0s_accpt_latency_hwtcl           (sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ep_l0s_accpt_latency_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ep_l1_accpt_latency_hwtcl            (sm_hssi_pcie_ctl_x4_pf1_pcie_cap_ep_l1_accpt_latency_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ep_l0s_accpt_latency_hwtcl           (sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ep_l0s_accpt_latency_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ep_l1_accpt_latency_hwtcl            (sm_hssi_pcie_ctl_x4_pf2_pcie_cap_ep_l1_accpt_latency_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ep_l0s_accpt_latency_hwtcl           (sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ep_l0s_accpt_latency_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ep_l1_accpt_latency_hwtcl            (sm_hssi_pcie_ctl_x4_pf3_pcie_cap_ep_l1_accpt_latency_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_prs_ext_cap_enable_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_prs_ext_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_prs_ext_cap_enable_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_prs_ext_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_prs_ext_cap_enable_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_prs_ext_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_prs_ext_cap_enable_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_prs_ext_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_prs_ext_cap_outstanding_capacity_hwtcl        (sm_hssi_pcie_ctl_x4_pf0_prs_ext_cap_outstanding_capacity_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_prs_ext_cap_outstanding_capacity_hwtcl        (sm_hssi_pcie_ctl_x4_pf1_prs_ext_cap_outstanding_capacity_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_prs_ext_cap_outstanding_capacity_hwtcl        (sm_hssi_pcie_ctl_x4_pf2_prs_ext_cap_outstanding_capacity_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_prs_ext_cap_outstanding_capacity_hwtcl        (sm_hssi_pcie_ctl_x4_pf3_prs_ext_cap_outstanding_capacity_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sn_cap_enable_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_sn_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sn_cap_enable_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_sn_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sn_cap_enable_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_sn_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sn_cap_enable_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_sn_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sn_ser_num_reg_1_dw_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_sn_ser_num_reg_1_dw_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sn_ser_num_reg_1_dw_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_sn_ser_num_reg_1_dw_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sn_ser_num_reg_1_dw_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_sn_ser_num_reg_1_dw_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sn_ser_num_reg_1_dw_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_sn_ser_num_reg_1_dw_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sn_ser_num_reg_2_dw_hwtcl                     (sm_hssi_pcie_ctl_x4_pf0_sn_ser_num_reg_2_dw_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sn_ser_num_reg_2_dw_hwtcl                     (sm_hssi_pcie_ctl_x4_pf1_sn_ser_num_reg_2_dw_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sn_ser_num_reg_2_dw_hwtcl                     (sm_hssi_pcie_ctl_x4_pf2_sn_ser_num_reg_2_dw_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sn_ser_num_reg_2_dw_hwtcl                     (sm_hssi_pcie_ctl_x4_pf3_sn_ser_num_reg_2_dw_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pasid_cap_enable_hwtcl                        (sm_hssi_pcie_ctl_x4_pf0_pasid_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pasid_cap_enable_hwtcl                        (sm_hssi_pcie_ctl_x4_pf1_pasid_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pasid_cap_enable_hwtcl                        (sm_hssi_pcie_ctl_x4_pf2_pasid_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pasid_cap_enable_hwtcl                        (sm_hssi_pcie_ctl_x4_pf3_pasid_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pasid_cap_execute_permission_supported_hwtcl  (sm_hssi_pcie_ctl_x4_pf0_pasid_cap_execute_permission_supported_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pasid_cap_execute_permission_supported_hwtcl  (sm_hssi_pcie_ctl_x4_pf1_pasid_cap_execute_permission_supported_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pasid_cap_execute_permission_supported_hwtcl  (sm_hssi_pcie_ctl_x4_pf2_pasid_cap_execute_permission_supported_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pasid_cap_execute_permission_supported_hwtcl  (sm_hssi_pcie_ctl_x4_pf3_pasid_cap_execute_permission_supported_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pasid_cap_max_pasid_width_hwtcl               (sm_hssi_pcie_ctl_x4_pf0_pasid_cap_max_pasid_width_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pasid_cap_max_pasid_width_hwtcl               (sm_hssi_pcie_ctl_x4_pf1_pasid_cap_max_pasid_width_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pasid_cap_max_pasid_width_hwtcl               (sm_hssi_pcie_ctl_x4_pf2_pasid_cap_max_pasid_width_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pasid_cap_max_pasid_width_hwtcl               (sm_hssi_pcie_ctl_x4_pf3_pasid_cap_max_pasid_width_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pasid_cap_privileged_mode_supported_hwtcl     (sm_hssi_pcie_ctl_x4_pf0_pasid_cap_privileged_mode_supported_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pasid_cap_privileged_mode_supported_hwtcl     (sm_hssi_pcie_ctl_x4_pf1_pasid_cap_privileged_mode_supported_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pasid_cap_privileged_mode_supported_hwtcl     (sm_hssi_pcie_ctl_x4_pf2_pasid_cap_privileged_mode_supported_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pasid_cap_privileged_mode_supported_hwtcl     (sm_hssi_pcie_ctl_x4_pf3_pasid_cap_privileged_mode_supported_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_ltr_cap_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf0_ltr_cap_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_virtual_ptm_hwtcl                                 (sm_hssi_pcie_ctl_x4_virtual_ptm_hwtcl),
   .sm_hssi_pcie_ctl_x4_ptm_autoupdate_hwtcl                              (sm_hssi_pcie_ctl_x4_ptm_autoupdate_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_enable_hwtcl                                  (sm_hssi_pcie_ctl_x4_pf1_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_enable_hwtcl                                  (sm_hssi_pcie_ctl_x4_pf2_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_enable_hwtcl                                  (sm_hssi_pcie_ctl_x4_pf3_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_enable_hwtcl                            (sm_hssi_pcie_ctl_x4_pf0_sriov_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_enable_hwtcl                            (sm_hssi_pcie_ctl_x4_pf1_sriov_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_enable_hwtcl                            (sm_hssi_pcie_ctl_x4_pf2_sriov_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_enable_hwtcl                            (sm_hssi_pcie_ctl_x4_pf3_sriov_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar0_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar0_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar1_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar1_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar2_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar2_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar3_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar3_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar4_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar4_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar5_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar5_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar0_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar0_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar1_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar1_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar2_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar2_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar3_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar3_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar4_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar4_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar5_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf0_pci_type0_bar5_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar0_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_bar0_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar1_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_bar1_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar2_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_bar2_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar3_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_bar3_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar4_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_bar4_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar5_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf0_bar5_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_rom_bar_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf0_rom_bar_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_rp_rom_bar_enabled_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_rp_rom_bar_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar1_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar3_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar5_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar0_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf0_bar0_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar2_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf0_bar2_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_bar4_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf0_bar4_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar0_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar2_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf0_sriov_vf_bar4_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar0_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar0_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar1_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar1_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar2_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar2_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar3_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar3_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar4_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar4_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar5_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar5_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar0_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar0_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar1_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar1_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar2_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar2_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar3_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar3_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar4_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar4_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar5_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf1_pci_type0_bar5_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar0_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_bar0_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar1_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_bar1_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar2_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_bar2_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar3_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_bar3_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar4_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_bar4_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar5_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf1_bar5_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_rom_bar_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf1_rom_bar_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar1_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar3_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar5_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar0_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf1_bar0_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar2_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf1_bar2_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_bar4_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf1_bar4_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar0_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar2_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf1_sriov_vf_bar4_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar0_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar0_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar1_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar1_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar2_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar2_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar3_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar3_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar4_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar4_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar5_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar5_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar0_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar0_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar1_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar1_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar2_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar2_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar3_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar3_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar4_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar4_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar5_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf2_pci_type0_bar5_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar0_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_bar0_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar1_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_bar1_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar2_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_bar2_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar3_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_bar3_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar4_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_bar4_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar5_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf2_bar5_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_rom_bar_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf2_rom_bar_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar1_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar3_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar5_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar0_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf2_bar0_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar2_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf2_bar2_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_bar4_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf2_bar4_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar0_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar2_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf2_sriov_vf_bar4_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar0_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar0_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar1_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar1_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar2_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar2_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar3_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar3_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar4_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar4_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar5_enabled_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar5_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar0_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar0_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar1_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar1_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar2_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar2_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar3_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar3_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar4_mask_31_1_hwtcl		  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar4_mask_31_1_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar5_mask_31_0_hwtcl		  (sm_hssi_pcie_ctl_x4_pf3_pci_type0_bar5_mask_31_0_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar0_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_bar0_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar1_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_bar1_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar2_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_bar2_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar3_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_bar3_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar4_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_bar4_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar5_prefetch_hwtcl                           (sm_hssi_pcie_ctl_x4_pf3_bar5_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_rom_bar_enable_hwtcl                          (sm_hssi_pcie_ctl_x4_pf3_rom_bar_enable_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_enabled_hwtcl                   (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_enabled_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_mask_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_mask_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar1_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar3_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_prefetch_hwtcl                  (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar5_prefetch_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar0_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf3_bar0_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar2_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf3_bar2_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_bar4_type_hwtcl                               (sm_hssi_pcie_ctl_x4_pf3_bar4_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar0_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar2_type_hwtcl),
   .sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_type_hwtcl                      (sm_hssi_pcie_ctl_x4_pf3_sriov_vf_bar4_type_hwtcl),
   .ch0_xcvr_rx_protocol_hint_hwtcl                                       (ch0_xcvr_rx_protocol_hint_hwtcl),
   .ch1_xcvr_rx_protocol_hint_hwtcl                                       (ch1_xcvr_rx_protocol_hint_hwtcl),
   .ch2_xcvr_rx_protocol_hint_hwtcl                                       (ch2_xcvr_rx_protocol_hint_hwtcl),
   .ch3_xcvr_rx_protocol_hint_hwtcl                                       (ch3_xcvr_rx_protocol_hint_hwtcl),
   .ch0_xcvr_tx_protocol_hint_hwtcl                                       (ch0_xcvr_tx_protocol_hint_hwtcl),
   .ch1_xcvr_tx_protocol_hint_hwtcl                                       (ch1_xcvr_tx_protocol_hint_hwtcl),
   .ch2_xcvr_tx_protocol_hint_hwtcl                                       (ch2_xcvr_tx_protocol_hint_hwtcl),
   .ch3_xcvr_tx_protocol_hint_hwtcl                                       (ch3_xcvr_tx_protocol_hint_hwtcl),
   .ch0_sim_mode_hwtcl                                                    (ch0_sim_mode_hwtcl),
   .ch1_sim_mode_hwtcl                                                    (ch1_sim_mode_hwtcl),
   .ch2_sim_mode_hwtcl                                                    (ch2_sim_mode_hwtcl),
   .ch3_sim_mode_hwtcl                                                    (ch3_sim_mode_hwtcl),


//KAHUAT_EDIT
    . sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl                    ( sm_hssi_pcie_ctl_x4_num_of_lanes_hwtcl ),

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
   .core16_perfmon_clk_freq				  (core16_perfmon_clk_freq),

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

    .core16_func_mode_hwtcl           (core16_func_mode_hwtcl),
    .core16_pf0_bar0_address_width_hwtcl (core16_pf0_bar0_address_width_hwtcl),
    .core16_pf0_bar1_address_width_hwtcl (core16_pf0_bar1_address_width_hwtcl),
    .core16_pf0_bar2_address_width_hwtcl (core16_pf0_bar2_address_width_hwtcl),
    .core16_pf0_bar3_address_width_hwtcl (core16_pf0_bar3_address_width_hwtcl),
    .core16_pf0_bar4_address_width_hwtcl (core16_pf0_bar4_address_width_hwtcl),
    .core16_pf0_bar5_address_width_hwtcl (core16_pf0_bar5_address_width_hwtcl),
    .topology                         (topology)

   ) u_sm_qhip (
    .coreclkout_hip             (coreclkout_hip_toapp),
//    .refclk0_n                  ( ),
    .p0_rx_tuser_halt           (p0_app_ss_st_rx_tuser_halt),  
    .*
    );

  end
  endgenerate



endmodule

