"""
This module demonstrates a simple neural network with a dense layer and
ReLU activation, using a spiral dataset for input data.
"""

import numpy as np
from nnfs.datasets import spiral_data
import nnfs

# Initialize nnfs and set random seed for reproducibility
nnfs.init()

# Generate sample data
X, y = spiral_data(100, 3)

class LayerDense:
    """
    A dense layer for a neural network, performing a linear transformation
    on input data with weights and biases.
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

# Initialize layers
layer1 = LayerDense(2, 5)
activation1 = ActivationReLU()

# Perform forward pass
layer1.forward(X)
activation1.forward(layer1.output)

# Print the output of layer 1
print(layer1.output)
