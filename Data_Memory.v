`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 11:07:08 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory#(parameter ADDR_WIDTH /*N*/ = 5 ,DATA_WIDTH/*Bits*/ = 32)(
    input clk,
    input we,
    input  [DATA_WIDTH -1: 0] A,
    input  [DATA_WIDTH -1: 0] WD,
    output [DATA_WIDTH -1: 0] RD
    );
    
    reg [DATA_WIDTH - 1:0] memory[0:2**ADDR_WIDTH -1];
    
    always@(posedge clk)
    begin
            //synchronous wirte port
            if(we)
            memory[A] <=  WD;
    end
    
    //Asynchronous read port
    assign RD = memory[A];
    
endmodule