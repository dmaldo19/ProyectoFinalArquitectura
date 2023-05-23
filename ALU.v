`timescale 1ns/1ns

module ALU(
input [31:0]OP1,
input [31:0]OP2,
input [3:0]ALU_Control,

output reg [31:0]Salida,
output reg ZF
);


	always @*
	begin
		case(ALU_Control)
		//R-type
		4'b0010://ADD
			begin
			Salida = OP1 + OP2;
			end
		4'b0110://SUB
			begin
			Salida = OP1 - OP2;
			end
		4'b0000://AND
			begin
			Salida = OP1 & OP2;
			end
		4'b0001://OR
			begin
			Salida = OP1 | OP2;
			end
		4'b0111://SLT
			begin
			Salida = (OP1<OP2)? 1:0;
			end
		4'b1100: //NOR
			begin
			Salida = ~(OP1|OP2);
			end
		default:
			begin
			Salida = 32'b0;
			end
		endcase
		if(Salida == 32'b0)
		begin
			ZF = 1'b1;
		end
		else
		begin
			ZF = 1'b0;
		end

	end
endmodule