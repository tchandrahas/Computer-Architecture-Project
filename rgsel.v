`timescale 1ns / 1ps
module rgsel(
input [2:0] dst,
input [2:0] src,
input regsel,
output [2:0]sr);
assign sr=regsel?dst:src;
endmodule