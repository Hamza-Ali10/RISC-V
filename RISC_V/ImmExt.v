module EXTEND_UNIT (INSTR , IMM_EXTEND , IMMSRC);

input [1:0] IMMSRC ;
input [24:0] INSTR ;
output reg [31:0] IMM_EXTEND ;

always @(*) begin
        if (IMMSRC == 'b00) begin

            IMM_EXTEND = { {20{INSTR[24]}} , INSTR[24:13] } ;

        end
        else if (IMMSRC == 'b01) begin

            IMM_EXTEND = { {20{INSTR[24]}} , INSTR[24:18] , INSTR[4:0] } ;

        end
        else if (IMMSRC == 'b10) begin

            IMM_EXTEND = { {20{INSTR[24]}} , INSTR[0] , INSTR[23:18] , INSTR[4:1] , 1'b0 } ;

        end
        else if (IMMSRC == 'b11) begin

            IMM_EXTEND = { {12{INSTR[24]}} , INSTR[12:5] , INSTR[13] , INSTR[23:14] , 1'b0 } ;

        end

end

endmodule
