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

        // Set input_patch values
        input_patch[0][0] = 8'd10;  // Assigning a value of 10 to the element at (0,0)
        input_patch[0][1] = 8'd15;
        input_patch[0][2] = 8'd20;
        input_patch[1][0] = 8'd25;
        input_patch[1][1] = 8'd30;
        input_patch[1][2] = 8'd35;
        input_patch[2][0] = 8'd40;
        input_patch[2][1] = 8'd45;
        input_patch[2][2] = 8'd50;

        // Set kernel values
        kernel[0][0] = 8'd2; 
        kernel[0][1] = 8'd2; 
        kernel[0][2] = 8'd2; 
        kernel[1][0] = 8'd2; 
        kernel[1][1] = 8'd2; 
        kernel[1][2] = 8'd2; 
        kernel[2][0] = 8'd2; 
        kernel[2][1] = 8'd2; 
        kernel[2][2] = 8'd2; 

        // Set bias value
        bias = 8'd1; 

        #10;
        $display("Output pixel: %d", output_pixel);

        // End of test
        $finish;
    end

endmodule
