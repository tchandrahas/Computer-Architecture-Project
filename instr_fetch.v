`timescale 1ns / 1ps
module instr_fetch(
input clk,
input rst,
output [7:0] instr_code);
reg [1:0] pc;
instr_mem i1(.pc(pc),.rst(rst),.intr(instr_code));
always@(posedge clk, negedge rst)
begin 
if(rst==0)
pc<=0;
else
pc=pc+1; 
end
endmodule
