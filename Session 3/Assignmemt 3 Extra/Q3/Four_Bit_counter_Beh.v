module four_Bit_counter_Beh (clk, set, out);
	input  clk, set;
	output reg [3:0] out;

	always @(posedge clk) begin
		if(set)
			out <= ~0;
		else begin
			out <= out + 1;
		end
	end

endmodule