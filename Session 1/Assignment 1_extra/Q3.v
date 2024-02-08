module q3 (A, B, C, F);
	input A, B, C;
	output F;
	wire XOR1_Out, N_XOR2_Out;

	assign   XOR1_Out  =  (A ^ B);
	assign  N_XOR2_Out = ~(B ^ C);

	assign  F = C & N_XOR2_Out & XOR1_Out;

endmodule

// input such that F=1 (A=0, B=1, C=1)