module ControlUnit (
    input clk,                   // Clock signal
    input rst_n,                 // Active low reset signal
    output reg fetch_input,      // Signal to fetch input data
    output reg conv_enable,      // Signal to start convolution operation
    output reg pool_enable,      // Signal to start pooling operation
    output reg activation_enable, // Signal to start activation function
    output reg fc_enable,        // Signal to start fully connected layer operation
    output reg detect_enable     // Signal to start detection layer operation
);

    // Define states
    typedef enum {
        IDLE,
        FETCH_INPUT,
        CONV_LAYER,
        POOL_LAYER,
        ACTIVATION_LAYER,
        FC_LAYER,
        DETECT_LAYER
    } states_t;

    states_t state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= IDLE;
        else state <= next_state;
    end

    always @(*) begin
        // Default values
        fetch_input = 0;
        conv_enable = 0;
        pool_enable = 0;
        activation_enable = 0;
        fc_enable = 0;
        detect_enable = 0;

        case (state)
            IDLE: begin
                fetch_input = 1;
                next_state = FETCH_INPUT;
            end

            FETCH_INPUT: begin
                conv_enable = 1;
                next_state = CONV_LAYER;
            end

            CONV_LAYER: begin
                pool_enable = 1;
                next_state = POOL_LAYER;
            end

            POOL_LAYER: begin
                activation_enable = 1;
                next_state = ACTIVATION_LAYER;
            end

            ACTIVATION_LAYER: begin
                fc_enable = 1;
                next_state = FC_LAYER;
            end

            FC_LAYER: begin
                detect_enable = 1;
                next_state = DETECT_LAYER;
            end

            DETECT_LAYER: begin
                // End of the process, return to idle or another appropriate state
                next_state = IDLE;
            end
        endcase
    end

endmodule

/*
Description:
The module ControlUnit is a finite state machine (FSM) that generates control signals to manage the flow of data and operations in the neural network processing system.
Based on the current state, the CU sets the appropriate control signals and decides the next state.
For simplicity, the transitions between states are immediate in this design. In a real-world scenario, additional logic would be necessary to determine when each module completes its operation and is ready for the next one.
*/
