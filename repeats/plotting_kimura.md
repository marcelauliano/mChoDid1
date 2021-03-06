## 1. Run repeatmasker.

```
RepeatMasker -a -xsmall -gccalc -lib both.fa assembly.fa -dir output
```

## 2. Run calcDivergenceFromAlign.pl

```
perl calcDivergenceFromAlign.pl -s sumary assembly.align
```

## 3. Get last 72 lines of the sumary file

tail -n 72 sumary > plot.txt

### 4. Plot with [R code](/repeats/plot_kimura.R) from [Kristina Gagalova](https://github.com/KristinaGagalova) 


### LINES

The most abundant, young and likely to be active

cat plot.txt | awk '{print$1" "$30" "$31" "$32" "$33" "$34" "$35" "$36" "$37" "$38" "$39" "$40}' > LINE.plot.txt

![](/repeats/mChoDid1-LINEs.png)


### SINES

cat plot.txt | awk '{print$1" "$60" "$61" "$62" "$63" "$64" "$65" "$66" "$67" "$68" "$69" "$70" "$71" "$72" "$73" "$74" "$75" "$76" "$77" "$78" "$79" "$80}' > sines.plot.txt

Oldest elements


![](/repeats/sines.png)


## LINES + SINES 

![](/repeats/lines-sines.png)

### All repeats (including unkonws) 

![](/repeats/all.jpg) 
