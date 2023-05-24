`timescale 1ns/1ns

module BufferInstructionMemory(
	input [31:0]Entrada1,
	input [31:0]Entrada2,
	input CLK,
	
	output reg [31:0]Salida1,
	output reg [31:0]Salida2
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION
initial
begin
	Salida1 = 32'b0;
	Salida2 = 32'b0;

end

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
	input [4:0]Entrada5,
	input [4:0]Entrada6,
	input Entrada7,
	input [2:0]Entrada8,
	input Entrada9,
	input Entrada10,
	input Entrada11,
	input Entrada12,
	input Entrada13,
	input Entrada14,
	input Entrada15,

	input CLK,
	
	output reg [31:0]Salida1,
	output reg [31:0]Salida2,
	output reg [31:0]Salida3,
	output reg [31:0]Salida4,
	output reg [4:0]Salida5,
	output reg [4:0]Salida6,
	output reg Salida7,
	output reg [2:0]Salida8,
	output reg Salida9,
	output reg Salida10,
	output reg Salida11,
	output reg Salida12,
	output reg Salida13,
	output reg Salida14,
	output reg Salida15
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION
initial
begin
	Salida1 = 32'b0;
	Salida2 = 32'b0;
	Salida3 = 32'b0;
	Salida4 = 32'b0;
	Salida5 = 5'b0;
	Salida6 = 5'b0;
	Salida7 = 1'b0;
	Salida8 = 3'b0;
	Salida9 = 1'b0;
	Salida10 = 1'b0;
	Salida11 = 1'b0;
	Salida12 = 1'b0;
	Salida13 = 1'b0;
	Salida14 = 1'b0;
	Salida15 = 1'b0;
end

always @(posedge CLK)
	begin
		Salida1 = Entrada1;
		Salida2 = Entrada2;
		Salida3 = Entrada3;
		Salida4 = Entrada4;
		Salida5 = Entrada5;
		Salida6 = Entrada6;
		Salida7 = Entrada7;
		Salida8 = Entrada8;
		Salida9 = Entrada9;
		Salida10 = Entrada10;
		Salida11 = Entrada11;
		Salida12 = Entrada12;
		Salida13 = Entrada13;
		Salida14 = Entrada14;
		Salida15 = Entrada15;
	end
endmodule

module BufferALU(
	input [31:0]Entrada1,
	input Entrada2,
	input [31:0]Entrada3,
	input [31:0]Entrada4,
	input [4:0]Entrada5,
	input Entrada6,
	input Entrada7,
	input Entrada8,
	input Entrada9,
	input Entrada10,
	input Entrada11,
	input CLK,
	
	output reg [31:0]Salida1,
	output reg Salida2,
	output reg [31:0]Salida3,
	output reg [31:0]Salida4,
	output reg [4:0]Salida5,
	output reg Salida6,
	output reg Salida7,
	output reg Salida8,
	output reg Salida9,
	output reg Salida10,
	output reg Salida11
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION
initial
begin
	Salida1 = 32'b0;
	Salida2 = 1'b0;
	Salida3 = 32'b0;
	Salida4 = 32'b0;
	Salida5 = 5'b0;
	Salida6 = 1'b0;
	Salida7 = 1'b0;
	Salida8 = 1'b0;
	Salida9 = 1'b0;
	Salida10 = 1'b0;
	Salida11 = 1'b0;

end

always @(posedge CLK)
	begin
		Salida1 = Entrada1;
		Salida2 = Entrada2;
		Salida3 = Entrada3;
		Salida4 = Entrada4;
		Salida5 = Entrada5;
		Salida6 = Entrada6;
		Salida7 = Entrada7;
		Salida8 = Entrada8;
		Salida9 = Entrada9;
		Salida10 = Entrada10;
		Salida11 = Entrada11;
	end

endmodule

module BufferUltimo(
	input [31:0]Entrada1,
	input [31:0]Entrada2,
	input [4:0]Entrada3,
	input Entrada4,
	input Entrada5,
	input Entrada6,
	input CLK,
	
	output reg [31:0]Salida1,
	output reg [31:0]Salida2,
	output reg [4:0]Salida3,
	output reg Salida4,
	output reg Salida5,
	output reg Salida6
);

//	    OP	   RS   RT    RD   SHAMT FUNCTION

initial
begin
	Salida1 = 32'b0;
	Salida2 = 32'b0;
	Salida3 = 5'b0;
	Salida4 = 1'b0;
	Salida5 = 1'b0;
	Salida6 = 1'b0;

end

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