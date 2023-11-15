module Multiplier2x2_tb;

    reg [1:0] A, B;
    wire [3:0] Produto;

    Multiplier2x2 DUT(.A(A), .B(B), .Produto(Produto));

    initial begin
         
        A = 2'b11
        B = 2'b11;

        #50 $finish;
    end