`timescale 1ns / 1ps

module testbench(

    );
   logic clk,btnc,btnl,btnr;
   logic [15:0]sw;
   logic [7:0] an;
   logic [6:0] a2g;
   
   mips_top MP(clk,btnc,btnl,btnr,sw,an,a2g);
   
   initial
   begin
    #0;btnc<=1;
    #2;btnc<=0;
    #2;btnl<=1;btnr<=1;
    #2;sw<=16'b0000010000001000;
   end
    
    always
    begin
        clk<=1;#5;
        clk<=0;#5;
    end
endmodule
