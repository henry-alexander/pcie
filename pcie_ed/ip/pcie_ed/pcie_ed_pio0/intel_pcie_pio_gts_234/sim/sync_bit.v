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



module sync_bit
  #(
    parameter DWIDTH = 1,    // Sync Data input
    parameter RESET_VAL = 0  // Reset value
    )
    (
    input  wire              clk,     // clock
    input  wire              rst_n,   // async reset
    input  wire [DWIDTH-1:0] din, // data in
    output wire [DWIDTH-1:0] dout // data out
     );

   // Define wires/regs
   reg [(DWIDTH)-1:0] sync_regs_s1; /* synthesis preserve */
   reg [(DWIDTH)-1:0] sync_regs_s2; /* synthesis preserve */
   //wire                         reset_value;
   
   localparam reset_value = (RESET_VAL == 1) ? 1'b1 : 1'b0;  // To eliminate truncating warning

   // Sync Always block
   always @(negedge rst_n or posedge clk) begin
      if (rst_n == 1'b0) begin
         sync_regs_s2[DWIDTH-1:0] <= {(DWIDTH){reset_value}};
      end
      else begin
         sync_regs_s2[DWIDTH-1:0] <= sync_regs_s1[(DWIDTH-1):0];
      end
   end
   
   // NF: both FF stages have reset
   always @(negedge rst_n or posedge clk) begin
      if (rst_n == 1'b0) begin
         sync_regs_s1[DWIDTH-1:0] <= {(DWIDTH){reset_value}};
      end
      else begin
         sync_regs_s1[DWIDTH-1:0] <= din;
      end
   end

   assign dout = sync_regs_s2;

endmodule 

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "jGbYiKhp+NS6Aa+RUA6IRCgAS7nhqqX3DBGg1NXX7jwNgDUCNlO838MLwAPNZiEI4qyn7rsRY6mf9coPTQtRJLu//j4xTyp7MS8wFyiOlg6C7cj2GHIRkrSQnIWc0UXhEj+hvQsoXSdm8fb3IC+6j+wwchNMpe0qjV2c3aa0EiJ6FyfCF8Swulqh1RH90NB+fR8M/O17pMSxTY0mv61NbDTHMj5MqbA+Utl3/JUJaI79G44UwQSyMjrkHtMjYtTDOMTxctEwuHI4UjrbWRZkmmTd9JwBqyY/FEie/gQP5BBHBwmcpwgGFVzb+dsSxsZLTO8/TOQbMtn9diqXBS7AYezMmGB0u7oNLjO1z2fnGb/SVYzihOHv2bCrD0wdhYEz/jbMlJZmXO6rmATnUmNgmh8uQ6oIc+enbAh6tDoj0DXMWXZNjl7wlwZyXsWmKEDkIiLqCin2r0ieB+Q6Kbyp5rMrnGTZI3pAU/b6QDEkFMw/klsA6nY+Hehcwr9/WcJpni8l2DnTHyxH9cOrJUQOutoSqctBQpMYVSKPQnkGm4UchrzAh7xRIxUOJ3AKGyHp9igjORI22HucmWVBQrVKh2IcHSs9JvcS8k0ppwRRgk23sYBe61MoAoqy5GS76QHjLv83qXlXloSmsd0CwMFs23tUdyNaYW96KuTDJ3tnz4CfJIEzO5tXC00gOS4Y6N3//bGHUYc9iVSfwvKLcm4ieCygBl91X0JB/USrTjgXFJ9yqebBCSC3mGrGPc95qut1PVbZdZrMfkjcDWEpFrIY7D0ldgckae2wzlT0i0KaO5Hr/kCdECNGsF+N22AEL3zLbF9caIUW1o9JWJNOLzInuMi6BNsQnnrnnWJmwVdbiiVjgPV0DK+j3Xqv7YQF0yPaW0vY/zUZUH1YZ/xne0qmCUBlPRZzVCvJdwWeY9hjKNOPKrYwsqmLGtdDNeYZl9heDroJ0f3U4Lw9cGn2qBJZAknaWezGftcfcdZhem85+G9/otYewGfrelm8SuvrNfsn"
`endif