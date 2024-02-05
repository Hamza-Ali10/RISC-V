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
module Max_3to1
(
	input [1 : 0] sel,
	input [31 : 0] w0, w1, w2,
	output reg [31 : 0] out
);

always @(*)
begin
	case (sel)
		2'd0 : out = w0;
		2'd1 : out = w1;
		2'd2 : out = w2;

		default : out = 'b0;
	endcase
end

endmodule