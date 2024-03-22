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



module intel_pcie_err_if (

   input logic         clk500,
   input logic         rst_n,

   input logic         clk250,
   input logic         rst_n_clk250,

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
   output logic        tx_par_err_o

   );

    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire                app_err_valid_sync;     // From u_app_err_valid_sync of sync_bit.v
    wire                err_hdr_avail_sync;     // From u_err_hdr_avail_sync of sync_bit.v
    // End of automatics

    sync_pulse u_rx_par_err_sync (/*AUTOINST*/
      // Outputs
      .dout                 (rx_par_err_o),  // Templated
      // Inputs
      .wr_clk               (clk500),        // Templated
      .rd_clk               (clk250),        // Templated
      .wr_rst_n             (rst_n),         // Templated
      .rd_rst_n             (rst_n_clk250),  // Templated
      .din                  (rx_par_err_i)
    );  // Templated
    sync_pulse u_tx_par_err_sync (/*AUTOINST*/
      // Outputs
      .dout                 (tx_par_err_o),  // Templated
      // Inputs
      .wr_clk               (clk500),        // Templated
      .rd_clk               (clk250),        // Templated
      .wr_rst_n             (rst_n),         // Templated
      .rd_rst_n             (rst_n_clk250),  // Templated
      .din                  (tx_par_err_i)
    );  // Templated
    sync_pulse u_serr_out_sync (/*AUTOINST*/
      // Outputs
      .dout           (serr_out_o),    // Templated
      // Inputs
      .wr_clk         (clk500),        // Templated
      .rd_clk         (clk250),        // Templated
      .wr_rst_n       (rst_n),         // Templated
      .rd_rst_n       (rst_n_clk250),  // Templated
      .din            (serr_out_i)
    );    // Templated
    sync_pulse u_hip_err_out_sync (/*AUTOINST*/
      // Outputs
      .dout           (hip_enter_err_mode_o),    // Templated
      // Inputs
      .wr_clk         (clk500),        // Templated
      .rd_clk         (clk250),        // Templated
      .wr_rst_n       (rst_n),         // Templated
      .rd_rst_n       (rst_n_clk250),  // Templated
      .din            (hip_enter_err_mode_i)
    );  
   logic [3:0]          header_present;
   logic [3:0]          header_present_ss;
   logic [3:0]          header_present_ss_q;
   logic [127:0]        header0,header1,header2,header3;
   logic [31:0]         prefix0,prefix1,prefix2,prefix3;
   logic [12:0]         info0,info1,info2,info3;
   logic [2:0]          err_func0,err_func1,err_func2,err_func3;

   logic [127:0]        app_err_hdr_q2,app_err_hdr_q1;
   logic [31:0]         app_err_prfx_q2,app_err_prfx_q1;
   logic [2:0]          app_err_func_num_q2,app_err_func_num_q1;
   logic [12:0]         app_err_info_q1,app_err_info_q2;
   logic                app_err_valid_q2,app_err_valid_q1;

   always @ (posedge clk250) begin
     if (!rst_n_clk250) begin
       header_present <= '0;
     end
     else begin
       if (app_err_valid_i & (header_present[3] | !(|header_present))) begin
         header_present[0] <= 1'b1;
       end
       if (header_present[1]) begin
         header_present[0] <= 1'b0;
       end
       if (app_err_valid_i & header_present[0]) begin
         header_present[1] <= 1'b1;
       end
       if (header_present[2]) begin
         header_present[1] <= 1'b0;
       end
       if (app_err_valid_i & header_present[1]) begin
         header_present[2] <= 1'b1;
       end
       if (header_present[3]) begin
         header_present[2] <= 1'b0;
       end
       if (app_err_valid_i & header_present[2]) begin
         header_present[3] <= 1'b1;
       end
       if (header_present[0]) begin
         header_present[3] <= 1'b0;
       end
     end
   end


    always @ (posedge clk250) begin
      if (!rst_n_clk250) begin
        header0 <= '0;
        header1 <= '0;
        header2 <= '0;
        header3 <= '0;
        info0   <= '0;
        info1   <= '0;
        info2   <= '0;
        info3   <= '0;
        prefix0 <= '0;
        prefix1 <= '0;
        prefix2 <= '0;
        prefix3 <= '0;
      end
      else begin
        if (app_err_valid_i & ((header_present[3] & !header_present[0]) | !(|header_present))) begin
           header0 <= app_err_hdr_i;
           info0   <= app_err_info_i;
           prefix0 <= app_err_tlp_prfx_i;
        end
        if (app_err_valid_i & header_present[0] & !header_present[1]) begin
           header1 <= app_err_hdr_i;
           info1   <= app_err_info_i;
           prefix1 <= app_err_tlp_prfx_i;
        end
        if (app_err_valid_i & header_present[1] & !header_present[2]) begin
           header2 <= app_err_hdr_i;
           info2   <= app_err_info_i;           
           prefix2 <= app_err_tlp_prfx_i;
        end
        if (app_err_valid_i & header_present[2] & !header_present[3]) begin
           header3 <= app_err_hdr_i;
           info3   <= app_err_info_i;
           prefix3 <= app_err_tlp_prfx_i;
        end
      end
    end

    always @ (posedge clk250) begin
      if (!rst_n_clk250) begin
        {err_func0,err_func1,err_func2,err_func3}                     <= '0;
      end
      else begin
        if (app_err_valid_i & ((header_present[3] & !header_present[0]) | !(|header_present))) begin
          err_func0      <= app_err_func_num_i;
        end
        if (app_err_valid_i & header_present[0] & !header_present[1]) begin
          err_func1      <= app_err_func_num_i;
        end
        if (app_err_valid_i & header_present[1] & !header_present[2]) begin
          err_func2      <= app_err_func_num_i;
        end
        if (app_err_valid_i & header_present[2] & !header_present[3]) begin
          err_func3      <= app_err_func_num_i;
        end
      end
    end

    sync_bit #(.DWIDTH (4) ) u_header_present_sync (.clk(clk500), .rst_n(rst_n), .din(header_present), .dout(header_present_ss));


   always @ (posedge clk500) begin 
     app_err_hdr_o       <= app_err_hdr_q1   | app_err_hdr_q2;
     app_err_info_o      <= app_err_info_q1  | app_err_info_q2;
     app_err_tlp_prfx_o  <= app_err_prfx_q1  | app_err_prfx_q2;
     app_err_func_num_o  <= app_err_func_num_q1     | app_err_func_num_q2;
     app_err_func_num_q1 <= '0;
     app_err_func_num_q2 <= '0;
     app_err_hdr_q1      <= '0;
     app_err_hdr_q2      <= '0;
     app_err_info_q1     <= '0;
     app_err_info_q2     <= '0;
     app_err_prfx_q1     <= '0;
     app_err_prfx_q2     <= '0;
     if (!header_present_ss_q[0] & header_present_ss[0]) begin
       app_err_hdr_q1       <= header0;
       app_err_info_q1      <= info0;
       app_err_prfx_q1      <= prefix0;
       app_err_func_num_q1  <= err_func0;
     end
     if (!header_present_ss_q[1] & header_present_ss[1]) begin
       app_err_hdr_q1        <= header1;
       app_err_info_q1       <= info1;
       app_err_prfx_q1       <= prefix1;
       app_err_func_num_q1   <= err_func1;
     end
     if (!header_present_ss_q[2] & header_present_ss[2]) begin
       app_err_hdr_q2       <= header2;
       app_err_info_q2      <= info2;
       app_err_prfx_q2      <= prefix2;
       app_err_func_num_q2  <= err_func2;
     end
     if (!header_present_ss_q[3] & header_present_ss[3]) begin
       app_err_hdr_q2       <= header3;
       app_err_info_q2      <= info3;
       app_err_prfx_q2      <= prefix3;
       app_err_func_num_q2  <= err_func3;
     end
   end


   always @ (posedge clk500) begin
     if (!rst_n) begin
       app_err_valid_q1     <= '0;
       app_err_valid_q2     <= '0;
       app_err_valid_o      <= '0;
       header_present_ss_q  <= '0;
     end
     else begin
       app_err_valid_q1    <= 1'b0;
       app_err_valid_q2    <= 1'b0;
       app_err_valid_o     <= app_err_valid_q1 | app_err_valid_q2;
       header_present_ss_q <= header_present_ss;
       if (!header_present_ss_q[0] & header_present_ss[0]) begin
         app_err_valid_q1 <= 1'b1;
       end
       if (!header_present_ss_q[1] & header_present_ss[1]) begin
         app_err_valid_q1 <= 1'b1;
       end
       if (!header_present_ss_q[2] & header_present_ss[2]) begin
         app_err_valid_q2 <= 1'b1;
       end
       if (!header_present_ss_q[3] & header_present_ss[3]) begin
         app_err_valid_q2 <= 1'b1;
       end
     end
   end


