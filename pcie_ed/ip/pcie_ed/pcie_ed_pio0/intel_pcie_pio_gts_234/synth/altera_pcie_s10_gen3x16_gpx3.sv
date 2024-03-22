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


module altera_s10_pcie_gen3x16_gpx3
  #(
     parameter     WIDTH = 5
  )(
   input logic        din_clk,
   input logic        din_rst,
   input logic [WIDTH-1:0]  din,
   input logic        dout_clk,
   input logic        dout_rst_n,
   output logic [WIDTH-1:0] dout
   );

    //binary to gray conversion
    logic [WIDTH-1:0] din_gry,
                din_gry_sync,
                din_bin;

   /*  assign din_gry[2] = din[2];
    assign din_gry[1] = din[2]^din[1];
    assign din_gry[0] = din[1]^din[0]; */

    //genvar i;
    always @ (posedge din_clk) begin
      if (din_rst) begin
        din_gry <= '0;
      end
      else begin
        din_gry[WIDTH - 1] <= din [WIDTH - 1];
        for (int i = 0; i < (WIDTH - 1); i=i+1) begin: gry_convert
          din_gry[i] <= din[i] ^ din[i+1];
        end    
      end   
    end   
    
    
    sync_bit #(.DWIDTH(WIDTH)) u_din_gry_sync (.clk(dout_clk), .rst_n(dout_rst_n), .din(din_gry), .dout(din_gry_sync));

    //assign din_bin = {din_gry_sync[2], din_gry_sync[1]^din_bin[2], din_gry_sync[0]^din_bin[1]};
    assign din_bin[4] = din_gry_sync[4];
    assign din_bin[3] = din_gry_sync[3] ^ din_bin[4];
    assign din_bin[2] = din_gry_sync[2] ^ din_bin[3];
    assign din_bin[1] = din_gry_sync[1] ^ din_bin[2];
    assign din_bin[0] = din_gry_sync[0] ^ din_bin[1];
    
    //convert back to binary
    always @ (posedge dout_clk)
      if (!dout_rst_n)
        dout <= 5'h00;
      else
        dout <= din_bin;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "jGbYiKhp+NS6Aa+RUA6IRCgAS7nhqqX3DBGg1NXX7jwNgDUCNlO838MLwAPNZiEI4qyn7rsRY6mf9coPTQtRJLu//j4xTyp7MS8wFyiOlg6C7cj2GHIRkrSQnIWc0UXhEj+hvQsoXSdm8fb3IC+6j+wwchNMpe0qjV2c3aa0EiJ6FyfCF8Swulqh1RH90NB+fR8M/O17pMSxTY0mv61NbDTHMj5MqbA+Utl3/JUJaI6+p+QaZrA90KClSq4zYFZj67h53wqC5tu0LHJ1iLFUIHDerHUaQnG45er/v+183TMxq02+/DQSx6M7KXKI3ZAaRkr2UmupBGEDs3o7R3cBx5vHB5OTEHPoSTQkH5vUPog3M+BpgwEKe3CGO+5QEQ5VHdFX4ZWCbikgeTdqL7zMwDrNAmU7DebTRl+felRyBkc7IzN9JxdT5Jg5I+NIa9epo4DHcwVGQnTfbO5EPZtj1Xks8voTsxUQJ4WKfTq+YLoLO6ctHk21r8p0KVGDNZL3muQ/Dyny/qRcoTZRU1PlahmYvagM3cTTowjkQAjPMNBo5Ct4DotCkTyiBrtUy8S4iXRNRc9n2o04i3tq6nCzulxez3D+Y/uJNVkez6Z53yG9x08AvvGDRzboJhG4m6hQkQ1c4y6iNc6qVFKoULjPDXCRrSYJXfytKrAtuC/I8sznSrlAKq1t1bmz/m8Gc5VlSpK5c6R+zsnzQJXu0O55oV200rLrMyNva/UbWj4DY2aYDAyVJyocjNABdox49DnZiOPUEQdi+A5TvsV2PObTWtdjmwim/rXgGJvM4hBQfv1iliqIzLXU0WP95voQmt2OnF+o/78FUGkGJyh3OU1Z32tcMTpfGvVZ69/kBEm0ogsq6XBh0RSr+jOj6k4g8L/hy8uhJkrJSoC6gNgnXoMSaXyAQh9I68kGTsInHqY94IwvKRrs5ut12pQ12525wOVn/7Y1VXOBnRIsmvF3OovCMG/nF9cJmB2Z6oY2pfFOIL2Qqf6hEhHzFUU6IB3L1Sam"
`endif