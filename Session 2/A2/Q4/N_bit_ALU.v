module N_bit_ALU (A, B, OP_Code, Result);
	
	parameter NO_of_bits = 4;
	
	input  [NO_of_bits-1:0] A, B;
	input  [1:0] OP_Code;
	output [NO_of_bits-1:0] Result;

	assign Result = (OP_Code == 0) ? (A + B) : (OP_Code == 1) ? (A | B) : (OP_Code == 2) ? (A - B) :  (A ^ B);

endmodule
