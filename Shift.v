`timescale 1ns/1ns

module Shift(
	input [31:0]DatoEn,

	output [31:0]DatoSa
);

assign DatoSa = DatoEn << 2;

endmodule