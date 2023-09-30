module tb_InputBuffer();

    reg clk;
    reg rst_n;
    reg [23:0] pixel_data;
    reg [10:0] x_coord, y_coord;
    reg write_enable;
    wire [23:0] read_data;

    // Instantiate the InputBuffer
    InputBuffer uut (
        .clk(clk),
        .rst_n(rst_n),
        .pixel_data(pixel_data),
        .x_coord(x_coord),
        .y_coord(y_coord),
        .write_enable(write_enable),
        .read_data(read_data)
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

        // Test writing to the buffer
        pixel_data = 24'hFFFFFF; // white pixel
        x_coord = 5;
        y_coord = 5;
        write_enable = 1;
        #10;

        // Test reading from the buffer
        write_enable = 0;
        #10;
        $display("Read data at (5,5): %h", read_data);

        // End of test
        $finish;
    end

endmodule
