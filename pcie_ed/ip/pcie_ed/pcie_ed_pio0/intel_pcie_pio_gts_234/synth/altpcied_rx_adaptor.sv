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


// (C) 2001-2020 Intel Corporation. All rights reserved.
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

module altpcied_rx_adaptor
#(
  parameter device_family             = "Stratix 10",
  parameter TILE                      = "P-TILE",
  parameter pcie_link_width           = "x16",
  parameter Header_Packing_scheme     = "Simple",
  parameter axi_st_support_mode       = "Single Stream",
  parameter payload_width             = 512,
  parameter hdr_width                 = 256,
  parameter pfx_width                 = 64,
  parameter double_width              = 2,
  parameter empty_width               = 6,
  parameter DWIDTH                    = 512,
  parameter SS_SLOT_WD                = 5,
  parameter SEGMENT_SIZE              = 16,
  parameter avst_fifo_awidth          = 6,
  parameter axi_fifo_awidth           = 4,
  parameter PERFMON_EN                = 0,
  parameter BP_DEBUG_MON_EN           = 0
)(
  //clock and reset
  input                                 coreclkout_hip,
  input                                 axi_st_clk,
  input                                 axi_lite_clk,
  input                                 warm_rst_n,
  input                                 axi_st_areset_n,
  input                                 axi_lite_areset_n,
  input                                 subsystem_rst_req,
  output                                rx_rst_rdy,

  //AVST RX from QHIP
  input [double_width-1:0]              rx_st_sop_i,
  input [double_width-1:0]              rx_st_eop_i,
  input [double_width-1:0]              rx_st_valid_i,
  input [empty_width-1:0]               rx_st_empty_i,
  input [double_width-1:0]              rx_st_vf_active_i,
  input [(3*double_width)-1:0]          rx_st_func_num_i,
  input [(11*double_width)-1:0]         rx_st_vf_num_i,
  input [(3*double_width)-1:0]          rx_st_bar_range_i,
  input [pfx_width-1:0]                 rx_st_tlp_prfx_i,
  input [pfx_width/8-1:0]               rx_st_tlp_prfx_par_i,
  input [hdr_width-1:0]                 rx_st_hdr_i,
  input [hdr_width/8-1:0]               rx_st_hdr_par_i,
  input [payload_width-1:0]             rx_st_data_i,
  input [payload_width/8-1:0]           rx_st_data_par_i,
  input [SS_SLOT_WD-1:0]                rx_st_slot_num_i,
  output                                rx_st_ready_o,

  //AXI ST RX to APP
  input                                 app_ss_st_rx_tready,
  output                                ss_app_st_rx_tvalid,
  output                                ss_app_st_rx_tlast,
  output [DWIDTH/8-1:0]                 ss_app_st_rx_par_chk,
  output [DWIDTH/8-1:0]                 ss_app_st_rx_tkeep,
  output [DWIDTH-1:0]                   ss_app_st_rx_tdata,
  output [7:0]                          ss_app_st_rx_tuser,
  output [1:0]                          ss_app_st_rx_tuser_vendor,

  // Back Pressure cycle
  output                                we_HIA_RX_BP_CYCLES_count,
  output [30:0]                         HIA_RX_BP_CYCLES_count,
  input                                 HIA_RX_BP_CYCLES_count_clear,
  output                                HIA_RX_BP_CYCLES_overflow,
  input                                 HIA_RX_BP_CYCLES_overflow_clear,

  output                                we_DM_RX_BP_CYCLES_count,
  output [30:0]                         DM_RX_BP_CYCLES_count,
  input                                 DM_RX_BP_CYCLES_count_clear,
  output                                DM_RX_BP_CYCLES_overflow,
  input                                 DM_RX_BP_CYCLES_overflow_clear,

  // Performance monitoring
  input                                 PERFMON_CTRL_global_enable,
  input                                 PERFMON_CTRL_clear_counters,

  output                                we_RX_MRD_TLP_num,
  output [31:0]                         RX_MRD_TLP_num,
  input                                 RX_MRD_TLP_num_clear,

  output                                we_RX_MWR_TLP_num,
  output [31:0]                         RX_MWR_TLP_num,
  input                                 RX_MWR_TLP_num_clear,

  output                                we_RX_MSG_TLP_num,
  output [31:0]                         RX_MSG_TLP_num,
  input                                 RX_MSG_TLP_num_clear,

  output                                we_RX_CFGWR_TLP_num,
  output [31:0]                         RX_CFGWR_TLP_num,
  input                                 RX_CFGWR_TLP_num_clear,

  output                                we_RX_CFGRD_TLP_num,
  output [31:0]                         RX_CFGRD_TLP_num,
  input                                 RX_CFGRD_TLP_num_clear,

  output                                we_RX_MEM_DATA_byte,
  output [31:0]                         RX_MEM_DATA_byte,
  input                                 RX_MEM_DATA_byte_clear,

  output                                we_RX_CPL_DATA_byte,
  output [31:0]                         RX_CPL_DATA_byte,
  input                                 RX_CPL_DATA_byte_clear,

  //For HIA CSR HIP Status Register
  output                                rx_adaptor_dcfifo_full_o
);

  localparam rx_tkeep_width        = (payload_width == 128) ? 16 : 32;
  localparam rx_tdata_width        = 1024;
  localparam avst_fifo_almost_full = 2**avst_fifo_awidth-27-1;
  localparam avst_fifo_dwidth      = 21*double_width + empty_width + pfx_width + pfx_width/8 + hdr_width + hdr_width/8 + payload_width + payload_width/8 + SS_SLOT_WD;
  localparam avst_pipe0_dwidth     = avst_fifo_dwidth;
  localparam avst_pipe1a_dwidth    = 3*double_width;
  localparam avst_pipe1b_dwidth    = 18*double_width + 2*rx_tkeep_width + pfx_width + pfx_width/8 + hdr_width + hdr_width/8 + payload_width + payload_width/8 + SS_SLOT_WD;
  localparam avst_pipe2a_dwidth    = 36;
  localparam avst_pipe2b_dwidth    = 2*rx_tkeep_width + 512 + pfx_width/8 + hdr_width/8 + payload_width/8 + payload_width;
  localparam avst_pipe3a_dwidth    = 77;
  localparam avst_pipe3b_dwidth    = 2*rx_tkeep_width + 512 + pfx_width/8 + hdr_width/8 + payload_width/8 + payload_width;
  localparam avst_pipe4_dwidth     = (Header_Packing_scheme == "Simple") ?
                                       ((payload_width == 512) ? (3 + rx_tdata_width + 512 + 2*(rx_tdata_width/8) + 128 + 8 + 4) :
                                                                 (3 + rx_tdata_width +       2*(rx_tdata_width/8) +       8)) :
                                       ((payload_width == 512) ? (3 + rx_tdata_width + 768 + 2*(rx_tdata_width/8) + 192 + 8 + 6) :
                                                                 (3 + rx_tdata_width + 256 + 2*(rx_tdata_width/8) + 64  + 8 + 2) );

  localparam avst_pipe5_dwidth     = rx_tdata_width + 2*(rx_tdata_width/8) + 8 + 4;
  localparam avst_pipe6_dwidth     = rx_tdata_width + 2*(rx_tdata_width/8) + 8 + 4;
  localparam axi_fifo_dwidth       = rx_tdata_width + 2*(rx_tdata_width/8) + 8 + 4;
  localparam axi_pipe0_dwidth      = rx_tdata_width + 2*(rx_tdata_width/8) + 8 + 4;
  localparam axi_pipe1_dwidth      = 1 + 8 + 2*(DWIDTH/8) + DWIDTH;

  //Reset
  wire                                       warm_rst_coreclk_n;
  wire                                       warm_rst_coreclk2_n;
  wire                                       warm_rst_coreclk3_n;
  wire                                       warm_rst_coreclk4_n;
  wire                                       warm_rst_stclk_n;
  wire                                       warm_rst_liteclk_n;
  altera_std_synchronizer u_warm_rst_coreclk_n_sync
  (
    .clk      ( coreclkout_hip          ),
    .reset_n  ( warm_rst_n              ),
    .din      ( 1'b1                    ),
    .dout     ( warm_rst_coreclk_n      )
  );

  altera_std_synchronizer u_warm_rst_coreclk2_n_sync
  (
    .clk      ( coreclkout_hip          ),
    .reset_n  ( warm_rst_n              ),
    .din      ( 1'b1                    ),
    .dout     ( warm_rst_coreclk2_n      )
  );

  altera_std_synchronizer u_warm_rst_coreclk3_n_sync
  (
    .clk      ( coreclkout_hip          ),
    .reset_n  ( warm_rst_n              ),
    .din      ( 1'b1                    ),
    .dout     ( warm_rst_coreclk3_n      )
  );

  altera_std_synchronizer u_warm_rst_coreclk4_n_sync
  (
    .clk      ( coreclkout_hip          ),
    .reset_n  ( warm_rst_n              ),
    .din      ( 1'b1                    ),
    .dout     ( warm_rst_coreclk4_n      )
  );

  altera_std_synchronizer u_warm_rst_stclk_n_sync
  (
    .clk      ( axi_st_clk              ),
    .reset_n  ( warm_rst_n              ),
    .din      ( 1'b1                    ),
    .dout     ( warm_rst_stclk_n        )
  );

  altera_std_synchronizer u_warm_rst_liteclk_n_sync
  (
    .clk      ( axi_lite_clk            ),
    .reset_n  ( warm_rst_n              ),
    .din      ( 1'b1                    ),
    .dout     ( warm_rst_liteclk_n      )
  );
  assign rx_rst_rdy = subsystem_rst_req;


  //AVST RX FIFO
  wire [avst_fifo_dwidth-1:0]                avst_rx_fifo_data;
  wire                                       avst_rx_fifo_wrreq;
  wire                                       avst_rx_fifo_empty;
  wire                                       avst_rx_fifo_rdreq;
  wire                                       avst_rx_fifo_full;
  wire                                       avst_rx_fifo_almost_full;
  wire                                       avst_rx_fifo_ready;
  reg                                        avst_rx_fifo_valid;
  wire [avst_fifo_dwidth-1:0]                avst_rx_fifo_q;
  reg                                        avst_rx_pipe0_ready;
  wire                                       avst_rx_pipe0_valid;
  wire [avst_pipe0_dwidth-1:0]               avst_rx_pipe0_out_data;
  wire [double_width-1:0]                    rx_st_sop_pipe0;
  wire [double_width-1:0]                    rx_st_eop_pipe0;
  wire [double_width-1:0]                    rx_st_valid_pipe0;
  wire [empty_width-1:0]                     rx_st_empty_pipe0;
  wire [double_width-1:0]                    rx_st_vf_active_pipe0;
  wire [(3*double_width)-1:0]                rx_st_func_num_pipe0;
  wire [(11*double_width)-1:0]               rx_st_vf_num_pipe0;
  wire [(3*double_width)-1:0]                rx_st_bar_range_pipe0;
  wire [pfx_width-1:0]                       rx_st_tlp_prfx_pipe0;
  wire [pfx_width/8-1:0]                     rx_st_tlp_prfx_par_pipe0;
  wire [hdr_width-1:0]                       rx_st_hdr_pipe0;
  wire [hdr_width/8-1:0]                     rx_st_hdr_par_pipe0;
  wire [payload_width-1:0]                   rx_st_data_pipe0;
  wire [payload_width/8-1:0]                 rx_st_data_par_pipe0;
  wire [SS_SLOT_WD-1:0]                      rx_st_slot_num_pipe0;

  wire                                       avst_fifo_in_valid;
  wire [avst_fifo_dwidth-1:0]                avst_fifo_in_data;
  wire                                       avst_fifo_out_valid;

  //Data pipeline
  pciess_data_pipeline #(
    .PIPELINE_READY           ( 0                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( avst_fifo_dwidth          )
  ) u_avst_fifo_pipeline (
    .clk                      ( coreclkout_hip            ),
    .reset                    ( ~warm_rst_coreclk_n       ),
    .in_ready                 (                           ),
    .in_valid                 ( avst_fifo_in_valid        ),
    .in_data                  ( avst_fifo_in_data         ),
    .out_ready                ( 1'b1                      ),
    .out_valid                ( avst_fifo_out_valid       ),
    .out_data                 ( avst_rx_fifo_data         )
  );

  assign avst_fifo_in_valid    = |rx_st_valid_i;
  assign avst_fifo_in_data     = {rx_st_sop_i, rx_st_eop_i, rx_st_valid_i, rx_st_empty_i,
                                  rx_st_vf_active_i, rx_st_func_num_i, rx_st_vf_num_i, rx_st_bar_range_i,
                                  rx_st_tlp_prfx_i, rx_st_tlp_prfx_par_i, rx_st_hdr_i, rx_st_hdr_par_i,
                                  rx_st_data_i, rx_st_data_par_i, rx_st_slot_num_i};

  assign rx_st_ready_o         = ~avst_rx_fifo_almost_full;
  assign avst_rx_fifo_wrreq    = avst_fifo_out_valid & ~avst_rx_fifo_full;
  assign avst_rx_fifo_rdreq    = ~avst_rx_fifo_empty & avst_rx_fifo_ready;

  scfifo #(
    .lpm_width                ( avst_fifo_dwidth          ),
    .lpm_widthu               ( avst_fifo_awidth          ),
    .lpm_numwords             ( 2**avst_fifo_awidth       ),
    .overflow_checking        ( "OFF"                     ),
    .underflow_checking       ( "OFF"                     ),
    .use_eab                  ( "ON"                      ),
    .almost_full_value        ( avst_fifo_almost_full     ),
    .ram_block_type           ( "M20K"                    ),
    .intended_device_family   (device_family		  )
  ) u_avst_rx_fifo (
    .data                     ( avst_rx_fifo_data         ),
    .clock                    ( coreclkout_hip            ),
    .wrreq                    ( avst_rx_fifo_wrreq        ),
    .rdreq                    ( avst_rx_fifo_rdreq        ),
    .aclr                     ( 1'b0                      ),
    .sclr                     ( ~warm_rst_coreclk2_n      ),
    .q                        ( avst_rx_fifo_q            ),
    .eccstatus                (                           ),
    .usedw                    (                           ),
    .full                     ( avst_rx_fifo_full         ),
    .empty                    ( avst_rx_fifo_empty        ),
    .almost_full              ( avst_rx_fifo_almost_full  ),
    .almost_empty             (                           )
  );

  always@(posedge coreclkout_hip or negedge warm_rst_coreclk2_n) begin
    if(!warm_rst_coreclk2_n)
      avst_rx_fifo_valid              <= 1'b0;
    else if(avst_rx_fifo_ready)
      avst_rx_fifo_valid              <= avst_rx_fifo_rdreq;
  end


  //Data pipeline 0
//  pciess_data_pipeline #(
//    .PIPELINE_READY           ( 1                         ),
//    .SYNC_RESET               ( 0                         ),
//    .DATA_WIDTH               ( avst_pipe0_dwidth         )
//  ) u_avst_rx_pipeline_0 (
//    .clk                      ( coreclkout_hip            ),
//    .reset                    ( ~warm_rst_coreclk_n       ),
//    .in_ready                 ( avst_rx_fifo_ready        ),
//    .in_valid                 ( avst_rx_fifo_valid        ),
//    .in_data                  ( avst_rx_fifo_q            ),
//    .out_ready                ( avst_rx_pipe0_ready       ),
//    .out_valid                ( avst_rx_pipe0_valid       ),
//    .out_data                 ( avst_rx_pipe0_out_data    )
//  );

  assign avst_rx_fifo_ready     = avst_rx_pipe0_ready;
  assign avst_rx_pipe0_valid    = avst_rx_fifo_valid;
  assign avst_rx_pipe0_out_data = avst_rx_fifo_q;

  assign {rx_st_sop_pipe0, rx_st_eop_pipe0, rx_st_valid_pipe0, rx_st_empty_pipe0, 
          rx_st_vf_active_pipe0, rx_st_func_num_pipe0, rx_st_vf_num_pipe0, rx_st_bar_range_pipe0,
          rx_st_tlp_prfx_pipe0, rx_st_tlp_prfx_par_pipe0, rx_st_hdr_pipe0, rx_st_hdr_par_pipe0,
          rx_st_data_pipe0, rx_st_data_par_pipe0, rx_st_slot_num_pipe0} = avst_rx_pipe0_out_data;


  //Parity Checker
  wire [pfx_width/8-1:0]                     rx_st_tlp_prfx_par_chk_pipe0;
  wire [hdr_width/8-1:0]                     rx_st_hdr_par_chk_pipe0;
  wire [payload_width/8-1:0]                 rx_st_data_par_chk_pipe0;
  wire [pfx_width/8-1:0]                     rx_st_tlp_prfx_par_chk_pipe1;
  wire [hdr_width/8-1:0]                     rx_st_hdr_par_chk_pipe1;
  wire [payload_width/8-1:0]                 rx_st_data_par_chk_pipe1;
  wire [pfx_width/8-1:0]                     rx_st_tlp_prfx_par_chk_pipe2;
  wire [hdr_width/8-1:0]                     rx_st_hdr_par_chk_pipe2;
  wire [payload_width/8-1:0]                 rx_st_data_par_chk_pipe2;
  genvar tlp_prfx_par_chk_count;
  genvar hdr_segment_count, hdr_arrange_mapping, hdr_par_chk_count;
  genvar data_par_chk_count;
  generate
    for(tlp_prfx_par_chk_count=0; tlp_prfx_par_chk_count<(4*double_width); tlp_prfx_par_chk_count=tlp_prfx_par_chk_count+1) begin : TLP_prefix_parity_checker
      assign rx_st_tlp_prfx_par_chk_pipe0[tlp_prfx_par_chk_count]
        = (^rx_st_tlp_prfx_pipe0[tlp_prfx_par_chk_count*8+:8]) ^ rx_st_tlp_prfx_par_pipe0[tlp_prfx_par_chk_count];
    end

    for(hdr_segment_count=0; hdr_segment_count<double_width; hdr_segment_count=hdr_segment_count+1) begin : header_segment
      for(hdr_arrange_mapping=0; hdr_arrange_mapping<4; hdr_arrange_mapping=hdr_arrange_mapping+1) begin : header_arrange_mapping
        for(hdr_par_chk_count=0; hdr_par_chk_count<4; hdr_par_chk_count=hdr_par_chk_count+1) begin : header_parity_checker
          assign rx_st_hdr_par_chk_pipe0[hdr_segment_count*16+(3-hdr_arrange_mapping)*4+hdr_par_chk_count]
            = (^rx_st_hdr_pipe0[(hdr_segment_count*16+hdr_arrange_mapping*4+hdr_par_chk_count)*8+:8])
               ^rx_st_hdr_par_pipe0[hdr_segment_count*16+hdr_arrange_mapping*4+hdr_par_chk_count];
        end
      end
    end

    for(data_par_chk_count=0; data_par_chk_count<(payload_width/8); data_par_chk_count=data_par_chk_count+1) begin : data_parity_checker
      assign rx_st_data_par_chk_pipe0[data_par_chk_count]
        = (^rx_st_data_pipe0[data_par_chk_count*8+:8]) ^ rx_st_data_par_pipe0[data_par_chk_count];
    end
  endgenerate


  //RX TKEEP Decode
  reg [rx_tkeep_width-1:0]                  rx_st_tkeep_s0_pipe0, rx_st_tkeep_s1_pipe0;
  wire [rx_tkeep_width-1:0]                  rx_st_tkeep_s0_pipe1, rx_st_tkeep_s1_pipe1;
  wire [rx_tkeep_width-1:0]                  rx_st_tkeep_s0_pipe2, rx_st_tkeep_s1_pipe2;

  generate if( hdr_width == 256 ) begin:GEN_TKEEP
    always @(*) begin
    //For x16, x8
      if( (rx_st_hdr_pipe0[hdr_width/2-1:126] == 2'b00) && (rx_st_eop_pipe0[0] == 1'b1) ) begin
        rx_st_tkeep_s0_pipe0 = {rx_tkeep_width{1'b0}};

      end
      else begin
        rx_st_tkeep_s0_pipe0 = (double_width == 2) ? (~rx_st_eop_pipe0[0] ? {rx_tkeep_width{1'b1}} : {rx_tkeep_width{1'b1}} >> (rx_st_empty_pipe0[empty_width/2-1:0]*4)) :
                                                     (~rx_st_eop_pipe0[0] ? {rx_tkeep_width{1'b1}} : {rx_tkeep_width{1'b1}} >> (rx_st_empty_pipe0[empty_width-1:0]*4));

      end

      if( (rx_st_hdr_pipe0[hdr_width-1:254] == 2'b00) && (rx_st_eop_pipe0[double_width-1] == 1'b1)  ) begin
        rx_st_tkeep_s1_pipe0 = {rx_tkeep_width{1'b0}};

      end
      else begin
        rx_st_tkeep_s1_pipe0 = (double_width == 2) ? (~rx_st_eop_pipe0[double_width-1] ? {rx_tkeep_width{1'b1}} : {rx_tkeep_width{1'b1}} >> (rx_st_empty_pipe0[empty_width-1:empty_width/2]*4)) :
                                                                                         {rx_tkeep_width{1'b0}};

      end
    end

  end else begin
    always @(*) begin
      //For x16, x8, x4
      if( (rx_st_hdr_pipe0[hdr_width-1:126] == 2'b00) && (rx_st_eop_pipe0[0] == 1'b1) ) begin
        rx_st_tkeep_s0_pipe0 = {rx_tkeep_width{1'b0}};
        rx_st_tkeep_s1_pipe0 = {rx_tkeep_width{1'b0}};

      end
      else begin
        rx_st_tkeep_s0_pipe0 = (double_width == 2) ? (~rx_st_eop_pipe0[0] ? {rx_tkeep_width{1'b1}} : {rx_tkeep_width{1'b1}} >> (rx_st_empty_pipe0[empty_width/2-1:0]*4)) :
                                                     (~rx_st_eop_pipe0[0] ? {rx_tkeep_width{1'b1}} : {rx_tkeep_width{1'b1}} >> (rx_st_empty_pipe0[empty_width-1:0]*4));
        rx_st_tkeep_s1_pipe0 = (double_width == 2) ? (~rx_st_eop_pipe0[double_width-1] ? {rx_tkeep_width{1'b1}} : {rx_tkeep_width{1'b1}} >> (rx_st_empty_pipe0[empty_width-1:empty_width/2]*4)) :
                                                                                         {rx_tkeep_width{1'b0}};

      end
    end
  end 
  endgenerate

  //Data Pipeline 1
  wire [avst_pipe1a_dwidth-1:0]              avst_rx_pipe0a_in_data;
  reg                                        avst_rx_pipe1a_ready;
  wire                                       avst_rx_pipe1a_valid;
  wire [avst_pipe1a_dwidth-1:0]              avst_rx_pipe1a_out_data;
  wire [avst_pipe1b_dwidth-1:0]              avst_rx_pipe0b_in_data;
  reg                                        avst_rx_pipe1b_ready;
  wire                                       avst_rx_pipe1b_valid;
  wire [avst_pipe1b_dwidth-1:0]              avst_rx_pipe1b_out_data;

  wire [double_width-1:0]                    rx_st_sop_pipe1;
  wire [double_width-1:0]                    rx_st_eop_pipe1;
  wire [double_width-1:0]                    rx_st_valid_pipe1;
  wire [double_width-1:0]                    rx_st_vf_active_pipe1;
  wire [(3*double_width)-1:0]                rx_st_func_num_pipe1;
  wire [(11*double_width)-1:0]               rx_st_vf_num_pipe1;
  wire [(3*double_width)-1:0]                rx_st_bar_range_pipe1;
  wire [pfx_width-1:0]                       rx_st_tlp_prfx_pipe1;
  wire [hdr_width-1:0]                       rx_st_hdr_pipe1;
  wire [payload_width-1:0]                   rx_st_data_pipe1;
  wire [SS_SLOT_WD-1:0]                      rx_st_slot_num_pipe1;

  pciess_data_pipeline #(
    .PIPELINE_READY           ( 1                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( avst_pipe1a_dwidth         )
  ) u_avst_rx_pipeline_1a (
    .clk                      ( coreclkout_hip            ),
    .reset                    ( ~warm_rst_coreclk3_n      ),
    .in_ready                 ( avst_rx_pipe0_ready       ),
    .in_valid                 ( avst_rx_pipe0_valid       ),
    .in_data                  ( avst_rx_pipe0a_in_data    ),
    .out_ready                ( avst_rx_pipe1a_ready      ),
    .out_valid                ( avst_rx_pipe1a_valid      ),
    .out_data                 ( avst_rx_pipe1a_out_data   )
  );

  assign avst_rx_pipe0a_in_data = {rx_st_sop_pipe0, rx_st_eop_pipe0, rx_st_valid_pipe0};

  assign {rx_st_sop_pipe1, rx_st_eop_pipe1, rx_st_valid_pipe1}
        = avst_rx_pipe1a_valid ? avst_rx_pipe1a_out_data : {avst_pipe1a_dwidth{1'b0}};


  pciess_data_pipeline #(
    .PIPELINE_READY           ( 1                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( avst_pipe1b_dwidth        )
  ) u_avst_rx_pipeline_1b (
    .clk                      ( coreclkout_hip            ),
    .reset                    ( ~warm_rst_coreclk3_n      ),
    .in_ready                 (                           ),
    .in_valid                 ( avst_rx_pipe0_valid       ),
    .in_data                  ( avst_rx_pipe0b_in_data    ),
    .out_ready                ( avst_rx_pipe1b_ready      ),
    .out_valid                ( avst_rx_pipe1b_valid      ),
    .out_data                 ( avst_rx_pipe1b_out_data   )
  );

  assign avst_rx_pipe0b_in_data = {rx_st_tkeep_s1_pipe0, rx_st_tkeep_s0_pipe0,
                                   rx_st_vf_active_pipe0, rx_st_func_num_pipe0, rx_st_vf_num_pipe0, rx_st_bar_range_pipe0,
                                   rx_st_tlp_prfx_pipe0, rx_st_tlp_prfx_par_chk_pipe0, rx_st_hdr_pipe0, rx_st_hdr_par_chk_pipe0,
                                   rx_st_data_pipe0, rx_st_data_par_chk_pipe0, rx_st_slot_num_pipe0};

  assign {rx_st_tkeep_s1_pipe1, rx_st_tkeep_s0_pipe1,
          rx_st_vf_active_pipe1, rx_st_func_num_pipe1, rx_st_vf_num_pipe1, rx_st_bar_range_pipe1,
          rx_st_tlp_prfx_pipe1, rx_st_tlp_prfx_par_chk_pipe1, rx_st_hdr_pipe1, rx_st_hdr_par_chk_pipe1,
          rx_st_data_pipe1, rx_st_data_par_chk_pipe1, rx_st_slot_num_pipe1}
        = avst_rx_pipe1b_valid ? avst_rx_pipe1b_out_data : {avst_pipe1b_dwidth{1'b0}};

  //RX SOP, EOP, VALID Decoding
  wire [1:0]  rx_st_sop_pipe1_mode;
  wire [1:0]  rx_st_eop_pipe1_mode;
  wire [1:0]  rx_st_valid_pipe1_mode;
  wire [2:0]  s0_hdr_valid_pipe1;
  wire [2:0]  s0_hdr_shift_pipe1;
  wire [2:0]  s0_data_valid_pipe1;
  wire [2:0]  s0_data_shift_pipe1;
  wire [2:0]  s1_hdr_valid_pipe1;
  wire [2:0]  s1_hdr_shift_pipe1;
  wire [2:0]  s1_data_valid_pipe1;
  wire [3:0]  s1_data_shift_pipe1;     //Fix lint warning
  reg  [3:0]  tuser1_pipe1;            //Fix lint warning
  reg  [2:0]  tuser2_pipe1;
  wire [1:0]  fifo_halt_pipe1;
  wire        WriteIntoFIFO_pipe1;
  wire [4:0]  NumOf16bInBuffer_pipe1;  //Fix lint warning

  assign rx_st_sop_pipe1_mode    = {{(2-double_width){1'b0}},rx_st_sop_pipe1} & {{(2-double_width){1'b0}},rx_st_valid_pipe1};
  assign rx_st_eop_pipe1_mode    = {{(2-double_width){1'b0}},rx_st_eop_pipe1} & {{(2-double_width){1'b0}},rx_st_valid_pipe1};
  assign rx_st_valid_pipe1_mode  = {{(2-double_width){1'b0}},rx_st_valid_pipe1};

  generate
    if(Header_Packing_scheme == "Simple" && payload_width == 512) begin

      assign s0_hdr_valid_pipe1     = rx_st_sop_pipe1_mode[0];
      assign s0_hdr_shift_pipe1     = 3'b000;
      assign s0_data_valid_pipe1    = rx_st_valid_pipe1_mode[0];
      assign s0_data_shift_pipe1    = rx_st_sop_pipe1_mode[0] * 2;

      assign s1_hdr_valid_pipe1     = (rx_st_eop_pipe1_mode[0] + 1) * rx_st_sop_pipe1_mode[1];
      assign s1_hdr_shift_pipe1     = 3'b000;
      assign s1_data_valid_pipe1    = rx_st_valid_pipe1_mode[1] + rx_st_eop_pipe1_mode[0] * rx_st_sop_pipe1_mode[1];
      assign s1_data_shift_pipe1    = rx_st_sop_pipe1_mode[1] * rx_st_valid_pipe1_mode[1] ? 2 :
                                      (rx_st_sop_pipe1_mode[0] + 1) * (&rx_st_valid_pipe1_mode) * 2;

      always @(*) begin
        if ((DWIDTH == 1024) || (DWIDTH == 512)) begin
          tuser1_pipe1         = rx_st_eop_pipe1_mode[0] ? (|s0_hdr_valid_pipe1 + |s0_data_valid_pipe1) * 2 :
                                 rx_st_eop_pipe1_mode[1] ? (|s0_hdr_valid_pipe1 + |s0_data_valid_pipe1 + |s1_data_valid_pipe1) * 2 :  4'b0;
        end // (DWIDTH == 1024) || (DWIDTH == 512)
        else if(DWIDTH == 256) begin
          if( rx_st_eop_pipe1_mode[0] == 1'b1 ) begin
            if( rx_st_hdr_pipe1[127:126] == 2'b00 ) begin
              tuser1_pipe1 = (|s0_hdr_valid_pipe1) * 2;

            end
            else begin
              tuser1_pipe1 = (|s0_hdr_valid_pipe1 + |s0_data_valid_pipe1) * 2;
              
            end

          end // rx_st_eop_pipe1_mode[1] == 1'b1
          else begin
            if( rx_st_eop_pipe1_mode[1] == 1'b1 ) begin
              if( rx_st_hdr_pipe1[255:254] == 2'b00 ) begin
                tuser1_pipe1 = (|s1_hdr_valid_pipe1) * 2;

              end
              else begin
                tuser1_pipe1 = (|s0_hdr_valid_pipe1 + |s0_data_valid_pipe1 + |s1_hdr_valid_pipe1 + |s1_data_valid_pipe1) * 2;

              end
              
            end
            else begin
              tuser1_pipe1 = 4'b0;

            end // rx_st_eop_pipe1_mode[1] == 1'b0
          end // rx_st_eop_pipe1_mode[1] == 1'b0
        end // DWIDTH == 256

        if(rx_st_hdr_pipe1[255:254] == 2'b00) begin
          tuser2_pipe1           = fifo_halt_pipe1[0] ? ( |s1_hdr_valid_pipe1 ) * 2 :  3'b0;

        end
        else begin
          tuser2_pipe1           = fifo_halt_pipe1[0] ? (|s1_hdr_valid_pipe1 + |s1_data_valid_pipe1) * 2 :  3'b0;

        end
      end //always

      assign fifo_halt_pipe1        = (&rx_st_eop_pipe1_mode);
      assign WriteIntoFIFO_pipe1    = (|rx_st_eop_pipe1_mode);
      assign NumOf16bInBuffer_pipe1 = rx_st_eop_pipe1_mode[0] ? (|s1_hdr_valid_pipe1 + | s1_data_valid_pipe1) * 2 :
                                      (|s0_hdr_valid_pipe1 + |s1_hdr_valid_pipe1 + |s0_data_valid_pipe1 + |s1_data_valid_pipe1) * 2;

    end else begin// if(Header_Packing_scheme == "Simple")

      assign s0_hdr_valid_pipe1     = rx_st_sop_pipe1_mode[0];
      assign s0_hdr_shift_pipe1     = 3'b000;
      assign s0_data_valid_pipe1    = rx_st_valid_pipe1_mode[0];
      assign s0_data_shift_pipe1    = rx_st_sop_pipe1_mode[0] * 2;

      assign s1_hdr_valid_pipe1     = (rx_st_eop_pipe1_mode[0] + 1) * rx_st_sop_pipe1_mode[1];
      assign s1_hdr_shift_pipe1     = 3'b000;
      assign s1_data_valid_pipe1    = rx_st_valid_pipe1_mode[1] + rx_st_eop_pipe1_mode[0] * rx_st_sop_pipe1_mode[1];
      assign s1_data_shift_pipe1    = rx_st_sop_pipe1_mode[1] * rx_st_valid_pipe1_mode[1] ? 2 :
                                      (rx_st_sop_pipe1_mode[0] + 1) * (&rx_st_valid_pipe1_mode) * 2;

      always @(*) begin
        if ((DWIDTH == 1024) || (DWIDTH == 512)) begin
          tuser1_pipe1         = rx_st_eop_pipe1_mode[0] ? (|s0_hdr_valid_pipe1 + |s0_data_valid_pipe1) * 2 :
                                 rx_st_eop_pipe1_mode[1] ? (|s0_hdr_valid_pipe1 + |s0_data_valid_pipe1 + |s1_data_valid_pipe1) * 2 :  4'b0;
        end // (DWIDTH == 1024) || (DWIDTH == 512)
        else if(DWIDTH == 256) begin
          if( rx_st_eop_pipe1_mode[0] == 1'b1 ) begin
            if( rx_st_hdr_pipe1[127:126] == 2'b00 ) begin
              tuser1_pipe1 = (|s0_hdr_valid_pipe1) * 2;

            end
            else begin
              tuser1_pipe1 = (|s0_hdr_valid_pipe1 + |s0_data_valid_pipe1) * 2;
              
            end

          end // rx_st_eop_pipe1_mode[1] == 1'b1
          else begin
            if( rx_st_eop_pipe1_mode[1] == 1'b1 ) begin
              if( rx_st_hdr_pipe1[127:126] == 2'b00 ) begin
                tuser1_pipe1 = (|s1_hdr_valid_pipe1) * 2;

              end
              else begin
                tuser1_pipe1 = (|s0_hdr_valid_pipe1 + |s0_data_valid_pipe1 + |s1_hdr_valid_pipe1 + |s1_data_valid_pipe1) * 2;

              end
              
            end
            else begin
              tuser1_pipe1 = 4'b0;

            end // rx_st_eop_pipe1_mode[1] == 1'b0
          end // rx_st_eop_pipe1_mode[1] == 1'b0
        end // DWIDTH == 256

        if(rx_st_hdr_pipe1[127:126] == 2'b00) begin
          tuser2_pipe1           = fifo_halt_pipe1[0] ? ( |s1_hdr_valid_pipe1 ) * 2 :  3'b0;

        end
        else begin
          tuser2_pipe1           = fifo_halt_pipe1[0] ? (|s1_hdr_valid_pipe1 + |s1_data_valid_pipe1) * 2 :  3'b0;

        end
      end //always

      assign fifo_halt_pipe1        = (&rx_st_eop_pipe1_mode);
      assign WriteIntoFIFO_pipe1    = (|rx_st_eop_pipe1_mode);
      assign NumOf16bInBuffer_pipe1 = rx_st_eop_pipe1_mode[0] ? (|s1_hdr_valid_pipe1 + | s1_data_valid_pipe1) * 2 :
                                      (|s0_hdr_valid_pipe1 + |s1_hdr_valid_pipe1 + |s0_data_valid_pipe1 + |s1_data_valid_pipe1) * 2;
    end      
  endgenerate

  //RX Header Processor
  wire [127:0]                               rx_st_hdr_arrange_s0_pipe1, rx_st_hdr_arrange_s1_pipe1;
  wire [255:0]                               rx_st_hdr_build_s0_pipe1,   rx_st_hdr_build_s1_pipe1;
  wire [255:0]                               rx_st_hdr_build_s0_pipe2,   rx_st_hdr_build_s1_pipe2;
  genvar hdr_byte_count;
  generate
    if(payload_width == 512) begin

      wire [127:0]                           rx_st_hdr_s0_pipe1, rx_st_hdr_s1_pipe1;

      //if(TILE == "P-TILE"|| TILE == "F-TILE") begin

        //RX Header Arranger
        assign rx_st_hdr_s0_pipe1 = rx_st_hdr_pipe1[127:0];
        assign rx_st_hdr_s1_pipe1 = rx_st_hdr_pipe1[255:128];
        for(hdr_byte_count=0; hdr_byte_count<4; hdr_byte_count=hdr_byte_count+1) begin : RX_header_arranger
          assign rx_st_hdr_arrange_s0_pipe1[hdr_byte_count*32+:32] = rx_st_hdr_s0_pipe1[(3-hdr_byte_count)*32+:32];
          assign rx_st_hdr_arrange_s1_pipe1[hdr_byte_count*32+:32] = rx_st_hdr_s1_pipe1[(3-hdr_byte_count)*32+:32];
        end

        //RX Header Builder
        assign rx_st_hdr_build_s0_pipe1[127:0]   = rx_st_hdr_arrange_s0_pipe1;
        assign rx_st_hdr_build_s0_pipe1[156:128] = (rx_st_tlp_prfx_pipe1[31:29] == 3'b100) ? rx_st_tlp_prfx_pipe1[28:0] : 29'b0;
        assign rx_st_hdr_build_s0_pipe1[157]     = (rx_st_tlp_prfx_pipe1[31:29] == 3'b100);
        assign rx_st_hdr_build_s0_pipe1[159:158] = 2'b0;
        assign rx_st_hdr_build_s0_pipe1[162:160] = rx_st_func_num_pipe1[2:0];
        assign rx_st_hdr_build_s0_pipe1[173:163] = rx_st_vf_num_pipe1[10:0];
        assign rx_st_hdr_build_s0_pipe1[174]     = rx_st_vf_active_pipe1[0];
        assign rx_st_hdr_build_s0_pipe1[178:175] = {1'b0,rx_st_bar_range_pipe1[2:0]};
        assign rx_st_hdr_build_s0_pipe1[183:179] = rx_st_slot_num_pipe1[4:0];
        assign rx_st_hdr_build_s0_pipe1[191:184] = 8'b0;
        assign rx_st_hdr_build_s0_pipe1[255:192] = 64'b0;
        assign rx_st_hdr_build_s1_pipe1[127:0]   = rx_st_hdr_arrange_s1_pipe1;
        assign rx_st_hdr_build_s1_pipe1[156:128] = (rx_st_tlp_prfx_pipe1[63:61] == 3'b100) ? rx_st_tlp_prfx_pipe1[60:32] : 29'b0;
        assign rx_st_hdr_build_s1_pipe1[157]     = (rx_st_tlp_prfx_pipe1[63:61] == 3'b100);
        assign rx_st_hdr_build_s1_pipe1[159:158] = 2'b0;
        assign rx_st_hdr_build_s1_pipe1[162:160] = rx_st_func_num_pipe1[5:3];
        assign rx_st_hdr_build_s1_pipe1[173:163] = rx_st_vf_num_pipe1[21:11];
        assign rx_st_hdr_build_s1_pipe1[174]     = rx_st_vf_active_pipe1[1];
        assign rx_st_hdr_build_s1_pipe1[178:175] = {1'b0,rx_st_bar_range_pipe1[5:3]};
        assign rx_st_hdr_build_s1_pipe1[183:179] = rx_st_slot_num_pipe1[4:0];
        assign rx_st_hdr_build_s1_pipe1[191:184] = 8'b0;
        assign rx_st_hdr_build_s1_pipe1[255:192] = 64'b0;

      //end // if(TILE == "P-TILE"|| TILE == "F-TILE")
    end // if(pcie_link_width == "x16")

    else begin //if((pcie_link_width == "x8")||(pcie_link_width == "x4"))

      reg [127:0]                            rx_st_hdr_s0_pipe1;

      //if(TILE == "P-TILE"|| TILE == "F-TILE") begin

        //RX Header Arrangepe3_in_datar
        assign rx_st_hdr_s0_pipe1 = rx_st_hdr_pipe1[127:0];
        for(hdr_byte_count=0; hdr_byte_count<4; hdr_byte_count=hdr_byte_count+1) begin : RX_header_arranger
          assign rx_st_hdr_arrange_s0_pipe1[hdr_byte_count*32+:32] = rx_st_hdr_s0_pipe1[(3-hdr_byte_count)*32+:32];
        end
        assign rx_st_hdr_arrange_s1_pipe1        = 128'b0;

        //RX Header Builder
        assign rx_st_hdr_build_s0_pipe1[127:0]   = rx_st_hdr_arrange_s0_pipe1;
        assign rx_st_hdr_build_s0_pipe1[156:128] = (rx_st_tlp_prfx_pipe1[31:29] == 3'b100) ? rx_st_tlp_prfx_pipe1[28:0] : 29'b0;
        assign rx_st_hdr_build_s0_pipe1[157]     = (rx_st_tlp_prfx_pipe1[31:29] == 3'b100);
        assign rx_st_hdr_build_s0_pipe1[159:158] = 2'b0;
        assign rx_st_hdr_build_s0_pipe1[162:160] = rx_st_func_num_pipe1[2:0];
        assign rx_st_hdr_build_s0_pipe1[173:163] = rx_st_vf_num_pipe1[10:0];
        assign rx_st_hdr_build_s0_pipe1[174]     = rx_st_vf_active_pipe1[0];
        assign rx_st_hdr_build_s0_pipe1[178:175] = {1'b0,rx_st_bar_range_pipe1[2:0]};
        assign rx_st_hdr_build_s0_pipe1[183:179] = rx_st_slot_num_pipe1[4:0];
        assign rx_st_hdr_build_s0_pipe1[191:184] = 8'b0;
        assign rx_st_hdr_build_s0_pipe1[255:192] = 64'b0;
        assign rx_st_hdr_build_s1_pipe1          = 256'b0;

      //end //if(TILE == "P-TILE"|| TILE == "F-TILE")
    end //if((pcie_link_width == "x8")||(pcie_link_width == "x4"))
  endgenerate


  // RX Data qualified with Tkeep
  wire [rx_tkeep_width*double_width-1:0]     rx_st_tkeep_pipe1;
  wire [payload_width-1:0]                   rx_st_data_validated_pipe1;
  wire [payload_width-1:0]                   rx_st_data_pipe2;

  assign rx_st_tkeep_pipe1 = (double_width == 2) ? {rx_st_tkeep_s1_pipe1,rx_st_tkeep_s0_pipe1} : rx_st_tkeep_s0_pipe1;

  genvar rx_data_validated_count;
  generate
    for (rx_data_validated_count=0; rx_data_validated_count<payload_width/8; rx_data_validated_count=rx_data_validated_count+1) begin: data_qualified_with_tkeep
      assign rx_st_data_validated_pipe1[(rx_data_validated_count+1)*8-1:rx_data_validated_count*8]
        = {8{rx_st_tkeep_pipe1[rx_data_validated_count]}} & rx_st_data_pipe1[(rx_data_validated_count+1)*8-1:rx_data_validated_count*8];
    end
  endgenerate


  //Data Pipeline 2
  wire [avst_pipe2a_dwidth-1:0]              avst_rx_pipe1a_in_data;
  wire                                       avst_rx_pipe2a_out_ready;
  wire                                       avst_rx_pipe2a_out_valid;
  wire [avst_pipe2a_dwidth-1:0]              avst_rx_pipe2a_out_data;
  wire [2:0]                                 s0_hdr_valid_pipe2;
  wire [2:0]                                 s0_hdr_shift_pipe2;
  wire [2:0]                                 s0_data_valid_pipe2;
  wire [2:0]                                 s0_data_shift_pipe2;
  wire [2:0]                                 s1_hdr_valid_pipe2;
  wire [2:0]                                 s1_hdr_shift_pipe2;
  wire [2:0]                                 s1_data_valid_pipe2;
  wire [2:0]                                 s1_data_shift_pipe2;
  wire [2:0]                                 tuser1_pipe2;
  wire [2:0]                                 tuser2_pipe2;
  wire [1:0]                                 fifo_halt_pipe2;
  wire                                       WriteIntoFIFO_pipe2;
  wire [2:0]                                 NumOf16bInBuffer_pipe2;

  pciess_data_pipeline #(
//    .PIPELINE_READY           ( 1                         ),
    .PIPELINE_READY           ( 0                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( avst_pipe2a_dwidth        )
  ) u_avst_rx_pipeline_2a (
    .clk                      ( coreclkout_hip            ),
    .reset                    ( ~warm_rst_coreclk3_n      ),
    .in_ready                 ( avst_rx_pipe1a_ready      ),
    .in_valid                 ( avst_rx_pipe1a_valid      ),
    .in_data                  ( avst_rx_pipe1a_in_data    ),
    .out_ready                ( avst_rx_pipe2a_out_ready  ),
    .out_valid                ( avst_rx_pipe2a_out_valid  ),
    .out_data                 ( avst_rx_pipe2a_out_data   )
  );

  assign avst_rx_pipe1a_in_data = {NumOf16bInBuffer_pipe1[2:0], WriteIntoFIFO_pipe1, fifo_halt_pipe1,
                                   tuser2_pipe1, tuser1_pipe1[2:0],
                                   s1_data_shift_pipe1[2:0], s1_data_valid_pipe1, s1_hdr_shift_pipe1, s1_hdr_valid_pipe1,
                                   s0_data_shift_pipe1, s0_data_valid_pipe1, s0_hdr_shift_pipe1, s0_hdr_valid_pipe1};
  assign {NumOf16bInBuffer_pipe2, WriteIntoFIFO_pipe2, fifo_halt_pipe2,
          tuser2_pipe2, tuser1_pipe2,
          s1_data_shift_pipe2, s1_data_valid_pipe2, s1_hdr_shift_pipe2, s1_hdr_valid_pipe2,
          s0_data_shift_pipe2, s0_data_valid_pipe2, s0_hdr_shift_pipe2, s0_hdr_valid_pipe2} = avst_rx_pipe2a_out_data;


  wire [avst_pipe2b_dwidth-1:0]              avst_rx_pipe1b_in_data;
  wire                                       avst_rx_pipe2b_out_ready;
  wire                                       avst_rx_pipe2b_out_valid;
  wire [avst_pipe2b_dwidth-1:0]              avst_rx_pipe2b_out_data;

  pciess_data_pipeline #(
//    .PIPELINE_READY           ( 1                         ),
    .PIPELINE_READY           ( 0                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( avst_pipe2b_dwidth        )
  ) u_avst_rx_pipeline_2b (
    .clk                      ( coreclkout_hip            ),
    .reset                    ( ~warm_rst_coreclk3_n      ),
    .in_ready                 ( avst_rx_pipe1b_ready      ),
    .in_valid                 ( avst_rx_pipe1b_valid      ),
    .in_data                  ( avst_rx_pipe1b_in_data    ),
    .out_ready                ( avst_rx_pipe2b_out_ready  ),
    .out_valid                ( avst_rx_pipe2b_out_valid  ),
    .out_data                 ( avst_rx_pipe2b_out_data   )
  );

  assign avst_rx_pipe1b_in_data = {rx_st_tkeep_s1_pipe1, rx_st_tkeep_s0_pipe1, rx_st_hdr_build_s1_pipe1, rx_st_hdr_build_s0_pipe1,
                                   rx_st_tlp_prfx_par_chk_pipe1, rx_st_hdr_par_chk_pipe1, rx_st_data_par_chk_pipe1, rx_st_data_validated_pipe1};


  wire [1:0]                                 fifo_halt_pipe3;
  wire                                       avst_rx_pipe2a_in_ready;
  wire                                       avst_rx_pipe2b_in_ready;

  assign avst_rx_pipe2a_out_ready     = avst_rx_pipe2a_in_ready & ~fifo_halt_pipe3[0];
  assign avst_rx_pipe2b_out_ready     = avst_rx_pipe2b_in_ready & ~fifo_halt_pipe3[0];


  //RX Steering
  reg  [2:0]                                 NumOf16bInBuffer_pipe2_1_past;
  reg  [3:0]                                 NumOf16bInBuffer_pipe2_accumulation;
  reg  [2:0]                                 NumOf16bInBuffer_pipe2_steering;
  reg  [2:0]                                 NumOf16bInBuffer2_pipe2_steering;
  reg  [1:0]                                 fifo_halt_pipe2_steering;
  reg                                        WriteIntoFIFO_pipe2_steering;
  reg  [2:0]                                 s0_hdr_valid_pipe2_steering;
  reg  [2:0]                                 s0_hdr_shift_pipe2_steering;
  reg  [2:0]                                 s0_data_valid_pipe2_steering;
  reg  [2:0]                                 s0_data_shift_pipe2_steering;
  reg  [2:0]                                 s1_hdr_valid_pipe2_steering;
  reg  [2:0]                                 s1_hdr_shift_pipe2_steering;
  reg  [2:0]                                 s1_data_valid_pipe2_steering;
  reg  [2:0]                                 s1_data_shift_pipe2_steering;
  reg  [15:0]                                tuser_buffer1_pipe2_accumulation;
  reg  [7:0]                                 tuser_buffer1_pipe2_steering;
  reg  [7:0]                                 tuser_buffer2_pipe2_steering;
  reg  [7:0]                                 tuser_buffer3_pipe2_steering;

  wire [2:0]                                 NumOf16bInBuffer_pipe3;
  wire [2:0]                                 NumOf16bInBuffer2_pipe3;
  wire                                       WriteIntoFIFO_pipe3;
  wire [2:0]                                 s0_hdr_valid_pipe3;
  wire [7:0]                                 s0_hdr_shift_pipe3;
  wire [2:0]                                 s0_data_valid_pipe3;
  wire [7:0]                                 s0_data_shift_pipe3;
  wire [2:0]                                 s1_hdr_valid_pipe3;
  wire [7:0]                                 s1_hdr_shift_pipe3;
  wire [2:0]                                 s1_data_valid_pipe3;
  wire [7:0]                                 s1_data_shift_pipe3;
  wire [7:0]                                 tuser_buffer1_pipe3;
  wire [7:0]                                 tuser_buffer2_pipe3;
  wire [7:0]                                 tuser_buffer3_pipe3;

  generate
    //if(((pcie_link_width == "x16") || (pcie_link_width == "x8")) && (TILE == "P-TILE"|| TILE == "F-TILE")) begin
      if(Header_Packing_scheme == "Simple") begin
        always@(*) begin
          NumOf16bInBuffer2_pipe2_steering         = 3'b0;
          tuser_buffer3_pipe2_steering             = 3'b0;

          if(!(fifo_halt_pipe3 == 2'b00)) begin
            NumOf16bInBuffer_pipe2_1_past          = 3'b0;
            NumOf16bInBuffer_pipe2_accumulation    = 4'b0;
            NumOf16bInBuffer_pipe2_steering        = 3'b0;
            WriteIntoFIFO_pipe2_steering           = 1'b1;
            fifo_halt_pipe2_steering               = fifo_halt_pipe3 >> 1;
            s0_hdr_valid_pipe2_steering            = 3'b0;
            s0_hdr_shift_pipe2_steering            = 3'b0;
            s0_data_valid_pipe2_steering           = 3'b0;
            s0_data_shift_pipe2_steering           = 3'b0;
            s1_hdr_valid_pipe2_steering            = 3'b0;
            s1_hdr_shift_pipe2_steering            = 3'b0;
            s1_data_valid_pipe2_steering           = 3'b0;
            s1_data_shift_pipe2_steering           = 3'b0;
            tuser_buffer1_pipe2_accumulation       = 16'b0;
            tuser_buffer1_pipe2_steering           = 8'b0;
            tuser_buffer2_pipe2_steering           = 8'b0;
          end

          else if(!avst_rx_pipe2a_out_valid) begin
            NumOf16bInBuffer_pipe2_1_past          = 3'b0;
            NumOf16bInBuffer_pipe2_accumulation    = 4'b0;
            NumOf16bInBuffer_pipe2_steering        = NumOf16bInBuffer_pipe3;
            WriteIntoFIFO_pipe2_steering           = 1'b0;
            fifo_halt_pipe2_steering               = 2'b0;
            s0_hdr_valid_pipe2_steering            = 3'b0;
            s0_hdr_shift_pipe2_steering            = 3'b0;
            s0_data_valid_pipe2_steering           = 3'b0;
            s0_data_shift_pipe2_steering           = 3'b0;
            s1_hdr_valid_pipe2_steering            = 3'b0;
            s1_hdr_shift_pipe2_steering            = 3'b0;
            s1_data_valid_pipe2_steering           = 3'b0;
            s1_data_shift_pipe2_steering           = 3'b0;
            tuser_buffer1_pipe2_accumulation       = 16'b0;
            tuser_buffer1_pipe2_steering           = 8'b0;
            tuser_buffer2_pipe2_steering           = 8'b0;
          end

          else begin
            NumOf16bInBuffer_pipe2_1_past          = (s0_hdr_valid_pipe2[0] | s1_hdr_valid_pipe2[0]) ? 3'b0 : NumOf16bInBuffer_pipe3; 
            NumOf16bInBuffer_pipe2_accumulation    = NumOf16bInBuffer_pipe2 + NumOf16bInBuffer_pipe2_1_past;
            NumOf16bInBuffer_pipe2_steering        = WriteIntoFIFO_pipe2 ? NumOf16bInBuffer_pipe2 : NumOf16bInBuffer_pipe2_accumulation[2:0];
            WriteIntoFIFO_pipe2_steering           = NumOf16bInBuffer_pipe2_accumulation[3] | WriteIntoFIFO_pipe2;

            s0_hdr_valid_pipe2_steering            = s0_hdr_valid_pipe2;
            s0_hdr_shift_pipe2_steering            = s0_hdr_shift_pipe2;

            s0_data_valid_pipe2_steering           = s0_data_valid_pipe2;
            s0_data_shift_pipe2_steering           = s0_data_shift_pipe2 + NumOf16bInBuffer_pipe2_1_past;

            s1_hdr_valid_pipe2_steering            = s1_hdr_valid_pipe2;
            s1_hdr_shift_pipe2_steering            = s1_hdr_shift_pipe2;

            s1_data_valid_pipe2_steering           = s1_hdr_valid_pipe2[1] ? s1_data_valid_pipe2 : (s1_data_valid_pipe2 + (NumOf16bInBuffer_pipe2_accumulation[3] & NumOf16bInBuffer_pipe2_accumulation[1]));
            s1_data_shift_pipe2_steering           = s1_hdr_valid_pipe2[1] ? s1_data_shift_pipe2 : (s1_data_shift_pipe2 + NumOf16bInBuffer_pipe2_1_past);

            tuser_buffer1_pipe2_accumulation       = (|tuser1_pipe2) << (tuser1_pipe2 + NumOf16bInBuffer_pipe2_1_past - 1);
            tuser_buffer1_pipe2_steering           = tuser_buffer1_pipe2_accumulation[7:0];
            tuser_buffer2_pipe2_steering           = tuser_buffer1_pipe2_accumulation[15:8] | ({7'b0,|tuser2_pipe2} << (tuser2_pipe2 -1));

            fifo_halt_pipe2_steering               = (|tuser_buffer1_pipe2_accumulation[15:8]) + fifo_halt_pipe2;
          end
        end
      end // if(Header_Packing_scheme == "Simple")
    //end //if(((pcie_link_width == "x16") || (pcie_link_width == "x8")) && (TILE == "P-TILE"|| TILE == "F-TILE"))
  endgenerate

  wire [7:0]                                 s0_hdr_shift_pipe2_one_hot;
  wire [7:0]                                 s0_data_shift_pipe2_one_hot;
  wire [7:0]                                 s1_hdr_shift_pipe2_one_hot;
  wire [7:0]                                 s1_data_shift_pipe2_one_hot;

  assign s0_hdr_shift_pipe2_one_hot[0]  =  !s0_hdr_shift_pipe2_steering[2] & !s0_hdr_shift_pipe2_steering[1];
  assign s0_hdr_shift_pipe2_one_hot[1]  =  !s0_hdr_shift_pipe2_steering[2] & !s0_hdr_shift_pipe2_steering[1];
  assign s0_hdr_shift_pipe2_one_hot[2]  =  !s0_hdr_shift_pipe2_steering[2] &  s0_hdr_shift_pipe2_steering[1];
  assign s0_hdr_shift_pipe2_one_hot[3]  =  !s0_hdr_shift_pipe2_steering[2] &  s0_hdr_shift_pipe2_steering[1];
  assign s0_hdr_shift_pipe2_one_hot[4]  =   s0_hdr_shift_pipe2_steering[2] & !s0_hdr_shift_pipe2_steering[1];
  assign s0_hdr_shift_pipe2_one_hot[5]  =   s0_hdr_shift_pipe2_steering[2] & !s0_hdr_shift_pipe2_steering[1];
  assign s0_hdr_shift_pipe2_one_hot[6]  =   s0_hdr_shift_pipe2_steering[2] &  s0_hdr_shift_pipe2_steering[1];
  assign s0_hdr_shift_pipe2_one_hot[7]  =   s0_hdr_shift_pipe2_steering[2] &  s0_hdr_shift_pipe2_steering[1];

  assign s0_data_shift_pipe2_one_hot[0] =  !s0_data_shift_pipe2_steering[2] & !s0_data_shift_pipe2_steering[1];
  assign s0_data_shift_pipe2_one_hot[1] =  !s0_data_shift_pipe2_steering[2] & !s0_data_shift_pipe2_steering[1];
  assign s0_data_shift_pipe2_one_hot[2] =  !s0_data_shift_pipe2_steering[2] &  s0_data_shift_pipe2_steering[1];
  assign s0_data_shift_pipe2_one_hot[3] =  !s0_data_shift_pipe2_steering[2] &  s0_data_shift_pipe2_steering[1];
  assign s0_data_shift_pipe2_one_hot[4] =   s0_data_shift_pipe2_steering[2] & !s0_data_shift_pipe2_steering[1];
  assign s0_data_shift_pipe2_one_hot[5] =   s0_data_shift_pipe2_steering[2] & !s0_data_shift_pipe2_steering[1];
  assign s0_data_shift_pipe2_one_hot[6] =   s0_data_shift_pipe2_steering[2] &  s0_data_shift_pipe2_steering[1];
  assign s0_data_shift_pipe2_one_hot[7] =   s0_data_shift_pipe2_steering[2] &  s0_data_shift_pipe2_steering[1];

  assign s1_hdr_shift_pipe2_one_hot[0]  =  !s1_hdr_shift_pipe2_steering[2] & !s1_hdr_shift_pipe2_steering[1];
  assign s1_hdr_shift_pipe2_one_hot[1]  =  !s1_hdr_shift_pipe2_steering[2] & !s1_hdr_shift_pipe2_steering[1];
  assign s1_hdr_shift_pipe2_one_hot[2]  =  !s1_hdr_shift_pipe2_steering[2] &  s1_hdr_shift_pipe2_steering[1];
  assign s1_hdr_shift_pipe2_one_hot[3]  =  !s1_hdr_shift_pipe2_steering[2] &  s1_hdr_shift_pipe2_steering[1];
  assign s1_hdr_shift_pipe2_one_hot[4]  =   s1_hdr_shift_pipe2_steering[2] & !s1_hdr_shift_pipe2_steering[1];
  assign s1_hdr_shift_pipe2_one_hot[5]  =   s1_hdr_shift_pipe2_steering[2] & !s1_hdr_shift_pipe2_steering[1];
  assign s1_hdr_shift_pipe2_one_hot[6]  =   s1_hdr_shift_pipe2_steering[2] &  s1_hdr_shift_pipe2_steering[1];
  assign s1_hdr_shift_pipe2_one_hot[7]  =   s1_hdr_shift_pipe2_steering[2] &  s1_hdr_shift_pipe2_steering[1];

  assign s1_data_shift_pipe2_one_hot[0] =  !s1_data_shift_pipe2_steering[2] & !s1_data_shift_pipe2_steering[1];
  assign s1_data_shift_pipe2_one_hot[1] =  !s1_data_shift_pipe2_steering[2] & !s1_data_shift_pipe2_steering[1];
  assign s1_data_shift_pipe2_one_hot[2] =  !s1_data_shift_pipe2_steering[2] &  s1_data_shift_pipe2_steering[1];
  assign s1_data_shift_pipe2_one_hot[3] =  !s1_data_shift_pipe2_steering[2] &  s1_data_shift_pipe2_steering[1];
  assign s1_data_shift_pipe2_one_hot[4] =   s1_data_shift_pipe2_steering[2] & !s1_data_shift_pipe2_steering[1];
  assign s1_data_shift_pipe2_one_hot[5] =   s1_data_shift_pipe2_steering[2] & !s1_data_shift_pipe2_steering[1];
  assign s1_data_shift_pipe2_one_hot[6] =   s1_data_shift_pipe2_steering[2] &  s1_data_shift_pipe2_steering[1];
  assign s1_data_shift_pipe2_one_hot[7] =   s1_data_shift_pipe2_steering[2] &  s1_data_shift_pipe2_steering[1];


  //Data Pipeline 3
  wire                                       avst_rx_pipe2a_in_valid;
  wire [avst_pipe3a_dwidth-1:0]              avst_rx_pipe2a_in_data;
  wire                                       avst_rx_pipe3_ready;
  wire                                       avst_rx_pipe3a_valid;
  wire [avst_pipe3a_dwidth-1:0]              avst_rx_pipe3a_out_data;

  pciess_data_pipeline #(
    .PIPELINE_READY           ( 1                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( avst_pipe3a_dwidth         )
  ) u_avst_rx_pipeline_3a (
    .clk                      ( coreclkout_hip            ),
    .reset                    ( ~warm_rst_coreclk4_n      ),
    .in_ready                 ( avst_rx_pipe2a_in_ready   ),
    .in_valid                 ( avst_rx_pipe2a_in_valid   ),
    .in_data                  ( avst_rx_pipe2a_in_data    ),
    .out_ready                ( avst_rx_pipe3_ready       ),
    .out_valid                ( avst_rx_pipe3a_valid      ),
    .out_data                 ( avst_rx_pipe3a_out_data   )
  );

  //To break timing path, no functionality impact for keep streaming in but will have litte performance impact when back pressure coming in
  //assign avst_rx_pipe2_in_valid = WriteIntoFIFO | (|NumOf16bInBuffer) | (|NumOf16bInBuffer2);
  assign avst_rx_pipe2a_in_valid  = 1'b1;
  assign avst_rx_pipe2a_in_data   = {tuser_buffer3_pipe2_steering, tuser_buffer2_pipe2_steering,     tuser_buffer1_pipe2_steering,
                                     s1_data_shift_pipe2_one_hot,  s1_data_valid_pipe2_steering,     s1_hdr_shift_pipe2_one_hot,      s1_hdr_valid_pipe2_steering,
                                     s0_data_shift_pipe2_one_hot,  s0_data_valid_pipe2_steering,     s0_hdr_shift_pipe2_one_hot,      s0_hdr_valid_pipe2_steering,
                                     fifo_halt_pipe2_steering,     NumOf16bInBuffer2_pipe2_steering, NumOf16bInBuffer_pipe2_steering, WriteIntoFIFO_pipe2_steering};
  assign {tuser_buffer3_pipe3, tuser_buffer2_pipe3,     tuser_buffer1_pipe3,
          s1_data_shift_pipe3, s1_data_valid_pipe3,     s1_hdr_shift_pipe3,    s1_hdr_valid_pipe3,
          s0_data_shift_pipe3, s0_data_valid_pipe3,     s0_hdr_shift_pipe3,    s0_hdr_valid_pipe3,
          fifo_halt_pipe3,     NumOf16bInBuffer2_pipe3, NumOf16bInBuffer_pipe3, WriteIntoFIFO_pipe3} = avst_rx_pipe3a_valid ? avst_rx_pipe3a_out_data : {avst_pipe3a_dwidth{1'b0}};


  wire                                       avst_rx_pipe2b_in_valid;
  wire [avst_pipe3b_dwidth-1:0]              avst_rx_pipe2b_in_data;
  wire                                       avst_rx_pipe3b_valid;
  wire [avst_pipe3b_dwidth-1:0]              avst_rx_pipe3b_out_data;
  wire [pfx_width/8-1:0]                     rx_st_tlp_prfx_par_chk_pipe3;
  wire [hdr_width/8-1:0]                     rx_st_hdr_par_chk_pipe3;
  wire [payload_width/8-1:0]                 rx_st_data_par_chk_pipe3;
  wire [255:0]                               rx_st_hdr_build_s0_pipe3;
  wire [255:0]                               rx_st_hdr_build_s1_pipe3;
  wire [rx_tkeep_width-1:0]                  rx_st_tkeep_s0_pipe3;
  wire [rx_tkeep_width-1:0]                  rx_st_tkeep_s1_pipe3;
  wire [payload_width-1:0]                   rx_st_data_pipe3;

  pciess_data_pipeline #(
    .PIPELINE_READY           ( 1                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( avst_pipe3b_dwidth         )
  ) u_avst_rx_pipeline_3b (
    .clk                      ( coreclkout_hip            ),
    .reset                    ( ~warm_rst_coreclk4_n      ),
    .in_ready                 ( avst_rx_pipe2b_in_ready   ),
    .in_valid                 ( avst_rx_pipe2b_in_valid   ),
    .in_data                  ( avst_rx_pipe2b_out_data   ),
    .out_ready                ( avst_rx_pipe3_ready       ),
    .out_valid                ( avst_rx_pipe3b_valid      ),
    .out_data                 ( avst_rx_pipe3b_out_data   )
  );

  assign avst_rx_pipe2b_in_valid = 1'b1;
  assign {rx_st_tkeep_s1_pipe3, rx_st_tkeep_s0_pipe3, rx_st_hdr_build_s1_pipe3, rx_st_hdr_build_s0_pipe3,
          rx_st_tlp_prfx_par_chk_pipe3, rx_st_hdr_par_chk_pipe3, rx_st_data_par_chk_pipe3, rx_st_data_pipe3} = avst_rx_pipe3b_out_data;

  //RX Data Packer
  wire [rx_tdata_width-1:0]                  rx_st_hdr_build_s0_shifted;
  wire [rx_tdata_width-1:0]                  rx_st_hdr_build_s1_shifted;
  wire [rx_tdata_width-1:0]                  rx_st_data_s0_shifted;
  wire [rx_tdata_width-1:0]                  rx_st_data_s1_shifted;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_hdr_s0_shifted;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_hdr_s1_shifted;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_data_s0_shifted;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_data_s1_shifted;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_hdr_s0_shifted;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_hdr_s1_shifted;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_data_s0_shifted;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_data_s1_shifted;
  wire [rx_tdata_width-1:0]                  rx_st_hdr_build_s0_buffer1;
  wire [rx_tdata_width-1:0]                  rx_st_hdr_build_s1_buffer1;
  wire [rx_tdata_width-1:0]                  rx_st_data_s0_buffer1;
  wire [rx_tdata_width-1:0]                  rx_st_data_s1_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_hdr_s0_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_hdr_s1_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_data_s0_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_data_s1_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_hdr_s0_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_hdr_s1_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_data_s0_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_data_s1_buffer1;
  wire [rx_tdata_width-1:0]                  rx_st_hdr_build_s0_buffer2;
  wire [rx_tdata_width-1:0]                  rx_st_hdr_build_s1_buffer2;
  wire [rx_tdata_width-1:0]                  rx_st_data_s0_buffer2;
  wire [rx_tdata_width-1:0]                  rx_st_data_s1_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_hdr_s0_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_hdr_s1_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_data_s0_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_data_s1_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_hdr_s0_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_hdr_s1_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_data_s0_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_data_s1_buffer2;
  wire [rx_tdata_width-1:0]                  rx_st_hdr_build_s0_buffer3;
  wire [rx_tdata_width-1:0]                  rx_st_hdr_build_s1_buffer3;
  wire [rx_tdata_width-1:0]                  rx_st_data_s0_buffer3;
  wire [rx_tdata_width-1:0]                  rx_st_data_s1_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_hdr_s0_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_hdr_s1_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_data_s0_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_st_tkeep_data_s1_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_hdr_s0_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_hdr_s1_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_data_s0_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_st_par_chk_data_s1_buffer3;
  wire [rx_tdata_width-1:0]                  rx_tdata_buffer1;
  wire [rx_tdata_width-1:0]                  rx_tdata_buffer2;
  wire [rx_tdata_width-1:0]                  rx_tdata_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_buffer3;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_buffer1;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_buffer2;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_buffer3;
  wire [7:0]                                 rx_tuser_buffer1;
  wire [7:0]                                 rx_tuser_buffer2;
  wire [7:0]                                 rx_tuser_buffer3;
  wire [rx_tdata_width-1:0]                  rx_tdata_fifo;
  wire [rx_tdata_width-1:0]                  rx_tdata_buffer_store1;
  wire [rx_tdata_width-1:0]                  rx_tdata_buffer_store2;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_fifo;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_buffer_store1;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_buffer_store2;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_fifo;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_buffer_store1;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_buffer_store2;
  wire [7:0]                                 rx_tuser_fifo;
  wire [7:0]                                 rx_tuser_buffer_store1;
  wire [7:0]                                 rx_tuser_buffer_store2;
  wire [255:0]                               rx_st_hdr_build_s1_mode;
  wire [rx_tdata_width-1:0]                  rx_st_data_mode;
  wire [31:0]                                rx_st_hdr_par_chk_mode;
  wire [7:0]                                 rx_st_tlp_prfx_par_chk_mode;
  wire [63:0]                                rx_st_data_par_chk_mode;

  assign rx_st_hdr_build_s1_mode       = (payload_width == 512)? rx_st_hdr_build_s1_pipe3 : {256{1'b0}};
  assign rx_st_data_mode               = {{( rx_tdata_width-payload_width){1'b0}}, rx_st_data_pipe3};
  assign rx_st_hdr_par_chk_mode        = {{((256-hdr_width)/8){1'b0}}, rx_st_hdr_par_chk_pipe3};
  assign rx_st_tlp_prfx_par_chk_mode   = {{((64 -pfx_width)/8){1'b0}}, rx_st_tlp_prfx_par_chk_pipe3};
  assign rx_st_data_par_chk_mode       = {{((rx_tdata_width-payload_width)/8){1'b0}}, rx_st_data_par_chk_pipe3};

  //Shifting
  assign rx_st_hdr_build_s0_shifted[127:0]    = {128{s0_hdr_shift_pipe3[0]}} & rx_st_hdr_build_s0_pipe3[127:0];
  assign rx_st_hdr_build_s0_shifted[255:128]  = {128{s0_hdr_shift_pipe3[1]}} & rx_st_hdr_build_s0_pipe3[255:128];
  assign rx_st_hdr_build_s0_shifted[383:256]  = {128{s0_hdr_shift_pipe3[2]}} & rx_st_hdr_build_s0_pipe3[127:0];
  assign rx_st_hdr_build_s0_shifted[511:384]  = {128{s0_hdr_shift_pipe3[3]}} & rx_st_hdr_build_s0_pipe3[255:128];
  assign rx_st_hdr_build_s0_shifted[639:512]  = {128{s0_hdr_shift_pipe3[4]}} & rx_st_hdr_build_s0_pipe3[127:0];
  assign rx_st_hdr_build_s0_shifted[767:640]  = {128{s0_hdr_shift_pipe3[5]}} & rx_st_hdr_build_s0_pipe3[255:128];
  assign rx_st_hdr_build_s0_shifted[895:768]  = {128{s0_hdr_shift_pipe3[6]}} & rx_st_hdr_build_s0_pipe3[127:0];
  assign rx_st_hdr_build_s0_shifted[1023:896] = {128{s0_hdr_shift_pipe3[7]}} & rx_st_hdr_build_s0_pipe3[255:128];

  assign rx_st_hdr_build_s1_shifted[127:0]    = {128{s1_hdr_shift_pipe3[0]}} & rx_st_hdr_build_s1_mode[127:0];
  assign rx_st_hdr_build_s1_shifted[255:128]  = {128{s1_hdr_shift_pipe3[1]}} & rx_st_hdr_build_s1_mode[255:128];
  assign rx_st_hdr_build_s1_shifted[383:256]  = {128{s1_hdr_shift_pipe3[2]}} & rx_st_hdr_build_s1_mode[127:0];
  assign rx_st_hdr_build_s1_shifted[511:384]  = {128{s1_hdr_shift_pipe3[3]}} & rx_st_hdr_build_s1_mode[255:128];
  assign rx_st_hdr_build_s1_shifted[639:512]  = {128{s1_hdr_shift_pipe3[4]}} & rx_st_hdr_build_s1_mode[127:0];
  assign rx_st_hdr_build_s1_shifted[767:640]  = {128{s1_hdr_shift_pipe3[5]}} & rx_st_hdr_build_s1_mode[255:128];
  assign rx_st_hdr_build_s1_shifted[895:768]  = {128{s1_hdr_shift_pipe3[6]}} & rx_st_hdr_build_s1_mode[127:0];
  assign rx_st_hdr_build_s1_shifted[1023:896] = {128{s1_hdr_shift_pipe3[7]}} & rx_st_hdr_build_s1_mode[255:128];

  assign rx_st_data_s0_shifted[127:0]         = {128{s0_data_shift_pipe3[0]}} & rx_st_data_mode[127:0];
  assign rx_st_data_s0_shifted[255:128]       = {128{s0_data_shift_pipe3[1]}} & rx_st_data_mode[255:128];
  assign rx_st_data_s0_shifted[383:256]       = {128{s0_data_shift_pipe3[2]}} & rx_st_data_mode[127:0];
  assign rx_st_data_s0_shifted[511:384]       = {128{s0_data_shift_pipe3[3]}} & rx_st_data_mode[255:128];
  assign rx_st_data_s0_shifted[639:512]       = {128{s0_data_shift_pipe3[4]}} & rx_st_data_mode[127:0];
  assign rx_st_data_s0_shifted[767:640]       = {128{s0_data_shift_pipe3[5]}} & rx_st_data_mode[255:128];
  assign rx_st_data_s0_shifted[895:768]       = {128{s0_data_shift_pipe3[6]}} & rx_st_data_mode[127:0];
  assign rx_st_data_s0_shifted[1023:896]      = {128{s0_data_shift_pipe3[7]}} & rx_st_data_mode[255:128];

  assign rx_st_data_s1_shifted[127:0]         = {128{s1_data_shift_pipe3[0]}} & rx_st_data_mode[383:256];
  assign rx_st_data_s1_shifted[255:128]       = {128{s1_data_shift_pipe3[1]}} & rx_st_data_mode[511:384];
  assign rx_st_data_s1_shifted[383:256]       = {128{s1_data_shift_pipe3[2]}} & rx_st_data_mode[383:256];
  assign rx_st_data_s1_shifted[511:384]       = {128{s1_data_shift_pipe3[3]}} & rx_st_data_mode[511:384];
  assign rx_st_data_s1_shifted[639:512]       = {128{s1_data_shift_pipe3[4]}} & rx_st_data_mode[383:256];
  assign rx_st_data_s1_shifted[767:640]       = {128{s1_data_shift_pipe3[5]}} & rx_st_data_mode[511:384];
  assign rx_st_data_s1_shifted[895:768]       = {128{s1_data_shift_pipe3[6]}} & rx_st_data_mode[383:256];
  assign rx_st_data_s1_shifted[1023:896]      = {128{s1_data_shift_pipe3[7]}} & rx_st_data_mode[511:384];

  assign rx_st_tkeep_hdr_s0_shifted[15:0]     = {16{s0_hdr_shift_pipe3[0]}} & 16'hffff;
  assign rx_st_tkeep_hdr_s0_shifted[31:16]    = {16{s0_hdr_shift_pipe3[1]}} & 16'hffff;
  assign rx_st_tkeep_hdr_s0_shifted[47:32]    = {16{s0_hdr_shift_pipe3[2]}} & 16'hffff;
  assign rx_st_tkeep_hdr_s0_shifted[63:48]    = {16{s0_hdr_shift_pipe3[3]}} & 16'hffff;
  assign rx_st_tkeep_hdr_s0_shifted[79:64]    = {16{s0_hdr_shift_pipe3[4]}} & 16'hffff;
  assign rx_st_tkeep_hdr_s0_shifted[95:80]    = {16{s0_hdr_shift_pipe3[5]}} & 16'hffff;
  assign rx_st_tkeep_hdr_s0_shifted[111:96]   = {16{s0_hdr_shift_pipe3[6]}} & 16'hffff;
  assign rx_st_tkeep_hdr_s0_shifted[127:112]  = {16{s0_hdr_shift_pipe3[7]}} & 16'hffff;

  assign rx_st_tkeep_hdr_s1_shifted[15:0]     = (payload_width == 512)? ({16{s1_hdr_shift_pipe3[0]}} & 16'hffff) : 16'h0;
  assign rx_st_tkeep_hdr_s1_shifted[31:16]    = (payload_width == 512)? ({16{s1_hdr_shift_pipe3[1]}} & 16'hffff) : 16'h0;
  assign rx_st_tkeep_hdr_s1_shifted[47:32]    = (payload_width == 512)? ({16{s1_hdr_shift_pipe3[2]}} & 16'hffff) : 16'h0;
  assign rx_st_tkeep_hdr_s1_shifted[63:48]    = (payload_width == 512)? ({16{s1_hdr_shift_pipe3[3]}} & 16'hffff) : 16'h0;
  assign rx_st_tkeep_hdr_s1_shifted[79:64]    = (payload_width == 512)? ({16{s1_hdr_shift_pipe3[4]}} & 16'hffff) : 16'h0;
  assign rx_st_tkeep_hdr_s1_shifted[95:80]    = (payload_width == 512)? ({16{s1_hdr_shift_pipe3[5]}} & 16'hffff) : 16'h0;
  assign rx_st_tkeep_hdr_s1_shifted[111:96]   = (payload_width == 512)? ({16{s1_hdr_shift_pipe3[6]}} & 16'hffff) : 16'h0;
  assign rx_st_tkeep_hdr_s1_shifted[127:112]  = (payload_width == 512)? ({16{s1_hdr_shift_pipe3[7]}} & 16'hffff) : 16'h0;

  assign rx_st_tkeep_data_s0_shifted[15:0]    = {16{s0_data_shift_pipe3[0]}} & rx_st_tkeep_s0_pipe3[15:0];
  assign rx_st_tkeep_data_s0_shifted[31:16]   = {16{s0_data_shift_pipe3[1]}} & rx_st_tkeep_s0_pipe3[31:16];
  assign rx_st_tkeep_data_s0_shifted[47:32]   = {16{s0_data_shift_pipe3[2]}} & rx_st_tkeep_s0_pipe3[15:0];
  assign rx_st_tkeep_data_s0_shifted[63:48]   = {16{s0_data_shift_pipe3[3]}} & rx_st_tkeep_s0_pipe3[31:16];
  assign rx_st_tkeep_data_s0_shifted[79:64]   = {16{s0_data_shift_pipe3[4]}} & rx_st_tkeep_s0_pipe3[15:0];
  assign rx_st_tkeep_data_s0_shifted[95:80]   = {16{s0_data_shift_pipe3[5]}} & rx_st_tkeep_s0_pipe3[31:16];
  assign rx_st_tkeep_data_s0_shifted[111:96]  = {16{s0_data_shift_pipe3[6]}} & rx_st_tkeep_s0_pipe3[15:0];
  assign rx_st_tkeep_data_s0_shifted[127:112] = {16{s0_data_shift_pipe3[7]}} & rx_st_tkeep_s0_pipe3[31:16];

  assign rx_st_tkeep_data_s1_shifted[15:0]    = (payload_width == 512)? ({16{s1_data_shift_pipe3[0]}} & rx_st_tkeep_s1_pipe3[15:0])  : 16'h0;
  assign rx_st_tkeep_data_s1_shifted[31:16]   = (payload_width == 512)? ({16{s1_data_shift_pipe3[1]}} & rx_st_tkeep_s1_pipe3[31:16]) : 16'h0;
  assign rx_st_tkeep_data_s1_shifted[47:32]   = (payload_width == 512)? ({16{s1_data_shift_pipe3[2]}} & rx_st_tkeep_s1_pipe3[15:0])  : 16'h0;
  assign rx_st_tkeep_data_s1_shifted[63:48]   = (payload_width == 512)? ({16{s1_data_shift_pipe3[3]}} & rx_st_tkeep_s1_pipe3[31:16]) : 16'h0;
  assign rx_st_tkeep_data_s1_shifted[79:64]   = (payload_width == 512)? ({16{s1_data_shift_pipe3[4]}} & rx_st_tkeep_s1_pipe3[15:0])  : 16'h0;
  assign rx_st_tkeep_data_s1_shifted[95:80]   = (payload_width == 512)? ({16{s1_data_shift_pipe3[5]}} & rx_st_tkeep_s1_pipe3[31:16]) : 16'h0;
  assign rx_st_tkeep_data_s1_shifted[111:96]  = (payload_width == 512)? ({16{s1_data_shift_pipe3[6]}} & rx_st_tkeep_s1_pipe3[15:0])  : 16'h0;
  assign rx_st_tkeep_data_s1_shifted[127:112] = (payload_width == 512)? ({16{s1_data_shift_pipe3[7]}} & rx_st_tkeep_s1_pipe3[31:16]) : 16'h0;

  assign rx_st_par_chk_hdr_s0_shifted[15:0]     = {16{s0_hdr_shift_pipe3[0]}} & rx_st_hdr_par_chk_mode[15:0];
  assign rx_st_par_chk_hdr_s0_shifted[31:16]    = {16{s0_hdr_shift_pipe3[1]}} & {12'b0,rx_st_tlp_prfx_par_chk_mode[3:0]};
  assign rx_st_par_chk_hdr_s0_shifted[47:32]    = {16{s0_hdr_shift_pipe3[2]}} & rx_st_hdr_par_chk_mode[15:0];
  assign rx_st_par_chk_hdr_s0_shifted[63:48]    = {16{s0_hdr_shift_pipe3[3]}} & {12'b0,rx_st_tlp_prfx_par_chk_mode[3:0]};
  assign rx_st_par_chk_hdr_s0_shifted[79:64]    = {16{s0_hdr_shift_pipe3[4]}} & rx_st_hdr_par_chk_mode[15:0];
  assign rx_st_par_chk_hdr_s0_shifted[95:80]    = {16{s0_hdr_shift_pipe3[5]}} & {12'b0,rx_st_tlp_prfx_par_chk_mode[3:0]};
  assign rx_st_par_chk_hdr_s0_shifted[111:96]   = {16{s0_hdr_shift_pipe3[6]}} & rx_st_hdr_par_chk_mode[15:0];
  assign rx_st_par_chk_hdr_s0_shifted[127:112]  = {16{s0_hdr_shift_pipe3[7]}} & {12'b0,rx_st_tlp_prfx_par_chk_mode[3:0]};

  assign rx_st_par_chk_hdr_s1_shifted[15:0]     = {16{s1_hdr_shift_pipe3[0]}} & rx_st_hdr_par_chk_mode[31:16];
  assign rx_st_par_chk_hdr_s1_shifted[31:16]    = {16{s1_hdr_shift_pipe3[1]}} & {12'b0,rx_st_tlp_prfx_par_chk_mode[7:4]};
  assign rx_st_par_chk_hdr_s1_shifted[47:32]    = {16{s1_hdr_shift_pipe3[2]}} & rx_st_hdr_par_chk_mode[31:16];
  assign rx_st_par_chk_hdr_s1_shifted[63:48]    = {16{s1_hdr_shift_pipe3[3]}} & {12'b0,rx_st_tlp_prfx_par_chk_mode[7:4]};
  assign rx_st_par_chk_hdr_s1_shifted[79:64]    = {16{s1_hdr_shift_pipe3[4]}} & rx_st_hdr_par_chk_mode[31:16];
  assign rx_st_par_chk_hdr_s1_shifted[95:80]    = {16{s1_hdr_shift_pipe3[5]}} & {12'b0,rx_st_tlp_prfx_par_chk_mode[7:4]};
  assign rx_st_par_chk_hdr_s1_shifted[111:96]   = {16{s1_hdr_shift_pipe3[6]}} & rx_st_hdr_par_chk_mode[31:16];
  assign rx_st_par_chk_hdr_s1_shifted[127:112]  = {16{s1_hdr_shift_pipe3[7]}} & {12'b0,rx_st_tlp_prfx_par_chk_mode[7:4]};

  assign rx_st_par_chk_data_s0_shifted[15:0]    = {16{s0_data_shift_pipe3[0]}} & rx_st_data_par_chk_mode[15:0];
  assign rx_st_par_chk_data_s0_shifted[31:16]   = {16{s0_data_shift_pipe3[1]}} & rx_st_data_par_chk_mode[31:16];
  assign rx_st_par_chk_data_s0_shifted[47:32]   = {16{s0_data_shift_pipe3[2]}} & rx_st_data_par_chk_mode[15:0];
  assign rx_st_par_chk_data_s0_shifted[63:48]   = {16{s0_data_shift_pipe3[3]}} & rx_st_data_par_chk_mode[31:16];
  assign rx_st_par_chk_data_s0_shifted[79:64]   = {16{s0_data_shift_pipe3[4]}} & rx_st_data_par_chk_mode[15:0];
  assign rx_st_par_chk_data_s0_shifted[95:80]   = {16{s0_data_shift_pipe3[5]}} & rx_st_data_par_chk_mode[31:16];
  assign rx_st_par_chk_data_s0_shifted[111:96]  = {16{s0_data_shift_pipe3[6]}} & rx_st_data_par_chk_mode[15:0];
  assign rx_st_par_chk_data_s0_shifted[127:112] = {16{s0_data_shift_pipe3[7]}} & rx_st_data_par_chk_mode[31:16];

  assign rx_st_par_chk_data_s1_shifted[15:0]    = {16{s1_data_shift_pipe3[0]}} & rx_st_data_par_chk_mode[47:32];
  assign rx_st_par_chk_data_s1_shifted[31:16]   = {16{s1_data_shift_pipe3[1]}} & rx_st_data_par_chk_mode[63:48];
  assign rx_st_par_chk_data_s1_shifted[47:32]   = {16{s1_data_shift_pipe3[2]}} & rx_st_data_par_chk_mode[47:32];
  assign rx_st_par_chk_data_s1_shifted[63:48]   = {16{s1_data_shift_pipe3[3]}} & rx_st_data_par_chk_mode[63:48];
  assign rx_st_par_chk_data_s1_shifted[79:64]   = {16{s1_data_shift_pipe3[4]}} & rx_st_data_par_chk_mode[47:32];
  assign rx_st_par_chk_data_s1_shifted[95:80]   = {16{s1_data_shift_pipe3[5]}} & rx_st_data_par_chk_mode[63:48];
  assign rx_st_par_chk_data_s1_shifted[111:96]  = {16{s1_data_shift_pipe3[6]}} & rx_st_data_par_chk_mode[47:32];
  assign rx_st_par_chk_data_s1_shifted[127:112] = {16{s1_data_shift_pipe3[7]}} & rx_st_data_par_chk_mode[63:48];


  //Buffer 1
  assign rx_st_hdr_build_s0_buffer1    = rx_st_hdr_build_s0_shifted    & {1024{s0_hdr_valid_pipe3[0]}};
  assign rx_st_hdr_build_s1_buffer1    = rx_st_hdr_build_s1_shifted    & {1024{s1_hdr_valid_pipe3[0]}};
  assign rx_st_data_s0_buffer1         = rx_st_data_s0_shifted         & {1024{s0_data_valid_pipe3[0]}};
  assign rx_st_data_s1_buffer1         = rx_st_data_s1_shifted         & {1024{s1_data_valid_pipe3[0]}};

  assign rx_st_tkeep_hdr_s0_buffer1    = rx_st_tkeep_hdr_s0_shifted    & {128{s0_hdr_valid_pipe3[0]}};
  assign rx_st_tkeep_hdr_s1_buffer1    = rx_st_tkeep_hdr_s1_shifted    & {128{s1_hdr_valid_pipe3[0]}};
  assign rx_st_tkeep_data_s0_buffer1   = rx_st_tkeep_data_s0_shifted   & {128{s0_data_valid_pipe3[0]}};
  assign rx_st_tkeep_data_s1_buffer1   = rx_st_tkeep_data_s1_shifted   & {128{s1_data_valid_pipe3[0]}};

  assign rx_st_par_chk_hdr_s0_buffer1  = rx_st_par_chk_hdr_s0_shifted  & {128{s0_hdr_valid_pipe3[0]}};
  assign rx_st_par_chk_hdr_s1_buffer1  = rx_st_par_chk_hdr_s1_shifted  & {128{s1_hdr_valid_pipe3[0]}};
  assign rx_st_par_chk_data_s0_buffer1 = rx_st_par_chk_data_s0_shifted & {128{s0_data_valid_pipe3[0]}};
  assign rx_st_par_chk_data_s1_buffer1 = rx_st_par_chk_data_s1_shifted & {128{s1_data_valid_pipe3[0]}};

  //Buffer 2
  assign rx_st_hdr_build_s0_buffer2    = rx_st_hdr_build_s0_shifted    & {1024{s0_hdr_valid_pipe3[1]}};
  assign rx_st_hdr_build_s1_buffer2    = rx_st_hdr_build_s1_shifted    & {1024{s1_hdr_valid_pipe3[1]}};
  assign rx_st_data_s0_buffer2         = rx_st_data_s0_shifted         & {1024{s0_data_valid_pipe3[1]}};
  assign rx_st_data_s1_buffer2         = rx_st_data_s1_shifted         & {1024{s1_data_valid_pipe3[1]}};

  assign rx_st_tkeep_hdr_s0_buffer2    = rx_st_tkeep_hdr_s0_shifted    & {128{s0_hdr_valid_pipe3[1]}};
  assign rx_st_tkeep_hdr_s1_buffer2    = rx_st_tkeep_hdr_s1_shifted    & {128{s1_hdr_valid_pipe3[1]}};
  assign rx_st_tkeep_data_s0_buffer2   = rx_st_tkeep_data_s0_shifted   & {128{s0_data_valid_pipe3[1]}};
  assign rx_st_tkeep_data_s1_buffer2   = rx_st_tkeep_data_s1_shifted   & {128{s1_data_valid_pipe3[1]}};

  assign rx_st_par_chk_hdr_s0_buffer2  = rx_st_par_chk_hdr_s0_shifted  & {128{s0_hdr_valid_pipe3[1]}};
  assign rx_st_par_chk_hdr_s1_buffer2  = rx_st_par_chk_hdr_s1_shifted  & {128{s1_hdr_valid_pipe3[1]}};
  assign rx_st_par_chk_data_s0_buffer2 = rx_st_par_chk_data_s0_shifted & {128{s0_data_valid_pipe3[1]}};
  assign rx_st_par_chk_data_s1_buffer2 = rx_st_par_chk_data_s1_shifted & {128{s1_data_valid_pipe3[1]}};

  //Buffer 3
  assign rx_st_hdr_build_s0_buffer3    = rx_st_hdr_build_s0_shifted    & {1024{s0_hdr_valid_pipe3[2]}};
  assign rx_st_hdr_build_s1_buffer3    = rx_st_hdr_build_s1_shifted    & {1024{s1_hdr_valid_pipe3[2]}};
  assign rx_st_data_s0_buffer3         = rx_st_data_s0_shifted         & {1024{s0_data_valid_pipe3[2]}};
  assign rx_st_data_s1_buffer3         = rx_st_data_s1_shifted         & {1024{s1_data_valid_pipe3[2]}};

  assign rx_st_tkeep_hdr_s0_buffer3    = rx_st_tkeep_hdr_s0_shifted    & {128{s0_hdr_valid_pipe3[2]}};
  assign rx_st_tkeep_hdr_s1_buffer3    = rx_st_tkeep_hdr_s1_shifted    & {128{s1_hdr_valid_pipe3[2]}};
  assign rx_st_tkeep_data_s0_buffer3   = rx_st_tkeep_data_s0_shifted   & {128{s0_data_valid_pipe3[2]}};
  assign rx_st_tkeep_data_s1_buffer3   = rx_st_tkeep_data_s1_shifted   & {128{s1_data_valid_pipe3[2]}};

  assign rx_st_par_chk_hdr_s0_buffer3  = rx_st_par_chk_hdr_s0_shifted  & {128{s0_hdr_valid_pipe3[2]}};
  assign rx_st_par_chk_hdr_s1_buffer3  = rx_st_par_chk_hdr_s1_shifted  & {128{s1_hdr_valid_pipe3[2]}};
  assign rx_st_par_chk_data_s0_buffer3 = rx_st_par_chk_data_s0_shifted & {128{s0_data_valid_pipe3[2]}};
  assign rx_st_par_chk_data_s1_buffer3 = rx_st_par_chk_data_s1_shifted & {128{s1_data_valid_pipe3[2]}};

  //Data to write or store
  assign rx_tdata_buffer1              = rx_st_hdr_build_s0_buffer1    | rx_st_hdr_build_s1_buffer1    |
                                         rx_st_data_s0_buffer1         | rx_st_data_s1_buffer1         | rx_tdata_buffer_store1;
  assign rx_tkeep_buffer1              = rx_st_tkeep_hdr_s0_buffer1    | rx_st_tkeep_hdr_s1_buffer1    |
                                         rx_st_tkeep_data_s0_buffer1   | rx_st_tkeep_data_s1_buffer1   | rx_tkeep_buffer_store1;
  assign rx_par_chk_buffer1            = rx_st_par_chk_hdr_s0_buffer1  | rx_st_par_chk_hdr_s1_buffer1  |
                                         rx_st_par_chk_data_s0_buffer1 | rx_st_par_chk_data_s1_buffer1 | rx_par_chk_buffer_store1;
  assign rx_tuser_buffer1              = tuser_buffer1_pipe3           | rx_tuser_buffer_store1;

  assign rx_tdata_buffer2              = rx_st_hdr_build_s0_buffer2    | rx_st_hdr_build_s1_buffer2    |
                                         rx_st_data_s0_buffer2         | rx_st_data_s1_buffer2         | rx_tdata_buffer_store2;
  assign rx_tkeep_buffer2              = rx_st_tkeep_hdr_s0_buffer2    | rx_st_tkeep_hdr_s1_buffer2    |
                                         rx_st_tkeep_data_s0_buffer2   | rx_st_tkeep_data_s1_buffer2   | rx_tkeep_buffer_store2;
  assign rx_par_chk_buffer2            = rx_st_par_chk_hdr_s0_buffer2  | rx_st_par_chk_hdr_s1_buffer2  |
                                         rx_st_par_chk_data_s0_buffer2 | rx_st_par_chk_data_s1_buffer2 | rx_par_chk_buffer_store2;
  assign rx_tuser_buffer2              = tuser_buffer2_pipe3           | rx_tuser_buffer_store2;

  assign rx_tdata_buffer3              = rx_st_hdr_build_s0_buffer3    | rx_st_hdr_build_s1_buffer3    |
                                         rx_st_data_s0_buffer3         | rx_st_data_s1_buffer3;
  assign rx_tkeep_buffer3              = rx_st_tkeep_hdr_s0_buffer3    | rx_st_tkeep_hdr_s1_buffer3    |
                                         rx_st_tkeep_data_s0_buffer3   | rx_st_tkeep_data_s1_buffer3;
  assign rx_par_chk_buffer3            = rx_st_par_chk_hdr_s0_buffer3  | rx_st_par_chk_hdr_s1_buffer3  |
                                         rx_st_par_chk_data_s0_buffer3 | rx_st_par_chk_data_s1_buffer3;
  assign rx_tuser_buffer3              = tuser_buffer3_pipe3;


  //Data Pipeline 4
  wire                                       avst_rx_pipe3_in_valid;
  wire [avst_pipe4_dwidth-1:0]               avst_rx_pipe3_in_data;
  wire                                       avst_rx_pipe4_ready;
  wire                                       avst_rx_pipe4_valid;
  wire [avst_pipe4_dwidth-1:0]               avst_rx_pipe4_out_data;

  wire                                       WriteIntoFIFO_pipe4_1;
  wire                                       WriteIntoFIFO_pipe4_2;
  wire                                       WriteIntoFIFO_pipe4_3;
  wire                                       WriteIntoFIFO_pipe4_2_n;
  wire                                       WriteIntoFIFO_pipe4_3_n;
  wire [rx_tdata_width-1:0]                  rx_tdata_buffer1_pipe4;
  wire [rx_tdata_width-1:0]                  rx_tdata_buffer2_pipe4;
  wire [rx_tdata_width-1:0]                  rx_tdata_buffer3_pipe4;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_buffer1_pipe4;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_buffer2_pipe4;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_buffer3_pipe4;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_buffer1_pipe4;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_buffer2_pipe4;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_buffer3_pipe4;
  wire [7:0]                                 rx_tuser_buffer1_pipe4;
  wire [7:0]                                 rx_tuser_buffer2_pipe4;
  wire [7:0]                                 rx_tuser_buffer3_pipe4;
  wire [7:0]                                 rx_tuser_fifo_packer;
  wire [3:0]                                 rx_tlast_fifo;
  wire                                       NumOf16bInBuffer_val_pipe3;
  wire                                       NumOf16bInBuffer2_val_pipe3;

  pciess_data_pipeline #(
//    .PIPELINE_READY           ( 1                         ),
    .PIPELINE_READY           ( 0                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( avst_pipe4_dwidth         )
  ) u_avst_rx_pipeline_4 (
    .clk                      ( coreclkout_hip            ),
    .reset                    ( ~warm_rst_coreclk4_n      ),
    .in_ready                 ( avst_rx_pipe3_ready       ),
    .in_valid                 ( avst_rx_pipe3_in_valid    ),
    .in_data                  ( avst_rx_pipe3_in_data     ),
    .out_ready                ( avst_rx_pipe4_ready       ),
    .out_valid                ( avst_rx_pipe4_valid       ),
    .out_data                 ( avst_rx_pipe4_out_data    )
  );

  assign NumOf16bInBuffer_val_pipe3  = |NumOf16bInBuffer_pipe3;
  assign NumOf16bInBuffer2_val_pipe3 = |NumOf16bInBuffer2_pipe3;

  generate
    if(TILE == "P-TILE"|| TILE == "F-TILE") begin
      if(Header_Packing_scheme == "Simple") begin
        if(payload_width == 512) begin
          assign avst_rx_pipe3_in_valid = WriteIntoFIFO_pipe3 | NumOf16bInBuffer_val_pipe3;
          assign avst_rx_pipe3_in_data  = {WriteIntoFIFO_pipe3, WriteIntoFIFO_pipe3,
                                           ~WriteIntoFIFO_pipe3,
                                           rx_tdata_buffer1,        rx_tkeep_buffer1,       rx_par_chk_buffer1,       rx_tuser_buffer1,
                                           rx_tdata_buffer2[511:0], rx_tkeep_buffer2[63:0], rx_par_chk_buffer2[63:0], rx_tuser_buffer2[3:0]};

          assign {WriteIntoFIFO_pipe4_1, WriteIntoFIFO_pipe4_2,
                  WriteIntoFIFO_pipe4_2_n,
                  rx_tdata_buffer1_pipe4,        rx_tkeep_buffer1_pipe4,       rx_par_chk_buffer1_pipe4,       rx_tuser_buffer1_pipe4,
                  rx_tdata_buffer2_pipe4[511:0], rx_tkeep_buffer2_pipe4[63:0], rx_par_chk_buffer2_pipe4[63:0], rx_tuser_buffer2_pipe4[3:0]}
                = avst_rx_pipe4_out_data;
          assign rx_tdata_buffer2_pipe4[1023:512] = {512{1'b0}};
          assign rx_tkeep_buffer2_pipe4[127:64]   = { 64{1'b0}};
          assign rx_par_chk_buffer2_pipe4[127:64] = { 64{1'b0}};
          assign rx_tuser_buffer2_pipe4[7:4]      = {  4{1'b0}};
        end
        else begin //if(pcie_link_width == "x8")
          assign avst_rx_pipe3_in_valid = WriteIntoFIFO_pipe3 | NumOf16bInBuffer_val_pipe3;
          assign avst_rx_pipe3_in_data  = {WriteIntoFIFO_pipe3, WriteIntoFIFO_pipe3,
                                           ~WriteIntoFIFO_pipe3,
                                           rx_tdata_buffer1, rx_tkeep_buffer1, rx_par_chk_buffer1, rx_tuser_buffer1};

          assign {WriteIntoFIFO_pipe4_1, WriteIntoFIFO_pipe4_2,
                  WriteIntoFIFO_pipe4_2_n,
                  rx_tdata_buffer1_pipe4, rx_tkeep_buffer1_pipe4, rx_par_chk_buffer1_pipe4, rx_tuser_buffer1_pipe4}
                = avst_rx_pipe4_out_data;
          assign rx_tdata_buffer2_pipe4           = {1024{1'b0}};
          assign rx_tkeep_buffer2_pipe4           = { 128{1'b0}};
          assign rx_par_chk_buffer2_pipe4         = { 128{1'b0}};
          assign rx_tuser_buffer2_pipe4           = {   8{1'b0}};
        end
      end
    end
    else begin //if(TILE == "R-TILE")
      assign avst_rx_pipe3_in_valid = WriteIntoFIFO_pipe3 | NumOf16bInBuffer_val_pipe3 | NumOf16bInBuffer2_val_pipe3;
      assign avst_rx_pipe3_in_data  = {WriteIntoFIFO_pipe3, WriteIntoFIFO_pipe3, WriteIntoFIFO_pipe3,
                                       ~WriteIntoFIFO_pipe3, ~WriteIntoFIFO_pipe3,
                                       rx_tdata_buffer1, rx_tkeep_buffer1, rx_par_chk_buffer1, rx_tuser_buffer1,
                                       rx_tdata_buffer2, rx_tkeep_buffer2, rx_par_chk_buffer2, rx_tuser_buffer2,
                                       rx_tdata_buffer3, rx_tkeep_buffer3, rx_par_chk_buffer3, rx_tuser_buffer3};

      assign {WriteIntoFIFO_pipe4_1, WriteIntoFIFO_pipe4_2, WriteIntoFIFO_pipe4_3,
              WriteIntoFIFO_pipe4_2_n, WriteIntoFIFO_pipe4_3_n,
              rx_tdata_buffer1_pipe4, rx_tkeep_buffer1_pipe4, rx_par_chk_buffer1_pipe4, rx_tuser_buffer1_pipe4,
              rx_tdata_buffer2_pipe4, rx_tkeep_buffer2_pipe4, rx_par_chk_buffer2_pipe4, rx_tuser_buffer2_pipe4,
              rx_tdata_buffer3_pipe4, rx_tkeep_buffer3_pipe4, rx_par_chk_buffer3_pipe4, rx_tuser_buffer3_pipe4}
            = avst_rx_pipe4_out_data;
    end
  endgenerate

  assign rx_tdata_fifo                 =  rx_tdata_buffer1_pipe4;
  assign rx_tkeep_fifo                 =  rx_tkeep_buffer1_pipe4;
  assign rx_par_chk_fifo               =  rx_par_chk_buffer1_pipe4;
  assign rx_tuser_fifo                 =  rx_tuser_buffer1_pipe4;

  generate
    if(TILE == "P-TILE"|| TILE == "F-TILE") begin
      assign rx_tdata_buffer_store1        = ({rx_tdata_width{WriteIntoFIFO_pipe4_2}} & rx_tdata_buffer2_pipe4)        | 
                                             ({rx_tdata_width{WriteIntoFIFO_pipe4_2_n}}     & {rx_tdata_width{avst_rx_pipe4_valid}}     & rx_tdata_buffer1_pipe4);
      assign rx_tkeep_buffer_store1        = ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_2}} & rx_tkeep_buffer2_pipe4)    | 
                                             ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_2_n}} & {(rx_tdata_width/8){avst_rx_pipe4_valid}} & rx_tkeep_buffer1_pipe4);
      assign rx_par_chk_buffer_store1      = ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_2}} & rx_par_chk_buffer2_pipe4)  | 
                                             ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_2_n}} & {(rx_tdata_width/8){avst_rx_pipe4_valid}} & rx_par_chk_buffer1_pipe4);
      assign rx_tuser_buffer_store1        = ({8{WriteIntoFIFO_pipe4_2}} & rx_tuser_buffer2_pipe4)                     | 
                                             ({8{WriteIntoFIFO_pipe4_2_n}}                  & {8{avst_rx_pipe4_valid}}                  & rx_tuser_buffer1_pipe4);

      assign rx_tdata_buffer_store2        =  {rx_tdata_width{1'b0}};
      assign rx_tkeep_buffer_store2        = {(rx_tdata_width/8){1'b0}};
      assign rx_par_chk_buffer_store2      = {(rx_tdata_width/8){1'b0}};
      assign rx_tuser_buffer_store2        =   8'b0;
    end
    else begin //if(TILE == "R-TILE")
      assign rx_tdata_buffer_store1        = ({rx_tdata_width{WriteIntoFIFO_pipe4_2}} & rx_tdata_buffer2_pipe4)        | 
                                             ({rx_tdata_width{WriteIntoFIFO_pipe4_2_n}}     & {rx_tdata_width{avst_rx_pipe4_valid}}     & rx_tdata_buffer1_pipe4);
      assign rx_tkeep_buffer_store1        = ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_2}} & rx_tkeep_buffer2_pipe4)    | 
                                             ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_2_n}} & {(rx_tdata_width/8){avst_rx_pipe4_valid}} & rx_tkeep_buffer1_pipe4);
      assign rx_par_chk_buffer_store1      = ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_2}} & rx_par_chk_buffer2_pipe4)  | 
                                             ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_2_n}} & {(rx_tdata_width/8){avst_rx_pipe4_valid}} & rx_par_chk_buffer1_pipe4);
      assign rx_tuser_buffer_store1        = ({8{WriteIntoFIFO_pipe4_2}} & rx_tuser_buffer2_pipe4)                     | 
                                             ({8{WriteIntoFIFO_pipe4_2_n}}                  & {8{avst_rx_pipe4_valid}}                  & rx_tuser_buffer1_pipe4);

      assign rx_tdata_buffer_store2        = ({rx_tdata_width{WriteIntoFIFO_pipe4_3}} & rx_tdata_buffer3_pipe4)        | 
                                             ({rx_tdata_width{WriteIntoFIFO_pipe4_3_n}}     & {rx_tdata_width{avst_rx_pipe4_valid}}     & rx_tdata_buffer2_pipe4);
      assign rx_tkeep_buffer_store2        = ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_3}} & rx_tkeep_buffer3_pipe4)    | 
                                             ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_3_n}} & {(rx_tdata_width/8){avst_rx_pipe4_valid}} & rx_tkeep_buffer2_pipe4);
      assign rx_par_chk_buffer_store2      = ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_3}} & rx_par_chk_buffer3_pipe4)  | 
                                             ({(rx_tdata_width/8){WriteIntoFIFO_pipe4_3_n}} & {(rx_tdata_width/8){avst_rx_pipe4_valid}} & rx_par_chk_buffer2_pipe4);
      assign rx_tuser_buffer_store2        = ({8{WriteIntoFIFO_pipe4_3}} & rx_tuser_buffer3_pipe4)                     | 
                                             ({8{WriteIntoFIFO_pipe4_3_n}}                  & {8{avst_rx_pipe4_valid}}                  & rx_tuser_buffer2_pipe4);
    end
  endgenerate

  assign rx_tuser_fifo_packer          = (Header_Packing_scheme == "Simple") ? 8'b0 : rx_tuser_fifo;
  assign rx_tlast_fifo                 = {|rx_tuser_fifo[7:6],|rx_tuser_fifo[5:4],
                                          |rx_tuser_fifo[3:2],|rx_tuser_fifo[1:0]};


  //Data Pipeline 5
  wire [avst_pipe5_dwidth-1:0]               avst_rx_pipe4_in_data;
  wire                                       avst_rx_pipe5_ready;
  wire                                       avst_rx_pipe5_valid;
  wire [avst_pipe5_dwidth-1:0]               avst_rx_pipe5_data;

//  pciess_data_pipeline #(
//    .PIPELINE_READY           ( 1                         ),
//    .SYNC_RESET               ( 0                         ),
//    .DATA_WIDTH               ( avst_pipe5_dwidth         )
//  ) u_avst_rx_pipeline_5 (
//    .clk                      ( coreclkout_hip            ),
//    .reset                    ( ~warm_rst_coreclk_n       ),
//    .in_ready                 ( avst_rx_pipe4_ready       ),
//    .in_valid                 ( WriteIntoFIFO_pipe4_1     ),
//    .in_data                  ( avst_rx_pipe4_in_data     ),
//    .out_ready                ( avst_rx_pipe5_ready       ),
//    .out_valid                ( avst_rx_pipe5_valid       ),
//    .out_data                 ( avst_rx_pipe5_data        )
//  );

  assign avst_rx_pipe4_ready = avst_rx_pipe5_ready;
  assign avst_rx_pipe5_valid = WriteIntoFIFO_pipe4_1;
  assign avst_rx_pipe5_data  = avst_rx_pipe4_in_data;

  assign avst_rx_pipe4_in_data  = {rx_tdata_fifo, rx_tkeep_fifo, rx_par_chk_fifo, rx_tuser_fifo_packer, rx_tlast_fifo};


  //Data Pipeline 6
  wire                                       avst_rx_pipe6_ready;
  wire                                       avst_rx_pipe6_valid;
  wire [avst_pipe6_dwidth-1:0]               avst_rx_pipe6_out_data;
  wire                                       ss_app_st_rx_fifo_wrfull;
  wire [rx_tdata_width-1:0]                  rx_tdata_fifo_pipe6;
  wire [rx_tdata_width/8-1:0]                rx_tkeep_fifo_pipe6;
  wire [rx_tdata_width/8-1:0]                rx_par_chk_fifo_pipe6;
  wire [7:0]                                 rx_tuser_fifo_pipe6;
  wire [3:0]                                 rx_tlast_fifo_pipe6;

//  pciess_data_pipeline #(
//    .PIPELINE_READY           ( 1                         ),
//    .SYNC_RESET               ( 0                         ),
//    .DATA_WIDTH               ( avst_pipe6_dwidth         )
//  ) u_avst_rx_pipeline_6 (
//    .clk                      ( coreclkout_hip            ),
//    .reset                    ( ~warm_rst_coreclk_n       ),
//    .in_ready                 ( avst_rx_pipe5_ready       ),
//    .in_valid                 ( avst_rx_pipe5_valid       ),
//    .in_data                  ( avst_rx_pipe5_data        ),
//    .out_ready                ( avst_rx_pipe6_ready       ),
//    .out_valid                ( avst_rx_pipe6_valid       ),
//    .out_data                 ( avst_rx_pipe6_out_data    )
//  );

  assign avst_rx_pipe5_ready    = avst_rx_pipe6_ready;
  assign avst_rx_pipe6_valid    = avst_rx_pipe5_valid;
  assign avst_rx_pipe6_out_data = avst_rx_pipe5_data;

  assign avst_rx_pipe6_ready    = ~ss_app_st_rx_fifo_wrfull;
  assign {rx_tdata_fifo_pipe6, rx_tkeep_fifo_pipe6, rx_par_chk_fifo_pipe6, rx_tuser_fifo_pipe6, rx_tlast_fifo_pipe6}
        = avst_rx_pipe6_out_data;


  //AXI RX FIFO
  wire                             ss_app_st_rx_fifo_wrreq;
  wire [axi_fifo_dwidth-1:0]       ss_app_st_rx_fifo_data;
  wire                             ss_app_st_rx_fifo_rdreq;
  wire                             ss_app_st_rx_fifo_rdempty;
  wire [axi_fifo_dwidth-1:0]       ss_app_st_rx_fifo_q;
  reg                              ss_app_st_rx_tvalid_fifo;
  wire [3:0]                       ss_app_st_rx_tlast_fifo;
  wire [7:0]                       ss_app_st_rx_tuser_fifo;
  wire [rx_tdata_width/8-1:0]      ss_app_st_rx_par_chk_fifo;
  wire [rx_tdata_width/8-1:0]      ss_app_st_rx_tkeep_fifo;
  wire [rx_tdata_width-1:0]        ss_app_st_rx_tdata_fifo;
  wire                             ss_app_st_rx_read;
  wire                             axi_rx_fifo_ready;
  wire                             axi_fifo_st_rx_tready;
  
  assign ss_app_st_rx_fifo_wrreq = avst_rx_pipe6_valid & ~ss_app_st_rx_fifo_wrfull;
  assign ss_app_st_rx_fifo_data  = {rx_tlast_fifo_pipe6,rx_tuser_fifo_pipe6,rx_par_chk_fifo_pipe6,rx_tkeep_fifo_pipe6,rx_tdata_fifo_pipe6};
  assign ss_app_st_rx_fifo_rdreq = ~ss_app_st_rx_fifo_rdempty & axi_rx_fifo_ready;

  dcfifo #(
    .lpm_width           ( axi_fifo_dwidth               ),
    .lpm_widthu          ( axi_fifo_awidth               ),
    .lpm_numwords        ( 2**axi_fifo_awidth            ),
    .underflow_checking  ( "OFF"                         ),
    .overflow_checking   ( "OFF"                         ),
    .use_eab             ( "ON"                          ),
    .ram_block_type      ( "M20K"                        ),
    .enable_ecc          ( "FALSE"                       ),
    .intended_device_family  ( device_family             ),
    .lpm_hint            ( "RAM_BLOCK_TYPE=M20K,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"),
    .lpm_showahead       ( "OFF"                         ),
    .lpm_type            ( "dcfifo"                      ),
    .rdsync_delaypipe    ( 4                             ),
    .read_aclr_synch     ( "OFF"                         ),
    .write_aclr_synch    ( "ON"                          ),
    .wrsync_delaypipe    ( 4                             )
  ) u_ss_app_st_rx_fifo (
    .aclr                ( ~axi_st_areset_n              ),
    .wrclk               ( coreclkout_hip                ),
    .wrreq               ( ss_app_st_rx_fifo_wrreq       ),
    .data                ( ss_app_st_rx_fifo_data        ),
    .wrusedw             (                               ),
    .wrempty             (                               ),
    .wrfull              ( ss_app_st_rx_fifo_wrfull      ),
    .rdclk               ( axi_st_clk                    ),
    .rdreq               ( ss_app_st_rx_fifo_rdreq       ),
    .rdfull              (                               ),
    .rdempty             ( ss_app_st_rx_fifo_rdempty     ),
    .rdusedw             (                               ),
    .q                   ( ss_app_st_rx_fifo_q           ),
    .eccstatus           (                               )
  );


  //RX AXI Read
  always@(posedge axi_st_clk or negedge axi_st_areset_n) begin
    if(!axi_st_areset_n)
      ss_app_st_rx_tvalid_fifo <= 1'b0;
    else if(axi_rx_fifo_ready)
      ss_app_st_rx_tvalid_fifo <= ss_app_st_rx_fifo_rdreq;
  end


  // AXI Data pipeline 0
  wire                             axi_rx_pipe_ready;
  wire                             ss_app_st_rx_tvalid_out_fifo;
  wire  [axi_pipe0_dwidth-1:0]     ss_app_st_rx_fifo_out_q;

  pciess_data_pipeline #(
//    .PIPELINE_READY           ( 1                         ),
    .PIPELINE_READY           ( 0                         ),
    .SYNC_RESET               ( 0                         ),
    .DATA_WIDTH               ( axi_pipe0_dwidth          )
  ) u_axi_rx_pipeline_0 (
    .clk                      ( axi_st_clk                ),
    .reset                    ( ~axi_st_areset_n          ),
    .in_ready                 ( axi_rx_fifo_ready         ),
    .in_valid                 ( ss_app_st_rx_tvalid_fifo  ),
    .in_data                  ( ss_app_st_rx_fifo_q       ),
    .out_ready                ( axi_rx_pipe_ready         ),
    .out_valid                ( ss_app_st_rx_tvalid_out_fifo  ),
    .out_data                 ( ss_app_st_rx_fifo_out_q    )
  );

  assign axi_rx_pipe_ready = axi_fifo_st_rx_tready & ss_app_st_rx_read;
  assign {ss_app_st_rx_tlast_fifo, ss_app_st_rx_tuser_fifo, ss_app_st_rx_par_chk_fifo,
          ss_app_st_rx_tkeep_fifo, ss_app_st_rx_tdata_fifo} = ss_app_st_rx_fifo_out_q;


  //AXI Width Adaptor
  genvar ss_app_st_rx_rd_segment_count;
  generate
    //if(TILE == "P-TILE"|| TILE == "F-TILE") begin
      if(DWIDTH == 1024) begin

        assign ss_app_st_rx_tvalid        =  ss_app_st_rx_tvalid_out_fifo;
        assign ss_app_st_rx_tlast         =  |ss_app_st_rx_tlast_fifo;
        assign ss_app_st_rx_tuser         =  (SEGMENT_SIZE==16) ? {ss_app_st_rx_tuser_fifo[7:0]} :
                                             {ss_app_st_rx_tuser_fifo[7],ss_app_st_rx_tuser_fifo[5],
                                              ss_app_st_rx_tuser_fifo[3],ss_app_st_rx_tuser_fifo[1]};
        assign ss_app_st_rx_par_chk       =  ss_app_st_rx_par_chk_fifo;
        assign ss_app_st_rx_tkeep         =  ss_app_st_rx_tkeep_fifo;
        assign ss_app_st_rx_tdata         =  ss_app_st_rx_tdata_fifo;
        assign ss_app_st_rx_read          =  1'b1;
        assign axi_fifo_st_rx_tready      =  app_ss_st_rx_tready;

      end //if(DWIDTH == 1024)

      else if(DWIDTH == 512) begin
        wire [1:0] ss_app_st_rx_rd_sum;
        reg  [1:0] ss_app_st_rx_rd_count;
        reg  [1:0] ss_app_st_rx_rd_valid;
        wire [3:0] ss_app_st_rx_tuser_3_0;

        always@(posedge axi_st_clk or negedge axi_st_areset_n) begin
          if(!axi_st_areset_n) begin
            ss_app_st_rx_rd_count      <= 2'b0;
            ss_app_st_rx_rd_valid      <= 2'b1;
          end
          else if(axi_fifo_st_rx_tready & ss_app_st_rx_tvalid_out_fifo) begin
            if(!ss_app_st_rx_read) begin
              ss_app_st_rx_rd_count    <= {ss_app_st_rx_rd_count[1],1'b1} << 1;
              ss_app_st_rx_rd_valid    <= ss_app_st_rx_rd_valid << 1;
            end
            else begin
              ss_app_st_rx_rd_count    <= 2'b0;
              ss_app_st_rx_rd_valid    <= 2'b1;
            end
          end
        end

        assign axi_fifo_st_rx_tready    = app_ss_st_rx_tready;
        assign ss_app_st_rx_rd_sum      = {ss_app_st_rx_tkeep_fifo[64],1'b0};
        assign ss_app_st_rx_read        = (ss_app_st_rx_rd_sum == ss_app_st_rx_rd_count);
        assign ss_app_st_rx_tvalid      = ss_app_st_rx_tvalid_out_fifo;
        assign ss_app_st_rx_tlast       = (ss_app_st_rx_rd_valid[0] & (|ss_app_st_rx_tlast_fifo[1:0])) |
                                          (ss_app_st_rx_rd_valid[1] & (|ss_app_st_rx_tlast_fifo[3:2]));
        assign ss_app_st_rx_tuser_3_0   = ({4{ss_app_st_rx_rd_valid[0]}} & ss_app_st_rx_tuser_fifo[3:0]) |
                                          ({4{ss_app_st_rx_rd_valid[1]}} & ss_app_st_rx_tuser_fifo[7:4]);
        assign ss_app_st_rx_tuser       = (SEGMENT_SIZE==16) ? {4'b0,ss_app_st_rx_tuser_3_0} : {6'b0,ss_app_st_rx_tuser_3_0[3],ss_app_st_rx_tuser_3_0[1]};
        assign ss_app_st_rx_par_chk     = ({64{ss_app_st_rx_rd_valid[0]}} & ss_app_st_rx_par_chk_fifo[63:0]) |
                                          ({64{ss_app_st_rx_rd_valid[1]}} & ss_app_st_rx_par_chk_fifo[127:64]);
        assign ss_app_st_rx_tkeep       = ({64{ss_app_st_rx_rd_valid[0]}} & ss_app_st_rx_tkeep_fifo[63:0]) |
                                          ({64{ss_app_st_rx_rd_valid[1]}} & ss_app_st_rx_tkeep_fifo[127:64]);
        assign ss_app_st_rx_tdata       = ({512{ss_app_st_rx_rd_valid[0]}} & ss_app_st_rx_tdata_fifo[511:0]) |
                                          ({512{ss_app_st_rx_rd_valid[1]}} & ss_app_st_rx_tdata_fifo[1023:512]);
      end //if(DWIDTH == 512)

      else if(DWIDTH == 256) begin
        wire [3:0]   ss_app_st_rx_rd_sum;
        reg  [3:0]   ss_app_st_rx_rd_count;
        reg  [3:0]   ss_app_st_rx_rd_valid;
        wire [1:0]   ss_app_st_rx_tuser_1_0;
        wire         ss_app_st_rx_tvalid_pipe;
        wire [7:0]   ss_app_st_rx_tuser_pipe;
        wire [31:0]  ss_app_st_rx_par_chk_pipe;
        wire [31:0]  ss_app_st_rx_tkeep_pipe;
        wire [255:0] ss_app_st_rx_tdata_pipe;

        always@(posedge axi_st_clk or negedge axi_st_areset_n) begin
          if(!axi_st_areset_n) begin
            ss_app_st_rx_rd_count      <= 4'b0;
            ss_app_st_rx_rd_valid      <= 4'b1;
          end
          else if(axi_fifo_st_rx_tready & ss_app_st_rx_tvalid_out_fifo) begin
            if(!ss_app_st_rx_read) begin
              ss_app_st_rx_rd_count    <= {ss_app_st_rx_rd_count[3:1],1'b1} << 1;
              ss_app_st_rx_rd_valid    <= ss_app_st_rx_rd_valid << 1;
            end
            else begin
              ss_app_st_rx_rd_count    <= 4'b0;
              ss_app_st_rx_rd_valid    <= 4'b1;
            end
          end
        end

        assign ss_app_st_rx_rd_sum      = {ss_app_st_rx_tkeep_fifo[96],ss_app_st_rx_tkeep_fifo[64],ss_app_st_rx_tkeep_fifo[32],1'b0};
        assign ss_app_st_rx_read        = (ss_app_st_rx_rd_sum == ss_app_st_rx_rd_count);
        assign ss_app_st_rx_tvalid_pipe = ss_app_st_rx_tvalid_out_fifo;
        assign ss_app_st_rx_tlast_pipe  = (ss_app_st_rx_rd_valid[0] & ss_app_st_rx_tlast_fifo[0]) |
                                          (ss_app_st_rx_rd_valid[1] & ss_app_st_rx_tlast_fifo[1]) |
                                          (ss_app_st_rx_rd_valid[2] & ss_app_st_rx_tlast_fifo[2]) |
                                          (ss_app_st_rx_rd_valid[3] & ss_app_st_rx_tlast_fifo[3]);
        assign ss_app_st_rx_tuser_1_0   = ({2{ss_app_st_rx_rd_valid[0]}} & ss_app_st_rx_tuser_fifo[1:0]) |
                                          ({2{ss_app_st_rx_rd_valid[1]}} & ss_app_st_rx_tuser_fifo[3:2]) |
                                          ({2{ss_app_st_rx_rd_valid[2]}} & ss_app_st_rx_tuser_fifo[5:4]) |
                                          ({2{ss_app_st_rx_rd_valid[3]}} & ss_app_st_rx_tuser_fifo[7:6]);
        assign ss_app_st_rx_tuser_pipe  = (SEGMENT_SIZE==16) ? {6'b0,ss_app_st_rx_tuser_1_0} : {7'b0,ss_app_st_rx_tuser_1_0[1]};
        assign ss_app_st_rx_par_chk_pipe= ({32{ss_app_st_rx_rd_valid[0]}} & ss_app_st_rx_par_chk_fifo[31:0]) |
                                          ({32{ss_app_st_rx_rd_valid[1]}} & ss_app_st_rx_par_chk_fifo[63:32]) |
                                          ({32{ss_app_st_rx_rd_valid[2]}} & ss_app_st_rx_par_chk_fifo[95:64]) |
                                          ({32{ss_app_st_rx_rd_valid[3]}} & ss_app_st_rx_par_chk_fifo[127:96]);
        assign ss_app_st_rx_tkeep_pipe  = ({32{ss_app_st_rx_rd_valid[0]}} & ss_app_st_rx_tkeep_fifo[31:0]) |
                                          ({32{ss_app_st_rx_rd_valid[1]}} & ss_app_st_rx_tkeep_fifo[63:32]) |
                                          ({32{ss_app_st_rx_rd_valid[2]}} & ss_app_st_rx_tkeep_fifo[95:64]) |
                                          ({32{ss_app_st_rx_rd_valid[3]}} & ss_app_st_rx_tkeep_fifo[127:96]);
        assign ss_app_st_rx_tdata_pipe  = ({256{ss_app_st_rx_rd_valid[0]}} & ss_app_st_rx_tdata_fifo[255:0]) |
                                          ({256{ss_app_st_rx_rd_valid[1]}} & ss_app_st_rx_tdata_fifo[511:256]) |
                                          ({256{ss_app_st_rx_rd_valid[2]}} & ss_app_st_rx_tdata_fifo[767:512]) |
                                          ({256{ss_app_st_rx_rd_valid[3]}} & ss_app_st_rx_tdata_fifo[1023:768]);

      // AXI Data pipeline 1
      wire  [axi_pipe1_dwidth-1:0]     axi_rx_pipe1_in_data;
      wire  [axi_pipe1_dwidth-1:0]     axi_rx_pipe1_out_data;

      pciess_data_pipeline #(
        .PIPELINE_READY           ( 1                         ),
        .SYNC_RESET               ( 0                         ),
        .DATA_WIDTH               ( axi_pipe1_dwidth           )
      ) u_axi_rx_pipeline_1 (
        .clk                      ( axi_st_clk                ),
        .reset                    ( ~axi_st_areset_n          ),
        .in_ready                 ( axi_fifo_st_rx_tready     ),
        .in_valid                 ( ss_app_st_rx_tvalid_pipe  ),
        .in_data                  ( axi_rx_pipe1_in_data      ),
        .out_ready                ( app_ss_st_rx_tready       ),
        .out_valid                ( ss_app_st_rx_tvalid       ),
        .out_data                 ( axi_rx_pipe1_out_data     )
      );

      assign axi_rx_pipe1_in_data = {ss_app_st_rx_tlast_pipe, ss_app_st_rx_tuser_pipe,
                                     ss_app_st_rx_par_chk_pipe, ss_app_st_rx_tkeep_pipe, ss_app_st_rx_tdata_pipe};
      assign {ss_app_st_rx_tlast, ss_app_st_rx_tuser, ss_app_st_rx_par_chk,
              ss_app_st_rx_tkeep, ss_app_st_rx_tdata} = axi_rx_pipe1_out_data;

      end //if(DWIDTH == 256)
    //end //if(TILE == "P-TILE"|| TILE == "F-TILE")
  endgenerate
  assign ss_app_st_rx_tuser_vendor = 2'b00;

generate
  if (BP_DEBUG_MON_EN) begin : gen_bp_debug_mon_rx_adaptor
    // Back Pressure Debug
    pciess_bp_debug u_hia_rx_bp_cycle_debug
    (
      .core_clk                    ( coreclkout_hip                   ),
      .csr_clk                     ( axi_lite_clk                     ),
      .core_rst_n                  ( warm_rst_coreclk_n               ),
      .csr_rst_n                   ( warm_rst_liteclk_n               ),
      .bp_enable                   ( ~rx_st_ready_o                   ),
      .we_bp_cycle                 ( we_HIA_RX_BP_CYCLES_count        ),
      .bp_cycle_count              ( HIA_RX_BP_CYCLES_count           ),
      .bp_cycle_count_clear        ( HIA_RX_BP_CYCLES_count_clear     ),
      .bp_cycle_overflow           ( HIA_RX_BP_CYCLES_overflow        ),
      .bp_cycle_overflow_clear     ( HIA_RX_BP_CYCLES_overflow_clear  )
    );

    pciess_bp_debug u_dm_rx_bp_cycle_debug
    (
      .core_clk                    ( axi_st_clk                       ),
      .csr_clk                     ( axi_lite_clk                     ),
      .core_rst_n                  ( warm_rst_stclk_n                 ),
      .csr_rst_n                   ( warm_rst_liteclk_n               ),
      .bp_enable                   ( ~app_ss_st_rx_tready             ),
      .we_bp_cycle                 ( we_DM_RX_BP_CYCLES_count         ),
      .bp_cycle_count              ( DM_RX_BP_CYCLES_count            ),
      .bp_cycle_count_clear        ( DM_RX_BP_CYCLES_count_clear      ),
      .bp_cycle_overflow           ( DM_RX_BP_CYCLES_overflow         ),
      .bp_cycle_overflow_clear     ( DM_RX_BP_CYCLES_overflow_clear   )
    );
  end
  else begin : gen_bp_debug_mon_rx_adaptor
    assign we_HIA_RX_BP_CYCLES_count = 1'b0;
    assign HIA_RX_BP_CYCLES_count = 31'h0;
    assign HIA_RX_BP_CYCLES_overflow = 1'b0;
    assign we_DM_RX_BP_CYCLES_count = 1'b0;
    assign DM_RX_BP_CYCLES_count = 31'h0;
    assign DM_RX_BP_CYCLES_overflow  = 1'b0;
  end
endgenerate


  //Performance Monitor
  wire [1:0]  rx_st_sop_pipe1_perf;
  assign rx_st_sop_pipe1_perf = rx_st_sop_pipe1_mode & {2{avst_rx_pipe1a_ready}};

  //Fix Timing
  reg  [1:0] rx_st_sop_pipe1_perf_reg;
  reg [31:0] rx_st_hdr_arrange_s0_pipe1_reg;
  reg [31:0] rx_st_hdr_arrange_s1_pipe1_reg;

  always@(posedge coreclkout_hip or negedge warm_rst_coreclk_n) begin
    if(!warm_rst_coreclk_n) begin
      rx_st_sop_pipe1_perf_reg              <= 2'b0;
      rx_st_hdr_arrange_s0_pipe1_reg        <= 32'b0;
      rx_st_hdr_arrange_s1_pipe1_reg        <= 32'b0;
    end
    else begin
      rx_st_sop_pipe1_perf_reg              <= rx_st_sop_pipe1_perf;
      rx_st_hdr_arrange_s0_pipe1_reg        <= rx_st_hdr_arrange_s0_pipe1[31:0]; //rx_st_hdr_arrange_s0_pipe1 is 128 bit.
      rx_st_hdr_arrange_s1_pipe1_reg        <= rx_st_hdr_arrange_s1_pipe1[31:0]; //rx_st_hdr_arrange_s1_pipe1 is 128 bit.
    end
  end

  generate
    if (PERFMON_EN) begin : gen_perfmon_rx_adaptor
      pciess_performance_monitor u_hia_rx_performance_monitor
      (
        .core_clk                    ( coreclkout_hip                   ),
        .csr_clk                     ( axi_lite_clk                     ),
        .core_rst_n                  ( warm_rst_coreclk_n               ),
        .csr_rst_n                   ( warm_rst_liteclk_n               ),
        .s0_sop                      ( rx_st_sop_pipe1_perf_reg[0]      ),
        .s1_sop                      ( rx_st_sop_pipe1_perf_reg[1]      ),
        .s0_hdr                      ( rx_st_hdr_arrange_s0_pipe1_reg   ),
        .s1_hdr                      ( rx_st_hdr_arrange_s1_pipe1_reg   ),
        .PERFMON_CTRL_global_enable  ( PERFMON_CTRL_global_enable       ),
        .PERFMON_CTRL_clear_counters ( PERFMON_CTRL_clear_counters      ),
        .we_MRD_TLP_num              ( we_RX_MRD_TLP_num                ),
        .MRD_TLP_num                 ( RX_MRD_TLP_num                   ),
        .MRD_TLP_num_clear           ( RX_MRD_TLP_num_clear             ),
        .we_MWR_TLP_num              ( we_RX_MWR_TLP_num                ),
        .MWR_TLP_num                 ( RX_MWR_TLP_num                   ),
        .MWR_TLP_num_clear           ( RX_MWR_TLP_num_clear             ),
        .we_MSG_TLP_num              ( we_RX_MSG_TLP_num                ),
        .MSG_TLP_num                 ( RX_MSG_TLP_num                   ),
        .MSG_TLP_num_clear           ( RX_MSG_TLP_num_clear             ),
        .we_CFGWR_TLP_num            ( we_RX_CFGWR_TLP_num              ),
        .CFGWR_TLP_num               ( RX_CFGWR_TLP_num                 ),
        .CFGWR_TLP_num_clear         ( RX_CFGWR_TLP_num_clear           ),
        .we_CFGRD_TLP_num            ( we_RX_CFGRD_TLP_num              ),
        .CFGRD_TLP_num               ( RX_CFGRD_TLP_num                 ),
        .CFGRD_TLP_num_clear         ( RX_CFGRD_TLP_num_clear           ),
        .we_MEM_DATA_byte            ( we_RX_MEM_DATA_byte              ),
        .MEM_DATA_byte               ( RX_MEM_DATA_byte                 ),
        .MEM_DATA_byte_clear         ( RX_MEM_DATA_byte_clear           ),
        .we_CPL_DATA_byte            ( we_RX_CPL_DATA_byte              ),
        .CPL_DATA_byte               ( RX_CPL_DATA_byte                 ),
        .CPL_DATA_byte_clear         ( RX_CPL_DATA_byte_clear           )
      );
    end
    else begin : gen_perfmon_rx_adaptor
        assign we_RX_MRD_TLP_num = 1'b0;
        assign RX_MRD_TLP_num = 32'h0;
        assign we_RX_MWR_TLP_num = 1'b0;
        assign RX_MWR_TLP_num = 32'h0;
        assign we_RX_MSG_TLP_num = 1'b0;
        assign RX_MSG_TLP_num = 32'h0;
        assign we_RX_CFGWR_TLP_num = 1'b0;
        assign RX_CFGWR_TLP_num = 32'h0;
        assign we_RX_CFGRD_TLP_num = 1'b0;
        assign RX_CFGRD_TLP_num = 32'h0;
        assign we_RX_MEM_DATA_byte = 1'b0;
        assign RX_MEM_DATA_byte = 32'h0;
        assign we_RX_CPL_DATA_byte = 1'b0;
        assign RX_CPL_DATA_byte = 32'h0;
    end
  endgenerate

//For HIA CSR HIP Status Register
assign rx_adaptor_dcfifo_full_o = ss_app_st_rx_fifo_wrfull & avst_rx_pipe6_valid;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63eyXAhgieXdvEfNPx/HieoEWaVZjK/ata0+fRx8FN0yOHUlnQ0VArew/8kyCSe66JOYkkoQ6KB2Qzk02LDs38PY4qia/win8EGnmjyXI5vLLZSPf7dhJNnhC6btzHW4WS/94OMULyFZGBbzRmDvBhAViefBw0U6P+EP+w80TCOF04Kl3blkQqVTwfyJ6LSOsx+8387CExnYIHrEeBJfS8VQaX00Z8UUjFhL/5u8q/uEIHs9t8prlvtFYIvSEHaMbZv5LVLGBqbyOsK9vQLKNKNcswc3msRkzdMcL+5XziFQDOJTZ7UOrEHKExlpXsTHfmzhE1u6LSVG0jv3lHrFyzpIX2IhxDxdiL3qlCIZ2stiN6mKeUAXkK2MX0aCMG2ocZW16yie5TRleFUjtw4QEokoIexF2amJMuZR8itJqsh14aPIbZXb1gXsPXGj8d9p1N2ITwL8wliNlJBM7BbSatLBUP1y54NCKz+qiO+PHa3hZyDsQ3hzmvJFFIvZ0fH5nsnGztzg6IC85sZbFI7zipzVCJkEIUf/rAUzw1jmTmDooD8a+xyCPDkAK5sPw6fdhjcCLo8e6HFz5WC+DiMUolcXJppmYFVecuWy1ePUG1J1X9YDAPna4qXS6c6Si94JvpVB7t5U2Qm9F8HSzW0S0F1dlUBoVo+T595cB1WUCcw9g/dRz7Jk4BHuPj5RujeKRLMjGNsnQVuV5vZzlNdN/C3AIAp/QXjxvy2HGp403z6gbOHsp5+RlDpJPlcGtUc7xjd3ZjdaTl63d1/mPZ/jo3gh"
`endif