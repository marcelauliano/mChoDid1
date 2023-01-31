gff.file <-("/Users/mu2/sloth-analysis-paper/general_features/longest/chlo.longest.gff")
header.lines <- readLines(gff.file, n = 35)
#The lines with the standard chromosomes start with "##sequence-region".
#Select them.
ll <- header.lines[grepl(header.lines, pattern = "##sequence-region")]
#split them by space, and create a data.frame
gg <- data.frame(do.call(rbind, strsplit(ll, split = " ")))
gg[,3] <- as.numeric(as.character(gg[,3]))
gg[,4] <- as.numeric(as.character(gg[,4]))
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
