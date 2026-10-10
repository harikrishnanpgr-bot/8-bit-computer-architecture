
`timescale 1ns / 1ps

module control_unit(
    input wire clk,
    input wire rst,
    input wire [3:0] opcode,

    output reg ci,
    output reg co,
    output reg ce,
    output reg j,

    output reg ai,
    output reg ao,
    output reg bi,
    output reg bo,

    output reg oi,
    output reg oo,
    output reg ri,
    output reg ro,

    output reg ad,
    output reg xo,
    output reg aluo,

    output reg ii,
    output reg io,
    output reg mi,
    output reg mo,

    output reg fi,
    output reg fo,
    output reg hl
);

// Instruction opcodes
localparam
    nop  = 4'b0001,
    lda  = 4'b0010,
    add  = 4'b0011,
    sta  = 4'b0101,
    jmp  = 4'b0100,
    xorr = 4'b1001,
    out  = 4'b1011,
    hlt  = 4'b1100;

// States
localparam
    t0   = 3'b000,
    t1   = 3'b001,
    t2   = 3'b010,
    t3   = 3'b011,
    t4   = 3'b100,
    t5   = 3'b101,
    halt = 3'b110;

reg [2:0] s, ns;

// State register
always @(posedge clk or posedge rst) begin
    if (rst)
        s <= t0;
    else
        s <= ns;
end

// Control logic
always @(*) begin

    // Default control signals
    ns   = t0;

    ci   = 1'b0;
    co   = 1'b0;
    ce   = 1'b0;
    j    = 1'b0;

    ai   = 1'b0;
    ao   = 1'b0;
    bi   = 1'b0;
    bo   = 1'b0;

    oi   = 1'b0;
    oo   = 1'b0;
    ri   = 1'b0;
    ro   = 1'b0;

    ad   = 1'b0;
    xo   = 1'b0;
    aluo = 1'b0;

    ii   = 1'b0;
    io   = 1'b0;
    mi   = 1'b0;
    mo   = 1'b0;

    fi   = 1'b0;
    fo   = 1'b0;
    hl   = 1'b0;

    case (s)

        // T0: Put PC on bus and load MAR
        t0: begin
            co = 1'b1;
            mi = 1'b1;
            ns = t1;
        end

        // T1: Load instruction from RAM into IR
        t1: begin
            ro = 1'b1;
            ii = 1'b1;
            ns = t2;
        end

        // T2: Increment PC
        t2: begin
            ce = 1'b1;
            ns = t3;
        end

        // T3: Decode instruction
        t3: begin
            case (opcode)

                nop: begin
                    ns = t0;
                end

                lda, add, sta, xorr: begin
                    io = 1'b1;
                    mi = 1'b1;
                    ns = t4;
                end

                jmp: begin
                    io = 1'b1;
                    j  = 1'b1;
                    ns = t0;
                end

                out: begin
                    ao = 1'b1;
                    oi = 1'b1;
                    ns = t0;
                end

                hlt: begin
                    ns = halt;
                end

                default: begin
                    ns = t0;
                end

            endcase
        end

        // T4: Execute memory instruction
        t4: begin
            case (opcode)

                lda: begin
                    ro = 1'b1;
                    ai = 1'b1;
                    ns = t0;
                end

                add: begin
                    ro = 1'b1;
                    bi = 1'b1;
                    ns = t5;
                end

                sta: begin
                    ao = 1'b1;
                    ri = 1'b1;
                    ns = t0;
                end

                xorr: begin
                    ro = 1'b1;
                    bi = 1'b1;
                    ns = t5;
                end

                default: begin
                    ns = t0;
                end

            endcase
        end

        // T5: ALU operation
        t5: begin
            if (opcode == add) begin
                ad   = 1'b1;
                xo   = 1'b0;
                aluo = 1'b1;
                ai   = 1'b1;
                fi   = 1'b1;
                ns   = t0;
            end
            else if (opcode == xorr) begin
                ad   = 1'b0;
                xo   = 1'b1;
                aluo = 1'b1;
                ai   = 1'b1;
                fi   = 1'b1;
                ns   = t0;
            end
            else begin
                ns = t0;
            end
        end

        // Halt until reset
        halt: begin
            hl = 1'b1;
            ns = halt;
        end

        default: begin
            ns = t0;
        end

    endcase
end

endmodule