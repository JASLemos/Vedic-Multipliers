module Multiplier2x2(
  input [1:0] A,
  input [1:0] B,
  output [3:0] Produto
);


  wire w1, w2, w3, C0;
  wire S0, S1, S2, Cout;
  assign S0 = A[0] & B[0];
  assign w1 = A[1] & B[0];
  assign w2 = A[0] & B[1];
  assign	w3 = A[1] & B[1];
	
  assign Produto = {Cout, S2, S1, S0};
  
  HalfAdder FA1(.A(w1), .B(w2), .Cout(C0), .Sum(S1));
  HalfAdder FA2(.A(w3), .B(C0), .Cout(Cout), .Sum(S2));
  
endmodule