module RISC_V
(
	input clk,
	input [31 : 0] instr_in,
	input [31 : 0] instr_in_addr
);

//Interconnects...
wire [31 : 0] PCNext, PCTarget, PCPlus4;

wire [31 : 0] instr_out, ImmExt, ALUResult, RD_mem;

wire [31 : 0] RD1, RD2, WD3;	//Instruction memory ports.

wire [1 : 0] ImmSrc, ALUOp, ResultSrc;

wire [2 : 0] ALUControl;

wire PCSrc, RegWrite, ALUSrc, zero_flag, MemWrite;

//Module instantiations...
PC M0	//Program counter.
(
	.clk(clk),
	.PCSrc(PCSrc),
	.PCTarget(PCTarget),
	.PCPlus4(PCPlus4),
	.PC_out(PCNext)
);

instr_mem M1	//Instruction memory.
(
	.A1(PCNext),
	.A2(instr_in_addr),
	.WD2(instr_in),
	.RD1(instr_out)
);

register_file M2
(
	.clk(clk),
	.we(RegWrite),
	.A1(instr_out [19 : 15]),
	.A2(instr_out [24 : 20]),
	.A3(instr_out [11 : 7]),
	.WD3(WD3),
	.RD1(RD1),
	.RD2(RD2)
);

EXTEND_UNIT M3	//Extend unit.
(
	.IMMSRC(ImmSrc),
	.INSTR(instr_out [31 : 7]),
	.IMM_EXTEND(ImmExt)
);

ALU M4
(
	.ALUControl(ALUControl),
	.SrcA(RD1),
	.SrcB(ALUSrc ? ImmExt : RD2),
	.ALUResult(ALUResult),
	.zero_flag(zero_flag)
);

data_memory M5	//Data memory.
(
	.clk(clk),
	.WE(MemWrite),
	.A(ALUResult),
	.WD(RD2),
	.RD(RD_mem)
);

CU M6	//Control unit.
(
	.OpCode(instr_out [6 : 0]),
	.zero_flag(zero_flag),
	.RegWrite(RegWrite),
	.ALUSrc(ALUSrc),
	.MemWrite(MemWrite),
	.PCSrc(PCSrc),
	.ALUOp(ALUOp),
	.ImmSrc(ImmSrc),
	.ResultSrc(ResultSrc)
);

ALU_decoder M7
(
	.ALUOp(ALUOp),
	.funct3(instr_out [14 : 12]),
	.op_5__funct7_5({instr_out [5], instr_out [30]}),
	.ALUControl(ALUControl)
);

fulladder_RISC M8
(
	.a(PCNext),
	.b(ImmExt),
	.sum(PCTarget)
);

fulladder_RISC M9
(
	.a(PCNext),
	.b('d4),
	.sum(PCPlus4));

mux_3to1 M10
(
	.sel(ResultSrc),
	.i0(ALUResult),
	.i1(RD_mem),
	.i2(PCPlus4),
	.z(WD3)
);

endmodule