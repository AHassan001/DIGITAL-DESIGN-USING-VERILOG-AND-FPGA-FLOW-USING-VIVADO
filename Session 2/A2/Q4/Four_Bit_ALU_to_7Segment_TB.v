module Four_Bit_ALU_to_7Segment_TB();

	parameter Width1 = 4;

	reg  EN;
	reg  [Width1-1:0] A, B;
	reg  [1:0]OP_Code;
	wire [6:0]Output;

	Four_Bit_ALU_to_7Segment #(Width1) ALU_7Segment_1 (A, B, OP_Code, EN, Output);

	integer i;

	initial begin
		for(i=0;i<99;i=i+1) begin
			A = $random;
			B = $random;
			EN = $random;
			OP_Code = $random;
			#10;
		end
		$stop;
	end

	initial begin
		$monitor("A=%d, B=%d, OP_Code=%d, EN=%d,Output= %b",A,B,OP_Code,EN,Output);
		$stop;
	end
endmodule 