"""
This module checks versions of essential libraries and prints them.
"""

import sys
import math
import numpy as np
import matplotlib
import nnfs

if __name__ == "__main__":
    print("Python:", sys.version)
    print("Numpy:", np.__version__)
    print("Matplotlib:", matplotlib.__version__)
    print(__name__, type(__name__))
    print("nnfs =", nnfs.__version__)
