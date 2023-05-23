`timescale 1ns/1ns

module SignExtend(
input [15:0]Instruccion,

output [31:0]DatoSal
);

assign DatoSal = {{16{Instruccion[15]}}, Instruccion};

endmodule


