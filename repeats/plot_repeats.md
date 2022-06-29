# 1. Editing the .gff output from RepeatMasker.

```
sed s'/##sequence-region.*//g' repeast.gff > repeats1.gff
#then remove empty lines
sed '/^$/d' repeats1.gff > repeats2.gff
```

Then run https://github.com/marcelauliano/mChoDid1/blob/main/repeats/filter_repeats_gff.py to get the filtered gff for the maio chromossomes 
