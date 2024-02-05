`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 01:35:28 AM
// Design Name: 
// Module Name: Control_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Control_Unit(
        input [6:0]      op,
        input [2:0]      funct3,
        input            funct7_5,
        input            zero,
        output           PCSrc,ResultSrC,
        output  [1:0] ImmSrc,
        output  RegWrite,ALUSrc,MemWrite,
        output  [2:0] ALUControl
    );
    
    wire [1:0] S1;
    
    Main_decoder Main_decoder(
    .op(op),
    .ResultSrC(ResultSrC),
    .ImmSrc(ImmSrc),
    .ALUOp(S1),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .PCSrc(PCSrc),
    .zero(zero)
    );
    
    ALU_decoder ALU_decoder(
    .funct3(funct3),
    .funct7_5(funct7_5),
    .op_5(op[5]),
    .ALUOp(S1),
    .ALUControl(ALUControl)
    );
    
    
endmodule
