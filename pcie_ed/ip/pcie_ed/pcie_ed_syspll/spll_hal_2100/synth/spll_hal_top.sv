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


 
module spll_hal_top

#(
parameter sys_pll_c0_output_enable_atom         = "SYS_PLL_C0_OUTPUT_ENABLE_ENABLE" ,
parameter sys_pll_c1_output_enable_atom         = "SYS_PLL_C1_OUTPUT_ENABLE_ENABLE" ,
parameter sys_pll_c2_output_enable_atom         = "SYS_PLL_C2_OUTPUT_ENABLE_ENABLE" ,
parameter sys_pll_c3_output_enable_atom         = "SYS_PLL_C3_OUTPUT_ENABLE_ENABLE" ,
parameter sys_pll_f_ref_hz_atom                 = 36'd0 ,                            
parameter sys_pll_f_out_c0_hz_atom              = 36'd0 ,                            
parameter sys_pll_f_out_c1_hz_atom              = 36'd0 ,                            
parameter sys_pll_f_out_c2_hz_atom              = 36'd0 ,                            
parameter sys_pll_f_out_c3_hz_atom              = 36'd0 ,                            
parameter pll_primary_use_atom                  = "PLL_PRIMARY_USE_DISABLED"  ,      
parameter sys_pll_preset_atom                   = "SYS_PLL_PRESET_FREQ_1000"  ,
parameter sys_pll_f_pfd_hz_atom                 = 36'd0 ,                             
parameter sys_pll_f_vco_hz_atom                 = 36'd0 ,   
//parameter syspll_l_sys_pll_f_vco_hz                       = "0" , 
      
parameter sys_pll_n_counter_atom                = 5'd0 ,                              
parameter sys_pll_m_counter_atom                = 10'd0,                              
parameter sys_pll_k_counter_atom                = 24'd0 ,                             
parameter sys_pll_c0_counter_atom               = 11'd0 ,                             
parameter sys_pll_c1_counter_atom               = 11'd0 ,                             
parameter sys_pll_c2_counter_atom               = 11'd0 ,                             
parameter sys_pll_c3_counter_atom               = 11'd0 ,                             
parameter sys_pll_fractional_enable_atom        = "SYS_PLL_FRACTIONAL_ENABLE_ENABLE" ,
parameter pll_always_on_atom                    = "PLL_ALWAYS_ON_ALWAYS_ON_ENABLED"  ,
parameter sup_mode_atom                         = "SUP_MODE_USER_MODE" 


) (      	output		o_syspll_lock,							 
		input		i_hio_refclk_ready,
		input		i_refclk,
		output		o_syspll_c0,
		output		o_syspll_c1,
		output		o_syspll_c2

        
);


 

tennm_sm_hssi_pll_wrap #(
	  .pll_always_on(pll_always_on_atom),
	  .pll_primary_use(pll_primary_use_atom),
	  .sup_mode(sup_mode_atom),
	  .sys_pll_c0_counter(sys_pll_c0_counter_atom),
	  .sys_pll_c0_output_enable(sys_pll_c0_output_enable_atom),
	  .sys_pll_c1_counter(sys_pll_c1_counter_atom),
	  .sys_pll_c1_output_enable(sys_pll_c1_output_enable_atom),
	  .sys_pll_c2_counter(sys_pll_c2_counter_atom),
	  .sys_pll_c2_output_enable(sys_pll_c2_output_enable_atom),
	  .sys_pll_c3_counter(sys_pll_c3_counter_atom),
	  .sys_pll_c3_output_enable(sys_pll_c3_output_enable_atom),
	  .sys_pll_f_out_c0_hz(sys_pll_f_out_c0_hz_atom),
	  .sys_pll_f_out_c1_hz(sys_pll_f_out_c1_hz_atom),
	  .sys_pll_f_out_c2_hz(sys_pll_f_out_c2_hz_atom),
	  .sys_pll_f_out_c3_hz(sys_pll_f_out_c3_hz_atom),
	  .sys_pll_f_pfd_hz(sys_pll_f_pfd_hz_atom),
	  .sys_pll_f_ref_hz(sys_pll_f_ref_hz_atom),
	  .sys_pll_f_vco_hz(sys_pll_f_vco_hz_atom),
	  .sys_pll_fractional_enable(sys_pll_fractional_enable_atom),
	  .sys_pll_k_counter(sys_pll_k_counter_atom),
	  .sys_pll_m_counter(sys_pll_m_counter_atom),
	  .sys_pll_n_counter(sys_pll_n_counter_atom),
	  .sys_pll_preset(sys_pll_preset_atom)
	  ) inst (
		  .i_hio_refclk_ready (i_hio_refclk_ready),
		  .i_refclk(i_refclk),
		  .o_syspll_c0(o_syspll_c0	),
		  .o_syspll_c1(o_syspll_c1),
		  .o_syspll_c2(o_syspll_c2),
		  .o_syspll_lock(o_syspll_lock)
		 
	 );



	 
endmodule	 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iWZfLCRQjuc87I83kTmQGfuF5C2xFgFuJarJIIXh4hvsOQmRxzJu/cjdVoL9x9CBeSLwWsUW8T2d9Yj+7TYBUY4i2leN9Q/DWolDZysrX4+2w087ip224L9sDKMP/qgTf2G+iebtIRvHFLjfxEf+ULR6k1dQvgfd+VEmpe/fRKtGwEm5ksA1r4BBGI+5wPuHCOTjlPHcqtIp6BQwnPAV1XVsT1O+piBA+MGd4D5t1IUMx71o6SkHbdE5nfeNeUIG+bU53BQA2Vzp1CY7W4fJfJ2tqrpDLFLheeRpLxkqXfgMsJiGWPBD9cSQfwlxreaOotu8++qZFHKfyenMLXpk4lu5mZh/jv77MTX079gG28e10dbYVkkhAjcY+VjuP4p67yx+z7EocnLMqk9BU49WQ9P77ogRHqiwZ8Y816YVfsHuJsN+BgUOpnKLo//z6mLdLMc2uifqzEpKsiHpUEd9efddV49xTwAf8jYvilgxm6/FntzNt9Nu1a1fahAYBBCEhXUN+qbVrHdxAn42xiRp6EQPljhy472WnsIIOtEkBZsliWZkVFeUJhHdGBzcizBQezFvRs1/TIrYn6FFg5qzyAz0sco8mLCLt2yS9WwumVRD48rPzw5Pe1K7pNyaxNXl8AzGzu4cbjsiQ7KTuIja182Fsdo4WMlMypl7Zf3eAdRTqE6u3e4img05RUOTN5GY+oJ+cmAtI0g9OuQ8yGO6j4cMflpARN4WFjcLBzOvtYOz624/EhspqGirIAajVJXZWh9Q/x7EOEvyYj/8nU/1vuh+q3sJOGsxjPWpTgAfRmOT9z4FwXsgoem1QdrGip+dz8NozJAJWunx8QB0lfUlLv6pfVqozam4UVjgegdr28XLGLIAaRXKHGcqwj6SN9vYsp1v9Ke7yM9K621sJCwkXKfIzaXslak1edbfIua/P6SkwST1dVULX9niO20gOxls1oEeED1rWW6McMakz1H2jeTQm3IqjzyNHi57xxW3H1gsds/4GnXEzmZGpjPsjEEJ"
`endif