module control(opcode, regDst, ALUsrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp, jump);
  input [5:0] opcode;
  output reg ALUsrc, regWrite, memRead, memWrite, branch, jump;
  output reg [1:0] regDst, memToReg, ALUOp;
  
  always@(*)
    begin 
      case(opcode)
        6'b0:  begin /*R-type*/
          regDst = 2'b01;
          ALUsrc = 1'b0;
          memToReg = 2'b00;
          regWrite = 1'b1;
          memRead = 1'b0;
          memWrite = 1'b0;
          branch = 1'b0;
          ALUOp = 2'b10;
          jump = 1'b0;
        end

        6'b001000: begin /*addi*/
            regDst = 2'b0;
            ALUsrc = 1'b1;
            memToReg = 2'b0;
            regWrite = 1'b1;
            memRead = 1'b0;
            memWrite = 1'b0;
            branch = 1'b0;
            ALUOp = 2'b00;
            jump = 1'b0;
        end

        6'b000100: begin /*beq*/
            regDst = 2'b0;
            ALUsrc = 1'b0;
            memToReg = 2'b0;
            regWrite = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b0;
            branch = 1'b1;
            ALUOp = 2'b01;
            jump = 1'b0;
        end

        6'b000010: begin /*jump*/
            regDst = 2'b0;
            ALUsrc = 1'b0;
            memToReg = 2'b0;
            regWrite = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b0;
            branch = 1'b0;
            ALUOp = 2'b0;//xx
            jump = 1'b1;
        end

        /*6'b000011: begin /*jal
            regDst = 2'b10;
            ALUsrc = 1'b0;
            memToReg = 2'b10;
            regWrite = 1'b1;
            memRead = 1'b0;
            memWrite = 1'b0;
            branch = 1'b0;
            ALUOp = 2'b0;
            jump = 1'b1;
        end*/

        6'b001010: begin /*stli = set or less than imm*/
            regDst = 2'b0;
            ALUsrc = 1'b1;
            memToReg = 2'b0;
            regWrite = 1'b1;
            memRead = 1'b0;
            memWrite = 1'b0;
            branch = 1'b0;
            ALUOp = 2'b10;
            jump = 1'b0;
        end

        6'b100011: begin /*load word*/
            regDst = 2'b0;
            ALUsrc = 1'b1;
            memToReg = 2'b1;
            regWrite = 1'b1;
            memRead = 1'b1;
            memWrite = 1'b0;
            branch = 1'b0;
            ALUOp = 2'b00;
            jump = 1'b0;
        end

        6'b101011: begin /*store word*/
            regDst = 2'b0;
            ALUsrc = 1'b1;
            memToReg = 2'b0;
            regWrite = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b1;
            branch = 1'b0;
            ALUOp = 2'b00;
            jump = 1'b0;
        end

        default: begin
            regDst = 2'b01;
            ALUsrc = 1'b0;
            memToReg = 2'b00;
            regWrite = 1'b1;
            memRead = 1'b0;
            memWrite = 1'b0;
            branch = 1'b0;
            ALUOp = 2'b0;
            jump = 1'b0;   
        end
        
      endcase
    end
  
endmodule