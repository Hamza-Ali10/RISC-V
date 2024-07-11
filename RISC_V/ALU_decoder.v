module ALU_decoder
(
	input [1 : 0] ALUOp,
	input [2 : 0] funct3,
	input [1 : 0] op_5__funct7_5,
	output reg [2 : 0] ALUControl
);

always @(*)
begin
	if (ALUOp == 0)
		ALUControl = 3'b000;	//Addition.
	else if (ALUOp == 1)
		ALUControl = 3'b001;	//Subtraction.
	else if (ALUOp == 2)
	begin
		if (funct3 == 0 && op_5__funct7_5 != 3)
			ALUControl = 3'b000;	//Addition.
		else if (funct3 == 0 && op_5__funct7_5 == 3)
			ALUControl = 3'b001;	//Subtraction.
		else if (funct3 == 2)
			ALUControl = 3'b101;	//slt.
		else if (funct3 == 6)
			ALUControl = 3'b011;	//Bitwise OR.
		else if (funct3 == 7)
			ALUControl = 3'b010;	//Bitwise AND.
		else
			ALUControl = 3'bxxx;	//Default case.
	end

	else
		ALUControl = 3'bxxx;	//Default case.
end

endmodule