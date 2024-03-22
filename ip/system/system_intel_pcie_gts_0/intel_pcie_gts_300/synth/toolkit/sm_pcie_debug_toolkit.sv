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


module sm_pcie_debug_toolkit #(
    parameter topology                                = "pcie_x4",
    parameter hard_dtk_en_hwtcl                       = 0,
    parameter sm_enable_pciess_register_access_hwtcl  = 1,
    parameter sm_link_insp_en_hwtcl                   = 1,
    parameter core16_perfmon_clk_freq		      = 250
    ) (
    
    //HIP status
    
    input 	[5:0]      p0_ltssm, // Delayed version from CSB Adaptor @ axi_lite_clk
    input 	[5:0]      p1_ltssm,
	
    input            	   core_pll_lock,  

    input            	   hip_coreclk, 
    input            	   avmm_clk, //axi_lite_clk
    input            	   ninit_done, 

    output logic     	   toolkit_mode,
	
    //intf to PLD, to be connected to lavmm of PLD channels
    output logic	   phy_avmm_read_o,
    output logic	   phy_avmm_write_o,
    output logic [23:0]    phy_avmm_address_o,
    output logic [31:0]    phy_avmm_writedata_o,
    input	     	   phy_avmm_readdatavalid_i,
    input  	 [31:0]    phy_avmm_readdata_i,
    input	     	   phy_avmm_waitrequest_i,
 
    //intf to HIP, to be muxed with hip_reconfig
    output logic           p0_avmm_read_o,
    output logic           p0_avmm_write_o,
    output logic [20:0]    p0_avmm_address_o,
    output logic [31:0]    p0_avmm_writedata_o,
    input            	   p0_avmm_readdatavalid_i,
    input  	 [31:0]    p0_avmm_readdata_i,
    input            	   p0_avmm_waitrequest_i,
	
    //intf to HIP, to be muxed with hip_reconfig
    output logic           p1_avmm_read_o,
    output logic           p1_avmm_write_o,
    output logic [20:0]    p1_avmm_address_o,
    output logic [31:0]    p1_avmm_writedata_o,
    input            	   p1_avmm_readdatavalid_i,
    input  	 [31:0]    p1_avmm_readdata_i,
    input            	   p1_avmm_waitrequest_i,
    
    //intf to SS, to be converted AXI lite at ss top and connected to pX_dbg_lite_csr
    output logic           ss_avmm_read_o, 
    output logic           ss_avmm_write_o,
    output logic [20:0]    ss_avmm_address_o,
    output logic [31:0]    ss_avmm_writedata_o,
    input            	   ss_avmm_readdatavalid_i,
    input  	 [31:0]    ss_avmm_readdata_i,
    input            	   ss_avmm_waitrequest_i
);

    
    localparam CLOCK_RATE_CLK 		    = core16_perfmon_clk_freq*1000000;
    localparam MASTER_ADDR_WIDTH            = 24;
    localparam MASTER_DATA_WIDTH            = 32;
    localparam MASTER_ADDR_DECODE_WIDTH     = 3;

    localparam AVMM_ADDR_WIDTH              = 21; 
    localparam AVMM_DATA_WIDTH              = 32;

    localparam TOOLKIT_ADDR_WIDTH           = 21; 

    logic           avmm_rstn;
    logic           avmm_rstn_d1;
    logic           avmm_rstn_d2;

    logic                           phy_write, pcie0_write, pcie1_write, pciess_write;
    logic                           phy_read, pcie0_read, pcie1_read, pciess_read;
    logic                           phy_readdatavalid, pcie0_readdatavalid, pcie1_readdatavalid, pciess_readdatavalid;
    logic                           phy_waitrequest, pcie0_waitrequest, pcie1_waitrequest, pciess_waitrequest;
    logic [AVMM_DATA_WIDTH-1:0]     pcie0_readdata, pcie1_readdata, pciess_readdata;
	
    logic                           master_write;
    logic                           master_read;
    logic                           master_waitrequest;
    logic                           master_readdatavalid;
    logic [MASTER_ADDR_WIDTH-1:0]   master_address;
    logic [MASTER_DATA_WIDTH-1:0]   master_readdata;
    logic [MASTER_DATA_WIDTH-1:0]   master_writedata;

    logic                           toolkit_switchok;
    logic                           toolkit_write;
    logic                           toolkit_read;
    logic                           toolkit_read_d1;
    logic                           toolkit_readdatavalid;
    logic [TOOLKIT_ADDR_WIDTH-1:0]  toolkit_address;
    logic [MASTER_DATA_WIDTH-1:0]   toolkit_readdata;
    logic [MASTER_DATA_WIDTH-1:0]   toolkit_writedata;
    logic [MASTER_DATA_WIDTH-1:0]   toolkit_readdata_r;    
    logic [MASTER_DATA_WIDTH-1:0]   toolkit_scratch_reg;
    logic                           phy_reg_access_en;
    
    logic [AVMM_ADDR_WIDTH-1:0]     hip_avmm_address;
    logic [AVMM_DATA_WIDTH-1:0]     hip_avmm_writedata;
    logic [MASTER_ADDR_WIDTH-1:0]   phy_avmm_address;
    logic [MASTER_DATA_WIDTH-1:0]   phy_avmm_writedata, phy_readdata;
    logic [MASTER_DATA_WIDTH-1:0]   hip_phy_readdata;

    logic                           link_insp_write;
    logic                           link_insp_read;
    logic                           link_insp_read_d1;
    logic [MASTER_DATA_WIDTH-1:0]   link_insp_readdata;
    logic [MASTER_DATA_WIDTH-1:0]   link_insp_readdata_r;
    logic                           link_insp_readdatavalid;
    logic                           link_insp_readdatavalid_r;
    logic                           link_insp_waitrequest;
   
    logic                           core_pll_lock_avmm_clk;

    logic                           init_done_avmm_sync;

    logic                           p0_user_avmm_waitrequest_s;
    logic                           p1_user_avmm_waitrequest_s;
    logic 			    waitrequest_without_phy;
    
    altera_std_synchronizer_nocut ninit_done_avmm_sync_inst (.clk (avmm_clk),    .reset_n (~ninit_done), .din (1'b1), .dout (init_done_avmm_sync) ); 

    logic [MASTER_ADDR_DECODE_WIDTH-1:0] decode_address;

    assign decode_address           = master_address[23:21];

    assign toolkit_write            = ((decode_address == 3'b000 && !phy_reg_access_en) || (phy_reg_access_en && master_address == 24'h7)) ? master_write : 1'b0;
    assign toolkit_read             = ((decode_address == 3'b000 && !phy_reg_access_en) || (phy_reg_access_en && master_address == 24'h7)) ? master_read  : 1'b0;
    assign pcie0_write              = (decode_address == 3'b001 && !phy_reg_access_en) ? master_write : 1'b0;
    assign pcie0_read               = (decode_address == 3'b001 && !phy_reg_access_en) ? master_read  : 1'b0;
    assign pcie1_write              = (decode_address == 3'b010 && !phy_reg_access_en) ? master_write : 1'b0;
    assign pcie1_read               = (decode_address == 3'b010 && !phy_reg_access_en) ? master_read  : 1'b0;
    assign link_insp_write          = (decode_address == 3'b101 && !phy_reg_access_en) ? master_write : 1'b0; 
    assign link_insp_read           = (decode_address == 3'b101 && !phy_reg_access_en) ? master_read  : 1'b0;
    assign phy_write                = (phy_reg_access_en && master_address != 24'h7) ? master_write : 1'b0;
    assign phy_read                 = (phy_reg_access_en && master_address != 24'h7) ? master_read  : 1'b0;
    assign pciess_write             = (decode_address == 3'b111 && !phy_reg_access_en) ? master_write : 1'b0;
    assign pciess_read              = (decode_address == 3'b111 && !phy_reg_access_en) ? master_read  : 1'b0;

    assign toolkit_switchok         = !(p0_user_avmm_waitrequest_s | p1_user_avmm_waitrequest_s);
    assign toolkit_address          = master_address[TOOLKIT_ADDR_WIDTH-1:0];
    assign toolkit_writedata        = master_writedata[MASTER_DATA_WIDTH-1:0];
    assign phy_avmm_address         = master_address; 		//[23:21] for channel sel; [20:0] for LAVMM
    assign phy_avmm_writedata       = master_writedata[MASTER_DATA_WIDTH-1:0];
    assign hip_avmm_address         = master_address[AVMM_ADDR_WIDTH-1:0];
    assign hip_avmm_writedata       = master_writedata[AVMM_DATA_WIDTH-1:0];


    altera_std_synchronizer_nocut p0_user_avmm_waitrequest_sync (.clk (avmm_clk), .reset_n (init_done_avmm_sync), .din (pcie0_waitrequest), .dout (p0_user_avmm_waitrequest_s) );
	
	generate if (topology == "pcie_x4x4" || topology == "pcie_x4x2" || topology == "pcie_x4x1" || topology == "pcie_x2x4" || topology == "pcie_x2x2" || topology == "pcie_x2x1" || topology == "pcie_x1x4" || topology == "pcie_x1x2" || topology == "pcie_x1x1") begin
		altera_std_synchronizer_nocut p1_user_avmm_waitrequest_sync (.clk (avmm_clk), .reset_n (pcie1_waitrequest), .din (1'b1), .dout (p1_user_avmm_waitrequest_s) );
	end else begin
		assign p1_user_avmm_waitrequest_s = '0;
	end
	endgenerate

    assign phy_avmm_read_o          = phy_read;
    assign phy_avmm_write_o         = phy_write;
    assign phy_avmm_writedata_o     = phy_avmm_writedata;
    assign phy_avmm_address_o       = phy_avmm_address;
    assign phy_readdata             = phy_avmm_readdata_i;
    assign phy_readdatavalid        = phy_avmm_readdatavalid_i;
    assign phy_waitrequest          = phy_avmm_waitrequest_i;

    generate
        if (topology != "DISABLED_SYSTEM" && sm_enable_pciess_register_access_hwtcl ==1) begin
            assign ss_avmm_read_o        = pciess_read;
            assign ss_avmm_write_o       = pciess_write;
            assign ss_avmm_writedata_o   = hip_avmm_writedata;
            assign ss_avmm_address_o     = hip_avmm_address;
            assign pciess_readdata       = ss_avmm_readdata_i;
            assign pciess_readdatavalid  = ss_avmm_readdatavalid_i;
            assign pciess_waitrequest    = ss_avmm_waitrequest_i;
        end else begin 
            assign ss_avmm_read_o        = 1'b0;
            assign ss_avmm_write_o       = 1'b0;
            assign ss_avmm_writedata_o   = {AVMM_DATA_WIDTH{1'b0}};
            assign ss_avmm_address_o     = {AVMM_ADDR_WIDTH{1'b0}};
            assign pciess_readdata       = {AVMM_DATA_WIDTH{1'b0}};
            assign pciess_readdatavalid  = 1'b0; 
            assign pciess_waitrequest    = 1'b0; 
        end
    endgenerate

	generate
        if (topology != "DISABLED_SYSTEM") begin
            assign p0_avmm_read_o         = pcie0_read;
            assign p0_avmm_write_o        = pcie0_write;
            assign p0_avmm_writedata_o    = hip_avmm_writedata;
            assign p0_avmm_address_o      = hip_avmm_address;
            assign pcie0_readdata         = p0_avmm_readdata_i;
            assign pcie0_readdatavalid    = p0_avmm_readdatavalid_i;
            assign pcie0_waitrequest      = p0_avmm_waitrequest_i;
        end else begin 
            assign p0_avmm_read_o         = 1'b0;
            assign p0_avmm_write_o        = 1'b0;
            assign p0_avmm_writedata_o    = {AVMM_DATA_WIDTH{1'b0}};
            assign p0_avmm_address_o      = {AVMM_ADDR_WIDTH{1'b0}};
            assign pcie0_readdata         = {AVMM_DATA_WIDTH{1'b0}};
            assign pcie0_readdatavalid    = 1'b0; 
            assign pcie0_waitrequest      = 1'b0; 
        end
    endgenerate
	
	generate 
        if (topology == "pcie_x4x4" || topology == "pcie_x4x2" || topology == "pcie_x4x1" || topology == "pcie_x2x4" || topology == "pcie_x2x2" || topology == "pcie_x2x1" || topology == "pcie_x1x4" || topology == "pcie_x1x2" || topology == "pcie_x1x1") begin
            assign p1_avmm_read_o         = pcie1_read;
            assign p1_avmm_write_o        = pcie1_write;
            assign p1_avmm_writedata_o    = hip_avmm_writedata;
            assign p1_avmm_address_o      = hip_avmm_address; 
            assign pcie1_readdata         = p1_avmm_readdata_i;
            assign pcie1_readdatavalid    = p1_avmm_readdatavalid_i;
            assign pcie1_waitrequest      = p1_avmm_waitrequest_i;
        end else begin 
            assign p1_avmm_read_o         = 1'b0;
            assign p1_avmm_write_o        = 1'b0;
            assign p1_avmm_writedata_o    = {AVMM_DATA_WIDTH{1'b0}};
            assign p1_avmm_address_o      = {AVMM_ADDR_WIDTH{1'b0}};
            assign pcie1_readdata         = {AVMM_DATA_WIDTH{1'b0}};
            assign pcie1_readdatavalid    = 1'b0; 
            assign pcie1_waitrequest      = 1'b0; 
        end
    endgenerate
	
/////    assign hip_phy_readdata     = pcie0_readdata | pcie1_readdata | pciess_readdata;
/////    assign master_readdata      = hip_phy_readdata | phy_readdata |toolkit_readdata_r | link_insp_readdata_r;
    assign master_readdata      = ((decode_address == 3'b000 && !phy_reg_access_en) || (phy_reg_access_en && master_address == 24'h7)) ? toolkit_readdata_r : (decode_address == 3'b001 && !phy_reg_access_en) ? pcie0_readdata : (decode_address == 3'b101 && !phy_reg_access_en) ? link_insp_readdata_r : (decode_address == 3'b111 && !phy_reg_access_en) ? pciess_readdata : (phy_reg_access_en) ? phy_readdata : toolkit_readdata_r;
    assign master_readdatavalid = phy_readdatavalid | pcie0_readdatavalid | pcie1_readdatavalid | pciess_readdatavalid | toolkit_readdatavalid | link_insp_readdatavalid_r; 
/////    assign master_waitrequest   = phy_waitrequest | pcie0_waitrequest | pcie1_waitrequest | (pciess_waitrequest & decode_address == 3'b111) | link_insp_waitrequest; 
    assign waitrequest_without_phy = pcie0_waitrequest | pcie1_waitrequest | (pciess_waitrequest & decode_address == 3'b111) | link_insp_waitrequest;
    assign master_waitrequest   =  phy_reg_access_en ? (waitrequest_without_phy | phy_waitrequest) : waitrequest_without_phy;

    // 2^24 * 4 is span
    localparam set_slave_map  = {"{typeName agilex5_debug_toolkit_adme address 0x0 span 67108864 hpath {adme}}"};
    // adme address : 24 + 2'b00 
    //                console   |   adme
    //                  0x4     |    0x1
    //                  0x8     |    0x2

       
`ifdef DTK_SIM_ONLY
   assign master_write     = '0;
   assign master_read      = '0;
   assign master_address   = '0;
   assign master_writedata = '0;
`else
       altera_debug_master_endpoint #(
          .ADDR_WIDTH                     ( MASTER_ADDR_WIDTH ),
          .DATA_WIDTH                     ( MASTER_DATA_WIDTH ),
          .HAS_RDV                        ( 1 ),
          .SLAVE_MAP                      ( set_slave_map ),
          .PREFER_HOST                    ( "" ),
          .CLOCK_RATE_CLK                 ( CLOCK_RATE_CLK)
       ) adme (
          .clk                            (avmm_clk),
          .reset                          (!avmm_rstn),
          .master_write                   (master_write),
          .master_read                    (master_read),
          .master_address                 (master_address),
          .master_writedata               (master_writedata),
          .master_waitrequest             (master_waitrequest),
          .master_readdatavalid           (master_readdatavalid),
          .master_readdata                (master_readdata)
       );       
`endif

    
    assign avmm_rstn = avmm_rstn_d2;

    always_ff @(posedge avmm_clk)
    begin
        if (~init_done_avmm_sync) begin
            avmm_rstn_d1 <= 1'b0;
            avmm_rstn_d2 <= 1'b0;
        end else begin
            avmm_rstn_d1 <= 1'b1;
            avmm_rstn_d2 <= avmm_rstn_d1;
        end
    end

    always_ff @(posedge avmm_clk)
    begin
        if (!avmm_rstn) begin
            toolkit_read_d1 <= 1'b0;
        end else begin
            toolkit_read_d1 <= toolkit_read;
        end
    end

    always_ff @(posedge avmm_clk)
    begin
        if (!avmm_rstn) begin
            toolkit_readdatavalid <= 1'b0;
            toolkit_readdata_r <= {MASTER_DATA_WIDTH{1'b0}};
        end else begin
            if ( toolkit_read_d1 == 1'b1 && toolkit_read == 1'b0 ) begin
                toolkit_readdatavalid <= 1'b1;
                toolkit_readdata_r <= toolkit_readdata;
            end else begin
                toolkit_readdatavalid <= 1'b0;
                toolkit_readdata_r <= {MASTER_DATA_WIDTH{1'b0}};
            end    
        end
    end

    always_ff @(posedge avmm_clk)
    begin
        if (!avmm_rstn) begin
            toolkit_mode <= 1'b0;
            phy_reg_access_en <= 1'b0;
            toolkit_scratch_reg <= {MASTER_DATA_WIDTH{1'b0}};
        end else begin
            if (toolkit_write) begin
                case (toolkit_address)
                    21'h2      : begin
                                     toolkit_mode <= toolkit_mode;
                                     phy_reg_access_en <= phy_reg_access_en;
                                     toolkit_scratch_reg <= master_writedata;
				 end
		    21'h6      : begin
                                     toolkit_mode <= master_writedata[0];
                                     phy_reg_access_en <= phy_reg_access_en;
                                     toolkit_scratch_reg <= toolkit_scratch_reg;
                                 end
		    21'h7      : begin
                                     toolkit_mode <= toolkit_mode;
                                     phy_reg_access_en <= master_writedata[0];
                                     toolkit_scratch_reg <= toolkit_scratch_reg;
                                 end
                    default    : begin
                                     toolkit_mode <= toolkit_mode;
                                     phy_reg_access_en <= phy_reg_access_en;
                                     toolkit_scratch_reg <= toolkit_scratch_reg;
                                 end
                endcase
            end
        end
    end

   // CDC fix: Sync core_pll_lock to avmm_clk domain
   altera_std_synchronizer_nocut core_pll_lock_sync_inst (.clk (avmm_clk), .reset_n (1'b1), .din (core_pll_lock), .dout (core_pll_lock_avmm_clk) );

    always_ff @(posedge avmm_clk)
    begin
        if (!avmm_rstn) begin
            toolkit_readdata <= {MASTER_DATA_WIDTH{1'b0}};
        end else begin
            if (toolkit_read) begin
                case (toolkit_address)
                    21'h0 :   toolkit_readdata <= 32'h0929_2023;
                    21'h1 :   toolkit_readdata <= {31'b0, core_pll_lock_avmm_clk};
                    21'h2 :   toolkit_readdata <= toolkit_scratch_reg;
                    21'h3 :   toolkit_readdata <= 32'b0;
                    21'h4 :   toolkit_readdata <= 32'b0;
                    21'h5 :   toolkit_readdata <= 32'b0;
		    21'h6 :   toolkit_readdata <= {30'b0, toolkit_switchok, toolkit_mode};
                    21'h7 :   toolkit_readdata <= {31'b0, phy_reg_access_en};
                    default : toolkit_readdata <= toolkit_scratch_reg;
                endcase
            end
        end
    end

  //link inspector
  generate
  if ((sm_link_insp_en_hwtcl == 1) && (hard_dtk_en_hwtcl == 0)) begin : gen_link_insp
    always_ff @(posedge avmm_clk)
    begin
        if (!avmm_rstn) begin
            link_insp_read_d1 <= 1'b0;
        end else begin
            link_insp_read_d1 <= link_insp_read;
        end
    end
    
    always_ff @(posedge avmm_clk)
    begin
        if (!avmm_rstn) begin
            link_insp_readdatavalid_r <= 1'b0;
            link_insp_readdata_r <= {MASTER_DATA_WIDTH{1'b0}};
        end else begin
            if ( link_insp_read_d1 == 1'b1 && link_insp_read == 1'b0 ) begin
                link_insp_readdatavalid_r <= 1'b1;
                link_insp_readdata_r <= link_insp_readdata;
            end else begin
                link_insp_readdatavalid_r <= 1'b0;
                link_insp_readdata_r <= {MASTER_DATA_WIDTH{1'b0}};
            end    
        end
    end
    
    sm_link_inspector_top #(
      .topology   (topology)
    ) sm_link_insp (    
      .p0_ltssm_state      (p0_ltssm),
      .p1_ltssm_state      (p1_ltssm),
      .hip_coreclk         (hip_coreclk),
      .avmm_clk            (avmm_clk),
      .avmm_reset_n        (!avmm_rstn),
      .avmm_write          (link_insp_write),
      .avmm_read           (link_insp_read),
      .avmm_address        (master_address[3:0]),
      .avmm_writedata      (master_writedata),
      .avmm_readdatavalid  (link_insp_readdatavalid),
      .avmm_readdata       (link_insp_readdata),
      .avmm_waitrequest    (link_insp_waitrequest),
      .ninit_done          (ninit_done)
     );
   end else begin : gen_no_link_insp
        assign link_insp_readdatavalid_r = 1'b0;
        assign link_insp_readdata_r = {MASTER_DATA_WIDTH{1'b0}};
	assign link_insp_waitrequest = 1'b0;
   end
   
   endgenerate
     
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63f4ayQSXDfY4O+ZVWSYPBohJv2d1+HhN6JpjbkkdB68XCrBxI1ilvPJV7TEASCajPMs6XFg57MZ8kzrT54xIhk5o4xrS/cjYK078uXuw2Fz6iSRh1heV2jVh1pfzhanjUlaQBRTBUiK2UEPKtwGH1PqJ34x9xSCKPmqwaBGjQ2Uofl2xxeLA/kElyFdeFDQNRX9ihXvTqiQEP9BGf8AUdCHIlbjYfs3xrL5bK9jnLSjir3tHCx6j7wPAbgnYEnulLNNeGwnqeqboNI9NviAhQmAqzQ6veqcB4cNqPPCg01XV/SEWXRFWb1Lv1vs6lYf1MK070nKc2NYnwHBOEnoVmxGjkP+VxSOVN0A7GLv0U7ii1qv3sIiJnoIHlZXg/Bf3cx3imBx6kPoVqPymPB1abHfmQUKjioFmUwnlFkH+sgtNRudrxD2Epn9pBnTaUe6HZlFXmUjBoxBfO+ZU+gp98Bjf5GWVhILWp/ma+ZD+Jq+RM+52EYqcIO15o7zHJNXZkcQDXgNZ2O1PBnaGRbrxAUTZUmOqOyPVwD4/cOvSnrVBmN2ezRTsfen5xIwqzBLz96OPLB7QHh7pUHjkvbFh8/2tMMbDeuVZASy0/5Xuv8osGNN85oRXo8stkc5IWXBM+7lXOpu+H38gaBgXh+Ky74q17xEkjpcfD2kBG3zBbdTXMBlR1lWHqP7ivbsYpBiLqE2r0bPLkMv+rAv5k+kVAYaAuo+ZsxbrjN+oCu89iF8QTgU9pATojCPk3BCChbPz02az3rYMQC46VlOcmCKrCjp"
`endif