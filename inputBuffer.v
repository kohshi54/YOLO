module InputBuffer (
    input clk,              // Clock signal
    input rst_n,            // Active low reset signal
    input [23:0] pixel_data, // 24-bit RGB pixel data input
    input [10:0] x_coord,   // 11-bit x-coordinate (0 to 1919)
    input [10:0] y_coord,   // 11-bit y-coordinate (0 to 1079)
    input write_enable,     // Signal to write data
    output reg [23:0] read_data  // 24-bit RGB pixel data output
);

    // Define the memory for the 1080p image (1920x1080 pixels, each 24 bits)
    reg [23:0] image_memory [0:1919][0:1079];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            read_data <= 24'b0;
        end else if (write_enable) begin
            image_memory[x_coord][y_coord] <= pixel_data;
        end else begin
            read_data <= image_memory[x_coord][y_coord];
        end
    end

endmodule

/*
Description:
This module, InputBuffer, serves as an SRAM-like storage for the input image.
The image's pixel data can be written into the buffer using the pixel_data, x_coord, and y_coord inputs along with the write_enable signal.
The data for any pixel can be read out by providing its x_coord and y_coord, and the pixel data is available on the read_data output.
This module does not implement any error-checking for out-of-bounds coordinates; such checks might be added for a more robust design.
*/
