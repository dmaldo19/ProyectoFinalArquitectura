`timescale 1ns/1ns

module Mux3(
	input Branch,
	input [31:0] En0,
	input [31:0] En1,
	
	output reg[31:0] Output
);

always @*
begin
	case(Branch)
	1'b0:
		begin
		Output = En0;
		end
	1'b1:
		begin
		Output = En1;
		end
	endcase
end
endmodule
