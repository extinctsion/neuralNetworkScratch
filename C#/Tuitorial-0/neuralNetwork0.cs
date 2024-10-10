using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Input vector
        List<double> inputs = new List<double> { 1.0, 2.0, 3.0, 2.5 };

        // Initialize weights randomly using the Random class
        Random rand = new Random();
        List<double> weights1 = new List<double> { rand.NextDouble(), rand.NextDouble(), rand.NextDouble(), rand.NextDouble() };
        List<double> weights2 = new List<double> { rand.NextDouble(), rand.NextDouble(), rand.NextDouble(), rand.NextDouble() };
        List<double> weights3 = new List<double> { rand.NextDouble(), rand.NextDouble(), rand.NextDouble(), rand.NextDouble() };

        // Initialize biases as 0
        double bias1 = 0;
        double bias2 = 0;
        double bias3 = 0;

        // Calculate the output
        List<double> output = new List<double>
        {
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
             + bias3)
        };

        // Output the result
        Console.WriteLine("The output is: [{0}, {1}, {2}]",
            Math.Round(output[0], 4),
            Math.Round(output[1], 4),
            Math.Round(output[2], 4));
    }
}
