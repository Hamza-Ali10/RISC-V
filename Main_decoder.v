`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 08:50:42 PM
// Design Name: 
// Module Name: control_unit
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


module Main_decoder(
    input [6:0] op,
    input zero,
    output PCSrc,
    output reg [1:0] ImmSrc,ALUOp,
    output reg RegWrite,ALUSrc,MemWrite,ResultSrC
    );
    
        reg Jump,Branch;
      always@(*)
      begin
            ImmSrc    =2'b00;
            ResultSrC =1'b0;
            ALUOp     =2'b00;
            RegWrite  =1'b0;
            ALUSrc    =1'b0;
            MemWrite  =1'b0;
            Jump      =1'b0;
            Branch    =1'b0;
              case(op)
                         8'b0000011:
                         begin
                         ImmSrc    =2'b00;
                         ResultSrC =1'b1;
                         ALUOp     =2'b00;
                         RegWrite  =1'b1;
                         ALUSrc    =1'b1;
                         MemWrite  =1'b0;
                         Jump      =1'b0;
                         Branch    =1'b0;         
                         end
                         8'b0100011:
                         begin
                         ImmSrc    =2'b01;
                         ResultSrC =1'bx;
                         ALUOp     =2'b00;
                         RegWrite  =1'b0;
                         ALUSrc    =1'b1;
                         MemWrite  =1'b1;
                         Jump      =1'b0;
                         Branch    =1'b0;
                         end
                         8'b0110011:
                         begin
                         ImmSrc    =2'bxx;
                         ResultSrC =1'b0;
                         ALUOp     =2'b10;
                         RegWrite  =1'b1;
                         ALUSrc    =1'b0;
                         MemWrite  =1'b0;
                         Jump      =1'b0;
                         Branch    =1'b0;  
                         end
                         8'b1100011:
                         begin
                         ImmSrc    =2'b10;
                         ResultSrC =1'bx;
                         ALUOp     =2'b01;
                         RegWrite  =1'b0;
                         ALUSrc    =1'b0;
                         MemWrite  =1'b0;
                         Jump      =1'b0;
                         Branch    =1'b1;
                         end
                         8'b0010011:
                         begin
                         ImmSrc    =2'b00;
                         ResultSrC =1'b0;
                         ALUOp     =2'b10;
                         RegWrite  =1'b1;
                         ALUSrc    =1'b1;
                         MemWrite  =1'b0;
                         Jump      =1'b0;
                         Branch    =1'b0;
                         end
                         8'b1101111:
                         begin
                         ImmSrc    =2'b11;
                         ResultSrC =1'bx;
                         ALUOp     =2'bxx;
                         RegWrite  =1'b1;
                         ALUSrc    =1'bx;
                         MemWrite  =1'b0;
                         Jump      =1'b1;
                         Branch    =1'b0;
                         end
                         default:
                         begin
                         ImmSrc    =2'bxx;
                         ResultSrC =1'bx;
                         ALUOp     =2'bxx;
                         RegWrite  =1'bx;
                         ALUSrc    =1'bx;
                         MemWrite  =1'bx;
                         Jump      =1'bx;
                         Branch    =1'bx;
                         end
              endcase
    
        end
      assign  PCSrc = (Branch && zero ) || Jump;  
      
endmodule
