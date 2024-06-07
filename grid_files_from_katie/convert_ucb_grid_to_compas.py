import sys
import numpy as np

fname = sys.argv[1]
data = np.loadtxt(fname, skiprows=1, delimiter=',')

with open('comp_'+fname, 'w') as f:
    for entry in data:
        newline = ' --initial-mass-1 {} --initial-mass-2 {} --orbital-period {} \n'.format(*entry)
        f.write(newline)

