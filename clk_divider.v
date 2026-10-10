
`timescale 1ns / 1ps

module clk_divider #(
    parameter integer CLK_FREQ = 100_000_000,
    parameter integer CPU_FREQ = 1
)(
    input wire clk,
    input wire rst,
    output reg clk_out
);

localparam integer HALF_PERIOD = CLK_FREQ / (2 * CPU_FREQ);

reg [31:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count   <= 0;
        clk_out <= 0;
    end
    else begin
        if (count >= HALF_PERIOD - 1) begin
            count   <= 0;
            clk_out <= ~clk_out;
        end
        else begin
            count <= count + 1'b1;
        end
    end
end

endmodule