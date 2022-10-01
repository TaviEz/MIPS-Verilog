module ALU(in1, in2, sel, out, zero);
  input [31:0] in1;
  input [31:0] in2;
  input [2:0] sel;
  output reg [31:0] out;
  output reg zero;
  
  always@(*)
    begin
      case(sel)
        3'b010: out = in1 + in2;
        3'b110: out = in1 - in2;
        3'b000: out = in1 & in2;
        3'b001: out = in1 | in2;
        3'b111: out = in1 < in2 ? 1 : 0; 
      endcase
      
      if(out == 1'b0)
        zero = 1'b1;
      else
        zero = 1'b0;
    end
endmodule