"""
This module defines a dense layer for a neural network and demonstrates
its use with random input data.
"""

import numpy as np

# Initialize random seed
np.random.seed(0)

# Define input data
X = [[1, 2, 3, 2.5],
     [2.0, 5.0, -1.0, 2.0],
     [-1.5, 2.7, 3.3, -0.8]]  # Initializing inputs

class LayerDense:
    """
    A dense layer for a neural network that performs a linear transformation
    on input data, storing weights and biases.
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

# Create layers
layer1 = LayerDense(4, 5)
layer2 = LayerDense(5, 2)

# Perform forward pass through each layer
layer1.forward(X)
layer2.forward(layer1.output)

# Output from layer 2
print(layer2.output)
