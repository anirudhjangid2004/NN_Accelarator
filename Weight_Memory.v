`timescale 1ns / 1ps
`include "include.v"

module Weight_Memory #(parameter numWeight = 3, neuronNo = 5, layerNo = 1,
                       addressWidth = 10, dataWidth=16, weightFile="w_1_15.mif")
    (
    input clk,
    input ren,
    input [addressWidth-1:0] radd,
    output reg [dataWidth-1:0] data_out
    ); 

    reg [dataWidth-1:0] mem [numWeight-1:0];
    
    initial begin
        $readmemb(weightFile, mem);
    end
    
    always@(posedge clk) begin
        if(ren) begin
            data_out <= mem[radd];
        end
    end
    
endmodule
