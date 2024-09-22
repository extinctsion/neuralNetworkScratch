#Batches, layers and Objects.
# Getting outputs in batches.

from requirement import *

inputs = [[1,2,3,2.5],
          [2.0,5.0,-1.0,2.0],
          [-1.5,2.7,3.3,-0.8]] #initialising inputs

# weights initialisation
weights = [[0.2,0.8,-0.5,1.0],
            [0.5, -0.91, 0.26, -0.5],
            [-0.26, -0.27, 0.17, 0.87]]

biases = [2,3,0.5]

output = np.dot(inputs, np.array(weights).T) + biases

print(output)