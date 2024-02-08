module q4(A, out_with_parity);

	input [7:0] A;
	output [8:0] out_with_parity;

	assign out_with_parity = {A , ^A} ;  //even parity
//	assign out_with_parity = {A , ~^A} ; //odd parity

endmodule