`timescale 1ns/1ps
`include "include.v" 

module neuron #(parameter layerNo=0, neuronNo=0, numWeight=100, dataWidth=16, sigmoidSize=5,
                weightIntWidth=4, actType="relu", biasFile="sample_bias.mif", weightFile="all_ones.mif")(
    input clk,
    input rst,
    input [dataWidth-1 : 0] myInput,
    input myInputValid,
 
    output [dataWidth-1:0] out,
    output reg outValid
    );
    
    parameter addressWidth = 10;
//  $display("%d", addressWidth);
    
    reg weight_valid;
    reg counter_flag = 1'b0;
    reg sig_valid;
    reg mux_valid_d;
    reg mux_valid_f;
    reg addr=0;
    reg [addressWidth-1:0] r_address = {addressWidth{1'b0}};
    reg mux_valid;
    
    reg [11:0] counter = 12'h000;
    
    wire ren;
    
//    reg  [dataWidth-1:0]    w_in;
    wire [dataWidth-1:0]    w_out;
    reg  [2*dataWidth-1:0]  mul;
    reg  [2*dataWidth-1:0]  sum = {2*dataWidth{1'b0}};
    reg  [dataWidth-1:0]  bias;
    reg  [dataWidth-1:0]  biasReg[0:0];
    
    wire [2*dataWidth:0] comboAdd;
    wire [2*dataWidth:0] biasAdd;
    wire [dataWidth-1 :0] activ_out;
    reg  [dataWidth-1:0] myinputd;
    
    ////////////////////Calculating Sum and bias Addition 
    assign comboAdd  = mul  + sum;
    assign biasAdd   = bias + sum;
    assign ren       = myInputValid;  // Ren helps collecting value from memory
                                      // Input Valid helps in keeping the ren 1
                                      
    assign out = activ_out;
    
    //////////////////// Storing the bias file 
    initial begin
        $readmemb(biasFile, biasReg);
    end
    always@(posedge clk) begin
        bias <= biasReg[0];
    end
    
    /////////////////// Assigning address to access weight memory 
    always@(posedge clk) begin
        if(rst|outValid) begin
            r_address <= 0;
        end
        else if(myInputValid) begin 
            r_address <= r_address + 1;
        end
        else begin
            if((r_address < numWeight + 2) && (r_address == numWeight + 1)) begin
                r_address <= r_address + 1;
            end
            else begin
                r_address <= r_address;
            end
        end
    end
    //////////////////////////////////////////////////////////////////
    
    always@(posedge clk) begin
    
        if(rst|outValid) begin
            counter <= 0;
        end
        
        else if(myInputValid&(~counter_flag)) begin
            counter_flag <= 1'b1;
            counter <= counter + 1;
        end
        
        else if(counter_flag) begin
            counter <= counter + 1;
        end
        
        else counter <= counter;
            
    end
    
    ////////////////// Calculating a Multiplication at every clock edge
    always @(posedge clk) begin
        mul <= $signed(myinputd)*$signed(w_out);
    end
    
    //////////////////////Assignment of sum going to activation function
    always @(posedge clk) begin
         
        if(outValid) begin 
            sum <= 0;
            $display("This means outValid is one");
        end
        
        else if((r_address==numWeight + 2) & mux_valid_f) begin
            
            if(!bias[2*dataWidth-1] & !sum[2*dataWidth-1] & biasAdd[2*dataWidth-1]) begin
                sum[2*dataWidth-1] <= 1'b0;
                sum[2*dataWidth-2:0] <= {2*dataWidth{1'b1}};
            end
            
            else if(bias[2*dataWidth-1] & sum[2*dataWidth-1] & !biasAdd[2*dataWidth-1]) begin
                sum[2*dataWidth-1] <= 1'b1;
                sum[2*dataWidth-2:0] <= {2*dataWidth{1'b0}};
            end
            
            else sum <= biasAdd;
        end
        
        else if(mux_valid) begin
            
            if(!mul[2*dataWidth-1] & !sum[2*dataWidth-1] & comboAdd[2*dataWidth-1]) begin
                sum[2*dataWidth-1] <= 1'b0;
                sum[2*dataWidth-2:0] <= {2*dataWidth{1'b1}};
            end
            
            else if(mul[2*dataWidth-1] & sum[2*dataWidth-1] & !comboAdd[2*dataWidth-1]) begin
                sum[2*dataWidth-1] <= 1'b0;
                sum[2*dataWidth-2:0] <= {2*dataWidth{1'b1}};
            end
            
            else sum <= comboAdd;
       end
   end
   
   //////////////////////////////Signals Definition and allocation, & mux_valid_f    
   always @(posedge clk) begin
       myinputd <= myInput;
       weight_valid <= myInputValid;
       mux_valid <= weight_valid;
//       sig_valid <= (r_address==numWeight) ? 1'b1 : 1'b0;
//       outValid <= sig_valid;
//       mux_valid_f <= !mux_valid & mux_valid_d;
   end
   
   //////////////////////////////////////
   always@(posedge clk) begin
       if (counter == numWeight+3) begin
           outValid  <= 1'b1;
           r_address <= 16'h0000;
//           out       <= activ_out;
           counter   <= 0;
           counter_flag <= 1'b0;
           mux_valid_f<= 1'b0;
           mux_valid_d <= mux_valid;
       end
       
       else if(counter == numWeight+1) begin
           mux_valid_f <= 1'b1;
           mux_valid_d <= 1'b0;
       end
       
       else begin
           outValid <= 1'b0;
//           out  <= 16'h0000;
           mux_valid_d <= mux_valid;
       end
   end
   ////////////////////////////////////////
   
//   always@(posedge clk) begin
//       if(counter_flag) begin
//           counter <= counter + 1;
//       end
//       else begin
//           counter <= counter;
//       end
//   end
   
  ///////////////////////////////Instantiation of memory for weights
  Weight_Memory #(.numWeight(numWeight),.neuronNo(neuronNo),.layerNo(layerNo),
                  .addressWidth(addressWidth),.dataWidth(dataWidth),.weightFile(weightFile)) 
                  WM(
          .clk(clk),
          .ren(ren),
          .radd(r_address),
          .data_out(w_out)
          );
      
      
  ///////////////////////////////Checking for sigmoid type activation function    
  generate
      if(actType == "sigmoid")
      begin:siginst
      //Instantiation of ROM for sigmoid
          Sig_ROM #(.inWidth(sigmoidSize),.dataWidth(dataWidth)) s1(
          .clk(clk),
          .x(sum[2*dataWidth-1-:sigmoidSize]),
          .out(activ_out)
      );
      end
      else
      begin:ReLUinst
          ReLU #(.dataWidth(dataWidth),.weightIntWidth(weightIntWidth)) s1 (
          .clk(clk),
          .x(sum),
          .out(activ_out)
      );
      end    
  endgenerate
 
endmodule

/////////////////////////////////////////////////////////////////////////////