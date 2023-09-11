`timescale 1ns / 1ps


module ALU_adder(
    input logic [31:0] a,b,
    output logic [31:0] o
    );
    
    assign o = (a << 2) + b;
    
endmodule