endmodule // altera_pcie_s10_gen3x16_err_if


// Local Variables:
// verilog-library-directories:(".""./sync_lib/.")
// verilog-auto-inst-param-value: t
// End:
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf/YMGsbYy2qiPbom2HpAvwjqwSsqeMk/ATLJrtfaGNM/uXFCkuPrYS93jh847D3rFuNRb4XhINNBMVex79K7VgNQFIsG/NQ31rF0ULvKF0ECvuxIMEJgc7PK2Ip+BDN3WkwOFhvqpyixJsQxyVLRUOg6bzPRK+Cq8lMvwENVx93JmNJLlPcpZiiZ3IzgcP/D3cpn4+sSF+dNu6aPFzMADKWCxBMDYCo5ET6kx82JX606CVX6n58Pi02kQ2pEYPr/SYqmDwOIGCmog3g5SgWvEC84MjD0WEwHwui8H7vnNpHZQbFNc7mjmZHrFSrpQuif3ln41XzL/tCfxIYKIwOTKM1129G/e6U7jgImF36kNJKF/OWSF/rQpCq+Amp5xCgHrxFvrJRjj1Y9MuyOW8oOInLD8kSjm4c9gFz9KzTGavpmVB2utcOtjJpFqQhaOjo145kYO+aAWNhf4gW5IyscBX8mRB1sOTxlI7Ce4jm8uJ3eBzuOCjPZO0NxMygAI0QrAcLUysjpGGKuiq4zy2+xyHPMe0EkoLT9T2incZ4avfq5EkxjWLAOx/sITgnhtCbD7RWnVRjtnzolBpJ3XYy6SD2AvA+vY52ng8PANfwARH+bXaPwFIY5Dy505bQl9uNOsTOMdN6xQE4W6e2p54s/frq0hFguGEbxZpgkOfgd//rvKCVSGraIuF8tiea1Vv7CkC1KYBMWt4Iyie8xAbRqLMgbMc2M7rV6zK4vFSKp0pCJ6YxGdhZRanDLqiCNxOoePYV5QV4pqMRLYIkfkcwk7Gp"
`endif