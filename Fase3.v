module Fase3(
	input CLK
);

//Modulo PC
wire [31:0]SalidaPC;
//Modulo Sumador
wire [31:0]SalidaSum;
//Modulo MemInst
wire [31:0]SalidaMI;
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
//Buffer 1
wire [31:0]SalidaMIBuffer1;
wire [31:0]SalidaSumBuffer1;
//Buffer2
wire [31:0]SalidaSumBuffer2;
wire [31:0]DR1Buffer2;
wire [31:0]DR2Buffer2;
wire [31:0]SalidaSignBuffer2;
wire [4:0] SalidaMIBuffer2_2016;
wire [4:0] SalidaMIBuffer2_1511;
wire RegDstBuffer2;
wire [2:0]ALUOPBuffer2;
wire ALUSrcBuffer2;
wire BranchBuffer2;
wire MemWriteBuffer2;
wire MemReadBuffer2;
wire RegWriteBuffer2;
wire MemToRegBuffer2;
wire JumpBuffer2;
//Buffer3
wire [31:0]SalidaADDBuffer3;
wire [31:0]SalidaALUBuffer3;
wire ZFBuffer3;
wire [31:0]DR2Buffer3;
wire [4:0]SalidaMux1Buffer3;
wire BranchBuffer3;
wire MemWriteBuffer3;
wire MemReadBuffer3;
wire RegWriteBuffer3;
wire MemToRegBuffer3;
wire JumpBuffer3;
//Buffer4
wire [31:0]SalidaMDBuffer4;
wire [31:0]SalidaALUBuffer4;
wire [4:0]SalidaMux1Buffer4;
wire RegWriteBuffer4;
wire MemToRegBuffer4;
wire JumpBuffer4;


PC PC(.CLK(CLK), .Entrada(SalidaMUX4), .Salida(SalidaPC));
Sumador Sum(.Entrada(SalidaPC), .Salida(SalidaSum));
MemInst MI(.Dir(SalidaPC), .DatoS(SalidaMI));
Shift shiftJump(.DatoSa(JumpAddress[27:0]), .DatoEn(SalidaMI[25:0]));
assign JumpAddress[31:28] = SalidaPC[31:28];
BufferInstructionMemory buffer1(.Entrada1(SalidaMI), .Entrada2(SalidaSum), .CLK(CLK), .Salida1(SalidaMIBuffer1), .Salida2(SalidaSumBuffer1));
UC UC(.OP(SalidaMIBuffer1[31:26]), .RegDst(RegDst), .Branch(Branch), .MemRead(MemRead), .MemToReg(MemToReg), .MemWrite(MemWrite), .ALUOP(ALUOP), .ALUSrc(ALUSrc), .RegWrite(RegWrite), .J(Jump));
BR BR(.Write(RegWriteBuffer4), .RR1(SalidaMIBuffer1[25:21]), .RR2(SalidaMIBuffer1[20:16]), .WA(SalidaMux1Buffer4), .WD(SalidaMux), .DR1(DR1), .DR2(DR2));
SignExtend Sign(.Instruccion(SalidaMIBuffer1[15:0]), .DatoSal(SalidaSign));
//Buffer2
BufferBancoRegistros buffer2(
  .CLK(CLK),
  .Entrada1(SalidaSumBuffer1),
  .Entrada2(DR1),
  .Entrada3(DR2),
  .Entrada4(SalidaSign),
  .Entrada5(SalidaMIBuffer1[20:16]),
  .Entrada6(SalidaMIBuffer1[15:11]),
  .Entrada7(RegDst),
  .Entrada8(ALUOP),
  .Entrada9(ALUSrc),
  .Entrada10(Branch),
  .Entrada11(MemWrite),
  .Entrada12(MemRead),
  .Entrada13(RegWrite),
  .Entrada14(MemToReg),
  .Entrada15(Jump),
  .Salida1(SalidaSumBuffer2),
  .Salida2(DR1Buffer2),
  .Salida3(DR2Buffer2),
  .Salida4(SalidaSignBuffer2),
  .Salida5(SalidaMIBuffer2_2016),
  .Salida6(SalidaMIBuffer2_1511),
  .Salida7(RegDstBuffer2),
  .Salida8(ALUOPBuffer2),
  .Salida9(ALUSrcBuffer2),
  .Salida10(BranchBuffer2),
  .Salida11(MemWriteBuffer2),
  .Salida12(MemReadBuffer2),
  .Salida13(RegWriteBuffer2),
  .Salida14(MemToRegBuffer2),
  .Salida15(JumpBuffer2)
);

