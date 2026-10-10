`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 02:10:26 PM
// Design Name: 
// Module Name: flag_reg
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


module flag_reg(c,z,clk,rst,load,fi);
input clk;
input rst;
input load;
input [1:0]fi;
output  reg c;
output  reg z;
always @(posedge clk or posedge rst)
begin
if(rst)
 begin
   c <= 1'b0;
   z <= 1'b0;
 end  
else if (load)
 begin
    c <= fi[1];
    z <= fi[0];  
end
end
endmodule