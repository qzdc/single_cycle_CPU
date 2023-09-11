`timescale 1ns / 1ps


module mux2_5(
    input logic s,
    input logic [4:0] a,b,
    output logic [4:0] o
    );
    
    assign o = s ? b : a;
    
endmodule
