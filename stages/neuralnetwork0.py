# we will write a neural network from scratch.
# a neuron with 3 inputs, 3 biases and different weights.
# gitving 3 outputs.

inputs = [1.0, 2.0, 3.0, 2.5] #initialising inputs

#Initializing weight and bias to alter the output of the neural network
# weights initialisation
weights1 = [0.2,0.8,-0.5,1.0]
weights2 = [0.5, -0.91, 0.26, -0.5]
weights3 = [-0.26, -0.27, 0.17, 0.87]

#Biases initialization
bias1 = 2
bias2 = 3
bias3 = 0.5

# output = summation(input^i * weights^ij + bias)
output = [inputs[0]*weights1[0] + inputs[0]*weights1[0] + inputs[0]*weights1[0] + inputs[0]*weights1[0] + bias1 ,
          inputs[0]*weights2[0] + inputs[0]*weights2[0] + inputs[0]*weights2[0] + inputs[0]*weights2[0] + bias2 ,
          inputs[0]*weights3[0] + inputs[0]*weights3[0] + inputs[0]*weights3[0] + inputs[0]*weights3[0] + bias3]

print(output)

