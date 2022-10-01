module mux32_2(a, b, sel, out);
  input [31:0] a;
  input [31:0] b;
  input [1:0] sel;
  output [31:0] out;
  
  assign out = sel ? b : a;
endmodule