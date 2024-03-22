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



module altera_pcie_s10_gen3x16_adapter
  #(
    parameter pld_tx_parity_ena = "enable",
    parameter pld_rx_parity_ena = "enable",
    parameter enable_sriov_hwtcl = 0,
    parameter intended_device_family  = "Stratix 10"
  )
  (
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input logic		clk250,			// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v, ...
   input logic		clk500,			// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v, ...
   input logic [2:0]	rx_st_bar_range_i,	// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [255:0]	rx_st_data_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [2:0]	rx_st_empty_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic		rx_st_eop_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [2:0]	rx_st_func_num_i,	// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [127:0]	rx_st_hdr_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [31:0]	rx_st_prefix_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [31:0]	rx_st_data_par_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [15:0]	rx_st_hdr_par_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [3:0]	rx_st_prefix_par_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic		rx_st_ready_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic		rx_st_sop_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic		rx_st_tlp_abort_i,	// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic		rx_st_valid_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic		rx_st_vf_active_i,	// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [10:0]	rx_st_vf_num_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   input logic [4:0]	tl_cfg_add_i,		// To u_cfg_if of altera_pcie_s10_gen3x16_cfg_if.v
   input logic [15:0]	tl_cfg_ctl_i,		// To u_cfg_if of altera_pcie_s10_gen3x16_cfg_if.v
   input logic [2:0]	tl_cfg_func_i,		// To u_cfg_if of altera_pcie_s10_gen3x16_cfg_if.v
   input logic [511:0]	tx_st_data_i,		// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   input logic [1:0]	tx_st_eop_i,		// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   input logic [1:0]	tx_st_err_i,		// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   input logic [255:0]	tx_st_hdr_i,		// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   input logic [63:0]	tx_st_data_par_i,
   input logic [31:0]	tx_st_hdr_par_i,
   input logic [7:0]	tx_st_prefix_par_i,
   input logic [63:0]	tx_st_prefix_i,		// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   input logic		    tx_st_ready_i,		// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   input logic [1:0]	tx_st_sop_i,		// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   input logic [1:0]	tx_st_valid_i,		// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   input logic [1:0]	tx_st_vf_active_i,	// To u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output logic [5:0]	rx_st_bar_range_o,	// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [511:0]	rx_st_data_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [5:0]	rx_st_empty_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [1:0]	rx_st_eop_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [5:0]	rx_st_func_num_o,	// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [255:0]	rx_st_hdr_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [63:0]	rx_st_data_par_o,
   output logic [31:0]	rx_st_hdr_par_o,
   output logic [7:0]	rx_st_prefix_par_o,
   output logic [63:0]	rx_st_prefix_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic		rx_st_ready_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [1:0]	rx_st_sop_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [1:0]	rx_st_tlp_abort_o,	// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [1:0]	rx_st_valid_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [1:0]	rx_st_vf_active_o,	// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [21:0]	rx_st_vf_num_o,		// From u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
   output logic [4:0]	tl_cfg_add_o,		// From u_cfg_if of altera_pcie_s10_gen3x16_cfg_if.v
   output logic [15:0]	tl_cfg_ctl_o,		// From u_cfg_if of altera_pcie_s10_gen3x16_cfg_if.v
   output logic [2:0]	tl_cfg_func_o,		// From u_cfg_if of altera_pcie_s10_gen3x16_cfg_if.v
   output logic [255:0]	tx_st_data_o,		// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   output logic		tx_st_eop_o,		// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   output logic		tx_st_err_o,		// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   output logic [127:0]	tx_st_hdr_o,		// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   output logic [31:0]	tx_st_data_par_o,
   output logic [15:0]	tx_st_hdr_par_o,
   output logic [3:0]	tx_st_prefix_par_o,
   output logic [31:0]	tx_st_prefix_o,		// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   output logic		tx_st_ready_o,		// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   output logic		tx_st_sop_o,		// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   output logic		tx_st_valid_o,		// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   output logic		tx_st_vf_active_o,	// From u_tx_st_if of altera_pcie_s10_gen3x16_tx_st_if.v
   // End of automatics
   
// Reset
   input logic		         rst_n,
   input logic		         rst_n_clk250,

// TX Credit
    input logic    [15:0]    tx_cdts_limit                ,
    input  logic   [2:0]     tx_cdts_limit_tdm_idex       ,
    output logic   [15:0]    app_tx_cdts_limit            ,
    output logic   [2:0]     app_tx_cdts_limit_tdm_idex   ,

// RX Credit
    input  logic   [11:0]    app_rx_buffer_limit          ,
    input  logic   [1:0]     app_rx_buffer_limit_tdm_idex ,
    output logic   [11:0]    rx_buffer_limit              ,
    output logic   [1:0]     rx_buffer_limit_tdm_idex     ,
    
    
// Error Interface

   input logic         serr_out_i,
   input logic         hip_enter_err_mode_i,
   input logic         app_err_valid_i,
   input logic [127:0] app_err_hdr_i,
   input logic [31:0]  app_err_tlp_prfx_i,
   input logic [12:0]  app_err_info_i,
   input logic [2:0]   app_err_func_num_i,

   output logic         serr_out_o,
   output logic         hip_enter_err_mode_o,
   output logic         app_err_valid_o,
   output logic [127:0] app_err_hdr_o,
   output logic [31:0]  app_err_tlp_prfx_o,
   output logic [12:0]  app_err_info_o,
   output logic [2:0]   app_err_func_num_o,

   input logic         rx_par_err_i,
   input logic         tx_par_err_i,

   output logic        rx_par_err_o,
   output logic        tx_par_err_o,

// FLR Interface

  input  logic [7:0]          flr_rcvd_pf_i,
  input  logic                flr_rcvd_vf_i,
  input  logic [2:0]          flr_rcvd_pf_num_i,
  input  logic [10:0]         flr_rcvd_vf_num_i,
  output logic [7:0]          flr_completed_pf_o,
  output logic                flr_completed_vf_o,
  output logic [2:0]          flr_completed_pf_num_o,
  output logic [10:0]         flr_completed_vf_num_o,

  output logic [7:0]          app_flr_rcvd_pf_o,
  output logic                app_flr_rcvd_vf_o,
  output logic [2:0]          app_flr_rcvd_pf_num_o,
  output logic [10:0]         app_flr_rcvd_vf_num_o,
  input  logic [7:0]          app_flr_completed_pf_i,
  input  logic                app_flr_completed_vf_i,
  input  logic [2:0]          app_flr_completed_pf_num_i,
  input  logic [10:0]         app_flr_completed_vf_num_i,
// CII interface

  input  logic                cii_req_i,
  input  logic                cii_hdr_poisoned_i,
  input  logic [3:0]          cii_hdr_first_be_i,
  input  logic [2:0]          cii_func_num_i,
  input  logic                cii_wr_vf_active_i,
  input  logic [10:0]         cii_vf_num_i,
  input  logic                cii_wr_i,
  input  logic  [9:0]         cii_add_i,
  input  logic [31:0]         cii_dout_i,
  output logic                cii_override_en_o,
  output logic [31:0]         cii_override_din_o,
  output logic                cii_halt_o,

  output logic                cii_req_o,
  output logic                cii_hdr_poisoned_o,
  output logic [3:0]          cii_hdr_first_be_o,
  output logic [2:0]          cii_func_num_o,
  output logic                cii_wr_vf_active_o,
  output logic [10:0]         cii_vf_num_o,
  output logic                cii_wr_o,
  output logic  [9:0]         cii_add_o,
  output logic [31:0]         cii_dout_o,
  input  logic                cii_override_en_i,
  input  logic [31:0]         cii_override_din_i,
  input  logic                cii_halt_i,

//interrupt if 

  input  logic                int_status_i,
  
  output  logic [2:0]         msi_pnd_func_o,
  output  logic [31:0]        msi_pnd_byte_o,
  output  logic               msi_pnd_valid_o,
  output  logic [7:0]         app_int_o,
  
  output  logic               int_status_o,
  
  input  logic [2:0]         app_msi_pnd_func_i,
  input  logic [31:0]        app_msi_pnd_byte_i,
  input  logic               app_msi_pnd_valid_i,
  input  logic [7:0]         app_int_i 
  
  
  
);
    
    reg                                                      rst_n_clk250_reg;
    reg    [3:0]                                             rst_n_tree_clk250_reg_s1,rst_n_tree_clk250_reg_s2;
    
