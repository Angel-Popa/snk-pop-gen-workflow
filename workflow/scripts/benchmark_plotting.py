
# Joing Benchmark files for plotting:

import pandas as pd
import glob
import os
import matplotlib.pyplot as plt

# collect the files:
files = os.path.join("benchmark/trimmomatic_pe", "*.tsv")

# return list of merged files
files = glob.glob(files)

print("CSV file")
df = pd.concat(map(pd.read_table, files), ignore_index=True)

fig1, ax1 = plt.subplots()
ax1.set_title("Basic Plot")
ax1.boxplot(df_meantime)

fig1.savefig("test.png")

