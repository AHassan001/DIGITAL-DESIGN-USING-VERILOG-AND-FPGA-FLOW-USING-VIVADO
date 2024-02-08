module Compartor(A, B, C, D, E);
	input [3:0] A, B;
	output C, D, E;

	assign C = (a >  b) ? 1'b1 : 1'b0;
	assign D = (a == b) ? 1'b1 : 1'b0;
	assign E = (a <  b) ? 1'b1 : 1'b0;

endmodule
