`timescale 1ns/1ns

module BufferInstructionMemory(
	input [31:0]Entrada1,
	input [31:0]Entrada2,
	input CLK,
	
	output reg [31:0]Salida1,
	output reg [31:0]Salida2
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION

always @(posedge CLK)
	begin
		Salida1 = Entrada1;
		Salida2 = Entrada2;
	end

endmodule

module BufferBancoRegistros(
	input [31:0]Entrada1,
	input [31:0]Entrada2,
	input [31:0]Entrada3,
	input [31:0]Entrada4,
	input [31:0]Entrada5,
	input [31:0]Entrada6,
	input CLK,
	
	output reg [31:0]Salida1,
	output reg [31:0]Salida2,
	output reg [31:0]Salida3,
	output reg [31:0]Salida4,
	output reg [31:0]Salida5,
	output reg [31:0]Salida6
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION

always @(posedge CLK)
	begin
		Salida1 = Entrada1;
		Salida2 = Entrada2;
		Salida3 = Entrada3;
		Salida4 = Entrada4;
		Salida5 = Entrada5;
		Salida6 = Entrada6;
	end

endmodule

module BufferALU(
	input [31:0]Entrada1,
	input [31:0]Entrada2,
	input [31:0]Entrada3,
	input [31:0]Entrada4,
	input [31:0]Entrada5,
	input CLK,
	
	output reg [31:0]Salida1,
	output reg [31:0]Salida2,
	output reg [31:0]Salida3,
	output reg [31:0]Salida4,
	output reg [31:0]Salida5
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION

always @(posedge CLK)
	begin
		Salida1 = Entrada1;
		Salida2 = Entrada2;
		Salida3 = Entrada3;
		Salida4 = Entrada4;
		Salida5 = Entrada5;
	end

endmodule

module BufferUltimo(
	input [31:0]Entrada1,
	input [31:0]Entrada2,
	input [31:0]Entrada3,
	input CLK,
	
	output reg [31:0]Salida1,
	output reg [31:0]Salida2,
	output reg [31:0]Salida3
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION

always @(posedge CLK)
	begin
		Salida1 = Entrada1;
		Salida2 = Entrada2;
		Salida3 = Entrada3;
	end

endmodule