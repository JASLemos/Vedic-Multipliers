module Multiplier32x32#(parameter N = 32)(
    input [N-1:0] A, B,
    output reg [N*2-1:0] Product
);

    wire [N-1:0] m1, m2, m3, m4, m5, m6,m7;
    wire Carry, Cout;

    Multiplier16x16 mul1(.A(A[N/2-1:0]), .B(B[N/2-1:0]), .Product(m1));
    Multiplier16x16 mul2(.A(A[N-1:N/2]), .B(B[N/2-1:0]), .Product(m2));
    Multiplier16x16 mul3(.A(A[N/2-1:0]), .B(B[N-1:N/2]), .Product(m3));
    Multiplier16x16 mul4(.A(A[N-1:N/2]), .B(B[N-1:N/2]), .Product(m4));

    ThirtyTwoBitAdder add1(.A(m2), .B(m3), .Cin(1'b0), .Sum(m5), .Cout(Carry));
    ThirtyTwoBitAdder add2(.A({16'b00000000,m1[N-1:N/2]}), .B(m5), .Cin(1'b0), .Sum(m6), .Cout(Cout));
    ThirtyTwoBitAdder add3(.A({15'b0000000,Carry,m6[N-1:N/2]}), .B(m4), .Cin(1'b0), .Sum(m7), .Cout(Cout));
	 
    assign Product = {m7,m6[N/2-1:0],m1[N/2-1:0]};

endmodule
