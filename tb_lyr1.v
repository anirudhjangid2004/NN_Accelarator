`timescale 1ns / 1ps

module tb_lyr1();
    
    reg clk = 1'b0;
    reg rst = 1'b0;
    reg [15:0] inWord = 16'h0001;
    integer i = 2;
    wire [16*30 - 1 : 0] out;
    wire [29 : 0] valid_lyr1;   
    
    Layer_2 lyr2 (.clk(clk), .rst(rst), .x_valid(1'b1), .x_in(inWord), .x_out(out), .o_valid(valid_lyr1));
    
//    initial #3 inWord = 16'habcd;
    
    always #5 clk = ~clk;

    always begin
            if(i == 0) begin
                #5;
            end
            while(1) begin
                #10
                inWord = i;
                i = i + 1;
            end
        end
    
    initial #15000 $finish;   

endmodule
