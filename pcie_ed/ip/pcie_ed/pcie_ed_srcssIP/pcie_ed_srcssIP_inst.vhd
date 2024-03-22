	component pcie_ed_srcssIP is
		port (
			o_pma_cu_clk : out std_logic_vector(0 downto 0)   -- clk
		);
	end component pcie_ed_srcssIP;

	u0 : component pcie_ed_srcssIP
		port map (
			o_pma_cu_clk => CONNECTED_TO_o_pma_cu_clk  -- o_pma_cu_clk.clk
		);

