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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module altpcie_fifo_write_ctrl #(parameter ADDRSIZE = 4,
                                 parameter WATERMARK = 4)
   (output reg                wfull,
	output reg                wafull,
    output [ADDRSIZE-1:0]     waddr,
    output reg [ADDRSIZE :0]  wptr,
    input  [ADDRSIZE :0]      wq2_rptr,
    input                     winc,
	input                     wclk,
	input                     wrst_n);

reg  [ADDRSIZE:0]   wbin;
reg  [ADDRSIZE:0]   pre_wbin;
reg  [ADDRSIZE:0]   wq2_rbin;
reg  [ADDRSIZE:0]   wq2_rbin_comb;
reg  [ADDRSIZE+1:0] wbinmark;
wire [ADDRSIZE:0]   wgraynext;
wire [ADDRSIZE:0]   wbinnext;
wire [ADDRSIZE-1:0] bin_wr_diff;
wire [ADDRSIZE-1:0] negbin_wr_diff;
wire                wfull_val;
wire                wafull_val;

// Pre-compute the address increment
// rinc     01110011-
// rbin     001233345
// pre_rbin 112344456
always @(posedge wclk or negedge wrst_n)
  if (!wrst_n)
	pre_wbin <= 1;
  else if (winc && !wfull)
	pre_wbin <= wbin + 2'd2;

// Binary address
always @(posedge wclk or negedge wrst_n)
  if (!wrst_n)
	wbin <= 0;
  else if (winc && !wfull)
	wbin <= pre_wbin;

// GRAYSTYLE pointer
always @(posedge wclk or negedge wrst_n)
  if (!wrst_n)
	wptr <= 0;
  else
	wptr <= wgraynext;

// Memory write-address pointer (okay to use binary to address memory)
assign waddr = wbin[ADDRSIZE-1:0];
assign wbinnext = (winc && !wfull) ? pre_wbin : wbin;
assign wgraynext = (wbinnext>>1) ^ wbinnext;

assign wfull_val = (wgraynext=={~wq2_rptr[ADDRSIZE:ADDRSIZE-1], wq2_rptr[ADDRSIZE-2:0]});

always @(posedge wclk or negedge wrst_n)
  if (!wrst_n)
    wfull <= 1'b0;
  else
    wfull <= wfull_val;

// Water mark pointer
always @(posedge wclk) begin
  wbinmark <= wbin + WATERMARK;
  wq2_rbin <= wq2_rbin_comb;
end

integer i;
always @(wq2_rptr or wq2_rbin_comb) begin
  wq2_rbin_comb[ADDRSIZE] = wq2_rptr[ADDRSIZE];

  for(i=ADDRSIZE-1; i>=0; i=i-1) begin
    wq2_rbin_comb[i] = wq2_rptr[i] ^ wq2_rbin_comb[i+1];
  end
end

assign bin_wr_diff    = wbinmark[ADDRSIZE-1:0] - wq2_rbin[ADDRSIZE-1:0];
assign negbin_wr_diff = - bin_wr_diff;

assign wafull_val = (bin_wr_diff < WATERMARK || negbin_wr_diff < WATERMARK) ? 1'b1 : 1'b0;

always @(posedge wclk or negedge wrst_n)
  if (!wrst_n)
    wafull <= 1'b0;
  else
    wafull <= wafull_val;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf/h6tCilHpQGeOjtSsQ1vKM5Z2MqgI7YBpWCKWozSnmfbFJe0/esqQ3ttngAYwHJ67dGj0u7bzzFwibO+etj92xqaOIZvNa99CVe0R9x4yepyHRCIWaZgmZbj+lKbCAWV+/VS7ZX36yiS/eVEWa3+tWShhLhN+w0PE4NLA+qnaP3+YPzz56BfxunIRNFY+R4hMn3oUrvv4y2dG8ZEOfXpoioCB9ls+6+35gxNoOLThgr/kicuimDd9KLr2cxUz0irYwvIS7WEITnMkxq28jQEk8Xb3AG63UqhogCe17+mdbJiZhK9l8PA2ZR1bDs3JXNiuMIIGQGZhzkhno1ql7eY0PatBnNyBFIQa6V9fdd6EkoNWXDzscTgQq8SstkZzidKQJ5+pATqoEZgogsv+wFNh5r4l8gYjdVkzVqlOHbEMqR8UaKtBRflL7DiHwGHuRWDe9z1UcYNJcCZM4rgnGxEawFQSBwhTwQaDDvAGH3/3+S3zvXKxpqj1luJdg1bWuizJI4JkZPWt1IuQ5pSlIXrT0Be69gxF+e2yaoBwKT8nKlHT7hLCsL66QmlpBa0veKLYh5WlJKvX98+AE3Y/XRPZRpn+ibR0/8EFjFmQEfHxq1pckC+IcaNmxal5Csnwn0QfjopSBcSx+bEH8/uT5uNvpKY3bw7FxqO5dwqiyWW+2XCPio/WS7bGHQzVfOMH4gzDhj+IpyYZcHRUYRWM5SFkKu8Up74I5rv4fK/jzt/EoQgjccs8TeJfeMVwCJH53BEdwUmTBG7zc3dWsdVWq/ZHq"
`endif