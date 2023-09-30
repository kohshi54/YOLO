module MaxPooling2x2 (
    input [7:0] input_data_00,  // Top-left pixel of the 2x2 input patch
    input [7:0] input_data_01,  // Top-right pixel
    input [7:0] input_data_10,  // Bottom-left pixel
    input [7:0] input_data_11,  // Bottom-right pixel
    output reg [7:0] output_data // Pooled output data
);

    always @(*) begin
        // Start with the top-left pixel
        output_data = input_data_00;
        
        // Compare with top-right pixel
        if(input_data_01 > output_data)
            output_data = input_data_01;
        
        // Compare with bottom-left pixel
        if(input_data_10 > output_data)
            output_data = input_data_10;
        
        // Finally, compare with the bottom-right pixel
        if(input_data_11 > output_data)
            output_data = input_data_11;
    end

endmodule

/*
Description:
This module represents a 2x2 max pooling operation.
The 2x2 input patch is represented by four inputs: input_data_00, input_data_01, input_data_10, and input_data_11.
The module compares the four pixel values and outputs the maximum value.
*/
