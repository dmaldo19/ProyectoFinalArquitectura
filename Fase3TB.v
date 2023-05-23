`timescale 1ns/1ns

module Fase3TB();

reg CLK;

Fase2 Duv(.CLK(CLK));

initial CLK=0;
always #50 CLK =~CLK;

endmodule
