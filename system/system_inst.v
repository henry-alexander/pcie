	system u0 (
		.dut_refclk0_clk                                          (_connected_to_dut_refclk0_clk_),                                          //   input,  width = 1,                     dut_refclk0.clk
		.dut_hip_serial_rx_n_in0                                  (_connected_to_dut_hip_serial_rx_n_in0_),                                  //   input,  width = 1,                  dut_hip_serial.rx_n_in0
		.dut_hip_serial_rx_p_in0                                  (_connected_to_dut_hip_serial_rx_p_in0_),                                  //   input,  width = 1,                                .rx_p_in0
		.dut_hip_serial_tx_n_out0                                 (_connected_to_dut_hip_serial_tx_n_out0_),                                 //  output,  width = 1,                                .tx_n_out0
		.dut_hip_serial_tx_p_out0                                 (_connected_to_dut_hip_serial_tx_p_out0_),                                 //  output,  width = 1,                                .tx_p_out0
		.dut_hip_serial_rx_n_in1                                  (_connected_to_dut_hip_serial_rx_n_in1_),                                  //   input,  width = 1,                                .rx_n_in1
		.dut_hip_serial_rx_p_in1                                  (_connected_to_dut_hip_serial_rx_p_in1_),                                  //   input,  width = 1,                                .rx_p_in1
		.dut_hip_serial_tx_n_out1                                 (_connected_to_dut_hip_serial_tx_n_out1_),                                 //  output,  width = 1,                                .tx_n_out1
		.dut_hip_serial_tx_p_out1                                 (_connected_to_dut_hip_serial_tx_p_out1_),                                 //  output,  width = 1,                                .tx_p_out1
		.dut_hip_serial_rx_n_in2                                  (_connected_to_dut_hip_serial_rx_n_in2_),                                  //   input,  width = 1,                                .rx_n_in2
		.dut_hip_serial_rx_p_in2                                  (_connected_to_dut_hip_serial_rx_p_in2_),                                  //   input,  width = 1,                                .rx_p_in2
		.dut_hip_serial_tx_n_out2                                 (_connected_to_dut_hip_serial_tx_n_out2_),                                 //  output,  width = 1,                                .tx_n_out2
		.dut_hip_serial_tx_p_out2                                 (_connected_to_dut_hip_serial_tx_p_out2_),                                 //  output,  width = 1,                                .tx_p_out2
		.dut_hip_serial_rx_n_in3                                  (_connected_to_dut_hip_serial_rx_n_in3_),                                  //   input,  width = 1,                                .rx_n_in3
		.dut_hip_serial_rx_p_in3                                  (_connected_to_dut_hip_serial_rx_p_in3_),                                  //   input,  width = 1,                                .rx_p_in3
		.dut_hip_serial_tx_n_out3                                 (_connected_to_dut_hip_serial_tx_n_out3_),                                 //  output,  width = 1,                                .tx_n_out3
		.dut_hip_serial_tx_p_out3                                 (_connected_to_dut_hip_serial_tx_p_out3_),                                 //  output,  width = 1,                                .tx_p_out3
		.dut_pin_perst_n_reset_n                                  (_connected_to_dut_pin_perst_n_reset_n_),                                  //   input,  width = 1,                 dut_pin_perst_n.reset_n
		.dut_i_gpio_perst0_n_reset_n                              (_connected_to_dut_i_gpio_perst0_n_reset_n_),                              //   input,  width = 1,             dut_i_gpio_perst0_n.reset_n
		.dut_p0_ss_app_serr_ss_app_serr                           (_connected_to_dut_p0_ss_app_serr_ss_app_serr_),                           //  output,  width = 1,              dut_p0_ss_app_serr.ss_app_serr
		.dut_p0_ss_app_dlup_ss_app_dlup                           (_connected_to_dut_p0_ss_app_dlup_ss_app_dlup_),                           //  output,  width = 1,              dut_p0_ss_app_dlup.ss_app_dlup
		.dut_p0_ss_app_linkup_ss_app_linkup                       (_connected_to_dut_p0_ss_app_linkup_ss_app_linkup_),                       //  output,  width = 1,            dut_p0_ss_app_linkup.ss_app_linkup
		.dut_p0_ss_app_surprise_down_err_ss_app_surprise_down_err (_connected_to_dut_p0_ss_app_surprise_down_err_ss_app_surprise_down_err_), //  output,  width = 1, dut_p0_ss_app_surprise_down_err.ss_app_surprise_down_err
		.iopll0_refclk_clk                                        (_connected_to_iopll0_refclk_clk_),                                        //   input,  width = 1,                   iopll0_refclk.clk
		.refclk_xcvr_clk                                          (_connected_to_refclk_xcvr_clk_)                                           //   input,  width = 1,                     refclk_xcvr.clk
	);

