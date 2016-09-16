`timescale 1ns / 1ps
module instr_mem(
  input [1:0]pc,
  input rst,
  output [7:0] intr );
  reg [7:0] imemory [3:0];
  assign intr =imemory[pc];
  always@(rst)
  begin
  if(rst==0)
  begin 
  imemory[0]=8'h12;
  imemory[1]=8'hEA;
  imemory[2]=8'h34;
  imemory[3]=8'hD6;
  end 
  end 
endmodule
