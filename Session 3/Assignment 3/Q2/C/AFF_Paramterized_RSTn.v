module AFF_Paramterized_RSTn (D, RSTn, CLK, Q, Q_Bar);
	
	parameter Type = "DFF";

	input D, RSTn, CLK;
	output Q, Q_Bar;

	generate 
		if (Type == "DFF" )
			D_FF_A_L D_Flip_Flop (D, RSTn, CLK, Q, Q_Bar);
		else begin
			T_FF Toggle_Flip_Flop (D, RSTn, CLK, Q, Q_Bar);
		end
	endgenerate

endmodule