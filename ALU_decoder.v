`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 12:17:57 AM
// Design Name: 
// Module Name: ALU_decoder
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


module ALU_decoder(
       input [2:0]      funct3,
       input            funct7_5,
       input            op_5,
       input [1:0]      ALUOp,
       output reg [2:0] ALUControl
    );
    
    always@(*)
    begin
        case(ALUOp)
                    2'b00 : ALUControl = 3'b000 ;
                    2'b01 : ALUControl = 3'b001 ;
                    2'b10 : 
                    begin
                          case(funct3)
                                    3'b000:
                                    begin
                                            if({op_5,funct7_5} == 3'b11)
                                                    ALUControl = 3'b001 ;
                                             else
                                                    ALUControl = 3'b000 ;       
                                    end  
                                    3'b111:ALUControl = 3'b010 ;
                                    3'b110:ALUControl = 3'b011 ;  
                                    default: ALUControl = 3'bxxx ;
                            endcase          
                    end
                    default: ALUControl = 3'bxxx ;
        endcase            
    end
endmodule

