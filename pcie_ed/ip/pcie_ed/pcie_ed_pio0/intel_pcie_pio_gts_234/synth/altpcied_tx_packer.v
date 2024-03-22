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


// (C) 2001-2021 Intel Corporation. All rights reserved.
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


/* Author :   Abu Bakar Ismail
 * Date   :   Sept 14, 2020
 * Tx packer is to sort between data and header from AXI-S into AVST.
 * All buffering need will be done here.
 * tx packer fifo will store at least 1 header and tlast in the fifo + upsize buffer
 * the fifo will store the header and data according to simple packing scheme, 1 header per row
 */

module altpcied_tx_packer #(
    parameter DWIDTH = 512,
    parameter payload_width   = 512, // default use 1x16 value - AVST
    parameter hdr_width       = 256, //default use 1x16 value
    parameter pfx_width       = 32, //default use 1x16 value
    parameter pcie_link_width = "x16",
    parameter double_width    = 2, //default use 1x16 value
    parameter SS_PWIDTH       = 32,
    parameter SS_SLOT_WD      = 5,
    parameter SS_PF_WD        = 3,
    parameter SS_VF_WD        = 11,
    parameter SEGMENT_SIZE    = 16, // 16 Bytes - 128 bit per segment, there will also be 32 B - 256 bits per segment
    parameter Header_Packing_scheme = "Simple", // Simple, Variable, Compact
    parameter TILE            = "P-TILE",
    parameter device_family   = "Stratix 10"
) (
  input   clk,
  input   reset_n,
  input   [DWIDTH - 1:0]      axi_s_fifo_tdata,
  input                       axi_s_fifo_tvalid,
  input   [DWIDTH/128 - 1:0]  axi_s_fifo_tkeep,
  input                       axi_s_fifo_tlast,
  input   [1:0]               axi_s_fifo_tuser_vendor, // modes - power user or DM
  input   [7:0]               axi_s_fifo_tuser, // tlast segment
  output  [payload_width - 1:0]   tx_data,
  output  [255:0]             tx_header,  // x8 - 128, x16 - 256
  input                       tx_st_ready,
  output                      tx_packer_ready,
  output                      tx_st_valid_hdr,
  output  [double_width-1:0]  tx_st_valid,
  output  [double_width-1:0]  tx_st_sop,
  output  [double_width-1:0]  tx_st_eop,
  output                      dm_pwruser_mode    // data mover power user mode: 1 - dm, 0 - pwruser   
);
localparam SC_FIFO_DWIDTH = (DWIDTH == 512 && payload_width == 512) ? 512 : 1024; //To improve performance, keep internal SCFIFO width as 512, only if both dwidth and payload_width is 512.
localparam SC_TX_PACKER_WIDTH = SC_FIFO_DWIDTH + 2*SC_FIFO_DWIDTH/128 + SC_FIFO_DWIDTH/256; //data width + (eop width + tkeep width) + tlast width
localparam IN_TO_FIFO_MULT = 1024/DWIDTH; //SC_FIFO_DWIDTH/DWIDTH;
localparam OUT_TO_FIFO_MULT = 1024/payload_width; //SC_FIFO_DWIDTH/payload_width;
localparam PIPELINE_WIDTH = 1+1+256+payload_width+1+1+1; //tx_st_sop_i,tx_st_eop_i,tx_header_i,tx_data_i,tx_xfer_hdr,hold_xfer,data_gt_256 

// Internal reg / wires
reg                                     prev_eop_reg;
reg   [5:0]                             rd_tlast;
reg   [5:0]                             tlast_count;
reg   [$clog2(OUT_TO_FIFO_MULT) - 1:0]  xfer_count_i;
reg   [payload_width - 1:0]             tx_data_r;
reg					tx_xfer_data_prev;
reg					tx_xfer_hdr_prev;
reg					tx_st_eop_i_prev;

wire					tx_st_eop_i_or;
wire  [$clog2(OUT_TO_FIFO_MULT) - 1:0]  xfer_count;
wire  [payload_width - 1:0]             tx_data_i;
wire                                    hold_xfer;
wire                                    tx_xfer_hdr;
wire                                    tx_xfer_hdr_or;
wire                                    tx_xfer_data;
wire                                    data_gt_256;
wire                                    tx_xfer_hdr_data;
wire                                    s0_hdr_format, s1_hdr_format; // 0: power user mode, 1: data mover mode
wire  [255:0]                           tx_header_i;
wire                                    tx_st_valid_data_i;
wire                                    tx_st_valid_data_i_p;
wire                                    tx_st_valid_hdr_i;
wire                                    tx_st_sop_i, tx_st_eop_i;
wire  					tx_st_sop_i_p;

// SC FIFO    
reg                                     sc_fifo_wrfull_r;
reg                                     upbuff_valid;
reg                                     un_stored_data;
reg                                     sc_fifo_rdreq_r;
reg   [$clog2(DWIDTH/(16*8))-1:0]       eop_seg; // based on 16B per segment. For 32B segment, divide it by 2.
                                                   // 1024b & 16 - 8, 1024 & 32 - 4, 512 & 16 - 4, 512 & 32 - 2
reg                                     nxt_hdr; // means got another header from that cycle, pack in the same row if possible
reg   [DWIDTH/256 - 1:0]                tlast_256b; // normalized to 256b
reg                                     found_tlast;

wire  [SC_TX_PACKER_WIDTH-1:0]          sc_fifo_in_data;
wire  [SC_TX_PACKER_WIDTH-1:0]          sc_fifo_out_data;
wire  [1024-1:0]              sc_fifo_out_tdata;
wire  [1024-1:0]              tdata_2_fifo_up;
wire  [1024/128 - 1:0]        eop_seg_2_fifo;
wire  [1024/128 - 1:0]        sc_fifo_out_eop_seg;
wire  [1024/128 - 1:0]        tkeep_2_fifo_up;
wire  [1024/128 - 1:0]        sc_fifo_out_tkeep;
wire                                    sc_fifo_rdreq, sc_fifo_wrreq; 
wire                                    sc_fifo_rdempty, sc_fifo_wrfull;
wire                                    sc_fifo_wr_almost_full;
wire  [1024/256 - 1:0]        tlast_2_fifo_up;  // normalized to 256b
wire  [1024/256 - 1:0]        sc_fifo_out_tlast;// normalized to 256b
wire                                    sc_fifo_out_tvalid;
wire                                    ready_to_xfer;
wire                                    last_tlast;
wire 					tx_st_ready_i;

reg   [DWIDTH - 1:0]                    upsize_data   [0:IN_TO_FIFO_MULT - 1];
reg   [DWIDTH/128 - 1:0]                upsize_tkeep  [0:IN_TO_FIFO_MULT - 1];
reg   [DWIDTH/128 - 1:0]                upsize_eop_seg[0:IN_TO_FIFO_MULT - 1];
reg   [DWIDTH/256 - 1:0]                upsize_tlast  [0:IN_TO_FIFO_MULT - 1];  // normalized to 256b
reg   [$clog2(IN_TO_FIFO_MULT) - 1: 0]  count_upsize;
reg   [SC_TX_PACKER_WIDTH - 1:0]        upsize_buffer;

wire   [payload_width- 1:0]              tx_data_i_p;
//reg                                     tx_st_valid_data_i_p;
//reg                                     tx_st_sop_i_p;
wire                                     tx_st_eop_i_p;
wire   [255:0]                           tx_header_i_p;
wire                                     tx_xfer_hdr_p;
wire                                     hold_xfer_p;
wire                                     data_gt_256_p;
wire					 wr_tlast;
wire					 wr_tlast_512;

//assign s0_hdr_format = axi_s_fifo_tuser_vendor[0]; // 0: power user mode, 1: data mover mode
//assign s1_hdr_format = axi_s_fifo_tuser_vendor[1]; // 0: power user mode, 1: data mover mode

integer i;
genvar gi;

