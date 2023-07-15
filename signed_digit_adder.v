`timescale 1ns / 1ps
module signed_digit_adder (
    input [15:0]a,
    input [15:0]b,
    input cin,
    output [15:0]sum,
    output carryout
);
    wire [16:0] carry;
    assign carry[0] = cin;
    assign carryout = carry[16];
    
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin: adder_loop
            assign sum[i] = a[i] ^ b[i] ^ carry[i];
            assign carry[i+1] = (a[i] & b[i]) | (carry[i] & (a[i] ^ b[i]));
        end
    endgenerate
endmodule
