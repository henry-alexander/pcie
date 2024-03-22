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


module pcie_phy_user_avmm_arb(

	input			phy_avmm_read,
	input			phy_avmm_write,
    input	[23:0]	phy_avmm_address,
	input	[31:0]	phy_avmm_writedata,
	output	logic		phy_avmm_readdatavalid,
	output	logic	[31:0]	phy_avmm_readdata,
	output	logic		phy_avmm_waitrequest,
	
	output         	phy0_avmm_read,
    output         	phy0_avmm_write,
    output 	[20:0]  phy0_avmm_address,
    output 	[31:0]  phy0_avmm_writedata,
    input          	phy0_avmm_readdatavalid,
    input  	[31:0]  phy0_avmm_readdata,
    input          	phy0_avmm_waitrequest,
	
	output         	phy1_avmm_read,
    output         	phy1_avmm_write,
    output 	[20:0]  phy1_avmm_address,
    output 	[31:0]  phy1_avmm_writedata,
    input          	phy1_avmm_readdatavalid,
    input  	[31:0]  phy1_avmm_readdata,
    input          	phy1_avmm_waitrequest,
	
	output         	phy2_avmm_read,
    output         	phy2_avmm_write,
    output 	[20:0]  phy2_avmm_address,
    output 	[31:0]  phy2_avmm_writedata,
    input          	phy2_avmm_readdatavalid,
    input  	[31:0]  phy2_avmm_readdata,
    input          	phy2_avmm_waitrequest,
	
	output         	phy3_avmm_read,
    output         	phy3_avmm_write,
    output 	[20:0]  phy3_avmm_address,
    output 	[31:0]  phy3_avmm_writedata,
    input          	phy3_avmm_readdatavalid,
    input  	[31:0]  phy3_avmm_readdata,
    input          	phy3_avmm_waitrequest

// TODO for x8
/*	
	output         	phy4_avmm_read,
    output         	phy4_avmm_write,
    output 	[19:0]  phy4_avmm_address,
    output 	[31:0]   phy4_avmm_writedata,
    input          	phy4_avmm_readdatavalid,
    input  	[31:0]   phy4_avmm_readdata,
    input          	phy4_avmm_waitrequest,
	
	output         	phy5_avmm_read,
    output         	phy5_avmm_write,
    output 	[19:0]  phy5_avmm_address,
    output 	[31:0]   phy5_avmm_writedata,
    input          	phy5_avmm_readdatavalid,
    input  	[31:0]   phy5_avmm_readdata,
    input          	phy5_avmm_waitrequest,
	
	output         	phy6_avmm_read,
    output         	phy6_avmm_write,
    output 	[19:0]  phy6_avmm_address,
    output 	[31:0]   phy6_avmm_writedata,
    input          	phy6_avmm_readdatavalid,
    input  	[31:0]   phy6_avmm_readdata,
    input          	phy6_avmm_waitrequest,
	
	output         	phy7_avmm_read,
    output         	phy7_avmm_write,
    output 	[19:0]  phy7_avmm_address,
    output 	[31:0]   phy7_avmm_writedata,
    input          	phy7_avmm_readdatavalid,
    input  	[31:0]   phy7_avmm_readdata,
    input          	phy7_avmm_waitrequest*/
	
);	

	logic	[2:0]	phyq_sel;

	//3-bit address decoder
	assign phyq_sel = phy_avmm_address[23:21];

	//PHY0
	assign phy0_avmm_read			= (phyq_sel == 3'd0) ? phy_avmm_read : 0;
	assign phy0_avmm_write		= (phyq_sel == 3'd0) ? phy_avmm_write : 0;
	assign phy0_avmm_address	= (phyq_sel == 3'd0) ? phy_avmm_address[20:0] : 0;
	assign phy0_avmm_writedata	= (phyq_sel == 3'd0) ? phy_avmm_writedata : 0;

	//PHY1
	assign phy1_avmm_read			= (phyq_sel == 3'd1) ? phy_avmm_read : 0;
	assign phy1_avmm_write		= (phyq_sel == 3'd1) ? phy_avmm_write : 0;
	assign phy1_avmm_address	= (phyq_sel == 3'd1) ? phy_avmm_address[20:0] : 0;
	assign phy1_avmm_writedata	= (phyq_sel == 3'd1) ? phy_avmm_writedata : 0;

	//PHY2
	assign phy2_avmm_read			= (phyq_sel == 3'd2) ? phy_avmm_read : 0;
	assign phy2_avmm_write		= (phyq_sel == 3'd2) ? phy_avmm_write : 0;
	assign phy2_avmm_address	= (phyq_sel == 3'd2) ? phy_avmm_address[20:0] : 0;
	assign phy2_avmm_writedata	= (phyq_sel == 3'd2) ? phy_avmm_writedata : 0;

	//PHY3
	assign phy3_avmm_read			= (phyq_sel == 3'd3) ? phy_avmm_read : 0;
	assign phy3_avmm_write		= (phyq_sel == 3'd3) ? phy_avmm_write : 0;
	assign phy3_avmm_address	= (phyq_sel == 3'd3) ? phy_avmm_address[20:0] : 0;
	assign phy3_avmm_writedata	= (phyq_sel == 3'd3) ? phy_avmm_writedata : 0;

// TODO for x8
/*
	//PHY4
	assign phy4_avmm_read			= (phyq_sel == 3'd4) ? phy_avmm_read : 0;
	assign phy4_avmm_write		= (phyq_sel == 3'd4) ? phy_avmm_write : 0;
	assign phy4_avmm_address		= (phyq_sel == 3'd4) ? {1'b0, phy_avmm_address[19:0]} : 0;
	assign phy4_avmm_writedata	= (phyq_sel == 3'd4) ? phy_avmm_writedata : 0;

	//PHY5
	assign phy5_avmm_read			= (phyq_sel == 3'd5) ? phy_avmm_read : 0;
	assign phy5_avmm_write		= (phyq_sel == 3'd5) ? phy_avmm_write : 0;
	assign phy5_avmm_address		= (phyq_sel == 3'd5) ? {1'b0, phy_avmm_address[19:0]} : 0;
	assign phy5_avmm_writedata	= (phyq_sel == 3'd5) ? phy_avmm_writedata : 0;

	//PHY6
	assign phy6_avmm_read			= (phyq_sel == 3'd6) ? phy_avmm_read : 0;
	assign phy6_avmm_write		= (phyq_sel == 3'd6) ? phy_avmm_write : 0;
	assign phy6_avmm_address		= (phyq_sel == 3'd6) ? {1'b0, phy_avmm_address[19:0]} : 0;
	assign phy6_avmm_writedata	= (phyq_sel == 3'd6) ? phy_avmm_writedata : 0;

	//PHY7
	assign phy7_avmm_read			= (phyq_sel == 3'd7) ? phy_avmm_read : 0;
	assign phy7_avmm_write		= (phyq_sel == 3'd7) ? phy_avmm_write : 0;
	assign phy7_avmm_address		= (phyq_sel == 3'd7) ? {1'b0, phy_avmm_address[19:0]} : 0;
	assign phy7_avmm_writedata	= (phyq_sel == 3'd7) ? phy_avmm_writedata : 0;
*/

	assign phy_avmm_readdatavalid = (phyq_sel == 3'd0) ? phy0_avmm_readdatavalid : (phyq_sel == 3'd1) ? phy1_avmm_readdatavalid : (phyq_sel == 3'd2) ? phy2_avmm_readdatavalid : (phyq_sel == 3'd3) ? phy3_avmm_readdatavalid : phy0_avmm_readdatavalid ;
	assign phy_avmm_readdata      = (phyq_sel == 3'd0) ? phy0_avmm_readdata : (phyq_sel == 3'd1) ? phy1_avmm_readdata : (phyq_sel == 3'd2) ? phy2_avmm_readdata : (phyq_sel == 3'd3) ? phy3_avmm_readdata : phy0_avmm_readdata ;
	assign phy_avmm_waitrequest   = (phyq_sel == 3'd0) ? phy0_avmm_waitrequest : (phyq_sel == 3'd1) ? phy1_avmm_waitrequest : (phyq_sel == 3'd2) ? phy2_avmm_waitrequest : (phyq_sel == 3'd3) ? phy3_avmm_waitrequest : phy0_avmm_waitrequest ;
 
// TODO for x8
/*		
	always_comb begin
		case (phyq_sel)
			3'd4 : begin
				phy_avmm_readdatavalid	<= phy4_avmm_readdatavalid;
				phy_avmm_readdata	<= phy4_avmm_readdata;
				phy_avmm_waitrequest	<= phy4_avmm_waitrequest;
            end
			
			3'd5 : begin
				phy_avmm_readdatavalid	<= phy5_avmm_readdatavalid;
				phy_avmm_readdata	<= phy5_avmm_readdata;
				phy_avmm_waitrequest	<= phy5_avmm_waitrequest;
            end
			
			3'd6 : begin
				phy_avmm_readdatavalid	<= phy6_avmm_readdatavalid;
				phy_avmm_readdata	<= phy6_avmm_readdata;
				phy_avmm_waitrequest	<= phy6_avmm_waitrequest;
            end
			
			3'd7 : begin
				phy_avmm_readdatavalid	<= phy7_avmm_readdatavalid;
				phy_avmm_readdata	<= phy7_avmm_readdata;
				phy_avmm_waitrequest	<= phy7_avmm_waitrequest;
            end
*/
	
	endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "QSzqPouKyih2jZ0Su5FOQkMS67tH9G9JCtB4BaNToao7UJACBe79skDNeqFepGWmPLp0b7x14h8eXsQDR/ECDTK97taXbeejNYOHOsYglap6QLEvs6Pj/2xMXNBqc6WVNXQNl9lTDlSC6VhX9i684MG8QxCU8x5qaSHJXOtDJo0VKkrrd7AEah15aDkR+K81/J6OnBL/5yudmmBiZB3oxSDu+pEu0q0oOtmoSBUPWNTRh/IRXNW4zyuwHH7BPVjdWu1PSF+Mkb3c3ckQjX5K55AJszpQOgSNpM9G3KWSp+c5LQupDkjO3QmZxXiZCgtBvtmjo5hldxiD0+hdHVs4UAedNkx7nvkmg8wwO5c+cLONqTBCkY5eMgMxFJLDkn9q6NwlrlzwegaRjPqpmIlPhmpdiwFdFKQOTgS1uq09P32EciZqAyVAh+lu8oR1mPbICiRcUiwFfwirNXGHLI37Z6N8Wl8T3M/mSNVm0Z4sNXW5dvF0wPJMwcJ+FXHkAy20knpfGmenUEsxfjAOZAQrXQ68jWe2wVVQTNoRhXTl9F59hq7CWJp5Ns3TT7cyYBY566wnhvgY+bkhD3fuZnTLjqNZrOHkv1A5P8yhQJrph75uNULYbyMU2q+g5b7FTQQurj0093Fcc9Yj1gpPlPoq9Ihd6kunR/8/L6rZUFGZsRM3tldjZn2UvK1MvpMc0JlYn5N5KXXLWZgJp+IwDyMBdWlwFFsGgQvX1x8owBNedGn0ART9sB1PWRc8zoMtwDxlNHmZ0PkjwoVOA1fEtktZaLuU9Eb8J9hnZqiPdmsWt2/zXIJvq66liuvnxLq7D6FFVg8gl/6AiokQRSMnYDm6RcFfB7M3FFyZ7Ps8YQ6N5MvEo5+bg2c4T/bCDYJxk/Qq5ceLgt638YMnmqjfx4BtMIcN/k/LXmVc5OvcC8INWQs76ScwrWn55fpDgaivLaTkquH0KUxwC25mQbxn3a6vgWTnaKBwoutBriGBGz8+IINstk+hTLXjG9584doFtHXu"
`endif