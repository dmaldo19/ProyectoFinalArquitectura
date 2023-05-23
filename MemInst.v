`timescale 1ns/1ns

module MemInst( //Instruction memory
input [31:0]Dir,

output reg [31:0]DatoS
);

reg[7:0] RAM [0:255];

initial
begin
	$readmemb("Mem_Inst.txt",RAM);
end

	always @*
	begin
		DatoS = {RAM[Dir], RAM[Dir+1], RAM[Dir+2], RAM[Dir+3]};
	end

endmodule