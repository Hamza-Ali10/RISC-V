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
module register_file #(parameter ADDR_WIDTH /*N*/ = 5 ,DATA_WIDTH/*Bits*/ = 32)(
    input clk,
    input we,
    input[19 : 15] A1,
    input[24 : 20] A2,
    input[11 : 7] A3,
    input  [DATA_WIDTH-1 : 0] WD3,
    output [DATA_WIDTH-1 : 0] RD1,
    output [DATA_WIDTH-1 : 0] RD2
    );
    
    reg [DATA_WIDTH - 1:0] memory[0:2**ADDR_WIDTH -1];
    
    always@(posedge clk)
    begin
            //synchronous wirte port
            if(we)
            memory[A3] <=  WD3;
    end
    
    //Asynchronous read port
    assign RD1 =(A1 != 0 ) ?  memory[A1] : 0 ;
    assign RD2 =(A2 != 0 ) ?  memory[A2] : 0 ;

    
endmodule