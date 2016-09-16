`timescale 1ns / 1ps
module main_proc_tb;
reg clk,rst;
main_proc s(.clk(clk),.rst(rst));
initial 
begin 
clk=1'b0;
repeat(11)
#20 clk= ~clk;
end 
initial 
begin 
rst=0;
#40;
rst=1;
end 
endmodule
