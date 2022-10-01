module PC(clk, reset, next, current);
  input clk, reset;
  input [31:0] next;
  output reg [31:0] current;
  
  always@(posedge clk, posedge reset) begin
    if(reset == 1'b1)
      	current = 32'b0;  
	else 
    	current <= next;
  end   

endmodule