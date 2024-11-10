# Neural Network Layer Implementation in C

This repository provides a basic implementation of a single neural network layer in C.

## Introduction

This code simulates a simple neural network layer with three neurons. Each neuron takes a shared input vector and computes its output using weighted sums and a bias term. The final output of the layer is a vector containing the individual neuron outputs.

## Requirements

- A C compiler (e.g., GCC)

## Code Explanation

1. **Input Initialization**: A four-element input vector is defined.
2. **Weight and Bias Initialization**: Weights and biases are initialized with specific values. You can adjust these as needed.
3. **Neuron Output Calculation**: The `neuron_output` function (implied by the nested loops) calculates the weighted sum of inputs and adds the bias.
4. **Layer Output Calculation**: The outer loop iterates over each neuron, calculating its output and storing it in the output array.
5. **Output Printing**: The final layer output is printed to the console.

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
Output:
4.80
1.21
2.38
```

## License

This project is licensed under the MIT License.
