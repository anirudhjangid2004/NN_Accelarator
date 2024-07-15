`timescale 1ns / 1ps

// The inwidth here is telling the memory depth 
// From Neuron we are taking only the initial most 
// signinficant inWidth no. of bits and since we 
// can represent 2^inWidth no. of positions, 
// accordingly the memory depth is defined. Now 
// in the input x since the initial  1 bit tells
// the sign, if it is +ve we add 1 at msb to access
// the positions after the middle number and if it
// is -ve we remove the 1 present at MSB to access
// the initial positions.

module Sig_ROM #(parameter inWidth=10, dataWidth=16)(
    input clk,
    input [inWidth-1:0] x,
    output [dataWidth-1:0] out
    );
    
    //Creating memory blocks
    reg [dataWidth-1:0] mem [2**inWidth-1:0];
    reg [inWidth-1:0] y;
    
    initial begin
        $readmemb("sigContent.mif", mem);
    end
    
    // Calculating memory address and assigning to y register
    always@(posedge clk) begin
        if($signed(x) >= 0) y <= x + (2**(inWidth-1));
        else y <= x - (2**(inWidth-1));
    end
    
    assign out = mem[y];
    
endmodule
