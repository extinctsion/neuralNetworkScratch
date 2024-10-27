"""
This module demonstrates a simple neural network with two dense layers, 
using ReLU and Softmax activation functions to process a spiral dataset.
"""

import numpy as np
from nnfs.datasets import spiral_data
import nnfs

# Initialize nnfs and set random seed for reproducibility
nnfs.init()

class LayerDense:
    """
    A dense layer that performs a linear transformation on input data
    with weights and biases.
    """
    
    def __init__(self, n_inputs, n_neurons):
        """
        Initializes weights and biases for the layer.

        Parameters:
        n_inputs (int): Number of input features
        n_neurons (int): Number of neurons in the layer
        """
        self.weights = 0.10 * np.random.randn(n_inputs, n_neurons)
        self.biases = np.zeros((1, n_neurons))
        self.output = None  # Initialize the output attribute

    def forward(self, inputs):
        """
        Performs the forward pass by calculating the layer output.

        Parameters:
        inputs (array-like): Input data for the layer
        """
        self.output = np.dot(inputs, self.weights) + self.biases

class ActivationReLU:
    """
    ReLU activation function layer, setting negative values in input to zero.
    """
    
    def __init__(self):
        self.output = None  # Initialize the output attribute

    def forward(self, inputs):
        """
        Applies the ReLU activation function.

        Parameters:
        inputs (array-like): Input data for activation
        """
        self.output = np.maximum(0, inputs)

class ActivationSoftmax:
    """
    Softmax activation function layer, normalizing inputs to probabilities.
    """
    
    def __init__(self):
        self.output = None  # Initialize the output attribute

    def forward(self, inputs):
        """
        Applies the Softmax activation function.

        Parameters:
        inputs (array-like): Input data for activation
        """
        exp_values = np.exp(inputs - np.max(inputs, axis=1, keepdims=True))
        probabilities = exp_values / np.sum(exp_values, axis=1, keepdims=True)
        self.output = probabilities

# Generate sample data
X, y = spiral_data(samples=100, classes=3)

# Create layers
dense1 = LayerDense(2, 3)
activation1 = ActivationReLU()

dense2 = LayerDense(3, 3)
activation2 = ActivationSoftmax()

# Forward pass through layers
dense1.forward(X)
activation1.forward(dense1.output)

dense2.forward(activation1.output)
activation2.forward(dense2.output)

# Print the output of the Softmax activation for the first five samples
print(activation2.output[:5])
