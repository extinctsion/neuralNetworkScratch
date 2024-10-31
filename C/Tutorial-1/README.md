# Neural Network Layer Calculation in C
This repository demonstrates the basics of calculating the output of a single neural network layer in C. The program simulates a layer with three neurons, each with unique weights and biases, using a custom function to compute neuron output. This is useful for understanding the foundational mechanics of forward propagation in neural networks.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This program calculates the output of a layer with three neurons, each taking a shared four-element input vector. Each neuron has unique weights, initialized randomly, and biases initialized to zero. The program uses a function to calculate each neuron's output individually and then aggregates these outputs into a layer output.

## Requirements
You’ll need a C compiler (such as GCC) to compile and run this code.

## Code Explanation
1. Input Initialization: A four-element input vector is defined for each neuron to process.
2. Random Weight Initialization: Each neuron is assigned a unique set of weights, initialized randomly.
3. Bias Initialization: All biases are set to zero, but this can be modified.
4. Neuron Output Calculation: The function `neuron_output` calculates the weighted sum of inputs for a neuron, adding the bias.
5. Layer Output Calculation: Each neuron's output is calculated using the input, weights, and bias, then stored in `layer_output`.
6. Output Printing: The outputs are printed, rounded to four decimal places.

## Compilation and Execution
To compile and execute the code, use the following commands:
```bash
gcc neural_network_layer.c -o neural_network_layer
./neural_network_layer
```
## Example Output
Running the program will produce an output similar to:
```csharp
The output of the layer is: 1.2457 2.3098 0.8765
```
Each value represents the output of one neuron after applying the input vector, weights, and bias.

## License
This project is open-source under the MIT License. See the LICENSE file for details.