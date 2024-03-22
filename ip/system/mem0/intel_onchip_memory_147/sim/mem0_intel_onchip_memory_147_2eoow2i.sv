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

module  mem0_intel_onchip_memory_147_2eoow2i  (
    address,
    byteenable,
    clk,
    read,
    readdata,
    reset,
    reset_req,
    write,
    writedata
    );

    parameter INIT_FILE = "mem0_mem0.hex";

    input  [7:0]	address;
    input  [63:0]	byteenable;
    input        	clk;
    input        	read;
    output [511:0]	readdata;
    input        	reset;
    input        	reset_req;
    input        	write;
    input  [511:0]	writedata;

    wire    [511:0]	readdata;
    wire    [511:0]	q_a;
    wire        	wren_a;
    wire        	clken_int;
    wire        	ram_clocken0;

    reg    [511:0]	lvl2_readdata;


    assign wren_a = write;

    assign readdata = lvl2_readdata;

    always @(posedge clk)
    begin
        if (reset)
            lvl2_readdata <= 'b0;
        else
            lvl2_readdata <= q_a;
    end

    assign clken_int = ~reset_req;



    assign ram_clocken0 = clken_int;



    altera_syncram  altera_syncram_component (
                .address_a    	(address),
                .byteena_a    	(byteenable),
                .clock0    	(clk),
                .data_a    	(writedata),
                .q_a    	(q_a),
                .rden_a    	(read),
                .wren_a    	(wren_a),
                .aclr0    	(1'b0),
                .aclr1    	(1'b0),
                .address2_a    	(1'b1),
                .address2_b    	(1'b1),
                .address_b    	(1'b1),
                .addressstall_a    	(1'b0),
                .addressstall_b    	(1'b0),
                .byteena_b    	(1'b1),
                .clock1    	(1'b1),
                .clocken0    	(1'b1),
                .clocken1    	(1'b1),
                .clocken2    	(1'b1),
                .clocken3    	(1'b1),
                .data_b    	(1'b1),
                .eccencbypass    	(1'b0),
                .eccencparity    	(8'b0),
                .eccstatus    	(),
                .q_b    	(),
                .rden_b    	(1'b1),
                .sclr    	(1'b0),
                .wren_b    	(1'b0)
                );

    defparam
        altera_syncram_component.intended_device_family  	= "Agilex 5",
        altera_syncram_component.lpm_type  	= "altera_syncram",
        altera_syncram_component.operation_mode  	= "SINGLE_PORT",
        altera_syncram_component.ram_block_type  	= "AUTO",
        altera_syncram_component.byte_size  	= 8,
        altera_syncram_component.numwords_a  	= 256,
        altera_syncram_component.width_a  	= 512,
        altera_syncram_component.widthad_a  	= 8,
        altera_syncram_component.width_byteena_a  	= 64,
        altera_syncram_component.outdata_reg_a  	= "UNREGISTERED",
        altera_syncram_component.outdata_aclr_a  	= "NONE",
        altera_syncram_component.outdata_sclr_a  	= "NONE",
        altera_syncram_component.clock_enable_input_a  	= "BYPASS",
        altera_syncram_component.clock_enable_output_a  	= "BYPASS",
        altera_syncram_component.read_during_write_mode_port_a  	= "DONT_CARE",
        altera_syncram_component.init_file  	= INIT_FILE,
        altera_syncram_component.init_file_layout  	= "Port_A";



endmodule
