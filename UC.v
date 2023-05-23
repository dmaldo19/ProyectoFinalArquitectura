`timescale 1ns/1ns

module UC(
	input [5:0]OP,

	output reg RegDst,
	output reg Branch,
	output reg MemRead,
	output reg MemToReg,
	output reg [2:0]ALUOP,
	output reg MemWrite,
	output reg ALUSrc,
	output reg J,
	output reg RegWrite
);

always @*
begin
	case(OP)
	6'b000000://R-type
		begin
		RegDst = 1'b1;
		Branch = 1'b0;
		MemRead = 1'b0; 
		MemToReg = 1'b0;
		ALUOP = 3'b100;
		MemWrite = 1'b0; 
		ALUSrc = 1'b0;
		RegWrite = 1'b1;
		J = 1'b0;
		end
	6'b001000: // I-type ADDI
    		begin
        	RegDst = 1'b0;
        	Branch = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	ALUOP = 3'b000; // ADD
        	MemWrite = 1'b0;
        	ALUSrc = 1'b1;
        	RegWrite = 1'b1;
		J = 1'b0;
   		end
	6'b001010: // I-type SLTI
    		begin
        	RegDst = 1'b0;
        	Branch = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	ALUOP = 3'b001; // SLT
        	MemWrite = 1'b0;
        	ALUSrc = 1'b1;
        	RegWrite = 1'b1;
		J = 1'b0;
    		end
	6'b001100: // I-type ANDI
    		begin
        	RegDst = 1'b0;
        	Branch = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	ALUOP = 3'b010; // AND
        	MemWrite = 1'b0;
        	ALUSrc = 1'b1;
        	RegWrite = 1'b1;
		J = 1'b0;
    		end
	6'b001101: // I-type ORI
    		begin
        	RegDst = 1'b0;
        	Branch = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	ALUOP = 3'b011; // OR
        	MemWrite = 1'b0;
        	ALUSrc = 1'b1;
        	RegWrite = 1'b1;
		J = 1'b0;
    		end
	6'b000100: // I-type BEQ
    		begin
        	RegDst = 1'b0;
        	Branch = 1'b1;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	ALUOP = 3'b101; // sub
        	MemWrite = 1'b0;
        	ALUSrc = 1'b0;
        	RegWrite = 1'b0;
		J = 1'b0;
    		end
	6'b100011: // I-type Lw
    		begin
        	RegDst = 1'b0;
        	Branch = 1'b0;
        	MemRead = 1'b1;
        	MemToReg = 1'b1;
        	ALUOP = 3'b000; // ADD
        	MemWrite = 1'b0;
        	ALUSrc = 1'b1;
        	RegWrite = 1'b1;
		J = 1'b0;
    		end
	6'b101011: // I-type Sw
    		begin
        	RegDst = 1'b0;
        	Branch = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	ALUOP = 3'b000; // ADD
        	MemWrite = 1'b1;
        	ALUSrc = 1'b1;
        	RegWrite = 1'b0;
		J = 1'b0;
    		end
	6'b000010: //Jump
		begin
		ALUSrc = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b1;
		RegWrite = 1'b0;
		Branch = 1'b0;
		J = 1'b1;
		end

	endcase
end

endmodule