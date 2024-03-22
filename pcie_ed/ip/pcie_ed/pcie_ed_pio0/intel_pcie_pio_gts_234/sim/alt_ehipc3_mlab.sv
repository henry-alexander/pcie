// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


`timescale 1 ps / 1 ps
// baeckler - 07-12-2014
// DESCRIPTION
// Wrapper for MLAB hardware cells in typical arrangement

module alt_ehipc3_mlab #(
	parameter WIDTH = 20,
	parameter ADDR_WIDTH = 5,
	parameter SIM_EMULATE = 1'b0,   // this may not be exactly the same at the fine grain timing level
        parameter intended_device_family = "Stratix 10"
)
(
	input wclk,
	input wena,
	input [ADDR_WIDTH-1:0] waddr_reg,
	input [WIDTH-1:0] wdata_reg,
	input [ADDR_WIDTH-1:0] raddr,
	output [WIDTH-1:0] rdata
);

localparam device_family = (intended_device_family == "Stratix 10") ? 1 : 0;

genvar i;
generate
	if (!SIM_EMULATE) begin
        /////////////////////////////////////////////
        // hardware cells

        // the fourteen nm only (the Stratix 10) needs another data register
        reg [WIDTH-1:0] wdata_reg_2 /* synthesis preserve */;
        always @(posedge wclk) wdata_reg_2 <= wdata_reg;


		for (i=0; i<WIDTH; i=i+1)  begin : ml
			wire wclk_w = wclk;  // workaround strange modelsim warning due to cell model tristate
            // Note: the stratix 5 cell is the same other than timing
			//stratixv_mlab_cell lrm (
                  if (device_family) begin
                        fourteennm_mlab_cell lrm (
				.clk0(wclk_w),
				.ena0(wena),

				// synthesis translate_off
				.clk1(1'b0),
				.ena1(1'b1),
				//.ena2(1'b1),
				.clr(1'b0),
				.devclrn(1'b1),
				.devpor(1'b1),
				// synthesis translate_on

				.portabyteenamasks(1'b1),
				.portadatain(wdata_reg_2[i]),
				.portaaddr(waddr_reg),
				.portbaddr(raddr),
				.portbdataout(rdata[i])

			);

			defparam lrm .mixed_port_feed_through_mode = "dont_care";
			defparam lrm .logical_ram_name = "lrm";
			defparam lrm .logical_ram_depth = 1 << ADDR_WIDTH;
			defparam lrm .logical_ram_width = WIDTH;
			defparam lrm .first_address = 0;
			defparam lrm .last_address = (1 << ADDR_WIDTH)-1;
			defparam lrm .first_bit_number = i;
			defparam lrm .data_width = 1;
			defparam lrm .address_width = ADDR_WIDTH;
                  end
                  else begin
                        tennm_mlab_cell lrm (
                                .clk0(wclk_w),
                                .ena0(wena),

                                // synthesis translate_off
                                .clk1(1'b0),
                                .ena1(1'b1),
                                //.ena2(1'b1),
                                .clr(1'b0),
                                .devclrn(1'b1),
                                .devpor(1'b1),
                                // synthesis translate_on

                                .portabyteenamasks(1'b1),
                                .portadatain(wdata_reg_2[i]),
                                .portaaddr(waddr_reg),
                                .portbaddr(raddr),
                                .portbdataout(rdata[i])

                        );

                        defparam lrm .mixed_port_feed_through_mode = "dont_care";
                        defparam lrm .logical_ram_name = "lrm";
                        defparam lrm .logical_ram_depth = 1 << ADDR_WIDTH;
                        defparam lrm .logical_ram_width = WIDTH;
                        defparam lrm .first_address = 0;
                        defparam lrm .last_address = (1 << ADDR_WIDTH)-1;
                        defparam lrm .first_bit_number = i;
                        defparam lrm .data_width = 1;
                        defparam lrm .address_width = ADDR_WIDTH;
                  end
		end
	end
	else begin
		/////////////////////////////////////////////
		// sim equivalent

		localparam NUM_WORDS = (1 << ADDR_WIDTH);
		reg [WIDTH-1:0] storage [0:NUM_WORDS-1];
		integer k = 0;
		initial begin
			for (k=0; k<NUM_WORDS; k=k+1) begin
				storage[k] = 0;
			end
		end

		always @(posedge wclk) begin
			if (wena) storage [waddr_reg] <= wdata_reg;
		end

		reg [WIDTH-1:0] rdata_b = 0;
		always @(*) begin
			rdata_b = storage[raddr];
		end

		assign rdata = rdata_b;
	end

endgenerate

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3CTo4Cyuk5Lg5s5Zg1ho05Ye8Jc3BroVAiTFjzEUczDOhxcHGOOAgaDdG9LxrJ1MXZI8YWBzeFNQrw3AIVJGdrF4nTCRyLsJeGg89XlT/ABvgVR+wnRbfGJXYnuSwk4EyHPkq1o2dlgli236+wQ6Q1KNnN24r17P9zg5le1wH+5LPEi5yLKzeKbKWftpfKKVFUVRvJt3Ca5vO8rbfMkh997y3nYthSxxeb3+rex3yf/DmsFDk26yhKbt+58yr9qXT4oZlwrUzxf2SXn/dhnVem9H91OROth+AhiE6QQULgmcCORSXtdx15PPOpqj4uw2KLreGyCjiHAFZCUfpnZJe4dV0ZfIRCGINs0X00w/ahJRkL53Yplz7gKt7r4JXBfqmfAGnLi4rkt+NS2AvAkf/pEgVj3Mn4NFXHQydpVPpcFu+zfy3gbj6rWxIT98Qh+uvYVe4AdyVILdyolOz6Rm9bcdZV7UWOqIG79nEs+RYoBbmpI7hUQoIwcoM9rEXzhqFaVxRAJsVE3BXinsqlCjMh9byzzHb1ILF5JlbcYOGV9SyHETB2p6B1QSCAvypD/h/djLIzxpHCeqINuYnLahARGqJwaEXEo6sscNlWXRDV+JOlZK+/oFrYYLMZV3UQGy5vSurQckRXaj+B8VuvpmRWFwluw+zjqudDM4HWXFZI0nUfHQ3G9FlYlwJnZ68CGEwbrIGGiFxeiKGFDfJkt7rRrpPx4+KNpjkMc9Gmczb1nPblMu4I4UgqqSwoA4rsqtwrie2YbQ7YB4Sa0LSFMFgQVmFFj9XC2m/TGbVTkMPkDKfGtWrqJhj7yFMwphl4dMwxmQU5K7vVwmQ1f7FirC4ChzA5nAdU5ik6fupf5PgRCvZm1JKM2nJjGlxFQqzFVm1nVWleFfOwr66rUL+nGVpiwtwoyfrr0SKqvvx2JFaLCGoojeajS+Q4LrUJvFLqFmb2UnDjLbRXTEqC4eng6gSk5xK8CnDmCZi6NCoD6tyimybLBgJUIBuaKFumgIrEyQ"
`endif