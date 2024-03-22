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


// (C) 2001-2023 Intel Corporation. All rights reserved.
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


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module  clkmux_intelclkctrl_201_cmyflvy  (
    inclk0x,
    inclk1x,
    clkselect,
    outclk
);

input inclk0x;
input inclk1x;
input clkselect;
output outclk;

wire inclk_muxout;

clkmux_intelclkctrl_201_cmyflvy_clksel_mux clksel_inst (
    .inclk0x(inclk0x),
    .inclk1x(inclk1x),
    .clkselect(clkselect),
    .clkout(inclk_muxout)
); 
GLOBAL global_inst(.in(inclk_muxout), .out(outclk));

endmodule


module clkmux_intelclkctrl_201_cmyflvy_clksel_mux (
    input inclk0x,
    input inclk1x,
    input clkselect,
    output clkout
);
	parameter num_clocks = 2;
	genvar i;
	wire [num_clocks-1:0] clk;
	wire [num_clocks-1:0] clk_select; // one hot
	reg [num_clocks-1:0] ena_r0;
	reg [num_clocks-1:0] ena_r1;
	reg [num_clocks-1:0] ena_r2;
	wire [num_clocks-1:0] qualified_sel;

	// A look-up-table (LUT) can glitch when multiple inputs 
	// change simultaneously. Use the keep attribute to
	// insert a hard logic cell buffer and prevent 
	// the unrelated clocks from appearing on the same LUT.

	assign clk[0] = inclk0x;
	assign clk[1] = inclk1x;
	
	// Decoder logic
	assign clk_select[0] = ~clkselect;
	assign clk_select[1] = clkselect;
	
	wire [num_clocks-1:0] gated_clks /* synthesis keep */;

	initial begin
		ena_r0 = 0;
		ena_r1 = 0;
		ena_r2 = 0;
	end

	generate
		for (i=0; i<num_clocks; i=i+1) 
		begin : lp0
			wire [num_clocks-1:0] tmp_mask;
			assign tmp_mask = {num_clocks{1'b1}} ^ (1 << i);

			assign qualified_sel[i] = clk_select[i] & (~|(ena_r2 & tmp_mask));

			always @(posedge clk[i]) begin
				ena_r0[i] <= qualified_sel[i];    	
				ena_r1[i] <= ena_r0[i];    	
			end

			always @(negedge clk[i]) begin
				ena_r2[i] <= ena_r1[i];    	
			end

			assign gated_clks[i] = clk[i] & ena_r2[i];
		end
	endgenerate
	// These will not exhibit simultaneous toggle by construction
	assign clkout = |gated_clks;

endmodule
   


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "akkpgYWd9/IiVf0tScL9hesxltObItz6JifX0syyxQM7VmiyDeLxk8D51aJwtlDhHQWxnw9akzIBd+rjCZmSqyDXC5pTOkxFqc03H46mui6dEMS6ioR86ZaMoT7tUFHUfz6HhVem1wb5Wmu8h6zpiW0N6Lga7VGbuGfitA+qAjcmOrFxIUh4mXed2+Vj22xzPc4rrkB3GYnhbjlN69PMHAn57ughIhEpl3m2s93f63d1qucIoWTLYLiDwcIHPdbXBmUpwUoOmF7QDJ7pOZYBY5aKsMa9p2JdReGfcP9Dr4syxQNyUDkh5C5Vip0nLHYDO2bGoRlBiL9JjNbbYNAnRbBxocFCYXIb950ZkJGOpQ5imJuBI6H0SFLe+pm67irOrtlh0p+e1DftPLyX76/JjJwKkJaunbxTAdnOIhc//W+nkRpAI6E6iwje5joo/lDH3KgzpGB12SUh0KGZgZ8TDeWlGPwYEsxryyUAFY1FOqXsPULtJ8H7YTgeZ2RYsSEFXsjAsCp5dCY/rFjMZVwOqawW4/O0IerTqEayAMGEZI+0vBWbhsj7Q5MlRLRegbsJmKGIa6vUET8VZ5+N018V7r//RWcap+XGj+JtzORWSV51jmuMnIR6cAeaypY8Ol8VqWGDMb8VrS79mDuc2ssDMp72hrtSKOJ3xfEigx8CEzypRIZLaRLTFvDZOS+S406RD5dXo5xVAUuAYcJtjEO2Jcs8RjBPdbJrIiB8axhKLOLkBAcy4qOghM0YCLlrr7zwV9BdRtq+UGxDogHg1Kn2Ca6PFqr3+59+RcQ1x4vo8ROtJzboI2HD1xW3yNndNlU6nbBZnAQOUkWxaY7BSp7S8kasTtXsG0dQJP9OHp/2eMJfyjkRnMFHnB3qgTSHVSlFw2pZI5ljfRj9ky5sPC+UgP5ofuKsvupqhC65Q1Fyb4mG4kx+zil1Vzswz5cQui8yJsD4req1EKeoru1AXc9xV/0phVJHUOUy2CEQV3sxQJ80ypmwxNu+dfq0QXC4oej/"
`endif