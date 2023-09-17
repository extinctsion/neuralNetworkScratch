'''In this tutorial we will be learning about how a neuron work'''

"""
    Our Neuron Will Consist :
    - A input vector of 3 dimension (you can choose any no. of dimension)
    - A weight vector of 3 dimension (you can choose any no. of dimension --> but it should be equal to the no. of inputs)
    - A bias (each neuron has only one bias)
"""


# weight vector 
inputs = [1.0, 2.0, 3.0, 2.5] 

#Initializing weight and bias to alter the output of a neuron
weights = [0.2,0.8,-0.5,1.0]
bias = 2


# calculate the sum of all the (input*corresponding_weights)
weighted_sum = sum([inputs[i] * weights[i] for i in range(len(inputs))])

# Add the bias
weighted_sum += bias

print(weighted_sum)

