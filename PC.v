`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 02:02:43 AM
// Design Name: 
// Module Name: Counter_32bit
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


module PC(
    input clk,
    input reset,
    input  [31:0]PC_next,
    output [31:0] PC
    );
    
    reg [31 : 0] PC_reg , PCnext ;
    
    always@ (posedge clk , negedge reset)
    begin
            if(!reset )
            PC_reg <= 'b0;        
            else
            PC_reg <= PCnext ;
    end
    
    always@(PC_reg)    //always@(*)
    begin
    	PCnext = PC_reg + 1 ; 
    end
    
    assign PC = PC_reg;
    
endmodule
