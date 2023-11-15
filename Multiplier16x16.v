module Multiplier16x16#(parameter N = 16)(input [N-1:0] A, B,
							input clk,
                     output reg [N*2-1:0] Product);

    wire [N-1:0] m1, m2, m3, m4, m5, m6,m7;
    wire Carry, Cout;
	 reg [N-1:0] A_reg, B_reg;

    Multiplier8x8 mul1(.A(A[N/2-1:0]), .clk(clk), .B(B[N/2-1:0]), .Product(m1));
    Multiplier8x8 mul2(.A(A[N-1:N/2]), .clk(clk), .B(B[N/2-1:0]), .Product(m2));
    Multiplier8x8 mul3(.A(A[N/2-1:0]), .clk(clk), .B(B[N-1:N/2]), .Product(m3));
    Multiplier8x8 mul4(.A(A[N-1:N/2]), .clk(clk), .B(B[N-1:N/2]), .Product(m4));

    SixteenBitAdder add1(.A(m2), .B(m3), .Cin(1'b0), .Sum(m5), .Cout(Carry));
    SixteenBitAdder add2(.A({8'b00000000,m1[N-1:N/2]}), .B(m5), .Cin(1'b0), .Sum(m6), .Cout(Cout));
    SixteenBitAdder add3(.A({7'b0000000,Carry,m6[N-1:N/2]}), .B(m4), .Cin(1'b0), .Sum(m7), .Cout(Cout));
	 
	 always@(posedge clk)
	 begin
			A_reg <= A;
			B_reg <= B;
			Product = {m7,m6[N/2-1:0],m1[N/2-1:0]};
	end

endmodule
