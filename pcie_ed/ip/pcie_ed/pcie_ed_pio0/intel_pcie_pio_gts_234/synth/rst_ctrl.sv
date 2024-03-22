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
//   System reset controller
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Module ports
//-----------------------------------------------------------------------------

module rst_ctrl (
   input    logic clk_sys,             // Global clock
   input    logic clk_100m,            // Clock 100 MHz
   input    logic pll_locked,          // PLL locked flag
   input    logic pcie_reset_status,   // PCIe SRC reset status
   input    logic pcie_cold_rst_ack_n, // PCIe cold reset ack (active low)
   input    logic pcie_warm_rst_ack_n, // PCIe warm reset ack (active low),
   
   input   logic ninit_done,          // FPGA initialization done (active low)
   output   logic rst_n_sys,           // System reset synchronous to clk_sys 
   output   logic rst_n_100m,          // System reset synchronous to clk_100m
   output   logic pwr_good_n,          // Hardware reset synchronous to clk_sys
   output   logic pcie_cold_rst_n,     // PCIe cold reset synchronous to clk_sys
   output   logic pcie_warm_rst_n,      // PCIe warm reset synchronous to clk_sys

   output   logic subsystem_rst_req,    // Reset entry indication from Central Reset Sequencer block in SOC
   input    logic subsystem_rst_rdy,    // Ready for reset entry indication from Subsystem to Central Reset Sequencer block
   input    logic initiate_warmrst_req,  //Reset entry required indication from SIP SRC block to Central Reset Sequencer
   output   logic initiate_rst_req_rdy   //Indicates Central Reset Sequencer block has accepted initiation request and will start issuing resets
);

//--------------------------------------------------------------------------
// Reset inputs 
//--------------------------------------------------------------------------
wire  rst_n, rst_n_sync;
wire  npor;

assign npor  = ~ninit_done; 
assign rst_n = npor && pll_locked && ~pcie_reset_status;

