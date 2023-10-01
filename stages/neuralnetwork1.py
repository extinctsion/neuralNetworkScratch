"""Created by extinctsion, Edited by Tinny-Robot"""
from typing import List
import numpy as np

# initialize inputs
inputs: List[float] = [1, 2, 3, 2.5]

# initialize weights and biases
weights: List[List[float]] = [
    np.random.rand(4),
    np.random.rand(4),
    np.random.rand(4)
    ]


biases: List[float] = [0, 0, 0]

# calculate the output of each neuron using a generator
def neuron_output(_inputs: List[float], _weights: List[float], bias: float) -> float:
    return sum(n_input * weight for n_input, weight in zip(_inputs, _weights)) + bias

layer_output: List[float] = [neuron_output(inputs, neuron_weights, neuron_bias)
                              for neuron_weights, neuron_bias in zip(weights, biases)]

# print the output of the layer
print(np.round(layer_output,4))
