`timescale 1ns / 1ps

module ALU_dec(
    input logic [5:0] funct,
    input logic [2:0] aluop,
    output logic [2:0] alucontrol
    );
    
    always@(*)
        case(aluop)
            3'b000: alucontrol<=3'b010;//+
            3'b001: alucontrol<=3'b110;//-
            3'b010:    
                case(funct)
                    6'b100000: alucontrol<=3'b010;
                    6'b100010: alucontrol<=3'b110;
                    6'b100100: alucontrol<=3'b000;
                    6'b100101: alucontrol<=3'b001;
                    6'b101010: alucontrol<=3'b111;
                    default:   alucontrol<=3'bxxx;
                endcase
            3'b100:alucontrol<=3'b000;//andi
            3'b101:alucontrol<=3'b001;//ori
            3'b110:alucontrol<=3'b111;//slti
            default:
                alucontrol<=3'bxxx;
        endcase
endmodule
