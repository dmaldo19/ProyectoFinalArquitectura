`timescale 1ns/1ns

module MemDatos( //Data memory
input [31:0]Dir,
input [31:0]DatoE,
input MemWrite, 
input MemRead, 

output reg [31:0]DatoS
);

reg[31:0] RAM [0:255];

always @*
begin
	if(MemWrite)
	begin
		RAM[Dir] = DatoE;
	end
	if(MemRead)
	begin
		DatoS = RAM[Dir];
	end
end

endmodule