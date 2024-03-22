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


// (C) 2001-2018 Intel Corporation. All rights reserved.
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


//----------------------------------------------------------------
//    Project Name:   avmm_bridge
//    Module Name :   intel_pcie_bam.sv
//    Author      :   
//    Description :   Bursting Avalon Master Wrapper
//----------------------------------------------------------------

// synopsys translate_off
`timescale 1 ns / 1 ps
// synopsys translate_on

module system_intel_pcie_pio_gts_0_intel_pcie_pio_gts_234_qrm2xsq # (
    parameter PFNUM_WIDTH               = 2,
    parameter VFNUM_WIDTH               = 11,
    parameter DATA_WIDTH                = 512,
    parameter DEVICE_FAMILY             = "Agilex 5",
    parameter PIPELINE_EN               = 0
) 
(
     input [511:0]                  pio_readdata_i,          // 
     input                          pio_readdatavalid_i,     // 
     input [1:0]                    pio_response_i,          // 
     input                          pio_waitrequest_i,       // 
//     input [12:0]                   busdev_num,             // 
     input                          Clk_i,                   // connect to axi_st_clk 
     input                          coreclkout_hip,          //
//     input [2:0]                    dev_mps,                // 
     input                          Rstn_i,                  // 
     output                         pio_clk,                 //
     output                         pio_rst_n,               //
     output [63:0]                  pio_address_o,           // 
//     output [2:0]                   pio_bar_o,               // 
     output [3:0]                   pio_burstcount_o,        // 
     output [63:0]                  pio_byteenable_o,        // 
//     output [6:0]                   pio_np_hdr_credit_o,     // 
//     output [PFNUM_WIDTH-1:0]       pio_pfnum_o,             // 
     output                         pio_read_o,              // 

     input                          pio_rx_tvalid_i,         //                             .tvalid_i,                        
     output                         pio_rx_tready_o,         //                             .tready_o,                        
     input  [DATA_WIDTH-1:0]        pio_rx_tdata_i,          //                             .tdata_i,                         
     input  [(DATA_WIDTH/8)-1:0]    pio_rx_tkeep_i,          //                             .tkeep_i,                         
     input                          pio_rx_tlast_i,          //                             .tlast_i,                         
     input                          pio_rx_tuser_i,          //                             .tuser_i,                         
     input  [2:0]                   pio_rx_tuser_vendor_i,   //                             .pio_rx_tuser_vendor_i,  
 
     output                         pio_tx_tvalid_o,         //                             .tvalid_o,                        
     input                          pio_tx_tready_i,         //                             .tready_i,                        
     output [DATA_WIDTH-1:0]        pio_tx_tdata_o,          //                             .tdata_o,                         
     output [(DATA_WIDTH/8)-1:0]    pio_tx_tkeep_o,          //                             .tkeep_o,                         
     output                         pio_tx_tlast_o,          //                             .tlast_o,                         
     output                         pio_tx_tuser_o,          //                             .tuser_o,                         
     output [1:0]                   pio_tx_tuser_vendor_o,   //                             .pio_tx_tuser_vendor_o,  

     input                          pio_txcrdt_tvalid,       //                 p0_st_txcrdt.tvalid,                                                                      
     input  [18:0]                  pio_txcrdt_tdata,        //                             .tdata,

     input                          pio_ctrlshadow_tvalid_i,
     input  [39:0]                  pio_ctrlshadow_tdata_i,
     input                          pio_cplto_tvalid_i,
     input  [29:0]                  pio_cplto_tdata_i,
 
     output                         pio_axi_st_areset_n,
     output                         pio_axi_lite_areset_n,
     output                         pio_subsystem_cold_rst_n,
     output                         pio_subsystem_warm_rst_n,
     input                          pio_subsystem_cold_rst_ack_n,
     input                          pio_subsystem_warm_rst_ack_n,
     input                          ninit_done,
     input                          outclk_0,
//     input                        outclk_1,
     input                          pio_pll_locked,
 
     output                         pio_subsystem_rst_req,         
     input                          pio_subsystem_rst_rdy,         
     input                          pio_initiate_warmrst_req,      
     output                         pio_initiate_rst_req_rdy,      

     //output                       pio_vfactive_o,   // 
     //output [VFNUM_WIDTH-1:0]     pio_vfnum_o,      // 
     output                         pio_write_o,      // 
     output [511:0]                 pio_writedata_o   // 

);

localparam pld_tx_parity_ena  = "enable";  // enables AVST TX parity
localparam pld_rx_parity_ena  = "enable";  // enables AVST RX parity
localparam enable_sriov_hwtcl = 0;

logic pio_Rstn;
logic pll_Rstn;
logic serdes_pll_locked;
logic pll_locked;

logic [2:0]   pio_rx_bar;
logic         pio_rx_eop;
logic [127:0] pio_rx_header;
logic [255:0] pio_rx_header_wire;
//logic [255:0] pio_rx_header_switch;
logic [511:0] pio_rx_payload;
logic [PFNUM_WIDTH-1:0] pio_rx_pfnum;
logic         pio_rx_sop;
logic         pio_rx_valid;
logic         pio_rx_vfactive;
logic [VFNUM_WIDTH-1:0] pio_rx_vfnum;
logic         pio_rx_ready;

//logic         pio_txc_ready;
logic         pio_txc_ready_w1;  
logic         pio_txc_ready_w2;    
logic         pio_txc_eop;
logic [127:0] pio_txc_header;
logic [255:0] pio_txc_header_wire;
logic [255:0] pio_txc_header_switch;
logic [511:0] pio_txc_payload;
logic         pio_txc_sop;
logic         pio_txc_valid;
logic         pio_txc_vfactive;

logic [2:0]   pio_rx_bar_nc;
logic         pio_rx_eop_nc;
logic [5-PFNUM_WIDTH:0] pio_rx_pfnum_nc;
logic [127:0] pio_rx_header_nc;
logic         pio_rx_sop_nc;
logic         pio_rx_valid_nc;
logic         pio_rx_vfactive_nc;
logic [21-VFNUM_WIDTH:0] pio_rx_vfnum_nc;

wire  [255:0] pio_rx_payload_w;
wire          pio_rx_eop_w;
wire  [127:0] pio_rx_header_switch_w; 
wire  [255:0] pio_rx_header_switch_w1; 
wire          pio_rx_ready_w;
wire          pio_rx_sop_w;
wire          pio_rx_valid_w;
wire  [2:0]   pio_rx_bar_w;


assign pio_txc_prefix_o = 0;
assign pio_txc_err_o = 0;

assign serdes_pll_locked = 1'b1;

assign pio_rx_header_switch_w1 = {pio_rx_header_wire[159:128],pio_rx_header_wire[191:160],pio_rx_header_wire[223:192],pio_rx_header_wire[255:224],
                                pio_rx_header_wire[31:0],pio_rx_header_wire[63:32],pio_rx_header_wire[95:64],pio_rx_header_wire[127:96]};

assign {pio_txc_header_wire[159:128],pio_txc_header_wire[191:160],pio_txc_header_wire[223:192],pio_txc_header_wire[255:224],
        pio_txc_header_wire[31:0],pio_txc_header_wire[63:32],pio_txc_header_wire[95:64],pio_txc_header_wire[127:96]} = pio_txc_header_switch; 


//SM RX AXI 2 AVST converter
  altpcied_tx_adaptor #(
        .device_family              (DEVICE_FAMILY),
        .DWIDTH                     (256),
        .payload_width              (256),
        .user_width                 (8),
        .hdr_width                  (128),
        .pfx_width                  (32),
        .pcie_link_width            ("x4"),
        .double_width               (1)
) altpcied_tx_adaptor_inst (
        .axi_st_clk                             ( Clk_i ),
        .coreclkout_hip                         ( coreclkout_hip ),
        .warm_rst_n                             ( Rstn_i ),
        .axi_st_areset_n                        ( 'b1 ),
        .axi_lite_clk                           ( 'b1 ),
        .axi_lite_areset_n                      ( 'b1 ),
        .subsystem_rst_req                      ( 'b0 ),
        .subsystem_rst_rdy                      (  ),

        // AXI-S signals - input
        .app_ss_st_tx_tvalid                    ( pio_rx_tvalid_i ),
        .app_ss_st_tx_tdata                     (  pio_rx_tdata_i ),
        .app_ss_st_tx_tkeep                     ( pio_rx_tkeep_i ),
        .app_ss_st_tx_tlast                     ( pio_rx_tlast_i ),
        .app_ss_st_tx_tuser_vendor              ( 'b0 ),
        .app_ss_st_tx_tuser                     ( 'b0 ),
        .app_ss_st_tx_tready                    ( pio_rx_tready_o ),

        // AVST signals - output
        .tx_st_ready                            ( pio_rx_ready_w ),  
        .tx_st_valid                            ( pio_rx_valid_w ),  
        .tx_st_sop                              ( pio_rx_sop_w ),  
        .tx_st_eop                              ( pio_rx_eop_w ), 
        //.tx_st_empty                          ( tx_st_empty ),
        .tx_st_data                             ( pio_rx_payload_w[255:0] ), 
        .tx_st_data_par                         (  ),
        .tx_st_hdr                              ( pio_rx_header_switch_w[127:0] ), 
        .tx_st_hdr_par                          (  ),
        .tx_st_tlp_prfx                         (  ),
        .tx_st_tlp_prfx_par                     (  ),
        .tx_prfx_type_out                       (  ),
        .tx_prfx_present_out                    (  ),
        .tx_pf_number_out                       (  ),
        .tx_vf_number_out                       (  ),
        .tx_vf_active_out                       (  ),
        .tx_bar_number_out                      ( pio_rx_bar_w[2:0] )  //note need to declare wire
        //.tx_slot_number_out                   ( s0_tx_slot_number_out ),
        //.tx_mm_mode                           ( tx_mm_mode )
        // Performance Monitor
        //N/A
    );

wire          pio_txc_sop_w;
wire          pio_txc_eop_w;
wire          pio_txc_valid_w;
wire          pio_txc_vf_active_w;
wire [127:0]  pio_txc_header_switch_w;
wire [255:0]  pio_txc_payload_w;

//SM TX AVST 2 AXI converter
        altpcied_rx_adaptor # (
          .device_family              (DEVICE_FAMILY),
          .pcie_link_width            ("x4"),
          .payload_width              (256),
          .hdr_width                  (128),
          .pfx_width                  (32),
          .double_width               (1),
          .empty_width                (3),
          .DWIDTH                     (256)  
        ) altpcied_rx_adaptor_inst (
          .coreclkout_hip               ( coreclkout_hip ),
          .axi_st_clk                   ( Clk_i ),
          .axi_lite_clk                 ( 'b1 ),

          .warm_rst_n                   ( Rstn_i ),
          .axi_st_areset_n              ( pio_axi_st_areset_n ),
          .axi_lite_areset_n            ( 'b1 ),
          .subsystem_rst_req            ( 'b1 ),
          .rx_rst_rdy                   ( ),

          .rx_st_sop_i                  ( pio_txc_sop_w ), //note need to declare wire
          .rx_st_eop_i                  ( pio_txc_eop_w ),   //note need to declare wire
          .rx_st_valid_i                ( pio_txc_valid_w ),   //note need to declare wire
          .rx_st_empty_i                ( 3'b111 ),
          .rx_st_vf_active_i            ( pio_txc_vf_active_w ),   //note need to declare wire
          .rx_st_func_num_i             ( 'b0 ),
          .rx_st_vf_num_i               ( 'b0 ),
          .rx_st_bar_range_i            ( 'b0 ),
          .rx_st_tlp_prfx_i             ( 'b0 ),
          .rx_st_tlp_prfx_par_i         ( 'b0 ),
          .rx_st_hdr_i                  ( {pio_txc_header_switch_w[31:0], pio_txc_header_switch_w[63:32], pio_txc_header_switch_w[95:64], pio_txc_header_switch_w[127:96]}  ), //note need to declare wire
          .rx_st_hdr_par_i              ( 'b0 ),
          .rx_st_data_i                 ( pio_txc_payload_w[255:0] ),   //note need to declare wire
          .rx_st_data_par_i             ( 'b0 ),
          .rx_st_slot_num_i             ( 'b0 ),
          .rx_st_ready_o                ( pio_txc_ready_w ),   //note need to declare wire
          .app_ss_st_rx_tready          ( pio_tx_tready_i ),
          .ss_app_st_rx_tvalid          ( pio_tx_tvalid_o ),
          .ss_app_st_rx_tlast           ( pio_tx_tlast_o ),
          .ss_app_st_rx_par_chk         ( ),
          .ss_app_st_rx_tkeep           ( pio_tx_tkeep_o ),
          .ss_app_st_rx_tdata           ( pio_tx_tdata_o ),
          .ss_app_st_rx_tuser           ( ),
          .ss_app_st_rx_tuser_vendor    ( )
        );


//  if (DATA_WIDTH == 256) begin

    //assign pio_rx_header_wire = {128'b0,pio_rx_header_i};
    assign pio_rx_header_wire = {128'b0,pio_rx_header_switch_w}; //SM
    assign pio_txc_header_switch[255:128] = 128'b0;
    assign pio_txc_header_o = pio_txc_header_wire[127:0];

    // intel_pcie_reset_sync #(.WIDTH_RST(1)) rst_sync_pio (
    //   .clk      (pio_clk), // input
    //   .rst_n    (Rstn_i), // input
    //   .srst_n   (pio_Rstn)  // output [WIDTH_RST-1:0]
    // );

    // intel_pcie_reset_sync #(.WIDTH_RST(1)) rst_sync_pll (
    //   .clk      (pio_clk), // input
    //   .rst_n    (pll_locked), // input
    //   .srst_n   (pll_Rstn)  // output [WIDTH_RST-1:0]
    // );

    logic pio_rstn_d1, pio_rstn_d2;

    always_ff @(posedge pio_clk or negedge Rstn_i)
    begin
        if (!Rstn_i) begin
            pio_rstn_d1 <= 1'b0;
            pio_rstn_d2 <= 1'b0;
        end else begin
            pio_rstn_d1 <= Rstn_i;
            pio_rstn_d2 <= pio_rstn_d1;
        end
    end
    assign pio_Rstn = pio_rstn_d2;

    logic pio_rst_Clk_n;
    always_ff @(posedge Clk_i or negedge Rstn_i)
    begin
        if (!Rstn_i) begin
            pio_rst_Clk_n <= 1'b0;
        end else begin
            pio_rst_Clk_n <= Rstn_i;
        end                                 
    end  


    logic pll_rstn_d1, pll_rstn_d2;

    // always_ff @(posedge pio_clk or negedge pll_locked)
    // begin
        // if (!pll_locked) begin
            // pll_rstn_d1 <= 1'b0;
            // pll_rstn_d2 <= 1'b0;
        // end else begin
            // pll_rstn_d1 <= pll_locked;
            // pll_rstn_d2 <= pll_rstn_d1;
        // end
    // end
    // assign pll_Rstn = pll_rstn_d2;

//    assign pio_rst_n = pio_Rstn & pll_Rstn;

 assign pio_rst_n = pio_Rstn;

// Used Clkctrl Buffer instead of IOPLL to generate divby2 Clk

// Use coreclkout_hip directly in the adapter instead of clock_div1x. Create a dummy_flop for div1x clk.
wire dummy_clk;
wire dummy_in /* synthesis syn_noprune=1 syn_preserve=1 */;
reg  dummy_out /* synthesis syn_noprune=1 syn_preserve=1 */;

assign dummy_in = 1'b1;
always @ (posedge dummy_clk) begin
    dummy_out <= dummy_in;
end
// end of div1x logic


	system_intel_pcie_pio_gts_0_intel_pcie_pio_gts_intelclkctrl_234_dwo3zja pio_clkCtrl (
			//SM       .inclk (Clk_i),
                        .inclk (coreclkout_hip),
			.clock_div1x (dummy_clk),
			.clock_div2x (pio_clk)
		);


    altera_pcie_s10_gen3x16_adapter #(
        .pld_tx_parity_ena   (pld_tx_parity_ena),
        .pld_rx_parity_ena   (pld_rx_parity_ena),
        .enable_sriov_hwtcl   (enable_sriov_hwtcl),
        .intended_device_family (DEVICE_FAMILY)
    ) altera_pcie_256s_512s_adapter_inst (
					    // Outputs
						.rx_st_bar_range_o	({pio_rx_bar_nc,pio_rx_bar}),
					    .rx_st_data_o	    (pio_rx_payload),
					    .rx_st_empty_o	    (),
					    .rx_st_eop_o	    ({pio_rx_eop_nc,pio_rx_eop}),
					    .rx_st_func_num_o	({pio_rx_pfnum_nc,pio_rx_pfnum}),
					    .rx_st_hdr_o	    ({pio_rx_header_nc,pio_rx_header}),
					    .rx_st_data_par_o	(),
					    .rx_st_hdr_par_o	(),
					    .rx_st_prefix_par_o	(),
					    .rx_st_prefix_o	    (),
					    .rx_st_ready_o	    (pio_rx_ready_w), //output to tx_adaptor
					    .rx_st_sop_o	    ({pio_rx_sop_nc,pio_rx_sop}),
					    .rx_st_tlp_abort_o	(),
					    .rx_st_valid_o	    ({pio_rx_valid_nc,pio_rx_valid}),
					    .rx_st_vf_active_o	({pio_rx_vfactive_nc,pio_rx_vfactive}),
					    .rx_st_vf_num_o	    ({pio_rx_vfnum_nc,pio_rx_vfnum}),

					    .tx_st_data_o	    (pio_txc_payload_w[255:0]),
					    .tx_st_eop_o	    (pio_txc_eop_w),
					    .tx_st_err_o	    (),
					    .tx_st_hdr_o	    (pio_txc_header_switch_w[127:0]),
					    .tx_st_data_par_o	(),
					    .tx_st_hdr_par_o	(),
					    .tx_st_prefix_par_o	(),
					    .tx_st_prefix_o	    (),
					    .tx_st_ready_o	    (pio_txc_ready_w1), //output connect to intel_pcie_bam_v2_crdt_intf
					    .tx_st_sop_o	    (pio_txc_sop_w),
					    .tx_st_valid_o	    (pio_txc_valid_w),
					    .tx_st_vf_active_o	(pio_txc_vf_active_w),

					    .tl_cfg_add_o	(),
					    .tl_cfg_ctl_o	(),
					    .tl_cfg_func_o	(),

					    .app_tx_cdts_limit	(),
					    .app_tx_cdts_limit_tdm_idex(),
					    .rx_buffer_limit	(),
					    .rx_buffer_limit_tdm_idex(),
					    .serr_out_o		(),
					    .hip_enter_err_mode_o(),
					    .app_err_valid_o	(),
					    .app_err_hdr_o	(),
					    .app_err_tlp_prfx_o	(),
					    .app_err_info_o	(),
					    .app_err_func_num_o	(),
					    .rx_par_err_o	(),
					    .tx_par_err_o	(),
					    .flr_completed_pf_o	(),
					    .flr_completed_vf_o	(),
					    .flr_completed_pf_num_o(),
					    .flr_completed_vf_num_o(),
					    .app_flr_rcvd_pf_o	(),
					    .app_flr_rcvd_vf_o	(),
					    .app_flr_rcvd_pf_num_o(),
					    .app_flr_rcvd_vf_num_o(),
					    .cii_override_en_o	(),
					    .cii_override_din_o	(),
					    .cii_halt_o		(),
					    .cii_req_o		(),
					    .cii_hdr_poisoned_o	(),
					    .cii_hdr_first_be_o	(),
					    .cii_func_num_o	(),
					    .cii_wr_vf_active_o	(),
					    .cii_vf_num_o	(),
					    .cii_wr_o		(),
					    .cii_add_o		(),
					    .cii_dout_o		(),
					    .msi_pnd_func_o	(),
					    .msi_pnd_byte_o	(),
					    .msi_pnd_valid_o	(),
					    .app_int_o		(),
					    .int_status_o	(),
					    // Inputs
					    .clk250		(pio_clk),
					    .clk500		(coreclkout_hip),
					    .rst_n		(Rstn_i),
					    .rst_n_clk250	(pio_rst_n),

					    .rx_st_bar_range_i	(pio_rx_bar_w[2:0]), 
					    .rx_st_data_i	    (pio_rx_payload_w[255:0]),
					    .rx_st_empty_i	    (3'b0),
					    .rx_st_eop_i	    (pio_rx_eop_w),
					    .rx_st_func_num_i	(3'b0),//{PFNUM_WIDTH{1'b0}}),//pio_rx_pfnum_i),
					    .rx_st_hdr_i	    (pio_rx_header_switch_w1[127:0]),
					    .rx_st_prefix_i	    (32'b0),
					    .rx_st_data_par_i	(32'b0),
					    .rx_st_hdr_par_i	(16'b0),
					    .rx_st_prefix_par_i	(4'b0),
					    .rx_st_ready_i	    (pio_rx_ready),  //from bam
					    .rx_st_sop_i	    (pio_rx_sop_w),
					    .rx_st_tlp_abort_i	(1'b0),
					    .rx_st_valid_i	    (pio_rx_valid_w),
					    .rx_st_vf_active_i	(1'b0),//pio_rx_vfactive_i),
					    .rx_st_vf_num_i	    (11'b0),//{VFNUM_WIDTH{1'b0}}),//pio_rx_vfnum_i),

					    .tx_st_data_i	    (pio_txc_payload[511:0]),
					    .tx_st_eop_i	    ({1'b0,pio_txc_eop}),
                        .tx_st_err_i	    (2'b00),
					    .tx_st_hdr_i	    ({128'b0,pio_txc_header[127:0]}),
					    .tx_st_data_par_i	('0),
					    .tx_st_hdr_par_i	('0),
					    .tx_st_prefix_par_i	('0),
					    .tx_st_prefix_i	    ('0),
					    .tx_st_ready_i	    (pio_txc_ready_w), //from rx_adaptor
					    .tx_st_sop_i	    ({1'b0,pio_txc_sop}),
					    .tx_st_valid_i	    ({1'b0,pio_txc_valid}),
					    .tx_st_vf_active_i	({1'b0,1'b0}),//pio_txc_vf_active}),

					    .tl_cfg_add_i	(5'b0),
					    .tl_cfg_ctl_i	(16'b0),
					    .tl_cfg_func_i	(3'b0),

					    .tx_cdts_limit	(16'b0),
					    .tx_cdts_limit_tdm_idex(3'b0),
					    .app_rx_buffer_limit(12'b0),
					    .app_rx_buffer_limit_tdm_idex(2'b0),
					    .serr_out_i		(1'b0),
					    .hip_enter_err_mode_i(1'b0),
					    .app_err_valid_i	(1'b0),
					    .app_err_hdr_i	(128'b0),
					    .app_err_tlp_prfx_i	(32'b0),
					    .app_err_info_i	(13'b0),
					    .app_err_func_num_i	(3'b0),
					    .rx_par_err_i	(1'b0),
					    .tx_par_err_i	(1'b0),
					    .flr_rcvd_pf_i	(8'b0),
					    .flr_rcvd_vf_i	(1'b0),
					    .flr_rcvd_pf_num_i	(3'b0),
					    .flr_rcvd_vf_num_i	(11'b0),
					    .app_flr_completed_pf_i(8'b0),
					    .app_flr_completed_vf_i(1'b0),
					    .app_flr_completed_pf_num_i(3'b0),
					    .app_flr_completed_vf_num_i(11'b0),
					    .cii_req_i		(1'b0),
					    .cii_hdr_poisoned_i	(1'b0),
					    .cii_hdr_first_be_i	(4'b0),
					    .cii_func_num_i	(3'b0),
					    .cii_wr_vf_active_i	(1'b0),
					    .cii_vf_num_i	(11'b0),
					    .cii_wr_i		(1'b0),
					    .cii_add_i		(10'b0),
					    .cii_dout_i		(32'b0),
					    .cii_override_en_i	(1'b0),
					    .cii_override_din_i	(32'b0),
					    .cii_halt_i		(1'b0),
					    .int_status_i	(1'b0),
					    .app_msi_pnd_func_i	(3'b0),
					    .app_msi_pnd_byte_i	(32'b0),
					    .app_msi_pnd_valid_i(1'b0),
					    .app_int_i		(8'b0));


generate if (PIPELINE_EN == 0) begin : g_pipeline_disable
  intel_pcie_bam
  # (
    .DEVICE_FAMILY   (DEVICE_FAMILY),
    .PFNUM_WIDTH     (PFNUM_WIDTH),
    .VFNUM_WIDTH     (VFNUM_WIDTH)
  ) pio (
    .clk                                (pio_clk                   ), //
    .rst_n                              (pio_rst_n                 ), //
    .bam_readdata_i                     (pio_readdata_i            ), //
    .bam_readdatavalid_i                (pio_readdatavalid_i       ), //
    .bam_response_i                     (pio_response_i            ), //

    .bam_rx_bar_i                       (pio_rx_bar[2:0]         ), //
    .bam_rx_eop_i                       (pio_rx_eop              ), //
    .bam_rx_header_i                    (pio_rx_header[127:0]    ), //
    .bam_rx_payload_i                   (pio_rx_payload          ), //
    .bam_rx_pfnum_i                     (pio_rx_pfnum            ), //
    .bam_rx_sop_i                       (pio_rx_sop              ), //
    .bam_rx_valid_i                     (pio_rx_valid            ), //
    .bam_rx_vfactive_i                  (pio_rx_vfactive         ), //
    .bam_rx_vfnum_i                     (pio_rx_vfnum            ), //
    .bam_rx_ready_o                     (pio_rx_ready            ), //

    .bam_waitrequest_i                  (pio_waitrequest_i         ), //
    .bam_writeresponsevalid_i           (1'b0                      ), //
    .busdev_num                         (13'b0),//busdev_num                ), //
    .dev_mps                            (3'b0),//dev_mps                   ), //

    .bam_address_o                      (pio_address_o             ), //
    .bam_bar_o                          (),//pio_bar_o                 ), //
    .bam_burstcount_o                   (pio_burstcount_o          ), //
    .bam_byteenable_o                   (pio_byteenable_o          ), //
    .bam_np_hdr_credit_o                (),//pio_np_hdr_credit_o       ), //
    .bam_pfnum_o                        (),//pio_pfnum_o               ), //
    .bam_read_o                         (pio_read_o                ), //

    .bam_txc_ready_i                    (pio_txc_ready_w2           ), //
    .bam_txc_eop_o                      (pio_txc_eop             ), //
    .bam_txc_header_o                   (pio_txc_header[127:0]   ), //
    .bam_txc_payload_o                  (pio_txc_payload         ), //
    .bam_txc_sop_o                      (pio_txc_sop             ), //
    .bam_txc_valid_o                    (pio_txc_valid           ), //
    .bam_txc_vfactive_o                 (pio_txc_vfactive        ), //

    .bam_vfactive_o                     (),//pio_vfactive_o            ), //
    .bam_vfnum_o                        (),//pio_vfnum_o               ), //
    .bam_write_o                        (pio_write_o               ), //
    .bam_writedata_o                    (pio_writedata_o           ), //
    .bam_writeresponsevalid_o           (                          )  //
  );

end else begin : g_pipeline_en

  intel_pcie_bam_pipeline
  # (
    .DEVICE_FAMILY   (DEVICE_FAMILY),
    .PFNUM_WIDTH     (PFNUM_WIDTH),
    .VFNUM_WIDTH     (VFNUM_WIDTH)
  ) pio (
    .clk                                (pio_clk                   ), //
    .rst_n                              (pio_rst_n                 ), //
    .bam_readdata_i                     (pio_readdata_i            ), //
    .bam_readdatavalid_i                (pio_readdatavalid_i       ), //
    .bam_response_i                     (pio_response_i            ), //

    .bam_rx_bar_i                       (pio_rx_bar[2:0]         ), //
    .bam_rx_eop_i                       (pio_rx_eop              ), //
    .bam_rx_header_i                    (pio_rx_header[127:0]    ), //
    .bam_rx_payload_i                   (pio_rx_payload          ), //
    .bam_rx_pfnum_i                     (pio_rx_pfnum            ), //
    .bam_rx_sop_i                       (pio_rx_sop              ), //
    .bam_rx_valid_i                     (pio_rx_valid            ), //
    .bam_rx_vfactive_i                  (pio_rx_vfactive         ), //
    .bam_rx_vfnum_i                     (pio_rx_vfnum            ), //
    .bam_rx_ready_o                     (pio_rx_ready            ), //

    .bam_waitrequest_i                  (pio_waitrequest_i         ), //
    .bam_writeresponsevalid_i           (1'b0                      ), //
    .busdev_num                         (13'b0),//busdev_num                ), //
    .dev_mps                            (3'b0),//dev_mps                   ), //

    .bam_address_o                      (pio_address_o             ), //
    .bam_bar_o                          (),//pio_bar_o                 ), //
    .bam_burstcount_o                   (pio_burstcount_o          ), //
    .bam_byteenable_o                   (pio_byteenable_o          ), //
    .bam_np_hdr_credit_o                (),//pio_np_hdr_credit_o       ), //
    .bam_pfnum_o                        (),//pio_pfnum_o               ), //
    .bam_read_o                         (pio_read_o                ), //

    .bam_txc_ready_i                    (pio_txc_ready_w2           ), //
    .bam_txc_eop_o                      (pio_txc_eop             ), //
    .bam_txc_header_o                   (pio_txc_header[127:0]   ), //
    .bam_txc_payload_o                  (pio_txc_payload         ), //
    .bam_txc_sop_o                      (pio_txc_sop             ), //
    .bam_txc_valid_o                    (pio_txc_valid           ), //
    .bam_txc_vfactive_o                 (pio_txc_vfactive        ), //

    .bam_vfactive_o                     (),//pio_vfactive_o            ), //
    .bam_vfnum_o                        (),//pio_vfnum_o               ), //
    .bam_write_o                        (pio_write_o               ), //
    .bam_writedata_o                    (pio_writedata_o           ), //
    .bam_writeresponsevalid_o           (                          )  //
  );
end
endgenerate

//pio_rst_n synchronize to pio_clk
//pio_clk

//Mapping from txcrdt_tdata to dcrdt_update and hcrdt_update
// txcrdt_tdata[18:0]       Bit[15:0] - Credit Limit Type
//                          Bit[18:16] - Credit Type
//                          3'b000 - Posted Header Credit
//                          3'b001 - Non-Posted Header Credit
//                          3'b010 - Completion Header Credit
//                          3'b011 - Reserved
//                          3'b100 - Posted Data Credit
//                          3'b101 - Non-Posted Data Credit
//                          3'b110 - Completion Data Credit
//                          3'b111 - Reserved

logic [15:0]  pio_txcrdt_tdata_sync;

logic [2:0]   tx_st_dcrdt_update_i;
logic [2:0]   tx_st_hcrdt_update_i;

logic [2:0]   tx_st_dcrdt_update_sync;
logic [2:0]   tx_st_hcrdt_update_sync;

logic pio_txcrdt_tvalid_long;

logic  [4:0]   pio_txcrdt_tvalid_counter;

logic [21:0]   vecsync_bus_in;
logic [21:0]   vecsync_bus_out;

    always_ff @(posedge Clk_i or negedge pio_rst_Clk_n )
    begin
        if (!pio_rst_Clk_n ) begin
            pio_txcrdt_tvalid_counter <= 4'b0;
        end
        else begin
            if (pio_txcrdt_tvalid) 
                 pio_txcrdt_tvalid_counter <= 4'b1;
            else if (  (pio_txcrdt_tvalid_counter < 4'd15) && (pio_txcrdt_tvalid_counter > 4'd0)  ) 
                 pio_txcrdt_tvalid_counter <= pio_txcrdt_tvalid_counter[3:0]  + 1;
            else 
                 pio_txcrdt_tvalid_counter <= 4'b0;
        end
    end

  assign pio_txcrdt_tvalid_long = pio_txcrdt_tvalid ||  (pio_txcrdt_tvalid_counter > 4'd0);


  always @* begin
    if (pio_txcrdt_tvalid_long == 1) begin
             tx_st_hcrdt_update_i = ( (pio_txcrdt_tdata[18:16]==3'd0) ? 3'b001 : (pio_txcrdt_tdata[18:16]==3'd1) ? 3'b010 : (pio_txcrdt_tdata[18:16]==3'd2) ? 3'b100 :  3'b000) ;
             tx_st_dcrdt_update_i = ( (pio_txcrdt_tdata[18:16]==3'd4) ? 3'b001 : (pio_txcrdt_tdata[18:16]==3'd5) ? 3'b010 : (pio_txcrdt_tdata[18:16]==3'd6) ? 3'b100 :  3'b000) ;
    end
    else begin
             tx_st_hcrdt_update_i = 3'b000;
             tx_st_dcrdt_update_i = 3'b000;
    end
  end

/*
generate for (genvar i=0; i<16; i++) begin : gen_txcrdt_tdata
        intel_std_synchronizer_nocut sync (.clk (pio_clk), .reset_n (pio_rst_n), .din (pio_txcrdt_tdata[i]), .dout (pio_txcrdt_tdata_sync[i]) );
end endgenerate
generate for (genvar i=0; i<3; i++) begin : gen_hcrdt_update
        intel_std_synchronizer_nocut sync (.clk (pio_clk), .reset_n (pio_rst_n), .din (tx_st_hcrdt_update_i[i]), .dout (tx_st_hcrdt_update_sync[i]) );
end endgenerate
generate for (genvar i=0; i<3; i++) begin : gen_dcrdt_update
        intel_std_synchronizer_nocut sync (.clk (pio_clk), .reset_n (pio_rst_n), .din (tx_st_dcrdt_update_i[i]), .dout (tx_st_dcrdt_update_sync[i]) );
end endgenerate
*/

  assign vecsync_bus_in = {pio_txcrdt_tdata[15:0],tx_st_hcrdt_update_i,tx_st_dcrdt_update_i};
  assign {pio_txcrdt_tdata_sync,tx_st_hcrdt_update_sync,tx_st_dcrdt_update_sync} = vecsync_bus_out;


  pciess_vecsync #(
    .DWIDTH    ( 22                     )
  ) u_gen_txcrdt_tdata_sync (
    .wr_clk    ( Clk_i          ), //axi_st_clk
    .wr_rst_n  ( pio_rst_Clk_n      ),
    .rd_clk    ( pio_clk              ), //coreclkout_hip
    .rd_rst_n  ( pio_rst_n        ),
    .data_in   ( vecsync_bus_in ),
    .data_out  ( vecsync_bus_out )
  );


intel_pcie_bam_v2_crdt_intf crdt_intf (
    .clk                                (pio_clk), 
    .rst_n                              (pio_rst_n), 
    .tx_st_dcrdt_update_cnt_i           (pio_txcrdt_tdata_sync[11:0]),
    .tx_st_dcrdt_update_i               (tx_st_dcrdt_update_sync), //3 bits signals, 001=Posted/010=NonPosted/100=CPL DATA
    .tx_st_dcrdt_init_i                 (3'b111),

    .tx_st_hcrdt_update_i     (tx_st_hcrdt_update_sync), //3 bits signals, 001=Posted/010=NonPosted/100=CPL HEADER 
    .tx_st_hcrdt_update_cnt_i (pio_txcrdt_tdata_sync[5:0]),
    .tx_st_hcrdt_init_i       (3'b111   ),
    .tx_st_hcrdt_init_ack_o (),

    .pio_tx_st_ready_i                  (pio_txc_ready_w1),          //     input                     pio_tx_st_ready_i,      
    .bam_tx_signal_ready_o              (pio_txc_ready_w2),          //     intel_pcie_bam_v2    pio   .bam_txc_ready_i                    (pio_txc_ready         ), 
    .tx_hdr_i                           (pio_txc_header[9:0]),       //     intel_pcie_bam_v2    pio   .bam_txc_header_o                   (pio_txc_header[127:0] ), 
    .tx_hdr_valid_i                     (pio_txc_valid)              //     intel_pcie_bam_v2    pio   .bam_txc_valid_o                    (pio_txc_valid         ),        
);

rst_ctrl rst_ctrl (
    .clk_sys                        (Clk_i),                            // Global clock
    .clk_100m                       (outclk_0),                         // Clock 100 MHz
    .pll_locked                     (pio_pll_locked),                    // PLL locked flag
    .pcie_reset_status              (~Rstn_i),                             // PCIe SRC reset status
    .pcie_cold_rst_ack_n            (pio_subsystem_cold_rst_ack_n),      // PCIe cold reset ack (active low)
    .pcie_warm_rst_ack_n            (pio_subsystem_warm_rst_ack_n),      // PCIe warm reset ack (active low),
    .ninit_done                     (ninit_done),                        // FPGA initialization done (active low)
    .rst_n_sys                      (pio_axi_st_areset_n),               // System reset synchronous to clk_sys 
    .rst_n_100m                     (pio_axi_lite_areset_n),             // System reset synchronous to clk_100m
    .pwr_good_n                     (),                                  // Hardware reset synchronous to clk_sys
    .pcie_cold_rst_n                (pio_subsystem_cold_rst_n),          // PCIe cold reset synchronous to clk_sys
    .pcie_warm_rst_n                (pio_subsystem_warm_rst_n),           // PCIe warm reset synchronous to clk_sys

    .subsystem_rst_req              (pio_subsystem_rst_req),                    // Reset entry indication from Central Reset Sequencer block in SOC
    .subsystem_rst_rdy              (pio_subsystem_rst_rdy),                    // Ready for reset entry indication from Subsystem to Central Reset Sequencer block
    .initiate_warmrst_req           (pio_initiate_warmrst_req),                 //Reset entry required indication from SIP SRC block to Central Reset Sequencer
    .initiate_rst_req_rdy           (pio_initiate_rst_req_rdy)                  //Indicates Central Reset Sequencer block has accepted initiation request and will start issuing resets

);

endmodule


