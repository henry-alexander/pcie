// pcie_ed_MEM0.v

// Generated using ACDS version 23.4.1 205

`timescale 1 ps / 1 ps
module pcie_ed_MEM0 (
		input  wire         clk,        //   clk1.clk
		input  wire [7:0]   address,    //     s1.address
		input  wire         read,       //       .read
		output wire [511:0] readdata,   //       .readdata
		input  wire [63:0]  byteenable, //       .byteenable
		input  wire         write,      //       .write
		input  wire [511:0] writedata,  //       .writedata
		input  wire         reset       // reset1.reset
	);

	pcie_ed_MEM0_intel_onchip_memory_147_cp2b3ba #(
		.INIT_FILE ("pcie_ed_MEM0_MEM0.hex")
	) mem0 (
		.clk        (clk),        //   input,    width = 1,   clk1.clk
		.address    (address),    //   input,    width = 8,     s1.address
		.read       (read),       //   input,    width = 1,       .read
		.readdata   (readdata),   //  output,  width = 512,       .readdata
		.byteenable (byteenable), //   input,   width = 64,       .byteenable
		.write      (write),      //   input,    width = 1,       .write
		.writedata  (writedata),  //   input,  width = 512,       .writedata
		.reset      (reset),      //   input,    width = 1, reset1.reset
		.reset_req  (1'b0)        // (terminated),                      
	);

endmodule
