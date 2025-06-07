module Multiplier8x8#(parameter N = 8)(
   input [N-1:0] A, B,
   output reg [N*2-1:0] Product
);

    wire [N-1:0] m1, m2, m3, m4, m5, m6,m7;
    wire Carry, Cout;

    Multiplier4x4 mul1(.A(A[N/2-1:0]), .B(B[N/2-1:0]), .clk(clk), .Product(m1));
    Multiplier4x4 mul2(.A(A[N-1:N/2]), .B(B[N/2-1:0]), .clk(clk), .Product(m2));
    Multiplier4x4 mul3(.A(A[N/2-1:0]), .B(B[N-1:N/2]), .clk(clk), .Product(m3));
    Multiplier4x4 mul4(.A(A[N-1:N/2]), .B(B[N-1:N/2]), .clk(clk), .Product(m4));

    EightBitAdder add1(.A(m2), .B(m3), .Cin(1'b0), .Sum(m5), .Cout(Carry));
    EightBitAdder add2(.A({4'b0000,m1[N-1:N/2]}), .B(m5), .Cin(1'b0), .Sum(m6), .Cout(Cout));
    EightBitAdder add3(.A({3'b000,Carry,m6[N-1:N/2]}), .B(m4), .Cin(1'b0), .Sum(m7), .Cout(Cout));
	 
    assign Product = {m7,m6[N/2-1:0],m1[N/2-1:0]};

endmodule
