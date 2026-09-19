module tb;

    reg [1:0] t_A;
    reg [1:0] t_B;

    wire t_GT;
    wire t_LT;
    wire t_EQ;

    integer errors;
    integer a;
    integer b;

    reg exp_GT;
    reg exp_LT;
    reg exp_EQ;

    comp2 DUT (
        .A(t_A),
        .B(t_B),
        .GT(t_GT),
        .LT(t_LT),
        .EQ(t_EQ)
    );

    initial begin
        errors = 0;

        for (a = 0; a < 4; a = a + 1) begin
            for (b = 0; b < 4; b = b + 1) begin

                t_A = a;
                t_B = b;

                #5;

                exp_GT = (a > b);
                exp_LT = (a < b);
                exp_EQ = (a == b);

                if ({t_GT, t_LT, t_EQ} !== {exp_GT, exp_LT, exp_EQ}) begin

                    $display("FAIL at time %0t: A=%0d B=%0d got GT=%b LT=%b EQ=%b expected GT=%b LT=%b EQ=%b",
                        $time, t_A, t_B,
                        t_GT, t_LT, t_EQ,
                        exp_GT, exp_LT, exp_EQ);

                    errors = errors + 1;
                end
            end
        end

        $display("SUMMARY: %0d/16 tests passed", 16 - errors);

        $finish;
    end

endmodule