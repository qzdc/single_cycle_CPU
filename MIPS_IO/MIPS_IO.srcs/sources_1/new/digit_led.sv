`timescale 1ns / 1ps

module digit_led(
    input logic [4:0]x,
    output logic [6:0] a2g
    );
    
     always_comb
        case (x) 
            'h0: a2g = 7'b0000001; 
            'h1: a2g = 7'b1001111; 
            'h2: a2g = 7'b0010010; 
            'h3: a2g = 7'b0000110; 
            'h4: a2g = 7'b1001100; 
            'h5: a2g = 7'b0100100; 
            'h6: a2g = 7'b0100000; 
            'h7: a2g = 7'b0001111; 
            'h8: a2g = 7'b0000000; 
            'h9: a2g = 7'b0000100; 
            'hA: a2g = 7'b0001000; 
            'hB: a2g = 7'b1100000; 
            'hC: a2g = 7'b0110001; 
            'hD: a2g = 7'b1000010; 
            'hE: a2g = 7'b0110000; 
            'hF: a2g = 7'b0111000; 
            'h10: a2g = 7'b1110110;//=
            'h11: a2g = 7'b1001110;//+
            'h12: a2g = 7'b1111110;//-
            'h13: a2g = 7'b1100010;//*
        default: a2g = 7'b0000001; //0
        endcase
endmodule
