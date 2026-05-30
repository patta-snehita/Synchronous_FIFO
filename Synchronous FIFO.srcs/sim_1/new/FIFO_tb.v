`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module FIFO_tb(

    );
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0]data_in;
    wire [7:0]data_out;
    wire full;
    wire empty;
    
    FIFO dut(clk,rst,wr_en,rd_en,data_in,data_out,full,empty);
    
    always#5 clk=~clk;
    initial
    begin
    $monitor("Time=%0t|wr_en=%b|rd_en=%b|data_in=%h|data_out=%h|full=%b|empty=%b|wr_ptr=%d|rd_ptr=%d|count=%d",$time,wr_en,rd_en,data_in,data_out,full,empty,dut.wr_ptr,dut.rd_ptr,dut.count);
     clk=0;
     rst=1;
     wr_en=0;
     rd_en=0;
     data_in=0;
     #10;
     rst=0;
     #10;
     wr_en=1;
     data_in=8'hAA;
     #10;
     data_in=8'hBB;
     #10;
     data_in=8'hCC;
     #10;
     data_in=8'hDD;
     #10;
     wr_en=0;
     #20;
     rd_en=1;
     #40 rd_en=0;
     #50;
     $finish;end
     
     
    
endmodule
