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


// $Id: //acds/main/ip/sopc/components/primitives/altera_std_synchronizer/altera_std_synchronizer.v#8 $
// $Revision: #8 $
// $Date: 2009/02/18 $
// $Author: pscheidt $
//-----------------------------------------------------------------------------
//
// File: altera_std_synchronizer_nocut.v
//
// Abstract: Single bit clock domain crossing synchronizer. Exactly the same
//           as altera_std_synchronizer.v, except that the embedded false
//           path constraint is removed in this module. If you use this
//           module, you will have to apply the appropriate timing
//           constraints.
//
//           We expect to make this a standard Quartus atom eventually.
//
//           Composed of two or more flip flops connected in series.
//           Random metastable condition is simulated when the 
//           __ALTERA_STD__METASTABLE_SIM macro is defined.
//           Use +define+__ALTERA_STD__METASTABLE_SIM argument 
//           on the Verilog simulator compiler command line to 
//           enable this mode. In addition, define the macro
//           __ALTERA_STD__METASTABLE_SIM_VERBOSE to get console output 
//           with every metastable event generated in the synchronizer.
//
// Copyright (C) Altera Corporation 2009, All Rights Reserved
//-----------------------------------------------------------------------------

`timescale 1ns / 1ns

module altera_std_synchronizer_nocut (
                                clk, 
                                reset_n, 
                                din, 
                                dout
                                );

   parameter depth = 3; // This value must be >= 2 !
   parameter rst_value = 0;

  //when enabled, this will allow retiming for the sync depth >3.
   parameter retiming_reg_en = 0;
     
   input   clk;
   input   reset_n;    
   input   din;
   output  dout;
   
   // QuartusII synthesis directives:
   //     1. Preserve all registers ie. do not touch them.
   //     2. Do not merge other flip-flops with synchronizer flip-flops.
   // QuartusII TimeQuest directives:
   //     1. Identify all flip-flops in this module as members of the synchronizer 
   //        to enable automatic metastability MTBF analysis.

   (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name SYNCHRONIZER_IDENTIFICATION FORCED; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON  "} *) reg din_s1;

   (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [depth-2:0] dreg;    

   //synthesis translate_off
   `ifndef QUARTUS_CDC
   initial begin
     if (retiming_reg_en == 0 ) begin
       if (depth <2) begin 
         $display("%m: Error: synchronizer length: %0d less than 2.", depth);
       end
      end
     else begin
       if (depth <4) begin 
         $display("%m: Error: synchronizer length: %0d less than 4 with retiming enabled.", depth);
       end
     end
   end
   `endif 

   // the first synchronizer register is either a simple D flop for synthesis
   // and non-metastable simulation or a D flop with a method to inject random
   // metastable events resulting in random delay of [0,1] cycles
   
`ifdef __ALTERA_STD__METASTABLE_SIM

   reg[31:0]  RANDOM_SEED = 123456;      
   wire  next_din_s1;
   wire  dout;
   reg   din_last;
   reg          random;
   event metastable_event; // hook for debug monitoring

   initial begin
      $display("%m: Info: Metastable event injection simulation mode enabled");
      random = $random;
   end
   
   always @(posedge clk) begin
      if (reset_n == 0)
        random <= $random(RANDOM_SEED);
      else
        random <= $random;
   end

   assign next_din_s1 = (din_last ^ din) ? random : din;   

   always @(posedge clk or negedge reset_n) begin
       if (reset_n == 0) 
         din_last <= (rst_value == 0)? 1'b0 : 1'b1;
       else
         din_last <= din;
   end

   always @(posedge clk or negedge reset_n) begin
       if (reset_n == 0) 
         din_s1 <= (rst_value == 0)? 1'b0 : 1'b1;
       else
         din_s1 <= next_din_s1;
   end
   
`else 

   //synthesis translate_on   
   generate if (rst_value == 0)
       always @(posedge clk or negedge reset_n) begin
           if (reset_n == 0) 
             din_s1 <= 1'b0;
           else
             din_s1 <= din;
       end
   endgenerate
   
   generate if (rst_value == 1)
       always @(posedge clk or negedge reset_n) begin
           if (reset_n == 0) 
             din_s1 <= 1'b1;
           else
             din_s1 <= din;
       end
   endgenerate
   //synthesis translate_off      

`endif

