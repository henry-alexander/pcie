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




module  altera_pcie_s10_gen3x16_tx_st_if
  #(
    parameter pld_tx_parity_ena = "enable",
    parameter enable_sriov_hwtcl = 0,
    parameter intended_device_family  = "Stratix 10"
  )(
    input logic             clk500,
    input logic             rst,

    input logic             clk250,
    input logic             rst_clk250,
    //avst rx interface
    input logic             tx_st_ready_i,
    input logic [1:0]       tx_st_sop_i,
    input logic [1:0]       tx_st_eop_i,
    input logic [1:0]       tx_st_err_i,
    input logic [1:0]       tx_st_vf_active_i,
    input logic [256*2-1:0] tx_st_data_i,
	input logic [128*2-1:0] tx_st_hdr_i,
	input logic [32*2-1:0]  tx_st_prefix_i,
    input logic [63:0]	    tx_st_data_par_i,
    input logic [31:0]	    tx_st_hdr_par_i,
    input logic [7:0]	    tx_st_prefix_par_i,
    input logic [1:0]       tx_st_valid_i,

    output logic            tx_st_valid_o,
    output logic            tx_st_ready_o,
    output logic            tx_st_sop_o,
    output logic            tx_st_eop_o,
    output logic            tx_st_vf_active_o,
    output logic            tx_st_err_o,
    output logic [255:0]    tx_st_data_o,
	output logic [127:0]    tx_st_hdr_o,
	output logic [31:0]     tx_st_prefix_o,
    output logic [31:0]	    tx_st_data_par_o,
    output logic [15:0]	    tx_st_hdr_par_o,
    output logic [3:0]	    tx_st_prefix_par_o
    );

    localparam   par_sriov  = (pld_tx_parity_ena == "enable" && enable_sriov_hwtcl)? 1 : 0;
    localparam   only_sriov  = (pld_tx_parity_ena != "enable" && enable_sriov_hwtcl)? 1 : 0;
    localparam   only_par  = (pld_tx_parity_ena == "enable" && !enable_sriov_hwtcl)? 1 : 0;

    logic                   tx_st_ready_q /*synthesis preserve*/;
    logic [1:0]             tx_st_vf_active_q /*synthesis preserve*/;
    logic [1:0]             tx_st_sop_q /*synthesis preserve*/;
    logic [1:0]             tx_st_eop_q/*synthesis preserve*/;
    logic [1:0]             tx_st_err_q/*synthesis preserve*/;
    logic [256*2-1:0]       tx_st_data_q/*synthesis preserve*/;
	logic [128*2-1:0]       tx_st_hdr_q/*synthesis preserve*/;
	logic [32*2-1:0]       tx_st_prefix_q/*synthesis preserve*/;
    logic [32*2-1:0]        tx_st_data_par_q/*synthesis preserve*/;
    logic [16*2-1:0]        tx_st_hdr_par_q/*synthesis preserve*/;
    logic [4*2-1:0]         tx_st_prefix_par_q/*synthesis preserve*/;
    logic [1:0]             tx_st_valid_q/*synthesis preserve*/;
    logic                   tx_st_ready;
    logic                   tx_fifo_empty_lo,tx_fifo_empty2_lo;
    logic                   pending_hi_read;

    logic                   tx_fifo_wrreq;
    logic                   tx_fifo_rdreq_lo_q,
                            tx_fifo_rdreq_hi_q/*synthesis preserve*/; /*synthesis maxfan=16 */
    logic                   tx_fifo_rd_next;
    logic                     tx_fifo_rdreq_lo;
    logic                     tx_fifo_rdreq_hi;
	logic[127:0] tx_fifo_wr_hdr_lo/*synthesis preserve*/;
	logic[127:0] tx_fifo_wr_hdr_hi/*synthesis preserve*/;
	logic[127:0] tx_fifo_rd_hdr_lo/*synthesis preserve*/;
	logic[127:0] tx_fifo_rd_hdr_hi/*synthesis preserve*/;

	logic[31:0] tx_fifo_wr_prefix_lo/*synthesis preserve*/;
	logic[31:0] tx_fifo_wr_prefix_hi/*synthesis preserve*/;
	logic[31:0] tx_fifo_rd_prefix_lo/*synthesis preserve*/;
	logic[31:0] tx_fifo_rd_prefix_hi/*synthesis preserve*/;

    logic [par_sriov ? 312  : only_par ? 311 : only_sriov? 260 : 259 :0] tx_fifo_wrdata_lo/*synthesis preserve*/,
                                                                        tx_fifo_wrdata_hi/*synthesis preserve*/;
    logic [par_sriov ? 312 : only_par ? 311 : only_sriov? 260 : 259 :0] tx_fifo_rddata_lo/*synthesis preserve*/,
                                                                        tx_fifo_rddata_hi/*synthesis preserve*/;
    
    logic                   fifo_almost_full;

    // comb reset to wait rst_clk250 and release pld_clk reset
   
    logic                   sync_comb_rst_pldclk;
    logic                   sync_comb_rst_d1, sync_comb_rst_d2;

    assign sync_comb_rst_pldclk = rst | sync_comb_rst_d2;

    always_ff @ (posedge clk500) begin
            sync_comb_rst_d1 <= rst_clk250;
            sync_comb_rst_d2 <= sync_comb_rst_d1;
    
    end

    assign tx_st_ready_o = /* tx_st_ready_q & */ !fifo_almost_full;
    //---------------------------------------------
    //input signals flop in first to ease timing
    sync_bit #(.DWIDTH(1)) u_din_gry_sync (.clk(clk250), .rst_n(!rst_clk250), .din(tx_st_ready_i), .dout(tx_st_ready_q));
    always_ff @ (posedge clk250)
      begin
          tx_st_sop_q       <= tx_st_sop_i;
          tx_st_eop_q       <= tx_st_eop_i;
          tx_st_err_q       <= tx_st_err_i;
          tx_st_data_q      <= tx_st_data_i;
		  tx_st_hdr_q      <= tx_st_hdr_i;
		  tx_st_prefix_q     <= tx_st_prefix_i;
          tx_st_data_par_q   <= tx_st_data_par_i;
          tx_st_hdr_par_q    <= tx_st_hdr_par_i;
          tx_st_prefix_par_q <= tx_st_prefix_par_i;
          tx_st_valid_q     <= tx_st_valid_i;
          tx_st_vf_active_q <= tx_st_vf_active_i;

          /* if (rst_clk250)
            begin
                //tx_st_ready   <= 1'b0;
                tx_st_ready_o <= 1'b0;
            end
          else
            begin
                //tx_st_ready   <= tx_st_ready_i;
                tx_st_ready_o <= tx_st_ready_q & !fifo_almost_full;
            end */
      end // always_ff @

    assign tx_fifo_wrreq = |tx_st_valid_q;
    assign tx_fifo_wr_hdr_lo = tx_st_hdr_q[127:0];
	assign tx_fifo_wr_hdr_hi = tx_st_hdr_q[255:128];

    assign tx_fifo_wr_prefix_lo = tx_st_prefix_q[31:0];
	assign tx_fifo_wr_prefix_hi = tx_st_prefix_q[63:32];
    generate
      if (par_sriov) begin
         assign tx_fifo_wrdata_lo = {
									 tx_st_vf_active_q[0],
                                     tx_st_eop_q[0],
                                     tx_st_sop_q[0],
                                     tx_st_valid_q[0],
                                     tx_st_err_q[0],
                                     tx_st_prefix_par_q[3:0],
                                     tx_st_hdr_par_q[15:0],
                                     tx_st_data_par_q[31:0],
                                     tx_st_data_q[255:0]};
         assign tx_fifo_wrdata_hi = {
									 tx_st_vf_active_q[1],
                                     tx_st_eop_q[1],
                                     tx_st_sop_q[1],
                                     tx_st_valid_q[1],
                                     tx_st_err_q[1],
                                     tx_st_prefix_par_q[7:4],
                                     tx_st_hdr_par_q[31:16],
                                     tx_st_data_par_q[63:32],
                                     tx_st_data_q[511:256]};
      end
      else if (only_par) begin
        assign tx_fifo_wrdata_lo = {
									tx_st_eop_q[0],
                                    tx_st_sop_q[0],
                                    tx_st_valid_q[0],
                                    tx_st_err_q[0],
                                     tx_st_prefix_par_q[3:0],
                                     tx_st_hdr_par_q[15:0],
                                     tx_st_data_par_q[31:0],
                                    tx_st_data_q[255:0]};
        assign tx_fifo_wrdata_hi = {
									tx_st_eop_q[1],
                                    tx_st_sop_q[1],
                                    tx_st_valid_q[1],
                                    tx_st_err_q[1],
                                    tx_st_prefix_par_q[7:4],
                                    tx_st_hdr_par_q[31:16],
                                    tx_st_data_par_q[63:32],
                                    tx_st_data_q[511:256]};
      end
      else if (only_sriov) begin
        assign tx_fifo_wrdata_lo = {
									tx_st_vf_active_q[0],
                                    tx_st_eop_q[0],
                                    tx_st_sop_q[0],
                                    tx_st_valid_q[0],
                                    tx_st_err_q[0],
                                    tx_st_data_q[255:0]};
        assign tx_fifo_wrdata_hi = {
									tx_st_vf_active_q[1],
                                    tx_st_eop_q[1],
                                    tx_st_sop_q[1],
                                    tx_st_valid_q[1],
                                    tx_st_err_q[1],
                                    tx_st_data_q[511:256]};
      end
      else begin
        assign tx_fifo_wrdata_lo = {
									tx_st_eop_q[0],
                                    tx_st_sop_q[0],
                                    tx_st_valid_q[0],
                                    tx_st_err_q[0],
                                    tx_st_data_q[255:0]};
        assign tx_fifo_wrdata_hi = {
									tx_st_eop_q[1],
                                    tx_st_sop_q[1],
                                    tx_st_valid_q[1],
                                    tx_st_err_q[1],
                                    tx_st_data_q[511:256]};
      end
    endgenerate