// Decode tlast base on tuser
generate
if (Header_Packing_scheme == "Simple")
begin
  // eop is based on tlast and tkeep
  if (DWIDTH == 256)
  begin
    always @(*)
    begin
      case ({axi_s_fifo_tlast, axi_s_fifo_tkeep})
      3'b101: begin eop_seg = 1'b0; nxt_hdr = 1'b0; tlast_256b = 1'b1; end
      3'b111: begin eop_seg = 1'b1; nxt_hdr = 1'b0; tlast_256b = 1'b1; end
      default: begin eop_seg = 1'b0; nxt_hdr = 1'b0; tlast_256b = 1'b0; end
      endcase
    end
  end
  else if (DWIDTH == 512)
  begin
    always @(*)
    begin
      case ({axi_s_fifo_tlast, axi_s_fifo_tkeep})
      5'b10001: begin eop_seg = 2'b00; nxt_hdr = 1'b0; tlast_256b = 2'b01; end
      5'b10011: begin eop_seg = 2'b01; nxt_hdr = 1'b0; tlast_256b = 2'b01; end
      5'b10111: begin eop_seg = 2'b10; nxt_hdr = 1'b0; tlast_256b = 2'b10; end
      5'b11111: begin eop_seg = 2'b11; nxt_hdr = 1'b0; tlast_256b = 2'b10; end
      default: begin eop_seg = 2'b00; nxt_hdr = 1'b0; tlast_256b = 2'b00; end
      endcase
    end
  end
  else if (DWIDTH == 1024)
  begin
    always @(*)
    begin
      case ({axi_s_fifo_tlast, axi_s_fifo_tkeep})
      9'h101: begin eop_seg = 3'h0; nxt_hdr = 1'b0; tlast_256b = 4'h1; end
      9'h103: begin eop_seg = 3'h1; nxt_hdr = 1'b0; tlast_256b = 4'h1; end
      9'h107: begin eop_seg = 3'h2; nxt_hdr = 1'b0; tlast_256b = 4'h2; end
      9'h10f: begin eop_seg = 3'h3; nxt_hdr = 1'b0; tlast_256b = 4'h2; end
      9'h11f: begin eop_seg = 3'h4; nxt_hdr = 1'b0; tlast_256b = 4'h4; end
      9'h13f: begin eop_seg = 3'h5; nxt_hdr = 1'b0; tlast_256b = 4'h4; end
      9'h17f: begin eop_seg = 3'h6; nxt_hdr = 1'b0; tlast_256b = 4'h8; end
      9'h1ff: begin eop_seg = 3'h7; nxt_hdr = 1'b0; tlast_256b = 4'h8; end
      default: begin eop_seg = 3'h0; nxt_hdr = 1'b0; tlast_256b = 4'h0; end
      endcase
    end
  end
end
else if (Header_Packing_scheme == "Variable" || Header_Packing_scheme == "Compact")
begin: variable_compact_packing_scheme
  // MAX one header per cycle, but can also be half header - (hdr = 256b)
  // segment boundary - 16B / 32B, segmented_tkeep is 128b boundary
  // tuser[?:0] - if 1 indicate packet end on it's segment (with tlast)
  // header start on next segment if tkeep is valid
  // Task: find the header start segment. 
  // IF tuser == 'h0, header start at segment 0.
  //    tuser == 'h1, header start at segment 1, end of packet at segment 0.
  //    tuser == 'h2, header start at segment 2, end of packet at segment 1.
  //    tuser == 'h40, header start at segment 7, end of packet at segment 6.
  //    tuser == 'h80, header start at segment 0, end of packet at segment 7.
  // MAX of 2 header per cycle (hdr = 256b) for compact packing scheme

    if (DWIDTH == 256)
    begin
      always @(*)
      begin
        case ({axi_s_fifo_tlast, axi_s_fifo_tuser[1:0], axi_s_fifo_tkeep[1:0]}) // only valid when tlast=1
        5'b10101: begin eop_seg = 1'b0; nxt_hdr = 1'b0; tlast_256b = 1'b1; end
        5'b10111: begin eop_seg = 1'b0; nxt_hdr = 1'b1; tlast_256b = 1'b1; end
        5'b11011: begin eop_seg = 1'b1; nxt_hdr = 1'b0; tlast_256b = 1'b1; end
        default:begin eop_seg = 1'b0;  nxt_hdr = 1'b0;  tlast_256b = 1'b0; end
        endcase
      end
    end
    else if (DWIDTH == 512)
    begin
      always @(*)
      begin
        casez ({axi_s_fifo_tlast, axi_s_fifo_tuser[3:0], axi_s_fifo_tkeep[3:0]})
        9'b100010001: begin eop_seg = 2'b00; nxt_hdr = 1'b0;  tlast_256b = 2'b01; end
        9'b10001zz11: begin eop_seg = 2'b00; nxt_hdr = 1'b1;  tlast_256b = 2'b01; end
        9'b100100011: begin eop_seg = 2'b01; nxt_hdr = 1'b0;  tlast_256b = 2'b01; end
        9'b100101111: begin eop_seg = 2'b01; nxt_hdr = 1'b1;  tlast_256b = 2'b01; end // hdr need 256b
        9'b101000111: begin eop_seg = 2'b10; nxt_hdr = 1'b0;  tlast_256b = 2'b10; end
        9'b101001111: begin eop_seg = 2'b10; nxt_hdr = 1'b1;  tlast_256b = 2'b10; end // portion of hdr in last segment
        9'b110001111: begin eop_seg = 2'b11; nxt_hdr = 1'b0;  tlast_256b = 2'b10; end
        default: begin eop_seg = 2'b00; nxt_hdr = 1'b0;  tlast_256b = 2'b00; end
        endcase
      end
    end
    else if (DWIDTH == 1024)
    begin
      always @(*)
      begin
        casez ({axi_s_fifo_tlast, axi_s_fifo_tuser[7:0], axi_s_fifo_tkeep[7:0]})
        17'b1_00000001_00000001: begin eop_seg = 3'h0; nxt_hdr = 1'b0; tlast_256b = 4'h1;  end
        17'b1_00000001_zzzzz111: begin eop_seg = 3'h0; nxt_hdr = 1'b1; tlast_256b = 4'h1;  end  // hdr need 256b
        17'b1_00000010_00000011: begin eop_seg = 3'h1; nxt_hdr = 1'b0; tlast_256b = 4'h1;  end
        17'b1_00000010_zzzz1111: begin eop_seg = 3'h1; nxt_hdr = 1'b1; tlast_256b = 4'h1;  end  // hdr need 256b
        17'b1_00000100_00000111: begin eop_seg = 3'h2; nxt_hdr = 1'b0; tlast_256b = 4'h2;  end
        17'b1_00000100_zzz11111: begin eop_seg = 3'h2; nxt_hdr = 1'b1; tlast_256b = 4'h2;  end  // hdr need 256b
        17'b1_00001000_00001111: begin eop_seg = 3'h3; nxt_hdr = 1'b0; tlast_256b = 4'h2;  end
        17'b1_00001000_zz111111: begin eop_seg = 3'h3; nxt_hdr = 1'b1; tlast_256b = 4'h2;  end  // hdr need 256b
        17'b1_00010000_00011111: begin eop_seg = 3'h4; nxt_hdr = 1'b0; tlast_256b = 4'h4;  end
        17'b1_00010000_z1111111: begin eop_seg = 3'h4; nxt_hdr = 1'b1; tlast_256b = 4'h4;  end  // hdr need 256b
        17'b1_00100000_00111111: begin eop_seg = 3'h5; nxt_hdr = 1'b0; tlast_256b = 4'h4;  end
        17'b1_00100000_11111111: begin eop_seg = 3'h5; nxt_hdr = 1'b1; tlast_256b = 4'h4;  end  // hdr need 256b
        17'b1_01000000_01111111: begin eop_seg = 3'h6; nxt_hdr = 1'b0; tlast_256b = 4'h8;  end
        17'b1_01000000_11111111: begin eop_seg = 3'h6; nxt_hdr = 1'b1; tlast_256b = 4'h8;  end  // portion of hdr in last segment
        17'b1_10000000_11111111: begin eop_seg = 3'h7; nxt_hdr = 1'b0; tlast_256b = 4'h8;  end
        default: begin eop_seg = 3'h0; nxt_hdr = 1'b0;  tlast_256b = 4'h0; end
        endcase
      end
    end
end
endgenerate
// ########################################################

