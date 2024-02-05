`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 11:39:14 PM
// Design Name: 
// Module Name: Extend
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


module Extend(
    input [1:0] IMMSRC ,
    input [24:0] INSTR ,
    output reg [31:0]  IMM_EXTEND 
    );

    always @(*) begin
            if (IMMSRC == 2'b00) begin
    
                IMM_EXTEND = { {20{INSTR[24]}} , INSTR[24:13] } ;
    
            end
            else if (IMMSRC == 2'b01) begin
    
                IMM_EXTEND = { {20{INSTR[24]}} , INSTR[24:18] , INSTR[4:0] } ;
    
            end
            else if (IMMSRC == 2'b10) begin
    
                IMM_EXTEND = { {20{INSTR[24]}} , INSTR[0] , INSTR[23:18] , INSTR[4:1] , 1'b0 } ;
    
            end
            else if (IMMSRC == 2'b11) begin
    
                IMM_EXTEND = { {12{INSTR[24]}} , INSTR[12:5] , INSTR[13] , INSTR[23:14] , 1'b0 } ;
    
            end
            else
                IMM_EXTEND = 32'bxxx;   //undfined
    end
endmodule