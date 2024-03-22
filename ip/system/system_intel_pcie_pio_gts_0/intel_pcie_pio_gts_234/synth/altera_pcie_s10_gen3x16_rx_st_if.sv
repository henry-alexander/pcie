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



module  altera_pcie_s10_gen3x16_rx_st_if
 #(
    parameter pld_rx_parity_ena = "enable",
    parameter enable_sriov_hwtcl = 0,
    parameter intended_device_family  = "Stratix 10"
  )(
    input logic              clk500,
    input logic              rst,
 
    input logic              clk250,
    input logic              rst_clk250,
 
    //avst rx interface
    input logic              rx_st_ready_i,
    input logic              rx_st_sop_i,
    input logic              rx_st_eop_i,
    input logic [255:0]      rx_st_data_i,
	input logic [127:0]      rx_st_hdr_i,
	input logic [31:0]       rx_st_prefix_i,
    input logic [31:0]	     rx_st_data_par_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
    input logic [15:0]	     rx_st_hdr_par_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
    input logic [3:0]	     rx_st_prefix_par_i,		// To u_rx_st_if of altera_pcie_s10_gen3x16_rx_st_if.v
    input logic              rx_st_valid_i,
	input logic              rx_st_tlp_abort_i,
    input logic [2:0]        rx_st_bar_range_i,
    input logic [2:0]        rx_st_empty_i,
    input logic              rx_st_vf_active_i,
    input logic [2:0]        rx_st_func_num_i,
    input logic [10:0]       rx_st_vf_num_i,
 
 
 
    output logic [1:0]       rx_st_valid_o,
    output logic             rx_st_ready_o,
    output logic [1:0]       rx_st_sop_o,
    output logic [1:0]       rx_st_eop_o,
    output logic [256*2-1:0] rx_st_data_o,
	output logic [128*2-1:0] rx_st_hdr_o,
	output logic [32*2-1:0]  rx_st_prefix_o,
    output logic [63:0]	     rx_st_data_par_o,
    output logic [31:0]	     rx_st_hdr_par_o,
    output logic [7:0]	     rx_st_prefix_par_o,
	output logic [1:0]       rx_st_tlp_abort_o,
    output logic [3*2-1:0]   rx_st_bar_range_o,
    output logic [3*2-1:0]   rx_st_empty_o,
    output logic [1:0]       rx_st_vf_active_o,
    output logic [5:0]       rx_st_func_num_o,
    output logic [21:0]      rx_st_vf_num_o
    );
 
    localparam   par_sriov   = (pld_rx_parity_ena == "enable" && enable_sriov_hwtcl)? 1 : 0;
    localparam   only_sriov  = (pld_rx_parity_ena != "enable" && enable_sriov_hwtcl)? 1 : 0;
    localparam   only_par    = (pld_rx_parity_ena == "enable" && !enable_sriov_hwtcl)? 1 : 0;
 
    logic                    rx_st_ready;
    logic                    rx_st_ready_reg;
    logic                    rx_st_vf_active_q,rx_st_vf_active_q1 /*synthesis_preserve*/;
    logic [2:0]              rx_st_func_num_q,rx_st_func_num_q1 /*synthesis_preserve*/;
    logic [10:0]             rx_st_vf_num_q,rx_st_vf_num_q1 /*synthesis_preserve*/;
	logic                    rx_st_tlp_abort_q,rx_st_tlp_abort_q1 /*synthesis_preserve*/;
    logic [5:0]              fill_count;
    logic                    rx_st_sop_q,rx_st_sop_q1 /*synthesis_preserve*/;
    logic                    rx_st_eop_q,rx_st_eop_q1 /*synthesis_preserve*/;
    logic [255:0]            rx_st_data_q,rx_st_data_q1 /*synthesis_preserve*/;
	logic[127:0] rx_st_hdr_q, rx_st_hdr_q1 /*synthesis_preserve*/;
	logic[31:0] rx_st_prefix_q, rx_st_prefix_q1 /*synthesis_preserve*/;
    logic [ 31:0]            rx_st_data_par_q,rx_st_data_par_q1 /*synthesis_preserve*/;
    logic [ 15:0]            rx_st_hdr_par_q,rx_st_hdr_par_q1 /*synthesis_preserve*/;
    logic [ 3:0]             rx_st_prefix_par_q,rx_st_prefix_par_q1 /*synthesis_preserve*/;
    logic                    rx_st_valid_q,rx_st_valid_q1 /*synthesis_preserve*/;
    logic [ 2:0]             rx_st_bar_range_q,rx_st_bar_range_q1 /*synthesis_preserve*/;
    logic [ 2:0]             rx_st_empty_q,rx_st_empty_q1 /*synthesis_preserve*/;
 
    logic                    cnt_even;   /*synthesis maxfan=16 */
    logic[127:0] rx_fifo_wr_hdr_lo, rx_fifo_wr_hdr_hi;
    logic[127:0] rx_fifo_rd_hdr_lo, rx_fifo_rd_hdr_hi;
	logic[31:0] rx_fifo_wr_prefix_lo, rx_fifo_wr_prefix_hi; 
    logic[31:0] rx_fifo_rd_prefix_lo, rx_fifo_rd_prefix_hi;
 
    logic [par_sriov? 305+1+6+20: only_par? 296+1+20 : only_sriov? 273+1+6 : 264+1:0]    rx_fifo_wrdata_lo,
                                                                                   rx_fifo_wrdata_hi;
    logic [par_sriov? 305+1+6+20: only_par? 296+1+20 : only_sriov? 273+1+6 : 264+1:0]    rx_fifo_rddata_lo,
                                                                                   rx_fifo_rddata_hi;
    logic                                                  rx_fifo_wrreq,
                                                           rx_fifo_rdreq;
    logic                                                  rx_fifo_empty,
                                                           rx_fifo_full;
    logic [5:0]                                            rx_fifo_rusedw;
    logic                                                  rx_fifo_rdreq_q;
 
    //---------------------------------------------
    //input signals flop in first to ease timing
    always_ff @ (posedge clk500)
      begin
          rx_st_sop_q    <= rx_st_sop_q1;
          rx_st_eop_q    <= rx_st_eop_q1;
          rx_st_data_q   <= rx_st_data_q1;
		  rx_st_hdr_q <= rx_st_hdr_q1;
		  rx_st_prefix_q <= rx_st_prefix_q1;
          rx_st_data_par_q   <= rx_st_data_par_q1;
          rx_st_hdr_par_q    <= rx_st_hdr_par_q1;
          rx_st_prefix_par_q <= rx_st_prefix_par_q1;
          rx_st_valid_q  <= rx_st_valid_q1;
          rx_st_bar_range_q <= rx_st_bar_range_q1;
          rx_st_empty_q  <= rx_st_empty_q1;
 
          rx_st_vf_active_q <= rx_st_vf_active_q1;
          rx_st_func_num_q  <= rx_st_func_num_q1;
          rx_st_vf_num_q    <= rx_st_vf_num_q1;
		  rx_st_tlp_abort_q <= rx_st_tlp_abort_q1;
 
          rx_st_sop_q1    <= rx_st_sop_i;
          rx_st_eop_q1    <= rx_st_eop_i;
          rx_st_data_q1   <= rx_st_data_i;
		  rx_st_hdr_q1 <= rx_st_hdr_i;
		  rx_st_prefix_q1 <= rx_st_prefix_i;
          rx_st_valid_q1  <= rx_st_valid_i;
          rx_st_bar_range_q1 <= rx_st_bar_range_i;
          rx_st_empty_q1  <= rx_st_empty_i;
          rx_st_data_par_q1   <= rx_st_data_par_i;
          rx_st_hdr_par_q1    <= rx_st_hdr_par_i;
          rx_st_prefix_par_q1 <= rx_st_prefix_par_i;
          rx_st_vf_active_q1 <= rx_st_vf_active_i;
          rx_st_func_num_q1  <= rx_st_func_num_i;
          rx_st_vf_num_q1    <= rx_st_vf_num_i;
		  rx_st_tlp_abort_q1 <= rx_st_tlp_abort_i;
 
          if (rst) begin
                rx_st_ready     <= 1'b0;
                rx_st_ready_reg <= 1'b0;
                rx_st_ready_o   <= 1'b0;
            end
         else begin
                rx_st_ready     <= rx_st_ready_i;
                rx_st_ready_reg <= (fill_count < 31);
                rx_st_ready_o   <= rx_st_ready_reg;
            end
      end
 
    //rx buffer selection logic
    always_ff @ (posedge clk500)
      begin
          if (rst)
            begin
                cnt_even <= 1'b1;
            end
          else
            begin
                cnt_even <= !rx_st_valid_q ? 1'b1 : rx_st_valid_q ? ~cnt_even : cnt_even;
            end
      end
 
	  assign rx_fifo_wr_hdr_hi = rx_st_hdr_q;
	  assign rx_fifo_wr_prefix_hi = rx_st_prefix_q;
    generate
      if (par_sriov) begin
        assign rx_fifo_wrdata_hi = {rx_st_vf_active_q,rx_st_func_num_q,rx_st_vf_num_q,rx_st_tlp_abort_q,rx_st_bar_range_q, rx_st_empty_q, rx_st_eop_q, 
                                    rx_st_sop_q, rx_st_valid_q,rx_st_prefix_par_q, rx_st_hdr_par_q, rx_st_data_par_q, rx_st_data_q};
      end
      else if (only_par)begin
        assign rx_fifo_wrdata_hi = {rx_st_tlp_abort_q,rx_st_bar_range_q, rx_st_empty_q, rx_st_eop_q, rx_st_sop_q, rx_st_valid_q,
                                    rx_st_prefix_par_q, rx_st_hdr_par_q, rx_st_data_par_q, rx_st_data_q};
      end
      else if (only_sriov) begin
        assign rx_fifo_wrdata_hi = {rx_st_vf_active_q,rx_st_func_num_q,rx_st_vf_num_q,rx_st_tlp_abort_q,rx_st_bar_range_q, rx_st_empty_q, rx_st_eop_q, rx_st_sop_q, rx_st_valid_q, rx_st_data_q};
      end
      else begin
        assign rx_fifo_wrdata_hi = {rx_st_tlp_abort_q,rx_st_bar_range_q, rx_st_empty_q, rx_st_eop_q, rx_st_sop_q, rx_st_valid_q, rx_st_data_q};
      end
    endgenerate
 
	always @(posedge clk500) begin
		rx_fifo_wr_hdr_lo <= rx_st_hdr_q;
		rx_fifo_wr_prefix_lo <= rx_st_prefix_q;
	end
 
    generate
      //async FIFO write interface
      always @ (posedge clk500) begin
 
        if (par_sriov)begin
           rx_fifo_wrdata_lo[305+6+1+20:298+20] <= {rx_st_vf_active_q,rx_st_func_num_q,rx_st_vf_num_q};
        end
        if (only_sriov)begin
           rx_fifo_wrdata_lo[273+6+1:266] <= {rx_st_vf_active_q,rx_st_func_num_q,rx_st_vf_num_q};
        end
 
        if (par_sriov || only_par) begin
          rx_fifo_wrdata_lo[287+20:0]  <= {rx_st_prefix_par_q, rx_st_hdr_par_q, rx_st_data_par_q, rx_st_data_q};
          rx_fifo_wrdata_lo[296+1+20:294+20] <= {rx_st_tlp_abort_q,rx_st_bar_range_q};
          if (rst) begin
            rx_fifo_wrdata_lo[293+20:288+20] <= '0;
          end
          else begin
            rx_fifo_wrdata_lo[293+20:288+20] <= {rx_st_empty_q, rx_st_eop_q, rx_st_sop_q, 1'b1};
          end
        end
        else begin
          rx_fifo_wrdata_lo[255:0] <= rx_st_data_q;
          rx_fifo_wrdata_lo[264+1:262] <= {rx_st_tlp_abort_q,rx_st_bar_range_q};
          if (rst) begin
             rx_fifo_wrdata_lo[261:256] <= '0;
           end
           else begin
             rx_fifo_wrdata_lo[261:256] <= {rx_st_empty_q, rx_st_eop_q, rx_st_sop_q, 1'b1};
           end
        end
      end // always @ (posedge clk500)
    endgenerate
 
 
     //async FIFO write interface
      always @ (posedge clk500)
      begin
        if (rst) begin
          rx_fifo_wrreq     <= 1'b0;
        end
        else begin
          rx_fifo_wrreq     <= rx_st_valid_q & cnt_even;
        end
      end // always @ (posedge clk500)
 
    always @ (posedge clk250)
      begin
          rx_fifo_rdreq_q <= rx_fifo_rdreq;
 
          if (rst_clk250)
            rx_fifo_rdreq <= 1'b0;
          else
            rx_fifo_rdreq <= ~rx_fifo_empty & ~(rx_fifo_rdreq & rx_fifo_rusedw <= 2) & rx_st_ready_i;
      end
    //async FIFO read interface
    always @ (posedge clk250)
      begin
	      rx_st_hdr_o  <= rx_fifo_rdreq_q? {rx_fifo_rd_hdr_hi[127:0], rx_fifo_rd_hdr_lo[127:0]} : 256'h0;
		  rx_st_prefix_o  <= rx_fifo_rdreq_q? {rx_fifo_rd_prefix_hi[31:0], rx_fifo_rd_prefix_lo[31:0]} : 64'h0;
          rx_st_data_o  <= rx_fifo_rdreq_q? {rx_fifo_rddata_hi[255:0], rx_fifo_rddata_lo[255:0]} : 512'h0;
          rx_st_data_par_o   <= (par_sriov || only_par) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[287:256], rx_fifo_rddata_lo[287:256]} : 64'h0) : 64'h0;
          rx_st_hdr_par_o    <= (par_sriov || only_par) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[287+16:288], rx_fifo_rddata_lo[287+16:288]} : 64'h0) : 64'h0;
          rx_st_prefix_par_o <= (par_sriov || only_par) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[287+20:288+16], rx_fifo_rddata_lo[287+20:288+16]} : 64'h0) : 64'h0;
          if (rst_clk250)
            begin
                rx_st_valid_o <= '0;
                rx_st_sop_o   <= '0;
                rx_st_eop_o   <= '0;
                rx_st_bar_range_o <= '0;
                rx_st_tlp_abort_o <= '0;
                rx_st_empty_o     <= '0;
                rx_st_vf_active_o <= '0;
                rx_st_func_num_o  <= '0;
                rx_st_vf_num_o    <= '0;
            end
          else
            begin
                rx_st_valid_o <= (par_sriov || only_par) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[288+20], rx_fifo_rddata_lo[288+20]} : 2'h0) : (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[256], rx_fifo_rddata_lo[256]} : 2'h0);
                rx_st_sop_o   <= (par_sriov || only_par) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[289+20], rx_fifo_rddata_lo[289+20]} : 2'h0) : (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[257], rx_fifo_rddata_lo[257]} : 2'h0) ;
                rx_st_eop_o   <= (par_sriov || only_par) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[290+20], rx_fifo_rddata_lo[290+20]} : 2'h0) : (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[258], rx_fifo_rddata_lo[258]} : 2'h0) ;
                rx_st_empty_o <= (par_sriov || only_par) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[293+20:291+20], rx_fifo_rddata_lo[293+20:291+20]} : 6'h0) : (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[261:259], rx_fifo_rddata_lo[261:259]} : 6'h0) ;
                rx_st_bar_range_o  <= (par_sriov || only_par)  ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[296+20:294+20], rx_fifo_rddata_lo[296+20:294+20]} : 6'h0) : (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[264:262], rx_fifo_rddata_lo[264:262]} : 6'h0);
				rx_st_tlp_abort_o  <= (par_sriov || only_par)  ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[296+1+20], rx_fifo_rddata_lo[296+1+20]} : 2'h0) : (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[264+1], rx_fifo_rddata_lo[264+1]} : 2'h0);
                rx_st_vf_active_o  <= (par_sriov) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[305+1+6+20], rx_fifo_rddata_lo[305+1+6+20]} : '0) : (only_sriov) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[273+1+6], rx_fifo_rddata_lo[273+1+6]} : '0) : '0 ;
                rx_st_func_num_o   <= (par_sriov) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[304+1+6+20:304+1+4+20], rx_fifo_rddata_lo[304+1+6+20:304+1+4+20]} : '0) : (only_sriov) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[272+1+6:272+1+4], rx_fifo_rddata_lo[272+1+6:272+1+4]} : '0) : '0 ;
                rx_st_vf_num_o     <= (par_sriov) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[303+1+4+20:297+1+20], rx_fifo_rddata_lo[303+1+4+20:297+1+20]} :'0) : (only_sriov) ? (rx_fifo_rdreq_q? {rx_fifo_rddata_hi[271+1+4:265+1], rx_fifo_rddata_lo[271+1+4:265+1]} :'0): '0;
            end
      end // always @ (posedge clk250)
 
        wire [par_sriov? 306+1+6 +128 +32 +20-1: only_par? 297+1 +128 +32+20-135-1 : only_sriov? 274+1+6 +128 +32-1: 265+1 +128 +32-1:0] dataa_lo;
        wire [par_sriov? 306+1+6 +128 +32 +20-1: only_par? 297+1 +128 +32+20-135-1 : only_sriov? 274+1+6 +128 +32-1: 265+1 +128 +32-1:0] dataa_lo_o;
        assign dataa_lo  = only_par? {rx_fifo_wr_hdr_lo[109:98],rx_fifo_wr_hdr_lo[77:66],
                                      rx_fifo_wr_hdr_lo[63:32],rx_fifo_wr_hdr_lo[30:18],
                                      rx_fifo_wr_hdr_lo[13:12],rx_fifo_wr_hdr_lo[9:0],
                                      rx_fifo_wrdata_lo[316:314],
                                      rx_fifo_wrdata_lo[310:308],rx_fifo_wrdata_lo[255:0]}
                                      :{rx_fifo_wr_prefix_lo,rx_fifo_wr_hdr_lo,rx_fifo_wrdata_lo};
        assign {rx_fifo_rd_prefix_lo,rx_fifo_rd_hdr_lo,rx_fifo_rddata_lo}  = only_par? {32'b0,18'b0,dataa_lo_o[342:331],20'b0,dataa_lo_o[330:319],
                                                                                        2'b0,dataa_lo_o[318:287],1'b0,dataa_lo_o[286:274],4'b0,
                                                                                        dataa_lo_o[273:272],2'b0,dataa_lo_o[271:262],1'b0,dataa_lo_o[261:259],
                                                                                        3'b0,dataa_lo_o[258:256],52'b0,dataa_lo_o[255:0]}
                                                                                        :dataa_lo_o;
	
    dcfifo rx_fifo_lo
      (
       .aclr  (rst_clk250),
       .wrclk (clk500),
       .wrreq (rx_fifo_wrreq),
       .data  (dataa_lo),
       .wrusedw(fill_count),
       .wrempty(),
       .wrfull (rx_fifo_full),
       .rdclk (clk250),
       .rdreq (rx_fifo_rdreq),
       .rdfull(),
       .rdempty(rx_fifo_empty),
       .rdusedw(rx_fifo_rusedw),
       .q      (dataa_lo_o),
       .eccstatus()
       );
    defparam
      rx_fifo_lo.add_ram_output_register  = "ON",
      rx_fifo_lo.intended_device_family  = intended_device_family,
      rx_fifo_lo.lpm_numwords = 64,
      rx_fifo_lo.lpm_width    = (par_sriov? 306+1+6 +128 +32 +20: only_par? 297+1 +128 +32+20-135 : only_sriov? 274+1+6 +128 +32: 265+1 +128 +32),
      rx_fifo_lo.lpm_widthu   = 6,
      rx_fifo_lo.overflow_checking  = "OFF",
      rx_fifo_lo.underflow_checking  = "OFF",
      rx_fifo_lo.use_eab  = "ON",
      rx_fifo_lo.write_aclr_synch = "ON", 
      //rx_fifo_lo.read_aclr_synch = "ON"; 
      rx_fifo_lo.wrsync_delaypipe = 5,
      rx_fifo_lo.rdsync_delaypipe = 5,
      rx_fifo_lo.lpm_hint = "DISABLE_EMBEDDED_TIMING_CONSTRAINT=TRUE";

      wire [5:0] wrusedw_a, rdusedw_a;
      (*noprune*) reg [5:0] dummyw;
      (*noprune*) reg [5:0] dummyr;
      
      
      always @ (posedge clk500)
      begin
      dummyw <= wrusedw_a;
      end

      always @ (posedge clk250)
      begin
      dummyr <= rdusedw_a;
      end
      
        wire [par_sriov? 306+1+6 +128 +32 +20-1: only_par? 297+1 +128 +32+20-222-1 : only_sriov? 274+1+6 +128 +32-1: 265+1 +128 +32-1:0] dataa_hi;
        wire [par_sriov? 306+1+6 +128 +32 +20-1: only_par? 297+1 +128 +32+20-222-1 : only_sriov? 274+1+6 +128 +32-1: 265+1 +128 +32-1:0] dataa_hi_o;
        assign dataa_hi  = only_par? {rx_fifo_wrdata_hi[255:0]}:{rx_fifo_wr_prefix_hi,rx_fifo_wr_hdr_hi,rx_fifo_wrdata_hi};
        assign {rx_fifo_rd_prefix_hi,rx_fifo_rd_hdr_hi,rx_fifo_rddata_hi}  = only_par? {222'b0,dataa_hi_o[255:0]}:dataa_hi_o;

    dcfifo rx_fifo_hi
      (
       .aclr  (rst_clk250),
       .wrclk (clk500),
       .wrreq (rx_fifo_wrreq),
       .data  (dataa_hi),
       .wrusedw(wrusedw_a),
       .wrempty(),
       .wrfull (),
       .rdclk (clk250),
       .rdreq (rx_fifo_rdreq),
       .rdfull(),
       .rdempty(),
       .rdusedw(rdusedw_a),
       .q      (dataa_hi_o),
       .eccstatus()
       );
    defparam
      rx_fifo_hi.add_ram_output_register  = "ON",
      rx_fifo_hi.intended_device_family  = intended_device_family,
      rx_fifo_hi.lpm_numwords = 64,
      rx_fifo_hi.lpm_width    = (par_sriov? 306+1+6 +128 +32+20: only_par? 297+1 +128 +32+20-222 : only_sriov? 274+1+6 +128 +32: 265+1 +128 +32),
      rx_fifo_hi.lpm_widthu   = 6,
      rx_fifo_hi.overflow_checking  = "OFF",
      rx_fifo_hi.underflow_checking  = "OFF",
      rx_fifo_hi.use_eab  = "ON",
      rx_fifo_hi.write_aclr_synch = "ON", 
      //rx_fifo_hi.read_aclr_synch = "ON"; 
      rx_fifo_hi.wrsync_delaypipe = 5,
      rx_fifo_hi.rdsync_delaypipe = 5,
      rx_fifo_hi.lpm_hint = "DISABLE_EMBEDDED_TIMING_CONSTRAINT=TRUE";
 
 
    /*alt_dcfifo256a4r2w1
      rx_fifo_0_data
        (
         .din_clk  (clk500),
         .din_sclr (~rst_n),
         .din_wreq (rx_fifo_wrreq),
         .din      (rx_fifo_wrdata_lo[255:0]),
         .din_wusedw(),
         .dout_clk  (clk250),
         .dout_sclr (~rst_n_clk250),
         .dout_rreq (rx_fifo_rdreq),
         .dout      (rx_fifo_rddata_lo_0[255:0]),
         .dout_rusedw(rx_fifo_rusedw[3:0])
         );
    alt_dcfifo64a4r2w1
      rx_fifo_0_ctrl
        (
         .din_clk  (clk500),
         .din_sclr (~rst_n),
         .din_wreq (rx_fifo_wrreq),
         .din      ({23'h0, rx_fifo_wrdata_lo[296:256]}),
         .din_wusedw(),
         .dout_clk  (clk250),
         .dout_sclr (~rst_n_clk250),
         .dout_rreq (rx_fifo_rdreq),
         .dout      (rx_fifo_rddata_lo_1),
         .dout_rusedw()
         );
    alt_dcfifo256a4r2w1
      rx_fifo_1_data
        (
         .din_clk  (clk500),
         .din_sclr (~rst_n),
         .din_wreq (rx_fifo_wrreq),
         .din      (rx_fifo_wrdata_hi[255:0]),
         .din_wusedw(),
         .dout_clk  (clk250),
         .dout_sclr (~rst_n_clk250),
         .dout_rreq (rx_fifo_rdreq),
         .dout      (rx_fifo_rddata_hi_0[255:0]),
         .dout_rusedw()
         );
    alt_dcfifo64a4r2w1
      rx_fifo_1_ctrl
        (
         .din_clk  (clk500),
         .din_sclr (~rst_n),
         .din_wreq (rx_fifo_wrreq),
         .din      ({23'h0, rx_fifo_wrdata_hi[296:256]}),
         .din_wusedw(),
         .dout_clk  (clk250),
         .dout_sclr (~rst_n_clk250),
         .dout_rreq (rx_fifo_rdreq),
         .dout      (rx_fifo_rddata_hi_1),
         .dout_rusedw()
         );
    */
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf/psVc8NtixD0T/1cjgqFZDAoq4nxBVAIBAABs+S4abm+I0/3+RVSCjAViuyQodriW486+lVyhRPgTLeRYx4IHHqCEMLfLfka3Qh0ZP70AXHXQOvLgMQLU4YIn8/JpmYHhHfnBH78q+W5jIGf+fP5f35DeFnVqxhlXWcm+5JS/FSrh9Nb4riLigY3Xf9Ke85O68ZRg9aovr9EnXwG0iQi+jKUscR6JDsmdHR70eAVEzDtd6SL3mUEP8Q+CTOdjqCtbz13VS5aW1KmuFRc6yYuU4d1Nyb7PLzcrn1X2AlazvCbTHCUa8BZw+CALC/wyejc6s7XUyVuUYEPbSh+hkcAdGfrXPjiqMF2rteAI1sdQEiKtp5H7PLoZ7EPksnBjHhhcSmYs8RzFowb9vVMDYDlP8ehoVbbml4KPVsV2Tld029It567sPjG7dwHiOKOdZ5ZvtPLWcf5TTtQ0NbSXXnyaqI4B96EfcColNmt8Cp5TU80X8KpzNBSfTVxqS42JguiNwfq/JJW81psTYMI1MsXPz6JrN+vTD0FC3ByeKa939b93kHn8Ahh8exsYGXXCskq0Iiniuu1ckitrjZWB/3/JFw9PRKihnouVJuv+9+9K7ef5WsPBLYBn8TyRyGgaFJzHDXGeGLpuvQbpPpDPeXJazEapK6kEvuOBkXpJxVQve6LOYHGuIHRN4pCzLCLucGz7HkwxaV7FEKNXRsvWzzV7dB+oMz4hrmY+bFsSmscdZycmFmO4Ws+/QuYZcJyDwuzlTIiwVBjJX/ydh6VeNxA6d"
`endif