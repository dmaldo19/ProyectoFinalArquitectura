`timescale 1ns/1ns

module Fase1(
	input CLK
);

//Modulo PC
wire [31:0]SalidaPC;
//Modulo Sumador
wire [31:0]SalidaSum;
//Modulo MemInst
wire [31:0]SalidaMI;
//Modulo UC
wire MemToReg;
wire MemESC;
wire MemLeer;
wire [1:0]ALUOP;
wire RegToWrite;
//Modulo BR
wire [31:0]DR1;
wire [31:0]DR2;
//Modulo ALUControl
wire [3:0]ALU_Control;
//Modulo ALU
wire [31:0]SalidaALU;
wire ZF;
//Modulo MemDatos
wire [31:0]SalidaMD;
//Modulo Mux
wire [31:0]SalidaMux;

PC PC(.CLK(CLK), .Entrada(SalidaSum), .Salida(SalidaPC));
Sumador Sum(.Entrada(SalidaPC), .Salida(SalidaSum));
MemInst MI(.Dir(SalidaPC), .DatoS(SalidaMI));
UC UC(.OP(SalidaMI[31:26]), .MemToReg(MemToReg), .MemESC(MemESC), .MemLeer(MemLeer), .ALUOP(ALUOP), .RegToWrite(RegToWrite));
BR BR(.Write(RegToWrite), .RR1(SalidaMI[25:21]), .RR2(SalidaMI[20:16]), .WA(SalidaMI[15:11]), .WD(SalidaMux), .DR1(DR1), .DR2(DR2));
ALUControl ALUC(.ALUOP(ALUOP), .Funcion(SalidaMI[5:0]), .ALU_Control(ALU_Control));
ALU ALU(.OP1(DR1), .OP2(DR2), .ALU_Control(ALU_Control), .Salida(SalidaALU), .ZF(ZF));
MemDatos MD(.Dir(SalidaALU), .Leer(MemLeer), .ESC(MemESC), .DatoS(SalidaMD));
Mux Mux(.Sel(MemToReg), .MD(SalidaMD), .ALU(SalidaALU), .Salida(SalidaMux));

endmodule
