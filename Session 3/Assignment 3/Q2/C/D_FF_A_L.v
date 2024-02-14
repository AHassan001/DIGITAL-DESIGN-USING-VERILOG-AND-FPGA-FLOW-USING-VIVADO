module D_FF_A_L (D, RSTn, CLK, Q, Qbar);
	input  D, RSTn, CLK;
	output reg Q;
	output Qbar;

	assign Qbar = ~Q;

	always@(posedge CLK or negedge RSTn) begin
		if(~RSTn) begin
			Q <= 0;
		end
		else 
			Q <= D;
	end


endmodule
