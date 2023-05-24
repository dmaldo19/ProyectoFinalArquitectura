`timescale 1ns/1ns

module Fase3SinBuffersTB();

reg CLK;

Fase3SinBuffers Duv(.CLK(CLK));

initial CLK=0;
always #50 CLK =~CLK;

endmodule
