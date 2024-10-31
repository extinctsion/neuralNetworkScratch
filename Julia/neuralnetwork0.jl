using Random
using LinearAlgebra
using Statistics
using Printf

# Activation functions and their derivatives
module Activations
    # ReLU activation
    relu(x) = max.(0, x)
    relu_prime(x) = float.(x .> 0)
    
    # Sigmoid activation
    sigmoid(x) = 1 ./ (1 .+ exp.(-x))
    sigmoid_prime(x) = sigmoid(x) .* (1 .- sigmoid(x))
    
    # Softmax activation for output layer
    function softmax(x)
        exp_x = exp.(x .- maximum(x))
        exp_x ./ sum(exp_x)
    end
end

# Layer structure
mutable struct Layer
    weights::Matrix{Float64}
    biases::Vector{Float64}
    activation::Function
    activation_prime::Function
    
    # Constructor with Xavier initialization
    function Layer(input_size::Int, output_size::Int, activation::Function, activation_prime::Function)
        # Xavier/Glorot initialization
        scale = sqrt(2.0 / (input_size + output_size))
        weights = randn(output_size, input_size) .* scale
        biases = zeros(output_size)
        new(weights, biases, activation, activation_prime)
    end
end

# Neural Network structure
mutable struct NeuralNetwork
    layers::Vector{Layer}
    learning_rate::Float64
    
    # Constructor
    function NeuralNetwork(layer_sizes::Vector{Int}, learning_rate::Float64=0.01)
        layers = Layer[]
        
        # Create hidden layers with ReLU
        for i in 1:(length(layer_sizes)-2)
            push!(layers, Layer(
                layer_sizes[i],
                layer_sizes[i+1],
                Activations.relu,
                Activations.relu_prime
            ))
        end
        
        # Create output layer with Softmax
        push!(layers, Layer(
            layer_sizes[end-1],
            layer_sizes[end],
            Activations.softmax,
            Activations.sigmoid_prime  # Note: We use sigmoid_prime as an approximation
        ))
        
        new(layers, learning_rate)
    end
end

# Forward propagation
function forward(network::NeuralNetwork, input::Vector{Float64})
    # Store activations and pre-activations for backprop
    activations = [input]
    pre_activations = []
    
    current_input = input
    for layer in network.layers
        # Linear transformation
        z = layer.weights * current_input .+ layer.biases
        push!(pre_activations, z)
        
        # Apply activation function
        current_input = layer.activation(z)
        push!(activations, current_input)
    end
    
    return activations, pre_activations
end

# Backpropagation
function backward(network::NeuralNetwork, x::Vector{Float64}, y::Vector{Float64})
    activations, pre_activations = forward(network, x)
    
    # Initialize gradients
    weight_gradients = [zeros(size(layer.weights)) for layer in network.layers]
    bias_gradients = [zeros(size(layer.biases)) for layer in network.layers]
    
    # Calculate initial error (cross-entropy derivative for softmax)
    error = activations[end] - y
    
    # Backpropagate through layers
    for l in reverse(1:length(network.layers))
        # Calculate gradients
        weight_gradients[l] = error * activations[l]'
        bias_gradients[l] = error
        
        if l > 1
            # Propagate error to previous layer
            error = (network.layers[l].weights' * error) .*
                   network.layers[l-1].activation_prime(pre_activations[l-1])
        end
    end
    
    return weight_gradients, bias_gradients
end

# Update network parameters
function update_parameters!(network::NeuralNetwork, weight_gradients, bias_gradients)
    for (layer, w_grad, b_grad) in zip(network.layers, weight_gradients, bias_gradients)
        layer.weights .-= network.learning_rate .* w_grad
        layer.biases .-= network.learning_rate .* b_grad
    end
end

# Training function
function train!(network::NeuralNetwork, X::Matrix{Float64}, y::Matrix{Float64}, 
                epochs::Int=100, batch_size::Int=32, verbose::Bool=true)
    n_samples = size(X, 2)
    
    for epoch in 1:epochs
        # Shuffle training data
        shuffle_idx = Random.shuffle(1:n_samples)
        X_shuffled = X[:, shuffle_idx]
        y_shuffled = y[:, shuffle_idx]
        
        total_loss = 0.0
        
        # Mini-batch training
        for i in 1:batch_size:n_samples
            batch_end = min(i + batch_size - 1, n_samples)
            batch_X = X_shuffled[:, i:batch_end]
            batch_y = y_shuffled[:, i:batch_end]
            
            # Process each sample in batch
            for (x, y_true) in zip(eachcol(batch_X), eachcol(batch_y))
                # Forward and backward passes
                activations, _ = forward(network, x)
                weight_grads, bias_grads = backward(network, x, y_true)
                
                # Update parameters
                update_parameters!(network, weight_grads, bias_grads)
                
                # Calculate loss (cross-entropy)
                y_pred = activations[end]
                total_loss -= sum(y_true .* log.(y_pred .+ 1e-10))
            end
        end
        
        # Print progress
        if verbose && epoch % 10 == 0
            avg_loss = total_loss / n_samples
            @printf("Epoch %d: average loss = %.4f\n", epoch, avg_loss)
        end
    end
end

# Prediction function
function predict(network::NeuralNetwork, x::Vector{Float64})
    activations, _ = forward(network, x)
    return activations[end]
end

# Example usage
function example()
    # Create a simple network for XOR problem
    network = NeuralNetwork([2, 4, 2], 0.1)
    
    # XOR training data
    X = Float64[0 0 1 1;
                0 1 0 1]
    y = Float64[1 0 0 1;
                0 1 1 0]
    
    # Train network
    train!(network, X, y, 1000)
    
    # Test predictions
    for i in 1:4
        pred = predict(network, X[:, i])
        println("Input: ", X[:, i], " Output: ", pred, " True: ", y[:, i])
    end
end

# Run example if called directly
if abspath(PROGRAM_FILE) == @__FILE__
    example()
end