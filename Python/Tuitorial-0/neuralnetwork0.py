from typing import List
import numpy as np

"""
This script demonstrates how a neuron works by performing calculations with inputs, 
weights, and biases. It creates a simple neural network with 3 neurons.
"""

# Inputs, weights, and biases for a neural network with 3 neurons.
inputs: List[float] = [1.0, 2.0, 3.0, 2.5]  # initializing inputs

# Initializing weights randomly for each neuron
weights1: List[float] = np.random.rand(4)
weights2: List[float] = np.random.rand(4)
weights3: List[float] = np.random.rand(4)

# Biases initialization as 0
bias1: float = 0
bias2: float = 0
bias3: float = 0

# Calculate the output for each neuron
output: List[float] = [
    (inputs[0] * weights1[0] + inputs[1] * weights1[1] + inputs[2] * weights1[2] +
     inputs[3] * weights1[3] + bias1),
    (inputs[0] * weights2[0] + inputs[1] * weights2[1] + inputs[2] * weights2[2] +
     inputs[3] * weights2[3] + bias2),
    (inputs[0] * weights3[0] + inputs[1] * weights3[1] + inputs[2] * weights3[2] +
     inputs[3] * weights3[3] + bias3),
]

# Print rounded output values
print(f"The output is: {np.round(output, 4)}")
