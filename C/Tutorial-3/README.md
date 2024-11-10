# Neural Network Layer Implementation in C
This repository provides a basic implementation of a single neural network layer in C.

## Introduction
This code simulates a simple neural network layer with three neurons. Each neuron takes a shared input vector and computes its output using weighted sums and a bias term. The final output of the layer is a vector containing the individual neuron outputs.

## Requirements
- A C compiler (e.g., GCC)

## Code Explanation
The code performs the following steps:
1. Input and Weight Initialization: 
- Defines the input data, weights, and biases as arrays.
2. Forward Propagation: 
- Iterates over each input sample and neuron.
- Calculates the dot product of the input and weights.
- Adds the bias to the result.
- Stores the final output.
3. Output Printing:
- Prints the calculated outputs for each input sample.

## Compilation and Execution
1. Compile:
```bash
gcc neural_network_layer.c -o neural_network_layer
```
2. Run:
```bash
./neural_network_layer
```
## Example Output
Running the program will produce an output similar to:
```csharp
4.80 1.21 2.38 
8.90 -1.81 0.20 
1.41 1.05 0.03
```
## License
This project is licensed under the MIT License.