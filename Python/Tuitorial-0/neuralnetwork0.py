from typing import List
import numpy as np

"""
This module demonstrates the workings of a simple neuron in a neural network. 
It includes a three-dimensional input vector, corresponding weights, and biases 
to calculate the output of three neurons.
"""

# Initialize inputs
inputs: List[float] = [1.0, 2.0, 3.0, 2.5]

# Initialize weights randomly for each neuron
weights1: List[float] = np.random.rand(4)
weights2: List[float] = np.random.rand(4)
weights3: List[float] = np.random.rand(4)

# Initialize biases to zero
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
