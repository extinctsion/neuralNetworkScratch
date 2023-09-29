"""Created by extinctsion, Edited by Tinny-Robot"""
from typing import List
import numpy as np


# we will write a neural network from scratch.
# a neuron with 3 inputs, 3 biases and different weights.
# gitving 3 outputs.

inputs: List[float] = [1.0, 2.0, 3.0, 2.5]  # initializing inputs

# Initializing weight and bias to alter the output of the neural network

# weights initialization at random
weights1: List[float] = np.random.rand(4)
weights2: List[float] = np.random.rand(4)
weights3: List[float] = np.random.rand(4)

# Biases initialization as 0
bias1: float = 0
bias2: float = 0
bias3: float = 0

# calculate the output
output: List[float] = [
    (inputs[0] * weights1[0]
     + inputs[0] * weights1[1]
     + inputs[0] * weights1[2]
     + inputs[0] * weights1[3]
     + bias1),
    (inputs[0] * weights2[0]
     + inputs[0] * weights2[1]
     + inputs[0] * weights2[2]
     + inputs[0] * weights2[3]
     + bias2),
    (inputs[0] * weights3[0]
     + inputs[0] * weights3[1]
     + inputs[0] * weights3[2]
     + inputs[0] * weights3[3]
     + bias3),
]

print(f"The output is: {np.round(output, 4)}")
