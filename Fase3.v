module Fase3(
	input CLK
);

//Modulo PC
wire [31:0]SalidaPC;
//Modulo Sumador
wire [31:0]SalidaSum;
wire [31:0]SalidaSumBuffer;
//Modulo MemInst
wire [31:0]SalidaMI;
wire [31:0]SalidaMIBuffer;
//Modulo UC
wire RegDst;
wire Branch;
wire MemRead;
wire MemToReg;
wire [2:0]ALUOP;
wire MemWrite;
wire ALUSrc;
wire RegWrite;
//Modulo BR
wire [31:0]DR1;
wire [31:0]DR2;
//Modulo ALUControl
wire [3:0]ALU_Control;
//Modulo ALU
wire [31:0]SalidaALU;
wire ZF;
wire [15:0]INM;
//Modulo MemDatos
wire [31:0]SalidaMD;
//Modulo MUX1
wire [4:0]SalidaMux1;
//Modulo Shift left 2
wire [31:0]SalidaShift;
//Modulo Sign-extend
wire [31:0]SalidaSign;
//Modulo Add
wire [31:0]SalidaADD;
//Modulo MUX2
wire [31:0]SalidaMUX2;
//Modulo Branch
wire SalidaBranch;
//Modulo MUX3
wire [31:0]SalidaMUX3;
//Modulo Mux
wire [31:0]SalidaMux;
//Para las instrucciones Jump
wire [31:0] JumpAddress;
wire [31:0]SalidaMUX4;
wire Jump;


PC PC(.CLK(CLK), .Entrada(SalidaMUX4), .Salida(SalidaPC));
Sumador Sum(.Entrada(SalidaPC), .Salida(SalidaSum));
MemInst MI(.Dir(SalidaPC), .DatoS(SalidaMI));
Shift shiftJump(.DatoSa(JumpAddress[27:0]), .DatoEn(SalidaMI[25:0]));
assign JumpAddress[31:28] = SalidaPC[3:0];
//BufferInstructionMemory buffer1(.Entrada1(SalidaMI), .Entrada2(SalidaSum), .CLK(CLK), .Salida1(SalidaMI), .Salida2(SalidaSum));
UC UC(.OP(SalidaMI[31:26]), .RegDst(RegDst), .Branch(Branch), .MemRead(MemRead), .MemToReg(MemToReg), .MemWrite(MemWrite), .ALUOP(ALUOP), .ALUSrc(ALUSrc), .RegWrite(RegWrite), .J(Jump));
BR BR(.Write(RegWrite), .RR1(SalidaMI[25:21]), .RR2(SalidaMI[20:16]), .WA(SalidaMux1), .WD(SalidaMux), .DR1(DR1), .DR2(DR2));
ALUControl ALUC(.ALUOP(ALUOP), .Funcion(SalidaMI[5:0]), .ALU_Control(ALU_Control));
ALU ALU(.OP1(DR1), .OP2(SalidaMUX2), .ALU_Control(ALU_Control), .Salida(SalidaALU), .ZF(ZF));
//MemDatos MD(.Dir(SalidaALU), .MemRead(MemRead), .MemWrite(MemWrite), .DatoE(DR2), .DatoS(SalidaMD));
MemDatos MD(.Dir(SalidaALU), .MemRead(MemRead), .MemWrite(MemWrite), .DatoE(SalidaALU), .DatoS(SalidaMD));
//Mux previo al BR
Mux1 Mux1 (.RegDst(RegDst), .Instruccion1(SalidaMI[20:16]), .Instruccion2(SalidaMI[15:11]), .SalidaMux(SalidaMux1));
SignExtend Sign(.Instruccion(SalidaMI[15:0]), .DatoSal(SalidaSign));
Shift Duv(.DatoSa(SalidaShift), .DatoEn(SalidaSign));
//Mux previo a la ALU
Mux2 Mux2(.DR2(DR2), .DatoSal(SalidaSign), .OP2(SalidaMUX2), .ALUSrc(ALUSrc));
Add Adder(.Entrada1(SalidaSum), .Entrada2(SalidaShift), .ALUResult(SalidaADD)); 
Branch branch(.Branch(Branch), .ZF(ZF), .SalidaB(SalidaBranch));
//Mux para las instrucciones Branch
Mux3 Mux3(.Branch(SalidaBranch), .En0(SalidaSum), .En1(SalidaADD), .Output(SalidaMUX3));
//Mux Mem to Reg
Mux Mux(.MemToReg(MemToReg), .MD(SalidaMD), .ALU(SalidaALU), .Salida(SalidaMux));
//Mux para las instrucciones JUMP
Mux3 Mux4(.Branch(Jump), .En0(SalidaMUX3), .En1(JumpAddress), .Output(SalidaMUX4));
endmodule
