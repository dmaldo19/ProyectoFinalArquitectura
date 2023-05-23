`timescale 1ns/1ns

module 	Add(
	input [31:0] Entrada1,
	input [31:0] Entrada2,

	output [31:0] ALUResult
);

	// Conexión de la salida del sumador y la salida de shift al ALUResult
	assign ALUResult = Entrada1 + Entrada2;

endmodule


