`timescale 1ns/1ns

module Mux(
	input MemToReg,
	input [31:0]MD, //Read data DatoS
	input [31:0]ALU, //ALU Salida

	output reg [31:0]Salida 
);

always @*
begin
	case(MemToReg)
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