// Data width upsize
generate
if (DWIDTH == 1024)
begin: upsize_bypass
  // Incoming data will be stored in buffer first. Data to fifo is from buffer.
  // Buffer act as the last slot of the fifo (to allow up to 512B + 32B(hdr) into 4K Fifo).
  always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n) begin
      upsize_buffer <= 0;
      sc_fifo_wrfull_r <= 1'b0; // full when fifo is full and buffer is filled
      upbuff_valid <= 1'b0;
    end
    else begin
      if (sc_fifo_wrfull) begin
         upbuff_valid <= upbuff_valid;
         upsize_buffer <= upsize_buffer;
      end
      else begin
         if (axi_s_fifo_tvalid) begin
            upbuff_valid <= 1'b1;
            upsize_buffer <= {tlast_256b, eop_seg, axi_s_fifo_tkeep, axi_s_fifo_tdata};
         end
         else begin
            upbuff_valid <= 1'b0;
         end
      end

      //if (axi_s_fifo_tvalid) begin
      //  if (sc_fifo_wrfull) begin
      //    if (upbuff_valid) begin
      //      upsize_buffer <= {tlast_256b, eop_seg, axi_s_fifo_tkeep, axi_s_fifo_tdata};
      //      sc_fifo_wrfull_r <= 1'b1;
      //    end
      //    else begin // should not happen 
      //      upsize_buffer <= {tlast_256b, eop_seg, axi_s_fifo_tkeep, axi_s_fifo_tdata};
      //      upbuff_valid <= 1'b1;
      //      sc_fifo_wrfull_r <= 1'b1;
      //    end
      //  end // sc_fifo_wrfull
      //  else begin
      //    upsize_buffer <= {tlast_256b, eop_seg, axi_s_fifo_tkeep, axi_s_fifo_tdata};
      //    upbuff_valid <= 1'b1;
      //    sc_fifo_wrfull_r <= 1'b0;
      //  end
      //end
      //else begin
      //  if (sc_fifo_wrfull_r && !sc_fifo_wrfull) begin // got data in buffer and data in being hold up
      //    upsize_buffer <= {tlast_256b, eop_seg, axi_s_fifo_tkeep, axi_s_fifo_tdata};
      //    upbuff_valid <= 1'b1;
      //    sc_fifo_wrfull_r <= 1'b0;
      //  end
      //  else begin //deassert upbuff_valid because axis_s_fifo_tvalid is deasserted, else there will be multiple sc_fifo write for the same data.
      //    upbuff_valid <= 1'b0;
      //  end
      //end
    end
  end
  assign sc_fifo_in_data = upsize_buffer;
end
else if (DWIDTH == 512 && payload_width != 512) //To improve performance, with dwidth and payload width is 512, keep internal pipeline as 512.
begin: upsize_512_to_1024 // 512 and 256
  // need to store data in upsize_buffer, then write to fifo with the combined
  // data in buffer together with the eop seg
  // combine with next cycle data when there is eop and got next hdr. If next_hdr=0
  // when tlast=1, write to fifo. Need 2 eop_seg and 2 nxt_hdr. Maximum of 3 hdr per row.
  always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
    begin
      count_upsize <= 0;
      upbuff_valid <= 1'b0;
      sc_fifo_wrfull_r <= 1'b0; // full when fifo is full and buffer is filled
      un_stored_data <= 1'b0;
      for (i=0; i < IN_TO_FIFO_MULT; i = i + 1)
      begin
        upsize_data[i]  <= 0;
        upsize_tkeep[i] <= 0;
        upsize_eop_seg[i] <= 0;
        upsize_tlast[i] <= 0;
      end
    end
    else begin// Not reset
      if (axi_s_fifo_tvalid) begin
        if (sc_fifo_wrfull) begin
          if (upbuff_valid) begin // already has a valid data to be stored but fifo is full
            sc_fifo_wrfull_r <= 1'b1; // meaning buffer is filled up and got xtra data-in not yet stored
            un_stored_data <= 1'b1;
          end
          else begin
          //if (count_upsize < IN_TO_FIFO_MULT) begin
            upsize_data[count_upsize] <= axi_s_fifo_tdata; // current data is stored
            upsize_tkeep[count_upsize] <= axi_s_fifo_tkeep;
            upsize_eop_seg[count_upsize] <= eop_seg;
            upsize_tlast[count_upsize] <= tlast_256b;
            un_stored_data <= 1'b0;

            if ((count_upsize == IN_TO_FIFO_MULT - 1) || (axi_s_fifo_tlast & !nxt_hdr))
            begin
              upbuff_valid <= 1'b1;  // data is valid in the next cycle
              count_upsize <= 0; // clear count for next set of packet
              sc_fifo_wrfull_r <= 1'b1;
              // clear old data in the rest of the buffer if reach here before filled up all
              if (count_upsize == 0) begin
                upsize_data[1]  <= 0;
                upsize_tkeep[1] <= 0;
                upsize_eop_seg[1] <= 0;
                upsize_tlast[1] <= 0;
              end
            end
            else begin // not filled up or have next header
              upbuff_valid <= 1'b0;
              count_upsize <= count_upsize + 1'b1;
            end
          //end // count_upsize < MAX
          end
        end 
        else begin //!sc_fifo_wrfull 
          un_stored_data <= 1'b0;
          
          //if (count_upsize < IN_TO_FIFO_MULT) begin
            upsize_data[count_upsize] <= axi_s_fifo_tdata; // current data is stored
            upsize_tkeep[count_upsize] <= axi_s_fifo_tkeep;
            upsize_eop_seg[count_upsize] <= eop_seg;
            upsize_tlast[count_upsize] <= tlast_256b;

            if ((count_upsize == IN_TO_FIFO_MULT - 1) || (axi_s_fifo_tlast & !nxt_hdr))
            begin
              upbuff_valid <= 1'b1;  // data is valid in the next cycle
              count_upsize <= 0; // clear count for next set of packet
              // clear old data in the rest of the buffer if reach here before filled up all
              if (count_upsize == 0) begin
                upsize_data[1]  <= 0;
                upsize_tkeep[1] <= 0;
                upsize_eop_seg[1] <= 0;
                upsize_tlast[1] <= 0;
              end
            end
            else begin // not filled up or have next header
              upbuff_valid <= 1'b0;
              count_upsize <= count_upsize + 1'b1;
            end
          //end // count_upsize < MAX
        end
      end
      else begin// NOT axi_s_fifo_tvalid
        if (!sc_fifo_wrfull) begin  // Do nothing when fifo is full
          if (un_stored_data) begin
            un_stored_data <= 1'b0;
            //if (count_upsize < IN_TO_FIFO_MULT) begin 
              upsize_data[count_upsize] <= axi_s_fifo_tdata;
              upsize_tkeep[count_upsize] <= axi_s_fifo_tkeep;
              upsize_eop_seg[count_upsize] <= eop_seg;
              upsize_tlast[count_upsize] <= tlast_256b;
              if ((count_upsize == IN_TO_FIFO_MULT - 1) || (axi_s_fifo_tlast & !nxt_hdr))
              begin
                upbuff_valid <= 1'b1;  // data is valid in the next cycle
                count_upsize <= 0; // clear count for next set of packet
                sc_fifo_wrfull_r <= 1'b1;
                // clear old data in the rest of the buffer if reach here before filled up all
                if (count_upsize == 0) begin
                  upsize_data[1]  <= 0;
                  upsize_tkeep[1] <= 0;
                  upsize_eop_seg[1] <= 0;
                  upsize_tlast[1] <= 0;
                end
              end
              else begin // not filled up or have next header
                upbuff_valid <= 1'b0;
                count_upsize <= count_upsize + 1'b1;
                sc_fifo_wrfull_r <= 1'b0;
              end
            //end // count_upsize < MAX
          end // un_stored_data
          else begin
            sc_fifo_wrfull_r <= 1'b0;
            upbuff_valid <= 1'b0;
            un_stored_data <= 1'b0;
          end
        end
      end
    end
  end

  for (gi = 0; gi < IN_TO_FIFO_MULT; gi=gi+1)
  begin: seg_2_fifo_0
    assign tdata_2_fifo_up[(DWIDTH*(gi+1))-1 : DWIDTH*gi] = upsize_data[gi];
    assign tkeep_2_fifo_up[((DWIDTH/128)*(gi+1))-1 : (DWIDTH/128)*gi] = upsize_tkeep[gi];
    assign eop_seg_2_fifo[((DWIDTH/128)*(gi+1))-1 : (DWIDTH/128)*gi] = upsize_eop_seg[gi];
    assign tlast_2_fifo_up[((DWIDTH/256)*(gi+1))-1 : (DWIDTH/256)*gi] = upsize_tlast[gi];
  end
  assign sc_fifo_in_data = {tlast_2_fifo_up, eop_seg_2_fifo, tkeep_2_fifo_up, tdata_2_fifo_up}; //(4+8+8+1024)
