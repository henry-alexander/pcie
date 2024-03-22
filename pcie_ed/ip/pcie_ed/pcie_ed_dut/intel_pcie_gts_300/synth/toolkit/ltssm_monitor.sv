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


module ltssm_monitor # (
	parameter LTSSM_COUNTER_WIDTH = 26
    ) (
	input           					clk,

    input 								ninit_done,  //may change core_pll_lock

    //HIP status
   
    input [5:0]     					ltssm_state_i,
	
	output [LTSSM_COUNTER_WIDTH-1:0]   	ltssm_counter_value_o,
	output          					state_transition_o,
	output [5:0]    					captured_ltssm_state_o
	);
	
	logic [LTSSM_COUNTER_WIDTH-1:0] ltssm_counter_value_r;
	logic [5:0]  saved_ltssm_state;
	logic [5:0]  saved_ltssm_state_r;
	logic [5:0]  saved_ltssm_state_r2;
	logic [1:0]  ltssm_counter_state;
	logic [1:0]  ltssm_counter_nxt_state;
	logic [25:0] ltssm_counter_value_w;
  
        logic        init_done_hip_coreclk_sync;

        altera_std_synchronizer_nocut ninit_done_hip_coreclk_sync_inst (.clk (clk),    .reset_n (~ninit_done), .din (1'b1), .dout (init_done_hip_coreclk_sync) );
    localparam  INITIALIZE     = 2'b00;
	localparam  COUNT          = 2'b01;
	localparam  CHANGE_STATE   = 2'b10;
  
	logic state_transition_r;
	logic [5:0] captured_ltssm_state_r;
	logic [LTSSM_COUNTER_WIDTH-1:0] ltssm_counter_value_r2;
  
	assign state_transition_o = state_transition_r;                               
	assign captured_ltssm_state_o = captured_ltssm_state_r;
	assign ltssm_counter_value_o = ltssm_counter_value_r2;

	always_ff @ (posedge clk) begin
		saved_ltssm_state 		<= ltssm_state_i;
		saved_ltssm_state_r 	<= saved_ltssm_state;
		saved_ltssm_state_r2 	<= saved_ltssm_state_r;
		captured_ltssm_state_r 	<= saved_ltssm_state_r2;
		ltssm_counter_value_r2 	<= ltssm_counter_value_r;
		state_transition_r    	<= ((ltssm_counter_state == CHANGE_STATE) && (saved_ltssm_state_r == saved_ltssm_state) && (ltssm_counter_value_r2 != 'h0)); // to save last state after pin_perst            
	end

	always_ff @ (posedge clk) begin
		if (~init_done_hip_coreclk_sync)
			ltssm_counter_state <= INITIALIZE;
		else 
			ltssm_counter_state <= ltssm_counter_nxt_state;
	end
  
	always_comb begin
		case(ltssm_counter_state)
			INITIALIZE:
				if (~init_done_hip_coreclk_sync)
					ltssm_counter_nxt_state = INITIALIZE;
				else
					ltssm_counter_nxt_state = CHANGE_STATE;
			COUNT:
				if (saved_ltssm_state == saved_ltssm_state_r)
					ltssm_counter_nxt_state = COUNT;
				else
					ltssm_counter_nxt_state = CHANGE_STATE;
			CHANGE_STATE:
				ltssm_counter_nxt_state = COUNT;
			default:
				ltssm_counter_nxt_state = INITIALIZE; 
		endcase
	end

    always_ff @ (posedge clk) begin
	    ltssm_counter_value_r <= ltssm_counter_value_w;
	end
  
    always_comb begin
		if (ltssm_counter_state == INITIALIZE)
			ltssm_counter_value_w = {LTSSM_COUNTER_WIDTH{1'b0}};
		else if (ltssm_counter_state == COUNT)
			ltssm_counter_value_w = ltssm_counter_value_r + 1'h1;
		else //CHANGE_STATE
		  ltssm_counter_value_w = 'b1;
	end
  
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63f5b9JhPPsUbztjA+h0sCCRbHxmAxw71jumBuT8VStHyXr+EW5sqPfZBz5MIpsaQRAKbV37eFC1lYVLamkTzpcRFOVNzEiKJK74OvWkyQeuH2BUPD3tMAHcAYb8d6vuoqo+hE05JTVJglp4kkqU2JSVVyx6d97ZeQ/pY8dF7psuHJ12/TCDjPFHjsLVg6EzpB1EvmnP1y6M0wx1xQlYUh/M9BNp6grphhzdlWcm1t59ok++nmz+FJK816EY8fX1DdlQkUb09utqo7tqOX7UGqpqoywqP/O1qLmqLMWnO31RRx6R4ZLcH5rBKmEuBgoAd/hopsqFU+tvCUHGpkzCUfyGqTD0aQ5rJQaatkRJydzuupOX1tua7i4GxqM2lW1FVAPOMeywgz/A8qiQq+bXKZWo9AvaVAt1yRW3FzIr2oGCN6t94mZc7gO5wy9ddwX9yn0/I1rMrgCH4ltEY6SAPmrt05eHw/WKVlKlEVg4oulc71TH/jny1+YFyjMikdesnlGCbKqqmMk8X+xLoApo0dtJ4FoNQPOLSXPfVamkfdu71dA9ihnwJUdKpDYBzFx8i5Vhz6i7TPP9SB+Bbg8r/YgMZjk7YcUODKebv3+WzgQL17sUcW+hy1ozKupiQsn+QQd8WKP8XY6US6QordLI0fbviWHxHQFc6eyQlEohpbp87n09vG3hCJhI87hOX1S1jwxF/Q7GEe6paS7w6ADBkPmZ8oIm4vMN7ES+1DUqDQG97Zj0anSPa+TEq1f6jsfSbsZoeLIVX8rv60c1Tb7PDAqh"
`endif