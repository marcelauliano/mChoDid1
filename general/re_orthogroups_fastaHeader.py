import pandas as pd
from Bio import SeqIO
import argparse
import re
parser= argparse.ArgumentParser(add_help=False)
parser.add_argument("-h", "--help", action="help", default=argparse.SUPPRESS, help= "")
parser.add_argument("-n", help= "-n:renamed fasta", required = "True")
parser.add_argument("-f", help= "-f:orthogroup fasta to be remaned", required = "True")

args = parser.parse_args()

original_file = args.f
corrected_file = args.n

with open(original_file) as original, open(corrected_file, 'w') as corrected:
	records = SeqIO.parse(original_file, 'fasta')
	for record in records:
		record.id=re.split("XP_|NP_", record.id)[1]
		record.description = ''
		SeqIO.write(record, corrected, 'fasta')
