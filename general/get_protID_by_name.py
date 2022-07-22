import pandas as pd
from Bio import SeqIO
import argparse
parser= argparse.ArgumentParser(add_help=False)
parser.add_argument("-h", "--help", action="help", default=argparse.SUPPRESS, help= "get all prot IDs by searching for a gene name in a list. This uses '/Users/mu2/Google Drive/My Drive/sloth_paper/metabolic_genes/dev/mChoDid1.prot.tab.ids'")
parser.add_argument("-l", help= "-l:list", required = "True")
parser.add_argument("-i", help= "-i:file on the format of mChoDid1.prot.tab.ids", required = "True")

args = parser.parse_args()

list_of_genes =[]
with open(args.l) as f:
    for l in f:
        list_of_genes.append(l.rstrip("\n"))

for g in list_of_genes:
    m=['id', 'all']
    ids_tabbed=pd.read_csv(args.i,  sep="\t", names=m)
    df5 = ids_tabbed[ids_tabbed['all'].str.contains(g, na=False)]
    df5.to_csv(f"{g.replace(' ', '_')}.csv", index=False, header=None, sep="\t")
