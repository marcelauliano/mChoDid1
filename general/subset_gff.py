import pandas as pd
from Bio import SeqIO
import argparse
parser= argparse.ArgumentParser(add_help=False)
parser.add_argument("-h", "--help", action="help", default=argparse.SUPPRESS, help= "Get partial gff given a pattern on Names field")
parser.add_argument("-g", help= "-g: gff file", required = "True")
parser.add_argument("-l", help= "-l: list of patterns to search on Names gff field", required = "True")
parser.add_argument("-o", help= "-o: output file", required = "True")

args = parser.parse_args()

#make a list with the IDs
terms =[]
with open(args.l) as f:
    for l in f:
        terms.append(l.rstrip("\n"))

#open gff file
m_names=('seqname','source','feature','start','end', 'score','strand','frame','Names')
df4=pd.read_csv(args.g, names=m_names, sep="\t", skiprows=35)

#save partial gff file
df5 = df4[df4['Names'].str.contains('|'.join(terms), na=False)]
df5.to_csv(args.o, index=False, header=None, sep="\t")
