module mux_2_to_1(
    input  A,
    input  B,
    input  SELECT,
    output Z
);
    assign Z = SELECT ? B : A;
endmodule
