`timescale 1ns / 1ps

module pc_plus4(
    input logic [31:0] in,
    output logic [31:0] out
    );
    
    assign out=in+4;
endmodule
