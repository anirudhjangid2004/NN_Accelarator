`timescale 1ns / 1ps

module tb_neuron();
    
    reg clk = 1'b0;
    reg rst = 1'b0;
    reg [15:0] inputValue = 16'h0001;
    integer i = 0;
    
    wire [15:0] out_data;
    wire outValid;
    
    reg [15:0] mem [0:99];
            
    initial begin
        $readmemb("all_ones.mif", mem);
    end
    
    always #5 clk = ~clk;
    
    always begin
        if(i == 0) begin
            #5;
            
        end
        while(1) begin
            #10
            inputValue = mem[i];
            i = i + 1;
        end
    end
    
    initial #1100 $finish;
    
    neuron sample_neuron(.clk(clk), .rst(rst), .myInput(inputValue), .myInputValid(1'b1), .out(out_data), .outValid(outValid));
    
endmodule
