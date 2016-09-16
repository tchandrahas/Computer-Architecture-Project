`timescale 1ns / 1ps

module execute( 
input [7:0] in, 
input [2:0] shamt,
output [7:0] out
    );
    assign out=$signed(in)>>>shamt;
endmodule
