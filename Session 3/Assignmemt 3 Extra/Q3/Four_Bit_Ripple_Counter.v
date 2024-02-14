module Four_Bit_Ripple_Counter(CLK, RSTn, Out);
	input CLK, RSTn;
	output [3:0]Out;

	wire qn0, qn1, qn2, qn3;
	wire q0, q1, q2, q3;

	 D_FF_A_L D1 (
	 	.D(qn0),
	 	.RSTn(RSTn),
	 	.CLK(CLK),
	 	.Q(q0),
	 	.Qbar(qn0)
	 );

	 D_FF_A_L D2 (
	 	.D(qn1),
	 	.RSTn(RSTn),
	 	.CLK(q0),
	 	.Q(q1),
	 	.Qbar(qn1)
	 );

	 D_FF_A_L D3 (
	 	.D(qn2),
	 	.RSTn(RSTn),
	 	.CLK(q1),
	 	.Q(q2),
	 	.Qbar(qn2)
	 );
	 D_FF_A_L D4 (
	 	.D(qn3),
	 	.RSTn(RSTn),
	 	.CLK(q2),
	 	.Q(q3),
	 	.Qbar(qn3)
	 );

	 assign Out = {qn3, qn2, qn1, qn0}; 

endmodule