`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 12:59:29 AM
// Design Name: 
// Module Name: RISC_V
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


module RISC_V(
     input clk,reset,
     input [31 : 0] instr_in,
     input [31 : 0] instr_in_addr
    );
    
    RISC_V32I RISC_V32I
        (
            .clk(clk),
            .reset(reset),
            .instr_in(instr_in),
            .instr_in_addr(instr_in_addr)
        );
    
endmodule
