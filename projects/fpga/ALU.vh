

//Bitwise operations
module bit_and(
    input[7:0] x, y,
    input enable ,
    output[7:0] answer
);
    wire [7:0] out;
    assign out = x & y;
    assign answer = out&enable;
endmodule

module bit_or(
    input[7:0] x, y,
    input enable ,
    output[7:0] answer
);
    wire [ 7:0] out;
    assign out = x | y;
    assign answer = out&enable;
endmodule

//Arithmetic Operations
  module adder(A, B, CI, SUM);  
  input  [7:0] A;
  input  [7:0] B;
  input  CI;
  output [7:0] SUM;
 
  assign SUM = A + B + CI;
endmodule

module subt(A, B, DIF);
  input  [7:0] A;
  input  [7:0] B;
  output [7:0] DIF;
 
  assign DIF = A - B;
endmodule



module alu(
  input[7:0] x, y,
  input[1:0] sel,  //0: b_and, 1: b_or, 2: sum, 3: diff
  output[7:0] out
);
  wire[7:0] out, outAnd, outOr, outAdd, outSub;
  bit_and bitAnd(.x(x), .y(y), .enable(1), .answer(outAnd));
  bit_or  bitOr (.x(x), .y(y), .enable(1), .answer(outOr) );
  adder   add   (.A(x), .B(y), .CI(0),     .SUM(outAdd)   );  	
  subt    sub   (.A(x), .B(y),             .DIF(outSub)   );

  assign out = (
    sel[0] == 0 & sel[1] == 0 ? outAnd :
    sel[0] == 0 & sel[1] == 1 ? outOr  :
    sel[0] == 1 & sel[1] == 0 ? outAdd :
    							outSub
  );
endmodule

