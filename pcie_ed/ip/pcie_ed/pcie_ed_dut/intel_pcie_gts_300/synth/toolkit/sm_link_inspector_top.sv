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


module sm_link_inspector_top # (
    parameter topology    = "pcie_x4"
    ) (
        
    input [5:0]     p0_ltssm_state,
    input [5:0]     p1_ltssm_state,
    
    input           hip_coreclk,
	// From ADME
	input                            avmm_write,             
    input  [ 3:0]                    avmm_address,          
    input  [31:0]                    avmm_writedata,       
    input                            avmm_read,           
    output [31:0]                    avmm_readdata,      
    output                           avmm_readdatavalid,
    input                            avmm_clk,
    input                            avmm_reset_n,
    output                           avmm_waitrequest,
    
    input           ninit_done
    
	);
  
  localparam LTSSM_COUNTER_WIDTH = 26 ;
  
  logic [LTSSM_COUNTER_WIDTH-1:0] p0_ltssm_counter_value;
  logic [LTSSM_COUNTER_WIDTH-1:0] p1_ltssm_counter_value;
    
  logic [5:0]  p0_captured_ltssm_state;
  logic [5:0]  p1_captured_ltssm_state;
  
  logic [(LTSSM_COUNTER_WIDTH+6)-1:0] p0_ltssm_fifo_q;
  logic [(LTSSM_COUNTER_WIDTH+6)-1:0] p1_ltssm_fifo_q;
 
  logic        p0_state_transition;
  logic        p1_state_transition;
   
  logic        p0_ltssm_fifo_wrreq;
  logic        p1_ltssm_fifo_wrreq;
  		       
  logic        p0_ltssm_fifo_rdreq;
  logic        p1_ltssm_fifo_rdreq;
    
  logic        p0_ltssm_fifo_wrfull;
  logic        p1_ltssm_fifo_wrfull;
  
  logic        p0_ltssm_fifo_rdfull;
  logic        p1_ltssm_fifo_rdfull;
    
  logic        p0_ltssm_fifo_wrempty;
  logic        p1_ltssm_fifo_wrempty;
    
  logic        p0_ltssm_fifo_rdempty;
  logic        p1_ltssm_fifo_rdempty;
  
  logic [9:0]  p0_ltssm_fifo_rdusedw;
  logic [9:0]  p1_ltssm_fifo_rdusedw;
    
  logic        avmm_read_r;
  logic [31:0] avmm_readdata_r;
  
  logic readdatavalid_r;  
  logic readdatavalid_r2;  

