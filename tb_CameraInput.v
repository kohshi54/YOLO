module tb_CameraInput();

    reg clk;
    reg pixel_clk;
    reg [23:0] pixel_data;
    reg pixel_valid;
    wire [23:0] camera_data_out;
    wire camera_data_valid;

    // Instantiate the CameraInput
    CameraInput uut (
        .clk(clk),
        .pixel_clk(pixel_clk),
        .pixel_data(pixel_data),
        .pixel_valid(pixel_valid),
        .camera_data_out(camera_data_out),
        .camera_data_valid(camera_data_valid)
    );

    // Clock generation for system and pixel clocks
    always begin
        #5 clk = ~clk;
    end

    always begin
        #7 pixel_clk = ~pixel_clk; // Pixel clock can be different from the system clock
    end

    // Test procedure
    initial begin
        clk = 0;
        pixel_clk = 0;
        pixel_valid = 0;

        // Wait a few cycles
        #20;

        // Feed in a sample pixel
        pixel_data = 24'hFF0000; // Red pixel
        pixel_valid = 1'b1;
        #10 pixel_valid = 1'b0;
        #10 $display("Camera Data Out: %h, Valid: %b", camera_data_out, camera_data_valid);

        // Feed in another sample pixel
        pixel_data = 24'h00FF00; // Green pixel
        pixel_valid = 1'b1;
        #10 pixel_valid = 1'b0;
        #10 $display("Camera Data Out: %h, Valid: %b", camera_data_out, camera_data_valid);

        // End of test
        $finish;
    end

endmodule