// AVST Interface
      always @ (posedge clk500) begin
	    tx_st_hdr_o   <= tx_fifo_rdreq_hi_q? tx_fifo_rd_hdr_hi[127: 0] : tx_fifo_rd_hdr_lo[127:0] ;
		tx_st_prefix_o   <= tx_fifo_rdreq_hi_q? tx_fifo_rd_prefix_hi[31: 0] : tx_fifo_rd_prefix_lo[31:0] ;
        tx_st_data_o   <= tx_fifo_rdreq_hi_q? tx_fifo_rddata_hi[255: 0] : tx_fifo_rddata_lo[255:0] ;
        tx_st_data_par_o <= (par_sriov || only_par)? (tx_fifo_rdreq_hi_q? tx_fifo_rddata_hi[256+31: 256] : tx_fifo_rddata_lo[256+31:256]) : '0;
        tx_st_hdr_par_o <= (par_sriov || only_par)? (tx_fifo_rdreq_hi_q? tx_fifo_rddata_hi[288+15: 288] : tx_fifo_rddata_lo[288+15:288]) : '0;        
        tx_st_prefix_par_o <= (par_sriov || only_par)? (tx_fifo_rdreq_hi_q? tx_fifo_rddata_hi[304+3: 304] : tx_fifo_rddata_lo[304+3:304]) : '0;
      end


      always @ (posedge clk500) begin
        if (sync_comb_rst_pldclk) begin
            tx_st_valid_o     <= 1'b0;
            tx_st_sop_o       <= 1'b0;
            tx_st_eop_o       <= 1'b0;
            tx_st_err_o       <= 1'b0;
            tx_st_vf_active_o <= 1'b0;
        end
        else begin
            tx_st_err_o       <= (par_sriov || only_par)? ((tx_fifo_rddata_lo[308] & tx_fifo_rdreq_lo_q) | (tx_fifo_rddata_hi[308] & tx_fifo_rdreq_hi_q)) : ((tx_fifo_rddata_lo[256] & tx_fifo_rdreq_lo_q) | (tx_fifo_rddata_hi[256] & tx_fifo_rdreq_hi_q));
            tx_st_valid_o     <= (par_sriov || only_par)? ((tx_fifo_rdreq_lo_q & tx_fifo_rddata_lo[309])| (tx_fifo_rdreq_hi_q & tx_fifo_rddata_hi[309])) : ((tx_fifo_rdreq_lo_q & tx_fifo_rddata_lo[256+1]) | (tx_fifo_rdreq_hi_q & tx_fifo_rddata_hi[256+1])) ;
            tx_st_sop_o       <= (par_sriov || only_par)? ((tx_fifo_rddata_lo[310] & tx_fifo_rdreq_lo_q) | (tx_fifo_rddata_hi[310] & tx_fifo_rdreq_hi_q)) : ((tx_fifo_rddata_lo[256+2] & tx_fifo_rdreq_lo_q) | (tx_fifo_rddata_hi[256+2] & tx_fifo_rdreq_hi_q));
            tx_st_eop_o       <= (par_sriov || only_par)? ((tx_fifo_rddata_lo[311] & tx_fifo_rdreq_lo_q) | (tx_fifo_rddata_hi[311] & tx_fifo_rdreq_hi_q)) : ((tx_fifo_rddata_lo[256+3] & tx_fifo_rdreq_lo_q) | (tx_fifo_rddata_hi[256+3] & tx_fifo_rdreq_hi_q));
            tx_st_vf_active_o <= (par_sriov) ? ((tx_fifo_rddata_lo[312] & tx_fifo_rdreq_lo_q) | (tx_fifo_rddata_hi[312] & tx_fifo_rdreq_hi_q)) : (only_sriov) ? ((tx_fifo_rddata_lo[256+4] & tx_fifo_rdreq_lo_q) | (tx_fifo_rddata_hi[256+4] & tx_fifo_rdreq_hi_q)) : '0;
        end
      end



    always @ (posedge clk500)
      begin
          tx_fifo_rdreq_lo_q <= tx_fifo_rdreq_lo;
          tx_fifo_rdreq_hi_q <= tx_fifo_rdreq_hi;
          if (sync_comb_rst_pldclk)
            begin
                tx_fifo_rdreq_lo <= 1'b0;
                tx_fifo_rdreq_hi <= 1'b0;
                pending_hi_read <= 1'b0;
                tx_st_ready   <= 1'b0;
            end
          else
            begin
               tx_st_ready   <= tx_st_ready_i;
               tx_fifo_rdreq_lo <= ~(tx_fifo_empty_lo|tx_fifo_empty2_lo) & tx_st_ready_i & ~pending_hi_read & ~tx_fifo_rdreq_lo;
               tx_fifo_rdreq_hi <=  tx_st_ready_i &  (tx_fifo_rdreq_lo | pending_hi_read);
               pending_hi_read  <= ~tx_st_ready_i ? (tx_fifo_rdreq_lo | pending_hi_read) : '0;

            end
      end // always @ (posedge clk500)

    altera_pcie_s10_gen3x16_dcfifo
      #(.FIFO_WIDTH (par_sriov ? 293 +128 +32 +20: only_par ? 292 + 128 +32 +20: only_sriov? 261 +128 +32: 260 +128 +32),
        .ADDR_WIDTH (5),
        .SIM_EMULATE(0),
        .intended_device_family(intended_device_family)
        )
      tx_fifo_lo
        (
         .din_clk  (clk250),
         .din_sclr (rst_clk250),
         .din_wreq (tx_fifo_wrreq),
         .din      ({tx_fifo_wr_prefix_lo,tx_fifo_wr_hdr_lo,tx_fifo_wrdata_lo}),
         .din_wusedw(),
         .dout_clk  (clk500),
         .dout_sclr (sync_comb_rst_pldclk),
         .dout_rreq (tx_fifo_rdreq_lo),
         .dout      ({tx_fifo_rd_prefix_lo,tx_fifo_rd_hdr_lo,tx_fifo_rddata_lo}),
         .dout_rusedw(),
         .fifo_empty (tx_fifo_empty_lo),
         .fifo_empty2 (tx_fifo_empty2_lo),
         .fifo_almost_empty(),
         .fifo_almost_full (fifo_almost_full)
         );

     altera_pcie_s10_gen3x16_dcfifo
       #(.FIFO_WIDTH (par_sriov ? 293 +128 +32 +20: only_par ? 292 + 128 +32 +20: only_sriov? 261 +128 +32: 260 +128 +32),
        .ADDR_WIDTH (5),
        .SIM_EMULATE(0),
        .intended_device_family(intended_device_family)
        )
      tx_fifo_hi
        (
         .din_clk  (clk250),
         .din_sclr (rst_clk250),
         .din_wreq (tx_fifo_wrreq),
         .din      ({tx_fifo_wr_prefix_hi,tx_fifo_wr_hdr_hi,tx_fifo_wrdata_hi}),
         .din_wusedw(),
         .dout_clk  (clk500),
         .dout_sclr (sync_comb_rst_pldclk),
         .dout_rreq (tx_fifo_rdreq_hi),
         .dout      ({tx_fifo_rd_prefix_hi,tx_fifo_rd_hdr_hi,tx_fifo_rddata_hi}),
         .dout_rusedw(),
         .fifo_empty (),
         .fifo_almost_empty(),
         .fifo_almost_full ()
         );


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf+3dU4DO7XxiD1SQeMpvTcdlibr615V1ThtB6jbR7n5rdL/wvQPhdkNYlGbDqu4GK9e9w7UFHgV09AlaXbfqT575k8j6LyWZJbaVZvSOPWHkxfVloOoK+aAjW8/oNzVuH46PB8O+u+QWeWaDJ2XaY5Ra8RHeGibsI3ATsLIyTT7wusYsQhF5uVHzgcGe3DJeL7Ua7TmfEooVIG2UjNZHMsisGoWcODd1FiEcNhRNWEV1co5JM7CtEgva1QeBsntOJPhbDqbYXGBR0C6M5+FDP7keInXZtftDwz6WWBUKzQa+MBaSdQj6yoFFkUwJ+UM1E08Szso1fBtmGTeLDTy7CW3kt5+oObOVLb+5pn38Z+Sljx5FzgR4gax+5PPlh1akgXO9CUfGhYHhyaqVo9TKGtOTlvdPlmSGozhg9zhdA1GnuogCqwCCwCPVmI773IEtEZhhN6qT9Or9IFLK09eaYXMkGRTx7ydRSZSAcct+JpaZ1TUJx7v99A+FsWFH5JwMIGQymdnrXz/v8w/2E5vYWIb0dqe9Ge4Gxdzczm/iH2emf8uuQ6/cRoBJnMBR/tvmAYChl2MXcTaUpGPUrW9iNFiomNN4heCNzhT0T7seKqWywCyVDM2xajfraHm2XMbhgmDo3WS88t4BpVVWzfS62yaJuuI0jIgjhO55OYA02ycYXPstPbydEgP1R2yStcX6CoijXx+LT7ZimlF0fOum1HqusqiTjEwHNKqz2c6J8Cb9D2I48St2htWF5uox2CKDZSR8LVV9f7x81kubonCQP5U"
`endif