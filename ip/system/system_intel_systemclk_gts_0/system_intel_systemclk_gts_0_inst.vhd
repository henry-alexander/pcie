	component system_intel_systemclk_gts_0 is
		port (
			o_pll_lock  : out std_logic;        -- o_pll_lock
			o_syspll_c0 : out std_logic;        -- clk
			i_refclk    : in  std_logic := 'X'  -- clk
		);
	end component system_intel_systemclk_gts_0;

	u0 : component system_intel_systemclk_gts_0
		port map (
			o_pll_lock  => CONNECTED_TO_o_pll_lock,  --  o_pll_lock.o_pll_lock
			o_syspll_c0 => CONNECTED_TO_o_syspll_c0, -- o_syspll_c0.clk
			i_refclk    => CONNECTED_TO_i_refclk     -- refclk_xcvr.clk
		);