// rst_n_clk250 is iopll locked. This needs to be registered on ref clock then synchronized on 250MHz.
  always @ (posedge clk500 or negedge rst_n_clk250) begin
     if (!rst_n_clk250) begin
        rst_n_clk250_reg <='0;
     end
     else begin         
        rst_n_clk250_reg <= rst_n_clk250; /*synthesis preserve*/
     end
  end
  
  always @ (posedge clk250 or negedge rst_n_clk250_reg) begin
     if (!rst_n_clk250_reg) begin
        rst_n_tree_clk250_reg_s1 <='0;
        rst_n_tree_clk250_reg_s2 <='0;
     end
     else begin         
        rst_n_tree_clk250_reg_s1 <= {4{rst_n_clk250_reg}}; /*synthesis preserve*/
        rst_n_tree_clk250_reg_s2 <= rst_n_tree_clk250_reg_s1; /*synthesis preserve*/
     end
  end
  
  
  reg                                                      rst_n_reg;
  reg    [3:0]                                             rst_n_tree_reg_s1,rst_n_tree_reg_s2;
    
// registering pin_perst.
  always @ (posedge clk500 or negedge rst_n) begin
     if (!rst_n) begin
        rst_n_reg <='0;
     end
     else begin         
        rst_n_reg <= rst_n; /*synthesis preserve*/
     end
  end
  
  always @ (posedge clk500 or negedge rst_n) begin
     if (!rst_n) begin
        rst_n_tree_reg_s1 <='0;
        rst_n_tree_reg_s2 <='0;
     end
     else begin         
        rst_n_tree_reg_s1 <= {4{rst_n_reg}}; /*synthesis preserve*/
        rst_n_tree_reg_s2 <= rst_n_tree_reg_s1; /*synthesis preserve*/
     end
  end
 

    altera_pcie_s10_gen3x16_tx_st_if #(
       .pld_tx_parity_ena               (pld_tx_parity_ena),
       .enable_sriov_hwtcl              (enable_sriov_hwtcl),
       .intended_device_family          (intended_device_family)
    ) u_tx_st_if 
      (/*AUTOINST*/
       // Outputs
       .tx_st_valid_o			(tx_st_valid_o),
       .tx_st_ready_o			(tx_st_ready_o),
       .tx_st_sop_o			(tx_st_sop_o),
       .tx_st_eop_o			(tx_st_eop_o),
       .tx_st_vf_active_o		(tx_st_vf_active_o),
       .tx_st_err_o			(tx_st_err_o),
       .tx_st_data_o			(tx_st_data_o[255:0]),
       .tx_st_hdr_o			(tx_st_hdr_o[127:0]),
       .tx_st_prefix_o			(tx_st_prefix_o[31:0]),
       .tx_st_data_par_o		(tx_st_data_par_o[31:0]),
       .tx_st_hdr_par_o		    (tx_st_hdr_par_o),
       .tx_st_prefix_par_o		(tx_st_prefix_par_o),
       // Inputs
       .clk500				(clk500),
       .rst				(~rst_n),		 // Templated
       .clk250				(clk250),
       .rst_clk250			(~rst_n_clk250),	 // Templated
       .tx_st_ready_i			(tx_st_ready_i),
       .tx_st_sop_i			(tx_st_sop_i[1:0]),
       .tx_st_eop_i			(tx_st_eop_i[1:0]),
       .tx_st_err_i			(tx_st_err_i[1:0]),
       .tx_st_vf_active_i		(tx_st_vf_active_i[1:0]),
       .tx_st_data_i			(tx_st_data_i[256*2-1:0]),
       .tx_st_hdr_i			(tx_st_hdr_i[128*2-1:0]),
       .tx_st_prefix_i			(tx_st_prefix_i[32*2-1:0]),
       .tx_st_data_par_i		(tx_st_data_par_i),
       .tx_st_hdr_par_i		    (tx_st_hdr_par_i),
       .tx_st_prefix_par_i		(tx_st_prefix_par_i),
       .tx_st_valid_i			(tx_st_valid_i[1:0]));

    altera_pcie_s10_gen3x16_rx_st_if #(
       .pld_rx_parity_ena                (pld_rx_parity_ena),
       .enable_sriov_hwtcl              (enable_sriov_hwtcl),
       .intended_device_family          (intended_device_family)
    )  u_rx_st_if 
      (/*AUTOINST*/
       // Outputs
       .rx_st_valid_o			(rx_st_valid_o[1:0]),
       .rx_st_ready_o			(rx_st_ready_o),
       .rx_st_sop_o			(rx_st_sop_o[1:0]),
       .rx_st_eop_o			(rx_st_eop_o[1:0]),
       .rx_st_data_o			(rx_st_data_o[256*2-1:0]),
       .rx_st_hdr_o			(rx_st_hdr_o[128*2-1:0]),
       .rx_st_prefix_o			(rx_st_prefix_o[32*2-1:0]),
       .rx_st_data_par_o  		(rx_st_data_par_o[32*2-1:0]),
       .rx_st_hdr_par_o  		(rx_st_hdr_par_o[16*2-1:0]),
       .rx_st_prefix_par_o  	(rx_st_prefix_par_o[4*2-1:0]),
       .rx_st_tlp_abort_o		(rx_st_tlp_abort_o[1:0]),
       .rx_st_bar_range_o		(rx_st_bar_range_o[3*2-1:0]),
       .rx_st_empty_o			(rx_st_empty_o[3*2-1:0]),
       .rx_st_vf_active_o		(rx_st_vf_active_o[1:0]),
       .rx_st_func_num_o		(rx_st_func_num_o[5:0]),
       .rx_st_vf_num_o			(rx_st_vf_num_o[21:0]),
       // Inputs
       .clk500				(clk500),
       .rst				(~rst_n),		 // Templated
       .clk250				(clk250),
       .rst_clk250			(~rst_n_clk250),	 // Templated
       .rx_st_ready_i			(rx_st_ready_i),
       .rx_st_sop_i			(rx_st_sop_i),
       .rx_st_eop_i			(rx_st_eop_i),
       .rx_st_data_i			(rx_st_data_i[255:0]),
       .rx_st_hdr_i			(rx_st_hdr_i[127:0]),
       .rx_st_prefix_i			(rx_st_prefix_i[31:0]),
       .rx_st_data_par_i		(rx_st_data_par_i[31:0]),
       .rx_st_hdr_par_i		    (rx_st_hdr_par_i),
       .rx_st_prefix_par_i		(rx_st_prefix_par_i),
       .rx_st_valid_i			(rx_st_valid_i),
       .rx_st_tlp_abort_i		(rx_st_tlp_abort_i),
       .rx_st_bar_range_i		(rx_st_bar_range_i[2:0]),
       .rx_st_empty_i			(rx_st_empty_i[2:0]),
       .rx_st_vf_active_i		(rx_st_vf_active_i),
       .rx_st_func_num_i		(rx_st_func_num_i[2:0]),
       .rx_st_vf_num_i			(rx_st_vf_num_i[10:0]));

    altpcie_adapter_credit #(
       .intended_device_family          (intended_device_family)
    ) u_credit_if (
//Clk and reset
    .app_clk(clk250),                      // 250 MHz
    .pld_clk(clk500),                      // 500 MHz
    .app_rst_n(rst_n_tree_clk250_reg_s2[2])          ,
    .pld_rst_n(rst_n_tree_reg_s2[2])                   ,

// TX Credit
    .tx_cdts_limit(tx_cdts_limit)                ,
    .tx_cdts_limit_tdm_idex(tx_cdts_limit_tdm_idex)       ,
    .app_tx_cdts_limit(app_tx_cdts_limit)            ,
    .app_tx_cdts_limit_tdm_idex(app_tx_cdts_limit_tdm_idex)   ,

// RX Credit
    .app_rx_buffer_limit(app_rx_buffer_limit)          ,
    .app_rx_buffer_limit_tdm_idex(app_rx_buffer_limit_tdm_idex) ,
    .rx_buffer_limit(rx_buffer_limit)              ,
    .rx_buffer_limit_tdm_idex(rx_buffer_limit_tdm_idex)

  );
   

    altera_pcie_s10_gen3x16_cfg_if u_cfg_if
      (/*AUTOINST*/
       // Outputs
       .tl_cfg_func_o			(tl_cfg_func_o[2:0]),
       .tl_cfg_add_o			(tl_cfg_add_o[4:0]),
       .tl_cfg_ctl_o			(tl_cfg_ctl_o[15:0]),
       // Inputs
       .clk500				(clk500),
       .rst_n				(rst_n_tree_reg_s2[3]),	 // Templated
       .clk250				(clk250),
       .rst_n_clk250			(rst_n_tree_clk250_reg_s2[3]), // Templated
       .tl_cfg_func_i			(tl_cfg_func_i[2:0]),
       .tl_cfg_add_i			(tl_cfg_add_i[4:0]),
       .tl_cfg_ctl_i			(tl_cfg_ctl_i[15:0]));
    
    
    
    intel_pcie_err_if u_err_if (

     .clk500                     (clk500              ),
     .rst_n                      (rst_n               ),
     .clk250                     (clk250              ),
     .rst_n_clk250               (rst_n_clk250        ),
     .serr_out_i                 (serr_out_i          ),
     .hip_enter_err_mode_i       (hip_enter_err_mode_i),
     .app_err_valid_i            (app_err_valid_i     ),
     .app_err_hdr_i              (app_err_hdr_i       ),
     .app_err_tlp_prfx_i         (app_err_tlp_prfx_i  ),
     .app_err_info_i             (app_err_info_i      ),
     .app_err_func_num_i         (app_err_func_num_i  ),
     .serr_out_o                 (serr_out_o          ),
     .hip_enter_err_mode_o       (hip_enter_err_mode_o),
     .app_err_valid_o            (app_err_valid_o     ),
     .app_err_hdr_o              (app_err_hdr_o       ),
     .app_err_tlp_prfx_o         (app_err_tlp_prfx_o  ),
     .app_err_info_o             (app_err_info_o      ),
     .app_err_func_num_o         (app_err_func_num_o  ),
     .rx_par_err_i               (rx_par_err_i        ),
     .tx_par_err_i               (tx_par_err_i        ),
     .rx_par_err_o               (rx_par_err_o        ),
     .tx_par_err_o               (tx_par_err_o        )

   );
   
   
    intel_pcie_flr_if #(
      .VF_ENABLE           (0)

    ) u_flr_if (
      
      .clk500                           (clk500                    ),
      .rst_n                            (rst_n                     ),      
      .clk250                           (clk250                    ), 
      .rst_n_clk250                     (rst_n_clk250              ),   
      .flr_rcvd_pf_i                    (flr_rcvd_pf_i             ), 
      .flr_rcvd_vf_i                    (flr_rcvd_vf_i             ), 
      .flr_rcvd_pf_num_i                (flr_rcvd_pf_num_i         ), 
      .flr_rcvd_vf_num_i                (flr_rcvd_vf_num_i         ), 
      .flr_completed_pf_o               (flr_completed_pf_o        ), 
      .flr_completed_vf_o               (flr_completed_vf_o        ), 
      .flr_completed_pf_num_o           (flr_completed_pf_num_o    ),
      .flr_completed_vf_num_o           (flr_completed_vf_num_o    ),      
      .app_flr_rcvd_pf_o                (app_flr_rcvd_pf_o         ),
      .app_flr_rcvd_vf_o                (app_flr_rcvd_vf_o         ),
      .app_flr_rcvd_pf_num_o            (app_flr_rcvd_pf_num_o     ),
      .app_flr_rcvd_vf_num_o            (app_flr_rcvd_vf_num_o     ), 
      .app_flr_completed_pf_i           (app_flr_completed_pf_i    ),
      .app_flr_completed_vf_i           (app_flr_completed_vf_i    ),
      .app_flr_completed_pf_num_i       (app_flr_completed_pf_num_i),
      .app_flr_completed_vf_num_i       (app_flr_completed_vf_num_i)

    );
    
    intel_pcie_cii_if #(
       .VF_ENABLE  (1)

    ) u_cii_if ( 

    .clk500                (clk500            ),
    .rst_n                 (rst_n             ),
    .clk250                (clk250            ),
    .rst_n_clk250          (rst_n_clk250      ),
    .cii_req_i             (cii_req_i         ),
    .cii_hdr_poisoned_i    (cii_hdr_poisoned_i),
    .cii_hdr_first_be_i    (cii_hdr_first_be_i),
    .cii_func_num_i        (cii_func_num_i    ),
    .cii_wr_vf_active_i    (cii_wr_vf_active_i),
    .cii_vf_num_i          (cii_vf_num_i      ),
    .cii_wr_i              (cii_wr_i          ),
    .cii_add_i             (cii_add_i         ),
    .cii_dout_i            (cii_dout_i        ),
    .cii_override_en_o     (cii_override_en_o ),
    .cii_override_din_o    (cii_override_din_o),
    .cii_halt_o            (cii_halt_o        ),

    .cii_req_o             (cii_req_o          ),
    .cii_hdr_poisoned_o    (cii_hdr_poisoned_o ),
    .cii_hdr_first_be_o    (cii_hdr_first_be_o ),
    .cii_func_num_o        (cii_func_num_o     ),
    .cii_wr_vf_active_o    (cii_wr_vf_active_o ),
    .cii_vf_num_o          (cii_vf_num_o       ),
    .cii_wr_o              (cii_wr_o           ),
    .cii_add_o             (cii_add_o          ),
    .cii_dout_o            (cii_dout_o         ),
    .cii_override_en_i     (cii_override_en_i  ),
    .cii_override_din_i    (cii_override_din_i ),
    .cii_halt_i            (cii_halt_i         )
    );
    
    intel_pcie_int_if #(
       .intended_device_family          (intended_device_family)
    ) u_int_if (
   
    .clk500                  (clk500             ),
    .rst_n                   (rst_n              ),                             
    .clk250                  (clk250             ),
    .rst_n_clk250            (rst_n_clk250       ),                             
    .int_status_i            (int_status_i       ),                             
    .msi_pnd_func_o          (msi_pnd_func_o     ),
    .msi_pnd_byte_o          (msi_pnd_byte_o     ),
    .msi_pnd_valid_o         (msi_pnd_valid_o    ),
    .app_int_o               (app_int_o          ),                             
    .int_status_o            (int_status_o       ),                             
    .app_msi_pnd_func_i      (app_msi_pnd_func_i ),
    .app_msi_pnd_byte_i      (app_msi_pnd_byte_i ),
    .app_msi_pnd_valid_i     (app_msi_pnd_valid_i),
    .app_int_i               (app_int_i          )
  );
  
  

    
