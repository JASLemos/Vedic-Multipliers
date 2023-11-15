`timescale 1ns/100ps

module Multiplier16x16_tb;

  reg [15:0] A;       // 8-bit input A
  reg [15:0] B;       // 8-bit input B           // Clock signal
  wire [32:0] Product; // 16-bit output Product

  // Instantiate the multiplier8x8 module
  Multiplier16x16 dut (
    .A(A),
    .B(B),
    .Product(Product)
  );
  
  // Apply test inputs
  initial begin
    A = 16'hFFFF;
    B = 16'hFFFF;
    #100;

		
    $finish;
  end

endmodule
