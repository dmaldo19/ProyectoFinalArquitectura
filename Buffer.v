`timescale 1ns/1ns

module Buffer(
	input [31:0]Entrada,
	input CLK,
	
	output reg [31:0]Salida
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION

always @(posedge CLK)
	begin
		Salida = Entrada;
	end

endmodule