end
else if (DWIDTH == 512 && payload_width == 512) //To improve performance, with dwidth and payload width is 512, keep internal pipeline as 512.
begin: no_upsize_to_1024 
  reg [DWIDTH/256 - 1:0] tlast_256b_reg;
  reg [$clog2(DWIDTH/(16*8))-1:0] eop_seg_reg;
  reg [DWIDTH/128 - 1:0] axi_s_fifo_tkeep_reg;
  reg [DWIDTH - 1:0] axi_s_fifo_tdata_reg;

  always @(posedge clk or negedge reset_n) //upbuff_valid always 1
  begin
    if (!reset_n)
    begin
      upbuff_valid <= 1'b0;
      tlast_256b_reg <= {DWIDTH/256{1'b0}};
      eop_seg_reg <= {$clog2(DWIDTH/(16*8)){1'b0}};
      axi_s_fifo_tkeep_reg <= {DWIDTH/128{1'b0}};
      axi_s_fifo_tdata_reg <= {DWIDTH{1'b0}};
    end
    else begin// Not reset
      if (axi_s_fifo_tvalid) begin
         upbuff_valid <= 1'b1;
         tlast_256b_reg <= tlast_256b;
         eop_seg_reg <= eop_seg;
         axi_s_fifo_tkeep_reg <= axi_s_fifo_tkeep;
         axi_s_fifo_tdata_reg <= axi_s_fifo_tdata;
      end
      else begin
         upbuff_valid <= 1'b0;
      end
    end
  end

  assign sc_fifo_in_data = {tlast_256b_reg, 2'b00, eop_seg_reg, axi_s_fifo_tkeep_reg, axi_s_fifo_tdata_reg}; //522 bits (2+4+4+512) //added in 2 empty bits to form the same eop_seg as previous version.
  assign wr_tlast_512 = upbuff_valid & (|tlast_256b_reg);
end
else if (DWIDTH == 256)
begin: upsize_256_to_1024 // 512 and 256
  // need to store data in upsize_buffer, then write to fifo with the combined
  // data in buffer together with the eop seg
  // combine with next cycle data when there is eop and got next hdr. If next_hdr=0
  // when tlast=1, write to fifo. Need 2 eop_seg and 2 nxt_hdr. Maximum of 3 hdr per row.
  always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
    begin
      count_upsize <= 0;
      upbuff_valid <= 1'b0;
      sc_fifo_wrfull_r <= 1'b0; // full when fifo is full and buffer is filled
      un_stored_data <= 1'b0;
      for (i=0; i < IN_TO_FIFO_MULT; i = i + 1)
      begin
        upsize_data[i]  <= 0;
        upsize_tkeep[i] <= 0;
        upsize_eop_seg[i] <= 0;
        upsize_tlast[i] <= 0;
      end
    end
    else begin// Not reset
      if (axi_s_fifo_tvalid) begin
        if (sc_fifo_wrfull) begin
          if (upbuff_valid) begin // already has a valid data to be stored but fifo is full
            sc_fifo_wrfull_r <= 1'b1; // meaning buffer is filled up and got xtra data-in not yet stored
            un_stored_data <= 1'b1;
          end
          else begin
          //if (count_upsize < IN_TO_FIFO_MULT) begin 
            upsize_data[count_upsize] <= axi_s_fifo_tdata; // current data is stored
            upsize_tkeep[count_upsize] <= axi_s_fifo_tkeep;
            upsize_eop_seg[count_upsize] <= eop_seg;
            upsize_tlast[count_upsize] <= tlast_256b;
            un_stored_data <= 1'b0;

            if ((count_upsize == IN_TO_FIFO_MULT - 1) || (axi_s_fifo_tlast & !nxt_hdr))
            begin
              upbuff_valid <= 1'b1;  // data is valid in the next cycle
              count_upsize <= 0; // clear count for next set of packet
              sc_fifo_wrfull_r <= 1'b1;
              // clear old data in the rest of the buffer if reach here before filled up all
              // Can not use for loop due to Quartus limitation - indefinite loop
              //for (i=count_upsize+1; i < IN_TO_FIFO_MULT; i = i + 1) begin
              //  upsize_data[i]  <= 0;
              //  upsize_tkeep[i] <= 0;
              //  upsize_eop_seg[i] <= 0;
              //  upsize_tlast[i] <= 0;
              //end
              case (count_upsize)
                2'b00: begin
                        upsize_data[1]  <= 0; upsize_data[2]  <= 0; upsize_data[3]  <= 0;
                        upsize_tkeep[1] <= 0; upsize_tkeep[2] <= 0; upsize_tkeep[3] <= 0;
                        upsize_eop_seg[1] <= 0; upsize_eop_seg[2] <= 0; upsize_eop_seg[3] <= 0;
                        upsize_tlast[1] <= 0; upsize_tlast[2] <= 0; upsize_tlast[3] <= 0;
                       end
                2'b01: begin
                        upsize_data[2]  <= 0; upsize_data[3]  <= 0;
                        upsize_tkeep[2] <= 0; upsize_tkeep[3] <= 0;
                        upsize_eop_seg[2] <= 0; upsize_eop_seg[3] <= 0;
                        upsize_tlast[2] <= 0; upsize_tlast[3] <= 0;
                       end
                2'b10: begin
                        upsize_data[3]  <= 0;
                        upsize_tkeep[3] <= 0;
                        upsize_eop_seg[3] <= 0;
                        upsize_tlast[3] <= 0;
                       end
                2'b11: begin // Do nothing - since already fillup all
                       end
              endcase
            end
            else begin // not filled up or have next header
              upbuff_valid <= 1'b0;
              count_upsize <= count_upsize + 1'b1;
            end
          //end // count_upsize < MAX
          end
        end 
        else begin //!sc_fifo_wrfull 
          un_stored_data <= 1'b0;
          
          //if (count_upsize < IN_TO_FIFO_MULT) begin 
            upsize_data[count_upsize] <= axi_s_fifo_tdata; // current data is stored
            upsize_tkeep[count_upsize] <= axi_s_fifo_tkeep;
            upsize_eop_seg[count_upsize] <= eop_seg;
            upsize_tlast[count_upsize] <= tlast_256b;

            if ((count_upsize == IN_TO_FIFO_MULT - 1) || (axi_s_fifo_tlast & !nxt_hdr))
            begin
              upbuff_valid <= 1'b1;  // data is valid in the next cycle
              count_upsize <= 0; // clear count for next set of packet
              // clear old data in the rest of the buffer if reach here before filled up all
              case (count_upsize)
                2'b00: begin
                        upsize_data[1]  <= 0; upsize_data[2]  <= 0; upsize_data[3]  <= 0;
                        upsize_tkeep[1] <= 0; upsize_tkeep[2] <= 0; upsize_tkeep[3] <= 0;
                        upsize_eop_seg[1] <= 0; upsize_eop_seg[2] <= 0; upsize_eop_seg[3] <= 0;
                        upsize_tlast[1] <= 0; upsize_tlast[2] <= 0; upsize_tlast[3] <= 0;
                       end
                2'b01: begin
                        upsize_data[2]  <= 0; upsize_data[3]  <= 0;
                        upsize_tkeep[2] <= 0; upsize_tkeep[3] <= 0;
                        upsize_eop_seg[2] <= 0; upsize_eop_seg[3] <= 0;
                        upsize_tlast[2] <= 0; upsize_tlast[3] <= 0;
                       end
                2'b10: begin
                        upsize_data[3]  <= 0;
                        upsize_tkeep[3] <= 0;
                        upsize_eop_seg[3] <= 0;
                        upsize_tlast[3] <= 0;
                       end
                2'b11: begin // Do nothing - since already fillup all
                       end
              endcase
            end
            else begin // not filled up or have next header
              upbuff_valid <= 1'b0;
              count_upsize <= count_upsize + 1'b1;
            end
          //end // count_upsize < MAX
        end
      end
      else begin// NOT axi_s_fifo_tvalid
        if (!sc_fifo_wrfull) begin  // Do nothing when fifo is full
          if (un_stored_data) begin
            un_stored_data <= 1'b0;
            //if (count_upsize < IN_TO_FIFO_MULT) begin 
              upsize_data[count_upsize] <= axi_s_fifo_tdata;
              upsize_tkeep[count_upsize] <= axi_s_fifo_tkeep;
              upsize_eop_seg[count_upsize] <= eop_seg;
              upsize_tlast[count_upsize] <= tlast_256b;
              if ((count_upsize == IN_TO_FIFO_MULT - 1) || (axi_s_fifo_tlast & !nxt_hdr))
              begin
                upbuff_valid <= 1'b1;  // data is valid in the next cycle
                count_upsize <= 0; // clear count for next set of packet
                sc_fifo_wrfull_r <= 1'b1;
                // clear old data in the rest of the buffer if reach here before filled up all
                case (count_upsize)
                  2'b00:begin
                        upsize_data[1]  <= 0; upsize_data[2]  <= 0; upsize_data[3]  <= 0;
                        upsize_tkeep[1] <= 0; upsize_tkeep[2] <= 0; upsize_tkeep[3] <= 0;
                        upsize_eop_seg[1] <= 0; upsize_eop_seg[2] <= 0; upsize_eop_seg[3] <= 0;
                        upsize_tlast[1] <= 0; upsize_tlast[2] <= 0; upsize_tlast[3] <= 0;
                        end
                  2'b01:begin
                        upsize_data[2]  <= 0; upsize_data[3]  <= 0;
                        upsize_tkeep[2] <= 0; upsize_tkeep[3] <= 0;
                        upsize_eop_seg[2] <= 0; upsize_eop_seg[3] <= 0;
                        upsize_tlast[2] <= 0; upsize_tlast[3] <= 0;
                        end
                  2'b10:begin
                        upsize_data[3]  <= 0;
                        upsize_tkeep[3] <= 0;
                        upsize_eop_seg[3] <= 0;
                        upsize_tlast[3] <= 0;
                        end
                  2'b11:begin // Do nothing - since already fillup all
                        end
                endcase
              end
              else begin // not filled up or have next header
                upbuff_valid <= 1'b0;
                count_upsize <= count_upsize + 1'b1;
                sc_fifo_wrfull_r <= 1'b0;
              end
            //end // count_upsize < MAX
          end // un_stored_data
          else begin
            sc_fifo_wrfull_r <= 1'b0;
            upbuff_valid <= 1'b0;
            un_stored_data <= 1'b0;
          end
        end
      end
    end
  end

  for (gi = 0; gi < IN_TO_FIFO_MULT; gi=gi+1)
  begin: seg_2_fifo_1
    assign tdata_2_fifo_up[(DWIDTH*(gi+1))-1 : DWIDTH*gi] = upsize_data[gi];
    assign tkeep_2_fifo_up[((DWIDTH/128)*(gi+1))-1 : (DWIDTH/128)*gi] = upsize_tkeep[gi];
    assign eop_seg_2_fifo[((DWIDTH/128)*(gi+1))-1 : (DWIDTH/128)*gi] = upsize_eop_seg[gi];
    assign tlast_2_fifo_up[((DWIDTH/256)*(gi+1))-1 : (DWIDTH/256)*gi] = upsize_tlast[gi];
  end
  assign sc_fifo_in_data = {tlast_2_fifo_up, eop_seg_2_fifo, tkeep_2_fifo_up, tdata_2_fifo_up};
end

endgenerate
// wr_tlast
generate
if (DWIDTH == 512 && payload_width == 512)
begin
	assign wr_tlast = wr_tlast_512;
	assign tx_xfer_hdr_or = tx_xfer_hdr | tx_xfer_hdr_prev;
end
else
begin
	assign wr_tlast = axi_s_fifo_tvalid & axi_s_fifo_tlast;
	assign tx_xfer_hdr_or = tx_xfer_hdr;
end
endgenerate

assign sc_fifo_wrreq = upbuff_valid & ~sc_fifo_wrfull;
//assign sc_fifo_rdreq =  ready_to_xfer & ~sc_fifo_rdempty & (tlast_count != 0) & !last_tlast;
assign tx_packer_ready = (!(sc_fifo_wr_almost_full));
//assign tx_packer_ready = (!(sc_fifo_wr_almost_full && upbuff_valid)) & ~sc_fifo_wrfull_r;
// tx_packer scfifo 
generate
	if (DWIDTH == 512 && payload_width == 512) begin
		 scfifo  # (
		    .lpm_width                (SC_TX_PACKER_WIDTH),
		    .lpm_widthu               (4),
		    .lpm_numwords             (16),
		    .overflow_checking        ("OFF"),
		    .underflow_checking       ("OFF"),
		    .use_eab                  ("ON"),
		    .add_ram_output_register  ("ON"),
		    .ram_block_type           ("M20K"),
		    .almost_full_value        (14),
		    .lpm_showahead            ("OFF"),
		    .intended_device_family   (device_family)
		 ) tx_packer_fifo_inst (
		    .data (sc_fifo_in_data),
		    .clock (clk),
		    .rdreq (sc_fifo_rdreq),
		    .wrreq (sc_fifo_wrreq),
		    .empty (sc_fifo_rdempty),
		    .almost_full (sc_fifo_wr_almost_full),
		    .full (sc_fifo_wrfull),
		    .aclr ( ~reset_n),
		    .sclr (1'b0),
		    .q (sc_fifo_out_data)
		);
	end
	else begin
		 scfifo  # (
		    .lpm_width                (SC_TX_PACKER_WIDTH),
		    .lpm_widthu               (3),
		    .lpm_numwords             (8),
		    .overflow_checking        ("OFF"),
		    .underflow_checking       ("OFF"),
		    .use_eab                  ("ON"),
		    .add_ram_output_register  ("ON"),
		    .ram_block_type           ("M20K"),
		    .almost_full_value        (6),
		    .lpm_showahead            ("OFF"),
		    .intended_device_family   (device_family)
		 ) tx_packer_fifo_inst (
		    .data (sc_fifo_in_data),
		    .clock (clk),
		    .rdreq (sc_fifo_rdreq),
		    .wrreq (sc_fifo_wrreq),
		    .empty (sc_fifo_rdempty),
		    .almost_full (sc_fifo_wr_almost_full),
		    .full (sc_fifo_wrfull),
		    .aclr ( ~reset_n),
		    .sclr (1'b0),
		    .q (sc_fifo_out_data)
		);
	end
endgenerate

always @(posedge clk or negedge reset_n)
begin
  if (!reset_n)
    sc_fifo_rdreq_r <= 1'b0;
  else
    sc_fifo_rdreq_r <= sc_fifo_rdreq;
end

// split output
assign  sc_fifo_out_tvalid = sc_fifo_rdreq_r;
assign  sc_fifo_out_tlast =  (DWIDTH == 1024) ? sc_fifo_out_data[(SC_TX_PACKER_WIDTH - 5) - 1: ((SC_FIFO_DWIDTH + 2*SC_FIFO_DWIDTH/128) - 5)]: (DWIDTH == 512 && payload_width == 512) ? {2'd0, sc_fifo_out_data[SC_TX_PACKER_WIDTH - 1: SC_FIFO_DWIDTH + 2*SC_FIFO_DWIDTH/128]} : sc_fifo_out_data[SC_TX_PACKER_WIDTH - 1: SC_FIFO_DWIDTH + 2*SC_FIFO_DWIDTH/128];
assign  sc_fifo_out_eop_seg = (DWIDTH == 512 && payload_width == 512) ? {4'd0,sc_fifo_out_data[SC_FIFO_DWIDTH + 2*SC_FIFO_DWIDTH/128 - 1: SC_FIFO_DWIDTH + SC_FIFO_DWIDTH/128]} : sc_fifo_out_data[SC_FIFO_DWIDTH + 2*SC_FIFO_DWIDTH/128 - 1: SC_FIFO_DWIDTH + SC_FIFO_DWIDTH/128];
assign  sc_fifo_out_tkeep = (DWIDTH == 512 && payload_width == 512) ? {4'd0,sc_fifo_out_data[SC_FIFO_DWIDTH + SC_FIFO_DWIDTH/128 - 1: SC_FIFO_DWIDTH]} : sc_fifo_out_data[SC_FIFO_DWIDTH + SC_FIFO_DWIDTH/128 - 1: SC_FIFO_DWIDTH];
assign  sc_fifo_out_tdata = (DWIDTH == 512 && payload_width == 512) ? {512'd0,sc_fifo_out_data[SC_FIFO_DWIDTH-1:0]} : sc_fifo_out_data[SC_FIFO_DWIDTH-1:0];

always @(*)
begin
  if (sc_fifo_out_tvalid)
    case (sc_fifo_out_tlast)
    4'h0: rd_tlast = 0;
    4'h1: rd_tlast = 1;
    4'h2: rd_tlast = 1;
    4'h3: rd_tlast = 2;
    4'h4: rd_tlast = 1;
    4'h5: rd_tlast = 2;
    4'h6: rd_tlast = 2;
    4'h7: rd_tlast = 3;
    4'h8: rd_tlast = 1;
    4'h9: rd_tlast = 2;
    4'ha: rd_tlast = 2;
    4'hb: rd_tlast = 3;
    4'hc: rd_tlast = 2;
    4'hd: rd_tlast = 3;
    4'he: rd_tlast = 3;
    4'hf: rd_tlast = 4;
    endcase
  else
    rd_tlast = 0;
end
// tlast counter
always @(posedge clk or negedge reset_n)
begin
  if (!reset_n)
    tlast_count <= 0;
  else
  begin
      case ({wr_tlast, |rd_tlast})
      2'b00: tlast_count <= tlast_count;
      2'b01: tlast_count <= tlast_count - rd_tlast;
      2'b10: tlast_count <= tlast_count + wr_tlast;
      2'b11: tlast_count <= tlast_count + wr_tlast - rd_tlast;
      endcase
  end
end

// Controller - data transfer/store
if (Header_Packing_scheme == "Simple")  // only 1 header per cycle/row
begin
  assign tx_xfer_hdr = (sc_fifo_out_tvalid & prev_eop_reg) ? 1'b1 : 1'b0;
  assign tx_xfer_data = (sc_fifo_out_tvalid & !prev_eop_reg) ? 1'b1 : 1'b0;
end
else
begin
  assign tx_xfer_hdr = (sc_fifo_out_tvalid & prev_eop_reg) ? 1'b1 : 1'b0;
  assign tx_xfer_data = (sc_fifo_out_tvalid & !prev_eop_reg) ? 1'b1 : 1'b0;
end
// Regs 
always @(posedge clk or negedge reset_n)
begin
  if (!reset_n)
    prev_eop_reg <= 1'b1;
  else
  begin
    if (tx_xfer_hdr || tx_st_valid_data_i)
      prev_eop_reg <= tx_st_eop_i_or; //use the OR version of the tx_st_eop_i, this OR the tx_st_eop_i with tx_st_eop_i_prev
  end
end

// AB: For payload_width 256 - it is possible to xfer hdr + data without the need to hold, just need to advance the xfer_count
if (payload_width == 1024) // at max width supported - 1024b
begin
  assign tx_data_i = tx_xfer_hdr_data ?  sc_fifo_out_tdata[SC_FIFO_DWIDTH-1:256] : (tx_xfer_data | tx_xfer_data_prev) ? sc_fifo_out_tdata : 0; //Added in tx_xfer_data_prev to maintain the tx_xfer_data state when tx_st_ready_i is low.
  assign xfer_count = 0;
  assign hold_xfer = tx_xfer_hdr_data & !(|sc_fifo_out_tlast);
  assign sc_fifo_rdreq =  ~sc_fifo_rdempty & (tlast_count != 0) & tx_st_ready_i;
end

else if (DWIDTH == 512 && payload_width == 512)
begin
  assign tx_data_i = tx_xfer_hdr_data ?  sc_fifo_out_tdata[SC_FIFO_DWIDTH-1:256] : (tx_xfer_data | tx_xfer_data_prev) ? sc_fifo_out_tdata[511:0] : 0; //Added in tx_xfer_data_prev to maintain the tx_xfer_data state when tx_st_ready_i is low.
  assign xfer_count = 0;
  assign hold_xfer = tx_xfer_hdr_data & !(|sc_fifo_out_tlast);
  assign sc_fifo_rdreq =  ~sc_fifo_rdempty & (tlast_count > rd_tlast) & tx_st_ready_i;

  always @(posedge clk or negedge reset_n) //tx_xfer_data_prev will hold the tx_xfer_data value when tx_st_ready_i is low to prevent the lost of last data due to tx_xfer_data is a pulse.
  begin
    if (!reset_n) begin
       tx_xfer_data_prev <= 0;
    end
    else begin
       if (tx_xfer_data & ~tx_st_ready_i)
          tx_xfer_data_prev <= 1;
       else if (tx_xfer_data_prev & ~tx_st_ready_i)
	  tx_xfer_data_prev <= 1;
       else
          tx_xfer_data_prev <= 0;
    end
  end

  always @(posedge clk or negedge reset_n) //tx_xfer_hdr_prev will hold the tx_xfer_hdr and tx_xfer_hdr_data value when tx_st_ready_i is low to prevent the lost of last data due to tx_xfer_hdr is a pulse.
  begin
    if (!reset_n) begin
       tx_xfer_hdr_prev <= 0;
    end
    else begin
       if (tx_xfer_hdr & ~tx_st_ready_i)
          tx_xfer_hdr_prev <= 1;
       else if (tx_xfer_hdr_prev & ~tx_st_ready_i)
	  tx_xfer_hdr_prev <= 1;
       else
          tx_xfer_hdr_prev <= 0;
    end
  end

  always @(posedge clk or negedge reset_n) //tx_st_eop_i_prev will hold the tx_st_eop_i value when tx_st_ready_i is low to prevent the lost of last eop due to tx_st_eop_i is a pulse.
  begin
    if (!reset_n) begin
       tx_st_eop_i_prev <= 0;
    end
    else begin
       if (tx_st_eop_i & ~tx_st_ready_i)
          tx_st_eop_i_prev <= 1;
       else if (tx_st_eop_i_prev & ~tx_st_ready_i)
          tx_st_eop_i_prev <= 1;
       else
          tx_st_eop_i_prev <= 0;
    end
  end

  assign tx_st_eop_i_or = tx_st_eop_i | tx_st_eop_i_prev;
  
end
else 
begin
  
  // FSM to read SC FIFO - objective to improve timing using FSM
  localparam SCF_RD_IDLE  = 3'b001;
  localparam SCF_RD_RD    = 3'b010;
  localparam SCF_RD_HOLD  = 3'b100;
  reg       [2:0]         scf_rd_st, nxt_scf_rd_st;

  always @(*) begin

    nxt_scf_rd_st = scf_rd_st;

    case (scf_rd_st)
    SCF_RD_IDLE:begin
              if (~sc_fifo_rdempty & (tlast_count != 0) & tx_st_ready_i) // once the fifo is fill and there is tlast in fifo 
                nxt_scf_rd_st = SCF_RD_RD;
              else
                nxt_scf_rd_st = SCF_RD_IDLE;
              end
    SCF_RD_RD:  begin
              if (tx_st_ready_i) //Only move to SCF_RD_HOLD if tx_st_ready_i assert, else remain in SCF_RD_RD. This is because without tx_st_ready_i, the sc_fifo_rdreq cannot be asserted.
                nxt_scf_rd_st = SCF_RD_HOLD;
              else
                nxt_scf_rd_st = SCF_RD_RD;
              end
    SCF_RD_HOLD:begin // hold the read and process data
		if (found_tlast)
                  //if (~sc_fifo_rdempty & (tlast_count != 0) & tx_st_ready_i)
                  if (~sc_fifo_rdempty & (tlast_count != 0) & !(tlast_count == 1 && (|sc_fifo_out_tlast)) & tx_st_ready_i) //tlast_count is updated 1cc after sc_fifo_out_tlast is seen, this causes the SCFIFO to be read even if tlast is no longer exist in the SCFIFO. Update to use (tlast_count == 1 && (|sc_fifo_out_tlast)) to gain 1cc earlier. If tlast_count is already 0, go back to SCF_RD_IDLE.
                    nxt_scf_rd_st = SCF_RD_RD;
                  else
                    nxt_scf_rd_st = SCF_RD_IDLE;
                else    
                  if (~sc_fifo_rdempty & (xfer_count_i == (OUT_TO_FIFO_MULT - 2)) && !(|sc_fifo_out_tlast) & tx_st_ready_i) //gated with tx_st_ready_i, if the pipeline is not ready, do not move to SCF_RD_RD because SCF_RD_RD will trigger new rdreq to SCFIFO (even though rdreq generation is gated with tx_st_ready_i). 
                    nxt_scf_rd_st = SCF_RD_RD;
                  else
                    nxt_scf_rd_st = SCF_RD_HOLD;
              end

                  default:    nxt_scf_rd_st = SCF_RD_IDLE;
    endcase
  end

  always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n) begin
      xfer_count_i <= 0;
      scf_rd_st <= SCF_RD_IDLE;
    end
    else
    begin
      scf_rd_st <= nxt_scf_rd_st;

      if ((scf_rd_st == SCF_RD_RD || found_tlast) & tx_st_ready_i) //Don't allow xfer_count_i to reset to 0 when tx_st_ready_i is low. This will prevent the lost of the last data before tx_st_ready_i goes low. Once xfer_count_i is 0, it will cause the tx_data_r mux to select "0" as data.
        xfer_count_i <= 0;
      //else if (scf_rd_st == SCF_RD_HOLD && !found_tlast)
      else if (scf_rd_st == SCF_RD_HOLD)
        if (payload_width == 256 && tx_xfer_hdr_data) // skip 1 cycle
          xfer_count_i <= sc_fifo_out_tlast[1] ? 0 : xfer_count_i + 2; // reset count if found eop on 1
        else if (tx_st_ready_i) //gated with tx_st_ready_i, if pipeline is not ready, stay in SCF_RD_HOLD and xfer_count_i stall.
          xfer_count_i <= xfer_count_i + 1'b1;
	else
	  xfer_count_i <= xfer_count_i;
    end
  end
  assign xfer_count = xfer_count_i;  
  assign sc_fifo_rdreq =  (scf_rd_st == SCF_RD_RD) & tx_st_ready_i;
  // Check for tlast
  if (payload_width == 512) begin
    always @(*) begin
      case (xfer_count_i)
        1'b0: found_tlast = |sc_fifo_out_tlast[1:0];
        1'b1: found_tlast = |sc_fifo_out_tlast[3:2];
      endcase
    end
  end
  else begin // (payload_width == 256)
    always @(*) begin
      case (xfer_count_i)
        2'b00: found_tlast = tx_xfer_hdr_data ? sc_fifo_out_tlast[1] : sc_fifo_out_tlast[0];
        2'b01: found_tlast = sc_fifo_out_tlast[1];
        2'b10: found_tlast = sc_fifo_out_tlast[2];
        2'b11: found_tlast = sc_fifo_out_tlast[3];
      endcase
    end
  end

  always @(posedge clk or negedge reset_n) //tx_xfer_data_prev will hold the tx_xfer_data value when tx_st_ready_i is low to prevent the lost of last data due to tx_xfer_data is a pulse.
  begin
    if (!reset_n) begin
       tx_xfer_data_prev <= 0;
    end
    else begin
       if (tx_xfer_data & ~tx_st_ready_i)
          tx_xfer_data_prev <= 1;
       else if (tx_xfer_data_prev & ~tx_st_ready_i)
	  tx_xfer_data_prev <= 1;
       else
          tx_xfer_data_prev <= 0;
    end
  end

  always @(posedge clk or negedge reset_n) //tx_st_eop_i_prev will hold the tx_st_eop_i value when tx_st_ready_i is low to prevent the lost of last eop due to tx_st_eop_i is a pulse.
  begin
    if (!reset_n) begin
       tx_st_eop_i_prev <= 0;
    end
    else begin
       if (tx_st_eop_i & ~tx_st_ready_i)
          tx_st_eop_i_prev <= 1;
       else if (tx_st_eop_i_prev & ~tx_st_ready_i)
          tx_st_eop_i_prev <= 1;
       else
          tx_st_eop_i_prev <= 0;
    end
  end

  assign tx_st_eop_i_or = tx_st_eop_i | tx_st_eop_i_prev;

  if (payload_width == 512)
  begin
    assign hold_xfer = tx_xfer_hdr_data & (xfer_count == 0) & !(|sc_fifo_out_tlast[1 : 0]); // xfer_count == 0
    always @(*) begin
      case (xfer_count)
      1'b0: begin
            if (tx_xfer_hdr_data) // tx_xfer_hdr is only asserted for the 1 cycle per fifo row
              tx_data_r = sc_fifo_out_tdata[payload_width - 1: 256];
            else if (tx_xfer_data || tx_xfer_data_prev)  // tx_xfer_data is only asserted for the 1 cycle per fifo row
              tx_data_r = sc_fifo_out_tdata[payload_width -1:0];
            else
              tx_data_r = 0;
            end
      1'b1: begin // continuation of data transfer
              tx_data_r = sc_fifo_out_tdata[payload_width*2 - 1: payload_width];
            end
      endcase
    end 
    assign tx_data_i = tx_data_r; 
  end
  else // payload_width = 256. Going to advance the xfer_count when there are data to be sent together with header.
  begin
    assign hold_xfer = 1'b0;
    always @(*)
    begin
      case (xfer_count)
      2'b00: begin
            if (tx_xfer_hdr_data)
              tx_data_r = sc_fifo_out_tdata[payload_width*2 - 1: payload_width];
            else if (tx_xfer_data || tx_xfer_data_prev)	//tx_xfer_data_prev will hold the tx_xfer_data value when tx_st_ready_i is low to prevent the lost of last data due to tx_xfer_data is a pulse.
              tx_data_r = sc_fifo_out_tdata[payload_width - 1:0];
            else
              tx_data_r = 0;
            end
      2'b01: tx_data_r = sc_fifo_out_tdata[payload_width*2 - 1: payload_width];
      2'b10: tx_data_r = sc_fifo_out_tdata[payload_width*3 - 1: payload_width*2];
      2'b11: tx_data_r = sc_fifo_out_tdata[payload_width*4 - 1: payload_width*3];
      endcase
    end 
    assign tx_data_i = tx_data_r; 
  end
end

if (Header_Packing_scheme == "Simple")
begin
  assign tx_st_sop_i = tx_xfer_hdr_or;
  assign tx_st_eop_i = ( payload_width == 256 & ( ((tx_xfer_hdr_or | tx_xfer_data) & sc_fifo_out_tlast[0]) | (tx_xfer_hdr_data & sc_fifo_out_tlast[1]) | 
                        (xfer_count != 0 & sc_fifo_out_tlast[xfer_count]) ) ) | 
                        (payload_width == 512 & ( ((tx_xfer_hdr_or | tx_xfer_data) & |sc_fifo_out_tlast[1:0]) | (xfer_count == 1 & (|sc_fifo_out_tlast[3:2])) ) ); //tx_xfer_data here did not OR with tx_xfer_data_prev because tx_st_eop_i previous state is been preserved with tx_st_eop_i_prev.
  assign tx_header_i = {256{(tx_xfer_hdr_or )}} & sc_fifo_out_tdata[255:0];

  if (payload_width > 256)
    assign data_gt_256 = (tx_xfer_data | tx_xfer_data_prev) ? sc_fifo_out_tkeep[2] : (xfer_count != 0) ? sc_fifo_out_tkeep[6] : 1'b0; //Added in tx_xfer_data_prev to maintain the tx_xfer_data state when tx_st_ready_i is low.
  else
    assign data_gt_256 = 1'b0;

  assign tx_xfer_hdr_data = (tx_xfer_hdr_or ) & sc_fifo_out_tkeep[2];
  assign tx_st_valid_data_i = tx_xfer_hdr_data | (tx_xfer_data | tx_xfer_data_prev) | (xfer_count != 0);  // xfer_count - continue the xfer till tlast //Added in tx_xfer_data_prev to keep the data valid when tx_st_ready_i is low.
end
else
begin // AB: Need to verify for variable and compact packing
  assign tx_st_sop_i = (tx_xfer_hdr_or );
  assign tx_st_eop_i = ((tx_xfer_hdr_or | tx_xfer_data) & sc_fifo_out_tlast[0]) | ((xfer_count != 0) & sc_fifo_out_tlast[xfer_count]); //tx_xfer_data here did not OR with tx_xfer_data_prev because tx_st_eop_i previous state is been preserved with tx_st_eop_i_prev.
  assign tx_header_i = (tx_xfer_hdr_or) ? sc_fifo_out_tdata[255:0] : 0;
  if (payload_width > 256)
    assign data_gt_256 = (tx_xfer_data | tx_xfer_data_prev) ? sc_fifo_out_tkeep[2] : (xfer_count != 0) ? sc_fifo_out_tkeep[6] : 1'b0; //Added in tx_xfer_data_prev to maintain the tx_xfer_data state when tx_st_ready_i is low.
  else
    assign data_gt_256 = 1'b0;

  assign tx_xfer_hdr_data = (tx_xfer_hdr_or) & sc_fifo_out_tkeep[2];
  assign tx_st_valid_data_i = tx_xfer_hdr_data | (tx_xfer_data | tx_xfer_data_prev) | (xfer_count != 0); //Added in tx_xfer_data_prev to keep the data valid when tx_st_ready_i is low.
end

//**Replace pciess_skid_buffer with pciess_data_pipeline. pciess_skid_buffer continue to capture incoming data even when the in_valid is low.
//pciess_skid_buffer #(.DATA_WIDTH (PIPELINE_WIDTH))
//ready_pipeline_inst0 (
//   .clk (clk),
//   .rst_n (reset_n),
//   .in_ready (tx_st_ready_i), 
//   .in_valid (tx_st_valid_data_i |tx_xfer_hdr),
//   .in_data ({tx_st_sop_i,tx_st_eop_i,tx_header_i,tx_data_i,tx_xfer_hdr,hold_xfer,data_gt_256}),
//   .out_ready (tx_st_ready),  
//   .out_valid (tx_st_valid_data_i_p),
//   .out_data ({tx_st_sop_i_p,tx_st_eop_i_p,tx_header_i_p,tx_data_i_p,tx_xfer_hdr_p,hold_xfer_p,data_gt_256_p})
//);

pciess_data_pipeline #(
  .PIPELINE_READY           ( 1                         ), //Cannot PIPELINE ready, else when higher level ready de-assert, the data here still change and will be lost.
  .SYNC_RESET               ( 0                         ),
  .DATA_WIDTH               ( PIPELINE_WIDTH          	)
) ready_pipeline_inst0 (
  .clk                      ( clk            		),
  .reset                    ( ~reset_n       		),
  .in_ready                 ( tx_st_ready_i             ),
  .in_valid                 ( tx_st_valid_data_i |tx_xfer_hdr ),
  .in_data                  ( {tx_st_sop_i,tx_st_eop_i_or,tx_header_i,tx_data_i,(tx_xfer_hdr_or ),hold_xfer,data_gt_256} ), //tx_st_eop is using the OR version.
  .out_ready                ( tx_st_ready               ),
  .out_valid                ( tx_st_valid_data_i_p      ),
  .out_data                 ( {tx_st_sop_i_p,tx_st_eop_i_p,tx_header_i_p,tx_data_i_p,tx_xfer_hdr_p,hold_xfer_p,data_gt_256_p} )
);

// Adding Pipeline registers
//always @(posedge clk or negedge reset_n)
//begin
//  if (!reset_n) begin
//    tx_data_i_p <= 0;
//    tx_st_valid_data_i_p <= 1'b0;
//    tx_st_sop_i_p <= 1'b0;
//    tx_st_eop_i_p <= 1'b0;
//    tx_header_i_p <= 0;
//   tx_xfer_hdr_p <= 1'b0;
//    hold_xfer_p <= 1'b0;
//    data_gt_256_p <= 1'b0;
//  end
//  else begin
//    tx_data_i_p <= tx_data_i;
//   tx_st_valid_data_i_p <= tx_st_valid_data_i;
//    tx_st_sop_i_p <= tx_st_sop_i;
//   tx_st_eop_i_p <= tx_st_eop_i;
//    tx_header_i_p <= tx_header_i;
//   tx_xfer_hdr_p <= tx_xfer_hdr;
//    hold_xfer_p <= hold_xfer;
//    data_gt_256_p <= data_gt_256;
//  end
//end


tx_packer_steer #(
    .DWIDTH (DWIDTH),
    .payload_width   (payload_width),
    .hdr_width       (hdr_width),
    .pfx_width       (pfx_width),
    .pcie_link_width (pcie_link_width),
    .double_width    (double_width),
    .SS_PWIDTH       (SS_PWIDTH),
    .SS_SLOT_WD      (SS_SLOT_WD),
    .SS_PF_WD        (SS_PF_WD),
    .SS_VF_WD        (SS_VF_WD),
    .SEGMENT_SIZE    (SEGMENT_SIZE),
    .TILE            (TILE)
) tx_packer_steer_inst (
    .clk (clk),
    .reset_n (reset_n),
    .data_in (tx_data_i_p),
    .valid_in (tx_st_valid_data_i_p),
    .sop_in (tx_st_sop_i_p),
    .eop_in (tx_st_eop_i_p),
    .header_in (tx_header_i_p),
    .valid_header_in (tx_xfer_hdr_p),
    .hold_xfer (hold_xfer_p),
    .data_gt_256 (data_gt_256_p),  // data size, 1: >256, 0 : < 256
    .avst_ready (1'b1),
    .tx_st_ready (tx_st_ready), // added in tx_st_ready to halt the df_st state machine.
    .data_out (tx_data),
    .valid_out (tx_st_valid),
    .header_out (tx_header),
    .valid_header_out (tx_st_valid_hdr),
    .sop_out (tx_st_sop),
    .eop_out (tx_st_eop)
);

// AB: temporary focus on simple packing and power user mode
assign dm_pwruser_mode = 1'b0;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63cWxT7CDxq+T8qlGslFrilo2rP6zSCp9RN2zUry/umH5nqlH55xyVzz3RFaWkNFLrqTSzyEvT2f54VZkPAyLXO578IWP+75MQ+zk+9mNeq+LGNrTdAgnkj4LfosBA+2zTjWU45DcavNu+3TZi1sjrozM5JxpysVsw8Akvxz0hLfwajoovU098puBIALQ1dadSyXJOc821mlZNyT3426ApBoMkZJfAzPT7mvROaCCNu9aMc5Qdiy6F0ckaLc69L72JTaQw9by8azj8ha7WvavaNpRpIxsfEpsvAvQUeYqaIKvbn5vSjtUgHNyLeSAZcq6iuFrbdgK5PcorKDMduwnpZuhD/tTXoB+h47BQK3+bQHJl3zWZA7x4H2u/Fho8SRnnn4R00GB4WjqVvSiDodgr+fStSRirhl9AiRORqQZu59mDz97GZT0ZrEu0Bui/Br9lx9mVbW7jR/Kg7oIKY1W7qWSDryAn/zWXMiI7Du7cLVv3wAIGlg2+1ksjCK+1amu4WCiu/VaCaNYH2aRFQM9tok6oK972dIn1jFtYQo+JdG1dAPW1EJcqdF1o7mufWCOdCQpdAKTMtdutUWNJ8n/WKrOwzjB/ltk/gYWIb+2sH+L2LGX4JiG7s8hD30Xi+k0eVVPxINOOTAqKXzCRYMBhs4kg3v9V87iaI2s8q9WWZ5/ZINeeXEKTm2V9f9Dn385JVvAvGo3Ur8oCcwCnmoqNBK/4gxbj73v7kGsTb/+ChrNMF8MItesijB1dhQMuEWeMhWvXrAkvv0i3QHVq6IOPp5"
`endif