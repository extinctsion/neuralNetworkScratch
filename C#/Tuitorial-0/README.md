# Simple Neuron Simulation in C#

This project demonstrates how a basic neuron works in a neural network using C#. The neuron takes a 4-dimensional input vector and applies random weights and biases to generate outputs.

## Neuron Concept

A neuron in a neural network typically consists of:
- **Input vector**: A series of values representing features of data.
- **Weight vector**: Coefficients that are applied to each input. Each weight influences the strength of the corresponding input.
- **Bias**: A value added to the weighted sum to adjust the output.
- **Activation**: In this example, we are not applying an activation function, but the neuron calculates a simple weighted sum.

## Code Overview

The C# code initializes:
- A 4-dimensional input vector with predefined values.
- Random weights for three sets of outputs using `Random()`.
- Bias values set to 0.
  
The code then calculates the weighted sum for each output and displays the results.

### Inputs

```csharp
List<double> inputs = new List<double> { 1.0, 2.0, 3.0, 2.5 };
