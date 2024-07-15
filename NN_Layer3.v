`timescale 1ns / 1ps
`include "include.v"

module Layer_3 #(parameter NN=20, numWeight=30, dataWidth=16, layerNum=3,
                 sigmoidSize=10, weightIntWidth=4, actType="relu")
    (input clk,
    input rst,
    input x_valid,
    input [dataWidth-1:0] x_in,
     
    output [NN-1:0] o_valid,
    output [NN*dataWidth-1:0] x_out
    );
    
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(0), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_0.mif"), .biasFile("b_3_0.mif"))
         n_0(
            .clk(clk),
            .rst(rst),
            .myInput(x_in),
            .myInputValid(x_valid),
            .out(x_out[0*dataWidth+:dataWidth]),
            .outValid(o_valid[0])
            );
          
  neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(1), .dataWidth(dataWidth),
           .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
           .weightFile("w_3_1.mif"), .biasFile("b_3_1.mif"))
           n_1(
               .clk(clk),
               .rst(rst),
               .myInput(x_in),
               .myInputValid(x_valid),
               .out(x_out[1*dataWidth+:dataWidth]),
               .outValid(o_valid[1])
               );
    
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(2), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_2.mif"), .biasFile("b_3_2.mif"))
         n_2(
            .clk(clk),
            .rst(rst),
            .myInput(x_in),
            .myInputValid(x_valid),
            .out(x_out[2*dataWidth+:dataWidth]),
            .outValid(o_valid[2])
            );
                                        
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(3), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_3.mif"), .biasFile("b_3_3.mif"))
         n_3(
            .clk(clk),
            .rst(rst),
            .myInput(x_in),
            .myInputValid(x_valid),
            .out(x_out[3*dataWidth+:dataWidth]),
            .outValid(o_valid[3])
            );    

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(4), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_4.mif"), .biasFile("b_3_4.mif"))
         n_4(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[4*dataWidth+:dataWidth]),
             .outValid(o_valid[4])
             );    

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(5), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_5.mif"), .biasFile("b_3_5.mif"))
         n_5(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[5*dataWidth+:dataWidth]),
             .outValid(o_valid[5])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(6), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_6.mif"), .biasFile("b_3_6.mif"))
         n_6(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[6*dataWidth+:dataWidth]),
             .outValid(o_valid[6])
            );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(7), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_7.mif"), .biasFile("b_3_7.mif"))
         n_7(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[7*dataWidth+:dataWidth]),
             .outValid(o_valid[7])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(8), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_8.mif"), .biasFile("b_3_8.mif"))
         n_8(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[8*dataWidth+:dataWidth]),
             .outValid(o_valid[8])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(9), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_9.mif"), .biasFile("b_3_9.mif"))
         n_9(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[9*dataWidth+:dataWidth]),
             .outValid(o_valid[9])
            );
            
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(10), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_10.mif"), .biasFile("b_3_10.mif"))
         n_10(
            .clk(clk),
            .rst(rst),
            .myInput(x_in),
            .myInputValid(x_valid),
            .out(x_out[10*dataWidth+:dataWidth]),
            .outValid(o_valid[10])
            );
          
  neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(11), .dataWidth(dataWidth),
           .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
           .weightFile("w_3_11.mif"), .biasFile("b_3_11.mif"))
           n_11(
               .clk(clk),
               .rst(rst),
               .myInput(x_in),
               .myInputValid(x_valid),
               .out(x_out[11*dataWidth+:dataWidth]),
               .outValid(o_valid[11])
               );
    
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(12), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_12.mif"), .biasFile("b_3_12.mif"))
         n_12(
            .clk(clk),
            .rst(rst),
            .myInput(x_in),
            .myInputValid(x_valid),
            .out(x_out[12*dataWidth+:dataWidth]),
            .outValid(o_valid[12])
            );
                                        
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(13), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_13.mif"), .biasFile("b_3_13.mif"))
         n_13(
            .clk(clk),
            .rst(rst),
            .myInput(x_in),
            .myInputValid(x_valid),
            .out(x_out[13*dataWidth+:dataWidth]),
            .outValid(o_valid[13])
            );    

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(14), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_14.mif"), .biasFile("b_3_14.mif"))
         n_14(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[14*dataWidth+:dataWidth]),
             .outValid(o_valid[14])
             );    

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(15), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_15.mif"), .biasFile("b_3_15.mif"))
         n_15(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[15*dataWidth+:dataWidth]),
             .outValid(o_valid[15])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(16), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_16.mif"), .biasFile("b_3_16.mif"))
         n_16(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[16*dataWidth+:dataWidth]),
             .outValid(o_valid[16])
            );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(17), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_17.mif"), .biasFile("b_3_17.mif"))
         n_17(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[17*dataWidth+:dataWidth]),
             .outValid(o_valid[17])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(18), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_18.mif"), .biasFile("b_3_18.mif"))
         n_18(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[18*dataWidth+:dataWidth]),
             .outValid(o_valid[18])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(19), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_3_19.mif"), .biasFile("b_3_19.mif"))
         n_19(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[19*dataWidth+:dataWidth]),
             .outValid(o_valid[19])
            );        

endmodule
