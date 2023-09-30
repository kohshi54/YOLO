module tb_LeakyReLU();

    reg [7:0] input_data;
    wire [7:0] output_data;

    // Parameters
    parameter ALPHA = 4'h1; // Example value

    // Instantiate the LeakyReLU
    LeakyReLU uut (
        .input_data(input_data),
        .output_data(output_data),
        .ALPHA(ALPHA)
    );

    // Test procedure
    initial begin

        // Test positive value
        input_data = 8'd100;  // Some positive value
        #10;
        $display("Input: %d, LeakyReLU Output: %d", input_data, output_data);

        // Test negative value
        input_data = 8'd200;  // Some negative value (considering 2's complement format)
        #10;
        $display("Input: %d, LeakyReLU Output: %d", input_data, output_data);

        // Test zero
        input_data = 8'd0;
        #10;
        $display("Input: %d, LeakyReLU Output: %d", input_data, output_data);

        // End of test
        $finish;
    end

endmodule
