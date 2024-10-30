# Simple Neural Network in Ruby

class Neuron
  attr_accessor :weights, :bias

  def initialize(input_size)
    @weights = Array.new(input_size) { rand } # Random weights
    @bias = rand # Random bias
  end

  def feedforward(inputs)
    # Calculate the weighted sum of inputs plus the bias
    weighted_sum = inputs.each_with_index.map { |input, index| input * @weights[index] }.sum
    output = weighted_sum + @bias
    output
  end

  def display_weights_and_bias
    puts "Weights: #{@weights.inspect}, Bias: #{@bias}"
  end
end

# Initialize inputs
inputs = [1.0, 2.0, 3.0, 2.5]

# Create a neuron
neuron = Neuron.new(inputs.size)

# Display the weights and bias
neuron.display_weights_and_bias

# Calculate the output
output = neuron.feedforward(inputs)

# Print the output
puts "The output is: #{output.round(4)}"
