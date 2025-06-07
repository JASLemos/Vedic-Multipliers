`timescale 1ns/100ps

module Multiplier8x8_tb;

  reg [7:0] A;  
  reg [7:0] B;
  wire [15:0] Product;
  
  Multiplier8x8 dut (
    .A(A),
    .B(B),
    .Product(Product)
  );
  
  initial begin
    A = 255; 
    B = 255; 

    #100;
    $finish;
  end

endmodule
