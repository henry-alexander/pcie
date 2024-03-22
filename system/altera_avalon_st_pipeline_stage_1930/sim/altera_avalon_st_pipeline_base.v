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


// (C) 2001-2018 Intel Corporation. All rights reserved.
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


// $File: //acds/rel/23.4/ip/iconnect/avalon_st/altera_avalon_st_pipeline_stage/altera_avalon_st_pipeline_base.v $
// $Revision: #1 $
// $Date: 2023/10/12 $
// $Author: psgswbuild $
//------------------------------------------------------------------------------

`timescale 1ns / 1ns

module altera_avalon_st_pipeline_base (
                                       clk,
                                       reset,
                                       in_ready,
                                       in_valid,
                                       in_data,
                                       out_ready,
                                       out_valid,
                                       out_data
                                       );

   parameter  SYMBOLS_PER_BEAT  = 1;
   parameter  BITS_PER_SYMBOL   = 8;
   parameter  PIPELINE_READY    = 1;
   parameter  SYNC_RESET        = 0;
   parameter  BACKPRESSURE_DURING_RESET = 0;
   localparam DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL;
   
   input clk;
   input reset;
   
   output in_ready;
   input  in_valid;
   input [DATA_WIDTH-1:0] in_data;
   
   input                  out_ready;
   output                 out_valid;
   output [DATA_WIDTH-1:0] out_data;
   
   reg                     full0;
   reg                     full1;
   reg [DATA_WIDTH-1:0]    data0;
   reg [DATA_WIDTH-1:0]    data1;

   assign out_valid = full1;
   assign out_data  = data1;    
   
   // Generation of internal reset synchronization
   reg internal_sclr;
   generate if (SYNC_RESET == 1) begin : rst_syncronizer
      always @ (posedge clk) begin
         internal_sclr <= reset;
      end
   end
   endgenerate

   generate if (PIPELINE_READY == 1) 
     begin : REGISTERED_READY_PLINE
        
        assign in_ready  = !full0;

        always @(posedge clk) begin
              // ----------------------------
              // always load the second slot if we can
              // ----------------------------
              if (~full0)
                data0 <= in_data;
              // ----------------------------
              // first slot is loaded either from the second,
              // or with new data
              // ----------------------------
              if (~full1 || (out_ready && out_valid)) begin
                 if (full0)
                   data1 <= data0;
                 else
                   data1 <= in_data;
              end
        end
       
        if (SYNC_RESET == 0) begin : async_rst0 
           always @(posedge clk or posedge reset) begin
              if (reset) begin
                 full0    <= BACKPRESSURE_DURING_RESET ? 1'b1 : 1'b0;
                 full1    <= 1'b0;
              end else begin
                 // out of reset. 
                 if(~full1 & full0)begin
                     full0 <= 1'b0;
                 end

                 // no data in pipeline
                 if (~full0 & ~full1) begin
                    if (in_valid) begin
                       full1 <= 1'b1;
                    end
                 end // ~f1 & ~f0

                 // one datum in pipeline 
                 if (full1 & ~full0) begin
                    if (in_valid & ~out_ready) begin
                       full0 <= 1'b1;
                    end
                    // back to empty
                    if (~in_valid & out_ready) begin
                       full1 <= 1'b0;
                    end
                 end // f1 & ~f0
                 
                 // two data in pipeline 
                 if (full1 & full0) begin
                    // go back to one datum state
                    if (out_ready) begin
                       full0 <= 1'b0;
                    end
                 end // end go back to one datum stage
              end
           end
       end // async_rst0
       else begin // sync_rst0
           always @(posedge clk ) begin
              if (internal_sclr) begin
                 full0    <= BACKPRESSURE_DURING_RESET ? 1'b1 : 1'b0;
                 full1    <= 1'b0;
              end else begin
                 // out of reset. 
                 if(~full1 & full0)begin
                     full0 <= 1'b0;
                 end

                 // no data in pipeline
                 if (~full0 & ~full1) begin
                    if (in_valid) begin
                       full1 <= 1'b1;
                    end
                 end // ~f1 & ~f0

                 // one datum in pipeline 
                 if (full1 & ~full0) begin
                    if (in_valid & ~out_ready) begin
                       full0 <= 1'b1;
                    end
                    // back to empty
                    if (~in_valid & out_ready) begin
                       full1 <= 1'b0;
                    end
                 end // f1 & ~f0
                 
                 // two data in pipeline 
                 if (full1 & full0) begin
                    // go back to one datum state
                    if (out_ready) begin
                       full0 <= 1'b0;
                    end
                 end // end go back to one datum stage
              end
           end
       end // sync_rst0
     end 
   else 
     begin : UNREGISTERED_READY_PLINE
	
	// in_ready will be a pass through of the out_ready signal as it is not registered
	assign in_ready = (~full1) | out_ready;

   if (SYNC_RESET == 0) begin : async_rst1	
	   always @(posedge clk or posedge reset) begin
	      if (reset) begin
	         data1 <= 'b0;
	         full1 <= BACKPRESSURE_DURING_RESET ? 1'b1 : 1'b0;
	      end
	      else begin
	         if (in_ready) begin
	   	 data1 <= in_data;
	   	 full1 <= in_valid;
	         end
	      end
	   end
   end // async_rst1
   else begin // sync_rst1
      always @(posedge clk ) begin
	      if (internal_sclr) begin
	         data1 <= 'b0;
	         full1 <= BACKPRESSURE_DURING_RESET ? 1'b1 : 1'b0;
	      end
	      else begin
	         if (in_ready) begin
	   	 data1 <= in_data;
	   	 full1 <= in_valid;
	         end
	      end
	   end
	end // sync_rst1	
     end
   endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Mj+fk0jjIonoXfiXsyPTo2LQmOM+p24lB0GiO9O85wRpql6+2z/Am+vMAVGA1LwDqvtXmfS15b8DQAxqYCx4pqzuJAoRDEYD/31g0DhbyqjA+ZPbt4rxtuOIuAPEAKAqcyOkGQEvcrbNNm6gSK3SlB5siGA8FsXLuFf+9yywfZWvqajIuhCAAvfs+kv/x0wXtw1dqhePd8UvPhDurmIgwaMtv42I0C0nz3am7+dZ2VqiO5gm2ZV5zZhlrGWIn8deNBxuWuxAr9OO93C2jLNuBXLDr7yQI8Vkrwz8G7/Bkaz4qNFxwBmsspWAtMuSTTM+uS1aDt32gTTMItZlRCh7aK9E7gfTyofrXqKyVMyAc4JZQmiTARmJUlwPvfPvXmAXRwUmLm2ueODaYUdXL1U4wCSnuQ6qBAr/tuAY4Vs2CvNhL2PNKScgQzPJEUPiK1pJb/rjXhKWZPG4Kr9p2ukF+21m0bPTlOJXHekISGs39KqqF1AhrKNAcvAeRSLaSf7cd5Lyc/LstK74dtupKV6QX+H0xXAzjgf5SFpBofZjAyG+6nAX6/tW3eugUEWyTzt8V6Giu2IG/WWUkIkqBLkHCIiE0qRW9oWAADrOdJGkWmXOrdHWr+9QvQi3XTb35fKxEOpYYHiiTcpC+YFcX5an00GsRmIhIqTSn8HE6bKxlUAhD/M0mvbJTCnzfBdszsgjuULMyBK1HylBepiu5d4562G1VtE5IWVYsuUsf/M1EnTz0CA5YQ4GqyOjQqI7UCcvvMUazCg0DJ/pcP7HHI0XaaWl2MpmYJ+t7kukBZKiMQyV6WEOeO4jpQ/uCjd/Tz3lten1+uTtNBE0iRYRM1ehE3RNzsmev5KXktQe4PjGRA+DgHKMXt8GIM8yIB9jr/PcNyodRxfq/mO1uybL+ExxsGdM8QnzlgvZG7ySaHfnNDoyDMIoj4nvUJSJYx7JjNHE28wCIBj4g9be0dsx8TCr9+/dic9ogT/ZMGHkGpY9LTI1kq3Pc5DytQBJ3OcSL882"
`endif