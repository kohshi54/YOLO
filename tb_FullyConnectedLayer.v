module tb_FullyConnectedLayer();

    // Assume parameters for input and output vector lengths for this test
    parameter N = 10;  // Length of input vector
    parameter M = 5;   // Length of output vector

    reg clk;
    reg rst_n;
    reg [7:0] input_data[N-1:0];
    reg [7:0] weights[M-1:0][N-1:0];
    reg [7:0] biases[M-1:0];
    wire [7:0] output_data[M-1:0];

    // Instantiate the FullyConnectedLayer
    FullyConnectedLayer uut (
        .clk(clk),
        .rst_n(rst_n),
        .input_data(input_data),
        .weights(weights),
        .biases(biases),
        .output_data(output_data)
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

        // Sample test case: input data, weights, and biases
        // ... (you'd provide sample values here)

        #10;  // Let the data propagate
        $display("Output data:");
        for (int i = 0; i < M; i = i + 1) begin
            $display("  %d: %d", i, output_data[i]);
        end

        // End of test
        $finish;
    end

endmodule
