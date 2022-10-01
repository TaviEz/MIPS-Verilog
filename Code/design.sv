`include "Adder.svh"
`include "mux32.svh"
`include "mux5.svh"
`include "signExtend.svh"
`include "shl26.svh"
`include "shl32.svh"
`include "ALUcontrol.svh"
`include "ALU.svh"
`include "control.svh"
`include "PC.svh"
`include "registerFile.svh"
`include "instructionMem.svh"
`include "dataMemory.svh"
`include "and.svh"
`include "adder4.svh"
`include "mux32_2.svh"


module MIPS(clk, reset);
  input clk, reset;
  
  wire [31:0] PCin, PCout, instruction;
  
  // adder a1
  wire [31:0] addOut1;
  
  //shiftleft26
  
  wire [27:0] outShl28;
  
  //control
  wire [5:0] opcode;
  wire [1:0] regDst, memToReg, ALUOp;
  wire ALUsrc, regWrite, memRead, memWrite, branch, jump;
  
  wire [4:0] mux5Out;
  
  //registerFile
  wire [31:0] writeData;
  wire [31:0] readData1, readData2;
  
  wire [31:0] outSignExtend;
  
  //outShiftLeft32
  wire [31:0] outShl32;
  
  // adder2
  wire [31:0] addOut2;
  
  //mux m1
  wire [31:0] outM1;
  
  //alucontrol
  wire [2:0] alucOut;
  
  //alu
  wire [31:0] aluOut;
  wire zero;
  
  //m2
  wire m2Sel;
  wire [31:0] m2in, m2out;
  
  //adder a4
  wire [31:0] m3in;
  
  // dataMemory
  wire [31:0] readData;
 
  
  
  PC pc(.clk(clk), .reset(reset), .next(PCin), .current(PCout));
  
  Adder a1(.a(PCout), .b(32'h4), .sum(addOut1));
    
  instructionMemory im(.address(PCout), .instruction(instruction));
  
  shl26 shl1(.in(instruction[25:0]), .out(outShl28));
             
  // concatenare primii 4 cei mai significant biti cu 28 de 0 total = 32 de biti           
  adder4 a4(.a(outShl28), .b({addOut1[31:28], 28'b0}), .sum(m3in));
  
  control c(.opcode(instruction[31:26]), .regDst(regDst), .ALUsrc(ALUsrc), .memToReg(memToReg), .regWrite(regWrite), .memRead(memRead), .memWrite(memWrite), .branch(branch), .ALUOp(ALUOp), .jump(jump));
  
  mux5 m5(.a(instruction[20:16]), .b(instruction[15:11]), .sel(regDst), .out(mux5Out));
          
  registerFile rf(.clk(clk), .reset(reset), .writeEnable(regWrite), .readAdd1(instruction[25:21]), .readAdd2(instruction[20:16]), .writeData(writeData), .writeAdd(mux5Out), .readOut1(readData1), .readOut2(readData2));
  
  ALUcontrol aluc(.aluoP(ALUOp), .func(instruction[5:0]), .res(alucOut));
  
  signExtend sgnExtnd(.in(instruction[15:0]), .out(outSignExtend));
                      
  mux32 m1(.a(readData2), .b(outSignExtend), .sel(ALUsrc), .out(outM1));
                      
  ALU alu(.in1(readData1), .in2(outM1), .sel(alucOut), .out(aluOut), .zero(zero));
  
  shl32 shl2(.in(outSignExtend), .out(outShl32));
             
  Adder a2(.a(outShl32), .b(addOut1), .sum(addOut2));
  
  andGate andg(.a(branch), .b(zero), .y(m2sel));
                                          
  mux32 m2(.a(addOut1), .b(addOut2), .sel(m2sel), .out(m2out)); 
             
  mux32 m3(.a(m2out), .b(m3in), .sel(jump), .out(PCin));
  
  dataMemory dm(.clk(clk), .reset(reset), .readAdd(aluOut), .writeData(readData2), .writeEnable(memWrite), .readEnable(memRead), .outData(readData));
  
  mux32_2 m4(.a(aluOut), .b(readData), .sel(memToReg), .out(writeData));
  
endmodule