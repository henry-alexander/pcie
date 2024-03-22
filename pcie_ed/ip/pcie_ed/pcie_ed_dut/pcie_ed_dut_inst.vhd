	component pcie_ed_dut is
		port (
			refclk0                        : in  std_logic                      := 'X';             -- clk
			i_syspll_c0_clk                : in  std_logic                      := 'X';             -- clk
			i_ss_vccl_syspll_locked        : in  std_logic                      := 'X';             -- o_pll_lock
			i_flux_clk                     : in  std_logic                      := 'X';             -- clk
			rx_n_in0                       : in  std_logic                      := 'X';             -- rx_n_in0
			rx_p_in0                       : in  std_logic                      := 'X';             -- rx_p_in0
			tx_n_out0                      : out std_logic;                                         -- tx_n_out0
			tx_p_out0                      : out std_logic;                                         -- tx_p_out0
			rx_n_in1                       : in  std_logic                      := 'X';             -- rx_n_in1
			rx_p_in1                       : in  std_logic                      := 'X';             -- rx_p_in1
			tx_n_out1                      : out std_logic;                                         -- tx_n_out1
			tx_p_out1                      : out std_logic;                                         -- tx_p_out1
			rx_n_in2                       : in  std_logic                      := 'X';             -- rx_n_in2
			rx_p_in2                       : in  std_logic                      := 'X';             -- rx_p_in2
			tx_n_out2                      : out std_logic;                                         -- tx_n_out2
			tx_p_out2                      : out std_logic;                                         -- tx_p_out2
			rx_n_in3                       : in  std_logic                      := 'X';             -- rx_n_in3
			rx_p_in3                       : in  std_logic                      := 'X';             -- rx_p_in3
			tx_n_out3                      : out std_logic;                                         -- tx_n_out3
			tx_p_out3                      : out std_logic;                                         -- tx_p_out3
			pin_perst_n                    : in  std_logic                      := 'X';             -- reset_n
			i_gpio_perst0_n                : in  std_logic                      := 'X';             -- reset_n
			coreclkout_hip_toapp           : out std_logic;                                         -- clk
			p0_pin_perst_n                 : out std_logic;                                         -- reset_n
			p0_reset_status_n              : out std_logic;                                         -- reset_n
			ninit_done                     : in  std_logic                      := 'X';             -- reset
			p0_axi_st_clk                  : in  std_logic                      := 'X';             -- clk
			p0_axi_lite_clk                : in  std_logic                      := 'X';             -- clk
			p0_axi_st_areset_n             : in  std_logic                      := 'X';             -- reset_n
			p0_axi_lite_areset_n           : in  std_logic                      := 'X';             -- reset_n
			p0_subsystem_cold_rst_n        : in  std_logic                      := 'X';             -- reset_n
			p0_subsystem_warm_rst_n        : in  std_logic                      := 'X';             -- reset_n
			p0_subsystem_cold_rst_ack_n    : out std_logic;                                         -- subsystem_cold_rst_ack_n
			p0_subsystem_warm_rst_ack_n    : out std_logic;                                         -- subsystem_warm_rst_ack_n
			p0_subsystem_rst_req           : in  std_logic                      := 'X';             -- subsystem_rst_req
			p0_subsystem_rst_rdy           : out std_logic;                                         -- subsystem_rst_rdy
			p0_initiate_warmrst_req        : out std_logic;                                         -- initiate_warmrst_req
			p0_initiate_rst_req_rdy        : in  std_logic                      := 'X';             -- initiate_rst_req_rdy
			p0_ss_app_st_rx_tvalid         : out std_logic;                                         -- tvalid
			p0_app_ss_st_rx_tready         : in  std_logic                      := 'X';             -- tready
			p0_ss_app_st_rx_tdata          : out std_logic_vector(255 downto 0);                    -- tdata
			p0_ss_app_st_rx_tkeep          : out std_logic_vector(31 downto 0);                     -- tkeep
			p0_ss_app_st_rx_tlast          : out std_logic;                                         -- tlast
			p0_app_ss_st_tx_tvalid         : in  std_logic                      := 'X';             -- tvalid
			p0_ss_app_st_tx_tready         : out std_logic;                                         -- tready
			p0_app_ss_st_tx_tdata          : in  std_logic_vector(255 downto 0) := (others => 'X'); -- tdata
			p0_app_ss_st_tx_tkeep          : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- tkeep
			p0_app_ss_st_tx_tlast          : in  std_logic                      := 'X';             -- tlast
			p0_ss_app_st_ctrlshadow_tvalid : out std_logic;                                         -- tvalid
			p0_ss_app_st_ctrlshadow_tdata  : out std_logic_vector(39 downto 0);                     -- tdata
			p0_ss_app_st_txcrdt_tvalid     : out std_logic;                                         -- tvalid
			p0_ss_app_st_txcrdt_tdata      : out std_logic_vector(18 downto 0);                     -- tdata
			p0_ss_app_st_cplto_tvalid      : out std_logic;                                         -- tvalid
			p0_ss_app_st_cplto_tdata       : out std_logic_vector(29 downto 0);                     -- tdata
			p0_app_ss_lite_csr_awvalid     : in  std_logic                      := 'X';             -- p0_app_ss_lite_csr_awvalid
			p0_ss_app_lite_csr_awready     : out std_logic;                                         -- p0_ss_app_lite_csr_awready
			p0_app_ss_lite_csr_awaddr      : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- p0_app_ss_lite_csr_awaddr
			p0_app_ss_lite_csr_wvalid      : in  std_logic                      := 'X';             -- p0_app_ss_lite_csr_wvalid
			p0_ss_app_lite_csr_wready      : out std_logic;                                         -- p0_ss_app_lite_csr_wready
			p0_app_ss_lite_csr_wdata       : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- p0_app_ss_lite_csr_wdata
			p0_app_ss_lite_csr_wstrb       : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- p0_app_ss_lite_csr_wstrb
			p0_ss_app_lite_csr_bvalid      : out std_logic;                                         -- p0_ss_app_lite_csr_bvalid
			p0_app_ss_lite_csr_bready      : in  std_logic                      := 'X';             -- p0_app_ss_lite_csr_bready
			p0_ss_app_lite_csr_bresp       : out std_logic_vector(1 downto 0);                      -- p0_ss_app_lite_csr_bresp
			p0_app_ss_lite_csr_arvalid     : in  std_logic                      := 'X';             -- p0_app_ss_lite_csr_arvalid
			p0_ss_app_lite_csr_arready     : out std_logic;                                         -- p0_ss_app_lite_csr_arready
			p0_app_ss_lite_csr_araddr      : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- p0_app_ss_lite_csr_araddr
			p0_ss_app_lite_csr_rvalid      : out std_logic;                                         -- p0_ss_app_lite_csr_rvalid
			p0_app_ss_lite_csr_rready      : in  std_logic                      := 'X';             -- p0_app_ss_lite_csr_rready
			p0_ss_app_lite_csr_rdata       : out std_logic_vector(31 downto 0);                     -- p0_ss_app_lite_csr_rdata
			p0_ss_app_lite_csr_rresp       : out std_logic_vector(1 downto 0);                      -- p0_ss_app_lite_csr_rresp
			p0_ss_app_serr                 : out std_logic;                                         -- ss_app_serr
			p0_ss_app_dlup                 : out std_logic;                                         -- ss_app_dlup
			p0_ss_app_linkup               : out std_logic;                                         -- ss_app_linkup
			p0_ss_app_surprise_down_err    : out std_logic;                                         -- ss_app_surprise_down_err
			p0_ss_app_ltssmstate           : out std_logic_vector(5 downto 0);                      -- ss_app_ltssmstate
			p0_app_ss_st_rx_tuser_halt     : in  std_logic_vector(2 downto 0)   := (others => 'X')  -- app_ss_st_rx_tuser_halt
		);
	end component pcie_ed_dut;

	u0 : component pcie_ed_dut
		port map (
			refclk0                        => CONNECTED_TO_refclk0,                        --                     refclk0.clk
			i_syspll_c0_clk                => CONNECTED_TO_i_syspll_c0_clk,                --             i_syspll_c0_clk.clk
			i_ss_vccl_syspll_locked        => CONNECTED_TO_i_ss_vccl_syspll_locked,        --     i_ss_vccl_syspll_locked.o_pll_lock
			i_flux_clk                     => CONNECTED_TO_i_flux_clk,                     --                  i_flux_clk.clk
			rx_n_in0                       => CONNECTED_TO_rx_n_in0,                       --                  hip_serial.rx_n_in0
			rx_p_in0                       => CONNECTED_TO_rx_p_in0,                       --                            .rx_p_in0
			tx_n_out0                      => CONNECTED_TO_tx_n_out0,                      --                            .tx_n_out0
			tx_p_out0                      => CONNECTED_TO_tx_p_out0,                      --                            .tx_p_out0
			rx_n_in1                       => CONNECTED_TO_rx_n_in1,                       --                            .rx_n_in1
			rx_p_in1                       => CONNECTED_TO_rx_p_in1,                       --                            .rx_p_in1
			tx_n_out1                      => CONNECTED_TO_tx_n_out1,                      --                            .tx_n_out1
			tx_p_out1                      => CONNECTED_TO_tx_p_out1,                      --                            .tx_p_out1
			rx_n_in2                       => CONNECTED_TO_rx_n_in2,                       --                            .rx_n_in2
			rx_p_in2                       => CONNECTED_TO_rx_p_in2,                       --                            .rx_p_in2
			tx_n_out2                      => CONNECTED_TO_tx_n_out2,                      --                            .tx_n_out2
			tx_p_out2                      => CONNECTED_TO_tx_p_out2,                      --                            .tx_p_out2
			rx_n_in3                       => CONNECTED_TO_rx_n_in3,                       --                            .rx_n_in3
			rx_p_in3                       => CONNECTED_TO_rx_p_in3,                       --                            .rx_p_in3
			tx_n_out3                      => CONNECTED_TO_tx_n_out3,                      --                            .tx_n_out3
			tx_p_out3                      => CONNECTED_TO_tx_p_out3,                      --                            .tx_p_out3
			pin_perst_n                    => CONNECTED_TO_pin_perst_n,                    --                 pin_perst_n.reset_n
			i_gpio_perst0_n                => CONNECTED_TO_i_gpio_perst0_n,                --             i_gpio_perst0_n.reset_n
			coreclkout_hip_toapp           => CONNECTED_TO_coreclkout_hip_toapp,           --        coreclkout_hip_toapp.clk
			p0_pin_perst_n                 => CONNECTED_TO_p0_pin_perst_n,                 --              p0_pin_perst_n.reset_n
			p0_reset_status_n              => CONNECTED_TO_p0_reset_status_n,              --           p0_reset_status_n.reset_n
			ninit_done                     => CONNECTED_TO_ninit_done,                     --                  ninit_done.reset
			p0_axi_st_clk                  => CONNECTED_TO_p0_axi_st_clk,                  --               p0_axi_st_clk.clk
			p0_axi_lite_clk                => CONNECTED_TO_p0_axi_lite_clk,                --             p0_axi_lite_clk.clk
			p0_axi_st_areset_n             => CONNECTED_TO_p0_axi_st_areset_n,             --          p0_axi_st_areset_n.reset_n
			p0_axi_lite_areset_n           => CONNECTED_TO_p0_axi_lite_areset_n,           --        p0_axi_lite_areset_n.reset_n
			p0_subsystem_cold_rst_n        => CONNECTED_TO_p0_subsystem_cold_rst_n,        --     p0_subsystem_cold_rst_n.reset_n
			p0_subsystem_warm_rst_n        => CONNECTED_TO_p0_subsystem_warm_rst_n,        --     p0_subsystem_warm_rst_n.reset_n
			p0_subsystem_cold_rst_ack_n    => CONNECTED_TO_p0_subsystem_cold_rst_ack_n,    -- p0_subsystem_cold_rst_ack_n.subsystem_cold_rst_ack_n
			p0_subsystem_warm_rst_ack_n    => CONNECTED_TO_p0_subsystem_warm_rst_ack_n,    -- p0_subsystem_warm_rst_ack_n.subsystem_warm_rst_ack_n
			p0_subsystem_rst_req           => CONNECTED_TO_p0_subsystem_rst_req,           --        p0_subsystem_rst_req.subsystem_rst_req
			p0_subsystem_rst_rdy           => CONNECTED_TO_p0_subsystem_rst_rdy,           --        p0_subsystem_rst_rdy.subsystem_rst_rdy
			p0_initiate_warmrst_req        => CONNECTED_TO_p0_initiate_warmrst_req,        --     p0_initiate_warmrst_req.initiate_warmrst_req
			p0_initiate_rst_req_rdy        => CONNECTED_TO_p0_initiate_rst_req_rdy,        --     p0_initiate_rst_req_rdy.initiate_rst_req_rdy
			p0_ss_app_st_rx_tvalid         => CONNECTED_TO_p0_ss_app_st_rx_tvalid,         --                    p0_st_rx.tvalid
			p0_app_ss_st_rx_tready         => CONNECTED_TO_p0_app_ss_st_rx_tready,         --                            .tready
			p0_ss_app_st_rx_tdata          => CONNECTED_TO_p0_ss_app_st_rx_tdata,          --                            .tdata
			p0_ss_app_st_rx_tkeep          => CONNECTED_TO_p0_ss_app_st_rx_tkeep,          --                            .tkeep
			p0_ss_app_st_rx_tlast          => CONNECTED_TO_p0_ss_app_st_rx_tlast,          --                            .tlast
			p0_app_ss_st_tx_tvalid         => CONNECTED_TO_p0_app_ss_st_tx_tvalid,         --                    p0_st_tx.tvalid
			p0_ss_app_st_tx_tready         => CONNECTED_TO_p0_ss_app_st_tx_tready,         --                            .tready
			p0_app_ss_st_tx_tdata          => CONNECTED_TO_p0_app_ss_st_tx_tdata,          --                            .tdata
			p0_app_ss_st_tx_tkeep          => CONNECTED_TO_p0_app_ss_st_tx_tkeep,          --                            .tkeep
			p0_app_ss_st_tx_tlast          => CONNECTED_TO_p0_app_ss_st_tx_tlast,          --                            .tlast
			p0_ss_app_st_ctrlshadow_tvalid => CONNECTED_TO_p0_ss_app_st_ctrlshadow_tvalid, --            p0_st_ctrlshadow.tvalid
			p0_ss_app_st_ctrlshadow_tdata  => CONNECTED_TO_p0_ss_app_st_ctrlshadow_tdata,  --                            .tdata
			p0_ss_app_st_txcrdt_tvalid     => CONNECTED_TO_p0_ss_app_st_txcrdt_tvalid,     --                p0_st_txcrdt.tvalid
			p0_ss_app_st_txcrdt_tdata      => CONNECTED_TO_p0_ss_app_st_txcrdt_tdata,      --                            .tdata
			p0_ss_app_st_cplto_tvalid      => CONNECTED_TO_p0_ss_app_st_cplto_tvalid,      --                 p0_st_cplto.tvalid
			p0_ss_app_st_cplto_tdata       => CONNECTED_TO_p0_ss_app_st_cplto_tdata,       --                            .tdata
			p0_app_ss_lite_csr_awvalid     => CONNECTED_TO_p0_app_ss_lite_csr_awvalid,     --                 p0_lite_csr.p0_app_ss_lite_csr_awvalid
			p0_ss_app_lite_csr_awready     => CONNECTED_TO_p0_ss_app_lite_csr_awready,     --                            .p0_ss_app_lite_csr_awready
			p0_app_ss_lite_csr_awaddr      => CONNECTED_TO_p0_app_ss_lite_csr_awaddr,      --                            .p0_app_ss_lite_csr_awaddr
			p0_app_ss_lite_csr_wvalid      => CONNECTED_TO_p0_app_ss_lite_csr_wvalid,      --                            .p0_app_ss_lite_csr_wvalid
			p0_ss_app_lite_csr_wready      => CONNECTED_TO_p0_ss_app_lite_csr_wready,      --                            .p0_ss_app_lite_csr_wready
			p0_app_ss_lite_csr_wdata       => CONNECTED_TO_p0_app_ss_lite_csr_wdata,       --                            .p0_app_ss_lite_csr_wdata
			p0_app_ss_lite_csr_wstrb       => CONNECTED_TO_p0_app_ss_lite_csr_wstrb,       --                            .p0_app_ss_lite_csr_wstrb
			p0_ss_app_lite_csr_bvalid      => CONNECTED_TO_p0_ss_app_lite_csr_bvalid,      --                            .p0_ss_app_lite_csr_bvalid
			p0_app_ss_lite_csr_bready      => CONNECTED_TO_p0_app_ss_lite_csr_bready,      --                            .p0_app_ss_lite_csr_bready
			p0_ss_app_lite_csr_bresp       => CONNECTED_TO_p0_ss_app_lite_csr_bresp,       --                            .p0_ss_app_lite_csr_bresp
			p0_app_ss_lite_csr_arvalid     => CONNECTED_TO_p0_app_ss_lite_csr_arvalid,     --                            .p0_app_ss_lite_csr_arvalid
			p0_ss_app_lite_csr_arready     => CONNECTED_TO_p0_ss_app_lite_csr_arready,     --                            .p0_ss_app_lite_csr_arready
			p0_app_ss_lite_csr_araddr      => CONNECTED_TO_p0_app_ss_lite_csr_araddr,      --                            .p0_app_ss_lite_csr_araddr
			p0_ss_app_lite_csr_rvalid      => CONNECTED_TO_p0_ss_app_lite_csr_rvalid,      --                            .p0_ss_app_lite_csr_rvalid
			p0_app_ss_lite_csr_rready      => CONNECTED_TO_p0_app_ss_lite_csr_rready,      --                            .p0_app_ss_lite_csr_rready
			p0_ss_app_lite_csr_rdata       => CONNECTED_TO_p0_ss_app_lite_csr_rdata,       --                            .p0_ss_app_lite_csr_rdata
			p0_ss_app_lite_csr_rresp       => CONNECTED_TO_p0_ss_app_lite_csr_rresp,       --                            .p0_ss_app_lite_csr_rresp
			p0_ss_app_serr                 => CONNECTED_TO_p0_ss_app_serr,                 --              p0_ss_app_serr.ss_app_serr
			p0_ss_app_dlup                 => CONNECTED_TO_p0_ss_app_dlup,                 --              p0_ss_app_dlup.ss_app_dlup
			p0_ss_app_linkup               => CONNECTED_TO_p0_ss_app_linkup,               --            p0_ss_app_linkup.ss_app_linkup
			p0_ss_app_surprise_down_err    => CONNECTED_TO_p0_ss_app_surprise_down_err,    -- p0_ss_app_surprise_down_err.ss_app_surprise_down_err
			p0_ss_app_ltssmstate           => CONNECTED_TO_p0_ss_app_ltssmstate,           --        p0_ss_app_ltssmstate.ss_app_ltssmstate
			p0_app_ss_st_rx_tuser_halt     => CONNECTED_TO_p0_app_ss_st_rx_tuser_halt      --  p0_app_ss_st_rx_tuser_halt.app_ss_st_rx_tuser_halt
		);

