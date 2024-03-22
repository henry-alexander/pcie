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


/* Author : Abu Bakar Ismail
 * Date   : 10 Sept 2020
 * Design objective: To translate AXI-S into AVST and supporting multiple packing scheme/format
 * Feature: Supports data width: 256, 512 or 1024
 *          Supports Data format: A10, S10 P Tile, S10 H Tile, R Tile
 */
module altpcied_tx_adaptor # (
        parameter device_family   = "Stratix 10",
        parameter DWIDTH          = 512,  // AXI-S dwidth
        parameter payload_width   = 512,  // default use 1x16 value - AVST
        parameter user_width      = 8,
        parameter hdr_width       = 256,  //default use 1x16 value
        parameter pfx_width       = 32,   //default use 1x16 value
        parameter pcie_link_width = "x16", // default 1x16 (other option 2x8 and 4x4)
        parameter double_width    = 2,    //default use 1x16 value
        parameter axi_fifo_awidth = 3,
        parameter ST_readyLatency = 0, // Can support 0, 1, 2, 3, 4
        parameter SS_PWIDTH       = 32,
        parameter SS_SLOT_WD      = 5,
        parameter SS_PF_WD        = 3,
        parameter SS_VF_WD        = 11,
        parameter SEGMENT_SIZE    = 16,   // 16 Bytes - 128 bit per segment, there will also be 32 B - 256 bits per segment
        parameter Header_Packing_scheme = "Simple", // Simple, Variable, Compact
        parameter TILE            = "P-TILE",
        parameter PERFMON_EN      = 0,
        parameter BP_DEBUG_MON_EN = 0
  ) (
  input                           axi_st_clk,
  input                           axi_lite_clk,
  input                           coreclkout_hip,
  input                           warm_rst_n,
  input                           axi_st_areset_n,
  input                           axi_lite_areset_n,
  // subsystem reset
  input                           subsystem_rst_req,
  output                          subsystem_rst_rdy,
  // AXI-S signals - input
  input                           app_ss_st_tx_tvalid,
  input   [DWIDTH - 1:0]          app_ss_st_tx_tdata,
  input   [DWIDTH/8 - 1:0]        app_ss_st_tx_tkeep,
  input                           app_ss_st_tx_tlast,
  input   [1:0]                   app_ss_st_tx_tuser_vendor,  // [1:0]: pu/dm modes
  input   [user_width - 1:0]      app_ss_st_tx_tuser,  // tlast segment
  output                          app_ss_st_tx_tready,
  // AVST signals - output
  input                           tx_st_ready,
  output  [double_width-1:0]      tx_st_valid,
  output  [double_width-1:0]      tx_st_sop,
  output  [double_width-1:0]      tx_st_eop,
  //output  [$clog2(DWIDTH/8) - 1:0] tx_st_empty, //  not listed in docs
  output  [payload_width - 1:0]   tx_st_data,
  output  [payload_width/8 - 1:0] tx_st_data_par,
  output  [hdr_width-1:0]         tx_st_hdr,   
  output  [hdr_width/8 -1:0]      tx_st_hdr_par,   
  output  [pfx_width-1:0]         tx_st_tlp_prfx,  
  output  [pfx_width/8 -1:0]      tx_st_tlp_prfx_par,
  output  [double_width*4-1:0]    tx_prfx_type_out,
  output                          tx_prfx_present_out,
  output  [SS_PF_WD-1:0]          tx_pf_number_out,
  output  [SS_VF_WD-1:0]          tx_vf_number_out,
  output                          tx_vf_active_out,
  output  [double_width*4-1:0]    tx_bar_number_out,
  output  [SS_SLOT_WD-1:0]        tx_slot_number_out,
  output                          tx_mm_mode,
  // Performance Monitor
  input                           PERFMON_CTRL_global_enable,
  input                           PERFMON_CTRL_clear_counters,
  output                          we_TX_MRD_TLP_num,
  output [31:0]                   TX_MRD_TLP_num_i,
  input                           TX_MRD_TLP_num_clear,
  output                          we_TX_MWR_TLP_num,
  output [31:0]                   TX_MWR_TLP_num_i,
  input                           TX_MWR_TLP_num_clear,
  output                          we_TX_MSG_TLP_num,
  output [31:0]                   TX_MSG_TLP_num_i,
  input                           TX_MSG_TLP_num_clear,
  output                          we_TX_CFGWR_TLP_num,
  output [31:0]                   TX_CFGWR_TLP_num_i,
  input                           TX_CFGWR_TLP_num_clear,
  output                          we_TX_CFGRD_TLP_num,
  output [31:0]                   TX_CFGRD_TLP_num_i,
  input                           TX_CFGRD_TLP_num_clear,
  output                          we_TX_MEM_DATA_byte,
  output [31:0]                   TX_MEM_DATA_byte_i,
  input                           TX_MEM_DATA_byte_clear,
  output                          we_TX_CPL_DATA_byte,
  output [31:0]                   TX_CPL_DATA_byte_i,
  input                           TX_CPL_DATA_byte_clear,
  // Back Pressure cycle
  output                          we_HIA_TX_BP_CYCLES_count,
  input                           HIA_TX_BP_CYCLES_count_clear,
  output [30:0]                   HIA_TX_BP_CYCLES_count_i,
  input                           HIA_TX_BP_CYCLES_overflow_clear,
  output                          HIA_TX_BP_CYCLES_overflow,
  output                          we_DM_TX_BP_CYCLES_count,
  input                           DM_TX_BP_CYCLES_count_clear,
  output [30:0]                   DM_TX_BP_CYCLES_count_i,
  input                           DM_TX_BP_CYCLES_overflow_clear,
  output                          DM_TX_BP_CYCLES_overflow
);

