	component pcie_ed is
		port (
			pin_perst_n_reset_n     : in  std_logic := 'X'; -- reset_n
			i_gpio_perst0_n_reset_n : in  std_logic := 'X'; -- reset_n
			hip_serial_rx_n_in0     : in  std_logic := 'X'; -- rx_n_in0
			hip_serial_rx_n_in1     : in  std_logic := 'X'; -- rx_n_in1
			hip_serial_rx_n_in2     : in  std_logic := 'X'; -- rx_n_in2
			hip_serial_rx_n_in3     : in  std_logic := 'X'; -- rx_n_in3
			hip_serial_rx_p_in0     : in  std_logic := 'X'; -- rx_p_in0
			hip_serial_rx_p_in1     : in  std_logic := 'X'; -- rx_p_in1
			hip_serial_rx_p_in2     : in  std_logic := 'X'; -- rx_p_in2
			hip_serial_rx_p_in3     : in  std_logic := 'X'; -- rx_p_in3
			hip_serial_tx_n_out0    : out std_logic;        -- tx_n_out0
			hip_serial_tx_n_out1    : out std_logic;        -- tx_n_out1
			hip_serial_tx_n_out2    : out std_logic;        -- tx_n_out2
			hip_serial_tx_n_out3    : out std_logic;        -- tx_n_out3
			hip_serial_tx_p_out0    : out std_logic;        -- tx_p_out0
			hip_serial_tx_p_out1    : out std_logic;        -- tx_p_out1
			hip_serial_tx_p_out2    : out std_logic;        -- tx_p_out2
			hip_serial_tx_p_out3    : out std_logic;        -- tx_p_out3
			refclk0_clk             : in  std_logic := 'X'; -- clk
			refclk_clk              : in  std_logic := 'X'; -- clk
			refclk_xcvr_clk         : in  std_logic := 'X'  -- clk
		);
	end component pcie_ed;

	u0 : component pcie_ed
		port map (
			pin_perst_n_reset_n     => CONNECTED_TO_pin_perst_n_reset_n,     --     pin_perst_n.reset_n
			i_gpio_perst0_n_reset_n => CONNECTED_TO_i_gpio_perst0_n_reset_n, -- i_gpio_perst0_n.reset_n
			hip_serial_rx_n_in0     => CONNECTED_TO_hip_serial_rx_n_in0,     --      hip_serial.rx_n_in0
			hip_serial_rx_n_in1     => CONNECTED_TO_hip_serial_rx_n_in1,     --                .rx_n_in1
			hip_serial_rx_n_in2     => CONNECTED_TO_hip_serial_rx_n_in2,     --                .rx_n_in2
			hip_serial_rx_n_in3     => CONNECTED_TO_hip_serial_rx_n_in3,     --                .rx_n_in3
			hip_serial_rx_p_in0     => CONNECTED_TO_hip_serial_rx_p_in0,     --                .rx_p_in0
			hip_serial_rx_p_in1     => CONNECTED_TO_hip_serial_rx_p_in1,     --                .rx_p_in1
			hip_serial_rx_p_in2     => CONNECTED_TO_hip_serial_rx_p_in2,     --                .rx_p_in2
			hip_serial_rx_p_in3     => CONNECTED_TO_hip_serial_rx_p_in3,     --                .rx_p_in3
			hip_serial_tx_n_out0    => CONNECTED_TO_hip_serial_tx_n_out0,    --                .tx_n_out0
			hip_serial_tx_n_out1    => CONNECTED_TO_hip_serial_tx_n_out1,    --                .tx_n_out1
			hip_serial_tx_n_out2    => CONNECTED_TO_hip_serial_tx_n_out2,    --                .tx_n_out2
			hip_serial_tx_n_out3    => CONNECTED_TO_hip_serial_tx_n_out3,    --                .tx_n_out3
			hip_serial_tx_p_out0    => CONNECTED_TO_hip_serial_tx_p_out0,    --                .tx_p_out0
			hip_serial_tx_p_out1    => CONNECTED_TO_hip_serial_tx_p_out1,    --                .tx_p_out1
			hip_serial_tx_p_out2    => CONNECTED_TO_hip_serial_tx_p_out2,    --                .tx_p_out2
			hip_serial_tx_p_out3    => CONNECTED_TO_hip_serial_tx_p_out3,    --                .tx_p_out3
			refclk0_clk             => CONNECTED_TO_refclk0_clk,             --         refclk0.clk
			refclk_clk              => CONNECTED_TO_refclk_clk,              --          refclk.clk
			refclk_xcvr_clk         => CONNECTED_TO_refclk_xcvr_clk          --     refclk_xcvr.clk
		);

