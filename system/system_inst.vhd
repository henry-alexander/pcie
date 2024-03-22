	component system is
		port (
			dut_refclk0_clk                                          : in  std_logic := 'X'; -- clk
			dut_hip_serial_rx_n_in0                                  : in  std_logic := 'X'; -- rx_n_in0
			dut_hip_serial_rx_p_in0                                  : in  std_logic := 'X'; -- rx_p_in0
			dut_hip_serial_tx_n_out0                                 : out std_logic;        -- tx_n_out0
			dut_hip_serial_tx_p_out0                                 : out std_logic;        -- tx_p_out0
			dut_hip_serial_rx_n_in1                                  : in  std_logic := 'X'; -- rx_n_in1
			dut_hip_serial_rx_p_in1                                  : in  std_logic := 'X'; -- rx_p_in1
			dut_hip_serial_tx_n_out1                                 : out std_logic;        -- tx_n_out1
			dut_hip_serial_tx_p_out1                                 : out std_logic;        -- tx_p_out1
			dut_hip_serial_rx_n_in2                                  : in  std_logic := 'X'; -- rx_n_in2
			dut_hip_serial_rx_p_in2                                  : in  std_logic := 'X'; -- rx_p_in2
			dut_hip_serial_tx_n_out2                                 : out std_logic;        -- tx_n_out2
			dut_hip_serial_tx_p_out2                                 : out std_logic;        -- tx_p_out2
			dut_hip_serial_rx_n_in3                                  : in  std_logic := 'X'; -- rx_n_in3
			dut_hip_serial_rx_p_in3                                  : in  std_logic := 'X'; -- rx_p_in3
			dut_hip_serial_tx_n_out3                                 : out std_logic;        -- tx_n_out3
			dut_hip_serial_tx_p_out3                                 : out std_logic;        -- tx_p_out3
			dut_pin_perst_n_reset_n                                  : in  std_logic := 'X'; -- reset_n
			dut_i_gpio_perst0_n_reset_n                              : in  std_logic := 'X'; -- reset_n
			dut_p0_ss_app_serr_ss_app_serr                           : out std_logic;        -- ss_app_serr
			dut_p0_ss_app_dlup_ss_app_dlup                           : out std_logic;        -- ss_app_dlup
			dut_p0_ss_app_linkup_ss_app_linkup                       : out std_logic;        -- ss_app_linkup
			dut_p0_ss_app_surprise_down_err_ss_app_surprise_down_err : out std_logic;        -- ss_app_surprise_down_err
			iopll0_refclk_clk                                        : in  std_logic := 'X'; -- clk
			refclk_xcvr_clk                                          : in  std_logic := 'X'  -- clk
		);
	end component system;

	u0 : component system
		port map (
			dut_refclk0_clk                                          => CONNECTED_TO_dut_refclk0_clk,                                          --                     dut_refclk0.clk
			dut_hip_serial_rx_n_in0                                  => CONNECTED_TO_dut_hip_serial_rx_n_in0,                                  --                  dut_hip_serial.rx_n_in0
			dut_hip_serial_rx_p_in0                                  => CONNECTED_TO_dut_hip_serial_rx_p_in0,                                  --                                .rx_p_in0
			dut_hip_serial_tx_n_out0                                 => CONNECTED_TO_dut_hip_serial_tx_n_out0,                                 --                                .tx_n_out0
			dut_hip_serial_tx_p_out0                                 => CONNECTED_TO_dut_hip_serial_tx_p_out0,                                 --                                .tx_p_out0
			dut_hip_serial_rx_n_in1                                  => CONNECTED_TO_dut_hip_serial_rx_n_in1,                                  --                                .rx_n_in1
			dut_hip_serial_rx_p_in1                                  => CONNECTED_TO_dut_hip_serial_rx_p_in1,                                  --                                .rx_p_in1
			dut_hip_serial_tx_n_out1                                 => CONNECTED_TO_dut_hip_serial_tx_n_out1,                                 --                                .tx_n_out1
			dut_hip_serial_tx_p_out1                                 => CONNECTED_TO_dut_hip_serial_tx_p_out1,                                 --                                .tx_p_out1
			dut_hip_serial_rx_n_in2                                  => CONNECTED_TO_dut_hip_serial_rx_n_in2,                                  --                                .rx_n_in2
			dut_hip_serial_rx_p_in2                                  => CONNECTED_TO_dut_hip_serial_rx_p_in2,                                  --                                .rx_p_in2
			dut_hip_serial_tx_n_out2                                 => CONNECTED_TO_dut_hip_serial_tx_n_out2,                                 --                                .tx_n_out2
			dut_hip_serial_tx_p_out2                                 => CONNECTED_TO_dut_hip_serial_tx_p_out2,                                 --                                .tx_p_out2
			dut_hip_serial_rx_n_in3                                  => CONNECTED_TO_dut_hip_serial_rx_n_in3,                                  --                                .rx_n_in3
			dut_hip_serial_rx_p_in3                                  => CONNECTED_TO_dut_hip_serial_rx_p_in3,                                  --                                .rx_p_in3
			dut_hip_serial_tx_n_out3                                 => CONNECTED_TO_dut_hip_serial_tx_n_out3,                                 --                                .tx_n_out3
			dut_hip_serial_tx_p_out3                                 => CONNECTED_TO_dut_hip_serial_tx_p_out3,                                 --                                .tx_p_out3
			dut_pin_perst_n_reset_n                                  => CONNECTED_TO_dut_pin_perst_n_reset_n,                                  --                 dut_pin_perst_n.reset_n
			dut_i_gpio_perst0_n_reset_n                              => CONNECTED_TO_dut_i_gpio_perst0_n_reset_n,                              --             dut_i_gpio_perst0_n.reset_n
			dut_p0_ss_app_serr_ss_app_serr                           => CONNECTED_TO_dut_p0_ss_app_serr_ss_app_serr,                           --              dut_p0_ss_app_serr.ss_app_serr
			dut_p0_ss_app_dlup_ss_app_dlup                           => CONNECTED_TO_dut_p0_ss_app_dlup_ss_app_dlup,                           --              dut_p0_ss_app_dlup.ss_app_dlup
			dut_p0_ss_app_linkup_ss_app_linkup                       => CONNECTED_TO_dut_p0_ss_app_linkup_ss_app_linkup,                       --            dut_p0_ss_app_linkup.ss_app_linkup
			dut_p0_ss_app_surprise_down_err_ss_app_surprise_down_err => CONNECTED_TO_dut_p0_ss_app_surprise_down_err_ss_app_surprise_down_err, -- dut_p0_ss_app_surprise_down_err.ss_app_surprise_down_err
			iopll0_refclk_clk                                        => CONNECTED_TO_iopll0_refclk_clk,                                        --                   iopll0_refclk.clk
			refclk_xcvr_clk                                          => CONNECTED_TO_refclk_xcvr_clk                                           --                     refclk_xcvr.clk
		);