fim_resync #(
   .SYNC_CHAIN_LENGTH(3),
   .WIDTH(1),
   .INIT_VALUE(0),
   .NO_CUT(1)
) rst_in_resync (
   .clk   (clk_sys),
   .reset (~rst_n),
   .d     (1'b1),
   .q     (rst_n_sync)
);

// Configuration reset release IP
// reset release IP used in HWT
//`ifdef SIM_MODE
//   assign ninit_done = 1'b0;
//`else
//   cfg_mon cfg_mon (
//      .ninit_done (ninit_done)
//   );
//`endif

//--------------------------------------------------------------------------
// PCIe reset control
//--------------------------------------------------------------------------
logic pcie_cold_rst_ack_n_sync;
logic pcie_warm_rst_ack_n_sync;
logic pcie_rst_ack;
logic pcie_rst_release;
logic pcie_rst_n;
logic fim_rst_n;

`ifdef INCLUDE_PCIE_SS
   fim_resync #(
      .SYNC_CHAIN_LENGTH(3),
      .WIDTH(2),
      .INIT_VALUE(0),
      .NO_CUT(1)
   ) pcie_cold_rst_ack_sync (
      .clk   (clk_sys),
      .reset (1'b0),
      .d     ({pcie_cold_rst_ack_n, pcie_warm_rst_ack_n}),
      .q     ({pcie_cold_rst_ack_n_sync, pcie_warm_rst_ack_n_sync})
   );
`else
   assign pcie_cold_rst_ack_n_sync = pcie_rst_n;
   assign pcie_warm_rst_ack_n_sync = pcie_rst_n;
`endif

assign pcie_rst_ack = (~pcie_cold_rst_ack_n_sync && ~pcie_warm_rst_ack_n_sync);
assign pcie_rst_release = (pcie_rst_n && pcie_cold_rst_ack_n_sync && pcie_warm_rst_ack_n_sync);

//------------------
// PCIe reset
//    Activate PCIe cold/warm reset when reset input is active
//    Wait for PCIe cold/warm reset ack
//    Release PCIe cold/warm reset
//------------------
always_ff @(posedge clk_sys) begin
   if (~rst_n_sync) begin
      pcie_rst_n <= 1'b0;
   end else begin
     if (~pcie_rst_n && pcie_rst_ack) begin
         pcie_rst_n <= 1'b1;
     end
   end
end
//----------------------------------------------------------------
// PCIeSS reset
//     Handshake between SIP SRC block and Central Reset Sequencer
//----------------------------------------------------------------
localparam    N_CYCLE_TO_RELEASE_RST_REQ     =   5'd21;
localparam    N_CYCLE_TO_RELEASE_RST_REQ_RDY =   5'd21;

reg subsystem_rst_req_temp;
reg initiate_rst_req_rdy_temp;
reg subsystem_rst_req_i;
reg initiate_rst_req_rdy_i;

logic [5:0]   n_cycle_count_to_subsystem_rst_req_release, n_cycle_count_to_initiate_rst_req_rdy_release;

logic subsystem_rst_req_edge, initiate_rst_req_rdy_edge, subsystem_rst_req_edge_delay, initiate_rst_req_rdy_edge_delay, subsystem_rst_req_edge_long, initiate_rst_req_rdy_edge_long;

always @(posedge clk_sys) begin
     subsystem_rst_req_i <= subsystem_rst_req_temp;
     subsystem_rst_req_edge <= subsystem_rst_req_i ^ subsystem_rst_req_temp;
     subsystem_rst_req_edge_delay <= subsystem_rst_req_edge;
end
assign subsystem_rst_req_edge_long = subsystem_rst_req_edge || subsystem_rst_req_edge_delay;

always @(posedge clk_sys) begin
     initiate_rst_req_rdy_i <= initiate_rst_req_rdy_temp;
     initiate_rst_req_rdy_edge <= initiate_rst_req_rdy_i ^ initiate_rst_req_rdy_temp;
     initiate_rst_req_rdy_edge_delay <= initiate_rst_req_rdy_edge;
end
assign initiate_rst_req_rdy_edge_long = initiate_rst_req_rdy_edge || initiate_rst_req_rdy_edge_delay;
 
assign subsystem_rst_req_temp = initiate_warmrst_req; 
assign initiate_rst_req_rdy_temp = subsystem_rst_rdy;

always @* begin
    if (ninit_done) 
       subsystem_rst_req = 0;
    else if (  (subsystem_rst_req_i == 1) && (n_cycle_count_to_subsystem_rst_req_release == N_CYCLE_TO_RELEASE_RST_REQ) ) 
	subsystem_rst_req = subsystem_rst_req_i;
    else if (pcie_warm_rst_n == 0) 
        subsystem_rst_req = 0;
end

always @* begin
    if (ninit_done) 
        initiate_rst_req_rdy = 0;
    else if ( (initiate_rst_req_rdy_i == 1) && (n_cycle_count_to_initiate_rst_req_rdy_release == N_CYCLE_TO_RELEASE_RST_REQ_RDY) ) 
	initiate_rst_req_rdy = initiate_rst_req_rdy_i;
    else if (pcie_warm_rst_n == 0) 
        initiate_rst_req_rdy = 0;
end


   //counting to subsystem_rst_req release
   always_ff @(posedge clk_sys ) begin : proc_cycle_count_to_subsystem_rst_req_release
      if(ninit_done) begin
          n_cycle_count_to_subsystem_rst_req_release <= 0;
      end
      else begin
         if (subsystem_rst_req_edge_long || ( n_cycle_count_to_subsystem_rst_req_release != 0 && n_cycle_count_to_subsystem_rst_req_release != N_CYCLE_TO_RELEASE_RST_REQ) )  //count until 20
            n_cycle_count_to_subsystem_rst_req_release <= n_cycle_count_to_subsystem_rst_req_release[4:0] + 1;
         else
            n_cycle_count_to_subsystem_rst_req_release <= 0;
      end
   end

   //counting to initiate_rst_req_rdy release
   always_ff @(posedge clk_sys ) begin : proc_cycle_count_to_initiate_rst_req_rdy_release
      if(ninit_done) begin
          n_cycle_count_to_initiate_rst_req_rdy_release <= 0;
      end
      else begin
         if (initiate_rst_req_rdy_edge_long || ( n_cycle_count_to_initiate_rst_req_rdy_release != 0 && n_cycle_count_to_initiate_rst_req_rdy_release != N_CYCLE_TO_RELEASE_RST_REQ_RDY) )  //count until 20
            n_cycle_count_to_initiate_rst_req_rdy_release <= n_cycle_count_to_initiate_rst_req_rdy_release[4:0] + 1;
         else
            n_cycle_count_to_initiate_rst_req_rdy_release <= 0;
      end
   end



//------------------
// FIM reset
//    Activate FIM reset when reset input is active
//    Wait for PCIe reset to be released
//    Release FIM reset
//------------------
always_ff @(posedge clk_sys) begin
   if (~rst_n_sync) begin
      fim_rst_n  <= 1'b0;
   end else begin
      if (~fim_rst_n && pcie_rst_release) begin
         fim_rst_n <= 1'b1;
      end
   end
end

//--------------------------------------------------------------------------
// Reset output
//--------------------------------------------------------------------------

// PCIe cold/warm reset
assign pcie_cold_rst_n = pcie_rst_n;
assign pcie_warm_rst_n = pcie_rst_n;

// FIM reset synchronous to clk_sys
fim_resync #(
   .SYNC_CHAIN_LENGTH(3),
   .WIDTH(1),
   .INIT_VALUE(0),
   .NO_CUT(1)
) rst_clk_sys_resync (
   .clk   (clk_sys),
   .reset (~rst_n | ~fim_rst_n),
   .d     (1'b1),
   .q     (rst_n_sys)
);

// FIM reset synchronous to clk_100m 
fim_resync #(
   .SYNC_CHAIN_LENGTH(3),
   .WIDTH(1),
   .INIT_VALUE(0),
   .NO_CUT(1)
) rst_clk100m_resync (
   .clk   (clk_100m),
   .reset (~rst_n | ~fim_rst_n),
   .d     (1'b1),
   .q     (rst_n_100m)
);

// FIM power good reset synchronous to clk_sys
fim_resync #(
   .SYNC_CHAIN_LENGTH(3),
   .WIDTH(1),
   .INIT_VALUE(0),
   .NO_CUT(1)
) pwr_good_n_resync (
   .clk   (clk_sys),
   .reset (~pll_locked | ninit_done),
   .d     (1'b1),
   .q     (pwr_good_n)
);

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63cdCXTL+lUPryVikgkmAz7yjW/vUQ2RGxHQygbl7QokfPJYs3941Kg35yzrFSi4mF/YvS6+2jtxhsx+57NPnQgYp8GNH2MSVEaxoA91We6LTe1xyvycHT9UP3LMCeZUsltIwO1OZm7lxXYAR4y65oLSI2Uh8jLg1d2t2QjfJ8/RfBYQ+UYLu9Th5V/N8j0eD/6LjZXVvnjaV5nxSxD5PKkdmkqM3d5NCOaNAmg579+FzqlrvCFx2O0S4okGvfZVlZPixRPAfkA5UR9+MzJcldJkCiK0Kemx3yVCpUYOR6ZoOsvwT0Aba+Uvqo+1tNHE2MEBLZhGZ1oDhgSfTSV+URAah1K8T87IliDgmNrAGHYngrU9cCi1KMjQBtWbUsR0e6oeA1tF/BXje6ehYFYVSm/6Lto9bg3EkfAMZGP6U/5g5sA4rplxFDxlWCIVRr63fvCP2tnC5HO/IqYaIyUBb6y78pJqUDn1wL/ZmnFLBxGg50aQzx187wDWCxIGcjFsNl2Jz9ZuaxuJ9fXZAOt7gzgduKY2u40vzTdS6I/tbwbuFC6zu9MZ38v69B6IPVsHYR7crC+PyiUN+1mx4tU0A+qLxQaAJvGVT9kS2SoPriorOsRGiRlC7wA87WcKJVmTxRdgesRoNF4+ZTG8ObCc9t0erOomSjh5e9S/OG8QZeJmzNGqzYY/djIcrjau5aOimaMhvyOBSL1GKQKcEIYnN5b9E8VRA8XGe6ZRYBwbu1qQFIoMnhDsqY3RV3/txp/Sbq6w7pv+terZehkPM6UIXuHa"
`endif