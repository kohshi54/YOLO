module CameraInput (
    input clk,               // System clock
    input pixel_clk,         // Pixel clock from camera
    input [23:0] pixel_data, // 24-bit RGB pixel data from camera
    input pixel_valid,       // Signal indicating valid pixel data
    output reg [23:0] camera_data_out, // Output data to the processing unit
    output reg camera_data_valid      // Valid signal for the output data
);

    always @(posedge clk) begin
        if (pixel_valid) begin
            camera_data_out <= pixel_data;
            camera_data_valid <= 1'b1;
        end else begin
            camera_data_valid <= 1'b0;
        end
    end

endmodule
