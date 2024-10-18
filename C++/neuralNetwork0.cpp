#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <iomanip>

// Function to initialize weights randomly
void initializeWeights(std::vector<double>& weights) {
    for (double & weight : weights) {
        weight = static_cast<double>(rand()) / RAND_MAX; // Random double between 0 and 1
    }
}

// Function to calculate output using inputs, weights, and bias
double calculateOutput(const std::vector<double>& inputs, const std::vector<double>& weights, double bias) {
    double output = 0.0;
    for (size_t i = 0; i < inputs.size(); ++i) {
        output += inputs[i] * weights[i];
    }
    return output + bias;
}

int main() {
    // Seed the random number generator
    srand(static_cast<unsigned>(time(0)));

    // Initialize inputs
    std::vector<double> inputs = {1.0, 2.0, 3.0, 2.5};

    // Randomly initialize weights for 3 neurons
    std::vector<double> weights1(4);
    std::vector<double> weights2(4);
    std::vector<double> weights3(4);
    initializeWeights(weights1);
    initializeWeights(weights2);
    initializeWeights(weights3);

    // Biases initialized as 0
    double bias1 = 0;
    double bias2 = 0;
    double bias3 = 0;

    // Calculate output
    std::vector<double> output(3);
    output[0] = calculateOutput(inputs, weights1, bias1);
    output[1] = calculateOutput(inputs, weights2, bias2);
    output[2] = calculateOutput(inputs, weights3, bias3);

    // Display the output with 4 decimal precision
    std::cout << "The output is: ["
              << std::fixed << std::setprecision(4) << output[0] << ", "
              << std::fixed << std::setprecision(4) << output[1] << ", "
              << std::fixed << std::setprecision(4) << output[2] << "]" << std::endl;

    return 0;
}
