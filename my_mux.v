`timescale 1ns / 1ps
module wbd_slct(
input [7:0] alu_result,
input [7:0] source_data,
output[7:0] out,
input sel);
assign out=(sel)?alu_result:source_data;
endmodule