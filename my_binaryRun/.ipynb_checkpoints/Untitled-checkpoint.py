# ---
# jupyter:
#   jupytext:
#     formats: py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.16.1
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %%
# here is a test


# %%
fname = 'large_initial_grid_parameters.txt'
data = np.loadtxt(fname, skiprows=1, delimiter=',')

# %%
data

# %%
with open('grid.txt', 'w') as f:
    for entry in data:
        newline = ' --initial-mass-1 {} --initial-mass-2 {} --orbital-period {} \n'.format(*entry)
        f.write(newline)

# %%
