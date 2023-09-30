module FullyConnectedLayer (
    input clk,                   // Clock signal
    input rst_n,                 // Active low reset signal
    input [7:0] input_data[0:N-1],  // Input vector of length N
    input [7:0] weights[0:M-1][0:N-1], // Weight matrix of size MxN
    input [7:0] biases[0:M-1],       // Bias vector of length M
    output reg [7:0] output_data[0:M-1]  // Output vector of length M
);

    integer i, j;
    reg [15:0] temp_sum; // Temporary register to hold the sum (consider overflow)

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < M; i = i + 1)
                output_data[i] <= 8'b0;
        end else begin
            for (i = 0; i < M; i = i + 1) begin
                temp_sum = 0;
                for (j = 0; j < N; j = j + 1) begin
                    temp_sum = temp_sum + (input_data[j] * weights[i][j]);
                end
                // Add bias and truncate to 8 bits. Consider overflow and underflow
                output_data[i] <= temp_sum[15:8] + biases[i];
            end
        end
    end

endmodule

/*
Description:
The module FullyConnectedLayer represents a fully connected neural network layer.
input_data represents the input vector of length N.
weights is an MxN matrix where each row corresponds to the weights for one output neuron.
biases is a vector of length M, representing the bias for each output neuron.
The module multiplies each input with the corresponding weight, sums the results, and then adds a bias to produce each output data point.
*/
