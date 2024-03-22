	component pcie_ed_pio0 is
		port (
			Clk_i                        : in  std_logic                      := 'X';             -- clk
			outclk_0                     : in  std_logic                      := 'X';             -- clk
			coreclkout_hip               : in  std_logic                      := 'X';             -- clk
			Rstn_i                       : in  std_logic                      := 'X';             -- reset_n
			pio_clk                      : out std_logic;                                         -- clk
			pio_rst_n                    : out std_logic;                                         -- reset_n
			pio_axi_st_areset_n          : out std_logic;                                         -- reset_n
			pio_axi_lite_areset_n        : out std_logic;                                         -- reset_n
			pio_subsystem_cold_rst_n     : out std_logic;                                         -- reset_n
			pio_subsystem_warm_rst_n     : out std_logic;                                         -- reset_n
			ninit_done                   : in  std_logic                      := 'X';             -- reset
			pio_subsystem_cold_rst_ack_n : in  std_logic                      := 'X';             -- subsystem_cold_rst_ack_n
			pio_subsystem_warm_rst_ack_n : in  std_logic                      := 'X';             -- subsystem_warm_rst_ack_n
			pio_initiate_warmrst_req     : in  std_logic                      := 'X';             -- initiate_warmrst_req
			pio_subsystem_rst_rdy        : in  std_logic                      := 'X';             -- subsystem_rst_rdy
			pio_subsystem_rst_req        : out std_logic;                                         -- subsystem_rst_req
			pio_initiate_rst_req_rdy     : out std_logic;                                         -- initiate_rst_req_rdy
			pio_pll_locked               : in  std_logic                      := 'X';             -- export
			pio_address_o                : out std_logic_vector(63 downto 0);                     -- address
			pio_read_o                   : out std_logic;                                         -- read
			pio_readdata_i               : in  std_logic_vector(511 downto 0) := (others => 'X'); -- readdata
			pio_readdatavalid_i          : in  std_logic                      := 'X';             -- readdatavalid
			pio_write_o                  : out std_logic;                                         -- write
			pio_writedata_o              : out std_logic_vector(511 downto 0);                    -- writedata
			pio_waitrequest_i            : in  std_logic                      := 'X';             -- waitrequest
			pio_byteenable_o             : out std_logic_vector(63 downto 0);                     -- byteenable
			pio_response_i               : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			pio_burstcount_o             : out std_logic_vector(3 downto 0);                      -- burstcount
			pio_rx_tvalid_i              : in  std_logic                      := 'X';             -- tvalid
			pio_rx_tready_o              : out std_logic;                                         -- tready
			pio_rx_tdata_i               : in  std_logic_vector(255 downto 0) := (others => 'X'); -- tdata
			pio_rx_tkeep_i               : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- tkeep
			pio_rx_tlast_i               : in  std_logic                      := 'X';             -- tlast
			pio_tx_tvalid_o              : out std_logic;                                         -- tvalid
			pio_tx_tready_i              : in  std_logic                      := 'X';             -- tready
			pio_tx_tdata_o               : out std_logic_vector(255 downto 0);                    -- tdata
			pio_tx_tkeep_o               : out std_logic_vector(31 downto 0);                     -- tkeep
			pio_tx_tlast_o               : out std_logic;                                         -- tlast
			pio_txcrdt_tvalid            : in  std_logic                      := 'X';             -- tvalid
			pio_txcrdt_tdata             : in  std_logic_vector(18 downto 0)  := (others => 'X'); -- tdata
			pio_ctrlshadow_tvalid_i      : in  std_logic                      := 'X';             -- tvalid
			pio_ctrlshadow_tdata_i       : in  std_logic_vector(39 downto 0)  := (others => 'X'); -- tdata
			pio_cplto_tvalid_i           : in  std_logic                      := 'X';             -- tvalid
			pio_cplto_tdata_i            : in  std_logic_vector(29 downto 0)  := (others => 'X')  -- tdata
		);
	end component pcie_ed_pio0;

	u0 : component pcie_ed_pio0
		port map (
			Clk_i                        => CONNECTED_TO_Clk_i,                        --                   axi_st_clk.clk
			outclk_0                     => CONNECTED_TO_outclk_0,                     --                 axi_lite_clk.clk
			coreclkout_hip               => CONNECTED_TO_coreclkout_hip,               --                          clk.clk
			Rstn_i                       => CONNECTED_TO_Rstn_i,                       --                        reset.reset_n
			pio_clk                      => CONNECTED_TO_pio_clk,                      --               pio_master_clk.clk
			pio_rst_n                    => CONNECTED_TO_pio_rst_n,                    --             pio_master_reset.reset_n
			pio_axi_st_areset_n          => CONNECTED_TO_pio_axi_st_areset_n,          --          pio_axi_st_areset_n.reset_n
			pio_axi_lite_areset_n        => CONNECTED_TO_pio_axi_lite_areset_n,        --        pio_axi_lite_areset_n.reset_n
			pio_subsystem_cold_rst_n     => CONNECTED_TO_pio_subsystem_cold_rst_n,     --     pio_subsystem_cold_rst_n.reset_n
			pio_subsystem_warm_rst_n     => CONNECTED_TO_pio_subsystem_warm_rst_n,     --     pio_subsystem_warm_rst_n.reset_n
			ninit_done                   => CONNECTED_TO_ninit_done,                   --                   ninit_done.reset
			pio_subsystem_cold_rst_ack_n => CONNECTED_TO_pio_subsystem_cold_rst_ack_n, -- pio_subsystem_cold_rst_ack_n.subsystem_cold_rst_ack_n
			pio_subsystem_warm_rst_ack_n => CONNECTED_TO_pio_subsystem_warm_rst_ack_n, -- pio_subsystem_warm_rst_ack_n.subsystem_warm_rst_ack_n
			pio_initiate_warmrst_req     => CONNECTED_TO_pio_initiate_warmrst_req,     --     pio_initiate_warmrst_req.initiate_warmrst_req
			pio_subsystem_rst_rdy        => CONNECTED_TO_pio_subsystem_rst_rdy,        --        pio_subsystem_rst_rdy.subsystem_rst_rdy
			pio_subsystem_rst_req        => CONNECTED_TO_pio_subsystem_rst_req,        --        pio_subsystem_rst_req.subsystem_rst_req
			pio_initiate_rst_req_rdy     => CONNECTED_TO_pio_initiate_rst_req_rdy,     --     pio_initiate_rst_req_rdy.initiate_rst_req_rdy
			pio_pll_locked               => CONNECTED_TO_pio_pll_locked,               --               pio_pll_locked.export
			pio_address_o                => CONNECTED_TO_pio_address_o,                --                   pio_master.address
			pio_read_o                   => CONNECTED_TO_pio_read_o,                   --                             .read
			pio_readdata_i               => CONNECTED_TO_pio_readdata_i,               --                             .readdata
			pio_readdatavalid_i          => CONNECTED_TO_pio_readdatavalid_i,          --                             .readdatavalid
			pio_write_o                  => CONNECTED_TO_pio_write_o,                  --                             .write
			pio_writedata_o              => CONNECTED_TO_pio_writedata_o,              --                             .writedata
			pio_waitrequest_i            => CONNECTED_TO_pio_waitrequest_i,            --                             .waitrequest
			pio_byteenable_o             => CONNECTED_TO_pio_byteenable_o,             --                             .byteenable
			pio_response_i               => CONNECTED_TO_pio_response_i,               --                             .response
			pio_burstcount_o             => CONNECTED_TO_pio_burstcount_o,             --                             .burstcount
			pio_rx_tvalid_i              => CONNECTED_TO_pio_rx_tvalid_i,              --                       rx_pio.tvalid
			pio_rx_tready_o              => CONNECTED_TO_pio_rx_tready_o,              --                             .tready
			pio_rx_tdata_i               => CONNECTED_TO_pio_rx_tdata_i,               --                             .tdata
			pio_rx_tkeep_i               => CONNECTED_TO_pio_rx_tkeep_i,               --                             .tkeep
			pio_rx_tlast_i               => CONNECTED_TO_pio_rx_tlast_i,               --                             .tlast
			pio_tx_tvalid_o              => CONNECTED_TO_pio_tx_tvalid_o,              --                       tx_pio.tvalid
			pio_tx_tready_i              => CONNECTED_TO_pio_tx_tready_i,              --                             .tready
			pio_tx_tdata_o               => CONNECTED_TO_pio_tx_tdata_o,               --                             .tdata
			pio_tx_tkeep_o               => CONNECTED_TO_pio_tx_tkeep_o,               --                             .tkeep
			pio_tx_tlast_o               => CONNECTED_TO_pio_tx_tlast_o,               --                             .tlast
			pio_txcrdt_tvalid            => CONNECTED_TO_pio_txcrdt_tvalid,            --                  tx_crdt_pio.tvalid
			pio_txcrdt_tdata             => CONNECTED_TO_pio_txcrdt_tdata,             --                             .tdata
			pio_ctrlshadow_tvalid_i      => CONNECTED_TO_pio_ctrlshadow_tvalid_i,      --               ctrlshadow_pio.tvalid
			pio_ctrlshadow_tdata_i       => CONNECTED_TO_pio_ctrlshadow_tdata_i,       --                             .tdata
			pio_cplto_tvalid_i           => CONNECTED_TO_pio_cplto_tvalid_i,           --                    cplto_pio.tvalid
			pio_cplto_tdata_i            => CONNECTED_TO_pio_cplto_tdata_i             --                             .tdata
		);

