module system (
		input  wire  dut_refclk0_clk,                                          //                     dut_refclk0.clk
		input  wire  dut_hip_serial_rx_n_in0,                                  //                  dut_hip_serial.rx_n_in0
		input  wire  dut_hip_serial_rx_p_in0,                                  //                                .rx_p_in0
		output wire  dut_hip_serial_tx_n_out0,                                 //                                .tx_n_out0
		output wire  dut_hip_serial_tx_p_out0,                                 //                                .tx_p_out0
		input  wire  dut_hip_serial_rx_n_in1,                                  //                                .rx_n_in1
		input  wire  dut_hip_serial_rx_p_in1,                                  //                                .rx_p_in1
		output wire  dut_hip_serial_tx_n_out1,                                 //                                .tx_n_out1
		output wire  dut_hip_serial_tx_p_out1,                                 //                                .tx_p_out1
		input  wire  dut_hip_serial_rx_n_in2,                                  //                                .rx_n_in2
		input  wire  dut_hip_serial_rx_p_in2,                                  //                                .rx_p_in2
		output wire  dut_hip_serial_tx_n_out2,                                 //                                .tx_n_out2
		output wire  dut_hip_serial_tx_p_out2,                                 //                                .tx_p_out2
		input  wire  dut_hip_serial_rx_n_in3,                                  //                                .rx_n_in3
		input  wire  dut_hip_serial_rx_p_in3,                                  //                                .rx_p_in3
		output wire  dut_hip_serial_tx_n_out3,                                 //                                .tx_n_out3
		output wire  dut_hip_serial_tx_p_out3,                                 //                                .tx_p_out3
		input  wire  dut_pin_perst_n_reset_n,                                  //                 dut_pin_perst_n.reset_n
		input  wire  dut_i_gpio_perst0_n_reset_n,                              //             dut_i_gpio_perst0_n.reset_n
		output wire  dut_p0_ss_app_serr_ss_app_serr,                           //              dut_p0_ss_app_serr.ss_app_serr
		output wire  dut_p0_ss_app_dlup_ss_app_dlup,                           //              dut_p0_ss_app_dlup.ss_app_dlup
		output wire  dut_p0_ss_app_linkup_ss_app_linkup,                       //            dut_p0_ss_app_linkup.ss_app_linkup
		output wire  dut_p0_ss_app_surprise_down_err_ss_app_surprise_down_err, // dut_p0_ss_app_surprise_down_err.ss_app_surprise_down_err
		input  wire  iopll0_refclk_clk,                                        //                   iopll0_refclk.clk
		input  wire  refclk_xcvr_clk                                           //                     refclk_xcvr.clk
	);
endmodule

