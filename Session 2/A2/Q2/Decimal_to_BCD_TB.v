module Decimal_to_BCD_TB();

	reg  [9:0]In;
	wire [3:0]Out;

	Decimal_to_BCD converter1 (In,Out);

initial begin
	In = 10'b0000000001; //0
	#10;
	In = 10'b0000000010; //1
	#10;
	In = 10'b0100000000; //8
	#10;
	In = 10'b0000000000; //0
	#10;
	In = 10'b1000000000; //9
	#10;
	In = 10'b0000100001; //0
	$stop;
end

initial begin
	$monitor("In= %b, Out=%b",In,Out);
end

endmodule