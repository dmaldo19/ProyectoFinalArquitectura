`timescale 1ns/1ns

module Mux1(
	input RegDst,
	input [4:0]Instruccion1, //Data memory
	input [4:0]Instruccion2,

	output reg [4:0]SalidaMux
);

always @*
begin
	case(RegDst)
	1'b1:
		begin
		SalidaMux = Instruccion2;
		end
	1'b0:
		begin
		SalidaMux = Instruccion1;
		end
	endcase
end


endmodule
