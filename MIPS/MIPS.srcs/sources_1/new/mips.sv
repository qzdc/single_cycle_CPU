`timescale 1ns / 1ps

module mips(
    input logic CLK,reset,
    output logic [31:0]PC,
    input logic [31:0]Instr,
    output logic MemWrite,
    output logic [31:0] ALUResult,WriteData,
    input logic [31:0] ReadData
    );
    
    logic MemtoReg,Alusrc,RegDst,RegWrite,Jump,PCRsc,Zero;
    logic [2:0]ALUControl;
    control_unit ControlUnit(Instr[31:26],Instr[5:0],Zero,MemtoReg,MemWrite,
        PCSrc,ALUSrc,RegDst,RegWrite,Jump,ALUControl);
    datapath DataPath(CLK,reset,MemtoReg,PCSrc,ALUSrc,RegDst,
        RegWrite,Jump,ALUControl,Zero,PC,Instr,ALUResult,WriteData,ReadData);
endmodule
