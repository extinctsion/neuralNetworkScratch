# Neural Network with Dense Layers
This repository demonstrates the implementation of a neural network with two dense layers. Each dense layer is initialized with random weights and biases, and forward propagation is performed to compute the output of each layer. This setup uses object-oriented programming principles to define each layer as an instance of the `Layer_Dense` class.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This script models a simple neural network with two dense layers. Each layer is represented by the Layer_Dense class, which initializes weights and biases for each neuron and processes inputs through forward propagation. The forward method performs a dot product between the inputs and weights, then adds biases to produce the layer's output.

## Requirements
Ensure all necessary packages are installed by running:
```bash
pip install -r requirement.py
```
## Code Explanation
### Layer Class
The neural network's dense layer is implemented in the Layer_Dense class:
- Weights Initialization: The weights are randomly initialized and scaled by 0.1 for small initial values, which aids in convergence.
- Bias Initialization: Biases are set to zero initially for simplicity.
- Forward Propagation: The forward method calculates the output as a dot product of inputs and weights plus biases.

### Example Code
```python
from requirement import *

np.random.seed(0)
X = [
    [1, 2, 3, 2.5],
    [2.0, 5.0, -1.0, 2.0],
    [-1.5, 2.7, 3.3, -0.8]
]

class Layer_Dense:
    def __init__(self, n_inputs, n_neurons):
        self.weights = 0.10 * np.random.randn(n_inputs, n_neurons)
        self.biases = np.zeros((1, n_neurons))

    def forward(self, inputs):
        self.output = np.dot(inputs, self.weights) + self.biases

layer1 = Layer_Dense(4, 5)
layer2 = Layer_Dense(5, 2)
layer1.forward(X)
layer2.forward(layer1.output)

print(layer2.output)
```
## Usage
Clone this repository and run the script to observe the forward propagation output through each dense layer. This code can be easily extended to more layers or modified with different input values.
```bash
python script.py
```

## Contributing
Feel free to fork this repository and submit pull requests for improvements, bug fixes, or additional functionality.

## License
This project is open source and available under the MIT License. See the LICENSE file for more details.