// Internal regs / wires
localparam  AXI_ST_FIFO_WIDTH = DWIDTH + DWIDTH/128 + 8 + 2 + 1; // supporting 256, 512 or 1024
localparam  FIFO_BUFFER       = 4;  // Select 4 for FIFO sync registers
localparam  DC_FIFO_AWIDTH    = ST_readyLatency == 0 ? (axi_fifo_awidth + 1) : $clog2(2**axi_fifo_awidth + ST_readyLatency + FIFO_BUFFER);

reg   [ST_readyLatency :0]  latency_ready_r;
reg                         app_ss_st_tx_tready_r;
reg                         dc_fifo_rdreq_r;
wire                        latency_ready;

wire                        app_tready_latency;
wire                        app_tvalid_latency;
wire                        dc_fifo_rdreq, dc_fifo_wrreq;
wire                        dc_fifo_wrfull, dc_fifo_rdempty;
wire                        fifo_out_tlast, fifo_out_tvalid;
wire                        fifo_wrempty;
wire  [DC_FIFO_AWIDTH - 1:0]dc_fifo_wrusedw;
wire                        tlast_avail;
wire  [7:0]                 fifo_out_tuser;
wire  [1:0]                 fifo_out_tuser_vendor;
wire  [DWIDTH/128 - 1:0]    fifo_out_tkeep, fifo_gen_tkeep; //1024 - 8 bits, 512 - 4 bits, 256 - 2 bits
wire  [DWIDTH-1:0]          fifo_out_tdata;
wire  [AXI_ST_FIFO_WIDTH-1:0] dc_fifo_in, dc_fifo_out;
wire  [AXI_ST_FIFO_WIDTH-1:0] data_path_in;
wire  [DWIDTH - 1:0]        tx_tdata_in_f, tx_tdata_validated;
wire                        latency_trig;
wire                        dc_fifo_almost_full;

// TX packer
wire  [payload_width - 1:0] tx_packer_data;
wire  [255:0]               tx_packer_header;
wire                        tx_packer_ready;
wire                        tx_packer_valid_data;
wire                        tx_packer_valid_hdr;
wire  [double_width-1:0]    tx_packer_valid;
wire  [double_width-1:0]    tx_packer_sop;
wire  [double_width-1:0]    tx_packer_eop;
wire                        dm_pwruser_mode;
// TX Build
wire                        hdr_insert_ready;
wire                        data_delayed;
wire                        tx_st_valid_out;
wire  [double_width-1:0]    tx_st_sop_out;
wire  [double_width-1:0]    tx_st_eop_out;
wire  [payload_width - 1:0] tx_data_out;
wire  [hdr_width-1:0]       tx_hdr_out;
wire  [pfx_width-1:0]       tx_prfx_out;

// AVST Interface -- using skid buffer pipeline
wire   [double_width-1:0]   tx_st_valid_r, tx_st_valid_ir;
wire   [double_width-1:0]    tx_st_sop_r, tx_st_sop_ir;
wire   [double_width-1:0]    tx_st_eop_r, tx_st_eop_ir;
reg   [payload_width-1:0]   tx_st_data_r;
reg   [payload_width/8-1:0] tx_st_data_par_r;
reg   [hdr_width-1:0]       tx_st_hdr_r;
reg   [hdr_width/8-1:0]     tx_st_hdr_par_r;
reg   [pfx_width-1:0]       tx_st_tlp_prfx_r;
reg   [pfx_width/8-1:0]     tx_st_tlp_prfx_par_r;
reg   [double_width*4-1:0]  tx_prfx_type_r;
reg                         tx_prfx_present_r;
reg   [SS_PF_WD-1:0]        tx_pf_number_r;
reg   [SS_VF_WD-1:0]        tx_vf_number_r;
reg                         tx_vf_active_r;
reg   [double_width*4-1:0]  tx_bar_number_r;
reg   [SS_SLOT_WD-1:0]      tx_slot_number_r;
reg                         tx_mm_mode_r;
//reg                         tx_st_ready_r;
wire                        tx_st_ready_i;
wire  [double_width-1:0]    tx_st_sop_i;
wire  [hdr_width-1:0]       tx_st_hdr_i;

wire  [payload_width/8-1:0] tx_st_data_par_i;
wire  [hdr_width/8-1:0]     tx_st_hdr_par_i;
wire  [pfx_width/8-1:0]     tx_st_tlp_prfx_par_i;
wire  [double_width*4-1:0]  tx_prfx_type_i;
wire                        tx_prfx_present_i;
wire  [SS_PF_WD-1:0]        tx_pf_number_i;
wire  [SS_VF_WD-1:0]        tx_vf_number_i;
wire                        tx_vf_active_i;
wire  [double_width*4-1:0]  tx_bar_number_i;
wire  [SS_SLOT_WD-1:0]      tx_slot_number_i;
wire                        tx_mm_mode_i;  

