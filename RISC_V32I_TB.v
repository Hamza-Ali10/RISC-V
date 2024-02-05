`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2023 08:49:46 PM
// Design Name: 
// Module Name: RISC_V32I_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RISC_V32I_TB();

         reg  clk;
         reg reset;
         reg [31:0] instr_in, instr_in_addr;
         reg MemWrite;
         
 // instantiate device to be tested
     RISC_V dut(
       .clk(clk),
       .reset(reset),
       .instr_in(instr_in), 
       .instr_in_addr(instr_in_addr),
       .MemWrite(MemWrite)
       );
 
 

 // generate clock to sequence tests
     always
     begin
            clk <= 1;
            #5;
            clk <= 0;
            #5;
     end
     
   // initialize test
        initial
         begin
            reset <= 1; 
            #5;
            reset <= 0;
         end
         
    // check results
     always @(negedge clk)
         begin
             if(MemWrite) 
             begin
                 if(instr_in_addr === 100 & instr_in === 25) 
                 begin
                     $display("Simulation succeeded");
                     $stop;
                     end else if (instr_in_addr !== 96) begin
                     $display("Simulation failed");
                     $stop;
                 end
             end
     end

endmodule
