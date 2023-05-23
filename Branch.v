`timescale 1ns/1ns

module Branch(
	input Branch,
	input ZF,

	output SalidaB
);

assign SalidaB = Branch & ZF; 
 
endmodule

