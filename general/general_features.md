Plotting general genome features

## 1. Plot GC per chromosome

```
python /general/plot_gc_length.py GCF_015220235.1_mChoDid1.pri_genomic.fna

```


![](/general/CD-GC-lengthsm.png)


## 2.Assembled Karyotype

``` 
Rscript plot_karyotype.R
```

![](/general/karyotype.jpg) 


## 3. Plot features for gff 

Following [this tutorial](https://bernatgel.github.io/karyoploter_tutorial//Examples/PVivaxGenes/PVivaxGenes.html)

### 3.1 Genes

``` 
Rscript plot_exons.R
```

![](/general/CD-genes.png)


### 3.2 Pseudogenes

Change lines on R script to plot pseudogenes

![](/general/Cd-pseudogenes.png)
