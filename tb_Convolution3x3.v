module tb_Convolution3x3();

    reg clk;
    reg rst_n;
    reg [2:0][2:0][7:0] input_patch;
    reg [2:0][2:0][7:0] kernel;
    reg [7:0] bias;
    wire [9:0] output_pixel;

    // Instantiate the Convolution3x3
    Convolution3x3 uut (
        .clk(clk),
        .rst_n(rst_n),
        .input_patch(input_patch),
        .kernel(kernel),
        .bias(bias),
        .output_pixel(output_pixel)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test procedure
    initial begin
        clk = 0;
        rst_n = 0;
        #10 rst_n = 1;

        // Set input_patch, kernel, and bias for a test case
        // ... (you'd provide values here)

        #10;
        $display("Output pixel: %d", output_pixel);

        // End of test
        $finish;
    end

endmodule
