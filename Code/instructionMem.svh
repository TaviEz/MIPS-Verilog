module instructionMemory(address, instruction);
  input [31:0] address;
  output wire [31:0] instruction;
  reg [7:0] memory [255:0];
  integer i;
  
  initial begin
    $readmemh("memory.mem", memory); 
  end
  
  
    assign instruction = {memory[address], memory[address + 1], memory[address + 2], memory[address + 3]};
  
endmodule