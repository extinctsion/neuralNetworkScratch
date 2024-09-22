from requirement import *

# input = [1,2,3,2.5]

# weight = [0.2,0.8,-0.5,1.0]

# bias = 2

# output = np.dot(input, weight) + bias
# print(output)

inputs = [1,2,3,2.5] #initialising inputs

# weights initialisation
weights = [[0.2,0.8,-0.5,1.0],
            [0.5, -0.91, 0.26, -0.5],
            [-0.26, -0.27, 0.17, 0.87]]

biases = [2,3,0.5]

output = np.dot(weights, inputs) + biases
print(output)