# YOLO
Design of YOLO with ASIC  

YOLO Hardware Description:  
1. Input Layer:  
- Module Name: InputBuffer  
- Function: Holds the input image of size 1080p.  
- Components: SRAM blocks to store pixel values, addressing logic.  

2. Convolution Layers:  
- Module Name: Convolution	
- Function: Computes convolution operations.  
- Components:  
Multipliers for weight and input pixel multiplication.  
Adders for summing the products.  
SRAM or registers for storing convolutional kernels (weights).  

3. Activation Layers:  
- Module Name: Activation  
- Function: Implements activation functions like Leaky ReLU.  
- Components: Look-up tables (LUTs) or logic for calculating activation function output.  

4. Pooling Layers:  
- Module Name: Pooling  
- Function: Performs max or average pooling operations.  
- Components: Comparators for max pooling, adders and dividers for average pooling.　　

5. Fully Connected Layers:  
- Module Name: FullyConnected  
- Function: Implements dense layers connecting every neuron to its preceding layer.  
- Components: Multipliers, adders, and SRAM or registers for storing weights and biases.  

6. Detection Layers:　　
- Module Name: Detection  
- Function: Decodes the output of the network into bounding boxes, class probabilities, and objectness scores.  
- Components: Logic for applying thresholding, non-maximum suppression, and other post-processing steps.  

7. Memory Management:  
- Module Name: MemoryController  
- Function: Handles data transfer between SRAM blocks, registers, and processing units.  
- Components: Addressing logic, multiplexers, and data buses.  

8. Control Unit:  
- Module Name: ControlUnit  
- Function: Coordinates the operations of all the aforementioned modules, ensuring they work in the correct sequence and timings.  
- Components: Finite state machine (FSM), clock management, reset logic.  

9. I/O Modules:  
- Module Name: CameraInput, USBOutput  
- Function: Interfaces with external devices, like the camera and USB.  
- Components: Interface logic matching the protocols and standards of the connected devices (e.g., MIPI for camera).  
