
library(karyoploteR)
gff.file <-("/Users/mu2/Google Drive/My Drive/sloth_paper/sloth-analysis-paper/repeats/Earlgrey/test/2.gff")
header.lines <- readLines(gff.file, n = 29)
ll <- header.lines[grepl(header.lines, pattern = "##sequence-region")]
gg <- data.frame(do.call(rbind, strsplit(ll, split = " ")))
gg[,3] <- as.numeric(as.character(gg[,3]))
gg[,4] <- as.numeric(as.character(gg[,4]))
PvP01.genome <- toGRanges(gg[,c(2,3,4)])
kp <- plotKaryotype(plot.type=2,genome=PvP01.genome, )

 library(rtracklayer)
features <- import(gff.file)
line <- features[features$type=="LINE"]
retrocopies <- features[features$type=="gene"]
ltr <- features[features$type=="LTR"]

kpPlotDensity(kp, data = retrocopies, )
#kpAddLabels(kp, labels = "retrocopies", cex=1.6)
kpPlotDensity(kp, data = line, data.panel = 2, r0=0, r1=0.3, col="green")
#kpAddLabels(kp, r0=0, r1=0.3, labels = "LINEs", cex=1.6)
#kpAddLabels(kp, labels = "retrocopies", cex=1.6)
kpPlotDensity(kp, data = ltr, data.panel = 2, r0=0.33, r1=0.63, col="blue")
