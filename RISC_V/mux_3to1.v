module mux_3to1
(
	input [1 : 0] sel,
	input [31 : 0] i0, i1, i2,
	output reg [31 : 0] z
);

always @(*)
begin
	case (sel)
		2'd0 : z = i0;
		2'd1 : z = i1;
		2'd2 : z = i2;

		default : z = 'b0;
	endcase
end

endmodule