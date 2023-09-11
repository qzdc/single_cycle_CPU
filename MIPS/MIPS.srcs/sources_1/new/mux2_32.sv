`timescale 1ns / 1ps


module mux2_32(
    input logic s,
    input logic [31:0] a,b,
    output logic [31:0] o
    );
    
    assign o = s ? b : a;
    
endmodule
