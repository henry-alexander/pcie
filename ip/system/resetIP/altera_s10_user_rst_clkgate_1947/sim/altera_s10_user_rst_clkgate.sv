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


`timescale 1 ns / 1 ns
module altera_s10_user_rst_clkgate (
	output logic ninit_done
);

	localparam USER_RESET_DELAY = 0;
	
	initial begin
		#0 ninit_done = 1;
		#1 ninit_done = 0;
	end
					
	
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "JrfMyOs4CNkjtWJvlU8HuQWPHvfdMxxbaEA4+8BXnAzuvuWwGbqeJrQsck9mT5WoG1IoKymUPWUv7qLEJjowTyXdgEbbz5YJjPnzVT7m65ZkBtbQnqccatMyEm37s6f2IA3P9BSM2WpjPLW/RpG/Pa85cx2m8tAkqUJZrDGMEfri6AZp4HQ4sizuY2XfqxjyplunuazzaLK474F7iF4mp0KEIZMYUpekoM+7UQVIFa1DPbnuT0nNBTcgddnKgR5yqXeZnbylCRx4ZXFNujA7XnbUSvyUfJg5SOrGsHCzbP8VoD5mrNPeoi6jF9ZNDMXCVxoDSaIyRoqOG1NFL/AGt3Vi7fIHChaT851FOaZgOGIaVVUwsqDigqDgO8SsqLctYts2os5k9uaF6IWBAx42meyCyNHwgeDYcVOoAKq75yeZZ5W59+MTtgfZxkXnYvgkbr3FlGm3t8hDmODI7DQ8RPDsJusCSVjwA/7+TzFIQ7H2jNjFF2k1SSsoo7ZYjAgUWTuY9TwrF50D76xptPHamvrkszSK15JJeTYg5pDgiy7w+UrNXVGoHJniDJZNufuqDPM/TUmwGWKfxwIVCX9y/zv/UKKaEConVs7GkDizYS5BKTeLwUVf0KZJdF3CPlSDtC15eWus+2deh1E2Exvqh9jEsaFErI7GsDMSSRmQGI/ya7LAKxwJB7cFT172ZklRQMrLHrk55Ap8LdiMyP02gri+/lk6o6pUMt8NDK985l1E4MwYOptiOzwjHQiaI3rhfaTaRio0qx1EGAxaAWM/vBQTKAlXZDd9vueWAtruLUVXVDfgyXkcNqET7YlnaKCvMz5Pg+E+xXlCclpsrtCg46faNb0EXOj+BEdX1tJt5uUQ85berTR77NFzzwFviufPDeLj3MV2JcD+VZiVvUi3K1BMseCo/dt3JKaOlQzd4bfXCyuUonSzqMZj+sm3W7XCGzzbHHYwHsnY4/TFFDwwAzYa6S++PGwpXLV/xFoBxD1xLKGCvZOud13DcKqwd1bJ"
`endif