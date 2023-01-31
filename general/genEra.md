How to prepare the gff to plot genEra results

## 1. Subset

```
python subset_gff.py -g GCF_015220235.1_mChoDid1.pri_genomic.gff.copy -l chlo.27675_phylostrata_assignation.tsv1 -o CD_GCF_015220235.1_mChoDid1.pri_genomic.gff
```

## 2. Rename chromossomes

```
python rename_gff_seqname.py -d chrom.ids -g CD_GCF_015220235.1_mChoDid1.pri_genomic.gff -o CD_GCF_015220235.1_mChoDid1.pri_genomic.n.gff
```

## Include header bellow in the file

```
##gff-version 3
#!gff-spec-version 1.21
#!processor NCBI annotwriter
#!genome-build mChoDid1.pri
#!genome-build-accession NCBI_Assembly:GCF_015220235.1
#!annotation-source NCBI Choloepus didactylus Annotation Release 100
##sequence-region chr1 1 250664781
##sequence-region chr2 1 248084734
##sequence-region chr3 1 223233325
##sequence-region chr4 1 196373313
##sequence-region chr5 1 168700187
##sequence-region chr6 1 156663619
##sequence-region chr7 1 156022981
##sequence-region chr8 1 146178362
##sequence-region chr9 1 135328281
##sequence-region chr10 1 132469143
##sequence-region chr11 1 90811022
##sequence-region chr12 1 102976318
##sequence-region chr13 1 100229138
##sequence-region chr14 1 100080887
##sequence-region chr15 1 89644403
##sequence-region chr16 1 86887137
##sequence-region chr17 1 78810110
##sequence-region chr18 1 77031504
##sequence-region chr19 1 66415491
##sequence-region chr20 1 64556003
##sequence-region chr21 1 53136999
##sequence-region chr22 1 44682675
##sequence-region chr23 1 32044896
##sequence-region chr24 1 25766288
##sequence-region chr25 1 10490878
##sequence-region chr26 1 17351548
##sequence-region chr27 1 26625015
##sequence-region chrX 1 193839925
##sequence-region chrY 1 55058534
```

The plot the bellow in R

```
gff.file <-("/Users/mu2/sloth-analysis-paper/CD_GCF_015220235.1_mChoDid1.pri_genomic.n1.gff")
header.lines <- readLines(gff.file, n = 35)
#The lines with the standard chromosomes start with "##sequence-region".
#Select them.
ll <- header.lines[grepl(header.lines, pattern = "##sequence-region")]
#split them by space, and create a data.frame
gg <- data.frame(do.call(rbind, strsplit(ll, split = " ")))
gg[,3] <- as.numeric(as.character(gg[,3]))
gg[,4] <- as.numeric(as.character(gg[,4]))

#and create a GRanges with the information
PvP01.genome <- toGRanges(gg[,c(2,3,4)])

kp <- plotKaryotype(genome=PvP01.genome)

kp <- plotKaryotype(genome=PvP01.genome, ideogram.plotter = NULL)
kpAddCytobandsAsLine(kp)

library(rtracklayer)
features <- import(gff.file)

## chose genes or other features 
genes <- features[features$type=="CDS"]


pp <- getDefaultPlotParams(plot.type=4)
pp$data1outmargin <- 100
pp$data2outmargin <- 100
pp$topmargin <- 450
kp <- plotKaryotype(genome=PvP01.genome, ideogram.plotter = NULL, plot.type=2, plot.params = pp)
kpAddCytobandsAsLine(kp)
## change tittle for other features
kpAddMainTitle(kp, "Choloepus didactylus - GenEra", cex=2)
## change data for other features 
kpPlotRegions(kp, data=genes, avoid.overlapping = FALSE, col="deepskyblue")



cds1 <- features[features$type=="CD"]
kpPlotRegions(kp, data=cds1, avoid.overlapping = FALSE, col="brown", data.panel=1)
```


