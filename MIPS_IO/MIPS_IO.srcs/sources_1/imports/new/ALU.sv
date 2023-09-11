`timescale 1ns / 1ps

module ALU(
    input logic [2:0] ALUControl,
    input logic [31:0] A,B,
    output logic [31:0] ALUResult,
    output logic Zero
    );
    
    always@(*)
 begin
    case(ALUControl)
      3'b000: ALUResult <= A&B;
      3'b001: ALUResult <= A|B;
      3'b010: ALUResult <= A+B;
      3'b110: ALUResult <= A-B;
      3'b111: ALUResult <= A<B ? 1:0;//slt
      3'b101:ALUResult <= ~(A|B);
      default: ALUResult <= 0;
    endcase
 end
 
 assign Zero = (ALUResult==0);

endmodule
