`timescale 1ns/1ns

module Mux(
	input Sel,
	input [31:0]MD,
	input [31:0]ALU,

	output reg [31:0]Salida
);

always @*
begin
	case(Sel)
	1'b1:
		begin
		Salida = MD;
		end
	1'b0:
		begin
		Salida = ALU;
		end
	endcase
end

endmodule