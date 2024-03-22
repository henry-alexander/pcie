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



`timescale 1 ps / 1 ps


module system_intel_systemclk_gts_0_intel_systemclk_gts_200_ml62u5i  #(

   parameter  systempll_ethernet_preset_0 = "IE",
   parameter  systempll_pcie_preset_0 = "IE",
   parameter  systempll_c0_output_enable_0   = "IE",
   parameter  systempll_c1_output_enable_0   = "IE",
   parameter  systempll_c2_output_enable_0   = "IE",
   parameter  systempll_f_out_c0_hz_0        = "IE",
   parameter  systempll_f_out_c1_hz_0        = "IE",
   parameter  systempll_f_out_c2_hz_0        = "IE",
   parameter  systempll_f_ref_hz_0           = "IE",
   parameter  systempll_primary_use_0        = "IE",
  
   parameter  silicon_revision        = "10nm6awhra",
   parameter  device_revision         = "10nm6awhra"

 ) (
        output    o_pll_lock,
                           
        input    i_refclk_ready,
        input    i_refclk,
        
        output    o_syspll_c0,
        output    o_syspll_c1,
        output    o_syspll_c2
  );





//=================================================================
//                          SystemPLL
//=================================================================
localparam SYSTEMPLL_NUM = 1;

wire   [SYSTEMPLL_NUM-1:0]  w_systempll_clk_out;
wire   [SYSTEMPLL_NUM-1:0]  w_systempll_clk_out_1;
wire   [SYSTEMPLL_NUM-1:0]  w_systempll_clk_out_2;
wire   [SYSTEMPLL_NUM-1:0]  w_systempll_fabric_clk_out_2;
wire   [SYSTEMPLL_NUM-1:0]  w_systempll_fabric_clk_out_1;
wire   [SYSTEMPLL_NUM-1:0]  w_systempll_fabric_clk_out;

wire   [SYSTEMPLL_NUM-1:0]  w_systempll_synthlock_out;
wire   [SYSTEMPLL_NUM-1:0]  w_systempll_status_out;




assign   o_syspll_c2 = w_systempll_clk_out_2;
assign   o_syspll_c1 = w_systempll_clk_out_1;
assign   o_syspll_c0 = w_systempll_clk_out;



assign    o_pll_lock   = w_systempll_synthlock_out;
  
 system_intel_systemclk_gts_0_intel_systemclk_gts_spll_hal_200_xeaucwq #(
  
  //.syspll_l_sys_pll_f_ref_hz         ( systempll_f_ref_hz_0 ),
  //.syspll_l_sys_pll_f_out_c0_hz      ( systempll_f_out_c0_hz_0 ),
  //.syspll_l_sys_pll_c0_output_enable ( systempll_c0_output_enable_0 ),
  //.syspll_l_sys_pll_c1_output_enable ( systempll_c1_output_enable_0),
  //.syspll_l_sys_pll_f_out_c1_hz      ( systempll_f_out_c1_hz_0 ),
  //.syspll_l_sys_pll_c2_output_enable     (  systempll_c2_output_enable_0 ),
  //.syspll_l_sys_pll_f_out_c2_hz          (  systempll_f_out_c2_hz_0 )
  ) inst (
     .o_spll_lock              (   w_systempll_synthlock_out  ),
     .o_syspll_c0              (   w_systempll_clk_out        ),
     .o_syspll_c1              (   w_systempll_clk_out_1      ),
     .o_syspll_c2              (   w_systempll_clk_out_2      ),
     .i_refclk_rdy             (   i_refclk_ready              ),
     .i_refclk                 (   i_refclk )
 );

 
 
 assign w_systempll_fabric_clk_out_2  = 0;
 assign w_systempll_fabric_clk_out_1  = 0;
 assign w_systempll_fabric_clk_out    = 0;
 
 
    
endmodule


