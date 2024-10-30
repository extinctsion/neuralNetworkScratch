# Simple Neuron Simulation in Bash

This project demonstrates the workings of a single-layer neural network using a Bash script. The script calculates the output of three neurons based on inputs, weights, and biases, providing a basic introduction to how neurons operate in artificial neural networks.

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

- **neural_network.sh**: The main Bash script that simulates a neuron’s output calculation.
- **Inputs**: Sample inputs representing incoming data.
- **Weights**: Random weights for each neuron.
- **Bias**: A fixed bias, set to zero in this example.

## Prerequisites

This script requires `bc`, a command-line calculator, for precise floating-point calculations. To install it, run the following:

```bash
sudo apt update && sudo apt install bc -y
```
# How to Run the Script

## Step 1: Clone the Repository
```bash
git clone https://github.com/extinctsion/neuralNetworkScratch
cd neuralNetworkScratch
```
## Step 2: Make the Script Executable
```bash
chmod +x neural_network.sh
```
## Step 3: Run the Script
```bash
./neural_network.sh
```
## Running on Windows
If you’re on Windows, you can run this script using:- 
- **WSL (Windows Subsystem for Linux):** Install WSL and run this script in the Linux terminal.
- **Git Bash:** Install Git for Windows and use Git Bash to run the script.
- **Cygwin:** Install Cygwin with the bc package, then run the script in Cygwin Terminal.## Expected OutputThe script will output the results for three neurons in the form:```

# Expected Output

![Output](https://github.com/user-attachments/assets/4f71c10f-5411-453b-89ae-ab3d789a8f5e)

Each output is the weighted sum of inputs with an added bias.

