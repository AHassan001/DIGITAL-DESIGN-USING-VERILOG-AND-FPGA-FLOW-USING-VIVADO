module Q4(A, F);
	input [2:0]A;
	output F;

	assign F = (~A[2] & A[1] & ~A[0]) + (~A[2] & A[1] & A[0]) + (A[2] & ~A[1] & A[0]) + (A[2] & A[1] & A[0]);

endmodule