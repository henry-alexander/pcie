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


// Copyright 2020 Intel Corporation.
//
// THIS SOFTWARE MAY CONTAIN PREPRODUCTION CODE AND IS PROVIDED BY THE
// COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
// OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Description
//-----------------------------------------------------------------------------
//
//   A general purpose resynchronization module that uses the recommended altera_std_synchronizer 
//   and altera_std_synchronizer_nocut synchronizer
//  
//   Parameters:
//         SYNC_CHAIN_LENGTH
//               Length of the synchronizer chain for metastability retiming.
//         WIDTH
//               Number of bits to synchronize. Controls the width of the d and q ports.
//         INIT_VALUE
//               Initial values of the synchronization registers.
//         NO_CUT
//               0 : Enable embedded set_false path SDC
//               1 : DIsable embedded set_false_path SDC
//        
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps 

module fim_resync #(
   parameter SYNC_CHAIN_LENGTH = 2,  // Number of flip-flops for retiming. Must be >1
   parameter WIDTH             = 1,  // Number of bits to resync
   parameter INIT_VALUE        = 0,
   parameter NO_CUT		= 1	  // See description above
)(
   input  logic              clk,
   input  logic              reset,
   input  logic  [WIDTH-1:0] d,
   output logic  [WIDTH-1:0] q
);

localparam  INT_LEN       = (SYNC_CHAIN_LENGTH > 1) ? SYNC_CHAIN_LENGTH : 2;
localparam  L_INIT_VALUE  = (INIT_VALUE == 1) ? 1'b1 : 1'b0;

genvar ig;

// Generate a synchronizer chain for each bit
generate
   for(ig=0;ig<WIDTH;ig=ig+1) begin : resync_chains
      wire d_in;   // Input to sychronization chain.
      wire sync_d_in;
      wire sync_q_out;
      
      assign d_in = d[ig];
      
      // Adding inverter to the input of first sync register and output of the last sync register to implement power-up high for INIT_VALUE=1
      assign sync_d_in = (INIT_VALUE == 1) ? ~d_in : d_in;
      assign q[ig] = (INIT_VALUE == 1)  ? ~sync_q_out : sync_q_out;
      
      if (NO_CUT == 0) begin
         // Synchronizer with embedded set_false_path SDC
         altera_std_synchronizer #(
            .depth(INT_LEN)				
         ) synchronizer (
            .clk      (clk),
            .reset_n  (~reset),
            .din      (sync_d_in),
            .dout     (sync_q_out)
         );
         
         //synthesis translate_off			
         initial begin
            synchronizer.dreg = {(INT_LEN-1){1'b0}};
            synchronizer.din_s1 = 1'b0;
         end
         //synthesis translate_on

      end else begin
         // Synchronizer WITHOUT embedded set_false_path SDC
         altera_std_synchronizer_nocut #(
            .depth(INT_LEN)
         ) synchronizer_nocut (
            .clk      (clk),
            .reset_n  (~reset),
            .din      (sync_d_in),
            .dout     (sync_q_out)
         );

         //synthesis translate_off
         initial begin
            synchronizer_nocut.dreg = {(INT_LEN-1){1'b0}};
            synchronizer_nocut.din_s1 = 1'b0;
         end
         //synthesis translate_on	
      end
   end // for loop
endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63cRaLbhJdMRLKCG38M+v4/VfV8K8gm71xdxrKDlxFjKA5eDBm2qLUIQj6q5xl5N+fGwud4GN5n5ZKxRvB0BtV369ANybP2htwjv8fVr0sGLonUhgMeGUdJtjNBTEHsdfHzh2rK6gr+50unBQIVkzlt+43tXpFXuWrVCiKh7kWnQhuKjmwfg7VqIC0F5kg67P+UJwkMEk2utNsOxWO66ZlPLDHUfn9np0GIoJYGzxOx2ddkWccNCPE/pYMhW8H8BYyOoTUOnLi+gSiBKyXH/XeNlsvfyK/uCvGM54nRosAqiYqlWnhVjgHXi1cWT6RA8fjzPDJMePIw2y/8bsAQ7ImNGHRRpDlkGNuvMOZHpKAaDhWVjAM+BPRHdgXPVh3Hc8tKL1luIDwDDEj6mpT/HyA54DYNdIuXZ3xpFR4yQUYsx+11+Y/9R9RPTmDA/vQlvhnJNXDw5yjDL7Mbk3yGKXpZfb7Cf8dwSfSY6HFVhv0Km7kuUEky8Andm8ewMj0QT9j8XdX8h7U2Nrbz5hIfBWElu9sAIyLL91xzIiyMrHqGT5IdWWzqaUgPBk2mpQHnRTNydJdGhuvlt1d7CU3TESvuN1M/yR53oIz4Zwczf4crjny550LNVivqqo0VyYnKbJgZU6mNSHsI5GCsVAeRKzYi17CvlFxNgqnfvOAdE2/Hcb/Q7ChI3ux/bK3eIFx+dX3OmAGkEDj5czbOEI7jJH2chFa/DB5C3xAoeOIP+eenHghJ8QQ3pTZo4UWH+sw06GUys0QjnR03LEGOrUCGXHL94"
`endif