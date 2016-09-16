`timescale 1ns / 1ps
module ifid(
input clk,
input rst,
input [9:0] in,
output reg [9:0] out
    );
    always@(posedge clk, negedge rst)
    begin
    if( rst==1)
    out<=in;
    else 
    out=0;
    end
endmodule
