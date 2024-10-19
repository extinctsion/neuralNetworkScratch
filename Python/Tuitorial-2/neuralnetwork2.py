import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from requirement import *

"""
This module demonstrates a simple neural network layer computation.
It calculates the output using inputs, weights, and biases.
"""

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

inputs = [1, 2, 3, 2.5]  # Initialising inputs

# Weights initialisation
weights = [
    [0.2, 0.8, -0.5, 1.0],
    [0.5, -0.91, 0.26, -0.5],
    [-0.26, -0.27, 0.17, 0.87]
]

biases = [2, 3, 0.5]

output = np.dot(weights, inputs) + biases
print(output)