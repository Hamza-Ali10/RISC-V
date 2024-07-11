module CU
(
	input [6 : 0] OpCode,
	input zero_flag,
	output reg RegWrite, ALUSrc, MemWrite,
	output PCSrc,
	output reg [1 : 0] ALUOp, ImmSrc, ResultSrc
);

//Internals...
reg branch, jump;

always @(*)
begin
	if (OpCode == 7'b0000011)	//lw
	begin
		RegWrite = 1'b1;
		ImmSrc = 2'b00;
		ALUSrc = 1'b1;
		MemWrite = 1'b0;
		ResultSrc = 2'b01;
		branch = 1'b0;	
		ALUOp = 2'b00;
		jump = 1'b0;
	end

	else if (OpCode == 7'b0100011)	//sw
	begin
		RegWrite = 1'b0;
		ImmSrc = 2'b01;
		ALUSrc = 1'b1;
		MemWrite = 1'b1;
		ResultSrc = 2'bxx;
		branch = 1'b0;	
		ALUOp = 2'b00;
		jump = 1'b0;
	end

	else if (OpCode == 7'b0110011)	//R-type
	begin
		RegWrite = 1'b1;
		ImmSrc = 2'bxx;
		ALUSrc = 1'b0;
		MemWrite = 1'b0;
		ResultSrc = 2'b00;
		branch = 1'b0;	
		ALUOp = 2'b10;
		jump = 1'b0;
	end

	else if (OpCode == 7'b1100011)	//beq
	begin
		RegWrite = 1'b0;
		ImmSrc = 2'b10;
		ALUSrc = 1'b0;
		MemWrite = 1'b0;
		ResultSrc = 2'bxx;
		branch = 1'b1;	
		ALUOp = 2'b01;
		jump = 1'b0;
	end

	else if (OpCode == 7'b0010011)	//I-type ALU
	begin
		RegWrite = 1'b1;
		ImmSrc = 2'b00;
		ALUSrc = 1'b1;
		MemWrite = 1'b0;
		ResultSrc = 2'b00;
		branch = 1'b0;	
		ALUOp = 2'b10;
		jump = 1'b0;
	end

	else if (OpCode == 7'b1101111)	//jal
	begin
		RegWrite = 1'b1;
		ImmSrc = 2'b11;
		ALUSrc = 1'bx;
		MemWrite = 1'b0;
		ResultSrc = 2'b10;
		branch = 1'b0;	
		ALUOp = 2'bxx;
		jump = 1'b1;
	end

	else	//Default case
	begin
		RegWrite = 1'b0;
		ImmSrc = 2'b0;
		ALUSrc = 1'b0;
		MemWrite = 1'b0;
		ResultSrc = 2'b0;
		branch = 1'b0;	
		ALUOp = 2'b0;
		jump = 1'b0;
	end
end

//PCSrc...
assign PCSrc = (zero_flag & branch) | jump;

endmodule