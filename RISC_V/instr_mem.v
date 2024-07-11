module instr_mem
(
	input [31 : 0] A1, A2,
	input [31 : 0] WD2,
	output reg [31 : 0] RD1
);

parameter [23 : 0] mem_width = 24'hfff_fff;   

//Instruction memory...
reg [7 : 0] instr_mem [0 : mem_width];

//Reading instructions...
always @(*)
	RD1 = {instr_mem [A1], instr_mem [A1 + 1], instr_mem [A1 + 2], instr_mem [A1 + 3]};

//Writing instructions...
always @(*)
	{instr_mem [A2], instr_mem [A2 + 1], instr_mem [A2 + 2], instr_mem [A2 + 3]} = WD2;

endmodule