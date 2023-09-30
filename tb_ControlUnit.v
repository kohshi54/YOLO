module tb_ControlUnit();

    reg clk;
    reg rst_n;
    wire fetch_input, conv_enable, pool_enable, activation_enable, fc_enable, detect_enable;

    // Instantiate the ControlUnit
    ControlUnit uut (
        .clk(clk),
        .rst_n(rst_n),
        .fetch_input(fetch_input),
        .conv_enable(conv_enable),
        .pool_enable(pool_enable),
        .activation_enable(activation_enable),
        .fc_enable(fc_enable),
        .detect_enable(detect_enable)
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

        // Observe the control signals for a few clock cycles
        repeat (20) #10;

        // Display the state of control signals
        $display("Fetch Input: %b", fetch_input);
        $display("Conv Enable: %b", conv_enable);
        $display("Pool Enable: %b", pool_enable);
        $display("Activation Enable: %b", activation_enable);
        $display("FC Enable: %b", fc_enable);
        $display("Detect Enable: %b", detect_enable);

        // End of test
        $finish;
    end

endmodule
