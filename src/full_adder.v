module full_adder(
    input  A,
    input  B,
    input  CIN,
    output S,
    output COUT
);
    assign S    = A ^ B ^ CIN;
    assign COUT = (A & B) | (CIN & (A ^ B));
endmodule
