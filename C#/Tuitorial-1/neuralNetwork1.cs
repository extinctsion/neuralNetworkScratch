using System;
using System.Collections.Generic;
using System.Linq;

class NeuralNetwork
{
    static void Main(string[] args)
    {
        // Initialize inputs
        List<double> inputs = new List<double> { 1, 2, 3, 2.5 };

        // Initialize weights and biases
        List<List<double>> weights = new List<List<double>> {
            GenerateRandomWeights(4),
            GenerateRandomWeights(4),
            GenerateRandomWeights(4)
        };

        List<double> biases = new List<double> { 0, 0, 0 };

        // Calculate the output of each neuron
        List<double> layerOutput = weights.Select((neuronWeights, index) =>
            NeuronOutput(inputs, neuronWeights, biases[index])
        ).ToList();

        // Print the output of the layer
        Console.WriteLine(string.Join(", ", layerOutput.Select(o => Math.Round(o, 4))));
    }

    static double NeuronOutput(List<double> inputs, List<double> weights, double bias)
    {
        return inputs.Zip(weights, (input, weight) => input * weight).Sum() + bias;
    }

    static List<double> GenerateRandomWeights(int length)
    {
        Random random = new Random();
        return Enumerable.Range(0, length).Select(_ => random.NextDouble()).ToList();
    }
}
