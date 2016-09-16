`timescale 1ns / 1ps
module reg_file(
input [2:0] rdreg,
input [2:0] wtreg,
input [7:0] wtdt,
input rgw,
input rst,
output [7:0] rdt);
reg [7:0]reg_bank[7:0];
always@(negedge rst)
if(rst==0)
begin
reg_bank[0]=1;
reg_bank[1]=1;
reg_bank[2]=8'b11000000;
reg_bank[3]=1;
reg_bank[4]=1;
reg_bank[5]=1;
reg_bank[6]=8'b00010000;
reg_bank[7]=1;
end 
always@(wtdt,wtreg)
begin
if(rgw==1)
reg_bank[wtreg]=wtdt;
end 
assign rdt=reg_bank[rdreg];
endmodule