wire                        warm_rst_n_coreclk;
wire                        warm_rst_n_coreclk2;
wire                        warm_rst_n_coreclk3;
wire                        warm_rst_n_axi_st_clk;
wire                        warm_rst_n_axi_lite;
// Subsystem reset request
reg                         ss_rst_st, nxt_ss_rst_st;
wire                        subsystem_rst_req_sync;
wire                        ss_reset_req;
// Performance Monitor
wire                        pm_s0_sop, pm_s1_sop;
wire  [31:0]                pm_s0_hdr, pm_s1_hdr;

// TX Data Builder.data_tkeep-seg tied low
wire  [payload_width/128 -1:0] tx_data_builder_tkeep_seg;

integer i;
genvar gi;
                   
// Reset synchronizer
  altera_std_synchronizer coreclk_warm_rst_n
  (
    .clk      (coreclkout_hip),
    .reset_n  (warm_rst_n),
    .din      (1'b1),
    .dout     (warm_rst_n_coreclk)
  );

  altera_std_synchronizer coreclk_warm_rst_n2
  (
    .clk      (coreclkout_hip),
    .reset_n  (warm_rst_n),
    .din      (1'b1),
    .dout     (warm_rst_n_coreclk2)
  );

  altera_std_synchronizer coreclk_warm_rst_n3
  (
    .clk      (coreclkout_hip),
    .reset_n  (warm_rst_n),
    .din      (1'b1),
    .dout     (warm_rst_n_coreclk3)
  );

  altera_std_synchronizer axi_st_clk_warm_rst_n
  (
    .clk      (axi_st_clk),
    .reset_n  (warm_rst_n),
    .din      (1'b1),
    .dout     (warm_rst_n_axi_st_clk)
  );

  altera_std_synchronizer axi_lite_clk_warm_rst_n
  (
    .clk      (axi_lite_clk),
    .reset_n  (warm_rst_n),
    .din      (1'b1),
    .dout     (warm_rst_n_axi_lite)
  );

  localparam  RDY_LATENCY       = ST_readyLatency / 2;
  localparam  DATA_LATENCY      = ((ST_readyLatency + 1)/ 2);

// ReadyLatency = ReadyAllowance
// Implementing Latency logic in IP
// Combine input - into FIFO
//assign tx_tdata_in_f = app_ss_st_tx_tlast ? tx_tdata_validated : app_ss_st_tx_tdata;
//else begin: latency_enable
  //reg   [AXI_ST_FIFO_WIDTH-1:0] dc_fifo_in_latency [DATA_LATENCY];
  //reg                           app_tvalid_latency_i [DATA_LATENCY];
  //assign  latency_trig = (dc_fifo_wrusedw == (2**DC_FIFO_AWIDTH - (ST_readyLatency + FIFO_BUFFER)));


assign  data_path_in = {app_ss_st_tx_tlast, app_ss_st_tx_tuser_vendor, app_ss_st_tx_tuser, fifo_gen_tkeep, app_ss_st_tx_tdata};

assign dc_fifo_in = data_path_in;
assign app_tready_latency = app_ss_st_tx_tready_r & (~ss_reset_req);
assign app_tvalid_latency = app_ss_st_tx_tvalid;

always @(posedge axi_st_clk or negedge warm_rst_n_axi_st_clk)
begin
  if (!warm_rst_n_axi_st_clk)
  begin
    app_ss_st_tx_tready_r <= 1'b0;
    latency_ready_r <= 0;
  end
  else
  begin
    app_ss_st_tx_tready_r <= ~dc_fifo_almost_full;

    latency_ready_r[0] <= app_ss_st_tx_tready_r;
    for (i=1; i < ST_readyLatency; i=i+1) 
      latency_ready_r[i] <= latency_ready_r[i-1];
  end
end

if (ST_readyLatency == 0) begin: rdy_latency_0
  assign latency_ready = app_ss_st_tx_tready_r;
end
else begin: rdy_latency
  assign latency_ready = latency_ready_r[ST_readyLatency - 1];
end

// FIFO & logics
assign  dc_fifo_wrreq =  app_tvalid_latency & (~dc_fifo_wrfull) & latency_ready;
assign  dc_fifo_almost_full = (dc_fifo_wrusedw >= (2**DC_FIFO_AWIDTH - (ST_readyLatency + FIFO_BUFFER)));

// only start ready from fifo when at least 1 payload is completed. This is
// to avoid having bubble in payload xfer to QHIP.
assign  dc_fifo_rdreq = tx_packer_ready & (~dc_fifo_rdempty);

generate
  for (gi=0; gi<DWIDTH/128; gi=gi+1)
  begin: segmented_tkeep
    assign fifo_gen_tkeep[gi] = app_ss_st_tx_tkeep[gi*16];  // dividing to 128 bit segment
  end
endgenerate 

// Combine input - into FIFO
//assign tx_tdata_in_f = app_ss_st_tx_tlast ? tx_tdata_validated : app_ss_st_tx_tdata;
//assign  dc_fifo_in = {app_ss_st_tx_tlast, app_ss_st_tx_tuser_vendor, app_ss_st_tx_tuser, fifo_gen_tkeep, app_ss_st_tx_tdata};

 dcfifo  # (
    .lpm_width                (AXI_ST_FIFO_WIDTH),
    .lpm_widthu               (DC_FIFO_AWIDTH),
    .lpm_numwords             (2**DC_FIFO_AWIDTH),
    .overflow_checking        ("OFF"),
    .underflow_checking       ("OFF"),
    .ram_block_type           ("M20K"),
    //.rdsync_delaypipe         (3),
    //.wrsync_delaypipe         (3),
    .use_eab                  ("ON"),
    .read_aclr_synch          ("ON"),
    .enable_ecc               ( "FALSE"                       ),
    .intended_device_family   ( device_family             ),
    .lpm_hint                 ( "RAM_BLOCK_TYPE=M20K,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"),
    .lpm_showahead            ( "OFF"                         ),
    .lpm_type                 ( "dcfifo"                      ),
    .rdsync_delaypipe         ( 4                             ),
    .write_aclr_synch         ( "OFF"                          ),
    .wrsync_delaypipe         ( 4                             )
 ) axi_st_intf_fifo (
    .data (dc_fifo_in),
    .rdclk (coreclkout_hip),
    .rdreq (dc_fifo_rdreq),
    .wrclk (axi_st_clk),
    .wrreq (dc_fifo_wrreq),
    .q (dc_fifo_out),
    .rdempty (dc_fifo_rdempty),
    .wrfull (dc_fifo_wrfull),
    .wrusedw (dc_fifo_wrusedw),
    .aclr (~warm_rst_n_axi_st_clk)
);

// split output
assign  fifo_out_tvalid = dc_fifo_rdreq_r;
assign  fifo_out_tlast =  dc_fifo_out[DWIDTH + DWIDTH/128 + 8 + 2];
assign  fifo_out_tuser_vendor = dc_fifo_out[DWIDTH + DWIDTH/128 + 8 + 2 - 1:DWIDTH + DWIDTH/128 + 8];
assign  fifo_out_tuser = dc_fifo_out[DWIDTH + DWIDTH/128 + 8 - 1: DWIDTH + DWIDTH/128];
assign  fifo_out_tkeep = dc_fifo_out[DWIDTH + DWIDTH/128 - 1: DWIDTH];
assign  fifo_out_tdata = dc_fifo_out[DWIDTH-1:0];

always @(posedge coreclkout_hip or negedge warm_rst_n_coreclk)
begin
  if (!warm_rst_n_coreclk)
  begin
    //tx_st_ready_r <= 1'b0;
    dc_fifo_rdreq_r <= 1'b0;
  end
  else
  begin
    dc_fifo_rdreq_r <= dc_fifo_rdreq; // AB: check whether need to wait for tx_st_ready before update
    //tx_st_ready_r <= tx_st_ready;
  end
end

// Ready - need to make enough buffer for readylatency: latency > sc_fifo available buffer
//assign  app_ss_st_tx_tready = app_ss_st_tx_tready_r & (~ss_reset_req);
assign  app_ss_st_tx_tready = app_tready_latency;

// TX packer
altpcied_tx_packer #(
   .DWIDTH          (DWIDTH),
   .payload_width   (payload_width),
   .pcie_link_width (pcie_link_width),
   .hdr_width       (hdr_width),
   .double_width    (double_width),
   //.TLAST_AWIDTH    (DC_FIFO_AWIDTH),
   .SEGMENT_SIZE    (SEGMENT_SIZE),
   .TILE            (TILE),
   .device_family   (device_family)
) altpcied_tx_packer_inst (
		.clk (coreclkout_hip),
		.reset_n (warm_rst_n_coreclk3),
		.axi_s_fifo_tdata (fifo_out_tdata), // [DWIDTH - 1:0]
		.axi_s_fifo_tvalid (fifo_out_tvalid),
		.axi_s_fifo_tkeep (fifo_out_tkeep), // [DWIDTH/8 - 1:0]
		.axi_s_fifo_tlast (fifo_out_tlast),
		.axi_s_fifo_tuser_vendor (fifo_out_tuser_vendor), // [1:0]
		.axi_s_fifo_tuser (fifo_out_tuser), // [7:0]
		.tx_data (tx_packer_data),
		.tx_header (tx_packer_header), // [255:0]
		//.tx_st_ready (tx_st_ready),
		.tx_st_ready (tx_st_ready_i),
		.tx_packer_ready (tx_packer_ready),
		.tx_st_valid_hdr (tx_packer_valid_hdr),
		.tx_st_valid    (tx_packer_valid),
		.tx_st_sop (tx_packer_sop),
		.tx_st_eop (tx_packer_eop),
    .dm_pwruser_mode (dm_pwruser_mode)
);

// TX Data Builder
tx_data_builder # (
    .payload_width   (payload_width  ),
    .hdr_width       (hdr_width      ),
    .pfx_width       (pfx_width      ),
    .double_width    (double_width   ),
    .pcie_link_width (pcie_link_width),
    .SS_PWIDTH       (SS_PWIDTH      ),
    .SS_SLOT_WD      (SS_SLOT_WD     ),
    .SS_PF_WD        (SS_PF_WD       ),
    .SS_VF_WD        (SS_VF_WD       ),
    .TX_HDR_ENDIAN   ("big"          ),
    .TILE            (TILE           )
) tx_data_builder_inst (
    .clk (coreclkout_hip),
    .reset_n (warm_rst_n_coreclk),
    .data_tkeep_seg (tx_data_builder_tkeep_seg),
    .tx_tdata_in (tx_packer_data), // [DWIDTH - 1:0]
    .tx_tdata_valid_in (tx_packer_valid), // [DWIDTH - 1:0]
    .tx_hdr_valid_in (tx_packer_valid_hdr),
    .tx_hdr_in (tx_packer_header), // [255:0]
    .tx_sop (tx_packer_sop),
    .tx_eop (tx_packer_eop),
    .dm_pwruser_mode (dm_pwruser_mode),
    .tx_data_out (tx_data_out), // [DWIDTH - 1:0]
    .tx_hdr_out (tx_hdr_out), // [127:0]
    .tx_prfx_out (tx_prfx_out), // [23:0]
    .tx_prfx_type_out (tx_prfx_type_i), // [4:0]
    .tx_prfx_present_out (tx_prfx_present_i),
    .tx_pf_number_out (tx_pf_number_i), // [2:0]
    .tx_vf_number_out (tx_vf_number_i), // [10:0]
    .tx_vf_active_out (tx_vf_active_i),
    .tx_bar_number_out (tx_bar_number_i), // [3:0]
    .tx_slot_number_out (tx_slot_number_i), // [4:0]
    .tx_mm_mode (tx_mm_mode_i)
);

assign tx_data_builder_tkeep_seg = {(payload_width/128){1'b0}};

generate
  for (gi=0; gi < payload_width/8; gi=gi+1)
  begin: data_par_gen
    assign tx_st_data_par_i[gi] = ^(tx_data_out[(gi+1)*8-1:gi*8]);
  end

  for (gi=0; gi < hdr_width/8; gi=gi+1)
  begin: hdr_par_gen
    assign tx_st_hdr_par_i[gi] = ^(tx_hdr_out[(gi+1)*8-1:gi*8]);
  end

  for (gi=0; gi < pfx_width/8; gi=gi+1)
  begin: tlp_prfx_par_gen
    assign tx_st_tlp_prfx_par_i[gi] = ^(tx_prfx_out[(gi+1)*8-1:gi*8]);
  end
endgenerate

// AB: Need to add debug and performance circuit
  // Back Pressure Debug
generate
  if (BP_DEBUG_MON_EN) begin : gen_bp_debug_mon_tx_adaptor
    pciess_bp_debug tx_hip_bp_cycle_debug
    (
      .core_clk                 ( coreclkout_hip            ),
      .csr_clk                  ( axi_lite_clk              ),
      .core_rst_n               ( warm_rst_n_coreclk2       ),
      .csr_rst_n                ( warm_rst_n_axi_lite       ),
      .bp_enable                ( ~tx_st_ready_i            ),
      .we_bp_cycle              ( we_DM_TX_BP_CYCLES_count  ),
      .bp_cycle_count           ( DM_TX_BP_CYCLES_count_i   ),
      .bp_cycle_count_clear     ( DM_TX_BP_CYCLES_count_clear),
      .bp_cycle_overflow        ( DM_TX_BP_CYCLES_overflow  ),
      .bp_cycle_overflow_clear  ( DM_TX_BP_CYCLES_overflow_clear)
    );

    pciess_bp_debug tx_hia_bp_cycle_debug
    (
      .core_clk                 ( axi_st_clk                ),
      .csr_clk                  ( axi_lite_clk              ),
      .core_rst_n               ( warm_rst_n_axi_st_clk     ),
      .csr_rst_n                ( warm_rst_n_axi_lite       ),
      .bp_enable                ( ~app_ss_st_tx_tready_r    ),
      .we_bp_cycle              ( we_HIA_TX_BP_CYCLES_count ),
      .bp_cycle_count           ( HIA_TX_BP_CYCLES_count_i  ),
      .bp_cycle_count_clear     ( HIA_TX_BP_CYCLES_count_clear),
      .bp_cycle_overflow        ( HIA_TX_BP_CYCLES_overflow ),
      .bp_cycle_overflow_clear  ( HIA_TX_BP_CYCLES_overflow_clear)
    );
  end
  else begin : gen_bp_debug_mon_tx_adaptor
    assign we_HIA_TX_BP_CYCLES_count = 1'b0;
    assign HIA_TX_BP_CYCLES_count_i= 31'h0;
    assign HIA_TX_BP_CYCLES_overflow = 1'b0;
    assign we_DM_TX_BP_CYCLES_count = 1'b0;
    assign DM_TX_BP_CYCLES_count_i= 31'h0;
    assign DM_TX_BP_CYCLES_overflow  = 1'b0;
  end
endgenerate

  //Performance Monitor
  if (payload_width == 1024) begin
    assign pm_s0_sop = 1'b0;  // ?? add for Gen5x16
    assign pm_s1_sop = 1'b0;  // ?? add for Gen5x16
    assign pm_s0_hdr = 32'h0; // ?? add for Gen5x16 
    assign pm_s1_hdr = 32'h0; // ?? add for Gen5x16
  end
  else if (payload_width == 512) begin
    assign pm_s0_sop = tx_st_sop_i[0];
    assign pm_s1_sop = tx_st_sop_i[1];
    assign pm_s0_hdr = tx_st_hdr_i[127 -:32]; 
    assign pm_s1_hdr = tx_st_hdr_i[255 -:32]; 
  end
  else begin 
    assign pm_s0_sop = tx_st_sop_i[0];
    assign pm_s1_sop = 1'b0;
    assign pm_s0_hdr = tx_st_hdr_i[127 -:32]; 
    assign pm_s1_hdr = 32'h0;
  end

  generate
    if (PERFMON_EN) begin : gen_perfmon_tx_adaptor
      pciess_performance_monitor u_hia_tx_performance_monitor
      (
        .core_clk                    ( coreclkout_hip                   ),
        .csr_clk                     ( axi_lite_clk                     ),
        .core_rst_n                  ( warm_rst_n_coreclk2              ),
        .csr_rst_n                   ( warm_rst_n_axi_lite              ),
        .s0_sop                      ( pm_s0_sop                        ),
        .s1_sop                      ( pm_s1_sop                        ),
        .s0_hdr                      ( pm_s0_hdr                        ),
        .s1_hdr                      ( pm_s1_hdr                        ),
        .PERFMON_CTRL_global_enable  ( PERFMON_CTRL_global_enable       ),
        .PERFMON_CTRL_clear_counters ( PERFMON_CTRL_clear_counters      ),
        .we_MRD_TLP_num              ( we_TX_MRD_TLP_num                ),
        .MRD_TLP_num                 ( TX_MRD_TLP_num_i                 ),
        .MRD_TLP_num_clear           ( TX_MRD_TLP_num_clear             ),
        .we_MWR_TLP_num              ( we_TX_MWR_TLP_num                ),
        .MWR_TLP_num                 ( TX_MWR_TLP_num_i                 ),
        .MWR_TLP_num_clear           ( TX_MWR_TLP_num_clear             ),
        .we_MSG_TLP_num              ( we_TX_MSG_TLP_num                ),
        .MSG_TLP_num                 ( TX_MSG_TLP_num_i                 ),
        .MSG_TLP_num_clear           ( TX_MSG_TLP_num_clear             ),
        .we_CFGWR_TLP_num            ( we_TX_CFGWR_TLP_num              ),
        .CFGWR_TLP_num               ( TX_CFGWR_TLP_num_i               ),
        .CFGWR_TLP_num_clear         ( TX_CFGWR_TLP_num_clear           ),
        .we_CFGRD_TLP_num            ( we_TX_CFGRD_TLP_num              ),
        .CFGRD_TLP_num               ( TX_CFGRD_TLP_num_i               ),
        .CFGRD_TLP_num_clear         ( TX_CFGRD_TLP_num_clear           ),
        .we_MEM_DATA_byte            ( we_TX_MEM_DATA_byte              ),
        .MEM_DATA_byte               ( TX_MEM_DATA_byte_i               ),
        .MEM_DATA_byte_clear         ( TX_MEM_DATA_byte_clear           ),
        .we_CPL_DATA_byte            ( we_TX_CPL_DATA_byte              ),
        .CPL_DATA_byte               ( TX_CPL_DATA_byte_i               ),
        .CPL_DATA_byte_clear         ( TX_CPL_DATA_byte_clear           )
      );
    end
    else begin : gen_perfmon_tx_adaptor
        assign we_TX_MRD_TLP_num = 1'b0;
        assign TX_MRD_TLP_num_i= 32'h0;
        assign we_TX_MWR_TLP_num = 1'b0;
        assign TX_MWR_TLP_num_i= 32'h0;
        assign we_TX_MSG_TLP_num = 1'b0;
        assign TX_MSG_TLP_num_i= 32'h0;
        assign we_TX_CFGWR_TLP_num = 1'b0;
        assign TX_CFGWR_TLP_num_i= 32'h0;
        assign we_TX_CFGRD_TLP_num = 1'b0;
        assign TX_CFGRD_TLP_num_i= 32'h0;
        assign we_TX_MEM_DATA_byte = 1'b0;
        assign TX_MEM_DATA_byte_i= 32'h0;
        assign we_TX_CPL_DATA_byte = 1'b0;
        assign TX_CPL_DATA_byte_i= 32'h0;
    end
  endgenerate

// FSM for subsytem reset
// It need to monitor incoming packets, sync to axi_st_clk
// Assumption: subsystem_rst_req will be hold till subsystem_rst_rdy is asserted
  altera_std_synchronizer ss_rst_req_sync
  (
    .clk      (axi_st_clk),
    .reset_n  (warm_rst_n),
    .din      (subsystem_rst_req),
    .dout     (subsystem_rst_req_sync)
  );
localparam  SS_RST_IDLE       = 1'b0;
localparam  SS_RST_RDY        = 1'b1;
always @(posedge axi_st_clk or negedge warm_rst_n_axi_st_clk)
begin
  if (!warm_rst_n_axi_st_clk)
  begin
    ss_rst_st <= SS_RST_IDLE;
  end
  else
  begin
    ss_rst_st <= nxt_ss_rst_st; 
  end
end

always @(*)
begin
  nxt_ss_rst_st = ss_rst_st;
 
  case (ss_rst_st)
  SS_RST_IDLE:  begin
                if (subsystem_rst_req_sync)
                  nxt_ss_rst_st = SS_RST_RDY;
                //else if (app_tvalid_latency && !app_ss_st_tx_tlast)
                //  nxt_ss_rst_st = SS_IN_PKT;
                //else
                //  nxt_ss_rst_st = SS_RST_IDLE;
                end
 /* SS_IN_PKT:    begin
                if (app_ss_st_tx_tlast)
                  if (subsystem_rst_req_sync)
                    nxt_ss_rst_st = SS_RST_REQ;
                  else 
                    nxt_ss_rst_st = SS_RST_IDLE;
                else
                  nxt_ss_rst_st = SS_IN_PKT;
                end
  SS_RST_REQ:   begin
                if (tx_st_eop_r)
                  nxt_ss_rst_st = SS_RST_RDY;
                else  
                  nxt_ss_rst_st = SS_RST_REQ;
                end*/
  SS_RST_RDY:   begin
                //if (!subsystem_rst_req_sync)
                //  nxt_ss_rst_st = SS_RST_IDLE;
                //else
                  nxt_ss_rst_st = SS_RST_RDY; // wait for reset once in this state
                end
  default:  nxt_ss_rst_st = SS_RST_IDLE;
  endcase
end

assign ss_reset_req = (ss_rst_st == SS_RST_RDY);

//** Remove the extra pipeline since the pipeline in tx_data_builder has been removed.
// AVST Interface - registered all output
//always @(posedge coreclkout_hip or negedge warm_rst_n_coreclk)
//begin
//  if (!warm_rst_n_coreclk)
//  begin
//    tx_st_valid_ir <= 0;
//    tx_st_sop_ir <= 0;
//    tx_st_eop_ir <= 0;
//  end
//  else
//  begin
//    tx_st_valid_ir <= tx_packer_valid;  // need to xtra pipeline to match data
//    tx_st_sop_ir <= tx_packer_sop;      // need to xtra pipeline to match data
//    tx_st_eop_ir <= tx_packer_eop;      // need to xtra pipeline to match data
//  end
//end

assign tx_st_valid_ir = tx_packer_valid;
assign tx_st_sop_ir = tx_packer_sop;
assign tx_st_eop_ir = tx_packer_eop;

localparam PIPELINE_WIDTH = (double_width * 11) + payload_width + payload_width/8 + hdr_width + hdr_width/8 + 
                             pfx_width + pfx_width/8 + SS_PF_WD + SS_VF_WD + SS_SLOT_WD + 1 + 1 + 1;

wire  [PIPELINE_WIDTH - 1:0] rdy_pipeline_data_in, rdy_pipeline_data_out;
assign  rdy_pipeline_data_in = {tx_st_valid_ir, tx_st_sop_ir, tx_st_eop_ir, tx_data_out, tx_st_data_par_i, tx_hdr_out,
                                tx_st_hdr_par_i, tx_prfx_out, tx_st_tlp_prfx_par_i, tx_prfx_type_i, tx_prfx_present_i,
                                tx_pf_number_i, tx_vf_number_i, tx_vf_active_i, tx_bar_number_i, tx_slot_number_i, tx_mm_mode_i};


//Delayed tx_st_ready by 3 clock cycles
reg tx_st_ready_p0, tx_st_ready_p1, tx_st_ready_delay;

always @(posedge coreclkout_hip or negedge warm_rst_n_coreclk)
begin
  if (!warm_rst_n_coreclk)
  begin
    tx_st_ready_p0 <= 0;
    tx_st_ready_p1 <= 0;
    tx_st_ready_delay <= 0;
  end
  else
  begin
    tx_st_ready_p0 <= tx_st_ready;
    tx_st_ready_p1 <= tx_st_ready_p0;
    tx_st_ready_delay <= tx_st_ready_p1;
  end
end

//pciess_skid_buffer #(.DATA_WIDTH (PIPELINE_WIDTH))
//ready_pipeline_inst0 (
//   .clk (coreclkout_hip),
//   .rst_n (warm_rst_n_coreclk),
//   .in_ready (tx_st_ready_i), // output
//   .in_valid (|tx_st_valid_ir),
//   .in_data (rdy_pipeline_data_in),
//   .out_ready (tx_st_ready_delay),  // input, use delayed tx_st_ready to ensure data only get transferred after 3 clocks.
//   .out_valid (tx_st_valid_out),
//   .out_data (rdy_pipeline_data_out)
//);

pciess_data_pipeline #(
  .PIPELINE_READY           ( 1                         ),
  .SYNC_RESET               ( 0                         ),
  .DATA_WIDTH               ( PIPELINE_WIDTH       	)
) ready_pipeline_inst0 (
  .clk                      ( coreclkout_hip            ),
  .reset                    ( ~warm_rst_n_coreclk       ),
  .in_ready                 ( tx_st_ready_i             ),
  .in_valid                 ( |tx_st_valid_ir           ),
  .in_data                  ( rdy_pipeline_data_in      ),
  .out_ready                ( tx_st_ready_delay         ),
  .out_valid                ( tx_st_valid_out           ),
  .out_data                 ( rdy_pipeline_data_out     )
);

assign tx_st_sop_i = rdy_pipeline_data_out[PIPELINE_WIDTH - double_width - 1 -: double_width];
assign tx_st_hdr_i = rdy_pipeline_data_out[PIPELINE_WIDTH - (3*double_width) - payload_width - payload_width/8 - 1 -: hdr_width];

assign tx_st_valid = rdy_pipeline_data_out[PIPELINE_WIDTH - 1 -: double_width] & {double_width{tx_st_valid_out}} & {double_width{tx_st_ready_delay}}; //Gate off tx_st_valid with delayed tx_st_ready.
assign tx_st_sop = rdy_pipeline_data_out[PIPELINE_WIDTH - double_width - 1 -: double_width];
assign tx_st_eop = rdy_pipeline_data_out[PIPELINE_WIDTH - (2*double_width) - 1 -: double_width];
assign tx_st_data = rdy_pipeline_data_out[PIPELINE_WIDTH - (3*double_width) - 1 -: payload_width];
assign tx_st_data_par = rdy_pipeline_data_out[PIPELINE_WIDTH - (3*double_width) - payload_width - 1 -: (payload_width/8)];
assign tx_st_hdr = rdy_pipeline_data_out[PIPELINE_WIDTH - (3*double_width) - payload_width - payload_width/8 - 1 -: hdr_width];
assign tx_st_hdr_par = rdy_pipeline_data_out[PIPELINE_WIDTH - (3*double_width) - payload_width - payload_width/8 - hdr_width - 1 -: (hdr_width/8)];
assign tx_st_tlp_prfx = rdy_pipeline_data_out[SS_SLOT_WD + 3 + double_width*8 + SS_VF_WD + SS_PF_WD + pfx_width/8 +: pfx_width];
assign tx_st_tlp_prfx_par = rdy_pipeline_data_out[SS_SLOT_WD + 3 + double_width*8 + SS_VF_WD + SS_PF_WD +: pfx_width/8];
assign tx_prfx_type_out = rdy_pipeline_data_out[SS_SLOT_WD + 3 + double_width*4 + SS_VF_WD + SS_PF_WD +: double_width*4];
assign tx_prfx_present_out = rdy_pipeline_data_out[SS_SLOT_WD + 2 + double_width*4 + SS_VF_WD + SS_PF_WD];
assign tx_pf_number_out = rdy_pipeline_data_out[SS_SLOT_WD + 2 + double_width*4 + SS_VF_WD +: SS_PF_WD];
assign tx_vf_number_out = rdy_pipeline_data_out[SS_SLOT_WD + 2 + double_width*4 +: SS_VF_WD];
assign tx_vf_active_out =  rdy_pipeline_data_out[SS_SLOT_WD + 1 + double_width*4];
assign tx_bar_number_out = rdy_pipeline_data_out[SS_SLOT_WD + 1 +: double_width*4];
assign tx_slot_number_out = rdy_pipeline_data_out[SS_SLOT_WD : 1];
assign tx_mm_mode = rdy_pipeline_data_out[0];

assign subsystem_rst_rdy = (ss_rst_st == SS_RST_RDY);
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63eWVItLJsj61eTZFAZWiVSYPc5E8vt+rsQ+ovSdc2tdQNLOUJaujK4z0J9P0CCB90QYykh8kc79dn5uTe3WIjvj1TVHMJPUX35JInz2tTpTfta7l4e8zqM9XZEgD9MZZz4/qU71ImHYfB04xIULZtcB1AgYHbd4ZWgEepelxBK1aUKR2K+7KjajoLz1bg9gE1hH1JTEl5uaUwxXsHbHETxA4dS3pA2K20214OYswe3l39ZgLnYafaSRFEiyZbA6Hjx48lM0oruOS0phT6riQpBgG5+WHIMznEi7NF3bDdzbqTRbGg7cvW8GxIkV5zm3M7Vxu6OUMWD63WUpyEUJZigTC2sCCkw8d+rTRfmK148lp5IS6xx50KP7td4bG00xGeOYSRs3uX5LOVNGcOv3NpZu9Aks58vdWDipmZpNoTriZ6WuuCvXQg3CYtWR+jyS6nWHqqh+PNFqDU1YThJ0puEwLfPuoJMDs2cteNcWauMRhApRnKcs+h9hbuSK8DFA5TL55BOF6PS8ls6AdATL2ltbykk0yYIbcw34V7Yx2YbEZlWMPqe4c7Vc+KTpOY/HN1T33t317mSW1Y4hpmQ+qkgXvL/+4TC1daghOosr3pwvJzHC010K30vns9mGagJWxdjhbocFHeQw856aW1N9v8/grFmsW0aGXeyZuvpJI/CsMnIuHAwFHXWjgpGct8uI2EVi7isw4+ukzfrMsAnCf3X0oMWfYIfsnDVtalhqQVZX5BOK5Pj7czPJAH/pE4rzknKnrC3EqrnfucEWiCpig5HF"
`endif