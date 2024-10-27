#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define INPUT_SIZE 4
#define NEURONS 3

float random_float() {
    return (float)rand() / RAND_MAX;
}

int main() {
    float inputs[INPUT_SIZE] = {1.0, 2.0, 3.0, 2.5};
    srand(time(NULL));
    float weights[NEURONS][INPUT_SIZE];
    for (int i = 0; i < NEURONS; i++) {
        for (int j = 0; j < INPUT_SIZE; j++) {
            weights[i][j] = random_float();
        }
    }
    float biases[NEURONS] = {0, 0, 0};
    float output[NEURONS] = {0};
    for (int i = 0; i < NEURONS; i++) {
        for (int j = 0; j < INPUT_SIZE; j++) {
            output[i] += inputs[j] * weights[i][j];
        }
        output[i] += biases[i];
    }
    printf("The output is: ");
    for (int i = 0; i < NEURONS; i++) {
        printf("%.4f ", output[i]);
    }
    printf("\n");

    return 0;
}
