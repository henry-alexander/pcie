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


module sync_pulse
  (
   input wr_clk,
   input rd_clk,
   input wr_rst_n,
   input rd_rst_n,
   input din,
   output dout
   );

    reg   din_lat,
          dout_lat;
    reg   din_sync_q;
    
    wire  din_sync,
          dout_sync;
        
    always @ (posedge wr_clk or negedge wr_rst_n)
      if (!wr_rst_n)
        din_lat <= 1'b0;
      else
        din_lat <= dout_sync ? 1'b0 : din? 1'b1 : din_lat;

    sync_bit u_din_sync (.clk(rd_clk), .rst_n(rd_rst_n), .din(din_lat), .dout(din_sync));
    sync_bit u_dout_sync (.clk(wr_clk), .rst_n(wr_rst_n), .din(dout_lat), .dout(dout_sync));
    assign dout = din_sync & ~din_sync_q;
    
    always @ (posedge rd_clk or negedge rd_rst_n)
      if (!rd_rst_n)
        begin
            dout_lat <= 1'b0;
            din_sync_q<=1'b0;
        end
      else
        begin
            dout_lat <= !din_sync? 1'b0 : din_sync ? 1'b1 : dout_lat;
            din_sync_q <= din_sync;
        end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "jGbYiKhp+NS6Aa+RUA6IRCgAS7nhqqX3DBGg1NXX7jwNgDUCNlO838MLwAPNZiEI4qyn7rsRY6mf9coPTQtRJLu//j4xTyp7MS8wFyiOlg6C7cj2GHIRkrSQnIWc0UXhEj+hvQsoXSdm8fb3IC+6j+wwchNMpe0qjV2c3aa0EiJ6FyfCF8Swulqh1RH90NB+fR8M/O17pMSxTY0mv61NbDTHMj5MqbA+Utl3/JUJaI6Kw46Bk1odbuTwQ1d8OGGi1R6KhkNcmgm/6zyKzNp5RIPNZYGGRKqHfHAxCo0tYkZ1S88j1rzD67EzR95bw83a+UL51Jq5Rdtwah7gKcP/ioCx1JyA/eMc98u0xAa5G7h6P32+ilkS1Mhr94Vma6JEj2GIQk5M6GnsyMU09WPmIcCEqwXO3hMmtt7wXvRj0tZmsdPqGBaaHiwWnp/ReoreyqkE8ry0pSoKW2iTiwn6RPyadd4n6qJrMVElK3tZ62//UCVuY/xTLdQvYJ90bT+IxByA9EpUyU3sAig/iHzXzMZYRGjX/WLivokldm8/KeMwUvc1xGSe86Dq12/zTNiavS7I05YDyjx5Y79XKGdB3axaQJUR/1dY6tf6HplyrLDMhr8TROh9nGtHjqdrKCZjxiNtkxna8IK38FDDho8fcSXtTfb9EEVIPKa0gz17zIR9Ku3qd/JkERvdkmfbG5fX3MZHna0YDQdoJnFo4dMmQL+24MvystqwEpfMN6jaiJMR9gT2Ynl12nT3InOGRKv9kpWizFvb0g/rNgroXn/YC/sX97P7BUzV43zyHuYc2g1GWLEy8zIJ+bcder35FescApNK8ZjwCtYgQ+/AANIGEFZvpampd76FzYCHaEmdbexilXR7ZjCfFkuYTKHPSfynZyPfPuBUuFthDPO7H49UZg4OmHlXcB05L35A/5EwwmzEMzQWlHjEpH5zcwilMWXyqyaYq3o2QbrAF75CjGRygG8NFdZxlDBdDfvtex+V91Qe+DLiyK7zrhOOvNZwbRbn"
`endif