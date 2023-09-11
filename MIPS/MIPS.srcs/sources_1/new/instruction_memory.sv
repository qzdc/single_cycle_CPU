`timescale 1ns / 1ps

module instruction_memory(
    input logic  [5:0] A,
    output logic [31:0] RD
    );
    
    logic [31:0] RAM[63:0];
    
    initial
    begin
        $readmemh("memfile.dat",RAM);
    end
    
    assign RD=RAM[A];
endmodule
