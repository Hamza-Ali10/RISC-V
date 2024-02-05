`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/09/2023 10:46:04 PM
// Design Name: Hamza Ali
// Module Name: simple_register
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
    module RISC_V32I
    (
        input clk,reset,
        input [31 : 0] instr_in,
        input [31 : 0] instr_in_addr
    );
    
        //Interconnects...
        wire [31 : 0] PC_next,PC, PCTarget, PCPlus4;
        
        wire [31 : 0] instr_out, ImmExt, ALUResult, RD_mem;
        
        wire [31 : 0] RD1, WriteData, WD3;	//Instruction memory ports.
        
        wire SrcA,SrcB,funct7_5,funct3;
        
        wire [1 : 0] ImmSrc, ALUOp, ResultSrc;
        
        wire [2 : 0] ALUControl;
        
        wire PCSrc, RegWrite, ALUSrc, zero, MemWrite;
    
    //Module instantiations...
    
    //Program counter.
    PC Pc(
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .PC_next(PC_next)
    );
    
    //Instruction memory.
     Instruction_Memory  Instruction_Memory	(
        .A(PC),
        .instr_in_addr(instr_in_addr),
        .instr_in(instr_in),
        .RD(instr_out)
    );
    
     Max_2_1_nBit MAX1(
     .w0(PCPlus4),
     .w1(PCTarget),
     .sel(PCSrc),
     .out(PC_next)
     );
     
     Max_2_1_nBit MAX2(
      .w0(WriteData),
      .w1(ImmExt),
      .sel(ALUSrc),
      .out(SrcB)
     );
    
    register_file  register_file(
        .clk(clk),
        .we(RegWrite),
        .A1(instr_out [19 : 15]),
        .A2(instr_out [24 : 20]),
        .A3(instr_out [11 : 7]),
        .WD3(WD3),
        .RD1(SrcA),
        .RD2(WriteData)
    );
    
    Extend EXTEND_UNIT 	//Extend unit.
    (
        .IMMSRC(ImmSrc),
        .INSTR(instr_out [31 : 7]),
        .IMM_EXTEND(ImmExt)
    );
    
    ALU ALU
    (
        .sel(ALUControl),
        .A(SrcA),
        .B(SrcB),
        .out(ALUResult),
        .zero(zero)
    );
    
     Data_Memory data_memory	//Data memory.
    (
        .clk(clk),
        .we(MemWrite),
        .A(ALUResult),
        .WD(WriteData),
        .RD(RD_mem)
    );
    
    Control_Unit ControlUnit	//Control unit.
    (
        .op(instr_out [6 : 0]),
        .funct3(instr_out [14 : 12]),
        .funct7_5(funct7_5),
        .zero(zero),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .PCSrc(PCSrc),
        .ALUControl(ALUControl),
        .ImmSrc(ImmSrc),
        .ResultSrC(ResultSrc)
    );
    
    fulladder full_adder
    (
        .num1(PC_next),
        .num2(ImmExt),
        .sum(PCTarget)
    );
    
    full_adder_32bit fulladder
    (
        .num(PC_next),
        .sum(PCPlus4)
    );
    
    Max_3to1 M3
    (
        .sel(ResultSrc),
        .w0(ALUResult),
        .w1(RD_mem),
        .w2(PCPlus4),
        .out(WD3)
    );
    
    endmodule