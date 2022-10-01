module adder4(a, b, sum);
  input [27:0] a; 
  input [31:0] b;
  output [31:0] sum;
  
  assign sum = a + b;
endmodule