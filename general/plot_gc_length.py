from Bio.SeqUtils import GC
import sys
from Bio import SeqIO
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

input_fasta = sys.argv[1]
out=open("GCF_015220235.1_mChoDid1.pri_genomic.gc.length", "w")

for sequence in SeqIO.parse(input_fasta, 'fasta'):
  id = sequence.id
  length = len(sequence)
  gc = GC(sequence.seq)
  resul = id + ',' + str(length) + ',' + str(gc) + '\n'
  out.write(resul)
out.close()


my_names = ['name', 'length', 'GC']
my_types = {'name':'string',  'lenght':'string', 'GC':'float64'}

con = pd.read_csv("GCF_015220235.1_mChoDid1.pri_genomic.gc.length", sep=",", names=my_names, dtype=my_types)


g = sns.relplot(data=con[con["length"] > 10490877], x="GC", y="length")
plt.title("Choloepus didactulys - GC content vs chromosome length", pad=20)

plt.savefig('CD-GC-length.png', dpi=1000, bbox_inches='tight')
