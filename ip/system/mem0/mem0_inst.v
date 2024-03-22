	mem0 u0 (
		.clk        (_connected_to_clk_),        //   input,    width = 1,   clk1.clk
		.address    (_connected_to_address_),    //   input,    width = 8,     s1.address
		.read       (_connected_to_read_),       //   input,    width = 1,       .read
		.readdata   (_connected_to_readdata_),   //  output,  width = 512,       .readdata
		.byteenable (_connected_to_byteenable_), //   input,   width = 64,       .byteenable
		.write      (_connected_to_write_),      //   input,    width = 1,       .write
		.writedata  (_connected_to_writedata_),  //   input,  width = 512,       .writedata
		.reset      (_connected_to_reset_)       //   input,    width = 1, reset1.reset
	);

