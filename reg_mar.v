`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 02:34:05 PM
// Design Name: 
// Module Name: reg_mar
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


module reg_mar(mo,clk,rst,load,mi);
input clk;
input rst;
input load;
input [3:0]mi;
output reg [3:0]mo;
always @(posedge clk or posedge rst)
begin
if(rst)
  mo <= 4'b0000;
else if(load)
  mo <= mi;
end
endmodule