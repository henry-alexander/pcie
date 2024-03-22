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

module  altpcie_fifo_read_ctrl #(parameter ADDRSIZE = 4)
   (output reg               rempty,
    output [ADDRSIZE-1:0]    raddr,
    output reg [ADDRSIZE :0] rptr,
    input  [ADDRSIZE :0]     rq2_wptr,
    input                    rinc,
	input                    rclk,
	input                    rrst_n);

reg  [ADDRSIZE:0]  rbin;
reg  [ADDRSIZE:0]  pre_rbin;
reg  [ADDRSIZE:0]  rbin_gray;
reg  [ADDRSIZE:0]  pre_rbin_gray;
wire [ADDRSIZE:0]  pre_rgraynext;
wire [ADDRSIZE:0]  rgraynext;
wire [ADDRSIZE:0]  rbinnext;
wire               rempty_val;

// Pre-compute the address increment
// rinc     01110011-
// rbin     001233345
// pre_rbin 112344456
always @(posedge rclk or negedge rrst_n)
  if (!rrst_n)
	pre_rbin <='h1;
  else if (rinc && !rempty)
	pre_rbin <= rbin + 2'h2;

// Binary address
always @(posedge rclk or negedge rrst_n)
  if (!rrst_n)
	rbin <= 'h0;
  else if (rinc && !rempty)
	rbin <= pre_rbin;

always @(posedge rclk or negedge rrst_n)
  if (!rrst_n) begin
	rbin_gray <= 'h0;
	pre_rbin_gray <='h1;
  end
  else if (rinc && !rempty) begin
	rbin_gray <= (pre_rbin >> 1) ^ pre_rbin;
	pre_rbin_gray <= (rbin + 2'h2)>>1 ^ (rbin + 2'h2);
  end
assign pre_rgraynext = (rinc && !rempty) ? pre_rbin_gray : rbin_gray;

// GRAYSTYLE pointer
always @(posedge rclk or negedge rrst_n)
  if (!rrst_n)
	rptr <= 'h0;
  else
	rptr <= rgraynext;

// Memory read-address pointer (okay to use binary to address memory)
assign raddr = rbin[ADDRSIZE-1:0];
assign rbinnext = (rinc && !rempty) ? pre_rbin : rbin;
assign rgraynext = (rbinnext>>1) ^ rbinnext;

//---------------------------------------------------------------
// FIFO empty when the next rptr == synchronized wptr or on reset
//---------------------------------------------------------------
assign rempty_val = (pre_rgraynext == rq2_wptr);
always @(posedge rclk or negedge rrst_n)
  if (!rrst_n)
	rempty <= 1'b1;
  else
    rempty <= rempty_val;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf+S9qm84jNi9egmMpKZm4Xsv5CRFyQrXzE+HsworO7nv8cuQSdFcJWFvu/SOqBoxA0JaikS0w0e48pRwXMgelQfq4dJYPdQh354/JBuv9ZYpers4cnN4/po7QW2iJAFGMk8gkPyAZQ8GAAecgpey+9FS98rhUPB4YyGaSSYM/kEFSDdd6U+Z0GOSlDem+Gub6xqYcS+Dws+iFHgOarOo6wv5IVRSb5I03CqHrKJ5g1ndxq7ryP3uUTGaamVV6jEbhP+laIPSJPh/aTMWuslncVTxdDitDM2sTVkJOZnqoNtGO7s3MVPbtP6EWz9vvzdiMb7bN/9jCuneUopoQ/YmV9jKwDpPQqCDk5m6b++1Uj9lKj02BQ9wI+gXKqe+bTKy/JuoRK9DT32E6NszGDJKIxbhQ0kV1wjGKYqmOIb96YsGfutmRwx0yX96Ue0YpdK9GHoAg9judkplDs54ZCbWX1k27Lpm8ZbbyXh29BhQpUYLJWSlEesQ7MtC5nUHQKrII/lNiM0Bno75dJHbAI0YgNDwfnNSiXC8bxBiVqe8KHsq740+D3bMKurmvEinSBgocl8vwtC1TFgR5JL1zdmPsZJr8+VtwurOrrugKzbqeYcOV/Ti8IeP1lXC6DP/RnDtKNMqvf2WklAhFabhWM2hmfXkmQQ59BHd9J9mwbUn4t6RONuOFBwztF8k5RHqut/quorjmFRnBmaNimXc1vNT8mh3NxDBRM7u5BEiViOc4PWrNzpLU5FUbjThBENSaF9n64itQwoyw/LTfE8kroy/Tvt"
`endif