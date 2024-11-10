# Neural Network Implementations from Scratch in Multiple Languages

This repository contains implementations of neural networks written from scratch in various programming languages. Each implementation follows a basic feedforward architecture with backpropagation, with variations in syntax and implementation details specific to each language.

## Languages Covered
- **Bash**: An unconventional approach to neural networks, showcasing how basic shell scripting can be extended to perform mathematical operations.
- **C**: A low-level, high-performance implementation leveraging direct hardware access and manual memory management for efficiency.
- **C#**: A high-level implementation using the .NET framework's features to build a neural network efficiently.
- **C++**: A low-level, memory-optimized implementation, emphasizing performance and manual memory management.
- **Java**: A robust and scalable implementation, leveraging Java's object-oriented features.
- **JavaScript**: A neural network running in the browser or Node.js, demonstrating neural computations in a web-friendly environment.
- **Python**: A clear, easy-to-understand implementation leveraging Python’s simplicity and flexibility.
- **Ruby**: A Ruby-style implementation showcasing the elegance and readability of the language.
- **Rust**: A memory-safe, highly performant implementation utilizing Rust's unique ownership system.
- **Julia**: Julia simplifies neural network implementation with high-level syntax, optimized libraries, and seamless GPU integration.

## Features
- **Feedforward Neural Networks**: Basic multi-layer perceptron models with fully connected layers.
- **Backpropagation**: Implemented for training the networks using gradient descent.
- **Customization**: Each language provides its own method of modifying network architecture, hyperparameters, and training options.
- **Simple Math Library**: In each language, basic math operations like matrix multiplication and activation functions are implemented from scratch to avoid reliance on external libraries.

## Structure
Each folder corresponds to a specific language. Inside each folder, you'll find:
- The source code for the neural network.
- A brief explanation of how to run the code.
- Example datasets used (if applicable).

## Getting Started

### Prerequisites
Ensure you have the appropriate environment set up for each language:
- **Bash**: Works on any Unix-based shell (e.g., Linux, macOS).
- **C#**: Requires .NET SDK (v5.0 or above).
- **C++**: Requires a C++ compiler (e.g., g++, clang).
- **Java**: Requires JDK (v8 or above).
- **JavaScript**: Node.js for server-side, or a modern web browser.
- **Python**: Python 3.x.
- **Ruby**: Ruby (v2.6 or above).
- **Rust**: Requires the Rust toolchain (`cargo`).
- **Julia**: Requires Julia to be downloaded from Microsoft Store or its official website.

### Running the Neural Networks
For each language, navigate to the corresponding folder and follow the instructions in the `README.md` file present in each directory.

Example for Python:
```bash
cd python
python neural_network.py
```

Example for C++:
```
cd cpp
g++ neural_network.cpp -o neural_network
./neural_network
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.