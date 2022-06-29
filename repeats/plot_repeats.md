# 1. Editing the .gff output from RepeatMasker.

```
sed s'/##sequence-region.*//g' repeast.gff > repeats1.gff
#then remove empty lines
sed '/^$/d' repeats1.gff > repeats2.gff
```

Then run [filter_repeats_gff.py](https://github.com/marcelauliano/mChoDid1/blob/main/repeats/filter_repeats_gff.py) to get the filtered gff for the maio chromossomes 


Then include the following as header

```
##gff-version 3
#!gff-spec-version 1.21
#!processor NCBI annotwriter
#!genome-build mChoDid1.pri
#!genome-build-accession NCBI_Assembly:GCF_015220235.1
#!annotation-source NCBI Choloepus didactylus Annotation Release 100
##sequence-region NC_051307.1 1 250664781
##sequence-region NC_051308.1 1 248084734
##sequence-region NC_051309.1 1 223233325
##sequence-region NC_051310.1 1 196373313
##sequence-region NC_051311.1 1 168700187
##sequence-region NC_051312.1 1 156663619
##sequence-region NC_051313.1 1 156022981
##sequence-region NC_051314.1 1 146178362
##sequence-region NC_051315.1 1 135328281
##sequence-region NC_051316.1 1 132469143
##sequence-region NC_051317.1 1 90811022
##sequence-region NC_051318.1 1 102976318
##sequence-region NC_051319.1 1 100229138
##sequence-region NC_051320.1 1 100080887
##sequence-region NC_051321.1 1 89644403
##sequence-region NC_051322.1 1 86887137
##sequence-region NC_051323.1 1 78810110
##sequence-region NC_051324.1 1 77031504
##sequence-region NC_051325.1 1 66415491
##sequence-region NC_051326.1 1 64556003
##sequence-region NC_051327.1 1 53136999
##sequence-region NC_051328.1 1 44682675
##sequence-region NC_051329.1 1 32044896
##sequence-region NC_051330.1 1 25766288
##sequence-region NC_051331.1 1 10490878
##sequence-region NC_051332.1 1 17351548
##sequence-region NC_051333.1 1 26625015
##sequence-region NC_051334.1 1 193839925
##sequence-region NC_051335.1 1 55058534
```

## 1.1. Then plot all the repeats in the main chromossomes with default windowsize with this [R code](/repeats/all_repeats_default.R)

All repeats with default window size

![](/repeats/all-repeats-default5.png)
