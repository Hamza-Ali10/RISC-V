module RISC_V_tb
();

//Control variables...
reg [31 : 0] instr_in, instr_in_addr;
reg clk;

//Module instantiation...
RISC_V DUT
(
	.clk(clk),
	.instr_in(instr_in),
	.instr_in_addr(instr_in_addr)
);

//Clock generation
initial
	clk = 1'b1;

always
begin
	#50
	clk = ~clk;
end

/*Assembly code...

addi x8, x0, 0		#i
addi x9, x0, 0		#sum
addi x18, x0, 10	#for comdition

for: beq x8, x18, done
add x9, x8, x9
addi x8, x8, 1
jal x0, for
done: and x19, x8, x9

C equivalent code...
int i = 0, sum = 0;

for (i = 0, i != 10, i++)
{
	sum = sum + i;
}
*/

//Testbench...
initial
begin
	instr_in = 32'h00000413;
	instr_in_addr = 'd0;

	#100
	instr_in = 32'h00000493;
	instr_in_addr = 'd4;

	#100
	instr_in = 32'h00a00913;
	instr_in_addr = 'd8;

	#100
	instr_in = 32'h01240863;
	instr_in_addr = 'd12;

	#100
	instr_in = 32'h009404b3;
	instr_in_addr = 'd16;

	#100
	instr_in = 32'h00140413;
	instr_in_addr = 'd20;

	#100
	instr_in = 32'hff5ff06f;
	instr_in_addr = 'd24;

	#100
	instr_in = 32'h009479b3;
	instr_in_addr = 'd28;

end

endmodule