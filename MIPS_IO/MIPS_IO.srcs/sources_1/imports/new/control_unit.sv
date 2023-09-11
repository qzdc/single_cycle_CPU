`timescale 1ns / 1ps

module control_unit(
    input [5:0] op,funct,
    input zero,
//    output memtoreg,memwrite,alusrc,regdst,regwrite,pcsrc,
    output memtoreg,memwrite,pcsrc,alusrc,regdst,regwrite,jump,
    output [2:0] alucontrol
    );
    
    logic [2:0] aluop;
    logic branch_standard;
    
    main_dec MainDec(op,memtoreg,memwrite,branch,alusrc,regdst,regwrite,jump,aluop);
    ALU_dec ALUDec(funct,aluop,alucontrol);
    
    assign branch_standard = ~op[0];
    assign pcsrc = branch &(zero==branch_standard);
    
endmodule
