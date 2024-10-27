# Simple Neural Network Neuron Output Calculation in C
This repository demonstrates the basics of calculating the output of neurons in a neural network using C. Here, a single layer of three neurons processes an input vector using randomized weights and biases to simulate a forward pass in a simple neural network.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This project simulates a simple neural network layer with three neurons, each receiving the same input vector. Each neuron calculates an output based on its weights, the input, and a bias. This demonstration provides insight into how neural networks calculate outputs in their layers.

## Requirements
This code requires a standard C compiler (like GCC). There are no external libraries, so the code is portable across most systems with basic C support.

## Code Explanation
1. Input Initialization: We define a four-element input vector for each neuron to process.
2. Random Weight Initialization: Each neuron has a unique set of four weights initialized randomly.
3. Bias Initialization: Biases are set to zero, but this can be modified as desired.
4. Output Calculation: For each neuron, the weighted sum of inputs is calculated, and the bias is added to get the neuron’s output.
5. Rounded Output: The output values are printed to four decimal places.

## Compilation and Execution
To compile and execute the code:
```bash
gcc neural_network.c -o neural_network
./neural_network
```
## Example Output
After running, you’ll get an output similar to:
```csharp
The output is: 3.1199 1.9801 2.4341 
```
Each value represents the output of a neuron after processing the input vector with its weights and bias.

## License
This project is licensed under the MIT License. See the LICENSE file for details.