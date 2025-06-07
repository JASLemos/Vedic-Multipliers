module Multiplier4x4#(parameter N = 4)(
    input [N-1:0] A, B,
    output reg [N*2-1:0] Product
);

    wire [N-1:0] m1, m2, m3, m4, m5, m6, m7;
    wire Carry, Cout;

    Multiplier2x2 mul1(.A(A[N/2-1:0]), .B(B[N/2-1:0]), .Produto(m1));
    Multiplier2x2 mul2(.A(A[N-1:N/2]), .B(B[N/2-1:0]), .Produto(m2));
    Multiplier2x2 mul3(.A(A[N/2-1:0]), .B(B[N-1:N/2]), .Produto(m3));
    Multiplier2x2 mul4(.A(A[N-1:N/2]), .B(B[N-1:N/2]), .Produto(m4));

    FourBitAdder add1(.A(m2), .B(m3), .Cin(1'b0), .Sum(m5), .Cout(Carry));
    FourBitAdder add2(.A({2'b00,m1[N-1:N/2]}), .B(m5), .Cin(1'b0), .Sum(m6), .Cout(Cout));
    FourBitAdder add3(.A({1'b0,Carry,m6[N-1:N/2]}), .B(m4), .Cin(1'b0), .Sum(m7), .Cout(Cout));
	 
    assign Product = {m7,m6[N/2-1:0],m1[N/2-1:0]};

endmodule
