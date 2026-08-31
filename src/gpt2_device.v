module gpt2_device(
    input  [5:0] A,
    input  [5:0] B,
    input        pb,
    output [5:0] S,
    output [3:0] an,
    output [7:0] seg
);
    wire [5:0] DR;
    wire [5:0] AR;
    wire [3:0] initial_an;
    wire [3:0] inverted_an;

    adder_6bit complete_adder (A, B, DR);

    assign AR = {1'b0, DR[5:1]};
    assign S = pb ? AR : DR;

    assign initial_an  = 4'b1110;
    assign inverted_an = 4'b0001;
    assign an = pb ? inverted_an : initial_an;

    assign seg = 8'b10100001;
endmodule
