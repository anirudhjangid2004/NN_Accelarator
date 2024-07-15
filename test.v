`timescale 1ns / 1ps

module test();
    reg [3:0]a = 4'b1010;
    reg [3:0]b = 4'b0010;
    
    reg [7:0] mul;
    always@* begin
        mul = $signed(a)*$signed(b);
        $display(mul);
    end
endmodule
