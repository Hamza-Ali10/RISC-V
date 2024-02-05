`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/09/2023 10:46:04 PM
// Design Name: Hamza Ali
// Module Name: full_adder_with_constant
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
module full_adder_32bit#(parameter n=32)(
    input [n-1:0] a, 
    output [n-1:0] sum
);
  assign sum = a + 32'b1000;
endmodule
