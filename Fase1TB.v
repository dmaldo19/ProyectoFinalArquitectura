`timescale 1ns/1ns

module Fase1TB();

reg CLK;

Fase1 Duv(.CLK(CLK));

initial CLK=0;
always #50 CLK =~CLK;

endmodule
