#include <stdio.h>

int main() {
  float inputs[][4] = {{1, 2, 3, 2.5}, {2.0, 5.0, -1.0, 2.0}, {-1.5, 2.7, 3.3, -0.8}};
  int num_inputs = sizeof(inputs) / sizeof(inputs[0]);

  float weights[3][4] = {{0.2, 0.8, -0.5, 1.0}, {0.5, -0.91, 0.26, -0.5}, {-0.26, -0.27, 0.17, 0.87}};
  float biases[3] = {2, 3, 0.5};

  for (int i = 0; i < num_inputs; i++) {
    for (int j = 0; j < 3; j++) {
      float output = 0.0;
      for (int k = 0; k < 4; k++) {
        output += inputs[i][k] * weights[j][k];
      }
      output += biases[j];
      printf("%.2f ", output);
    }
    printf("\n");
  }

  return 0;
}