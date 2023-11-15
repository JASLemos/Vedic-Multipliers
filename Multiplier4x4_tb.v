`timescale 1ns/100ps

module Multiplier4x4_tb();

    reg [3:0] A;
    reg [3:0] B;
	reg clk;
    wire [7:0] Product;

    Multiplier4x4 uut (
        .A(A),
        .B(B),
		.clk(clk),
        .Product(Product)
    );
	 
	 always #5 clk = ~clk;
	 
    initial begin
        // Initialize inputs
		clk = 0;
        A = 4'b1111;  // 15 in binary
        B = 4'b1111;  // 15 in binary
		  
		#100;
		$finish;
		  
    end

endmodule
