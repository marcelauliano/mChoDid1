gff.file <-("GenEra.gff")
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


pp <- getDefaultPlotParams(plot.type=2)
pp$data1outmargin <- 100
pp$data2outmargin <- 100
pp$topmargin <- 450
kp <- plotKaryotype(genome=PvP01.genome, ideogram.plotter = NULL, plot.type=2, plot.params = pp)
kpAddCytobandsAsLine(kp)
## change tittle for other features
kpAddMainTitle(kp, "Choloepus didactylus - GenEra", cex=2)
## change data for other features 
kpPlotRegions(kp, data=genes, avoid.overlapping = FALSE, col="deepskyblue")



cds1 <- features[features$type=="CDS1"]
kpPlotRegions(kp, data=cds1, avoid.overlapping = FALSE, col="green", data.panel=1)
xena <- features[features$type=="XENA"]
kpPlotRegions(kp, data=xena, avoid.overlapping = FALSE, col="lightblue", data.panel=1)
theria <- features[features$type=="THERIA"]
kpPlotRegions(kp, data=xena, avoid.overlapping = FALSE, col="darkblue", data.panel=1)

mama <- features[features$type=="MAMA"]
kpPlotRegions(kp, data=mama, avoid.overlapping = FALSE, col="purple", data.panel=1)
ami <- features[features$type=="AMI"]
kpPlotRegions(kp, data=ami, avoid.overlapping = FALSE, col="yellow", data.panel=2)
tetra <- features[features$type=="TETRA"]
kpPlotRegions(kp, data=tetra, avoid.overlapping = FALSE, col="gold", data.panel=2)

dipno <- features[features$type=="Dipno"]
kpPlotRegions(kp, data=dipno, avoid.overlapping = FALSE, col="grey", data.panel=2)

sarco <- features[features$type=="Sarco"]
kpPlotRegions(kp, data=tetra, avoid.overlapping = FALSE, col="black", data.panel=2)

euteleo <- features[features$type=="Euteleo"]
kpPlotRegions(kp, data=euteleo, avoid.overlapping = FALSE, col="red", data.panel=2)

gna <- features[features$type=="Gna"]
kpPlotRegions(kp, data=gna, avoid.overlapping = FALSE, col="pink", data.panel=2)

vert <- features[features$type=="Vert"]
kpPlotRegions(kp, data=vert, avoid.overlapping = FALSE, col="darkgreen", data.panel=2)

cord <- features[features$type=="Cord"]
kpPlotRegions(kp, data=cord, avoid.overlapping = FALSE, col="black", data.panel=2)

deut <- features[features$type=="Deut"]
kpPlotRegions(kp, data=deut, avoid.overlapping = FALSE, col="black", data.panel=2)

bila <- features[features$type=="Bila"]
kpPlotRegions(kp, data=bila, avoid.overlapping = FALSE, col="black", data.panel=2)

eumeta <- features[features$type=="Eumeta"]
kpPlotRegions(kp, data=eumeta, avoid.overlapping = FALSE, col="black", data.panel=2)

metaz <- features[features$type=="Metaz"]
kpPlotRegions(kp, data=metaz, avoid.overlapping = FALSE, col="black", data.panel=2)

opis <- features[features$type=="Opis"]
kpPlotRegions(kp, data=opis, avoid.overlapping = FALSE, col="black", data.panel=2)

euk <- features[features$type=="Euk"]
kpPlotRegions(kp, data=euk, avoid.overlapping = FALSE, col="black", data.panel=2)

celu <- features[features$type=="celu"]
kpPlotRegions(kp, data=celu, avoid.overlapping = FALSE, col="black", data.panel=2)
