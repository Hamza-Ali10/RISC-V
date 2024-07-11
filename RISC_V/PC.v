module PC
(
	input clk, PCSrc, 
	input [31 : 0] PCTarget, PCPlus4,
	output reg [31 : 0] PC_out
);

always @(posedge clk)
	PC_out <= PCSrc ? PCTarget : PCPlus4;

endmodule