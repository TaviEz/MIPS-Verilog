// Code your testbench here
// or browse Examples


/*tb adder*/

/*module testBench();
  reg [31:0] t_a;
  reg [31:0] t_b;
  wire [31:0] t_sum;
  
  Adder add(t_a, t_b, t_sum);
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, testBench);
    #5
    t_a = 32'h25;
    t_b = 32'h30;
    
    #5
    t_a = 32'ha;
    t_b = 32'h4;
  end
  
  initial 
    #200 $finish;
 
endmodule*/

/* tb mux 32*/

/*module testBench();
  reg [31:0] tb_a, tb_b;
  reg tb_sel;
  wire [31:0] tb_out;
  
  mux32 m(tb_a, tb_b, tb_sel, tb_out);
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, testBench);
    
    #5
    tb_a = 32'h25;
    tb_b = 32'h30;
    tb_sel = 1'b1;
    
    #5
    tb_a = 32'ha;
    tb_b = 32'hb;
    tb_sel = 1'b0;  
  end
  
  initial 
    #200 $finish;
  
endmodule*/


/*tb mux 5*/

/*module testBench();
  reg [4:0] tb_a, tb_b;
  reg tb_sel;
  wire [4:0] tb_out;
  
  mux5 m(tb_a, tb_b, tb_sel, tb_out);
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, testBench);
    
    #5
    tb_a = 5'b11111;
    tb_b = 5'b11110;
    tb_sel = 1'b1;
    
    #5
    tb_a = 5'b1;
    tb_b = 5'b111;
    tb_sel = 1'b0;
   
  end
  initial 
    #200 $finish;
  
endmodule*/

/*tb signExtend*/

/*module testBench();
  reg [15:0] t_in;
  wire [31:0] t_out;
  
  signExtend se(t_in, t_out);
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, testBench);
    #5
    t_in = 16'h6354;
    
    #5
    t_in = 16'h8532;
    
    
  end
  
  initial 
    #200 $finish;
  
endmodule*/


/*tb shiftleft26*/

/*module testBench();
  reg [25:0] t_in;
  wire [27:0] t_out;
  
  shl26 sh(t_in, t_out);
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    #5
    t_in = 26'ha6;
    
    #5
    t_in = 26'hbc;
    
  end
  
  initial 
    #200 $finish;
endmodule*/


/*tb shiftleft32*/

/*module testBench();
  reg [31:0] t_in;
  wire [31:0] t_out;
  
  shl32 sh(t_in, t_out);
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    #5
    t_in = 32'ha6;
    
    #5
    t_in = 32'hbc;
    
  end
  
  initial 
    #200 $finish;
endmodule*/


/*tb alucontrol*/

/*module testBench();
  reg [1:0] t_aluoP;
  reg [5:0] t_func;
  wire [2:0] t_res;
  
  ALUcontrol ac(t_aluoP, t_func, t_res);
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    #5
    t_aluoP = 2'b00;
    t_func = 6'bxxxxxx;
    
    #5
    t_aluoP = 2'b01;
    t_func = 6'bxxxxxx;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b100000;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b100010;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b100100;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b100101;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b101010;
  end
  
  initial 
    #200 $finish;
  
endmodule*/

/*tb alu solo*/

/*module testBench();
  reg [31:0] t_in1;
  reg [31:0] t_in2;
  reg [2:0] t_sel;
  wire [31:0] t_out;
  
  ALU alu(t_in1, t_in2, t_sel, t_out);
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testBench);
    #5
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    t_sel = 3'b010;
    
    #5
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    t_sel = 3'b110;
    #10
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    t_sel = 3'b000;
    #10
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    t_sel = 3'b001;
    #10
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    t_sel = 3'b111;
    
    
  end
  
  initial begin
      #200 $finish;
    end
endmodule*/

/*tb alu + alu control*/

/*module testBench();
  reg [31:0] t_in1;
  reg [31:0] t_in2;
  wire [2:0] t_sel;
  wire [31:0] t_out;
  
  reg [1:0] t_aluoP;
  reg [5:0] t_func;
  
  ALUcontrol aluc(t_aluoP, t_func, t_sel);
  ALU alu(t_in1, t_in2, t_sel, t_out);
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
   
    #5
    t_aluoP = 2'b00;
    t_func = 6'bxxxxxx;
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    
    #5
    t_aluoP = 2'b01;
    t_func = 6'bxxxxxx;
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b100000;
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b100010;
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b100100;
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b100101;
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
    
    #5
    t_aluoP = 2'b10;
    t_func = 6'b101010;
    t_in1 = 31'b1011;
    t_in2 = 31'b0111;
   
  end
  
  initial begin
      #200 $finish;
    end
endmodule*/

/*tb control*/

/*module testBench();
  reg [5:0] t_opcode;
  wire t_ALUsrc, t_regWrite, t_memRead, t_memWrite, t_branch, t_jump;
  wire [1:0] t_regDst, t_memToReg, t_ALUOp;
  
  control c(t_opcode, t_regDst, t_ALUsrc, t_memToReg, t_regWrite, t_memRead, t_memWrite, t_branch, t_ALUOp, t_jump);
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    
    #5
    t_opcode = 6'b0; 
    
    #5
    t_opcode = 6'b001000; 
    
    #5
    t_opcode = 6'b000100; 
   
    #5
    t_opcode = 6'b000010; 
    
    #5
    t_opcode = 6'b000011; 
    
    #5
    t_opcode = 6'b100011; 
    
    #5
    t_opcode = 6'b101011; 
    
    
  end
  
  initial begin
      #200 $finish;
    end
endmodule*/


