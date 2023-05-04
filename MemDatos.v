`timescale 1ns/1ns

module MemDatos(
input [31:0]Dir,
input [31:0]DatoE,
input ESC,
input Leer,

output reg [31:0]DatoS
);

reg[7:0] RAM [0:255];

initial
begin
	$readmemb("RAM.txt",RAM);
end


	always @*
	begin
		if(ESC)
		begin
			RAM[Dir] = DatoE[31:24];
			RAM[Dir+1] = DatoE[23:16];
			RAM[Dir+2] = DatoE[15:8];
			RAM[Dir+3] = DatoE[7:0];
		end
		if(Leer)
		begin
			DatoS = {RAM[Dir], RAM[Dir+1], RAM[Dir+2], RAM[Dir+3]};
		end
	end

endmodule