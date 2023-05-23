`timescale 1ns/1ns

module Sumador(
	input [31:0]Entrada,

	output [31:0]Salida
);

assign Salida = Entrada + 32'd4;

endmodule