// pcie_ed_syspll_intel_systemclk_gts_spll_hal_200_cc5u5ly.v

// Generated using ACDS version 23.4.1 205

`timescale 1 ps / 1 ps
module pcie_ed_syspll_intel_systemclk_gts_spll_hal_200_cc5u5ly #(
		parameter       sys_pll_c0_output_enable_atom  = "SYS_PLL_C0_OUTPUT_ENABLE_ENABLE",
		parameter       sys_pll_c1_output_enable_atom  = "SYS_PLL_C1_OUTPUT_ENABLE_ENABLE",
		parameter       sys_pll_c2_output_enable_atom  = "SYS_PLL_C2_OUTPUT_ENABLE_ENABLE",
		parameter       sys_pll_c3_output_enable_atom  = "SYS_PLL_C3_OUTPUT_ENABLE_DISABLE",
		parameter[35:0] sys_pll_f_ref_hz_atom          = 36'b000000000101111101011110000100000000,
		parameter[35:0] sys_pll_f_out_c0_hz_atom       = 36'b000000010100110111001001001110000000,
		parameter[35:0] sys_pll_f_out_c1_hz_atom       = 36'b000000010100110111001001001110000000,
		parameter[35:0] sys_pll_f_out_c2_hz_atom       = 36'b000000010100110111001001001110000000,
		parameter[35:0] sys_pll_f_out_c3_hz_atom       = 36'b000000000000000000000000000000000000,
		parameter       pll_primary_use_atom           = "PLL_PRIMARY_USE_PCIE",
		parameter       sys_pll_preset_atom            = "SYS_PLL_PRESET_FREQ_350_100",
		parameter[35:0] sys_pll_f_pfd_hz_atom          = 36'b000000000101111101011110000100000000,
		parameter[35:0] sys_pll_f_vco_hz_atom          = 36'b000010100110111001001001110000000000,
		parameter[4:0]  sys_pll_n_counter_atom         = 5'b00001,
		parameter[9:0]  sys_pll_m_counter_atom         = 10'b0000011100,
		parameter[23:0] sys_pll_k_counter_atom         = 24'b000000000000000000000000,
		parameter[10:0] sys_pll_c0_counter_atom        = 11'b00000001000,
		parameter[10:0] sys_pll_c1_counter_atom        = 11'b00000001000,
		parameter[10:0] sys_pll_c2_counter_atom        = 11'b00000001000,
		parameter[10:0] sys_pll_c3_counter_atom        = 11'b00000000000,
		parameter       sys_pll_fractional_enable_atom = "SYS_PLL_FRACTIONAL_ENABLE_DISABLE",
		parameter       pll_always_on_atom             = "PLL_ALWAYS_ON_ALWAYS_ON_ENABLED",
		parameter       sup_mode_atom                  = "SUP_MODE_USER_MODE"
	) (
		output wire  o_spll_lock,  //  o_spll_lock.out_systempll_synthlock
		output wire  o_syspll_c0,  //  o_syspll_c0.clk
		output wire  o_syspll_c1,  //  o_syspll_c1.clk
		output wire  o_syspll_c2,  //  o_syspll_c2.clk
		input  wire  i_refclk,     //  refclk_xcvr.clk
		input  wire  i_refclk_rdy  // i_refclk_rdy.data
	);

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (sys_pll_c0_output_enable_atom != "SYS_PLL_C0_OUTPUT_ENABLE_ENABLE")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_c0_output_enable_atom_check ( .error(1'b1) );
		end
		if (sys_pll_c1_output_enable_atom != "SYS_PLL_C1_OUTPUT_ENABLE_ENABLE")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_c1_output_enable_atom_check ( .error(1'b1) );
		end
		if (sys_pll_c2_output_enable_atom != "SYS_PLL_C2_OUTPUT_ENABLE_ENABLE")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_c2_output_enable_atom_check ( .error(1'b1) );
		end
		if (sys_pll_c3_output_enable_atom != "SYS_PLL_C3_OUTPUT_ENABLE_DISABLE")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_c3_output_enable_atom_check ( .error(1'b1) );
		end
		if (sys_pll_f_ref_hz_atom != 36'b000000000101111101011110000100000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_f_ref_hz_atom_check ( .error(1'b1) );
		end
		if (sys_pll_f_out_c0_hz_atom != 36'b000000010100110111001001001110000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_f_out_c0_hz_atom_check ( .error(1'b1) );
		end
		if (sys_pll_f_out_c1_hz_atom != 36'b000000010100110111001001001110000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_f_out_c1_hz_atom_check ( .error(1'b1) );
		end
		if (sys_pll_f_out_c2_hz_atom != 36'b000000010100110111001001001110000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_f_out_c2_hz_atom_check ( .error(1'b1) );
		end
		if (sys_pll_f_out_c3_hz_atom != 36'b000000000000000000000000000000000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_f_out_c3_hz_atom_check ( .error(1'b1) );
		end
		if (pll_primary_use_atom != "PLL_PRIMARY_USE_PCIE")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					pll_primary_use_atom_check ( .error(1'b1) );
		end
		if (sys_pll_preset_atom != "SYS_PLL_PRESET_FREQ_350_100")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_preset_atom_check ( .error(1'b1) );
		end
		if (sys_pll_f_pfd_hz_atom != 36'b000000000101111101011110000100000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_f_pfd_hz_atom_check ( .error(1'b1) );
		end
		if (sys_pll_f_vco_hz_atom != 36'b000010100110111001001001110000000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_f_vco_hz_atom_check ( .error(1'b1) );
		end
		if (sys_pll_n_counter_atom != 5'b00001)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_n_counter_atom_check ( .error(1'b1) );
		end
		if (sys_pll_m_counter_atom != 10'b0000011100)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_m_counter_atom_check ( .error(1'b1) );
		end
		if (sys_pll_k_counter_atom != 24'b000000000000000000000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_k_counter_atom_check ( .error(1'b1) );
		end
		if (sys_pll_c0_counter_atom != 11'b00000001000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_c0_counter_atom_check ( .error(1'b1) );
		end
		if (sys_pll_c1_counter_atom != 11'b00000001000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_c1_counter_atom_check ( .error(1'b1) );
		end
		if (sys_pll_c2_counter_atom != 11'b00000001000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_c2_counter_atom_check ( .error(1'b1) );
		end
		if (sys_pll_c3_counter_atom != 11'b00000000000)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_c3_counter_atom_check ( .error(1'b1) );
		end
		if (sys_pll_fractional_enable_atom != "SYS_PLL_FRACTIONAL_ENABLE_DISABLE")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sys_pll_fractional_enable_atom_check ( .error(1'b1) );
		end
		if (pll_always_on_atom != "PLL_ALWAYS_ON_ALWAYS_ON_ENABLED")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					pll_always_on_atom_check ( .error(1'b1) );
		end
		if (sup_mode_atom != "SUP_MODE_USER_MODE")
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		// synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sup_mode_atom_check ( .error(1'b1) );
		end
	endgenerate

	pcie_ed_syspll_spll_hal_2100_dlmglry #(
		.sys_pll_c0_output_enable_atom  ("SYS_PLL_C0_OUTPUT_ENABLE_ENABLE"),
		.sys_pll_c1_output_enable_atom  ("SYS_PLL_C1_OUTPUT_ENABLE_ENABLE"),
		.sys_pll_c2_output_enable_atom  ("SYS_PLL_C2_OUTPUT_ENABLE_ENABLE"),
		.sys_pll_c3_output_enable_atom  ("SYS_PLL_C3_OUTPUT_ENABLE_DISABLE"),
		.sys_pll_f_ref_hz_atom          (36'b000000000101111101011110000100000000),
		.sys_pll_f_out_c0_hz_atom       (36'b000000010100110111001001001110000000),
		.sys_pll_f_out_c1_hz_atom       (36'b000000010100110111001001001110000000),
		.sys_pll_f_out_c2_hz_atom       (36'b000000010100110111001001001110000000),
		.sys_pll_f_out_c3_hz_atom       (36'b000000000000000000000000000000000000),
		.pll_primary_use_atom           ("PLL_PRIMARY_USE_PCIE"),
		.sys_pll_preset_atom            ("SYS_PLL_PRESET_FREQ_350_100"),
		.sys_pll_f_pfd_hz_atom          (36'b000000000101111101011110000100000000),
		.sys_pll_f_vco_hz_atom          (36'b000010100110111001001001110000000000),
		.sys_pll_n_counter_atom         (5'b00001),
		.sys_pll_m_counter_atom         (10'b0000011100),
		.sys_pll_k_counter_atom         (24'b000000000000000000000000),
		.sys_pll_c0_counter_atom        (11'b00000001000),
		.sys_pll_c1_counter_atom        (11'b00000001000),
		.sys_pll_c2_counter_atom        (11'b00000001000),
		.sys_pll_c3_counter_atom        (11'b00000000000),
		.sys_pll_fractional_enable_atom ("SYS_PLL_FRACTIONAL_ENABLE_DISABLE"),
		.pll_always_on_atom             ("PLL_ALWAYS_ON_ALWAYS_ON_ENABLED"),
		.sup_mode_atom                  ("SUP_MODE_USER_MODE")
	) spll_hal_top (
		.o_spll_lock  (o_spll_lock),  //  output,  width = 1,  o_spll_lock.out_systempll_synthlock
		.o_syspll_c0  (o_syspll_c0),  //  output,  width = 1,  o_syspll_c0.clk
		.o_syspll_c1  (o_syspll_c1),  //  output,  width = 1,  o_syspll_c1.clk
		.o_syspll_c2  (o_syspll_c2),  //  output,  width = 1,  o_syspll_c2.clk
		.i_refclk     (i_refclk),     //   input,  width = 1,  refclk_xcvr.clk
		.i_refclk_rdy (i_refclk_rdy)  //   input,  width = 1, i_refclk_rdy.data
	);

endmodule
