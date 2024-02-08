module Four_Bit_ALU_to_7Segment(A, B, OP_Code, EN, Output);

	parameter Width = 4;

	input      EN;
	input      [Width-1:0] A, B;
	input  	   [1:0]OP_Code;
	output reg [6:0]Output;

	wire [Width-1:0]ALU_Output;

	N_bit_ALU #(Width) ALU2 (A, B, OP_Code, ALU_Output);

	always@(ALU_Output or EN)begin
		if(EN == 1) begin
			case(ALU_Output)
				0 : Output = 7'b1111110;
				1 : Output = 7'b0110000;
				2 : Output = 7'b1101101;
				3 : Output = 7'b1111001;
				4 : Output = 7'b0110011;
				5 : Output = 7'b1011011;
				6 : Output = 7'b1011111;
				7 : Output = 7'b1110000;
				8 : Output = 7'b1111111;
				9 : Output = 7'b1111011;
				10: Output = 7'b1110111;
				11: Output = 7'b0011111;
				12: Output = 7'b1001110;
				13: Output = 7'b0111101;
				14: Output = 7'b1001111;
				15: Output = 7'b1000111;
				default: Output = 0;
			endcase
		end
		else begin
			Output = 0;
		end
	end
endmodule