using Random
using LinearAlgebra
using Printf
using Statistics

# Activation functions and their derivatives
module Activations
    tanh_prime(x) = 1 .- tanh.(x).^2
    
    function softmax(x)
        exp_x = exp.(x .- maximum(x))
        return exp_x ./ sum(exp_x)
    end
    
    function sigmoid(x)
        return 1 ./ (1 .+ exp.(-x))
    end
    
    sigmoid_prime(x) = sigmoid(x) .* (1 .- sigmoid(x))
end

# LSTM Cell Structure
mutable struct LSTMCell
    # Weight matrices
    Wf::Matrix{Float64}  # Forget gate
    Wi::Matrix{Float64}  # Input gate
    Wc::Matrix{Float64}  # Cell state
    Wo::Matrix{Float64}  # Output gate
    
    # Bias vectors
    bf::Vector{Float64}
    bi::Vector{Float64}
    bc::Vector{Float64}
    bo::Vector{Float64}
    
    # Hidden state and cell state
    hidden_size::Int
    
    function LSTMCell(input_size::Int, hidden_size::Int)
        # Initialize weights with Xavier/Glorot initialization
        scale = sqrt(2.0 / (input_size + hidden_size))
        
        # Initialize all weights and biases
        Wf = randn(hidden_size, input_size + hidden_size) .* scale
        Wi = randn(hidden_size, input_size + hidden_size) .* scale
        Wc = randn(hidden_size, input_size + hidden_size) .* scale
        Wo = randn(hidden_size, input_size + hidden_size) .* scale
        
        # Initialize biases to zeros
        bf = zeros(hidden_size)
        bi = zeros(hidden_size)
        bc = zeros(hidden_size)
        bo = zeros(hidden_size)
        
        new(Wf, Wi, Wc, Wo, bf, bi, bc, bo, hidden_size)
    end
end

# Forward pass for LSTM cell
function forward_lstm(cell::LSTMCell, x::Vector{Float64}, 
                     prev_h::Vector{Float64}, prev_c::Vector{Float64})
    # Concatenate input and previous hidden state
    concat_input = vcat(x, prev_h)
    
    # Compute gates
    forget_gate = Activations.sigmoid(cell.Wf * concat_input .+ cell.bf)
    input_gate = Activations.sigmoid(cell.Wi * concat_input .+ cell.bi)
    cell_candidate = tanh.(cell.Wc * concat_input .+ cell.bc)
    output_gate = Activations.sigmoid(cell.Wo * concat_input .+ cell.bo)
    
    # Update cell state
    cell_state = forget_gate .* prev_c .+ input_gate .* cell_candidate
    
    # Compute hidden state
    hidden_state = output_gate .* tanh.(cell_state)
    
    return hidden_state, cell_state, (forget_gate, input_gate, cell_candidate, output_gate)
end

# RNN structure
mutable struct RNN
    input_size::Int
    hidden_size::Int
    output_size::Int
    cell::LSTMCell
    Why::Matrix{Float64}  # Hidden to output weights
    by::Vector{Float64}   # Output bias
    learning_rate::Float64
    
    function RNN(input_size::Int, hidden_size::Int, output_size::Int, learning_rate::Float64=0.01)
        cell = LSTMCell(input_size, hidden_size)
        
        # Initialize output layer weights
        scale = sqrt(2.0 / (hidden_size + output_size))
        Why = randn(output_size, hidden_size) .* scale
        by = zeros(output_size)
        
        new(input_size, hidden_size, output_size, cell, Why, by, learning_rate)
    end
end

# Forward pass for the entire sequence
function forward(rnn::RNN, inputs::Vector{Vector{Float64}})
    # Initialize states
    h = zeros(rnn.hidden_size)
    c = zeros(rnn.hidden_size)
    
    # Store all states and outputs
    hidden_states = Vector{Vector{Float64}}()
    cell_states = Vector{Vector{Float64}}()
    outputs = Vector{Vector{Float64}}()
    gate_values = Vector{Tuple}()
    
    # Process each input in sequence
    for x in inputs
        # LSTM forward pass
        h, c, gates = forward_lstm(rnn.cell, x, h, c)
        
        # Compute output
        output = rnn.Why * h .+ rnn.by
        output = Activations.softmax(output)
        
        # Store states and outputs
        push!(hidden_states, copy(h))
        push!(cell_states, copy(c))
        push!(outputs, copy(output))
        push!(gate_values, gates)
    end
    
    return outputs, hidden_states, cell_states, gate_values
end

