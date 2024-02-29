module D_FF (D, EN, CLK, RST, Q);
	
	parameter width = 18;
	parameter REG_EN = 1;

	input [width-1:0]D;
	input EN, CLK, RST;
	output [width-1:0]Q;

	reg [width-1:0]Q_Reg;

	assign Q = REG_EN ? Q_Reg : D ;

	always @(posedge CLK) begin
		if(RST)
			Q_Reg <= 0;
		else if(EN) begin
			Q_Reg <= D; 
		end
	end

endmodule