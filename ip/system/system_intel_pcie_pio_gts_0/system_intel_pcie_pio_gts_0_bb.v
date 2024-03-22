module system_intel_pcie_pio_gts_0 (
		input  wire         Clk_i,                        //                   axi_st_clk.clk
		input  wire         outclk_0,                     //                 axi_lite_clk.clk
		input  wire         coreclkout_hip,               //                          clk.clk
		input  wire         Rstn_i,                       //                        reset.reset_n
		output wire         pio_clk,                      //               pio_master_clk.clk
		output wire         pio_rst_n,                    //             pio_master_reset.reset_n
		output wire         pio_axi_st_areset_n,          //          pio_axi_st_areset_n.reset_n
		output wire         pio_axi_lite_areset_n,        //        pio_axi_lite_areset_n.reset_n
		output wire         pio_subsystem_cold_rst_n,     //     pio_subsystem_cold_rst_n.reset_n
		output wire         pio_subsystem_warm_rst_n,     //     pio_subsystem_warm_rst_n.reset_n
		input  wire         ninit_done,                   //                   ninit_done.reset
		input  wire         pio_subsystem_cold_rst_ack_n, // pio_subsystem_cold_rst_ack_n.subsystem_cold_rst_ack_n
		input  wire         pio_subsystem_warm_rst_ack_n, // pio_subsystem_warm_rst_ack_n.subsystem_warm_rst_ack_n
		input  wire         pio_initiate_warmrst_req,     //     pio_initiate_warmrst_req.initiate_warmrst_req
		input  wire         pio_subsystem_rst_rdy,        //        pio_subsystem_rst_rdy.subsystem_rst_rdy
		output wire         pio_subsystem_rst_req,        //        pio_subsystem_rst_req.subsystem_rst_req
		output wire         pio_initiate_rst_req_rdy,     //     pio_initiate_rst_req_rdy.initiate_rst_req_rdy
		input  wire         pio_pll_locked,               //               pio_pll_locked.export
		output wire [63:0]  pio_address_o,                //                   pio_master.address
		output wire         pio_read_o,                   //                             .read
		input  wire [511:0] pio_readdata_i,               //                             .readdata
		input  wire         pio_readdatavalid_i,          //                             .readdatavalid
		output wire         pio_write_o,                  //                             .write
		output wire [511:0] pio_writedata_o,              //                             .writedata
		input  wire         pio_waitrequest_i,            //                             .waitrequest
		output wire [63:0]  pio_byteenable_o,             //                             .byteenable
		input  wire [1:0]   pio_response_i,               //                             .response
		output wire [3:0]   pio_burstcount_o,             //                             .burstcount
		input  wire         pio_rx_tvalid_i,              //                       rx_pio.tvalid
		output wire         pio_rx_tready_o,              //                             .tready
		input  wire [255:0] pio_rx_tdata_i,               //                             .tdata
		input  wire [31:0]  pio_rx_tkeep_i,               //                             .tkeep
		input  wire         pio_rx_tlast_i,               //                             .tlast
		output wire         pio_tx_tvalid_o,              //                       tx_pio.tvalid
		input  wire         pio_tx_tready_i,              //                             .tready
		output wire [255:0] pio_tx_tdata_o,               //                             .tdata
		output wire [31:0]  pio_tx_tkeep_o,               //                             .tkeep
		output wire         pio_tx_tlast_o,               //                             .tlast
		input  wire         pio_txcrdt_tvalid,            //                  tx_crdt_pio.tvalid
		input  wire [18:0]  pio_txcrdt_tdata,             //                             .tdata
		input  wire         pio_ctrlshadow_tvalid_i,      //               ctrlshadow_pio.tvalid
		input  wire [39:0]  pio_ctrlshadow_tdata_i,       //                             .tdata
		input  wire         pio_cplto_tvalid_i,           //                    cplto_pio.tvalid
		input  wire [29:0]  pio_cplto_tdata_i             //                             .tdata
	);
endmodule

