	component system_intel_srcss_gts_0 is
		port (
			o_pma_cu_clk : out std_logic_vector(0 downto 0)   -- clk
		);
	end component system_intel_srcss_gts_0;

	u0 : component system_intel_srcss_gts_0
		port map (
			o_pma_cu_clk => CONNECTED_TO_o_pma_cu_clk  -- o_pma_cu_clk.clk
		);

