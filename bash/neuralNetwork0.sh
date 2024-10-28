#!/bin/bash

# Random input values for a single layer (4 inputs)
inputs=(1.0 2.0 3.0 2.5)

# Generate random weights for each of the 3 neurons
weights1=($(for i in {1..4}; do echo "scale=4; $RANDOM/32767" | bc; done))
weights2=($(for i in {1..4}; do echo "scale=4; $RANDOM/32767" | bc; done))
weights3=($(for i in {1..4}; do echo "scale=4; $RANDOM/32767" | bc; done))

# Set biases to zero
bias1=0
bias2=0
bias3=0

# Function to calculate the output of a neuron
calculate_output() {
  local weights=("${!1}")
  local output=0
  for i in {0..3}; do
    output=$(echo "$output + (${inputs[i]} * ${weights[i]})" | bc -l)
  done
  output=$(echo "$output + $2" | bc -l)
  echo $output
}

# Calculate outputs for each neuron
output1=$(calculate_output weights1[@] $bias1)
output2=$(calculate_output weights2[@] $bias2)
output3=$(calculate_output weights3[@] $bias3)

# Display the final rounded outputs
echo "Output of Neuron 1: $(printf "%.4f" $output1)"
echo "Output of Neuron 2: $(printf "%.4f" $output2)"
echo "Output of Neuron 3: $(printf "%.4f" $output3)"
