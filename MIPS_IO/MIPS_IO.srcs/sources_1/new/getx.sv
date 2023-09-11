`timescale 1ns / 1ps


module getx(
    input logic [7:0]a,b,
    input logic [11:0]c,
    output logic [39:0]x
    );
//    logic [11:0] aa,bb,cc;
//    bin2bcd a_({4'b0000,a},aa);
//    bin2bcd b_({4'b0000,b},bb);
//    bin2bcd c_(c,cc);
    assign x=  {1'b0,a[7:4],1'b0,a[3:0],
                1'b0,b[7:4],1'b0,b[3:0],
                5'b10000,1'b0,c[11:8],
                1'b0,c[7:4],1'b0,c[3:0]
                };
    
    
endmodule
