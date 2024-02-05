`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 12:34:27 AM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory#(parameter ADDR_WIDTH /*N*/ = 5 ,DATA_WIDTH/*Bits*/ = 32)(
    input [DATA_WIDTH -1: 0] instr_in,instr_in_addr,
    input  [DATA_WIDTH -1: 0] A,
    output  [DATA_WIDTH -1: 0] RD
    );
    
    reg [DATA_WIDTH - 1:0] memory[0:2**ADDR_WIDTH -1];
    
initial $readmemh("RISCV_Tset.txt",memory);
    
    //Asynchronous read port
    assign RD = memory[A];
    
endmodule
