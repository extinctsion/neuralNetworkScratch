# Neural Network Batch Processing with Multiple Layers
This repository demonstrates how to compute the outputs of a neural network in batches, layer by layer, using weights and biases. This setup exemplifies forward propagation, where each layer processes data through efficient matrix operations.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This script models the forward propagation of data through a neural network with two layers. Each layer applies its own set of weights and biases, processing the data in batches to simulate training or inference. Batch processing allows multiple samples to be processed at once, enhancing computational efficiency.

## Requirements
Install all necessary packages listed in requirement.py by running:

```bash
pip install -r requirement.py
```

## Code Explanation
### Layer Calculations
Each layer’s output is computed using a dot product between inputs (or previous layer outputs) and weights, followed by bias addition:
- Layer 1: Processes the initial batch of inputs.
- Layer 2: Takes Layer 1’s output as its input.

### Key Operations
- Dot Product: Calculated with np.dot(), enabling matrix multiplication between inputs and weights.
- Bias Addition: Biases are added to the dot product result, finalizing each layer’s output.
### Example
```python
from requirement import *
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
weights2 = [
    [0.1, -0.14, 0.5],
    [-0.5, 0.12, -0.33],
    [-0.44, 0.73, -0.13]
]
biases2 = [-1, 2, -0.5]
layer1_outputs = np.dot(inputs, np.array(weights).T) + biases
layer2_outputs = np.dot(layer1_outputs, np.array(weights2).T) + biases2

print(layer2_outputs)
```
## Usage
Clone this repository, install dependencies, and run the script to observe outputs for each layer. This approach can scale to additional layers or larger datasets as needed.
```bash
python script.py
```
## Contributing
Feel free to fork this repository and submit pull requests for any improvements, bug fixes, or additional functionality.

## License
This project is open source and available under the MIT License. See the LICENSE file for more details.