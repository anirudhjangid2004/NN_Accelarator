`timescale 1ns / 1ps

module tb_NN_indiv();

    reg clk = 1'b0;
    reg rst = 1'b0;
    reg [15:0] inWord = 16'h0000;
    integer i = 0;
    wire [16*10 - 1 : 0] out;
    wire [9 : 0] valid_lyr1;   
    
    reg [15:0] mem [0:783];
        
    initial begin
        $readmemb("SampleImage.mif", mem);
    end
    
    NeuralNet NN (.clk(clk), .rst(rst), .inWord(inWord), .layer_4_out(out), .layer_4_valid(valid_lyr1));
   
    always #5 clk = ~clk;

    always begin
            if(i == 0) begin
                #5;
            end
            while(1) begin
                #10
                inWord = mem[i];
                i = i + 1;
            end
        end
    
    initial #9000 $finish; 

endmodule
