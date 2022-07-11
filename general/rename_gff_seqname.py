import pandas as pd
from Bio import SeqIO
import argparse
parser= argparse.ArgumentParser(add_help=False)
parser.add_argument("-h", "--help", action="help", default=argparse.SUPPRESS, help= "Replace the seqname by value in key of a dictionary")
parser.add_argument("-d", help= "-d: two column file tab separeted to become a dict", required = "True")
parser.add_argument("-g", help= "-g: gff file", required = "True")
parser.add_argument("-o", help= "-o: new gff output file", required = "True")

args = parser.parse_args()

my_names = ['old_id', 'new_id']
df = pd.read_csv(args.d, sep="\t", names=my_names, dtype={'old_id':'string'})
name_IDs=df.set_index('old_id')['new_id'].to_dict()

m_names=('seqname','source','feature','start','end', 'score','strand','frame','Names')
mytypes={'start':'Int64', 'end':'Int64'}
df4=pd.read_csv(args.g, dtype=mytypes, names=m_names, sep="\t", skiprows=35)


df4['seqname'] = df4['seqname'].replace(name_IDs, regex=True)

df4.to_csv(args.o, index=False, header=None, sep="\t")
