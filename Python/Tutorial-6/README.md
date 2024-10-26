# Neural Network ReLU Activation Example
This repository provides a simple demonstration of applying a ReLU (Rectified Linear Unit) activation function in a neural network. The ReLU activation function is a common choice in hidden layers of neural networks, transforming inputs to ensure only non-negative values pass through.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
The script applies the ReLU activation function to a set of inputs. ReLU is defined as max(0, x), meaning it outputs the input directly if it's positive; otherwise, it outputs zero. This activation function is widely used for hidden layers in neural networks, helping introduce non-linearity without causing gradient vanishing issues.

## Requirements
Make sure all required packages are installed by running:
```bash
pip install -r requirement.py
```
## Code Explanation
This code defines a basic application of the ReLU function:
- Inputs: An example list of inputs, which may include both positive and negative numbers.
- ReLU Activation: Iterates through each input value, applying the max(0, x) operation to filter out negative values.
## Example Code
```python
from requirement import *

X = [
    [1, 2, 3, 2.5],
    [2.0, 5.0, -1.0, 2.0],
    [-1.5, 2.7, 3.3, -0.8]
]
inputs = [0, 2, -1, 3.3, -2.7, 1.1, 2.2, -100]
output = []
for i in inputs:
    output.append(max(0, i))
    
print(output)
```
## Usage
Clone this repository and run the script to observe the output after applying the ReLU function to the sample input values. The result will show only non-negative values.
```bash
python script.py
```
## Contributing
Contributions are welcome! Fork the repository and submit pull requests for improvements, new examples, or bug fixes.

## License
This project is open source under the MIT License. See the LICENSE file for more details.

