module DSP_Project (A, B, C, D, BCIN, PCIN, CARRYIN, CLK, CECARRYIN, CEM, CEOPMODE, CEP, CEA, CEB, CEC, CED, RSTCARRYIN, RSTM, RSTOPMODE, RSTP, RSTA, RSTB, RSTC, RSTD, OPMODE, PCOUT, P, BCOUT, M, CARRYOUT, CARRYOUTF);
	input [17:0]A, B, D, BCIN;
	input [47:0] C, PCIN;
	input CEA, CEB, CEC, CED, CARRYIN, CLK, CECARRYIN, CEM, CEOPMODE, CEP;
	input RSTA, RSTB, RSTC, RSTD, RSTCARRYIN, RSTM, RSTOPMODE, RSTP;
	input [7:0]OPMODE;

	output [17:0]BCOUT;
	output [47:0]PCOUT, P;
	output [35:0]M;
	output CARRYOUT, CARRYOUTF;

	wire [35:0]M_out, Mult_out, Mnot;
	wire CYI_out;
	wire [7:0]OPMODE_wire; 
	wire [17:0]D_out, A0_Out, B0_Out, B1_out, A1_out;
	wire [47:0]C_out;

	reg [17:0]Pre_Adder;
	reg [47:0]X_out, Z_out, Post_Adder; 
	reg CYO_IN, CYI_input;				
	reg [17:0]BREG_in, B1_input;	

	parameter A0REG = 0,
			  A1REG = 1,
			  B0REG = 0,
			  B1REG = 1,
			  CREG = 1,
			  DREG = 1,
			  MREG = 1,
			  PREG = 1, 
			  CARRYINREG = 1, 
			  CARRYOUTREG = 1, 
			  OPMODEREG = 1,
			  CARRYINSEL = 1, //default is OPMODE_wire[5] which in code optained by making CARRYINSEL = 1
			  B_INPUT = "DIRECT", //CASCADE
			  RSTTYPE = "SYNC";
	//D_REG
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(18),.REG_EN(DREG)) DREG_FF_SYNC ( .D(D), .EN(CED), .CLK(CLK), .RST(RSTD), .Q(D_out) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(18),.REG_EN(DREG)) DREG_FF_ASYNC ( .D(D), .EN(CED), .CLK(CLK), .RST(RSTD), .Q(D_out) );
	endgenerate

	//B input
	always@(*) begin
		if (B_INPUT == "DIRECT") 
			BREG_in = B;
		else if(CARRYINSEL == "CASCADE")
			BREG_in = BCIN;
		else
			BREG_in = 0;
	end

	//B0 REG
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(18),.REG_EN(B0REG)) B0REG_FF_SYNC ( .D(BREG_in), .EN(CEB), .CLK(CLK), .RST(RSTB), .Q(B0_Out) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(18),.REG_EN(B0REG)) B0REG_FF_ASYNC ( .D(BREG_in), .EN(CEB), .CLK(CLK), .RST(RSTB), .Q(B0_Out) );
	endgenerate

	//A0 REG
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(18),.REG_EN(A0REG)) A0REG_FF_SYNC ( .D(A), .EN(CEA), .CLK(CLK), .RST(RSTA), .Q(A0_Out) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(18),.REG_EN(A0REG)) A0REG_FF_ASYNC ( .D(A), .EN(CEA), .CLK(CLK), .RST(RSTA), .Q(A0_Out) );
	endgenerate

	//C REG
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(48),.REG_EN(CREG)) CREG_FF_SYNC ( .D(C), .EN(CEC), .CLK(CLK), .RST(RSTC), .Q(C_out) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(48),.REG_EN(CREG)) CREG_FF_ASYNC ( .D(C), .EN(CEC), .CLK(CLK), .RST(RSTC), .Q(C_out) );
	endgenerate

	// PRE-Adder
	always @(*) begin
		if (OPMODE_wire[6] == 0) //Adder 
			Pre_Adder = B0_Out + D_out;
		else // SUB
			Pre_Adder = D_out - B0_Out;
	end 

	//B1 input
	always @(*) begin
		if (OPMODE_wire[4] == 0) 
			B1_input = B0_Out;
		else 
			B1_input = Pre_Adder;
	end 

	//B1 REG 
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(18),.REG_EN(B1REG)) B1REG_FF_SYNC ( .D(B1_input), .EN(CEB), .CLK(CLK), .RST(RSTB), .Q(B1_out) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(18),.REG_EN(B1REG)) B1REG_FF_ASYNC ( .D(B1_input), .EN(CEB), .CLK(CLK), .RST(RSTB), .Q(B1_out) );
	endgenerate

	//BCOUT
	assign BCOUT = B1_out;

	//A1 REG
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(18),.REG_EN(A1REG)) A1REG_FF_SYNC ( .D(A0_Out), .EN(CEA), .CLK(CLK), .RST(RSTA), .Q(A1_out) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(18),.REG_EN(A1REG)) A1REG_FF_ASYNC ( .D(A0_Out), .EN(CEA), .CLK(CLK), .RST(RSTA), .Q(A1_out) );
	endgenerate

	//multi.
	assign Mult_out = B1_out * A1_out;

	//M REG
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(36),.REG_EN(MREG)) MREG_FF_SYNC ( .D(Mult_out), .EN(CEM), .CLK(CLK), .RST(RSTM), .Q(M_out) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(36),.REG_EN(MREG)) MREG_FF_ASYNC ( .D(Mult_out), .EN(CEM), .CLK(CLK), .RST(RSTM), .Q(M_out) );
	endgenerate

	// M
	assign Mnot = ~M_out;
	assign M = ~Mnot;

	// CYI input 
	always@(*) begin
		if (CARRYINSEL == 0)
			CYI_input = CARRYIN;
		else if(CARRYINSEL == 1)
			CYI_input = OPMODE_wire[5];
		else
			CYI_input = 0;
	end

	// CYI REG
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(1),.REG_EN(CARRYINREG)) CYI_SYNC ( .D(CYI_input), .EN(CECARRYIN), .CLK(CLK), .RST(RSTCARRYIN), .Q(CYI_out) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(1),.REG_EN(CARRYINREG)) CYI_ASYNC ( .D(CYI_input), .EN(CECARRYIN), .CLK(CLK), .RST(RSTCARRYIN), .Q(CYI_out) );
	endgenerate

	// X_MUX
	always @(*) begin
		case(OPMODE_wire[1:0])
		2'b00: X_out = 0;
		2'b01: X_out = M_out;
		2'b10: X_out = PCOUT;
		2'b11: X_out = {D_out[11:0],A1_out,B1_out};
		default : X_out = 0;
		endcase
	end

	// Z_MUX
	always @(*) begin
		case(OPMODE_wire[3:2])
		2'b00: Z_out = 0;
		2'b01: Z_out = PCIN;
		2'b10: Z_out = PCOUT;
		2'b11: Z_out = C_out;
		default : Z_out = 0;
		endcase
	end

	// Post-Adder
	always @(*) begin
		if (OPMODE_wire[7] == 0) //Adder 
			{CYO_IN,Post_Adder} = Z_out +  X_out  + CYI_out;
		else // SUB
			{CYO_IN,Post_Adder} = Z_out - (X_out  + CYI_out);
	end 

	//P_REG
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(48),.REG_EN(PREG)) PREG_SYNC ( .D(Post_Adder), .EN(CEP), .CLK(CLK), .RST(RSTP), .Q(P) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(48),.REG_EN(PREG)) PREG_ASYNC ( .D(Post_Adder), .EN(CEP), .CLK(CLK), .RST(RSTP), .Q(P) );
	endgenerate

	//PCOUT
	assign PCOUT = P;

	//Carry out
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(1),.REG_EN(CARRYINREG)) PREG_SYNC ( .D(CYO_IN), .EN(CECARRYIN), .CLK(CLK), .RST(RSTCARRYIN), .Q(CARRYOUT) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(1),.REG_EN(CARRYINREG)) PREG_ASYNC ( .D(CYO_IN), .EN(CECARRYIN), .CLK(CLK), .RST(RSTCARRYIN), .Q(CARRYOUT) );
	endgenerate

	//Carry out
	assign CARRYOUTF = CARRYOUT;

	//OPMODE
	generate 
		if (RSTTYPE == "SYNC")  // SYNC
			 D_FF #(.width(8),.REG_EN(OPMODEREG)) OPMODE_SYNC ( .D(OPMODE), .EN(CEOPMODE), .CLK(CLK), .RST(RSTOPMODE), .Q(OPMODE_wire) );		
		else   // ASYNC
			D_FF_ASYNC #(.width(8),.REG_EN(OPMODEREG)) OPMODE_ASYNC ( .D(OPMODE), .EN(CEOPMODE), .CLK(CLK), .RST(RSTOPMODE), .Q(OPMODE_wire) );
	endgenerate	

endmodule