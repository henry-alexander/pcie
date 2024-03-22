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
endmodule

