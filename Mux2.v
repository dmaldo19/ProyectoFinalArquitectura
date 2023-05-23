`timescale 1ns/1ns

module Mux2(
	input ALUSrc,
	input [31:0]DR2, //Data memory
	input [31:0]DatoSal, //Sign-extend

	output reg [31:0]OP2
);

always @*
begin
	case(ALUSrc)
	1'b1:
		begin
		OP2 = DatoSal;
		end
	1'b0:
		begin
		OP2 = DR2;
		end
	endcase
end

endmodule
