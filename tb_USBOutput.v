module tb_USBOutput();

    reg clk;
    reg [23:0] data_in;
    reg data_valid;
    wire usb_ready;
    wire usb_data_out;
    wire usb_data_valid;

    // Instantiate the USBOutput
    USBOutput uut (
        .clk(clk),
        .data_in(data_in),
        .data_valid(data_valid),
        .usb_ready(usb_ready),
        .usb_data_out(usb_data_out),
        .usb_data_valid(usb_data_valid)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test procedure
    initial begin
        clk = 0;
        data_valid = 0;

        // Wait a few cycles
        #20;

        // Send a sample data to USB
        data_in = 24'hAABBCC;
        data_valid = 1'b1;
        #10 data_valid = 1'b0;
        #10 $display("USB Data Out: %h, Valid: %b, USB Ready: %b", usb_data_out, usb_data_valid, usb_ready);

        // Send another sample data to USB
        data_in = 24'h112233;
        data_valid = 1'b1;
        #10 data_valid = 1'b0;
        #10 $display("USB Data Out: %h, Valid: %b, USB Ready: %b", usb_data_out, usb_data_valid, usb_ready);

        // End of test
        $finish;
    end

endmodule
