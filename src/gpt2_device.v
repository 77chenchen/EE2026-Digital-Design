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

    mux_2_to_1 result_mux_0 (DR[0], AR[0], pb, S[0]);
    mux_2_to_1 result_mux_1 (DR[1], AR[1], pb, S[1]);
    mux_2_to_1 result_mux_2 (DR[2], AR[2], pb, S[2]);
    mux_2_to_1 result_mux_3 (DR[3], AR[3], pb, S[3]);
    mux_2_to_1 result_mux_4 (DR[4], AR[4], pb, S[4]);
    mux_2_to_1 result_mux_5 (DR[5], AR[5], pb, S[5]);

    assign initial_an  = 4'b1110;
    assign inverted_an = 4'b0001;

    mux_2_to_1 anode_mux_0 (initial_an[0], inverted_an[0], pb, an[0]);
    mux_2_to_1 anode_mux_1 (initial_an[1], inverted_an[1], pb, an[1]);
    mux_2_to_1 anode_mux_2 (initial_an[2], inverted_an[2], pb, an[2]);
    mux_2_to_1 anode_mux_3 (initial_an[3], inverted_an[3], pb, an[3]);

    assign seg = 8'b10100001;
endmodule
