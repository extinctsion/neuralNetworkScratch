# Neural Network Batch Output Calculation

This repository demonstrates how to compute the output of a neural network layer with multiple inputs (batches), weights, and biases. It showcases how forward propagation is carried out in batches, a key process in training neural networks.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

In this script, the neural network layer calculates its output by utilizing multiple sets of inputs (batches), each associated with specific weights and biases. This approach mimics the way a neural network processes several samples simultaneously during the training phase. To manage these batch computations effectively, matrix operations are employed.

## Requirements

Before running the script, ensure that all necessary packages are installed. The dependencies are managed in the `requirement.py` file. To install them, run:

```bash
pip install -r requirement.py
```

## Key Function
- **Dot Product and Bias Addition**: In the script, the dot product is performed using `np.dot()`, which multiplies the inputs by the weights (with weights transposed to match dimensions), and then the biases are added to compute the final output.

## Example
```python
import numpy as np
inputs = [
    [1, 2, 3, 2.5],
    [2.0, 5.0, -1.0, 2.0],
    [-1.5, 2.7, 3.3, -0.8]
]
weights = [
    [0.2, 0.8, -0.5, 1.0],
    [0.5, -0.91, 0.26, -0.5],
    [-0.26, -0.27, 0.17, 0.87]
]
biases = [2, 3, 0.5]
output = np.dot(inputs, np.array(weights).T) + biases
print(output)
```