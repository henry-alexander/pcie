	component pcie_ed_resetIP is
		port (
			ninit_done : out std_logic   -- reset
		);
	end component pcie_ed_resetIP;

	u0 : component pcie_ed_resetIP
		port map (
			ninit_done => CONNECTED_TO_ninit_done  -- ninit_done.reset
		);

