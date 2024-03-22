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
module altpcie_async_fifo #(parameter DSIZE = 8,
                            parameter ASIZE = 4,
                            parameter WATERMARK = 4,
                            parameter intended_device_family = "Stratix 10")
   (output [DSIZE-1:0] rdata,
    output             wfull,
    output             wafull,
    output             rempty,
    input [DSIZE-1:0]  wdata,
    input              winc,
	input              wclk,
	input              wrst_n,
    input              rinc,
	input              rclk,
	input              rrst_n);

 wire [ASIZE-1:0] waddr, raddr;
 wire [ASIZE:0] wptr, rptr;
 wire [ASIZE:0] wptr_sync, rptr_sync;
 wire [ASIZE:0] wq2_rptr, rq2_wptr;
 wire [DSIZE-1:0] fifo_rdata;
 reg  [DSIZE-1:0] stage_rdata;
 reg              real_rempty;
 wire             stage_rinc;
 wire             extra_rinc;
 wire             fifo_rempty;

 assign wq2_rptr = rptr_sync;
 assign rq2_wptr = wptr_sync;

 //
 // Pre-read the fifomem, in order to register the read data
 //
 assign rdata  = stage_rdata;
 assign rempty = real_rempty;
 assign extra_rinc = ~fifo_rempty & real_rempty;
 assign stage_rinc = extra_rinc | rinc;

 always @(posedge rclk or negedge rrst_n)
   if (!rrst_n)
     real_rempty <= 1'b1;
   else if (extra_rinc)
     real_rempty <= 1'b0;
   else if (rinc && fifo_rempty)
     real_rempty <= 1'b1;
   else
     real_rempty <= real_rempty & fifo_rempty;

 always @(posedge rclk)
   if (stage_rinc) stage_rdata <= fifo_rdata;

 altpcie_sc_bitsync_node  #(ASIZE+1) sync_r2w
                   (.data_out(rptr_sync),
		            .data_in(rptr),
                    .clk(wclk),
                    .rst_n(wrst_n));

 altpcie_sc_bitsync_node #(ASIZE+1) sync_w2r
                   (.data_out(wptr_sync),
		            .data_in(wptr),
                    .clk(rclk),
                    .rst_n(rrst_n));

generate
if (ASIZE > 5) begin
 altpcie_fifomem #(DSIZE, ASIZE) fifomem
                   (.rdata(fifo_rdata),
					.wdata(wdata),
                    .waddr(waddr),
					.raddr(raddr),
                    .wclken(winc),
					.wfull(wfull),
                    .wclk(wclk));
end
else begin
 wire wena;
 assign wena = winc & ~wfull;
 alt_ehipc3_mlab #(DSIZE,ASIZE,1'b0,intended_device_family) fifomem
                   (.wclk(wclk),
                    .wena(wena),
                    .waddr_reg(waddr),
                    .wdata_reg(wdata),
                    .raddr(raddr),
                    .rdata(fifo_rdata));
end
endgenerate

  altpcie_fifo_read_ctrl #(ASIZE) fifo_read_ctrl
                   (.rempty(fifo_rempty),
                    .raddr(raddr),
                    .rptr(rptr),
					.rq2_wptr(rq2_wptr),
                    .rinc(stage_rinc),
					.rclk(rclk),
                    .rrst_n(rrst_n));

  altpcie_fifo_write_ctrl #(ASIZE, WATERMARK) fifo_write_ctrl
                   (.wfull(wfull),
                    .wafull(wafull),
					.waddr(waddr),
                    .wptr(wptr),
					.wq2_rptr(wq2_rptr),
                    .winc(winc),
					.wclk(wclk),
                    .wrst_n(wrst_n));

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf8y6uTrFJO8E5LvOEeJTOkaFnSWv6zpQzRP95mjbtFR+7xLJHpwVscWd4vI8qXjmIjt/nrpbixmNCs0N5Ws+zdjmRRHVD5f9GjLmgKmlUmbVxqCWV/Oej/b4Fen0XN+0ZgpTJto0gKptyqWUsa9CQ1/bxyRkCIgSVWGqkZVtAWv+LSC2weBS5PXOAJTC1hf4D8gGZDL3e4TrWgyrqY0pO5OyrMmHQwhnIynag0czb+FD9HbVTYOZ45o4nLYnmSC5FSJ4gbAUjr9c88HEDXLVcrKLBx0XoZbFuCi1WQv5rMgjoZe94QKPMo2zaX97R9KhLaT+IZj4mgMAGR+laswGyvngcT3dgykUS3u3awZirQGAkcTXH1ASQ1zikUNjyQknuYfxB7UNq78I6fXC6EaFYaE1rTIa0cHj1pdheSbqVqQboQYqKMQPVKX7w20BIzQKDx64Dwu9DWJNEtbqa/m076gayT26touhsLdUwVNVeqeKge7DSeshXITuAUKwAS/r7Bn3tp1Dj9BGwumUxmol5bHqUL7kSxXMZ7RJTEyB2vsoQMHjsEMlVzzF3PVgBYq9v1pgD1kncYkvd5rSH1PJ6IhzqRmD+KYziW6GO0HARUwoZW2ofT1w1tEm9kNeF7S4zUaWZltgV7jOagnlppMVRnV2QCNFiIkAvXGQqTcv8auNPL+3p0W9GoWG6+CIL0tz7lR1yEIf5ZcQEqTRwIEW2hRpVdHADSp+LLuQPDPFx/7tfi8hGbXuywVY2lAsVW/Jb+SDyn1rGPV0Hu3Nk7XJv4v"
`endif