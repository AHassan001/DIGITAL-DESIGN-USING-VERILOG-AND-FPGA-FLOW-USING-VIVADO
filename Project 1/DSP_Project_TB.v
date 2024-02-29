module DSP_Project_TB();

	reg [17:0]A, B, D, BCIN;
	reg [47:0] C, PCIN;
	reg CEA, CEB, CEC, CED, CARRYIN, CLK, CECARRYIN, CEM, CEOPMODE, CEP;
	reg RSTA, RSTB, RSTC, RSTD, RSTCARRYIN, RSTM, RSTOPMODE, RSTP;
	reg [7:0]OPMODE;

	wire [17:0]BCOUT;
	wire [47:0]PCOUT, P;
	wire [35:0]M;
	wire CARRYOUT, CARRYOUTF;

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


   DSP_Project #(A0REG, A1REG, B0REG, B1REG, CREG, DREG, MREG, PREG, CARRYINREG, CARRYOUTREG, OPMODEREG, CARRYINSEL, B_INPUT, RSTTYPE) DSP1 (A, B, C, D, BCIN, PCIN, CARRYIN, CLK, CECARRYIN, CEM, CEOPMODE, CEP, CEA, CEB, CEC, CED, RSTCARRYIN, RSTM, RSTOPMODE, RSTP, RSTA, RSTB, RSTC, RSTD, OPMODE, PCOUT, P, BCOUT, M, CARRYOUT, CARRYOUTF);

   initial begin
   		CLK = 0;
   		forever
   			#10 CLK = ~CLK;
   end

   initial begin

   	CEA = 1; 
   	CEB = 1;
   	CEC = 1;
   	CED = 1;
   	CARRYIN = 1;
   	CECARRYIN = 1;
   	CEM = 1; 
   	CEOPMODE = 1;
   	CEP = 1;

   	RSTA = 1;
   	RSTB = 1;
   	RSTC = 1;
   	RSTD = 1;
   	RSTCARRYIN = 1;
   	RSTM = 1;
   	RSTOPMODE = 1;
   	RSTP  = 1;
	@(negedge CLK);

   	RSTA = 0;
   	RSTB = 0;
   	RSTC = 0;
   	RSTD = 0;
   	RSTCARRYIN = 0;
   	RSTM = 0;
   	RSTOPMODE = 0;
   	RSTP  = 0;
	@(negedge CLK);

	D = 5;
	B = 2;
	C = 20;
	OPMODE[6] = 0; //add
	OPMODE[4] = 1; //choose the output from the pre adder

	A = 2; 

	BCIN = 4;

	PCIN = 55;
	CARRYIN = 0;
	OPMODE[5] = 0;

	OPMODE[3:2] = 3;
	OPMODE[1:0] = 1;

	OPMODE[7] = 0;
	repeat(10) @(negedge CLK);

	D = 9;
	B = 3;
	C = 9;
	OPMODE[6] = 1; //add
	OPMODE[4] = 0; //choose the output from the pre adder

	A = 2; 

	BCIN = 4;

	PCIN = 55;
	CARRYIN = 0;
	OPMODE[5] = 0;

	OPMODE[3:2] = 3;
	OPMODE[1:0] = 0;

	OPMODE[7] = 0;
	repeat (10) @(negedge CLK);
	
	D = 11;
	B = 5;
	C = 9;
	OPMODE[6] = 1; //add
	OPMODE[4] = 1; //choose the output from the pre adder

	A = 2; 

	BCIN = 4;

	PCIN = 55;
	CARRYIN = 0;
	OPMODE[5] = 0;

	OPMODE[3:2] = 0;
	OPMODE[1:0] = 3;

	OPMODE[7] = 0;
	repeat (10) @(negedge CLK);
	

   $stop;
   end
endmodule