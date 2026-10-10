`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 02:24:23 PM
// Design Name: 
// Module Name: reg_ins
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


module reg_ins(io,clk,rst,load,ii);
input clk;
input rst;
input load;
input [7:0]ii;
output reg [7:0]io;
always @(posedge clk or posedge rst)
begin
if(rst)
   io <=8'b00000000;
else if(load)
   io <=ii;
end 
endmodule