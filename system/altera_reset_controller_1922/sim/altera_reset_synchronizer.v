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


// $Id: //acds/rel/23.4/ip/iconnect/merlin/altera_reset_controller/altera_reset_synchronizer.v#1 $
// $Revision: #1 $
// $Date: 2023/10/12 $

// -----------------------------------------------
// Reset Synchronizer
// -----------------------------------------------
`timescale 1 ns / 1 ns

module altera_reset_synchronizer
#(
    parameter ASYNC_RESET = 1,
    parameter DEPTH       = 2
)
(
    input   reset_in /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101" */,

    input   clk,
    output  reset_out
);

    // -----------------------------------------------
    // Synchronizer register chain. We cannot reuse the
    // standard synchronizer in this implementation 
    // because our timing constraints are different.
    //
    // Instead of cutting the timing path to the d-input 
    // on the first flop we need to cut the aclr input.
    // 
    // We omit the "preserve" attribute on the final
    // output register, so that the synthesis tool can
    // duplicate it where needed.
    // -----------------------------------------------
    (*preserve*) reg [DEPTH-1:0] altera_reset_synchronizer_int_chain;
    reg altera_reset_synchronizer_int_chain_out;

    generate if (ASYNC_RESET) begin

        // -----------------------------------------------
        // Assert asynchronously, deassert synchronously.
        // -----------------------------------------------
        always @(posedge clk or posedge reset_in) begin
            if (reset_in) begin
                altera_reset_synchronizer_int_chain <= {DEPTH{1'b1}};
                altera_reset_synchronizer_int_chain_out <= 1'b1;
            end
            else begin
                altera_reset_synchronizer_int_chain[DEPTH-2:0] <= altera_reset_synchronizer_int_chain[DEPTH-1:1];
                altera_reset_synchronizer_int_chain[DEPTH-1] <= 0;
                altera_reset_synchronizer_int_chain_out <= altera_reset_synchronizer_int_chain[0];
            end
        end

        assign reset_out = altera_reset_synchronizer_int_chain_out;
     
    end else begin

        // -----------------------------------------------
        // Assert synchronously, deassert synchronously.
        // -----------------------------------------------
        always @(posedge clk) begin
            altera_reset_synchronizer_int_chain[DEPTH-2:0] <= altera_reset_synchronizer_int_chain[DEPTH-1:1];
            altera_reset_synchronizer_int_chain[DEPTH-1] <= reset_in;
            altera_reset_synchronizer_int_chain_out <= altera_reset_synchronizer_int_chain[0];
        end

        assign reset_out = altera_reset_synchronizer_int_chain_out;
 
    end
    endgenerate

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Mj+fk0jjIonoXfiXsyPTo2LQmOM+p24lB0GiO9O85wRpql6+2z/Am+vMAVGA1LwDqvtXmfS15b8DQAxqYCx4pqzuJAoRDEYD/31g0DhbyqjA+ZPbt4rxtuOIuAPEAKAqcyOkGQEvcrbNNm6gSK3SlB5siGA8FsXLuFf+9yywfZWvqajIuhCAAvfs+kv/x0wXtw1dqhePd8UvPhDurmIgwaMtv42I0C0nz3am7+dZ2Vr66iHlpJUe0fSFMUW4VZ2H9gI1m1TEwHZjXsaDHNPYP6DqTMt6cDBmrJyW8Zi7PEaTN6kgfJEjRidNZR/ucCa+VfeGKJZ6MtliIFscOHY7Cjz7C/y4lppwfFMBvkmjZBSJ55yx+Bk25ffAI5fIwH9lCRgnhyyyCv5EB6Ba+0sz8GyitvHsIWWcI0D8I6Pifnma+hYeXKKu7CsHU8rWTsPh/n2AgVddDCSiOMGXtp1gCBrDUiUN+OxPYk/Xc/Px3hu4Q6flg+ZPyI3yZwbJ1+Pkno/eOIrosWXDnP2/wnWmFkNXQ3a+7yPm/OGmNOqUC9xFis4f2NA4h9nwzLVhPzTp6TRrhKMi6ID4qCKRGwPuvEJajJ47Rnpw3YuoJBCCDbysIn9wx9RiYJQ+W7pIYEw64h+PXiUb8tSlMztFUqO5xZoyk5GT0P+1b5c47d45VMe2Ib1maNnkxuLqDa0qN1cjYTJBlXCBoP1wiDE+MRvykdRcVq08Lrg0PYQuono1gDnc8ILmS4Mvwq/wW8E49ys4m1Nd3AX66uC/vtXTmioLhl4nakbocsIWRjgM9VUuaMEvbI6xTYEROnnMA71xQhvkzNLBlcnvBojwPeDelhuuxAR3cyXJ0un5/ffXLMFbgioxsY/RbTF2c2RT1p1OlfXBx5yFvWHKJWV9EjnYR5w8diipGPw5xFjei/LDCQrWK+8dRnyJQJ6GYhmesH7aJPB6ZmjIg0DbiMODd2Xp9OYmdt+tVm4T/j+uEl88OJlfJzD3ANJRQEBBh+nQn152Otj8"
`endif