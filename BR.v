`timescale 1ns/1ns

module BR(
	input Write,
	input [4:0]RR1,
	input [4:0]RR2,
	input [4:0]WA,
	input [31:0]WD,

	output reg[31:0]DR1,
	output reg[31:0]DR2
);

reg [31:0] Banco_de_Registros [0:31];

initial
begin
	$readmemb("BR.txt",Banco_de_Registros);
end

	always @*
	begin
		if(Write)
		begin
			Banco_de_Registros[WA] = WD;
		end

		DR1 = Banco_de_Registros[RR1];
		DR2 = Banco_de_Registros[RR2];
	end

endmodule