# Backward pass (BPTT - Backpropagation Through Time)
function backward(rnn::RNN, inputs::Vector{Vector{Float64}}, 
                 targets::Vector{Vector{Float64}},
                 outputs::Vector{Vector{Float64}},
                 hidden_states::Vector{Vector{Float64}},
                 cell_states::Vector{Vector{Float64}},
                 gate_values::Vector{Tuple})
    
    # Initialize gradients
    dWhy = zeros(size(rnn.Why))
    dby = zeros(size(rnn.by))
    
    dWf = zeros(size(rnn.cell.Wf))
    dWi = zeros(size(rnn.cell.Wi))
    dWc = zeros(size(rnn.cell.Wc))
    dWo = zeros(size(rnn.cell.Wo))
    
    dbf = zeros(size(rnn.cell.bf))
    dbi = zeros(size(rnn.cell.bi))
    dbc = zeros(size(rnn.cell.bc))
    dbo = zeros(size(rnn.cell.bo))
    
    # Initialize hidden state gradients
    dh_next = zeros(rnn.hidden_size)
    dc_next = zeros(rnn.hidden_size)
    
    total_loss = 0.0
    
    # Backward pass through time
    for t in reverse(1:length(inputs))
        # Compute loss and output gradient
        loss = -sum(targets[t] .* log.(outputs[t] .+ 1e-10))
        total_loss += loss
        
        dy = copy(outputs[t])
        dy[argmax(targets[t])] -= 1
        
        # Output layer gradients
        dWhy .+= dy * hidden_states[t]'
        dby .+= dy
        
        # Gradient for hidden state
        dh = rnn.Why' * dy .+ dh_next
        
        # Get stored gate values
        forget_gate, input_gate, cell_candidate, output_gate = gate_values[t]
        
        # Backpropagate through LSTM cell
        if t > 1
            prev_h = hidden_states[t-1]
            prev_c = cell_states[t-1]
        else
            prev_h = zeros(rnn.hidden_size)
            prev_c = zeros(rnn.hidden_size)
        end
        
        # TODO: Add detailed LSTM backpropagation steps here
        # This is a simplified version
        
        # Store gradients for next timestep
        dh_next = dh
        dc_next = dc_next .* forget_gate
    end
    
    # Clip gradients to prevent exploding gradients
    clip_value = 5.0
    gradients = (dWhy, dby, dWf, dWi, dWc, dWo, dbf, dbi, dbc, dbo)
    gradients = [clamp.(g, -clip_value, clip_value) for g in gradients]
    
    return gradients, total_loss
end

# Training function
function train!(rnn::RNN, sequences::Vector{Vector{Vector{Float64}}}, 
                targets::Vector{Vector{Vector{Float64}}}, 
                epochs::Int=100, verbose::Bool=true)
    
    for epoch in 1:epochs
        total_loss = 0.0
        
        for (seq_idx, sequence) in enumerate(sequences)
            # Forward pass
            outputs, hidden_states, cell_states, gate_values = forward(rnn, sequence)
            
            # Backward pass
            gradients, loss = backward(rnn, sequence, targets[seq_idx], 
                                     outputs, hidden_states, cell_states, gate_values)
            
            # Update parameters
            dWhy, dby, dWf, dWi, dWc, dWo, dbf, dbi, dbc, dbo = gradients
            
            rnn.Why .-= rnn.learning_rate .* dWhy
            rnn.by .-= rnn.learning_rate .* dby
            
            rnn.cell.Wf .-= rnn.learning_rate .* dWf
            rnn.cell.Wi .-= rnn.learning_rate .* dWi
            rnn.cell.Wc .-= rnn.learning_rate .* dWc
            rnn.cell.Wo .-= rnn.learning_rate .* dWo
            
            rnn.cell.bf .-= rnn.learning_rate .* dbf
            rnn.cell.bi .-= rnn.learning_rate .* dbi
            rnn.cell.bc .-= rnn.learning_rate .* dbc
            rnn.cell.bo .-= rnn.learning_rate .* dbo
            
            total_loss += loss
        end
        
        if verbose && epoch % 10 == 0
            avg_loss = total_loss / length(sequences)
            @printf("Epoch %d: average loss = %.4f\n", epoch, avg_loss)
        end
    end
end

# Prediction function
function predict(rnn::RNN, sequence::Vector{Vector{Float64}})
    outputs, _, _, _ = forward(rnn, sequence)
    return outputs
end

# Example usage
function example()
    # Create a simple sequence prediction problem
    input_size = 2
    hidden_size = 4
    output_size = 2
    
    # Create RNN
    rnn = RNN(input_size, hidden_size, output_size, 0.01)
    
    # Create sample sequences
    sequences = [
        [Float64[1, 0], Float64[0, 1], Float64[1, 0]],
        [Float64[0, 1], Float64[1, 0], Float64[0, 1]]
    ]
    
    # Create targets (shift sequences by 1)
    targets = [
        [Float64[0, 1], Float64[1, 0], Float64[0, 1]],
        [Float64[1, 0], Float64[0, 1], Float64[1, 0]]
    ]
    
    # Train network
    train!(rnn, sequences, targets, 100)
    
    # Test prediction
    test_seq = sequences[1]
    predictions = predict(rnn, test_seq)
    
    println("\nTest Predictions:")
    for (input, pred) in zip(test_seq, predictions)
        println("Input: ", input, " Predicted: ", pred)
    end
end

# Run example if called directly
if abspath(PROGRAM_FILE) == @__FILE__
    example()
end