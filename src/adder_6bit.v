module adder_6bit(
    input  [5:0] A,
    input  [5:0] B,
    output [5:0] DR
);
    wire carry_between_adders;

    adder_4bit_lsb least_significant_adder (
        A[3:0], B[3:0], DR[3:0], carry_between_adders
    );

    adder_2bit_msb most_significant_adder (
        A[5:4], B[5:4], carry_between_adders, DR[5:4]
    );
endmodule
