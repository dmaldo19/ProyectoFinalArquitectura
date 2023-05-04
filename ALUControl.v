`timescale 1ns/1ns

module ALUControl(
	input [1:0]ALUOP,
	input [5:0]Funcion,

	output reg [3:0]ALU_Control
);

always @*
begin
	case(ALUOP)
	2'b10://R-type
		case(Funcion)
		6'b100000://ADD
			begin
			ALU_Control = 4'b0010;
			end
		6'b100010://SUB
			begin
			ALU_Control = 4'b0110;
			end
		6'b100100://AND
			begin
			ALU_Control = 4'b0000;
			end
		6'b100101://OR
			begin
			ALU_Control = 4'b0001;
			end
		6'b101010://SLT
			begin
			ALU_Control = 4'b0111;
			end
		endcase
	endcase
end

endmodule