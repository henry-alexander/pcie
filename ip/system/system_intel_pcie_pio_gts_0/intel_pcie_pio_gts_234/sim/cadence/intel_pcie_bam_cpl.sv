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


//----------------------------------------------------------------------------- 
//  Project Name:  avmm_bridge_512_g4                                   
//  Module Name :  intel_pcie_bam_cpl                                 
//  Author      :  jjshou                                   
//  Date        :  Mon Aug 26, 2017                                 
//  Description :  This module is to generate/form the completion packets to the read
//                 requests received on PCIe side
//-----------------------------------------------------------------------------

// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module intel_pcie_bam_cpl
    (
     input                clk,
     input                rst_n,

     // TX CPL command FIFO
     output logic         cplcmd_fifo_rdreq_o,
     input [79:0]         cplcmd_fifo_data_i,
     input                cplcmd_fifo_empty_i,
     
     // Interface to completion data buffer
     output logic         cpl_buf_rdreq_o,
     input [512:0]        cpl_buf_data_i,
     input                cpl_buff_wrreq_i,  

     // Interface to TX output FIFO (header/data)

     input   [8:0]        tx_data_buff_rd_addr_i,
     output  [513:0]      tx_data_buff_o,
     input                tx_hdr_fifo_rreq_i,  
     output  [96:0]       tx_hdr_fifo_rdata_o, 
     output               tx_hdr_fifo_empty_o,  
     
     input [12:0]         busdev_num_i

     );


  localparam [1:0]                      CPL_IDLE       = 2'b00;
  localparam [1:0]                      CPL_SEND       = 2'b01;
  localparam [1:0]                      CPL_RD_XTRA    = 2'b10;      

logic              srst_reg;
logic   [1:0]      cpl_state; 
logic   [1:0]      cpl_nxt_state;
logic              cpl_idle_state;  
logic              cpl_send_state;  
logic              cpl_rdxtra_state;
logic              pop_cmd_fifo; 
logic    [3:0]     pcie_lines_cntr;
logic    [8:0]     cpl_buff_lines_available_reg; 
logic              cpl_data_available;
logic              cpl_buf_rd; 
logic   [511:0]    cpl_data_reg3;
logic   [511:0]    cpl_data_reg4;
logic   [1203:0]   cpl_data_mux;
logic   [511:0]    cpl_data_reg5;
logic              sop_reg1; 
logic              sop_reg2; 
logic              sop_reg3; 
logic              sop_reg4; 
logic              sop_reg5; 
logic              eop_reg2; 
logic              eop_reg3; 
logic              eop_reg4; 
logic              eop_reg5; 
logic              tx_data_buff_wr_reg2; 
logic              tx_data_buff_wr_reg3; 
logic              tx_data_buff_wr_reg4; 
logic              tx_data_buff_wr_reg5; 
logic   [79:0]     cmd_reg; 
logic   [9:0]      cpl_len;    
logic   [5:0]      cpl_td_attr; 
logic   [7:0]      cpl_tc;      
logic   [7:0]      cpl_cmd;     
logic   [11:0]     cpl_byte_count; 
logic   [3:0]      cpl_stat_bcm; 
logic   [15:0]     cpl_cpltr_id;
logic   [7:0]      cpl_lower_addr; 
logic   [7:0]      cpl_tag;
logic   [15:0]     cpl_reqster_id;
logic   [95:0]     cpl_hdr_reg2; 
logic   [95:0]     cpl_hdr_reg3; 
logic   [95:0]     cpl_hdr_reg4; 
logic   [95:0]     cpl_hdr_reg5; 
logic   [8:0]      tx_data_buf_wr_addr; 
logic   [3:0]      avmm_lines_cntr;
logic   [3:0]      avmm_lines_reg;
logic   [7:0]      dw_len_reg;      
logic   [5:0]      cpl_addr_reg2;
logic   [5:0]      cpl_addr_reg3;
logic   [5:0]      cpl_addr_reg4;
logic   [6:0]      bam_np_hdr_credit;    
logic   [8:0]      shiftright_index;


logic             cpl_vf_active;
logic             cpl_vf_active_reg2;      
logic             cpl_vf_active_reg3; 
logic             cpl_vf_active_reg4; 
logic             cpl_vf_active_reg5;
logic             cpl_buff_wrreq_reg;
logic             cpl_buff_wrreq_reg2;
logic             cpl_buff_wrreq_reg3;
logic             cpl_buff_wrreq_reg4;
logic             tx_cpl_hdr_fifo_almost_full;


always_ff @(posedge clk) 
  begin
    srst_reg        <= ~rst_n;
  end  
 
