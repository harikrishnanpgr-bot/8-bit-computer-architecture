`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2026 09:51:56
// Design Name: 
// Module Name: program_counter
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
 
module program_counter(
    input wire  clk,
    input wire  rst,
    input wire  ce,
    input wire  load,
    input wire  [3:0] ci,
    output reg [3:0] co
);

always@(posedge clk or posedge rst)begin
    if(rst)
        co <= 4'b0000;
    else if(load)
        co <= ci;
    else if(ce)
        co <= co+4'b0001;

end
endmodule
