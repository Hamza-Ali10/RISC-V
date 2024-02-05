`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 11:26:24 PM
// Design Name: 
// Module Name: ALU
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


module ALU (
  input       [31:0] A,
  input       [31:0] B,
  input       [2:0] sel,
  output reg       zero,
  output reg  [31:0] out
  );

  always@(*)
  begin
                  case(sel)
                            3'b000 : out = A + B;                 //Add
                            3'b001 :                              //sub
                             begin
                                     out = A - B; 
                                     if(out == 'b0)           //Zero flag is asserted
                                        zero =1'b1;
                                      else
                                        zero =1'b0;
                             end                
                            3'b010 : out = A & B;                 //And
                            3'b011 : out = A | B;                 //OR
                            3'b101 : out = (A < B ) ? 1 : 0;      //slt (set less than)
                          default : out = 'b0 ;
        
                  endcase 
   end
endmodule
