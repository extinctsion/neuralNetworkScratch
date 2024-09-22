from requirement import *

nnfs.init()
#normalising the values with using numpy library
# now using numpy
layer_outputs = [4.8, 1.21, 2.385]

E = math.e

exp_values = np.exp(layer_outputs)

print(exp_values)

norm_values = exp_values / np.sum(exp_values)

print(norm_values)
print(sum(norm_values))