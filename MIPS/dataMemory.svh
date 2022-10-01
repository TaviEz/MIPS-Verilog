module dataMemory(clk, reset, readAdd, writeData, writeEnable, readEnable, outData);
  input clk, reset, writeEnable, readEnable;
  input [31:0] readAdd, writeData;
  output [31:0] outData;
  reg [7:0] memory [255:0];
  integer i;
  
  initial begin
    $readmemh("memory.mem", memory);
    $writememh("memory.mem", memory);
  end
 
  always@(posedge clk) begin
    if(writeEnable) begin
      memory[readAdd] = writeData[31:24];
      memory[readAdd + 1] = writeData[23:16];
      memory[readAdd + 2] = writeData[15:8];
      memory[readAdd + 3] = writeData[7:0];
    end
  end
  
  assign outData = {memory[readAdd], memory[readAdd + 1], memory[readAdd + 2], memory[readAdd + 3]};
  
  /*always@(reset)
  	if(reset == 1'b1)
    	outData = 0;*/
      
  
  
endmodule