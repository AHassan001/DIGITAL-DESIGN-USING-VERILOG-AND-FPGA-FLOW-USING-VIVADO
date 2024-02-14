module Sequential_Logic_Element(D, CLK, EN, ALn, ADn, SLn, SD, LAT, Q);
	
	input  D, CLK, EN, ALn, ADn, SLn, SD, LAT;
	output reg Q;

	always @(posedge CLK or negedge ALn) begin
		if(~ALn)
			Q <= !ADn;
		else if(LAT) 
			if(SLn) 
				Q <= D;
			else 
				Q <= SD;
		else begin
			if(EN) begin
				if(SLn) 
					Q <= D;
				else 
					Q <= SD;
			end
		end

	end

endmodule