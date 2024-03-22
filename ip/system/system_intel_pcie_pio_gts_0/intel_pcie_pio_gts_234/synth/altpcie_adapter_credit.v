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
// Your use of Altera Corporation's design tools, logic functions and other
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


module altpcie_adapter_credit (
//Clk and reset
    input                app_clk                     , // 250 MHz
    input                pld_clk                     , // 500 MHz
    input                app_rst_n                   ,
    input                pld_rst_n                   ,

// TX Credit
    input     [15:0]    tx_cdts_limit                ,
    input     [2:0]     tx_cdts_limit_tdm_idex       ,
    output    [15:0]    app_tx_cdts_limit            ,
    output    [2:0]     app_tx_cdts_limit_tdm_idex   ,

// RX Credit
    input     [11:0]    app_rx_buffer_limit          ,
    input     [1:0]     app_rx_buffer_limit_tdm_idex ,
    output    [11:0]    rx_buffer_limit              ,
    output    [1:0]     rx_buffer_limit_tdm_idex

  );

  parameter intended_device_family = "Stratix 10";

  reg[2:0] tx_cdts_limit_tdm_idex_reg;
  reg[15:0] tx_cdts_limit_reg;
  reg[2:0] pld_tx_state;
  reg winc;
  wire rempty, rinc;
  
  reg[11:0] app_rx_buffer_limit_reg;
  reg[1:0] app_rx_buffer_limit_tdm_idex_reg;
  reg winc_rx;
  wire rempty_rx, rinc_rx;
  
  wire[15:0] app_tx_cdts_limit_fifo;
  wire[2:0]  app_tx_cdts_limit_tdm_idex_fifo;
  reg[15:0] app_tx_cdts_limit_reg;
  reg[2:0]  app_tx_cdts_limit_tdm_idex_reg;

  localparam IDLE=3'b111,
			 PH = 3'b000,
			 NPH = 3'b001,
			 CPLH = 3'b010,
			 PD = 3'b100,
			 NPD = 3'b101,
			 CPLD = 3'b110;
  
  always @(posedge pld_clk) begin
	tx_cdts_limit_tdm_idex_reg <= tx_cdts_limit_tdm_idex;
	tx_cdts_limit_reg <= tx_cdts_limit;
  end
  
  always @(posedge pld_clk or negedge pld_rst_n) begin
	if(!pld_rst_n) begin
		pld_tx_state <= IDLE;
		winc <= 1'b0;
	end
	else begin
		case(pld_tx_state) 
		IDLE: begin
			if(tx_cdts_limit_tdm_idex == PH) begin
				pld_tx_state <= PH;
				winc <= 1'b1;
			end
			else begin
				pld_tx_state <= IDLE;
				winc <= 1'b0;
			end
		end
		PH: begin
			if(tx_cdts_limit_tdm_idex == CPLH) begin
				pld_tx_state <= CPLH;
				winc <= 1'b1;
			end
			else begin
				pld_tx_state <= PH;
				winc <= 1'b0;
			end
		end
		CPLH: begin
			if(tx_cdts_limit_tdm_idex == NPD) begin
				pld_tx_state <= NPD;
				winc <= 1'b1;
			end
			else begin
				pld_tx_state <= CPLH;
				winc <= 1'b0;
			end
		end
		NPD: begin
			if(tx_cdts_limit_tdm_idex == NPH) begin
				pld_tx_state <= NPH;
				winc <= 1'b1;
			end
			else begin
				pld_tx_state <= NPD;
				winc <= 1'b0;
			end
		end
		NPH: begin
			if(tx_cdts_limit_tdm_idex == PD) begin
				pld_tx_state <= PD;
				winc <= 1'b1;
			end
			else begin
				pld_tx_state <= NPH;
				winc <= 1'b0;
			end
		end
		PD: begin
			if(tx_cdts_limit_tdm_idex == CPLD) begin
				pld_tx_state <= CPLD;
				winc <= 1'b1;
			end
			else begin
				pld_tx_state <= PD;
				winc <= 1'b0;
			end
		end
		CPLD: begin
			if(tx_cdts_limit_tdm_idex == PH) begin
				pld_tx_state <= PH;
				winc <= 1'b1;
			end
			else begin
				pld_tx_state <= CPLD;
				winc <= 1'b0;
			end
		end
		default: begin
			pld_tx_state <= IDLE;
			winc <= 1'b0;
		end
		endcase
	end
  end
  
  assign rinc = ~rempty;
  
  altpcie_async_fifo #(.DSIZE(19), .ASIZE(4), .WATERMARK(4), .intended_device_family(intended_device_family)) tx_cdts_fifo (/*AUTOINST*/
										 // Outputs
										 .rdata			({app_tx_cdts_limit_tdm_idex_fifo,app_tx_cdts_limit_fifo}),
										 .wfull			(wfull),
										 .wafull		(wafull),
										 .rempty		(rempty),
										 // Inputs
										 .wdata			({tx_cdts_limit_tdm_idex_reg,tx_cdts_limit_reg}),
										 .winc			(winc),
										 .wclk			(pld_clk),	 // Templated
										 .wrst_n		(pld_rst_n),	 // Templated
										 .rinc			(rinc),
										 .rclk			(app_clk),	 // Templated
										 .rrst_n		(app_rst_n)
										 );	 // Templated

										 
	always @(posedge app_clk or negedge app_rst_n) begin
		if(!app_rst_n) begin
		  app_tx_cdts_limit_tdm_idex_reg <= 3'b0;
		  app_tx_cdts_limit_reg <= 16'b0;
		end
		else if (rinc) begin
		  app_tx_cdts_limit_tdm_idex_reg <= app_tx_cdts_limit_tdm_idex_fifo;
		  app_tx_cdts_limit_reg <= app_tx_cdts_limit_fifo;
		end
	end
	assign {app_tx_cdts_limit_tdm_idex,app_tx_cdts_limit} = {app_tx_cdts_limit_tdm_idex_reg,app_tx_cdts_limit_reg};
	
	always @(posedge app_clk) begin
		app_rx_buffer_limit_reg <= app_rx_buffer_limit;
		app_rx_buffer_limit_tdm_idex_reg <= app_rx_buffer_limit_tdm_idex;
	end
	
	always @(posedge app_clk or negedge app_rst_n) begin
		if(!app_rst_n) begin
			winc_rx <= 1'b0;
		end
		else begin
			if(app_rx_buffer_limit_tdm_idex == 2'b00 | app_rx_buffer_limit_tdm_idex == 2'b01 | app_rx_buffer_limit_tdm_idex == 2'b10) begin
				winc_rx <= 1'b1;
			end
			else begin
				winc_rx <= 1'b0;
			end
		end
	end
	assign rinc_rx = ~rempty_rx;
  altpcie_async_fifo #(.DSIZE(14), .ASIZE(4), .WATERMARK(4), .intended_device_family(intended_device_family)) rx_cdts_fifo (/*AUTOINST*/
										 // Outputs
										 .rdata			({rx_buffer_limit_tdm_idex,rx_buffer_limit}),
										 .wfull			(wfull_rx),
										 .wafull		(wafull_rx),
										 .rempty		(rempty_rx),
										 // Inputs
										 .wdata			({app_rx_buffer_limit_tdm_idex_reg,app_rx_buffer_limit_reg}),
										 .winc			(winc_rx),
										 .wclk			(app_clk),	 // Templated
										 .wrst_n		(app_rst_n),	 // Templated
										 .rinc			(rinc_rx),
										 .rclk			(pld_clk),	 // Templated
										 .rrst_n		(pld_rst_n)
										 );	 // Templated
										 
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf/a4q9jrztFgrWx96zISUQqXzIH3ptBtlcXRk5ohaw4S+T7Uouwz3X1C9aRlCaFKD1v6ktvFx7boIQeO+TD7lKEnGPs1mTdHilHUPDQXFRq1ispyvmWslxzUeAYbwTyeaENx1sxnkVLfIAnx1241PmRldzVSNBpp6UTzdsCfHMfp6IHqlEdNPlHo6hjXap336KxWyB0v7pQyjmRJYAMMccczF++nSrtHDEEwW+7oosEBdiwXnofY8W72q+VgQlNHUSI7BlZs/UX1IqDQpLm+UNl2XYRXTL4ExX/D4VDQZC8Jd2MpfwQLkDqNjOhEX5flqFIfvRM1o0AV2Z/M3UGkBIVepd7fgwNiJVd2ruDfu9C0vC4Dz7ouTPFwZO5gLV/N5qoMeojvnK3HhtR3iMqRETBDg5mtm/LvZT0sPzTo2eLmpPaPxRDIBJ8DciQ+t0bGKAagWlqKQ89wKqUWm/tf/5Kq9Fez/dEZOiOW0jmnumGA5S2o/5MzucxAR3Z+7tX/btK1kAd20v1JSivb/kRezSuVQ/i8s3rEk54jF/7EzwxBejXp6AuUjL94qx8R57aFFkPK0Yzi2FMGAWEuBYVx1IJAhnxSYZYeH7Efb7XDA111qi3cXpaYtad2Ro2LF7xa64fYvQjFKFjzHMJe83wz4MYPY71uNo7nydTn61mpN9aok3fr9V4sFiA1Vb5+ZLTgaaHDr34fuqoEv/OHbW89RZL+0j3f9kHJK9bo1v0pXsMpttxE7nDPNnfIKESi79+8ahunSJj+8UXeU9ogYSOcGqe"
`endif