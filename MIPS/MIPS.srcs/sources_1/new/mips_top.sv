`timescale 1ns / 1ps

module mips_top(
    input logic CLK,reset,
    output logic [31:0]WriteData,DataAdr,
    output logic MemWrite
    );
    
    logic [31:0] PC,Instr,ReadData;
    mips Mips(CLK,reset,PC,Instr,MemWrite,DataAdr,WriteData,ReadData);
    instruction_memory InstructionMemory(PC[7:2],Instr);
    data_memory DataMemory(CLK,MemWrite,DataAdr,WriteData,ReadData);
    
//    logic reset, MemWrite, RegWrite, RegDst, ALUSrc, MemtoReg, Zero, Branch, PCSrc, Jump;
//    logic [31:0]    PCJump, PC_next, PC_next_real, PC, PCPlus4, Instr, PCBranch, 
//                    SignImm, SrcA, SrcB, ALUResult,ReadData, WriteData, Result;
//    logic [2:0] ALUControl;
//    logic [4:0] WriteReg;
//    program_counter ProgramCounter(CLK,reset,PC_next_real,PC);

//    regfile RegFile(CLK,RegWrite,Instr[25:21],Instr[20:16],WriteReg,Result,SrcA,WriteData);
//    signext Signext(Instr[15:0],SignImm);
//    ALU ALU_(ALUControl,SrcA,SrcB,ALUResult,Zero);
    
//    pc_plus4 PC_plus4(PC,PCPlus4);
//    mux2_32 Mux2_32_alusrc(ALUSrc,WriteData,SignImm,SrcB);
//    mux2_32 Mux2_32_memtoreg(MemtoReg,ALUResult,ReadData,Result);
//    mux2_5 Mux2_5_regdst(RegDst,Instr[20:16],Instr[15:11],WriteReg);
//    ALU_adder ALUAdder(SignImm,PCPlus4,PCBranch);
//    mux2_32 Mux2_32_branch(PCSrc,PCPlus4,PCBranch,PC_next);
//    control_unit ControlUnit(Instr[31:26],Instr[5:0],Zero,MemtoReg,MemWrite,
//                                ALUSrc,RegDst,RegWrite,PCSrc,ALUControl);
//    assign PCJump={PCPlus4[31:28],Instr[25:0],2'b00};
//    mux2_32 Mux2_32_jump(Jump,PC_next,PCJump,PC_next_real);
endmodule