ALUControl ALUC(.ALUOP(ALUOPBuffer2), .Funcion(SalidaMIBuffer1[5:0]), .ALU_Control(ALU_Control));
//Mux previo al BR
Mux1 Mux1 (.RegDst(RegDstBuffer2), .Instruccion1(SalidaMIBuffer2_2016), .Instruccion2(SalidaMIBuffer2_1511), .SalidaMux(SalidaMux1));
//Mux previo a la ALU
Mux2 Mux2(.DR2(DR2), .DatoSal(SalidaSign), .OP2(SalidaMUX2), .ALUSrc(ALUSrcBuffer2));
ALU ALU(.OP1(DR1Buffer2), .OP2(SalidaMUX2), .ALU_Control(ALU_Control), .Salida(SalidaALU), .ZF(ZF));
Shift Duv(.DatoSa(SalidaShift), .DatoEn(SalidaSignBuffer2));
Add Adder(.Entrada1(SalidaSumBuffer2), .Entrada2(SalidaShift), .ALUResult(SalidaADD)); 
//Buffer 3
BufferALU buffer3(
  .CLK(CLK),
  .Entrada1(SalidaADD),
  .Entrada2(ZF),
  .Entrada3(SalidaALU),
  .Entrada4(DR2Buffer2),
  .Entrada5(SalidaMux1),
  .Entrada6(BranchBuffer2),
  .Entrada7(MemWriteBuffer2),
  .Entrada8(MemReadBuffer2),
  .Entrada9(RegWriteBuffer2),
  .Entrada10(MemToRegBuffer2),
  .Entrada11(JumpBuffer2),
  .Salida1(SalidaADDBuffer3),
  .Salida2(ZFBuffer3),
  .Salida3(SalidaALUBuffer3),
  .Salida4(DR2Buffer3),
  .Salida5(SalidaMux1Buffer3),
  .Salida6(BranchBuffer3),
  .Salida7(MemWriteBuffer3),
  .Salida8(MemReadBuffer3),
  .Salida9(RegWriteBuffer3),
  .Salida10(MemToRegBuffer3),
  .Salida11(JumpBuffer3)
);
//MemDatos MD(.Dir(SalidaALU), .MemRead(MemRead), .MemWrite(MemWrite), .DatoE(DR2), .DatoS(SalidaMD));
MemDatos MD(.Dir(SalidaALUBuffer3), .MemRead(MemReadBuffer3), .MemWrite(MemWriteBuffer3), .DatoE(DR2Buffer3), .DatoS(SalidaMD));
Branch branch(.Branch(BranchBuffer3), .ZF(ZFBuffer3), .SalidaB(SalidaBranch));
//Mux para las instrucciones Branch
Mux3 Mux3(.Branch(SalidaBranch), .En0(SalidaSumBuffer2), .En1(SalidaADDBuffer3), .Output(SalidaMUX3));

//Buffer 4
BufferUltimo buffer4(
  .CLK(CLK),
  .Entrada1(SalidaMD),
  .Entrada2(SalidaALUBuffer3),
  .Entrada3(SalidaMux1Buffer3),
  .Entrada4(RegWriteBuffer3),
  .Entrada5(MemToRegBuffer3),
  .Entrada6(JumpBuffer3),
  .Salida1(SalidaMDBuffer4),
  .Salida2(SalidaALUBuffer4),
  .Salida3(SalidaMux1Buffer4),
  .Salida4(RegWriteBuffer4),
  .Salida5(MemToRegBuffer4),
  .Salida6(JumpBuffer4)
);

//Mux Mem to Reg
Mux Mux(.MemToReg(MemToRegBuffer4), .MD(SalidaMDBuffer4), .ALU(SalidaALUBuffer4), .Salida(SalidaMux));
//Mux para las instrucciones JUMP
Mux3 Mux4(.Branch(JumpBuffer4), .En0(SalidaMUX3), .En1(JumpAddress), .Output(SalidaMUX4));
endmodule
