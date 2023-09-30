module Convolution3x3 (
    input clk,              // Clock signal
    input rst_n,            // Active low reset signal
    input [2:0][2:0][7:0] input_patch, // 3x3 input patch, 8 bits per pixel
    input [2:0][2:0][7:0] kernel,      // 3x3 convolution kernel, 8 bits per weight
    input [7:0] bias,       // 8-bit bias value
    output reg [9:0] output_pixel  // 10-bit output pixel value (to handle potential overflow)
);

    integer i, j;
    reg [9:0] temp_sum;  // Temp variable to hold intermediate sum

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            output_pixel <= 10'b0;
        end else begin
            temp_sum = 0;
            for (i = 0; i < 3; i = i + 1) begin
                for (j = 0; j < 3; j = j + 1) begin
                    temp_sum = temp_sum + input_patch[i][j] * kernel[i][j];
                end
            end
            output_pixel <= temp_sum + bias;
        end
    end

endmodule

/*
Description:
The module, Convolution3x3, is a simple 3x3 convolution operation.
The input patch is a 3x3 region of an image or feature map, represented by input_patch.
The convolution kernel (or filter) is represented by kernel.
The module multiplies each element of the input_patch with the corresponding element in the kernel, sums up all the products, adds a bias, and then outputs a single output_pixel value.
The output pixel width is set to 10 bits to prevent overflow when summing up to 9 values each 8 bits wide.
*/
