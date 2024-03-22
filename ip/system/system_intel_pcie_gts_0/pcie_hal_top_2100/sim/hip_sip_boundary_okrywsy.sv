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



  module hip_sip_boundary_okrywsy
  #(
    parameter lane_num                                          = 4
    

)
(
    input    [lane_num-1:0][11:0]  i_ss_eth_fec_rx_async       ,     
    input    [lane_num-1:0]        i_ss_eth_fec_rx_direct      ,     
    output   [lane_num-1:0][6:0 ]  o_ss_eth_fec_tx_async       ,     
    output   [lane_num-1:0]        o_ss_eth_fec_tx_direct      ,     
    input    [lane_num-1:0][13:0]  i_ss_eth_mac_rx_async       ,     
    input    [lane_num-1:0]        i_ss_eth_mac_rx_direct      ,     
    output   [lane_num-1:0][13:0]  o_ss_eth_mac_tx_async       ,     
    output   [lane_num-1:0]        o_ss_eth_mac_tx_direct      ,     
    input    [lane_num-1:0][13:0]  i_ss_eth_pcs_rx_async       ,     
    input    [lane_num-1:0]        i_ss_eth_pcs_rx_direct      ,     
    output   [lane_num-1:0][7:0 ]  o_ss_eth_pcs_tx_async       ,     
    output   [lane_num-1:0]        o_ss_eth_pcs_tx_direct      ,     
    input    [lane_num-1:0][13:0]  i_ss_eth_xcvrif_rx_async    ,     
    input    [lane_num-1:0]        i_ss_eth_xcvrif_rx_direct   ,     
    output   [lane_num-1:0][6:0 ]  o_ss_eth_xcvrif_tx_async    ,     
    output   [lane_num-1:0]        o_ss_eth_xcvrif_tx_direct   ,     
    input    [lane_num-1:0][87:0]  i_ss_pcie_ctrl_rx_async     ,     
    input    [lane_num-1:0][7:0 ]  i_ss_pcie_ctrl_rx_direct    ,     
    output   [lane_num-1:0][87:0]  o_ss_pcie_ctrl_tx_async     ,     
    output   [lane_num-1:0][7:0 ]  o_ss_pcie_ctrl_tx_direct    ,     
    output   [lane_num-1:0][79:0]  o_ss_uxquad_async           ,
    output   [lane_num-1:0][79:0]  o_ss_uxquad_async_pcie_mux  ,                   
    input    [lane_num-1:0][49:0]  i_ss_uxquad_async           , 
    input    [lane_num-1:0][79:0]  i_hio_uxquad_async          ,
    input    [lane_num-1:0][79:0]  i_hio_uxquad_async_pcie_mux ,                    
    output   [lane_num-1:0][49:0]  o_hio_uxquad_async          ,  
    input    [lane_num-1:0][99:0]  i_hio_txdata_async          ,     
    input    [lane_num-1:0][9:0 ]  i_hio_txdata_direct         ,     
    output   [lane_num-1:0][99:0]  o_hio_rxdata_async          ,     
    output   [lane_num-1:0][9:0 ]  o_hio_rxdata_direct          
);


//for (j=2; j<=lane_num; j++) begin: async_map
//  assign o_ss_eth_mac_tx_async[j-1]       = i_hio_txdata_async[j-1][41:28];
//  assign o_ss_eth_pcs_tx_async[j-1]       = i_hio_txdata_async[j-1][49:42];
//  assign o_ss_eth_fec_tx_async[j-1]       = i_hio_txdata_async[j-1][56:50];
//  assign o_ss_eth_xcvrif_tx_async[j-1]    = i_hio_txdata_async[j-1][63:57];
//end


//o_ss_eth_mac_tx_async [1]     = i_hio_txdata_async[1][41:28];
//o_ss_eth_pcs_tx_async [1]     = i_hio_txdata_async[1][49:42];
//o_ss_eth_fec_tx_async [1]     = i_hio_txdata_async[1][56:50];
//o_ss_eth_xcvrif_tx_async[1]   = i_hio_txdata_async[1][63:57];
//o_ss_eth_mac_tx_async [2]     = i_hio_txdata_async[2][41:28];
//o_ss_eth_pcs_tx_async [2]     = i_hio_txdata_async[2][49:42];
//o_ss_eth_fec_tx_async [2]     = i_hio_txdata_async[2][56:50];
//o_ss_eth_xcvrif_tx_async[2]   = i_hio_txdata_async[2][63:57];
//o_ss_eth_mac_tx_async [3]     = i_hio_txdata_async[3][41:28];
//o_ss_eth_pcs_tx_async [3]     = i_hio_txdata_async[3][49:42];
//o_ss_eth_fec_tx_async [3]     = i_hio_txdata_async[3][56:50];
//o_ss_eth_xcvrif_tx_async[3]   = i_hio_txdata_async[3][63:57];
//o_ss_eth_mac_tx_async [4]     = i_hio_txdata_async[4][41:28];
//o_ss_eth_pcs_tx_async [4]     = i_hio_txdata_async[4][49:42];
//o_ss_eth_fec_tx_async [4]     = i_hio_txdata_async[4][56:50];
//o_ss_eth_xcvrif_tx_async[4]   = i_hio_txdata_async[4][63:57];
//
//
//o_ss_pcie_ctrl_tx_async[0]  = i_hio_txdata_async[0][99:12];







endmodule

