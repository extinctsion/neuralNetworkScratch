# Neural Network Layer Calculation

This project demonstrates a simple implementation of calculating the output of a single layer of neurons in a neural network using Python. The script randomly generates weights for each neuron and computes the output of each neuron in the layer based on the provided inputs.

## How It Works

- **Inputs:** A list of input values is defined to simulate the inputs to the neurons.
- **Weights:** The weights for each neuron are randomly generated using `numpy`.
- **Biases:** Each neuron has a bias term initialized to zero in this example.
- **Neuron Output:** The output of each neuron is calculated as the weighted sum of its inputs plus the bias.
  
The formula for a neuron's output is:

\[ \text{output} = (\sum \text{inputs} \times \text{weights}) + \text{bias} \]

### Key Functions

- **`neuron_output`**: This function takes in the inputs, weights, and bias of a neuron and returns its output.

### Example Code

```python
from typing import List
import numpy as np

inputs: List[float] = [1, 2, 3, 2.5]

weights: List[List[float]] = [
    np.random.rand(4),
    np.random.rand(4),
    np.random.rand(4)
]

biases: List[float] = [0, 0, 0]

def neuron_output(_inputs: List[float], _weights: List[float], bias: float) -> float:
    return sum(n_input * weight for n_input, weight in zip(_inputs, _weights)) + bias

layer_output: List[float] = [neuron_output(inputs, neuron_weights, neuron_bias)
                              for neuron_weights, neuron_bias in zip(weights, biases)]

print(np.round(layer_output, 4))
