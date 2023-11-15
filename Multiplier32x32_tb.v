`timescale 1ns/100ps

module Multiplier32x32_tb();

    reg [31:0] A;
    reg [31:0] B;
	 reg clk;
    wire [63:0] Product;

    Multiplier32x32 uut (
        .A(A),
        .B(B),
		  .clk(clk),
        .Product(Product)
    );
	 
	 always #5 clk = ~clk;
	 
    initial begin
	 
		  clk = 0;
        A = 32'hFFFFFFFF;
        B = 32'hFFFFFFFF;
		  
		  #100;
		  $finish;
		  
    end

endmodule
