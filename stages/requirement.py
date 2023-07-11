import sys
import numpy as np
import matplotlib

if __name__ == "__main__":
    print("Python: ", sys.version)
    print("Numpy: ", np.__version__)
    print("Matplotlib: ", matplotlib.__version__)
    print(__name__,type(__name__))