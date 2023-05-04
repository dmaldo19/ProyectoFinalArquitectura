`timescale 1ns/1ns

module PC(
	input [31:0]Entrada,
	input CLK,
	
	output reg [31:0]Salida
);

initial
	begin 
		Salida = 32'd0;
	end


always @(posedge CLK)
	begin
		Salida = Entrada;
	end

endmodule