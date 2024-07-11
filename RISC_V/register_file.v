module register_file #(parameter ADDR_WIDTH /*N*/ = 5 ,DATA_WIDTH/*Bits*/ = 32)(
    input clk,
    input we,
    input[19 : 15] A1,
    input[24 : 20] A2,
    input[11 : 7] A3,
    input [DATA_WIDTH-1 : 0] WD3,
    output [DATA_WIDTH-1 : 0] RD1,
    output [DATA_WIDTH-1 : 0] RD2
    );
    
    reg [DATA_WIDTH - 1:0] memory[0:2**ADDR_WIDTH -1];
    
    always@(posedge clk)
    begin
            //synchronous wirte port
            if(we)
            memory[A3] <=  WD3;
    end

    //Zero register (x0)...
    always @(*)
        memory [0] = 'b0;
    
    //Asynchronous read port
    assign RD1 =(A1 != 0 ) ?  memory[A1] : 'b0 ;
    assign RD2 =(A2 != 0 ) ?  memory[A2] : 'b0 ;

    
endmodule