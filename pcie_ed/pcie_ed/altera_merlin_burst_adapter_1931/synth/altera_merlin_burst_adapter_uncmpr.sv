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


// (C) 2001-2012 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other
// software and tools, and its AMPP partner logic functions, and any output
// files any of the foregoing (including device programming or simulation
// files), and any associated documentation or information are expressly subject
// to the terms and conditions of the Altera Program License Subscription
// Agreement, Altera MegaCore Function License Agreement, or other applicable
// license agreement, including, without limitation, that your use is for the
// sole purpose of programming logic devices manufactured by Altera and sold by
// Altera or its authorized distributors.  Please refer to the applicable
// agreement for further details.


// $Id: //acds/main/ip/merlin/altera_merlin_burst_adapter/altera_merlin_burst_adapter.sv#68 $
// $Revision: #68 $
// $Date: 2014/01/23 $

`timescale 1 ns / 1 ns

// -------------------------------------------------------
// Adapter for uncompressed transactions only. This adapter will
// typically be used to adapt burst length for non-bursting 
// wide to narrow Avalon links.
// -------------------------------------------------------
module altera_merlin_burst_adapter_uncompressed_only
#(
    parameter 
    PKT_BYTE_CNT_H  = 5,
    PKT_BYTE_CNT_L  = 0,
    PKT_BYTEEN_H    = 83,
    PKT_BYTEEN_L    = 80,
    ST_DATA_W       = 84,
    ST_CHANNEL_W    = 8
)
(
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                           sink0_valid,
    input  [ST_DATA_W-1 : 0]        sink0_data,
    input  [ST_CHANNEL_W-1 : 0]     sink0_channel,
    input                           sink0_startofpacket,
    input                           sink0_endofpacket,
    output reg                      sink0_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output reg                      source0_valid,
    output reg [ST_DATA_W-1    : 0] source0_data,
    output reg [ST_CHANNEL_W-1 : 0] source0_channel,
    output reg                      source0_startofpacket,
    output reg                      source0_endofpacket,
    input                           source0_ready
);
    localparam
        PKT_BYTE_CNT_W = PKT_BYTE_CNT_H - PKT_BYTE_CNT_L + 1,
        NUM_SYMBOLS    = PKT_BYTEEN_H - PKT_BYTEEN_L + 1;

    wire [PKT_BYTE_CNT_W - 1 : 0] num_symbols_sig = NUM_SYMBOLS[PKT_BYTE_CNT_W - 1 : 0];

    always_comb begin : source0_data_assignments
        source0_valid         = sink0_valid;
        source0_channel       = sink0_channel;
        source0_startofpacket = sink0_startofpacket;
        source0_endofpacket   = sink0_endofpacket;

        source0_data          = sink0_data;
        source0_data[PKT_BYTE_CNT_H : PKT_BYTE_CNT_L] = num_symbols_sig;

        sink0_ready = source0_ready;
    end

endmodule



`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Mj+fk0jjIonoXfiXsyPTo2LQmOM+p24lB0GiO9O85wRpql6+2z/Am+vMAVGA1LwDqvtXmfS15b8DQAxqYCx4pqzuJAoRDEYD/31g0DhbyqjA+ZPbt4rxtuOIuAPEAKAqcyOkGQEvcrbNNm6gSK3SlB5siGA8FsXLuFf+9yywfZWvqajIuhCAAvfs+kv/x0wXtw1dqhePd8UvPhDurmIgwaMtv42I0C0nz3am7+dZ2VqajUKSL/nYyb+4C3vyRCfh9378H3g4hvq2JcOaCBrAYUGSZYGKPNQdnW3ULXWDdVEGunaMrfYbBjPxSo3e7WtqAyftu0PQx6YFfIh0BSLT+qIEf+ier5qiQwjPNrsZT00BXyXv2+06AGLh23D5tD6by5BYQAeAvw6TEeo3ZGwvUM7cTZgfpbkMr8i4iOauystEDvJw9RfsKECEKIHvon6afQ9h+j2i/1BGpOMeFHHTOFod8F9sKJC9ba/c777MrEWefxlhHh/lmi9nt2jv+BHAetRfJMvYkI7NQTb8AWGW1nztWtrg//mM73t93DG6Lb3krqeBkmeOkA2UJLqmQc0g78dCFVk4L4yQ7BKe3TMIhRJUIIZjaQs9Quqcr0L/Ck3X1PTMO0Y7uAdep/jdOKXPG6pqZEDVV455RcuqaYuztZVgLnLuEMZ/NX0oXkOeSF2Mb0S1B139vC7JCoekht/OjIJSeCZeVJfjwp7l8vDe2LLNTvofvU61xeTAoELhMaqKVPpgtrqzmQThzRJPzZ8hosDcZBOyo2BZgHbLL+f/bDx3sQ7ZgXT55PTfW+nwjzmcj5ZMD61aV1ZVvOYvK4w0rqXWBNZu1mgtE1uo2D/BiyDj2RfpwZTJbg/gtu6Rq5T2+hh9b9xWNGwXfaR9fUjJ29sw10oQOc+4TchGtkmNRoyNR4/LaQSa5nlcb7MPHmSMJbtqaM8GrgaK6b4COEeXt+aMxyoGqd9MbzGLIvb0sOyHBG7RTsHaT9xQAZ8BK2VNpHIzGF4rV2l6Eq+b128Z"
`endif