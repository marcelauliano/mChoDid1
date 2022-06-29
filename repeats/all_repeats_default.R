library(karyoploteR)


#Open the device
png("all-repeats-default.png", width = 1000, height = 700)

gff.file <-("mainChromo_repeats.gff")
header.lines <- readLines(gff.file, n = 35)
ll <- header.lines[grepl(header.lines, pattern = "##sequence-region")]
gg <- data.frame(do.call(rbind, strsplit(ll, split = " ")))
gg[,3] <- as.numeric(as.character(gg[,3]))
gg[,4] <- as.numeric(as.character(gg[,4]))
PvP01.genome <- toGRanges(gg[,c(2,3,4)])
kp <- plotKaryotype(genome=PvP01.genome)

 
library(rtracklayer)
features <- import(gff.file)
allreps <- features[features$type=="dispersed_repeat"]
kpPlotDensity(kp, data=allreps)

dev.off()
