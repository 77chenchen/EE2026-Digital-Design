module adder_2bit_msb(
    input  [1:0] A,
    input  [1:0] B,
    input        CIN,
    output [1:0] S
);
    wire C1;
    wire unused_carry;

    full_adder fa0 (A[0], B[0], CIN, S[0], C1);
    full_adder fa1 (A[1], B[1], C1,  S[1], unused_carry);
endmodule
