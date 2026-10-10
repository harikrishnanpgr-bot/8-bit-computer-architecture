`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 12:29:04 PM
// Design Name: 
// Module Name: out_reg
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


module out_reg(oo,clk,rst,load,oi);
input clk;
input rst;
input load;
input [7:0]oi;
output reg[7:0]oo;
always @(posedge clk or posedge rst)
begin
if(rst)
   oo <= 8'b00000000;
else if(load)
   oo <= oi;
   
end
endmodule