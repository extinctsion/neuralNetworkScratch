#include <iostream>
#include <vector>
#include <numeric> // for std::inner_product
#include <cstdlib> // for rand()
#include <ctime>   // for seeding random

// Function to calculate neuron output
double neuron_output(const std::vector<double>& inputs, const std::vector<double>& weights, double bias) {
    return std::inner_product(inputs.begin(), inputs.end(), weights.begin(), 0.0) + bias;
}

int main() {
    // Seed the random generator
    std::srand(static_cast<unsigned>(std::time(0)));

    // Initialize inputs
    std::vector<double> inputs = {1, 2, 3, 2.5};

    // Initialize weights (randomly generated)
    std::vector<std::vector<double>> weights = {
        {static_cast<double>(std::rand()) / RAND_MAX, static_cast<double>(std::rand()) / RAND_MAX, 
         static_cast<double>(std::rand()) / RAND_MAX, static_cast<double>(std::rand()) / RAND_MAX},
        {static_cast<double>(std::rand()) / RAND_MAX, static_cast<double>(std::rand()) / RAND_MAX, 
         static_cast<double>(std::rand()) / RAND_MAX, static_cast<double>(std::rand()) / RAND_MAX},
        {static_cast<double>(std::rand()) / RAND_MAX, static_cast<double>(std::rand()) / RAND_MAX, 
         static_cast<double>(std::rand()) / RAND_MAX, static_cast<double>(std::rand()) / RAND_MAX}
    };

    // Initialize biases
    std::vector<double> biases = {0, 0, 0};

    // Calculate the output of each neuron
    std::vector<double> layer_output;
    for (size_t i = 0; i < weights.size(); ++i) {
        layer_output.push_back(neuron_output(inputs, weights[i], biases[i]));
    }

    // Print the output of the layer
    std::cout << "Layer output: ";
    for (double output : layer_output) {
        std::cout << std::round(output * 10000) / 10000 << " "; // Round to 4 decimal places
    }
    std::cout << std::endl;

    return 0;
}