/// AVMM state machine
always_ff @(posedge clk) 
    if (srst_reg) 
      cpl_state[1:0]       <= CPL_IDLE;
   else 
      cpl_state[1:0]       <= cpl_nxt_state;  
 
 always_comb 
    case(cpl_state) 
      CPL_IDLE: 
        if(~cplcmd_fifo_empty_i & cpl_data_available & ~tx_cpl_hdr_fifo_almost_full)   // pop cmd fifo here
          cpl_nxt_state = CPL_SEND; 
        else 
          cpl_nxt_state = CPL_IDLE;
      
      CPL_SEND:
        if(pcie_lines_cntr == 4'h1 & avmm_lines_cntr == 4'h1)
          cpl_nxt_state = CPL_IDLE;
        else if(pcie_lines_cntr == 4'h1)
          cpl_nxt_state = CPL_RD_XTRA;
        else
          cpl_nxt_state = CPL_SEND;
       
       CPL_RD_XTRA:
          cpl_nxt_state = CPL_IDLE;
      
      default: 
        cpl_nxt_state = CPL_IDLE;
    endcase  
  
always_ff @(posedge clk)
 begin 
  dw_len_reg[7:0] <= cplcmd_fifo_data_i[7:0];
  avmm_lines_reg[3:0] <= cplcmd_fifo_data_i[62:59];
 end

 assign cpl_idle_state   = (cpl_state == CPL_IDLE);
 assign cpl_send_state   = (cpl_state == CPL_SEND);
 assign cpl_rdxtra_state = (cpl_state == CPL_RD_XTRA);
 
 assign pop_cmd_fifo = cpl_idle_state & ~cplcmd_fifo_empty_i & cpl_data_available & ~tx_cpl_hdr_fifo_almost_full;
 assign cplcmd_fifo_rdreq_o =  pop_cmd_fifo;
 always_ff @(posedge clk)
   if(pop_cmd_fifo) 
      pcie_lines_cntr[3:0] <= (|dw_len_reg[3:0])?  dw_len_reg[7:4] + 1'b1 : dw_len_reg[7:4];
    else if(cpl_send_state)
      pcie_lines_cntr[3:0] <= pcie_lines_cntr[3:0] - 1'b1;
 
 always_ff @(posedge clk)
   if(pop_cmd_fifo) 
      avmm_lines_cntr[3:0] <= avmm_lines_reg;
    else if(cpl_send_state)
      avmm_lines_cntr[3:0] <= avmm_lines_cntr[3:0] - 1'b1;
 
 
/// cpl buffer data availble check
 always_ff @(posedge clk) 
    if(srst_reg) 
      cpl_buff_lines_available_reg <= 9'h0;
    else if(cpl_buff_wrreq_reg4 & ~cpl_buf_rd)
      cpl_buff_lines_available_reg <= cpl_buff_lines_available_reg + 1'b1;
    else if(~cpl_buff_wrreq_reg4 & cpl_buf_rd)
      cpl_buff_lines_available_reg <= cpl_buff_lines_available_reg - 1'b1;

    assign cpl_data_available = (cpl_buff_lines_available_reg[8:0] >= {5'h0,avmm_lines_reg[3:0]}) & avmm_lines_reg[3:0] != 4'h0; // at reset this is true
 
    assign cpl_buf_rd = cpl_send_state | cpl_rdxtra_state;
    

/// 
 always_ff @(posedge clk) 
   begin
     cpl_buff_wrreq_reg <= cpl_buff_wrreq_i;
     cpl_buff_wrreq_reg2 <= cpl_buff_wrreq_reg;
     cpl_buff_wrreq_reg3 <= cpl_buff_wrreq_reg2;
     cpl_buff_wrreq_reg4 <= cpl_buff_wrreq_reg3;
   end
   


assign cpl_buf_rdreq_o = cpl_buf_rd;
//// Data Pipeline
 always_ff @(posedge clk) 
   begin
   	 cpl_data_reg3[511:0] <= cpl_buf_data_i[511:0];
   	 cpl_data_reg4[511:0] <= cpl_data_reg3[511:0];
   end
 always_ff @(posedge clk) 
   begin
    cpl_addr_reg2[5:0] <= cmd_reg[31:26];
    cpl_addr_reg3[5:0] <= cpl_addr_reg2;
    cpl_addr_reg4[5:0] <= cpl_addr_reg3;
   end
    
 assign shiftright_index = {cpl_addr_reg4[5:2],5'h0};
 
 assign cpl_data_mux[1023:0] = {cpl_data_reg3[511:0], cpl_data_reg4[511:0]} >> shiftright_index;
 always_ff @(posedge clk) 
     cpl_data_reg5[511:0] <=  cpl_data_mux[511:0];
  
  /// SOP EOP
  always_ff @(posedge clk) 
    begin
    	sop_reg1 <= pop_cmd_fifo;
    	sop_reg2 <= sop_reg1; 
      sop_reg3 <= sop_reg2;
      sop_reg4 <= sop_reg3;
      sop_reg5 <= sop_reg4;
      
      eop_reg2 <= cpl_send_state & pcie_lines_cntr == 4'h1;
      eop_reg3 <= eop_reg2; 
      eop_reg4 <= eop_reg3;
      eop_reg5 <= eop_reg4;
    
      tx_data_buff_wr_reg2 <= cpl_send_state;
      tx_data_buff_wr_reg3 <= tx_data_buff_wr_reg2;
      tx_data_buff_wr_reg4 <= tx_data_buff_wr_reg3;
      tx_data_buff_wr_reg5 <= tx_data_buff_wr_reg4;
          
    end

/// header pipeline

  always_ff @(posedge clk) 
    if(pop_cmd_fifo)
      cmd_reg[79:0] <= cplcmd_fifo_data_i;
  
  assign cpl_len[9:0]     = {2'b00, cmd_reg[7:0]};
  assign cpl_td_attr[5:0] = {1'b0,cmd_reg[10:8], 2'b00};
  assign cpl_tc[7:0]      = (cmd_reg[42] || cmd_reg[41]) ? {cmd_reg[42],cmd_reg[13:11],cmd_reg[41],3'h0} : {1'b0,cmd_reg[13:11],4'h0};
  assign cpl_cmd[7:0]     = 8'h4A;
  assign cpl_byte_count[11:0] = cmd_reg[25:14];
  assign cpl_stat_bcm[3:0]    = 4'h0;
  assign cpl_lower_addr[7:0] =  {1'b0, cmd_reg[32:26]};
  assign cpl_tag[7:0]  = cmd_reg[40:33];
  assign cpl_reqster_id[15:0] =  cmd_reg[58:43];
  assign cpl_cpltr_id[15:0] = cmd_reg[78:63];
  assign cpl_vf_active      = cmd_reg[79];
  
  
   always_ff @(posedge clk) 
     begin
       cpl_hdr_reg2[95:0] <=   {cpl_reqster_id[15:0], cpl_tag[7:0], cpl_lower_addr[7:0],
                               cpl_cpltr_id[15:0], cpl_stat_bcm[3:0], cpl_byte_count[11:0],
                               cpl_cmd[7:0], cpl_tc[7:0], cpl_td_attr[5:0], cpl_len[9:0]};
       
       cpl_hdr_reg3[95:0] <=  cpl_hdr_reg2[95:0];
       cpl_hdr_reg4[95:0] <=  cpl_hdr_reg3[95:0];
       cpl_hdr_reg5[95:0] <=  cpl_hdr_reg4[95:0];    
       
       cpl_vf_active_reg2 <=    cpl_vf_active;
       cpl_vf_active_reg3 <= cpl_vf_active_reg2;      
       cpl_vf_active_reg4 <= cpl_vf_active_reg3; 
       cpl_vf_active_reg5 <= cpl_vf_active_reg4;           
     end  
  
  
        
 /// tx cmd fifo
   scfifo tx_cpl_hdr_fifo  
       (
        .clock       (clk                ),
        .data        ({cpl_vf_active_reg5, cpl_hdr_reg5[95:0]}  ),
        .rdreq       (tx_hdr_fifo_rreq_i   ),
        .wrreq       (eop_reg5   ),
        .full        (  ),
        .q           (tx_hdr_fifo_rdata_o  ),
        .empty       (tx_hdr_fifo_empty_o  ),
        .sclr        (srst_reg             ),
        .usedw       (  ),
        .almost_full      (tx_cpl_hdr_fifo_almost_full),
        .aclr             (1'b0),
        .almost_empty     (),
        .eccstatus       ());
    defparam
      tx_cpl_hdr_fifo.add_ram_output_register  = "ON",
      tx_cpl_hdr_fifo.enable_ecc  = "FALSE",
      tx_cpl_hdr_fifo.intended_device_family  = "Stratix 10",
      tx_cpl_hdr_fifo.lpm_hint  = "AUTO",
      tx_cpl_hdr_fifo.almost_full_value  = 32,
      tx_cpl_hdr_fifo.lpm_numwords  = 64,
      tx_cpl_hdr_fifo.lpm_showahead  = "ON",
      tx_cpl_hdr_fifo.lpm_type  = "scfifo",
      tx_cpl_hdr_fifo.lpm_width  = 97,
      tx_cpl_hdr_fifo.lpm_widthu  = 6,
      tx_cpl_hdr_fifo.overflow_checking  = "ON",
      tx_cpl_hdr_fifo.underflow_checking  = "ON",
      tx_cpl_hdr_fifo.use_eab  = "ON"; 

/// Tx data buffer
 always_ff @(posedge clk) 
    if(srst_reg) 
      tx_data_buf_wr_addr[8:0] <= 9'h0;
    else if(tx_data_buff_wr_reg5)
      tx_data_buf_wr_addr[8:0] <= tx_data_buf_wr_addr[8:0] + 1'b1;


 altsyncram
        #(
          .intended_device_family("Stratix 10"),
          .operation_mode("DUAL_PORT"),
          .width_a(514),
          .widthad_a(9),
          .numwords_a(512),
          .width_b(514),
          .widthad_b(9),
          .numwords_b(512),
          .lpm_type("altsyncram"),
          .width_byteena_a(1),
          .outdata_reg_b("UNREGISTERED"),
          .indata_aclr_a("NONE"),
          .wrcontrol_aclr_a("NONE"),
          .address_aclr_a("NONE"),
          .address_reg_b("CLOCK0"),
          .address_aclr_b("NONE"),
          .outdata_aclr_b("NONE"),
          .power_up_uninitialized("FALSE"),
          .ram_block_type("AUTO"),
          .read_during_write_mode_mixed_ports("OLD_DATA")
        )

    tx_cpl_data_buff (
                   .wren_a (tx_data_buff_wr_reg5),
                   .clocken1 (),
                   .clock0 (clk),
                   .clock1 (),
                   .address_a (tx_data_buf_wr_addr[8:0]),
                   .address_b (tx_data_buff_rd_addr_i[8:0]),
                   .data_a ({eop_reg5,sop_reg5,cpl_data_reg5}),
                   .q_b (tx_data_buff_o),
                   .aclr0 (),
                   .aclr1 (),
                   .addressstall_a (),
                   .addressstall_b (),
                   .byteena_a (),
                   .byteena_b (),
                   .clocken0 (),
                   .data_b (),
                   .q_a (),
                   .rden_b (),
                   .wren_b ()
                   );

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "0W4IZZenfvRvq3QID7i6bS3EFPcamqhGvZLHdCHo5F6odw9cAFb3cnVUy+y2ewTO72z4KxkvyZbaDusbM0rZ2bbFUdg2UFDVCJiQLxDA9EXmv6JsU8j4vv+eVyYuL2gJpLV/drFASF0zhcUjqLsKJ2Csj6rUSMeqMmuXpZPRtbrSgl4X+AUA8KvZwQ/bOAJStUrbLgQfK0oohamXW+aRBLUufXmJW2oD5H6S5Gs3IBY/d9mPrkTcqR4XXhQKUADLEsbzW+9RpI6IBXYewPxHby52K2OoGJShew2SZc5L4o6IciA9zZAgfgwN0SSWRDHiUb16POgRl2/Uorj6kZ0108AnHLnQRv37NcydlXnum2ost3KyBpFEiwxTDDiDAvi4US++Im5GnYynN0tDfg8RlUnkFuUb9s2Y+ThauP70NwPt1O7mnwZXE29LzupYvZ10MgRciD4sEEnPNT39ayq1e9b5sSDQXqwhyxlEXfpcVQmkBzRtqmdR6J65qGMt3UNuhp1glBjJ4z9FnStJrwwnVClbbNlt7H0iNQV9MVuU3Zg+46I4DP70l8tgHJ8qRTs43yx/TxpXo9LZVi6jvdMLyq1La6vvZgCKswNAN9zTDx4SSAye5M3rhTkSlmHwsrQfAFS6U+MV+1xqBPOaVUnlUxO9cVCQz547z9W/cxPgLNbH9RgV1Cy/bq4ILMgTunDTJo+xuEetQcrsXg8paACKNbqyl1Zjv8N0H9d73slmxjg0fpr4U8zWMB6aqr4xdPk7jQyyiODCL9jaBgsm5NaycoIAS6vh++iTTHbAzIBr6YCTqa7axBautvx89T448R+vuVGNrsIq5RZRy9gWBtfM7a2eR7L59mM4v2Yt+46L3LPm4iiQinisc7fWlxJRbJULNwkp3qDYmxx2j/7XmRrM3szccB0yxGsAZOsKdbxaWyIKi2zJHdkOwZVolaq9QCDkL12CsmUCaBNMjp/AuNpH1+RvFm7hF+eiDkHu/grCdpPOjlmw9Fsl3IWxGjafRaSL"
`endif