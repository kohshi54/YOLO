module MemoryManager (
    input clk,               // Clock signal
    input rst_n,             // Active low reset signal
    input [15:0] data_in,    // 16-bit data input
    input [15:0] address,    // 16-bit address for memory access
    input write_enable,      // Signal to write data
    input [1:0] mem_select,  // 2-bit signal to select which memory block to access: 00-Weights, 01-Intermediate, 10-I/O buffer
    output reg [15:0] data_out  // 16-bit data output
);

    // SRAM blocks (assuming 64K 16-bit words for each memory type as an example)
    reg [15:0] weights_memory[0:65535];
    reg [15:0] intermediate_memory[0:65535];
    reg [15:0] io_buffer[0:65535];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_out <= 16'b0;
        end else begin
            case (mem_select)
                2'b00: // Weights Memory
                    if (write_enable)
                        weights_memory[address] <= data_in;
                    else
                        data_out <= weights_memory[address];
                2'b01: // Intermediate Results Memory
                    if (write_enable)
                        intermediate_memory[address] <= data_in;
                    else
                        data_out <= intermediate_memory[address];
                2'b10: // I/O Buffer
                    if (write_enable)
                        io_buffer[address] <= data_in;
                    else
                        data_out <= io_buffer[address];
            endcase
        end
    end

endmodule

/*
Description:
The module MemoryManager manages three separate memory blocks: weights_memory for storing neural network parameters, intermediate_memory for storing intermediate results, and io_buffer for input and output data.
The module can read from or write to any of the memory blocks based on the mem_select signal and the address provided.
*/
