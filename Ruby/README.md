# Simple Neuron Simulation in Ruby

This project demonstrates the workings of a single-layer neural network using Ruby. The script calculates the output of a neuron based on inputs, weights, and a bias, providing a basic introduction to how neurons operate in artificial neural networks.

## Creating Our First Neuron

### What is a Neuron?

Artificial neurons are the building blocks of artificial neural networks (ANNs) and are used to process and transmit information in machine learning and deep learning models.

### Let's Learn About Components of a Neuron

- **Inputs**: Imagine you have a bunch of friends, and each friend gives you a number. These numbers represent information or data. These are the "inputs" to our neuron.
  
- **Weights**: Each friend's opinion might matter to you more or less depending on how much you trust them. You assign a "weight" to each friend's input. If you trust a friend a lot, their input has a higher weight; if you trust them less, their input has a lower weight.
  
- **Bias**: You also have a personal bias. It’s like your own opinion or mood on that day.

### How Does a Neuron Work?

1. **Step 1**: Take each friend's number, multiply it by their respective weight, and then add up all these weighted numbers. This is like considering each friend's opinion but giving more importance to the ones you trust more.
   
2. **Step 2**: Add a bias to the sum of the weighted numbers. This bias can make you more or less likely to accept the combined input from your friends.
   
3. **Step 3**: If the combined input (sum of weighted numbers plus bias) is above a certain threshold, you decide to take some action (like going to a party). If it’s below the threshold, you decide not to take that action.

## Project Structure

- **neural_network.rb**: The main Ruby script that simulates a neuron’s output calculation.
- **Inputs**: Sample inputs representing incoming data.
- **Weights**: Random weights for the neuron.
- **Bias**: A fixed bias, set to a random value in this example.

## Prerequisites

This script requires Ruby to be installed on your system. To install Ruby, follow the instructions on [ruby-lang.org](https://www.ruby-lang.org/en/downloads/).

## How to Run the Script

### Step 1: Clone the Repository
```bash
git clone https://github.com/extinctsion/neuralNetworkScratch
cd neuralNetworkScratch
```
### Step 2: Run the Script
```bash
ruby neuralNetwork0.rb
```
### Expected Output
The script will output the weights, bias, and the results for the neuron in the form:
![image](https://github.com/user-attachments/assets/ce273cea-5082-4ceb-9ac7-ad48ad03bcd8)
Each output is the weighted sum of inputs with an added bias.


### Notes:
- Adjust the repository URL in the cloning steps and any paths as necessary to match your actual project structure.
- The output example is illustrative; you can modify it based on your specific implementation details.





