`timescale 1ns/100ps

module Multiplier4x4_tb();

    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] Product;

    Multiplier4x4 uut (
        .A(A),
        .B(B),
        .Product(Product)
    );
	 
    initial begin
        // Initialize inputs
        A = 4'b1111;  // 15 in binary
        B = 4'b1111;  // 15 in binary
		  
	#100;
	$finish;
		  
    end

endmodule