/*tb PC*/

/*module testBench();
  reg t_clk, t_reset;
  reg [31:0] t_next;
  wire [31:0] t_current;
  
  PC pc(t_clk, t_reset, t_next, t_current);
  initial
  begin
      #0 t_clk = 1'b0;
      forever #5 t_clk = ~t_clk;
  end
  
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    
    #5
    t_next = 32'h1;
    
    #10
    t_next = 32'h4;
  end
  
  initial begin
  	#10 t_reset = 1;
    #5 t_reset = 0;
  end
  
  initial
    #200 $finish;
endmodule*/

/*tb instruction memory*/

/*module testBench();
  reg t_clk, t_reset;
  reg [31:0] t_address;
  wire [31:0] t_instruction;
  
  initial
  begin
      #0 t_clk = 1'b0;
      forever #5 t_clk = ~t_clk;
  end
  
  instructionMemory im(t_clk, t_reset, t_address, t_instruction);
  
  initial begin
    #10 t_reset = 1'b0;
    #2 t_reset = 1'b1;
    #1 t_reset = 1'b0;
  end
  
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    
    #5
  	t_address = 0;
    
    #10
    t_address = 4;
    
    #10
    t_address = 8;
    
    #10
    t_address = 12;
  end
  
  
  
  initial
    #200 $finish;
  
endmodule*/


/*tb register file*/

/*module testBench();
  reg t_clk, t_reset, t_writeEnable;
  reg [4:0] t_readAdd1, t_readAdd2;
  reg [31:0] t_writeData;
  reg [4:0] t_writeAdd;
  wire [31:0] t_readOut1, t_readOut2;
  
  initial
  begin
      #0 t_clk = 1'b0;
      forever #5 t_clk = ~t_clk;
  end
  
  registerFile rf(t_clk,  t_reset, t_writeEnable, t_readAdd1, t_readAdd2, t_writeData, t_writeAdd, t_readOut1, t_readOut2);
  
  /*initial begin
    #10 t_reset = 1'b0;
    #2 t_reset = 1'b1;
    #1 t_reset = 1'b0;
  end
  
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    
    #5
    t_readAdd1 = 0;
    t_readAdd2 = 1;
    t_writeData = 32'ha;
    t_writeAdd = 0;
    t_writeEnable = 1;
    
    #10
    t_readAdd1 = 0;
    t_readAdd2 = 1;
    t_writeData = 32'hb;
    t_writeAdd = 1;
    t_writeEnable = 1;
    
    #10
    t_readAdd1 = 0;
    t_readAdd2 = 1;
    t_writeEnable = 0;
      
  end
  
  initial
    #200 $finish;
  
endmodule*/


/*tb dataMemory*/

/*module testBench();
  reg t_clk, t_reset, t_writeEnable, t_readEnable;
  reg [31:0] t_readAdd, t_writeData;
  wire [31:0] t_outData;
  
  initial
  begin
      #0 t_clk = 1'b0;
      forever #5 t_clk = ~t_clk;
  end
  
  dataMemory dm(t_clk, t_reset, t_readAdd, t_writeData, t_writeEnable, t_readEnable, t_outData);
  
  initial begin
    #0  t_reset = 1'b0;
    #50 t_reset = 1'b1;
    #1 t_reset = 1'b0;
  end
  
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    
    #5
    t_readAdd = 0;
    t_readEnable = 0;
    t_writeEnable = 1;
    t_writeData = 32'haabbccdd;
    
    #10
    t_readAdd = 0;
    t_readEnable = 1;
    t_writeEnable = 0;
    
    #10
    t_readAdd = 4;
    t_readEnable = 0;	
   	t_writeEnable = 1;
    t_writeData =32'hff112233;
    
    #10
    t_readAdd = 4;
    t_readEnable = 1;
    t_writeEnable = 0;
    
    #10
    t_readAdd = 8;
    t_readEnable = 1;
    t_writeEnable = 0;
    
  end
  
  initial
    #200 $finish;
endmodule*/


/* PC + adder4*/

/*
module testBench();
  reg [31:0] t_start;
  wire [31:0] t_PCin, t_PCout;
  reg t_clk, t_reset;
  
  initial
  begin
      #0 t_clk = 1'b0;
      forever #5 t_clk = ~t_clk;
  end
  
  
  PC pc(t_clk, t_reset, t_start, t_PCout);
  Adder adder4(t_PCout, 4, t_PCin);
  
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    
    #5
    t_start = 32'h0;
    
    #10
    t_start = t_PCin;
    
    #10
    t_start = t_PCin;
    
  end
  
  
  initial
    #200 $finish;
  
endmodule*/


module testBench();
  reg t_clk, t_reset;
  reg [31:0] t_writeData;
 
  
  initial
  begin
      #0 t_clk = 1'b0;
      forever #7 t_clk = ~t_clk;
  end
  
  initial begin
    #0  t_reset = 1'b0;
    #12 t_reset = 1'b1;
    #2 t_reset = 1'b0;
  end
  
  MIPS m(t_clk, t_reset);
  
  initial begin
    $dumpfile("testb.vcd");
    $dumpvars(0, testBench);
    
  end
  
   initial
    #200 $finish;
  
endmodule
  
  