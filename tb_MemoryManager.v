module tb_MemoryManager();

    reg clk;
    reg rst_n;
    reg [15:0] data_in;
    reg [15:0] address;
    reg write_enable;
    reg [1:0] mem_select;  // 00-Weights, 01-Intermediate, 10-I/O buffer
    wire [15:0] data_out;

    // Instantiate the MemoryManager
    MemoryManager uut (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(data_in),
        .address(address),
        .write_enable(write_enable),
        .mem_select(mem_select),
        .data_out(data_out)
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

        // Writing to weights memory
        data_in = 16'h1234;
        address = 16'h0000;
        write_enable = 1'b1;
        mem_select = 2'b00;
        #10;

        // Reading from weights memory
        write_enable = 1'b0;
        #10;
        $display("Weights Memory Read [0]: %h", data_out);

        // Writing to intermediate memory
        data_in = 16'h5678;
        address = 16'h0000;
        write_enable = 1'b1;
        mem_select = 2'b01;
        #10;

        // Reading from intermediate memory
        write_enable = 1'b0;
        #10;
        $display("Intermediate Memory Read [0]: %h", data_out);

        // Writing to I/O buffer
        data_in = 16'h9ABC;
        address = 16'h0000;
        write_enable = 1'b1;
        mem_select = 2'b10;
        #10;

        // Reading from I/O buffer
        write_enable = 1'b0;
        #10;
        $display("I/O Buffer Read [0]: %h", data_out);

        // End of test
        $finish;
    end

endmodule
