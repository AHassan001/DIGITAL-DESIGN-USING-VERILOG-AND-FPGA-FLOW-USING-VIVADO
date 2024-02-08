module q1(A,B,C,D,E,F,sel,out,out_bar);

	input A,B,C,D,E,F,sel;
	wire g0,g1;
	output out,out_bar;

	assign g0 =  (A & B & C);
	assign g1 = ~(D ^ E ^ F);

	assign out = (sel==0) ? g0 : g1 ;

	assign out_bar = ~out ;

endmodule