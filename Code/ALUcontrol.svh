module ALUcontrol(aluoP, func, res);
  input [1:0] aluoP;
  input [5:0] func;
  output reg [2:0] res;
  
  always @(*)
    begin
      casex({aluoP, func})
        8'b10100000: res = 3'b010; /*add*/
        8'b10100010: res = 3'b110; /*subtract*/
        8'b10100100: res = 3'b000; /*and*/
        8'b10100101: res = 3'b001; /*or*/
        8'b10101010: res = 3'b111;	/*set or less than*/
        8'b00xxxxxx: res = 3'b010; /*add*/
        8'b01xxxxxx: res = 3'b110; /*subtract*/
        default: res = 3'b000;
      endcase
    end
    
endmodule