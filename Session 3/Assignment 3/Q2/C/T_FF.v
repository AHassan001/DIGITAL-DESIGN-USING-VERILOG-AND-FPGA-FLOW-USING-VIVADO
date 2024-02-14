module T_FF (T, RSTn, CLK, Q, Q_bar);
	input  T, RSTn, CLK;
	output reg Q, Q_bar;

	always @(posedge CLK or negedge RSTn) begin

		if (~RSTn) begin
		 	Q <= 0;
			Q_bar <= 1;
		end
		else if (T)begin
			Q <= ~Q;
			Q_bar <= ~Q_bar;
		end
	end

endmodule