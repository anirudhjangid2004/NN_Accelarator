`timescale 1ns / 1ps

module ReLU #(parameter dataWidth=16, weightIntWidth=4)(
    input clk,
    input [2*dataWidth-1:0] x,
    output reg [dataWidth-1:0] out
    );
    
always@(posedge clk) begin
    if( $signed(x) >= 0) begin
        if(|x[2*dataWidth-1-:weightIntWidth+1]) begin
            out <= {1'b0,{(dataWidth-1){1'b1}}};
            $display("Inside x overflow: relu");
            $display(x);
        end
        else begin 
            out <= x[2*dataWidth-1-weightIntWidth-:dataWidth];
            $display("Inside x normal : relu");
            $display(x);
        end
    end
    
    else begin
        out <= {(dataWidth){1'b0}};
    end
end
    
endmodule
