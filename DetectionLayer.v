module DetectionLayer (
    input clk,                       // Clock signal
    input rst_n,                     // Active low reset signal
    input [15:0] raw_predictions[0:(B*(5+C))-1], // Raw data from the last convolutional layer
    output reg [15:0] bounding_boxes[0:(B*4)-1], // Bounding box coordinates (x, y, w, h for B boxes)
    output reg [15:0] objectness_scores[0:B-1]   // Objectness scores for B boxes
);

    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < B*4; i = i + 1)
                bounding_boxes[i] <= 16'b0;
            for (i = 0; i < B; i = i + 1)
                objectness_scores[i] <= 16'b0;
        end else begin
            // Decoding the bounding box coordinates (using sigmoid function for demonstration)
            for (i = 0; i < B; i = i + 1) begin
                bounding_boxes[i*4]   = sigmoid(raw_predictions[i*(5+C)]);     // x
                bounding_boxes[i*4+1] = sigmoid(raw_predictions[i*(5+C)+1]);   // y
                bounding_boxes[i*4+2] = raw_predictions[i*(5+C)+2];            // w
                bounding_boxes[i*4+3] = raw_predictions[i*(5+C)+3];            // h
                
                objectness_scores[i]  = sigmoid(raw_predictions[i*(5+C)+4]);   // objectness
            end
        end
    end

endmodule

// Placeholder for sigmoid function (would need an actual implementation, potentially using a LUT or other methods)
function [15:0] sigmoid;
    input [15:0] x;
    begin
        // This is a placeholder. A real implementation would calculate: sigmoid(x) = 1 / (1 + exp(-x))
        sigmoid = x; // Placeholder, replace with a real implementation!
    end
endfunction
