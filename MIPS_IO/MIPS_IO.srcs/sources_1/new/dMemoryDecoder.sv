`timescale 1ns / 1ps


module dMemoryDecoder(
    input logic clk,writeen,
    input logic [7:0]addr,
    input logic [31:0] writedata,
    output logic [31:0] readdata,
    input logic reset,bL,bR,
    input logic [15:0] switch,
    output logic [7:0]an,
    output logic [6:0] a2g,
    output logic dp
    );
    
    logic pWrite,mWrite;
    logic [31:0] readdata1,readdata2;
    logic [11:0] led;
    logic [39:0] x;
    
    assign pwrite=writeen&addr[7];
    assign mwrite=writeen&(~addr[7]);
    
    data_memory DataMemory(CLK,mwrite,addr,writedata,readdata1);
    IO ioread(clk,reset,addr[7],pwrite,addr[3:2],writedata,readdata2,bL,bR,switch,led);
    
    assign readdata=addr[7]?readdata2:readdata1;
    
    getx GetX(switch[15:8],switch[7:0],led,x);
    m7seg M7Seg(x,clk,reset,an,a2g,dp);
    
endmodule
