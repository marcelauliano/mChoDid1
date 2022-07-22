import pandas as pd
from Bio import SeqIO
import argparse
parser= argparse.ArgumentParser(add_help=False)
parser.add_argument("-h", "--help", action="help", default=argparse.SUPPRESS, help= "get orthogroups for gene IDs you previously selected")
parser.add_argument("-ort", help= "-ort: Orthogroups.txt from orthofinder", required = "True")
parser.add_argument("-id", help= "-id: gene ids from get_protID_by_name.py", required = "True")
args = parser.parse_args()
list1 =[]
with open(args.id) as f:
    for l in f:
        list1.append(l.rstrip("\n"))
for it in list1:
    m1=['ortogroups', 'prots']
    orts=pd.read_csv(args.ort, sep=":", names=m1)
    df5=orts[orts['prots'].str.contains(it, na=False)]
    df5.to_csv(f"{it}.csv", index=False, header=None, sep="\t")
    df5[['ortogroups']].to_csv(f"{it}.Ort.csv", index=False, header=None)
print("all done")