endmodule // altera_pcie_s10_gen3x16_adaptor

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf/ZOPcYsWpIvvdOYYpo0Kx8niutIOZwes76FthdGTHkA1Vu9fQ1WdM0xDBuzt5v+v0X+QQcLcGJoqj2ijKKKxO1ecfJmtxHERtHnCDg0nJ8FSklkub42h2WwWqfiJ27nx+e/dtsbUTmF6ukVvljRR+DI36p5Wa0y5qXoyqQMqXkxm3A98ABmsg+IpMnWpbzxxESVdFcgeeihL6I4t6hEO3v7/2h8fS/wYjIxAaOpk42Nt2ELmyRpVg1BPM9TfbRGjjGL0FNVYoGC3doEIMLTQYrXHtEAsFA8z8xSzmx0tjMYL4Qw2KOwe2XOzz7C8dSiLhUsf+OtT3VTrrAle/5BYhBwM26KRx5VNQvbfgH4nbJTAG/RK4wtiAWpy9IrtjTHQxDOBow/tRPeZMG4JX3EkDzOIJGu92IGcvdTLcMNsyg4cCdtDeTBT6APX+2jXuxQcAia86BNMOGGQElxOgeQzh5ZPLeELkjFWis/fA5q1skMNicq/1DDR/l1pxsEmTlsvUxx+UL05HiS1job8k7YpFntf3ZrOG+ojm7Rnnmk6xlTVDhnHajCbmtJBQ79oFwrmyNw1ESm6HYgNwqx7AfIYghLFvKA6Xz7ID0i9ygpVKY+x4VvqrR0gGJCKQD1rjQrACTQ2MGZ7+IvmcHliU8g8OziYtqIVkoT8+T70B4zqtcZHM1C8hp8AiywsKejbPQVuGze3Vh/ioVRrh3WUF1+p49p+/dGbFjjOvatHoza/a0aX/8nPArS8cfINPT4QFQOPUp4dsHKMWy7Pop6nPvlxfD"
`endif