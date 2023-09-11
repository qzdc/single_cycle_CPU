`timescale 1ns / 1ps

module main_dec(
    input logic [5:0]op,
    output logic memtoreg,memwrite,branch,alusrc,regdst,regwrite,jump,
    output logic [2:0] aluop
    );
    
    logic [9:0] control;
    logic branch_standard;
    
    assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,aluop,jump} = control;
    
    always@(*)
        case(op)
            6'b000000: control<=10'b1100000100;//R
            6'b100011: control<=10'b1010010000;//lw
            6'b101011: control<=10'b0010100000;//sw
            6'b000100: control<=10'b0001000010;//beq
            6'b000101: control<=10'b0001000010;//bne
            6'b000010: control<=10'b0000000001;//jump
            6'b001000: control<=10'b1010000000;//addi
            6'b001100: control<=10'b1010001000;//andi
            6'b001101: control<=10'b1010001010;//ori
            6'b001010: control<=10'b1010001100;//slti
            6'b100000: control<=10'b0000000000;//nop
            default:   control<=10'bxxxxxxxxxx;
        endcase
endmodule
