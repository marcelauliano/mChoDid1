import pandas as pd
import os
import numpy as np
from Bio import SeqIO
import argparse
parser= argparse.ArgumentParser(add_help=False)
parser.add_argument("-h", "--help", action="help", default=argparse.SUPPRESS, help= "oi!!")
parser.add_argument("-f", help= "-f: Orthogroups.txt file", required = "True")
parser.add_argument("-i", help= "-i: Id of the orthogroup of interest", required = "True")

args = parser.parse_args()

#Open the orthogroups.txt file of interest
my_names=['orthogroup', 'proteins']
orthogroups=pd.read_csv(args.f, sep=":", names=my_names)


orti = orthogroups[orthogroups["orthogroup"] == args.i]
orti1 =orti[['proteins']]

orti1.to_csv("splitting.txt", header=None, index=False)

lista=[]
with open("splitting.txt") as new_listo:
    line = new_listo.readlines()
    for l in line:
        names=l.split(" ")
        for n in names:
            lista.append(n.rstrip("\n"))
            
            
df_oldids=pd.DataFrame(lista, columns =['sample'])            
df_oldids['sample'].str.replace('', '')
df_oldids['sample'].replace('', np.nan, inplace=True)
df_oldids.dropna(subset=['sample'], inplace=True)
df_oldids['replace1']=df_oldids['sample'].str.replace('(.*XP_)','')
df_oldids['replace+both']=df_oldids['replace1'].str.replace('(.*NP_)','')
df_oldids['replace+both'].to_csv(f"{args.i}.ids", header=None, index=False)
            

print("all done")
os.remove("splitting.txt")
