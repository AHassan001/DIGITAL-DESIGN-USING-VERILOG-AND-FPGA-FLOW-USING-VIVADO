module Q1 (A, out);
	input [3:0]A;
	output out;

	assign out = (A > 4'b0010) && (A < 4'b1000) ? 1 : 0 ;

endmodule