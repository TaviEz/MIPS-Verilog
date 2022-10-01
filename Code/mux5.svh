module mux5(a, b, sel, out);
  input [4:0] a;
  input [4:0] b;
  input [1:0] sel;
  output [4:0] out;
  
  assign out = sel ? b : a;
endmodule