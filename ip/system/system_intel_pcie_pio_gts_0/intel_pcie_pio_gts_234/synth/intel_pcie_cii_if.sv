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




module intel_pcie_cii_if #(
  parameter  VF_ENABLE = 0

)(

  input  logic                clk500,
  input  logic                rst_n,

  input  logic                clk250,
  input  logic                rst_n_clk250,

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
  input  logic                cii_halt_i


);
  //logic [63:0]           cfg_bus,cfg_bus_reg1,cfg_bus_reg2,cfg_bus_save,data_out;
  logic [62:0]           cfg_bus,cfg_bus_reg1,cfg_bus_reg2,cfg_bus_save,data_out;
  logic [7:0]            cfg_bus_changed;
  logic                  cfg_bus_changed_ored;
  logic                  req_wr_clk;
  logic                  req_rd_clk,req_rd_clk_s;
  logic                  ack_wr_clk;
  logic                  ack_rd_clk;
  logic                  clear_cii_req_wr_clk;
  logic                  clear_cii_req_rd_clk;
  logic                  cii_req_r;

  logic                  cii_halt_sync;
  logic                  cii_halt_sync_r,cii_halt_sync_rr,cii_halt_sync_rrr;
  
  
  logic [31:0]         cii_override_din_sync,cii_override_din_sync1,cii_override_din_sync2;
  logic                cii_override_en_sync,cii_override_en_sync1,cii_override_en_sync2;
  

  genvar i;
/*   assign cfg_bus = {cii_req_i,cii_hdr_poisoned_i,cii_hdr_first_be_i,cii_func_num_i,cii_wr_vf_active_i,cii_vf_num_i,cii_wr_i,
                    cii_add_i,cii_dout_i};
  assign {cii_req_o,cii_hdr_poisoned_o,cii_hdr_first_be_o,cii_func_num_o,cii_wr_vf_active_o,cii_vf_num_o,cii_wr_o,
         cii_add_o,cii_dout_o} = data_out; */

  assign cfg_bus = {cii_hdr_poisoned_i,cii_hdr_first_be_i,cii_func_num_i,cii_wr_vf_active_i,cii_vf_num_i,cii_wr_i,
                    cii_add_i,cii_dout_i};
  assign {cii_hdr_poisoned_o,cii_hdr_first_be_o,cii_func_num_o,cii_wr_vf_active_o,cii_vf_num_o,cii_wr_o,
         cii_add_o,cii_dout_o} = data_out;

