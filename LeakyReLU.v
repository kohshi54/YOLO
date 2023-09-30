module LeakyReLU (
    input [7:0] input_data,     // 8-bit input data
    output reg [7:0] output_data, // 8-bit output data
    parameter ALPHA = 4'h1     // Default alpha value of 0.01 for 8-bit fixed-point representation
);

    // Intermediate signal to hold the result of multiplication with alpha
    wire [7:0] alpha_product = input_data * ALPHA;

    always @(*) begin
        if (input_data[7] == 0)  // Check if the most significant bit (sign bit) is 0
            output_data = input_data;  // Positive value, so just pass through
        else
            output_data = alpha_product; // Negative value, so multiply with alpha
    end

endmodule

/*
Description:
This module represents an 8-bit signed Leaky ReLU operation.
The input value's sign is represented by the most significant bit (MSB).
If the input value is non-negative (MSB is 0), it passes through as-is.
If the input value is negative (MSB is 1), it gets multiplied by α. In this example, 
the multiplication with α is a simple scaling based on a fixed-point representation of 0.01. 
The actual scaling factor and representation can be adjusted based on precision needs.
*/
