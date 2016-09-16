`timescale 1ns / 1ps
module main_proc(
input clk,
input rst
    );
    wire [7:0] instr_code_in;
    wire control;
    wire [2:0] rgsrc;
    wire [2:0] wba; wire [7:0] wbd;
    wire [7:0] idout;
    wire [15:0] p1;wire [15:0] p2; wire [7:0] alurst;
    wire p4;
    wire [9:0] p5; wire [9:0] p6;
    instr_fetch a1(.clk(clk), .rst(rst),.instr_code(instr_code_in));
    assign control=~(instr_code_in[6]);
    assign p5={control,1'b1,instr_code_in};
    ifid a2(.clk(clk),.rst(rst),.in(p5),.out(p6));
    rgsel a3(.dst(p6[5:3]),
             .src(p6[2:0]),
             .regsel(p6[9]),.sr(rgsrc));
    reg_file a4(.rdreg(rgsrc),.wtreg(wba),.wtdt(wbd),.rgw(p4),.rdt(idout),.rst(rst));
    assign p1={p6[8],p6[9],idout,p6[5:3],p6[2:0]};
    idex a5(.clk(clk),.rst(rst),.in(p1),.out(p2));
    execute a6(.in(p2[13:6]),.shamt(p2[2:0]),.out(alurst));
    wbd_slct a7(.alu_result(alurst),.source_data(p2[13:6]),.out(wbd),.sel(p2[14]));
    assign wba=p2[5:3];
    assign p4=p2[15];
endmodule

