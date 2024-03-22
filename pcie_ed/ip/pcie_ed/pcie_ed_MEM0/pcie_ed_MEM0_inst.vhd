	component pcie_ed_MEM0 is
		port (
			clk        : in  std_logic                      := 'X';             -- clk
			address    : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- address
			read       : in  std_logic                      := 'X';             -- read
			readdata   : out std_logic_vector(511 downto 0);                    -- readdata
			byteenable : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- byteenable
			write      : in  std_logic                      := 'X';             -- write
			writedata  : in  std_logic_vector(511 downto 0) := (others => 'X'); -- writedata
			reset      : in  std_logic                      := 'X'              -- reset
		);
	end component pcie_ed_MEM0;

	u0 : component pcie_ed_MEM0
		port map (
			clk        => CONNECTED_TO_clk,        --   clk1.clk
			address    => CONNECTED_TO_address,    --     s1.address
			read       => CONNECTED_TO_read,       --       .read
			readdata   => CONNECTED_TO_readdata,   --       .readdata
			byteenable => CONNECTED_TO_byteenable, --       .byteenable
			write      => CONNECTED_TO_write,      --       .write
			writedata  => CONNECTED_TO_writedata,  --       .writedata
			reset      => CONNECTED_TO_reset       -- reset1.reset
		);

