# Simple Neural Network Layer in C#

This is a simple implementation of a single layer in a neural network, written in C#. It calculates the output of neurons by performing a weighted sum of inputs, followed by adding a bias. This example demonstrates basic matrix operations in C# for simulating how a neural network layer processes inputs.

## How It Works

1. **Inputs**: A list of input values is provided, which represents data that the neural network layer will process.
2. **Weights**: Each neuron in the layer has a set of weights. In this example, the weights are randomly generated using the `Random` class in C#.
3. **Biases**: Each neuron has a bias, which is a constant value added to the weighted sum of inputs.
4. **Output Calculation**: For each neuron, the output is calculated as:

    \[
    \text{output} = (\sum \text{input} \times \text{weight}) + \text{bias}
    \]

    The result is rounded to 4 decimal places for display.

## Code Structure

- `NeuronOutput`: A function that takes in the inputs, weights, and bias for a neuron and returns the calculated output.
- `GenerateRandomWeights`: A helper function to generate random weights for each neuron.
- The program initializes inputs, random weights, and biases, then calculates and prints the layer's output.

## Example

Here’s an example of how the inputs and outputs would look:

### Inputs:

```csharp
List<double> inputs = new List<double> { 1, 2, 3, 2.5 };
