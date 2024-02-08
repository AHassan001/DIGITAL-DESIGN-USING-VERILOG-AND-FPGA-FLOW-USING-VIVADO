module Decimal_to_BCD (D,Y);
	input  [9:0]D;
	output reg [3:0]Y;

	always @(D) begin
		case (D)
		10'b0000000001: Y = 0; 
		10'b0000000010: Y = 1; 
		10'b0000000100: Y = 2; 
		10'b0000001000: Y = 3; 
		10'b0000010000: Y = 4; 
		10'b0000100000: Y = 5; 
		10'b0001000000: Y = 6; 
		10'b0010000000: Y = 7; 
		10'b0100000000: Y = 8; 
		10'b1000000000: Y = 9; 
		default: Y = 4'b0000;
		endcase
	end
endmodule