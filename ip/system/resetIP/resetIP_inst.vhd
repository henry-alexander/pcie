	component resetIP is
		port (
			ninit_done : out std_logic   -- reset
		);
	end component resetIP;

	u0 : component resetIP
		port map (
			ninit_done => CONNECTED_TO_ninit_done  -- ninit_done.reset
		);

