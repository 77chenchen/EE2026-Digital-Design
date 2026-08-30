`timescale 1ns / 1ps

module tb_gpt2_device;
    reg  [5:0] A;
    reg  [5:0] B;
    reg        pb;
    wire [5:0] S;
    wire [3:0] an;
    wire [7:0] seg;

    gpt2_device dut (A, B, pb, S, an, seg);

    task check_outputs;
        input [5:0] expected_S;
        input [3:0] expected_an;
        begin
            if ((S !== expected_S) || (an !== expected_an) || (seg !== 8'd161)) begin
                $fatal(1, "Mismatch at time %0t: A=%0d B=%0d pb=%0d S=%0d an=%0d seg=%0d",
                       $time, A, B, pb, S, an, seg);
            end
            $display("time=%0t A=%0d B=%0d pb=%0d S=%0d an=%0d seg=%0d",
                     $time, A, B, pb, S, an, seg);
        end
    endtask

    initial begin
        A = 6'd0;  B = 6'd0;   pb = 1'd0;
        #1 check_outputs(6'd0, 4'd14);
        #19;

        A = 6'd0;  B = 6'd0;   pb = 1'd1;
        #1 check_outputs(6'd0, 4'd1);
        #19;

        A = 6'd0;  B = 6'd255; pb = 1'd1;
        #1 check_outputs(6'd31, 4'd1);
        #19;

        A = 6'd2;  B = 6'd255; pb = 1'd0;
        #1 check_outputs(6'd1, 4'd14);
        #19;

        A = 6'd5;  B = 6'd9;   pb = 1'd0;
        #1 check_outputs(6'd14, 4'd14);
        #19;

        A = 6'd5;  B = 6'd9;   pb = 1'd1;
        #1 check_outputs(6'd7, 4'd1);
        #19;

        A = 6'd31; B = 6'd1;   pb = 1'd0;
        #1 check_outputs(6'd32, 4'd14);
        #19;

        A = 6'd31; B = 6'd1;   pb = 1'd1;
        #1 check_outputs(6'd16, 4'd1);
        #19;

        A = 6'd40; B = 6'd23;  pb = 1'd0;
        #1 check_outputs(6'd63, 4'd14);
        #19;

        A = 6'd40; B = 6'd24;  pb = 1'd1;
        #1 check_outputs(6'd0, 4'd1);
        #19;

        $display("PASS: all 10 GPT-2 simulation sets");
        $finish;
    end
endmodule
