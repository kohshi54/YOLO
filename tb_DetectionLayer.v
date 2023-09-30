module tb_DetectionLayer();

    // Parameters for bounding boxes and classes for this test
    parameter B = 3;   // Number of bounding boxes per grid cell
    parameter C = 20;  // Number of classes

    reg [15:0] raw_predictions[B*(5+C)-1:0];
    wire [15:0] bounding_boxes[B*4-1:0];
    wire [15:0] objectness_scores[B-1:0];

    // Instantiate the DetectionLayer
    DetectionLayer uut (
        .raw_predictions(raw_predictions),
        .bounding_boxes(bounding_boxes),
        .objectness_scores(objectness_scores)
    );

    // Test procedure
    initial begin
        // Provide sample raw predictions
        // ... (you'd supply sample values here)

        #10;  // Allow processing time
        $display("Bounding boxes and objectness scores:");
        for (int i = 0; i < B; i = i + 1) begin
            $display("Box %d - x: %d, y: %d, w: %d, h: %d, obj_score: %d", 
                     i, 
                     bounding_boxes[i*4], bounding_boxes[i*4+1], bounding_boxes[i*4+2], bounding_boxes[i*4+3], 
                     objectness_scores[i]);
        end

        // End of test
        $finish;
    end

endmodule