`ifdef __ALTERA_STD__METASTABLE_SIM_VERBOSE
   always @(*) begin
      if (reset_n && (din_last != din) && (random != din)) begin
         $display("%m: Verbose Info: metastable event @ time %t", $time);
         ->metastable_event;
      end
   end      
`endif

   //synthesis translate_on

   // the remaining synchronizer registers form a simple shift register
   // of length depth-1
   generate if (rst_value == 0) begin
      if (retiming_reg_en == 0) begin
         if (depth < 3) begin
            always @(posedge clk or negedge reset_n) begin
               if (reset_n == 0) 
                 dreg <= {depth-1{1'b0}};            
               else
                 dreg <= din_s1;
            end         
         end else begin
            always @(posedge clk or negedge reset_n) begin
               if (reset_n == 0) 
                 dreg <= {depth-1{1'b0}};
               else
                 dreg <= {dreg[depth-3:0], din_s1};
            end
         end

         assign dout = dreg[depth-2];
       end

       else begin //This part is enabled when we set retiming_reg_en =1
          (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [1:0] dreg1;
          reg [depth-4:0] dreg2;
          wire [depth-2:0] dreg3;

          assign dreg3 = {dreg2,dreg1};

          if (depth <= 3) begin
             always @(posedge clk or negedge reset_n) begin
                if (reset_n == 0)
                  dreg1 <= {depth-1{1'b0}};
                else
                  dreg1 <= din_s1;
               end
           end
           else begin
              always @(posedge clk or negedge reset_n) begin
                if (reset_n == 0)
                  {dreg2,dreg1} <= {depth-1{1'b0}};
                else
                  {dreg2,dreg1} <= {dreg3[depth-3:0], din_s1};
              end
           end
           assign dout = dreg3[depth-2];
       end
    end

   
   else begin
      if (retiming_reg_en == 0) begin
         if (depth < 3) begin
            always @(posedge clk or negedge reset_n) begin
               if (reset_n == 0) 
                 dreg <= {depth-1{1'b1}};            
               else
                 dreg <= din_s1;
             end         
         end else begin
            always @(posedge clk or negedge reset_n) begin
               if (reset_n == 0) 
                 dreg <= {depth-1{1'b1}};
               else
                 dreg <= {dreg[depth-3:0], din_s1};
            end
         end
       assign dout = dreg[depth-2];
    end

      else begin
         (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [1:0] dreg1;
         reg [depth-4:0] dreg2;
         wire [depth-2:0] dreg3;

         assign dreg3 = {dreg2,dreg1};

           if (depth <= 3) begin
               always @(posedge clk or negedge reset_n) begin
                  if (reset_n == 0)
                    dreg1 <= {depth-1{1'b1}};
                  else
                    dreg1 <= din_s1;
               end
           end
           else begin
               always @(posedge clk or negedge reset_n) begin
                  if (reset_n == 0)
                    {dreg2,dreg1} <= {depth-1{1'b1}};
                  else
                    {dreg2,dreg1} <= {dreg3[depth-3:0], din_s1};
               end
            end  
          assign dout = dreg3[depth-2];
        end
     end
   endgenerate

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "4YVPjhCjvOiBlyEcBGm8Rtwk1Omh4tsrMNkDTwEXmZlTOR5VM/eTNbQpSAmY635+ldNHsl0rxAY5lAt65yGpbk4HMFSH7Yg+WOKIQXUkrSLcC++eWpuGej+1ozmv9hYeFtdiR/GKtoYikLcPceUNQGsyOKp6H3eaW0uu8h3YUNhNUR7ocxqT1avi9iGqy2z7D8ulz3Hs9+90faB/KioBOU12qypF19Pbyba7B22d+kb5yozRE+MzWk+fyOw8xWw6m8mjgtvl12j+FstIk66on6o1XWKpDo0uE20EqE9A+Fv8ececQV2KUlRQkeRrvYzxRLpWT/QP0oOtpc3h0dbagQ4tGl7DSIKG+Dw2mAy4Lx7LWu1CcpOwbWieyQjJVcnQtzGwV88icNAWHRFJKdt6RBWU7ReiX5xVUNBiae0kF6dYRJtwVZXbokOYNQZXM+92ZfMuOIudH8jDJuGdjnTqoPUhzgUXblvAGfS5V0iML6c9XHSQNXbUvf3jNNP6m5AkKwMx/SFGSRMOecT85DYtoOCvW5s7vcXuRsrK519SaTb+3fNe9CV5aU+/FKXFpe9Mm9VdJoi2NtlRKjvnSUTmF/5ITMHQQETe3mKgCuR0VMBol2MQfbpngMFGrOc/hVcc40Adh9+H5GbHPkZ5vQdfrXpuDCLtWHlhj9WXFV5j04lf3/DrEnDrrU8zAnAzsdUaNAZiQpCkhLQ9SAOGTgo2JDnCJvpvgBN/R5TQBhCY+Y7ik+Ta7Yas0btCAbrdyWqYdfNT4diybs8hZdoM0M6xz1FFH+bqNigckEj/LFklz1Y//p/BFxkMR5dkoPUvoE/qPoRbzp5I/yhelzRMzsWDyYeiehc8gvWUA7OXi3BhxG8HmIUzWy5bvU0TjJOgfKgWIjbUvb8aHSg7LLx6ZcTdacb5SlFWf9QfsZ0cYOhzp7YG76eiy5eCQuFCswNp79sCmvBVDQ46GAcpguCz6ac7138/plD0XdW7kP+sIHuyJQw4liGxJ6S6lOopIFj/9uXX"
`endif