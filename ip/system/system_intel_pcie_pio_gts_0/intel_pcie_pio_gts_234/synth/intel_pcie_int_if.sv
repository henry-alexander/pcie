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


module intel_pcie_int_if (

  input  logic                clk500,
  input  logic                rst_n,

  input  logic                clk250,
  input  logic                rst_n_clk250,

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

parameter intended_device_family  = "Stratix 10";

logic fifo_empty,fifo_empty2;

  sync_pulse int_status_sync
  (
   .wr_clk             (clk500),
   .rd_clk             (clk250),
   .wr_rst_n           (rst_n),
   .rd_rst_n           (rst_n_clk250),
   .din                (int_status_i),
   .dout               (int_status_o)
   );

   sync_bit #(
   .DWIDTH            (8)
   ) app_int_sync (
    .clk               (clk500),
    .rst_n             (rst_n),
    .din               (app_int_i),
    .dout              (app_int_o)
   );

   altera_pcie_s10_gen3x16_dcfifo
   #(.FIFO_WIDTH (35),
        .ADDR_WIDTH (5),
        .SIM_EMULATE(0),
        .intended_device_family (intended_device_family)
   )
   tx_fifo_hi
   (
    .din_clk  (clk250),
    .din_sclr (~rst_n_clk250),
    .din_wreq (app_msi_pnd_valid_i),
    .din      ({app_msi_pnd_byte_i,app_msi_pnd_func_i}),
    .din_wusedw(),
    .dout_clk  (clk500),
    .dout_sclr (~rst_n),
    .dout_rreq (~(fifo_empty|fifo_empty2)),
    .dout      ({msi_pnd_byte_o,msi_pnd_func_o}),
    .dout_rusedw(),
    .fifo_empty (fifo_empty),
    .fifo_empty2 (fifo_empty2),
    .fifo_almost_empty(),
    .fifo_almost_full ()
    );


    always_ff @ (posedge clk500)  begin
      if (!rst_n) begin
        msi_pnd_valid_o <= 1'b0;
      end
      else begin
        msi_pnd_valid_o <= ~(fifo_empty|fifo_empty2);
      end
    end
    
    
    
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf95G1NoJMqktYOW8ZoBuwoYCAhGU/Bke3opBOKBjbY9QEuONYJMwxzR2CQEnogIwlSAt/udu7gycLZ293qKsq3r+XUpJN2TDs3AUSEEl4jsVepL/fe8ULDYO9g9FopIHHnFGJWh4ibn2s/0LvE4tucJ/p+di7rfmUudH/tRqtk2fSn+DNIR/tKLGCKC96f44v4VsRLfvpTC4aoKXTJldnoy11yeJXTVzc2z06Stiij1EJa0DBVOpQMBJR8ov0jXIIkaM+fHXEuOYIja/OKMZAro0CmdIxJB3BQJ/9WE44HGXXIgLRvgFiFdH2mOoVyyMQlyr61ZTg01BGSY5wjf5nAMIaWvyAfjfgVysZD9vwAEqco4nZx+A8IoKmkD28BLpZijAbuE3pXkJXezNrxm0tHN0JVNyo6QXq8e5QHuz9olkvUD/i4iIPOQkkSn2XX3iaH/L9qrQJg8R7ErdczYvS9mSCNDWDEEwnC9YEdbc5m0TTF5XufGgkrZVCVO59c6yBq34HLkggLwth5wUacFa9faSP8VpoMIPa+X1/o0whu0iPod6jTbGVyTpWOguvKdmaxH6D0Yy28I6Z5X/OBDAod5LnuFSFqTYWoAY3hnZ9/N70NR67F3laszAPqeW5aH4m6HMHz53MwpFcCmi2HNpRBRNQfWGVzDvbT+xEZIyanTVzCIsaEsZXPvZtxVf+HnGcezha7PTAEnCkj8i21QPMTySuqWySbcKBHbbiAVCGyJefQ7VHCVgTFv/Ul2zB5lVN1OGtAWp7r00MznTz2xCTts"
`endif