module D_Latch_active_L_TB ();

	reg D, G, CLRn;
	wire Q;

	integer i = 0;

	D_Latch_active_L D_Latch (
		.D(D),
		.G(G),
		.CLRn(CLRn),
		.Q(Q)
		);
		
	initial begin
		CLRn = 0;
		G = 1;  //to force check this condition Q <= D
		
		$monitor("Clr=%b, G=%b, D=%d, Q=%b",CLRn,G,D,Q);

		for (i=0;i<100; i=i+1) begin
			D = $random;
			#10;
		end
		
		CLRn = 1;
		for (i=0;i<600; i=i+1) begin
			D = $random;
			#10;
		end

		for (i=0;i<300; i=i+1) begin
			CLRn = $random;
			G = $random;
			D = $random;
			#10;
		end
		$stop;
	end


endmodule