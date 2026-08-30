module adder_4bit_lsb(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] S,
    output       COUT
);
    wire C1;
    wire C2;
    wire C3;

    full_adder fa0 (A[0], B[0], 1'b0, S[0], C1);
    full_adder fa1 (A[1], B[1], C1,   S[1], C2);
    full_adder fa2 (A[2], B[2], C2,   S[2], C3);
    full_adder fa3 (A[3], B[3], C3,   S[3], COUT);
endmodule
