module my_full_adder(input A,
    input B,
    input CIN,
    output Sum,
    output COUT
);
    assign Sum = A^B^CIN;
    assign COUT = (A&B) | (CIN&(A^B));
endmodule

module four_bit_adder( 
    input [3:0] A,
    input [3:0] B,
    input C0,
    output [3:0] S,
    output C4
);
    wire C1,C2,C3;
    my_full_adder fa0 (A[0],B[0],C0,S[0],C1);
    my_full_adder fa1 (A[1],B[1],C1,S[1],C2);
    my_full_adder fa2 (A[2],B[2],C2,S[2],C3);
    my_full_adder fa3 (A[3],B[3],C3,S[3],C4);
endmodule

module eight_bit_adder_subtractor( 
    input [7:0] A,
  	input [7:0] B,
    input signal,
  	input enable,
  	output [8:0] answer
);
    wire [7:0] B_modified;
    wire [8:0] out;
    wire C4;
    assign B_modified= (B^singnal);	
    four_bit_adder operation_1
    (A[3:0],B_modified[3:0],signal,out[3:0],C4 );
    four_bit_adder operation_2
    (A[7:4],B_modified[7:4],C4,out[7:4],out[8]);
    assign answer = out&enable;
endmodule

//Bitwise operations
module bit_or(
    input[7:0] x, y,
    input enable ,
    output[7:0] answer
);
    wire [ 7:0] out;
    assign out = x | y;
    assign answer = out&enable;
endmodule

module bit_and(
    input[7:0] x, y,
    input enable ,
    output[7:0] answer
);
    wire [ 7:0] out;
    assign out = x & y;
    assign answer = out&enable;
endmodule