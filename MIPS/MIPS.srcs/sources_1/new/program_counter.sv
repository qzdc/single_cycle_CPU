`timescale 1ns / 1ps

module program_counter(
    input logic clk,res,
    input logic [31:0] pc_next,
    output logic [31:0] pc
    );
    always@(posedge clk, posedge res)
        begin
            if(res)
                pc<=0;
            else
                pc<=pc_next;
        end
endmodule
