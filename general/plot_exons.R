gff.file <-("GCF_015220235.1_mChoDid1.pri_genomic.gff")
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
genes <- features[features$type=="gene"]

pp <- getDefaultPlotParams(plot.type=2)
pp$data1outmargin <- 100
pp$data2outmargin <- 100
pp$topmargin <- 450
kp <- plotKaryotype(genome=PvP01.genome, ideogram.plotter = NULL, plot.type=2, plot.params = pp)
kpAddCytobandsAsLine(kp)
## change tittle for other features
kpAddMainTitle(kp, "Choloepus didactylus - genes", cex=2)
## change data for other features 
kpPlotRegions(kp, data=genes[strand(genes)=="+"], avoid.overlapping = FALSE, col="deepskyblue")
kpPlotRegions(kp, data=genes[strand(genes)=="-"], avoid.overlapping = FALSE, col="gold", data.panel=2)
kpAddLabels(kp, "strand +", cex=0.8, col="#888888")
kpAddLabels(kp, "strand -", data.panel=2, cex=0.8, col="#888888")
