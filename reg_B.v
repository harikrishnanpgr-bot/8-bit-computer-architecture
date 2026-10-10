`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 12:14:26 PM
// Design Name: 
// Module Name: reg_B
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


module reg_B(bo,clk,rst,load,bi);
input clk;
input rst;
input load;
input [7:0]bi;
output reg[7:0]bo;
always @(posedge clk or posedge rst)
begin
if(rst)
    bo<= 8'b00000000;
else if(load)
    bo <= bi;
end
endmodule