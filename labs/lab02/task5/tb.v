module tb;

reg [3:0] a, b;
reg op;
wire [3:0] result;

alu DUT (
    .a(a),
    .b(b),
    .op(op),
    .result(result)
);

integer errors;

initial begin
    errors = 0;

    // Addition
    a = 4'd5;
    b = 4'd3;
    op = 0;
    #1;

    if (result !== 4'd8) begin
        $display("FAIL: 5 + 3 = %d", result);
        errors = errors + 1;
    end
    else
        $display("PASS: 5 + 3 = %d", result);

    // Subtraction
    op = 1;
    #1;

    if (result !== 4'd2) begin
        $display("FAIL: 5 - 3 = %d", result);
        errors = errors + 1;
    end
    else
        $display("PASS: 5 - 3 = %d", result);

    // Addition with different operands
    a = 4'd9;
    b = 4'd4;
    op = 0;
    #1;

    if (result !== 4'd13) begin
        $display("FAIL: 9 + 4 = %d", result);
        errors = errors + 1;
    end
    else
        $display("PASS: 9 + 4 = %d", result);

    // Subtraction
    op = 1;
    #1;

    if (result !== 4'd5) begin
        $display("FAIL: 9 - 4 = %d", result);
        errors = errors + 1;
    end
    else
        $display("PASS: 9 - 4 = %d", result);

    if (errors == 0)
        $display("SUMMARY: ALL TESTS PASSED");
    else
        $display("SUMMARY: %0d TESTS FAILED", errors);

    $finish;
end

endmodule