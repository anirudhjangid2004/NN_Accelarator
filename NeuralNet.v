`timescale 1ns / 1ps
`include "include.v"

module NeuralNet #(parameter dataWidth = 16, NN_lyr1 = 40, NN_lyr2 = 30,
                             NN_lyr3 = 20, NN_lyr4 = 10)
    //Will take input of the pixels of the image one by one
    //Each pixel will be reported in 16 bits format,
    //The pixels are stored in a file, from that we can
    //give one image at a time.
    (
        input [dataWidth-1:0] inWord,
        input clk,
        input rst,
        //output [9:0] PredictedNum         //One hot Encoding
        output [NN_lyr4*dataWidth-1 : 0] layer_4_out,
        output [NN_lyr4 - 1:0] layer_4_valid
    );
    
    reg [NN_lyr1*dataWidth - 1 : 0] Buff_12 = {NN_lyr1*dataWidth{1'b0}};
    reg [NN_lyr2*dataWidth - 1 : 0] Buff_23 = {NN_lyr2*dataWidth{1'b0}};
    reg [NN_lyr3*dataWidth - 1 : 0] Buff_34 = {NN_lyr3*dataWidth{1'b0}};
    
    reg [NN_lyr2 - 1:0] ValidBit_2 = {NN_lyr2{1'b0}};
    reg [NN_lyr3 - 1:0] ValidBit_3 = {NN_lyr3{1'b0}};
    reg [NN_lyr4 - 1:0] ValidBit_4 = {NN_lyr4{1'b0}};
    
    wire [NN_lyr1-1:0] layer_1_valid;
    wire [NN_lyr1*dataWidth-1 : 0] layer_1_out;
    
    wire [NN_lyr2-1:0] layer_2_valid;
    wire [NN_lyr2*dataWidth-1 : 0] layer_2_out;
    
    wire [NN_lyr3-1:0] layer_3_valid;
    wire [NN_lyr3*dataWidth-1 : 0] layer_3_out;
    
    wire [NN_lyr4-1:0] layer_4_valid;
    wire [NN_lyr4*dataWidth-1 : 0] layer_4_out;
    
    wire [dataWidth-1:0] buff12_out;
    wire [dataWidth-1:0] buff23_out;
    wire [dataWidth-1:0] buff34_out;
    
    integer counterVld2 = 0;
    integer counterVld3 = 0;
    integer counterVld4 = 0;
    
    assign buff12_out = Buff_12[dataWidth-1:0];
    assign buff23_out = Buff_23[dataWidth-1:0];
    assign buff34_out = Buff_34[dataWidth-1:0];
    
    //Input Buffer
    
    //Instantitation of Layer 1
    Layer_1 lyr1(.clk(clk), .rst(rst), .x_valid(1'b1), .x_in(inWord), 
                 .x_out(layer_1_out), .o_valid(layer_1_valid));
                 
    // Buffer bw layer 1 and layer 2
    always@(posedge clk) begin
        if(&layer_1_valid) begin
            Buff_12 <= layer_1_out;
            counterVld2 = NN_lyr1;
            ValidBit_2 <= {NN_lyr2{1'b1}};
        end
        else if(counterVld2 > 0) begin
            Buff_12 <= Buff_12 >> 16;
            counterVld2 = counterVld2 - 1;
            ValidBit_2 <= {NN_lyr2{1'b1}};
        end
        else begin
            Buff_12    <= Buff_12;
            ValidBit_2 <= {NN_lyr2{1'b0}};
        end
        
//        if(counterVld2 != 0) begin
//            ValidBit_2 <= {NN_lyr2{1'b1}};
//        end
//        else begin
//            ValidBit_2 <= {NN_lyr2{1'b0}};
//        end
    end
    
//    Layer_2 lyr2(.clk(clk), .rst(rst), .x_valid(&layer_1_valid), .x_in(buff12_out), 
//                 .x_out(layer_2_out), .o_valid(layer_2_valid));
    
    Layer_2 lyr2(.clk(clk), .rst(rst), .x_valid(&ValidBit_2), .x_in(buff12_out), 
                 .x_out(layer_2_out), .o_valid(layer_2_valid));
    
    
    // Buffer bw layer 2 and layer 3             
    always@(posedge clk) begin
        if(&layer_2_valid) begin
            Buff_23 <= layer_2_out;
            counterVld3 <= NN_lyr2;
            ValidBit_3 <= {NN_lyr3{1'b1}};
        end
        else if (counterVld3 > 0) begin
            Buff_23 <= Buff_23 >> 16;
            counterVld3 <= counterVld3 - 1;
            ValidBit_3 <= {NN_lyr3{1'b1}};
        end
        else begin
            Buff_23    <= Buff_23;
            ValidBit_3 <= {NN_lyr3{1'b0}};
        end
        
//        if(counterVld3 != 0) begin
//            ValidBit_3 <= {NN_lyr3{1'b1}};
//        end
//        else begin
//            ValidBit_3 <= {NN_lyr3{1'b0}};
//        end
    end
    
    Layer_3 lyr3(.clk(clk), .rst(rst), .x_valid(&ValidBit_3), .x_in(buff23_out),
                 .x_out(layer_3_out), .o_valid(layer_3_valid));
    
    // Buffer bw Layer 3 and layer 4             
    always@(posedge clk) begin
//        if(&layer_3_valid) begin
//            Buff_34 <= layer_3_out;
//        end
//        else begin
//            Buff_34 <= Buff_34 >> 16;
//        end
        if(&layer_3_valid) begin
            Buff_34 <= layer_3_out;
            counterVld4 <= NN_lyr3;
            ValidBit_4 <= {NN_lyr4{1'b1}};
        end
        else if (counterVld4 > 0) begin
            Buff_34 <= Buff_34 >> 16;
            counterVld4 <= counterVld4 - 1;
            ValidBit_4 <= {NN_lyr4{1'b1}};
        end
        else begin
            Buff_34    <= Buff_34;
            ValidBit_4 <= {NN_lyr4{1'b0}};
        end
    end
    
    Layer_4 lyr4(.clk(clk), .rst(rst), .x_valid(&ValidBit_4), .x_in(buff34_out),
                 .x_out(layer_4_out), .o_valid(layer_4_valid));
    
endmodule
