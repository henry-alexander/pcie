	pcie_ed u0 (
		.pin_perst_n_reset_n     (_connected_to_pin_perst_n_reset_n_),     //   input,  width = 1,     pin_perst_n.reset_n
		.i_gpio_perst0_n_reset_n (_connected_to_i_gpio_perst0_n_reset_n_), //   input,  width = 1, i_gpio_perst0_n.reset_n
		.hip_serial_rx_n_in0     (_connected_to_hip_serial_rx_n_in0_),     //   input,  width = 1,      hip_serial.rx_n_in0
		.hip_serial_rx_n_in1     (_connected_to_hip_serial_rx_n_in1_),     //   input,  width = 1,                .rx_n_in1
		.hip_serial_rx_n_in2     (_connected_to_hip_serial_rx_n_in2_),     //   input,  width = 1,                .rx_n_in2
		.hip_serial_rx_n_in3     (_connected_to_hip_serial_rx_n_in3_),     //   input,  width = 1,                .rx_n_in3
		.hip_serial_rx_p_in0     (_connected_to_hip_serial_rx_p_in0_),     //   input,  width = 1,                .rx_p_in0
		.hip_serial_rx_p_in1     (_connected_to_hip_serial_rx_p_in1_),     //   input,  width = 1,                .rx_p_in1
		.hip_serial_rx_p_in2     (_connected_to_hip_serial_rx_p_in2_),     //   input,  width = 1,                .rx_p_in2
		.hip_serial_rx_p_in3     (_connected_to_hip_serial_rx_p_in3_),     //   input,  width = 1,                .rx_p_in3
		.hip_serial_tx_n_out0    (_connected_to_hip_serial_tx_n_out0_),    //  output,  width = 1,                .tx_n_out0
		.hip_serial_tx_n_out1    (_connected_to_hip_serial_tx_n_out1_),    //  output,  width = 1,                .tx_n_out1
		.hip_serial_tx_n_out2    (_connected_to_hip_serial_tx_n_out2_),    //  output,  width = 1,                .tx_n_out2
		.hip_serial_tx_n_out3    (_connected_to_hip_serial_tx_n_out3_),    //  output,  width = 1,                .tx_n_out3
		.hip_serial_tx_p_out0    (_connected_to_hip_serial_tx_p_out0_),    //  output,  width = 1,                .tx_p_out0
		.hip_serial_tx_p_out1    (_connected_to_hip_serial_tx_p_out1_),    //  output,  width = 1,                .tx_p_out1
		.hip_serial_tx_p_out2    (_connected_to_hip_serial_tx_p_out2_),    //  output,  width = 1,                .tx_p_out2
		.hip_serial_tx_p_out3    (_connected_to_hip_serial_tx_p_out3_),    //  output,  width = 1,                .tx_p_out3
		.refclk0_clk             (_connected_to_refclk0_clk_),             //   input,  width = 1,         refclk0.clk
		.refclk_clk              (_connected_to_refclk_clk_),              //   input,  width = 1,          refclk.clk
		.refclk_xcvr_clk         (_connected_to_refclk_xcvr_clk_)          //   input,  width = 1,     refclk_xcvr.clk
	);

