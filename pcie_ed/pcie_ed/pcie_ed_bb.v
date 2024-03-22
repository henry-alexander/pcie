module pcie_ed (
		input  wire  pin_perst_n_reset_n,     //     pin_perst_n.reset_n
		input  wire  i_gpio_perst0_n_reset_n, // i_gpio_perst0_n.reset_n
		input  wire  hip_serial_rx_n_in0,     //      hip_serial.rx_n_in0
		input  wire  hip_serial_rx_n_in1,     //                .rx_n_in1
		input  wire  hip_serial_rx_n_in2,     //                .rx_n_in2
		input  wire  hip_serial_rx_n_in3,     //                .rx_n_in3
		input  wire  hip_serial_rx_p_in0,     //                .rx_p_in0
		input  wire  hip_serial_rx_p_in1,     //                .rx_p_in1
		input  wire  hip_serial_rx_p_in2,     //                .rx_p_in2
		input  wire  hip_serial_rx_p_in3,     //                .rx_p_in3
		output wire  hip_serial_tx_n_out0,    //                .tx_n_out0
		output wire  hip_serial_tx_n_out1,    //                .tx_n_out1
		output wire  hip_serial_tx_n_out2,    //                .tx_n_out2
		output wire  hip_serial_tx_n_out3,    //                .tx_n_out3
		output wire  hip_serial_tx_p_out0,    //                .tx_p_out0
		output wire  hip_serial_tx_p_out1,    //                .tx_p_out1
		output wire  hip_serial_tx_p_out2,    //                .tx_p_out2
		output wire  hip_serial_tx_p_out3,    //                .tx_p_out3
		input  wire  refclk0_clk,             //         refclk0.clk
		input  wire  refclk_clk,              //          refclk.clk
		input  wire  refclk_xcvr_clk          //     refclk_xcvr.clk
	);
endmodule

