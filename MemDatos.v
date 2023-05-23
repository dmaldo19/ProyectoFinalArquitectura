`timescale 1ns/1ns

module MemDatos( //Data memory
input [31:0]Dir,
input [31:0]DatoE,
input MemWrite, 
input MemRead, 

output reg [31:0]DatoS
);

reg[7:0] RAM [0:255];

always @*
begin
	if(MemWrite)
	begin
		RAM[Dir] = DatoE[31:24];
		RAM[Dir+1] = DatoE[23:16];
		RAM[Dir+2] = DatoE[15:8];
		RAM[Dir+3] = DatoE[7:0];
	end
	if(MemRead)
	begin
		DatoS = {RAM[Dir], RAM[Dir+1], RAM[Dir+2], RAM[Dir+3]};
	end
end

endmodule