`timescale 1ns / 1ps

module maxNum #(parameter NN_lyr = 10, dataWidth = 16)
(   input clk,
    input rst,
    input inputValidity,
    input [NN_lyr*dataWidth-1:0] inputData,
    output [3:0] predictedNum
    );
    
    reg [NN_lyr*dataWidth-1:0] OneTimeStorage;
    reg inputValid;
    int counter = 0;
    
    reg [dataWidth-1:0] maxVal;
    
    always@(posedge clk) begin
        if(inputValid | inputValidity) begin
            inputValid = inputValidity;
            if(counter == 0) begin
                OneTimeStorage = inputData;
                maxVal = OneTimeStorage[counter*dataWidth+:dataWidth];
                counter = 1;
            end
            
            else if(counter >= 10) begin
                inputValid = inputValidity;
                counter = 0;
            end
            
            else if(counter != 0) begin
                if(maxVal <= OneTimeStorage[counter*dataWidth+:dataWidth]) begin
                    maxVal = OneTimeStorage[counter*dataWidth+:dataWidth];
                    counter = counter + 1;
                end
            end       
        end
    end
    
endmodule
