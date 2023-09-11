`timescale 1ns / 1ps

module datapath(
    input logic CLK,reset,
    input logic MemtoReg,PCSrc,ALUSrc,RegDst,RegWrite,Jump,
    input logic [2:0] ALUControl,
    output logic Zero,
    output logic [31:0] PC,
    input logic [31:0] Instr,
    output logic [31:0] ALUResult,WriteData,
    input logic [31:0] ReadData
    );
    logic [4:0] WriteReg;
    logic [31:0]    PCJump, PC_next, PC_next_real, PCPlus4, PCBranch, 
                    SignImm, SrcA, SrcB, Result;
                    
    program_counter ProgramCounter(CLK,reset,PC_next_real,PC);
    pc_plus4 PC_plus4(PC,PCPlus4);
    ALU_adder ALUAdder(SignImm,PCPlus4,PCBranch);
    mux2_32 Mux2_32_branch(PCSrc,PCPlus4,PCBranch,PC_next);
    assign PCJump={PCPlus4[31:28],Instr[25:0],2'b00};
    mux2_32 Mux2_32_jump(Jump,PC_next,PCJump,PC_next_real);
        
    regfile RegFile(CLK,RegWrite,Instr[25:21],Instr[20:16],WriteReg,Result,SrcA,WriteData);
    mux2_5 Mux2_5_regdst(RegDst,Instr[20:16],Instr[15:11],WriteReg);
    mux2_32 Mux2_32_memtoreg(MemtoReg,ALUResult,ReadData,Result);
    signext Signext(Instr[15:0],SignImm);
    
    mux2_32 Mux2_32_alusrc(ALUSrc,WriteData,SignImm,SrcB);
    ALU ALU_(ALUControl,SrcA,SrcB,ALUResult,Zero);
endmodule
