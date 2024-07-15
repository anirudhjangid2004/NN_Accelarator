`timescale 1ns / 1ps
`include "include.v"

module Layer_1 #(parameter NN=40, numWeight=784, dataWidth=16, layerNum=1,
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
         .weightFile("w_1_0.mif"), .biasFile("b_1_0.mif"))
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
           .weightFile("w_1_1.mif"), .biasFile("b_1_1.mif"))
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
         .weightFile("w_1_2.mif"), .biasFile("b_1_2.mif"))
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
         .weightFile("w_1_3.mif"), .biasFile("b_1_3.mif"))
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
         .weightFile("w_1_4.mif"), .biasFile("b_1_4.mif"))
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
         .weightFile("w_1_5.mif"), .biasFile("b_1_5.mif"))
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
         .weightFile("w_1_6.mif"), .biasFile("b_1_6.mif"))
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
         .weightFile("w_1_7.mif"), .biasFile("b_1_7.mif"))
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
         .weightFile("w_1_8.mif"), .biasFile("b_1_8.mif"))
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
         .weightFile("w_1_9.mif"), .biasFile("b_1_9.mif"))
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
         .weightFile("w_1_10.mif"), .biasFile("b_1_10.mif"))
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
         .weightFile("w_1_11.mif"), .biasFile("b_1_11.mif"))
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
         .weightFile("w_1_12.mif"), .biasFile("b_1_12.mif"))
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
         .weightFile("w_1_13.mif"), .biasFile("b_1_13.mif"))
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
         .weightFile("w_1_14.mif"), .biasFile("b_1_14.mif"))
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
         .weightFile("w_1_15.mif"), .biasFile("b_1_15.mif"))
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
           .weightFile("w_1_16.mif"), .biasFile("b_1_16.mif"))
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
         .weightFile("w_1_17.mif"), .biasFile("b_1_17.mif"))
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
         .weightFile("w_1_18.mif"), .biasFile("b_1_18.mif"))
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
         .weightFile("w_1_19.mif"), .biasFile("b_1_19.mif"))
         n_19(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[19*dataWidth+:dataWidth]),
             .outValid(o_valid[19])
             );    

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(20), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_20.mif"), .biasFile("b_1_20.mif"))
         n_20(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[20*dataWidth+:dataWidth]),
             .outValid(o_valid[20])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(21), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_21.mif"), .biasFile("b_1_21.mif"))
         n_21(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[21*dataWidth+:dataWidth]),
             .outValid(o_valid[21])
            );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(22), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_22.mif"), .biasFile("b_1_22.mif"))
         n_22(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[22*dataWidth+:dataWidth]),
             .outValid(o_valid[22])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(23), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_23.mif"), .biasFile("b_1_23.mif"))
         n_23(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[23*dataWidth+:dataWidth]),
             .outValid(o_valid[23])
             );
            
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(24), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_24.mif"), .biasFile("b_1_24.mif"))
         n_24(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[24*dataWidth+:dataWidth]),
             .outValid(o_valid[24])
            );
                                              
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(25), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_25.mif"), .biasFile("b_1_25.mif"))
         n_25(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[25*dataWidth+:dataWidth]),
             .outValid(o_valid[25])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(26), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_26.mif"), .biasFile("b_1_26.mif"))
         n_26(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[26*dataWidth+:dataWidth]),
             .outValid(o_valid[26])
             );
                         
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(27), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_27.mif"), .biasFile("b_1_27.mif"))
         n_27(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[27*dataWidth+:dataWidth]),
             .outValid(o_valid[27])
             );
            
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(28), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_28.mif"), .biasFile("b_1_28.mif"))
         n_28(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[28*dataWidth+:dataWidth]),
             .outValid(o_valid[28])
             );
            
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(29), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_29.mif"), .biasFile("b_1_29.mif"))
         n_29(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[29*dataWidth+:dataWidth]),
             .outValid(o_valid[29])
            ); 
              
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(30), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_30.mif"), .biasFile("b_1_30.mif"))
         n_30(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[30*dataWidth+:dataWidth]),
             .outValid(o_valid[30])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(31), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_31.mif"), .biasFile("b_1_31.mif"))
         n_31(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[31*dataWidth+:dataWidth]),
             .outValid(o_valid[31])
            );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(32), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_32.mif"), .biasFile("b_1_32.mif"))
         n_32(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[32*dataWidth+:dataWidth]),
             .outValid(o_valid[32])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(33), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_33.mif"), .biasFile("b_1_33.mif"))
         n_33(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[33*dataWidth+:dataWidth]),
             .outValid(o_valid[33])
             );
            
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(34), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_34.mif"), .biasFile("b_1_34.mif"))
         n_34(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[34*dataWidth+:dataWidth]),
             .outValid(o_valid[34])
            );
                                              
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(35), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_35.mif"), .biasFile("b_1_35.mif"))
         n_35(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[35*dataWidth+:dataWidth]),
             .outValid(o_valid[35])
             );

neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(36), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_36.mif"), .biasFile("b_1_36.mif"))
         n_36(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[36*dataWidth+:dataWidth]),
             .outValid(o_valid[36])
             );
                         
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(37), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_37.mif"), .biasFile("b_1_37.mif"))
         n_37(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[37*dataWidth+:dataWidth]),
             .outValid(o_valid[37])
             );
            
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(38), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_38.mif"), .biasFile("b_1_38.mif"))
         n_38(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[38*dataWidth+:dataWidth]),
             .outValid(o_valid[38])
             );
            
neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(39), .dataWidth(dataWidth),
         .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWidth), .actType(actType),
         .weightFile("w_1_39.mif"), .biasFile("b_1_39.mif"))
         n_39(
             .clk(clk),
             .rst(rst),
             .myInput(x_in),
             .myInputValid(x_valid),
             .out(x_out[39*dataWidth+:dataWidth]),
             .outValid(o_valid[39])
            );          

endmodule
