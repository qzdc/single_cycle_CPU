`timescale 1ns / 1ps

module testbench();

    logic clk;
    logic reset;
    logic [31:0]writedata,dataadr;
    logic memwrite;
    
    mips_top M(clk,reset,writedata,dataadr,memwrite);
    
    initial
        begin
            reset<=1;#22;reset<=0;
        end
        
    always
    begin
        clk<=1;#5;clk<=0;#5;
    end
    
    always@(negedge clk)
    begin
        if(memwrite)
        begin
            if(dataadr===84&writedata===7)
            begin
                $display("success");
                $stop;
            end
            else if(dataadr!==80)
            begin
                $display("fail");
                $stop;
            end
        end
    end
    
endmodule
