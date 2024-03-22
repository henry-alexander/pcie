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


// (C) 2001-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporat's design                tools, logic functions and other
// software and tools, and its AMPP partner logic functions, and any output
// files any of the foregoing (including device programming or simulation
// files), and any associated documentation or information are expressly subject
// to the terms and conditions of the Altera Program License Subscription
// Agreement, Altera MegaCore Function License Agreement, or other applicable
// license agreement, including, without limitation, that your use is for the
// sole purpose of programming logic devices manufactured by Altera and sold by
// Altera or its authorized distributors.  Please refer to the applicable
// agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

//`default_nettype none

module intel_pcie_reset_sync #(
  parameter                  WIDTH_RST              = 1
) (
  input                      clk,
  input                      rst_n,
  output [WIDTH_RST-1:0]     srst_n
);

  wire                       sync_rst_n;

  reg   [WIDTH_RST-1:0]      sync_rst_n_r /* synthesis dont_merge */;
  reg   [WIDTH_RST-1:0]      sync_rst_n_rr /* synthesis dont_merge */;

  assign srst_n              = sync_rst_n_rr;

  intel_std_synchronizer_nocut sync (.clk (clk), .reset_n (rst_n), .din (1'b1), .dout (sync_rst_n) );

  always @(posedge clk) begin
    sync_rst_n_r             <= {(WIDTH_RST){sync_rst_n}};
    sync_rst_n_rr            <= {(WIDTH_RST){sync_rst_n_r}};
  end 


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "aU2Q7kvJYJV/rKC9UIJ/z4i/Q1QUi6QC5GjsbPGPSF1N8LeXq3iTcgw9NnY2x9u5w1tYDgUXyuYWf16bwiMoGB7fxVA60LtzVIJwHC1kTNa2F+3MomKx5CeXzIrG5k8xxxVCc1fllAQJXNGPuS/Eul8qmfLd5gfEo3k8WHaWWME6JHd46ULOUy0oJOO1tHbUbBrNaWixzltg1tnFB4WwjzS3QHJpxRTFs13QBQvdo0PaaajCYmN9bfSrHbWQISh6zqg+q4lv2YwKCDB99qpX5CYFt2ScJOFjv++cUyDhD+7WO82IjZ041/wqBaiiUekXYAv5X+vSMIVFtdeMP5N/HvKeUCub8SMEkJSugLCE7ctkL7glwdBM7pT2vqZ3Dz/CCkwqrmmNeVTUlZHmX19wtGO2bYuoPoeVlFX3ShhZwu2Wk7gusJkU3KYWPUUzQDasd7awx5UD7hoq3oWW4tfzcuijffIqs38te8XTDomSY3G0VgzBzhEHHIO0vz0ytp+HEdJjF6XIelNJfMY4FDuI5msUPe9XfOrg84sCVctsVWD816lBB+DhCZBKzzEvA2WQk7KN2A09QSRHyV72LTFOuxVOoH7Na6gdSVrLbaBgIrsh7hV6I3mxd9xJCvJSU7vvoynxyFrF+HkgEiClVOAZ0hXhTgl/uP7z+ksarwGpF6XCw1w7NDieSMaTT6EAwy7v8kPqS2NGkBLG6TZ9sYNlmRUDYBdcxWp10MDS5UyorfZtNt2EqXI6/v6oB5wLK2S62N11vpRSGHVLAipFnyaFnJw9nDiIKrsBQSUkUoOwl8brVV07ZI3XWZ6cdhgNtM7yXU6ULjUXdYs+q+668nWhhnZWzaPHmiDBdyK/j7yiTqEEdREhpgBegjtLnobhIAL5EITHadM4dZT1gtHtxYlJjOmyFaRREzA0gBE/HWYwgvEITZmA4WBZYFFrdErXIAb4oJTj2uLwyIUB8FzjIazoITP75a0XsFTqQaqUwoTYT3sB7i6BgFSUOqIyYWqBpMF/"
`endif