#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define INPUT_SIZE 4
#define NEURON_COUNT 3

float random_float() {
    return (float)rand() / RAND_MAX;
}

float neuron_output(float inputs[], float weights[], float bias) {
    float output = 0.0;
    for (int i = 0; i < INPUT_SIZE; i++) {
        output += inputs[i] * weights[i];
    }
    output += bias;
    return output;
}

int main() {
    srand(time(NULL));

    float inputs[INPUT_SIZE] = {1, 2, 3, 2.5};

    float weights[NEURON_COUNT][INPUT_SIZE];
    for (int i = 0; i < NEURON_COUNT; i++) {
        for (int j = 0; j < INPUT_SIZE; j++) {
            weights[i][j] = random_float();
        }
    }

    float biases[NEURON_COUNT] = {0, 0, 0};

    float layer_output[NEURON_COUNT];
    for (int i = 0; i < NEURON_COUNT; i++) {
        layer_output[i] = neuron_output(inputs, weights[i], biases[i]);
    }

    printf("The output of the layer is: ");
    for (int i = 0; i < NEURON_COUNT; i++) {
        printf("%.4f ", layer_output[i]);
    }
    printf("\n");

    return 0;
}
