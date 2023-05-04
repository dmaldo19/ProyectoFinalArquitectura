`timescale 1ns/1ns

module UC(
	input [5:0]OP,

	output reg MemToReg,
	output reg MemESC,
	output reg MemLeer,
	output reg [1:0]ALUOP,
	output reg RegToWrite
);

always @*
begin
	case(OP)
	6'b000000://R-type
		begin
		MemToReg = 1'b0;
		MemESC = 1'b0;
		MemLeer = 1'b0;
		ALUOP = 2'b10;
		RegToWrite = 1'b1;
		end
	endcase
end

endmodule