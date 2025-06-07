`timescale 1ns/100ps

module Multiplier32x32_tb();

    reg [31:0] A;
    reg [31:0] B;
    wire [63:0] Product;

    Multiplier32x32 uut (
        .A(A),
        .B(B),
        .Product(Product)
    );
	 
    initial begin
	 
        A = 32'hFFFFFFFF;
        B = 32'hFFFFFFFF;
		  
	#100;
	$finish;
		  
    end

endmodule
