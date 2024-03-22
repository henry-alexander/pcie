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



module intel_pcie_flr_if #(
  parameter  VF_ENABLE = 0

)(

  input  logic               clk500,
  input  logic               rst_n,

  input  logic                clk250,
  input  logic                rst_n_clk250,
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
  input  logic [10:0]         app_flr_completed_vf_num_i

);

  logic [13:0]        data_in_wr;
  logic               req_wr_clk;
  logic               req_wr_clk_r,req_wr_clk_rr;
  logic               req_rd_clk;
  logic               ack_wr_clk;
  logic               ack_rd_clk;
  logic               req_rd_clk_s;

//******************************************************************************
  //******************************************************************************
  // Synchronize the outputs of hip
  //******************************************************************************
    sync_bit #(
      .DWIDTH    (8)
      ) pf_sync (
      .clk                  (clk250           ),     // clock
      .rst_n                (rst_n_clk250     ),   // async reset
      .din                  (flr_rcvd_pf_i    ), // data in
      .dout                 (app_flr_rcvd_pf_o)// data out
   );

  //******************************************************************************
  // HIP CLOCK DOMAIN:
  //******************************************************************************
  always @(posedge clk500) begin
     if (rst_n == 1'b0) begin
        data_in_wr <= {23{1'b0}};
        req_wr_clk <= 1'b0;
        req_wr_clk_r <= 1'b0;
        req_wr_clk_rr <= 1'b0;
     end
     else begin
        req_wr_clk_r  <= req_wr_clk;
        req_wr_clk_rr <= req_wr_clk_r;
        // Store data when flr is received
        if (flr_rcvd_vf_i) begin
           data_in_wr <= {flr_rcvd_pf_num_i,flr_rcvd_vf_num_i};
           req_wr_clk <= 1'b1;
        end

        // Generate a Req when there is change in data
        if (req_wr_clk_rr)  begin
           req_wr_clk <= 'b0;
        end
     end
  end

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
  assign ack_rd_clk = req_rd_clk;

  //******************************************************************************
  // APP CLOCK DOMAIN:
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

  always @(posedge clk250) begin
     if (rst_n_clk250 == 1'b0) begin
        {app_flr_rcvd_vf_o,app_flr_rcvd_pf_num_o,app_flr_rcvd_vf_num_o}          <= {23{1'b0}};
        req_rd_clk_s      <= 1'b0;
     end
     else begin
        req_rd_clk_s <= req_rd_clk;
        {app_flr_rcvd_vf_o,app_flr_rcvd_pf_num_o,app_flr_rcvd_vf_num_o}          <= {23{1'b0}};
        if (!req_rd_clk & req_rd_clk_s) begin
           {app_flr_rcvd_pf_num_o,app_flr_rcvd_vf_num_o} <= data_in_wr;
           app_flr_rcvd_vf_o <= 1'b1;
        end
     end
  end
//******************************************************************************



//******************************************************************************
  //******************************************************************************
  // Synchronize the outputs of App
  //******************************************************************************
   logic [3:0]          flr_resp_present;
   logic [3:0]          flr_resp_present_ss;
   logic [3:0]          flr_resp_present_ss_q;
   logic [10:0]         vfnum0,vfnum1,vfnum2,vfnum3;
   logic [2:0]          pfnum0,pfnum1,pfnum2,pfnum3;

   logic [2:0]          app_pfnum_q2,app_pfnum_q1;
   logic [10:0]         app_vfnum_q1,app_vfnum_q2;
   logic                app_completed_vf_q2,app_completed_vf_q1;




  genvar i;
  generate
   for (i = 0; i < 8 ; i=i+1 ) begin: pf_complete
     sync_pulse _app_sync  (
       .wr_clk              (clk250),
       .rd_clk              (clk500),
       .wr_rst_n            (rst_n_clk250),
       .rd_rst_n            (rst_n),
       .din                 (app_flr_completed_pf_i[i]),
       .dout                (flr_completed_pf_o[i])
     );
    /*  sync_pulse _hip_sync  (
       .wr_clk              (clk500),
       .rd_clk              (clk250),
       .wr_rst_n            (rst_n),
       .rd_rst_n            (rst_n_clk250),
       .din                 (flr_rcvd_pf_i[i]),
       .dout                (app_flr_rcvd_pf_o[i])
     ); */
   end
  endgenerate


    always @ (posedge clk250) begin
     if (!rst_n_clk250) begin
       flr_resp_present <= '0;
     end
     else begin
       if (app_flr_completed_vf_i & (flr_resp_present[3] | !(|flr_resp_present))) begin
         flr_resp_present[0] <= 1'b1;
       end
       if (flr_resp_present[1]) begin
         flr_resp_present[0] <= 1'b0;
       end
       if (app_flr_completed_vf_i & flr_resp_present[0]) begin
         flr_resp_present[1] <= 1'b1;
       end
       if (flr_resp_present[2]) begin
         flr_resp_present[1] <= 1'b0;
       end
       if (app_flr_completed_vf_i & flr_resp_present[1]) begin
         flr_resp_present[2] <= 1'b1;
       end
       if (flr_resp_present[3]) begin
         flr_resp_present[2] <= 1'b0;
       end
       if (app_flr_completed_vf_i & flr_resp_present[2]) begin
         flr_resp_present[3] <= 1'b1;
       end
       if (flr_resp_present[0]) begin
         flr_resp_present[3] <= 1'b0;
       end
     end
   end


    always @ (posedge clk250) begin
      if (!rst_n_clk250) begin
        vfnum0   <= '0;
        vfnum1   <= '0;
        vfnum2   <= '0;
        vfnum3   <= '0;
        {pfnum0,pfnum1,pfnum2,pfnum3}     <= '0;
      end
      else begin
        if (app_flr_completed_vf_i & ((flr_resp_present[3] & !flr_resp_present[0]) | !(|flr_resp_present))) begin
           vfnum0   <= app_flr_completed_vf_num_i;
           pfnum0   <= app_flr_completed_pf_num_i;
        end
        if (app_flr_completed_vf_i & flr_resp_present[0] & !flr_resp_present[1]) begin
           vfnum1   <= app_flr_completed_vf_num_i;
           pfnum1   <= app_flr_completed_pf_num_i;
        end
        if (app_flr_completed_vf_i & flr_resp_present[1] & !flr_resp_present[2]) begin
           vfnum2   <= app_flr_completed_vf_num_i;
           pfnum2   <= app_flr_completed_pf_num_i;
        end
        if (app_flr_completed_vf_i & flr_resp_present[2] & !flr_resp_present[3]) begin
           vfnum3   <= app_flr_completed_vf_num_i;
           pfnum3   <= app_flr_completed_pf_num_i;
        end
      end
    end

    sync_bit #(.DWIDTH (4) ) u_flr_resp_present_sync (.clk(clk500), .rst_n(rst_n), .din(flr_resp_present), .dout(flr_resp_present_ss));


   always @ (posedge clk500) begin
     flr_completed_pf_num_o  <= app_pfnum_q1  | app_pfnum_q2;
     flr_completed_vf_num_o  <= app_vfnum_q1  | app_vfnum_q2;
     app_pfnum_q1            <= '0;
     app_pfnum_q2            <= '0;
     app_vfnum_q1            <= '0;
     app_vfnum_q2            <= '0;
     if (!flr_resp_present_ss_q[0] & flr_resp_present_ss[0]) begin
       app_vfnum_q1   <= vfnum0;
       app_pfnum_q1   <= pfnum0;
     end
     if (!flr_resp_present_ss_q[1] & flr_resp_present_ss[1]) begin
       app_vfnum_q1   <= vfnum1;
       app_pfnum_q1   <= pfnum1;
     end
     if (!flr_resp_present_ss_q[2] & flr_resp_present_ss[2]) begin
       app_vfnum_q2   <= vfnum2;
       app_pfnum_q2   <= pfnum2;
     end
     if (!flr_resp_present_ss_q[3] & flr_resp_present_ss[3]) begin
       app_vfnum_q2   <= vfnum3;
       app_pfnum_q2   <= pfnum3;
     end
   end

   always @ (posedge clk500) begin
     if (!rst_n) begin
       app_completed_vf_q1     <= '0;
       app_completed_vf_q2     <= '0;
       flr_completed_vf_o      <= '0;
       flr_resp_present_ss_q  <= '0;
     end
     else begin
       app_completed_vf_q1    <= 1'b0;
       app_completed_vf_q2    <= 1'b0;
       flr_completed_vf_o     <= app_completed_vf_q1 | app_completed_vf_q2;
       flr_resp_present_ss_q <= flr_resp_present_ss;
       if (!flr_resp_present_ss_q[0] & flr_resp_present_ss[0]) begin
         app_completed_vf_q1 <= 1'b1;
       end
       if (!flr_resp_present_ss_q[1] & flr_resp_present_ss[1]) begin
         app_completed_vf_q1 <= 1'b1;
       end
       if (!flr_resp_present_ss_q[2] & flr_resp_present_ss[2]) begin
         app_completed_vf_q2 <= 1'b1;
       end
       if (!flr_resp_present_ss_q[3] & flr_resp_present_ss[3]) begin
         app_completed_vf_q2 <= 1'b1;
       end
     end
   end




endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf9Rs8VC5ULLi0ijp9E+9UZtgChfTp5CcbRGee5nrhBkRfHXk+kqeKaPicV5weTNceJ592XEFHn6V/v8myS/VYD/jhehx6/C7giCLDe4xz1e2qZrH4KI0SUkq5B1DuvThK0bB56cIX6f1kn8Dfzmxs/IUTWnGAregnBVEH2ebp24M2hqziB5fYnaF96omFe5J+2YnBLQ3VbJySxfZhBAqwHC3kYW70rlNdLVMUk3LdAsKIny2Cd4hDwmteO52fcYiaaQ7HFn20b/b+39CR5HwLOIcU2b6QQEvMlTECJq0NtLOrUqjxEmrIlqEJ7mtiXfQCTK2Z7UbfKX/NO7h8VqLe2CcfleY2F/ev/TIgMF96gGU6pnWABxZQPyv0J3sFFQiiXKLc+5ijXG9iN579DtMktfLI+3cF2sGZLv+IDQa2gX063citUKsGlhOknnEN2swksri5v88EMuP2r5j6u17YA6ad1DnlH8snqIOPB1e255HJusdXnXum6+rLaSpOkUTXYl8xBYPgQ/2ygfXlx96H4rkxYFb23wGaPQl1b7sPWdgG4niu2kQlWwENz2bfIkjtmEhJSL9UVIzb3aDvCkElqEnB16qgqEZj1qq0jEzZ+DrvIHm52ry3ZeFcH3bTwkDq+yvaFAlXajiEUtfWB3hppn9kUd9dynFbjZdOeL5ILrYaoUAj0YFXCRj+pPFmNXXu9FLyD0SCpvLW3fHRa+casXEX0RvnETY2PwWD0U9YSF3wwSdDrlpCjZHo/IO59WMN6R3VQvktg45F3hRJ0PdVIa"
`endif