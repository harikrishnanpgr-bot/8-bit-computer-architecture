`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 11:05:41 AM
// Design Name: 
// Module Name: reg_A
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


module reg_A(ao,clk,reset,load,ai);
input clk;
input reset;
input load;
input[7:0]ai;
 output reg [7:0]ao;
always @(posedge clk or posedge reset)
begin
if(reset)
    ao <= 8'b00000000;
else if (load)
     ao <= ai;
end 
endmodule