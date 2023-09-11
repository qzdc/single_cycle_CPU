`timescale 1ns / 1ps


module m7seg(
    input logic [39:0] x,
    input logic clk,
    input logic clr,
    output logic [7:0] an,
    output logic [6:0] a2g,
    output logic dp);
        
        
        logic [4:0] digit;
        logic [2:0] s;
        logic [19:0] clkdiv;
        
        assign dp=1;
//        assign s=clkdiv[19:17];
        assign s=clkdiv[7:5];
        
        
        always_comb
            case(s)
                0: digit=x[4:0];
                1: digit=x[9:5];
                2: digit=x[14:10];
                3: digit=x[19:15];
                4: digit=x[24:20];
                5: digit=x[29:25];
                6: digit=x[34:30];
                7: digit=x[39:35];
                
            endcase
            
            always_comb
        case(s)
            0:  an = 8'b11111110;
            1:  an = 8'b11111101;
            2:  an = 8'b11111011;
            3:  an = 8'b11110111;
            4:  an = 8'b11101111;
            5:  an = 8'b11011111;
            6:  an = 8'b10111111;
            7:  an = 8'b01111111; 
           
        endcase
        
    // 时钟分频器（20位二进制计数器）
    always @(posedge clk, posedge clr)
      if(clr == 1) clkdiv <= 0;
      else         clkdiv <= clkdiv + 1;
    
    //实例化 7段数码管
    digit_led led(.x(digit), .a2g(a2g));
endmodule
