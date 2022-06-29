import pandas as pd

#Output gff only from specific scaffolds.

m_names=('seqname','source','feature','start','end', 'score','strand','frame','Names')
repeat_gff=pd.read_csv("repeats2.gff", names=m_names, sep="\t")
repeat_gff


data = ["NC_051307.1", "NC_051308.1", "NC_051309.1", "NC_051310.1",
        "NC_051311.1", "NC_051312.1", "NC_051313.1", "NC_051314.1",
        "NC_051315.1", "NC_051316.1", "NC_051317.1", "NC_051318.1",
        "NC_051319.1", "NC_051320.1", "NC_051321.1", "NC_051322.1",
        "NC_051323.1", "NC_051324.1", "NC_051325.1", "NC_051326.1",
        "NC_051327.1", "NC_051328.1", "NC_051329.1", "NC_051330.1",
        "NC_051331.1", "NC_051332.1", "NC_051333.1", "NC_051334.1",
        "NC_051335.1"]
df = pd.DataFrame(data, columns=['seqname'])

df_maingff = pd.merge(repeat_gff, df, on = 'seqname')
df_maingff.to_csv("mainChromo_repeats.gff", sep="\t", index=False,  header=None)
