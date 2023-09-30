module tb_MaxPooling2x2();

    reg [7:0] input_data_00, input_data_01, input_data_10, input_data_11;
    wire [7:0] output_data;

    // Instantiate the MaxPooling2x2
    MaxPooling2x2 uut (
        .input_data_00(input_data_00),
        .input_data_01(input_data_01),
        .input_data_10(input_data_10),
        .input_data_11(input_data_11),
        .output_data(output_data)
    );

    // Test procedure
    initial begin

        // Test where the top-left pixel is the maximum
        input_data_00 = 8'd100;
        input_data_01 = 8'd50;
        input_data_10 = 8'd40;
        input_data_11 = 8'd30;
        #10;
        $display("Max Output: %d", output_data);

        // Test where the bottom-right pixel is the maximum
        input_data_00 = 8'd10;
        input_data_01 = 8'd20;
        input_data_10 = 8'd30;
        input_data_11 = 8'd100;
        #10;
        $display("Max Output: %d", output_data);

        // Test with all equal values
        input_data_00 = 8'd50;
        input_data_01 = 8'd50;
        input_data_10 = 8'd50;
        input_data_11 = 8'd50;
        #10;
        $display("Max Output: %d", output_data);

        // End of test
        $finish;
    end

endmodule
