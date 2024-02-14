module D_Latch_active_L (D, G, CLRn, Q);

	input D, G, CLRn;
	output reg Q;

	always @(*)begin
		if (~CLRn)
		 	Q <= 0;
		else if(G)
		 	Q <= D; 
	end

endmodule