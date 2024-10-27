# Neural Network with Dense Layers and ReLU Activation
This repository demonstrates the creation of a neural network with dense layers and a ReLU activation function. It uses a spiral dataset for multi-class classification, a popular dataset for testing neural network structures in machine learning.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This script sets up a simple neural network with:
- Dense Layers (fully connected layers) represented by the `Layer_Dense` class, each initialized with random weights and biases.
- ReLU Activation Function implemented in the `Activation_ReLU` class to introduce non-linearity by setting all negative values to zero.
- It also generates data using the `spiral_data` function from the `nnfs.datasets` module to train a multi-class classifier.

## Requirements
Ensure that all required packages are installed by running:
```bash
pip install -r requirement.py
```
Additionally, this script uses `nnfs`, a library that includes datasets and other helper functions for neural networks. You can install it using:
```bash
pip install nnfs
```

## Code Explanation
### Dense Layer Class (`Layer_Dense`)
- Weights Initialization: The weights are initialized using small random values.
- Bias Initialization: Biases are set to zero initially.
- Forward Propagation: The `forward` method computes the dot product of inputs and weights, adds biases, and stores the result.
### ReLU Activation Function (`Activation_ReLU`)
- This activation function outputs the maximum value between 0 and the input, setting any negative values to zero to introduce non-linearity in the model.
### Example Code
```python
from requirement import *
from nnfs.datasets import spiral_data

nnfs.init()

X, y = spiral_data(100, 3)
class Layer_Dense:
    def __init__(self, n_inputs, n_neurons):
        self.weights = 0.10 * np.random.randn(n_inputs, n_neurons)
        self.biases = np.zeros((1, n_neurons))
    def forward(self, inputs):
        self.output = np.dot(inputs, self.weights) + self.biases

class Activation_ReLU:
    def forward(self, inputs):
        self.output = np.maximum(0, inputs)

layer1 = Layer_Dense(2, 5)
activation1 = Activation_ReLU()
layer1.forward(X)
activation1.forward(layer1.output)
print(layer1.output)
```
## Usage
1. Clone this repository.
2. Run the script to see the output after forward propagation and ReLU activation.
```bash
python script.py
```
## Contributing
Contributions are welcome! Fork the repository and submit a pull request for improvements or additional functionality.

## License
This project is open-source under the MIT License. See the LICENSE file for more details.