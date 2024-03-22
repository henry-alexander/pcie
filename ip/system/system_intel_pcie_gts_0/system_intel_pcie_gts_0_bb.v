module system_intel_pcie_gts_0 (
		input  wire         refclk0,                        //                     refclk0.clk,                       Check User Guide for details
		input  wire         i_syspll_c0_clk,                //             i_syspll_c0_clk.clk,                       Check User Guide for details
		input  wire         i_ss_vccl_syspll_locked,        //     i_ss_vccl_syspll_locked.o_pll_lock,                Check User Guide for details
		input  wire         i_flux_clk,                     //                  i_flux_clk.clk,                       Check User Guide for details
		input  wire         rx_n_in0,                       //                  hip_serial.rx_n_in0,                  Check User Guide for details
		input  wire         rx_p_in0,                       //                            .rx_p_in0,                  Check User Guide for details
		output wire         tx_n_out0,                      //                            .tx_n_out0,                 Check User Guide for details
		output wire         tx_p_out0,                      //                            .tx_p_out0,                 Check User Guide for details
		input  wire         rx_n_in1,                       //                            .rx_n_in1,                  Check User Guide for details
		input  wire         rx_p_in1,                       //                            .rx_p_in1,                  Check User Guide for details
		output wire         tx_n_out1,                      //                            .tx_n_out1,                 Check User Guide for details
		output wire         tx_p_out1,                      //                            .tx_p_out1,                 Check User Guide for details
		input  wire         rx_n_in2,                       //                            .rx_n_in2,                  Check User Guide for details
		input  wire         rx_p_in2,                       //                            .rx_p_in2,                  Check User Guide for details
		output wire         tx_n_out2,                      //                            .tx_n_out2,                 Check User Guide for details
		output wire         tx_p_out2,                      //                            .tx_p_out2,                 Check User Guide for details
		input  wire         rx_n_in3,                       //                            .rx_n_in3,                  Check User Guide for details
		input  wire         rx_p_in3,                       //                            .rx_p_in3,                  Check User Guide for details
		output wire         tx_n_out3,                      //                            .tx_n_out3,                 Check User Guide for details
		output wire         tx_p_out3,                      //                            .tx_p_out3,                 Check User Guide for details
		input  wire         pin_perst_n,                    //                 pin_perst_n.reset_n,                   Check User Guide for details
		input  wire         i_gpio_perst0_n,                //             i_gpio_perst0_n.reset_n,                   Check User Guide for details
		output wire         coreclkout_hip_toapp,           //        coreclkout_hip_toapp.clk,                       Check User Guide for details
		output wire         p0_pin_perst_n,                 //              p0_pin_perst_n.reset_n,                   Check User Guide for details
		output wire         p0_reset_status_n,              //           p0_reset_status_n.reset_n,                   Check User Guide for details
		input  wire         ninit_done,                     //                  ninit_done.reset,                     Its a Init_done signal should be connected to Reset release IP
		input  wire         p0_axi_st_clk,                  //               p0_axi_st_clk.clk,                       Check User Guide for details
		input  wire         p0_axi_lite_clk,                //             p0_axi_lite_clk.clk,                       Check User Guide for details
		input  wire         p0_axi_st_areset_n,             //          p0_axi_st_areset_n.reset_n,                   Check User Guide for details
		input  wire         p0_axi_lite_areset_n,           //        p0_axi_lite_areset_n.reset_n,                   Check User Guide for details
		input  wire         p0_subsystem_cold_rst_n,        //     p0_subsystem_cold_rst_n.reset_n,                   Check User Guide for details
		input  wire         p0_subsystem_warm_rst_n,        //     p0_subsystem_warm_rst_n.reset_n,                   Check User Guide for details
		output wire         p0_subsystem_cold_rst_ack_n,    // p0_subsystem_cold_rst_ack_n.subsystem_cold_rst_ack_n,  Check User Guide for details
		output wire         p0_subsystem_warm_rst_ack_n,    // p0_subsystem_warm_rst_ack_n.subsystem_warm_rst_ack_n,  Check User Guide for details
		input  wire         p0_subsystem_rst_req,           //        p0_subsystem_rst_req.subsystem_rst_req,         Check User Guide for details
		output wire         p0_subsystem_rst_rdy,           //        p0_subsystem_rst_rdy.subsystem_rst_rdy,         Check User Guide for details
		output wire         p0_initiate_warmrst_req,        //     p0_initiate_warmrst_req.initiate_warmrst_req,      Check User Guide for details
		input  wire         p0_initiate_rst_req_rdy,        //     p0_initiate_rst_req_rdy.initiate_rst_req_rdy,      Check User Guide for details
		output wire         p0_ss_app_st_rx_tvalid,         //                    p0_st_rx.tvalid,                    Check User Guide for details
		input  wire         p0_app_ss_st_rx_tready,         //                            .tready,                    Check User Guide for details
		output wire [255:0] p0_ss_app_st_rx_tdata,          //                            .tdata,                     Check User Guide for details
		output wire [31:0]  p0_ss_app_st_rx_tkeep,          //                            .tkeep,                     Check User Guide for details
		output wire         p0_ss_app_st_rx_tlast,          //                            .tlast,                     Check User Guide for details
		input  wire         p0_app_ss_st_tx_tvalid,         //                    p0_st_tx.tvalid,                    Check User Guide for details
		output wire         p0_ss_app_st_tx_tready,         //                            .tready,                    Check User Guide for details
		input  wire [255:0] p0_app_ss_st_tx_tdata,          //                            .tdata,                     Check User Guide for details
		input  wire [31:0]  p0_app_ss_st_tx_tkeep,          //                            .tkeep,                     Check User Guide for details
		input  wire         p0_app_ss_st_tx_tlast,          //                            .tlast,                     Check User Guide for details
		output wire         p0_ss_app_st_ctrlshadow_tvalid, //            p0_st_ctrlshadow.tvalid,                    Check User Guide for details
		output wire [39:0]  p0_ss_app_st_ctrlshadow_tdata,  //                            .tdata,                     Check User Guide for details
		output wire         p0_ss_app_st_txcrdt_tvalid,     //                p0_st_txcrdt.tvalid,                    Check User Guide for details
		output wire [18:0]  p0_ss_app_st_txcrdt_tdata,      //                            .tdata,                     Check User Guide for details
		output wire         p0_ss_app_st_cplto_tvalid,      //                 p0_st_cplto.tvalid,                    Check User Guide for details
		output wire [29:0]  p0_ss_app_st_cplto_tdata,       //                            .tdata,                     Check User Guide for details
		input  wire         p0_app_ss_lite_csr_awvalid,     //                 p0_lite_csr.p0_app_ss_lite_csr_awvalid
		output wire         p0_ss_app_lite_csr_awready,     //                            .p0_ss_app_lite_csr_awready
		input  wire [19:0]  p0_app_ss_lite_csr_awaddr,      //                            .p0_app_ss_lite_csr_awaddr
		input  wire         p0_app_ss_lite_csr_wvalid,      //                            .p0_app_ss_lite_csr_wvalid
		output wire         p0_ss_app_lite_csr_wready,      //                            .p0_ss_app_lite_csr_wready
		input  wire [31:0]  p0_app_ss_lite_csr_wdata,       //                            .p0_app_ss_lite_csr_wdata
		input  wire [3:0]   p0_app_ss_lite_csr_wstrb,       //                            .p0_app_ss_lite_csr_wstrb
		output wire         p0_ss_app_lite_csr_bvalid,      //                            .p0_ss_app_lite_csr_bvalid
		input  wire         p0_app_ss_lite_csr_bready,      //                            .p0_app_ss_lite_csr_bready
		output wire [1:0]   p0_ss_app_lite_csr_bresp,       //                            .p0_ss_app_lite_csr_bresp
		input  wire         p0_app_ss_lite_csr_arvalid,     //                            .p0_app_ss_lite_csr_arvalid
		output wire         p0_ss_app_lite_csr_arready,     //                            .p0_ss_app_lite_csr_arready
		input  wire [19:0]  p0_app_ss_lite_csr_araddr,      //                            .p0_app_ss_lite_csr_araddr
		output wire         p0_ss_app_lite_csr_rvalid,      //                            .p0_ss_app_lite_csr_rvalid
		input  wire         p0_app_ss_lite_csr_rready,      //                            .p0_app_ss_lite_csr_rready
		output wire [31:0]  p0_ss_app_lite_csr_rdata,       //                            .p0_ss_app_lite_csr_rdata
		output wire [1:0]   p0_ss_app_lite_csr_rresp,       //                            .p0_ss_app_lite_csr_rresp
		output wire         p0_ss_app_serr,                 //              p0_ss_app_serr.ss_app_serr,               Check User Guide for details
		output wire         p0_ss_app_dlup,                 //              p0_ss_app_dlup.ss_app_dlup,               Check User Guide for details
		output wire         p0_ss_app_linkup,               //            p0_ss_app_linkup.ss_app_linkup,             Check User Guide for details
		output wire         p0_ss_app_surprise_down_err,    // p0_ss_app_surprise_down_err.ss_app_surprise_down_err,  Check User Guide for details
		output wire [5:0]   p0_ss_app_ltssmstate,           //        p0_ss_app_ltssmstate.ss_app_ltssmstate,         Check User Guide for details
		input  wire [2:0]   p0_app_ss_st_rx_tuser_halt      //  p0_app_ss_st_rx_tuser_halt.app_ss_st_rx_tuser_halt,   Check User Guide for details
	);
endmodule

