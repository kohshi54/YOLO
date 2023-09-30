module Convolution3x3 (
    input clk,              // Clock signal
    input rst_n,            // Active low reset signal
    input [2:0][2:0][7:0] input_patch, // 3x3 input patch, 8 bits per pixel
    input [2:0][2:0][7:0] kernel,      // 3x3 convolution kernel, 8 bits per weight
    input [7:0] bias,       // 8-bit bias value
    output reg [9:0] output_pixel  // 10-bit output pixel value (to handle potential overflow)
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            output_pixel <= 10'b0;
        end else begin
            output_pixel[7:0] = 
                input_patch[0][0] * kernel[0][0] + 
                input_patch[0][1] * kernel[0][1] + 
                input_patch[0][2] * kernel[0][2] +
                input_patch[1][0] * kernel[1][0] + 
                input_patch[1][1] * kernel[1][1] + 
                input_patch[1][2] * kernel[1][2] +
                input_patch[2][0] * kernel[2][0] + 
                input_patch[2][1] * kernel[2][1] + 
                input_patch[2][2] * kernel[2][2];
            output_pixel[7:0] = output_pixel[7:0] + bias[7:0];
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
