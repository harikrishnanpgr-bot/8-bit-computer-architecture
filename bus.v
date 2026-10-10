module bus(
 input wire [3:0]pc,
 input wire [7:0]ri,
 input wire [7:0]ai,
 input wire [7:0]ii,
 input wire [7:0]alui,
 
 input wire co,
 input wire ro,
 input wire ao,
 input wire io,
 input wire aluo,
 
 output reg [7:0]bus
);
    always@(*)begin
        if(co)
            bus = {4'b0000,pc};
        else if (ro)
            bus = ri;
        else if (ao)
            bus = ai;
        else if (io)
            bus = ii;
        else if (aluo)
            bus = alui;
        else 
            bus = 8'b00000000;
   end 
   
endmodule  