module four_Bit_counter_Beh_extra_2_outputs (clk, set, out, Div_2, Div_4);
	input  clk, set;
	output reg [3:0] out;
	output Div_2, Div_4;
	//out  = 0011
	//Div2 = 1
	//Div4 = 0

	assign Div_2 = out[1];
	assign Div_4 = out[3];

	always @(posedge clk) begin
		if(set)
			out <= ~0;
		else begin
			out <= out + 1;
		end
	end

endmodule