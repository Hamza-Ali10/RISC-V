module ALU
(
	input [2 : 0] ALUControl,
	input [31 : 0] SrcA, SrcB,
	output reg [31 : 0] ALUResult,
	output zero_flag
);

always @(*)
begin
	case (ALUControl)
		3'b000 : ALUResult = SrcA + SrcB;	//Addition.
		3'b001 : ALUResult = SrcA - SrcB;	//Subtraction.
		3'b010 : ALUResult = SrcA & SrcB;	//Bitwise AND.
		3'b011 : ALUResult = SrcA | SrcB;	//Bitwise OR.
		3'd4, 3'd5, 3'd6, 3'd7 : ALUResult = 'b0;
	endcase
end

//Zero flag...
assign zero_flag = (ALUControl == 1) && (ALUResult == 0);

endmodule