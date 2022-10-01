module registerFile(clk, reset, writeEnable, readAdd1, readAdd2, writeData, writeAdd, readOut1, readOut2);
  input clk, reset, writeEnable;
  input [4:0] readAdd1, readAdd2;
  input [31:0] writeData;
  input [4:0] writeAdd;
  reg [31:0] register [31:0];
  output wire [31:0] readOut1, readOut2;
  
  wire [31:0] zero, at, v0, v1, a0, a1, a2, a3, t0, t1, t2, t3, t4, t5, t6, t7, s0, s1, s2, s3, s4, s5, s6, s7, t8, t9, k0, k1, gp, sp, fp, ra;
  
  initial begin
    register[0] = 32'b0; // zero
    register[10] = 32'haa; // t2
    register[11] = 32'hbb; // t3
    register[17] = 32'ha; // s1
    register[18] = 32'hb; // s2
    register[14] = 32'hfff; // t6
    register[15] = 32'hfff; // t7
    
  end
  
  assign zero = register[0];
  
  assign at = register[1];
  
  assign v0 = register[2];
  assign v1 = register[3];
  
  assign a0 = register[4];
  assign a1 = register[5];
  assign a2 = register[6];
  assign a3 = register[7];
  
  assign t0 = register[8];
  assign t1 = register[9];
  assign t2 = register[10];
  assign t3 = register[11];
  assign t4 = register[12];
  assign t5 = register[13];
  assign t6 = register[14];
  assign t7 = register[15];
  
  assign s0 = register[16];
  assign s1 = register[17];
  assign s2 = register[18];
 
  assign s3 = register[19];
  assign s4 = register[20];
  assign s5 = register[21];
  assign s6 = register[22];
  assign s7 = register[23];
  
  assign t8 = register[24];
  assign t9 = register[25];
  
  assign k0 = register[26];
  assign k1 = register[27];
  
  assign gp = register[28];
  assign sp = register[29];
  assign fp = register[30];
  assign ra = register[31];
  
  integer i;
 
  
  /*always@(posedge clk, posedge reset) begin
    if(writeEnable) begin
      register[writeAdd] = writeData;
    end
  end*/
  
   always@(posedge clk, posedge reset) begin
    if(reset == 1'b1)
      	 for(i = 0; i < 32; i = i + 1)
          begin
            register[i] = 0;
          end
	else
      if(writeEnable)
      	register[writeAdd] <= writeData;
  end 
  
  
  assign readOut1 = register[readAdd1];
  assign readOut2 = register[readAdd2];
  
endmodule