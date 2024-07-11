module data_memory #(parameter data_width=8, addr_width=32)(
    input clk ,
    input WE,
    input [addr_width-1:0]A,
    input [(data_width * 4) - 1:0]WD,
    output [(data_width * 4) - 1:0]RD
);  
    reg [data_width-1:0]data_mem[0:16777215];
always@(posedge clk)
begin

    if(WE)
    {data_mem[A], data_mem[A + 1], data_mem[A + 2], data_mem[A + 3]}<=WD;
    else
    data_mem[A]<=data_mem[A];
end

assign RD = {data_mem[A], data_mem[A + 1], data_mem[A + 2], data_mem[A + 3]};
endmodule