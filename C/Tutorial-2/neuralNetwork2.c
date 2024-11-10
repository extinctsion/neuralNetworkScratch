#include <stdio.h>

#define NUM_INPUTS 4
#define NUM_NEURONS 3

int main() {
  float inputs[NUM_INPUTS] = {1.0, 2.0, 3.0, 2.5};

  float weights[NUM_NEURONS][NUM_INPUTS] = {
    {0.2, 0.8, -0.5, 1.0},
    {0.5, -0.91, 0.26, -0.5},
    {-0.26, -0.27, 0.17, 0.87}
  };
  float biases[NUM_NEURONS] = {2.0, 3.0, 0.5};
  float output[NUM_NEURONS];
  
  for (int i = 0; i < NUM_NEURONS; ++i) {
    output[i] = 0.0;
    for (int j = 0; j < NUM_INPUTS; ++j) {
      output[i] += weights[i][j] * inputs[j];
    }
    output[i] += biases[i];
  }
  printf("Output:\n");
  for (int i = 0; i < NUM_NEURONS; ++i) {
    printf("%.2f\n", output[i]);
  }

  return 0;
}