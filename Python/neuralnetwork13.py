"""
Applying categorical Cross Entropy to nnfs framework.
"""

import numpy as np
import nnfs
from nnfs.datasets import spiral_data

# Initialize nnfs and set random seed for reproducibility
nnfs.init()

class LayerDense:
    """Dense layer in a neural network."""
    
    def __init__(self, n_inputs, n_neurons):
        self.weights = 0.01 * np.random.randn(n_inputs, n_neurons)
        self.biases = np.zeros((1, n_neurons))
        self.output = None  # Initialize output attribute in __init__

    def forward(self, inputs):
        """Calculate the output of the layer given the inputs."""
        self.output = np.dot(inputs, self.weights) + self.biases


class ActivationReLU:
    """ReLU activation function."""
    
    def __init__(self):
        self.output = None  # Initialize output attribute in __init__

    def forward(self, inputs):
        """Apply ReLU activation function."""
        self.output = np.maximum(0, inputs)


class ActivationSoftmax:
    """Softmax activation function."""
    
    def __init__(self):
        self.output = None  # Initialize output attribute in __init__

    def forward(self, inputs):
        """Apply softmax activation function."""
        exp_values = np.exp(inputs - np.max(inputs, axis=1, keepdims=True))
        probabilities = exp_values / np.sum(exp_values, axis=1, keepdims=True)
        self.output = probabilities


class Loss:
    """Base class for loss functions."""
    
    def forward(self, output, y):
        """
        This function should be overridden by subclasses to calculate
        the loss based on predictions and ground-truth labels.
        """
        raise NotImplementedError("The forward method must be implemented in subclasses.")
    
    def calculate(self, output, y):
        """Calculate the loss."""
        sample_losses = self.forward(output, y)
        data_loss = np.mean(sample_losses)
        return data_loss


class LossCategoricalCrossEntropy(Loss):
    """Categorical Cross-Entropy loss."""
    
    def forward(self, y_pred, y_true):
        """Calculate the loss given predictions and true labels."""
        samples = len(y_pred)
        y_pred_clipped = np.clip(y_pred, 1e-7, 1 - 1e-7)

        if len(y_true.shape) == 1:
            correct_confidences = y_pred_clipped[range(samples), y_true]
        elif len(y_true.shape) == 2:
            correct_confidences = np.sum(y_pred_clipped * y_true, axis=1)
        else:
            raise ValueError("Unexpected shape for y_true")

        negative_log_likelihoods = -np.log(correct_confidences)
        return negative_log_likelihoods


# Generate spiral data
X, y_labels = spiral_data(samples=100, classes=3)

# Create layers and activations
dense1 = LayerDense(2, 3)
activation1 = ActivationReLU()

dense2 = LayerDense(3, 3)
activation2 = ActivationSoftmax()

# Forward pass through the layers
dense1.forward(X)
activation1.forward(dense1.output)

dense2.forward(activation1.output)
activation2.forward(dense2.output)

print(activation2.output[:5])

# Calculate loss
loss_function = LossCategoricalCrossEntropy()
loss = loss_function.calculate(activation2.output, y_labels)

print("Loss:", loss)