/*   generate
    for (i = 0; i < 7; i=i+1 ) begin: change_track
      always @(posedge clk500) begin
        if (!rst_n) begin
          cfg_bus_changed[i]  <= '0;
        end
        else begin
          cfg_bus_changed[i]  <= cfg_bus_reg1[(i+1)*8 - 1:i*8] != cfg_bus[(i+1)*8 - 1:i*8];
        end
      end
    end
  endgenerate

  always @(posedge clk500) begin
    if (!rst_n) begin
      cfg_bus_reg1          <= '0;
      cfg_bus_reg2          <= '0;
      cfg_bus_changed_ored  <= '0;
      cfg_bus_changed[7]    <= '0;

    end
    else begin
      cfg_bus_changed[7]    <= cfg_bus_reg1[63:56] != cfg_bus[63:56];
      cfg_bus_changed_ored  <= |cfg_bus_changed;
      cfg_bus_reg1          <= cfg_bus;
      cfg_bus_reg2          <= cfg_bus_reg1;
    end
  end */

  always @(posedge clk500) begin
    if (!rst_n) begin
      req_wr_clk <= 1'b0;
      clear_cii_req_wr_clk <= 1'b0;
      cfg_bus_save <= '0;
    end
    else begin
      cii_req_r <= cii_req_i;
      // Store data when Write Req equals Write Ack
      /* if (req_wr_clk == ack_wr_clk) begin
         cfg_bus_save <= cfg_bus_reg2;
      end */
      if (cii_req_i) begin
         cfg_bus_save <= cfg_bus;
         req_wr_clk   <= 1'b1;
      end

      // Generate a Req when there is change in data
      /* if ((req_wr_clk == ack_wr_clk) & (cfg_bus_changed_ored)) begin
         req_wr_clk <= ~req_wr_clk;
      end */
      if (ack_wr_clk)  begin
         req_wr_clk <= 'b0;
      end

      if (cii_req_i) begin
        clear_cii_req_wr_clk <= 1'b0;
      end
      else begin
        clear_cii_req_wr_clk <= 1'b1;
      end

    end
   end

  //******************************************************************************
  // WRITE CLOCK DOMAIN:
  //******************************************************************************
  sync_bit
  #(
  .DWIDTH      (1),         // Sync Data input
  .RESET_VAL   (0)          // Reset value
  )
  u_ack_wr_clk
     (
     .clk      (clk500),
     .rst_n    (rst_n),
     .din      (ack_rd_clk),
     .dout     (ack_wr_clk)
     );
  assign ack_rd_clk = req_rd_clk_s;

  //******************************************************************************
  // READ CLOCK DOMAIN:
  //******************************************************************************
  sync_bit
  #(
  .DWIDTH      (1),         // Sync Data input
  .RESET_VAL   (0)          // Reset value
  )
  u_req_rd_clk
  (
     .clk      (clk250),
     .rst_n    (rst_n_clk250),
     .din      (req_wr_clk),
     .dout     (req_rd_clk)
  );


 sync_bit
  #(
  .DWIDTH      (1),         // Sync Data input
  .RESET_VAL   (0)          // Reset value
  )
  u_clear_cii_rd_clk
  (
     .clk      (clk250),
     .rst_n    (rst_n_clk250),
     .din      (clear_cii_req_wr_clk),
     .dout     (clear_cii_req_rd_clk)
  );

 always @(posedge clk250) begin
    if (!rst_n_clk250) begin
      data_out     <= {64{1'b0}};
      req_rd_clk_s <= 1'b0;
    end
    else begin
       req_rd_clk_s <= req_rd_clk;
       if (req_rd_clk_s != req_rd_clk) begin
          data_out <= cfg_bus_save;
          cii_req_o <= 1'b1;
       end
       
       if (clear_cii_req_rd_clk) begin
        data_out <= '0;
        cii_req_o <= 1'b0;
       end
    end
 end


 //******************************************************************************
  //******************************************************************************
  // Synchronize the outputs of App
  //******************************************************************************
   logic [3:0]          cii_override_present;
   logic [3:0]          cii_override_present_ss;
   logic [3:0]          cii_override_present_ss_q;
   logic [31:0]         override_din0,override_din1,override_din2,override_din3;

   logic                cii_override_en_q1, cii_override_en_q2;
   logic [31:0]         app_override_din_q1,app_override_din_q2;

   altpcie_sc_bitsync #(
      .DWIDTH    (1), // Sync Data input
      .NODENAME  ("halt_sync"), // Expecting Instance name
      .SYNCSTAGE (2), // Sync stages
      .SDC_TYPE  (0), // 0: Multi Cycle=3, 1:Multi Cycle=2, 2: Set False Path
      .RESET_VAL (0)  // Reset value
      ) halt_sync (
      .clk                  (clk500           ),     // clock
      .rst_n                (rst_n            ),   // async reset
      .data_in              (cii_halt_i       ), // data in
      .data_out             (cii_halt_sync    )  // data out
   );
   
  always @(posedge clk500) begin
    if (!rst_n) begin
      cii_halt_sync_r   <= 1'b0;
      cii_halt_sync_rr  <= 1'b0;
      cii_halt_sync_rrr <= 1'b0;
      cii_halt_o        <= 1'b0;
      cii_override_en_sync1 <= '0;
      cii_override_en_sync2 <= '0;
      cii_override_din_sync1 <= '0;
      cii_override_din_sync2 <= '0;
    end
    else begin
      cii_halt_sync_r   <= cii_halt_sync;
      cii_halt_sync_rr  <= cii_halt_sync_r;
      cii_halt_sync_rrr <= cii_halt_sync_rr;
      cii_override_din_sync1 <= cii_override_din_sync;
      cii_override_din_sync2 <= cii_override_din_sync1;      
      cii_override_en_sync1 <= cii_override_en_sync;
      cii_override_en_sync2 <= cii_override_en_sync1;
      if (cii_halt_sync & !cii_halt_sync_rr & !cii_halt_sync_r)
        cii_halt_o <= 1'b0;
      else 
        cii_halt_o <= cii_halt_sync | cii_halt_sync_r | cii_halt_sync_rr | cii_halt_sync_rrr;
      
      if (cii_halt_sync & !cii_halt_sync_rr & !cii_halt_sync_r) begin
        cii_override_din_o <= cii_halt_sync_rrr ? cii_override_din_sync1 : cii_override_din_sync2;
        cii_override_en_o <= cii_halt_sync_rrr ? cii_override_en_sync1 : cii_override_en_sync2;
      end
      else begin
        cii_override_din_o <= '0;
        cii_override_en_o  <= '0;
      end      
    end
  end
   
   
   

   always @ (posedge clk250) begin
     if (!rst_n_clk250) begin
       cii_override_present <= '0;
     end
     else begin
       if (cii_override_en_i & (cii_override_present[3] | !(|cii_override_present))) begin
         cii_override_present[0] <= 1'b1;
       end
       if (cii_override_present[1]) begin
         cii_override_present[0] <= 1'b0;
       end
       if (cii_override_en_i & cii_override_present[0]) begin
         cii_override_present[1] <= 1'b1;
       end
       if (cii_override_present[2]) begin
         cii_override_present[1] <= 1'b0;
       end
       if (cii_override_en_i & cii_override_present[1]) begin
         cii_override_present[2] <= 1'b1;
       end
       if (cii_override_present[3]) begin
         cii_override_present[2] <= 1'b0;
       end
       if (cii_override_en_i & cii_override_present[2]) begin
         cii_override_present[3] <= 1'b1;
       end
       if (cii_override_present[0]) begin
         cii_override_present[3] <= 1'b0;
       end
     end
   end


    always @ (posedge clk250) begin
      if (!rst_n_clk250) begin
        override_din0   <= '0;
        override_din1   <= '0;
        override_din2   <= '0;
        override_din3   <= '0;
      end
      else begin
        if (cii_override_en_i & ((cii_override_present[3] & !cii_override_present[0]) | !(|cii_override_present))) begin
           override_din0   <= cii_override_din_i;
        end
        if (cii_override_en_i & cii_override_present[0] & !cii_override_present[1]) begin
           override_din1   <= cii_override_din_i;
        end
        if (cii_override_en_i & cii_override_present[1] & !cii_override_present[2]) begin
           override_din2   <= cii_override_din_i;
        end
        if (cii_override_en_i & cii_override_present[2] & !cii_override_present[3]) begin
           override_din3   <= cii_override_din_i;
        end
      end
    end

    sync_bit #(.DWIDTH (4) ) u_cii_override_present_sync (.clk(clk500), .rst_n(rst_n), .din(cii_override_present), .dout(cii_override_present_ss));


   always @ (posedge clk500) begin
     cii_override_din_sync   <= app_override_din_q1  | app_override_din_q2;
     app_override_din_q1     <= '0;
     app_override_din_q2     <= '0;
     if (!cii_override_present_ss_q[0] & cii_override_present_ss[0]) begin
       app_override_din_q1   <= override_din0;
     end
     if (!cii_override_present_ss_q[1] & cii_override_present_ss[1]) begin
       app_override_din_q1   <= override_din1;
     end
     if (!cii_override_present_ss_q[2] & cii_override_present_ss[2]) begin
       app_override_din_q2   <= override_din2;
     end
     if (!cii_override_present_ss_q[3] & cii_override_present_ss[3]) begin
       app_override_din_q2   <= override_din3;
     end
   end

   always @ (posedge clk500) begin
     if (!rst_n) begin
       cii_override_en_q1     <= '0;
       cii_override_en_q2     <= '0;
       cii_override_present_ss_q  <= '0;
       cii_override_en_sync    <= '0;
     end
     else begin
       cii_override_en_q1    <= 1'b0;
       cii_override_en_q2    <= 1'b0;
       cii_override_en_sync     <= cii_override_en_q1 | cii_override_en_q2;
       cii_override_present_ss_q <= cii_override_present_ss;
       if (!cii_override_present_ss_q[0] & cii_override_present_ss[0]) begin
         cii_override_en_q1 <= 1'b1;
       end
       if (!cii_override_present_ss_q[1] & cii_override_present_ss[1]) begin
         cii_override_en_q1 <= 1'b1;
       end
       if (!cii_override_present_ss_q[2] & cii_override_present_ss[2]) begin
         cii_override_en_q2 <= 1'b1;
       end
       if (!cii_override_present_ss_q[3] & cii_override_present_ss[3]) begin
         cii_override_en_q2 <= 1'b1;
       end
     end
   end





endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf/vUrA1a8ws/5RDqHD8jaRSS8vn2Rli5Yr3EDnq/DrTjvxLE2R1cbJh/0vVNAi+dEUPplIxzNZdtMJbf8KEd9UO+24xv3Rc9idsqbqBWruYSVRKFKU7McDP3H8lVAsQZ47/ySrQNKnaxxtBhX6VLdJMq1GQFA/QGV1RgX+52Fb/fwt5SlKdfqVVxDZ9gaJ1a40nRoRB0/3e8Wv0i3waiAoGnTa3zPeNYAytmLEa1mOQja7vXW1wHfNIMR1OakC7ERzLyqZFXQJKyi7cYbLjwRFb8PLabP9efqSG+gZHkqWeGIPGe9hyGDwPJ1+j/0180khU40B3Ri7VYY0XWyo0P3nZU9sHK5oqZrKEviQHKn/+JgjZi9Jj264Nh/ZGljH4LMzcSSODnpMvwCT0dkiPp2QEAjXfJPXNRXrAE2H9b/92KGqjims7HnSTD7YOGMFx0WsSfFUa/bBMymwzxhPNbZ3BQ4S5F2fi7+cWPSwc1EHe+v4Xv+rSJXQaWGCPp6e1rGO7D2T3qzAR8saGub/YP5JIbMtm/KBGNSHsuLFI5nok0A3vvn+GWrQb3tWgRghksdIzoGXAFd5MRouNrnBojvtuLjtMyls7F6SrJ8sfiksXU7lj4eNlreZUrIIaaywElkr1htAy8IDZYtuPVXzJmyS735KOUhdLMRTjkC7DvYUuQwdxZBukaFb70tqxDu+CHzViGXCCoYUfHX4IWOJ2waRoZ7hQ2be07tgF9A7+CDqIPaB9UqzkJXRAnmCxPvjrnD2nBpruz5l32orgbMQP7YS2"
`endif