//  PCIe HIP port 0 - ADME base address: 0x20_0000
//  PCIe HIP port 1 - ADME base address: 0x40_0000

  assign avmm_readdata = avmm_readdata_r;
  assign avmm_readdatavalid = readdatavalid_r2;
  assign avmm_waitrequest = avmm_read && !readdatavalid_r2;

  always_ff @(posedge avmm_clk) begin
        avmm_read_r <= avmm_read;
		
		readdatavalid_r2 <= readdatavalid_r;
  end
  
  always @(posedge avmm_clk) begin
	readdatavalid_r <= avmm_read && !avmm_read_r;
  end
  
  generate
	if (topology == "pcie_x1" || topology == "pcie_x2" || topology == "pcie_x4" || topology == "pcie_x8") begin : PCIE_QUAD
        ltssm_monitor # (
			.LTSSM_COUNTER_WIDTH (LTSSM_COUNTER_WIDTH)
		) ltssm_counter_p0_pcie_quad (
            .clk                           (hip_coreclk),
            .ninit_done                    (ninit_done),
			.ltssm_state_i                 (p0_ltssm_state),
            .ltssm_counter_value_o         (p0_ltssm_counter_value),
            .state_transition_o            (p0_state_transition),
            .captured_ltssm_state_o        (p0_captured_ltssm_state)
          );
		  
		assign p0_ltssm_fifo_wrreq      = (~p0_ltssm_fifo_wrfull && (p0_state_transition));
		assign p0_ltssm_fifo_rdreq      = (!p0_ltssm_fifo_rdempty & (avmm_read & !avmm_read_r) & (avmm_address[3:0] == 4'b0010));
      
		dcfifo  ltssm_fifo_p0_pcie_quad (
            .aclr 		(ninit_done),
            .data 		({p0_ltssm_counter_value,p0_captured_ltssm_state}),
            .rdclk 		(avmm_clk),
            .rdreq 		(p0_ltssm_fifo_rdreq),
            .wrclk 		(hip_coreclk),
            .wrreq 		(p0_ltssm_fifo_wrreq),
            .q 			(p0_ltssm_fifo_q),
            .rdempty 	(p0_ltssm_fifo_rdempty),
            .rdfull 	(p0_ltssm_fifo_rdfull), //for FIFO rdfull status
            .rdusedw 	(p0_ltssm_fifo_rdusedw),
            .wrempty 	(p0_ltssm_fifo_wrempty),
            .wrfull 	(p0_ltssm_fifo_wrfull)
		);   
		defparam
            ltssm_fifo_p0_pcie_quad.intended_device_family  = "Agilex 5",
            ltssm_fifo_p0_pcie_quad.lpm_numwords  = 1024,
            ltssm_fifo_p0_pcie_quad.lpm_showahead  = "OFF",
            ltssm_fifo_p0_pcie_quad.lpm_type  = "dcfifo",
            ltssm_fifo_p0_pcie_quad.lpm_width  = 32,
            ltssm_fifo_p0_pcie_quad.lpm_widthu  = 10,
            ltssm_fifo_p0_pcie_quad.overflow_checking  = "OFF",
            ltssm_fifo_p0_pcie_quad.rdsync_delaypipe  = 4,
            ltssm_fifo_p0_pcie_quad.read_aclr_synch  = "ON",
            ltssm_fifo_p0_pcie_quad.underflow_checking  = "OFF",
            ltssm_fifo_p0_pcie_quad.use_eab  = "ON",
            ltssm_fifo_p0_pcie_quad.write_aclr_synch  = "ON",
            ltssm_fifo_p0_pcie_quad.wrsync_delaypipe  = 4;		

		always_ff @ (posedge avmm_clk) begin
			case (avmm_address)
				4'b0010: avmm_readdata_r <= p0_ltssm_fifo_q;
				4'b0011: avmm_readdata_r <= {20'h0, p0_ltssm_fifo_rdempty, p0_ltssm_fifo_rdfull, p0_ltssm_fifo_rdusedw};
				default: avmm_readdata_r <= 32'h0; //outside of 20_0000-9F_FFFF
			endcase
		end //always_ff
		
		assign p1_ltssm_counter_value 	= 0;
        assign p1_state_transition     	= 0;      
        assign p1_captured_ltssm_state	= 0;    		
	      
    end else begin : PCIE_OCTAL
        ltssm_monitor # (
			.LTSSM_COUNTER_WIDTH (LTSSM_COUNTER_WIDTH)
		) ltssm_counter_p0_pcie_octal (
            .clk                           (hip_coreclk),
            .ninit_done                    (ninit_done),
			.ltssm_state_i                 (p0_ltssm_state),
            .ltssm_counter_value_o         (p0_ltssm_counter_value),
            .state_transition_o            (p0_state_transition),
            .captured_ltssm_state_o        (p0_captured_ltssm_state)
          );
      
		assign p0_ltssm_fifo_wrreq      = (~p0_ltssm_fifo_wrfull && (p0_state_transition));
		assign p0_ltssm_fifo_rdreq      = (!p0_ltssm_fifo_rdempty & (avmm_read & !avmm_read_r) & (avmm_address[3:0] == 4'b0010));
      
		dcfifo  ltssm_fifo_p0_pcie_octal (
            .aclr 		(ninit_done),
            .data 		({p0_ltssm_counter_value,p0_captured_ltssm_state}),
            .rdclk 		(avmm_clk),
            .rdreq 		(p0_ltssm_fifo_rdreq),
            .wrclk 		(hip_coreclk),
            .wrreq 		(p0_ltssm_fifo_wrreq),
            .q 			(p0_ltssm_fifo_q),
            .rdempty 	(p0_ltssm_fifo_rdempty),
            .rdfull 	(p0_ltssm_fifo_rdfull), //for FIFO rdfull status
            .rdusedw 	(p0_ltssm_fifo_rdusedw),
            .wrempty 	(p0_ltssm_fifo_wrempty),
            .wrfull 	(p0_ltssm_fifo_wrfull)
			);
			
		defparam
            ltssm_fifo_p0_pcie_octal.intended_device_family  = "Agilex 5",
            ltssm_fifo_p0_pcie_octal.lpm_numwords  = 1024,
            ltssm_fifo_p0_pcie_octal.lpm_showahead  = "OFF",
            ltssm_fifo_p0_pcie_octal.lpm_type  = "dcfifo",
            ltssm_fifo_p0_pcie_octal.lpm_width  = 32,
            ltssm_fifo_p0_pcie_octal.lpm_widthu  = 10,
            ltssm_fifo_p0_pcie_octal.overflow_checking  = "OFF",
            ltssm_fifo_p0_pcie_octal.rdsync_delaypipe  = 4,
            ltssm_fifo_p0_pcie_octal.read_aclr_synch  = "ON",
            ltssm_fifo_p0_pcie_octal.underflow_checking  = "OFF",
            ltssm_fifo_p0_pcie_octal.use_eab  = "ON",
            ltssm_fifo_p0_pcie_octal.write_aclr_synch  = "ON",
            ltssm_fifo_p0_pcie_octal.wrsync_delaypipe  = 4;		

        ltssm_monitor # (
			.LTSSM_COUNTER_WIDTH (LTSSM_COUNTER_WIDTH)
		) ltssm_counter_p1_pcie_octal (
            .clk                           (hip_coreclk),
            .ninit_done                    (ninit_done),
            .ltssm_state_i                 (p1_ltssm_state),
            .ltssm_counter_value_o         (p1_ltssm_counter_value),
            .state_transition_o            (p1_state_transition),
            .captured_ltssm_state_o        (p1_captured_ltssm_state)
          );
      
		assign p1_ltssm_fifo_wrreq      = (~p1_ltssm_fifo_wrfull && (p1_state_transition));
		assign p1_ltssm_fifo_rdreq      = (!p1_ltssm_fifo_rdempty & (avmm_read & !avmm_read_r) & (avmm_address[3:0] == 4'b0100));
      
		dcfifo  ltssm_fifo_p1_pcie_octal (
            .aclr 		(ninit_done),
            .data 		({p1_ltssm_counter_value,p1_captured_ltssm_state}),
            .rdclk 		(avmm_clk),
            .rdreq 		(p1_ltssm_fifo_rdreq),
            .wrclk 		(hip_coreclk),
            .wrreq 		(p1_ltssm_fifo_wrreq),
            .q 			(p1_ltssm_fifo_q),
            .rdempty 	(p1_ltssm_fifo_rdempty),
            .rdfull 	(p1_ltssm_fifo_rdfull), //for FIFO rdfull status
            .rdusedw 	(p1_ltssm_fifo_rdusedw),
            .wrempty 	(p1_ltssm_fifo_wrempty),
            .wrfull 	(p1_ltssm_fifo_wrfull)
			);       

		defparam
            ltssm_fifo_p1_pcie_octal.intended_device_family  = "Agilex 5",
            ltssm_fifo_p1_pcie_octal.lpm_numwords  = 1024,
            ltssm_fifo_p1_pcie_octal.lpm_showahead  = "OFF",
            ltssm_fifo_p1_pcie_octal.lpm_type  = "dcfifo",
            ltssm_fifo_p1_pcie_octal.lpm_width  = 32,
            ltssm_fifo_p1_pcie_octal.lpm_widthu  = 10,
            ltssm_fifo_p1_pcie_octal.overflow_checking  = "OFF",
            ltssm_fifo_p1_pcie_octal.rdsync_delaypipe  = 4,
            ltssm_fifo_p1_pcie_octal.read_aclr_synch  = "ON",
            ltssm_fifo_p1_pcie_octal.underflow_checking  = "OFF",
            ltssm_fifo_p1_pcie_octal.use_eab  = "ON",
            ltssm_fifo_p1_pcie_octal.write_aclr_synch  = "ON",
            ltssm_fifo_p1_pcie_octal.wrsync_delaypipe  = 4;	

		always_ff @ (posedge avmm_clk) begin
			case (avmm_address)
				4'b0010: avmm_readdata_r <= p0_ltssm_fifo_q;
                4'b0011: avmm_readdata_r <= {20'h0, p0_ltssm_fifo_rdempty, p0_ltssm_fifo_rdfull, p0_ltssm_fifo_rdusedw};
				4'b0100: avmm_readdata_r <= p1_ltssm_fifo_q;
                4'b0111: avmm_readdata_r <= {20'h0, p1_ltssm_fifo_rdempty, p1_ltssm_fifo_rdfull, p1_ltssm_fifo_rdusedw};
				default: avmm_readdata_r <= 32'h0; //outside of 20_0000-9F_FFFF
			endcase
		end //always_ff

    end
	endgenerate

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63eEiX6mOSu33YHnf+ChZ/TbV8huh1kcfV5qZQTxD+AGfxFZ2M81sWfsHGUXoPYXvZ5gOB4ks6m7DTrh58aSDB7WDXo8dIXGtnuHuTiLYDdzUEcfYnz2aepf0GlCjYJrF68ipTlHlVrh8u62Ke8zMzYIDQCexFoh1/kGT1nvbYBc2ZtEsEQis6qCAJdfaNkH07dP1/xk2+8drQdPQvVJQc+wbatWDMSYxlvUZjpdV8BuaiBQvWik2tqcaeuPILGYmzGlFkBovP7cIq+XemvtfCQP7jbjCMolMYPC6T8UlDG0hsfFpmhnok/7iWAn9uiFE2ZdRUeNmOYsqCGbvly8reCQX0CQd18O3TGWEaPw5/Z5DgISKGmxjnqInDJWpelJZoXfy+n8Rnda1ktwxY2CzBLd6ofL2Yjn0KPS6rLP2HBUTcAKI3XEldXIc1oBa+qWmvdC5/gihsY6NDT73zEuNAmFEmm69A0hG8eATp+wTo3VJlP1TVulLqF4lrGLQzZQ5DZfp4XKc436IJHYcWSe+uYe2Fr9zN40YGJKbLPEv9qW3AgDm04F7hEUIcDAiAQlPFzIIlMMFZM/JHyIdwn5Ssd9SOIK4ihh4DxKxsuhpfKKcD7ZkhfAVDySrgB0iM1gdUOryBiFNu7ItCnZDN91dNR0UUBLgTodONMt1Byz02Lwk0FbplKj8h2JA/oRra6ou2+uj/b7EdhkUAkwSNBIdGeALrIx1z/B3Ri8Ab1PO9W8WcLkZO3OwxbYcMPTT5FAeCE1z6o5s3QqUcuiMDYDIGZJ"
`endif