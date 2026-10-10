`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2026 09:34:34
// Design Name: 
// Module Name: alu
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
module alu(
    input wire[7:0]ao,
    input wire[7:0]bo,
    input wire sel,
    
    output reg[7:0]aluo,
    output reg c,
    output reg z);

always@(*)
begin 
c = 1'b0;
 if(sel==1'b0)
begin
{c,aluo}={1'b0,ao}+{1'b0,bo};
end
 else if(sel==1'b1)
 begin
 aluo=ao^bo;
 end
 else
 begin
 aluo=8'b00000000;
 end
 if(aluo==8'b00000000)
 z=1'b1;
 else
 z=1'b0;
end
endmodule
